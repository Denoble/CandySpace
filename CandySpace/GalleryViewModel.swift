//
//  GalleryViewModel.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
import UIKit

class GalleryViewModel {
    let networkManager: NetworkManagerHelper
    lazy var images = HitArrays()
    init(networkManager: NetworkManagerHelper) {
        self.networkManager = networkManager
    }

    func getImageGallery(searchTerm: String) async {
        if let cachedImages = getCachedImages(searchTerm: searchTerm) {
            images = cachedImages
            return
        }
        guard let url = CandySpaceURL.getGalleryurl(searchTerm: searchTerm) else {
            return
        }
        do {
            let result = try await networkManager.get(url: url, responseType: Gallery.self)
            switch result {
            case .success(let res):
                images = res.hits ?? []
                setCachedImages(hits: images, searchTerm: searchTerm)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
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
    func getImage(url: URL) -> UIImage? {
        if let cachedImage = ImageCache.shared.getImage(url: url.absoluteString) {
            return cachedImage
        } else {
            let img = UIImageView()
            img.load(url: url)
            ImageCache.shared.setImage(image: img.image, url: url.absoluteString)
            return img.image
        }
    }
}
