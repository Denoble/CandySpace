//
//  GalleryViewModel.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case requestFailed
    // Add more error cases as needed
}

class GalleryViewModel {
    let networkManager: NetworkManagerHelper
    init(initNetworkManager: NetworkManagerHelper) {
        networkManager = initNetworkManager
    }

    func getImageGallery(searchParameter: String) async -> Result<Gallery, Error> {
        guard let url = CandySpaceURL.getGalleryurl(q: searchParameter) else {
            return .failure(NetworkError.invalidURL)
        }
        do {
            let gallery = try await networkManager.taskForGETRequest(url: url, responseType: Gallery.self)
            return .success(gallery)
        } catch {
            return .failure(error)
        }
    }
}
