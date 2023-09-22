//
//  GalleryViewModel.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
import UIKit
import Combine

enum ViewState {
    case loading
    case loaded
    case error
}

class GalleryViewModel {
    let networkManager: Networkable
    lazy var images = HitArrays()
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    @Published var state = ViewState.loading

    func getImageGallery(searchTerm: String) async {
        if let cachedImages = getCachedImages(searchTerm: searchTerm) {
            images = cachedImages
            self.state = .loaded
            return
        }
        let networkRequest = NetworkRequest(baseUrl: Constants.baseURL, apiKey: Constants.apiKey,
                path: "", params: [Constants.imageType, Constants.quality, URLQueryItem(name: "q", value: searchTerm)],
                type: .GET, headers: [:])
        do {
            let result = try await networkManager.execute(networkRequest, modelType: Gallery.self)
            images = result.hits ?? []
            setCachedImages(hits: images, searchTerm: searchTerm)
            self.state = .loaded
        } catch {
            print(error.localizedDescription)
            self.state = .error
        }
    }

    func getCachedImages(searchTerm: String) -> HitArrays? {
        if let cachedResults = SearchResultCache.shared.getResults(searchTerm: searchTerm) {
            return cachedResults
        }
        return nil
    }

    func setCachedImages(hits: HitArrays, searchTerm: String) {
        SearchResultCache.shared.setResults(results: hits, searchTerm: searchTerm)
    }

    func getImage(url: URL) async -> UIImage? {
        if let cachedImage = ImageCache.shared.getImage(url: url.absoluteString) {
            return cachedImage
        } else {
            let loadedImage = await loadImageAsync(url: url)
            if let loadedImage = loadedImage {
                ImageCache.shared.setImage(image: loadedImage, url: url.absoluteString)
            }
            return loadedImage
        }
    }

    func loadImageAsync(url: URL) async -> UIImage? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                return image
            }
        } catch {
            print(error)
        }
        return nil
    }
}
