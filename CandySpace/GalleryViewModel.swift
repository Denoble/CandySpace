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
    case networkManagerFailed
    // Add more error cases as needed
}

class GalleryViewModel {
    let networkManager: NetworkManagerHelper
    init(initNetworkManager: NetworkManagerHelper) {
        networkManager = initNetworkManager
    }
    
    lazy var hitsArray = HitArrays()
    func getImageGallery(searchParameter: String) async -> Result<Gallery, NetworkError> {
    guard let url = CandySpaceURL.getGalleryurl(query: searchParameter) else {
            return .failure(.invalidURL)
        }
        do {
            
            let gallery = try await networkManager.taskForGETRequest(url: url, responseType: Gallery.self)
            self.hitsArray = gallery.hits ?? []
            return .success(gallery)
            
        } catch {
            return .failure(.networkManagerFailed)
        }
    }
}
