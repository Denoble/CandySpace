//
//  MockNetworkManager.swift
//  CandySpaceTests
//
//  Created by William Rozier on 9/26/23.
//

import Foundation
@testable import CandySpace

enum MockNetworkManagerError: Error {
    case apiFailed
}

struct MockNetworkManager: Networkable {
    var success = true
    func execute<T>(_ request: Requestable, modelType: T.Type) async throws -> T where T: Decodable {
        if (success) {
            return Gallery.getMockGallery() as! T
        } else {
            throw MockNetworkManagerError.apiFailed
        }
    }
}

extension Gallery {
    // mock Gallery response for testing
    static func getMockGallery() -> Gallery {
        let hits = [Hits(id: 0, pageURL: nil, type: nil, tags: nil, previewURL: nil, previewWidth: nil, previewHeight: nil, webformatURL: nil, webformatWidth: nil, webformatHeight: nil, largeImageURL: nil, imageWidth: nil, imageHeight: nil, imageSize: nil, views: nil, downloads: nil, collections: nil, likes: nil, comments: nil, userId: nil, user: nil, userImageURL: nil), Hits(id: 1, pageURL: nil, type: nil, tags: nil, previewURL: nil, previewWidth: nil, previewHeight: nil, webformatURL: nil, webformatWidth: nil, webformatHeight: nil, largeImageURL: nil, imageWidth: nil, imageHeight: nil, imageSize: nil, views: nil, downloads: nil, collections: nil, likes: nil, comments: nil, userId: nil, user: nil, userImageURL: nil)]
        return Gallery(total: 1, totalHits: 2, hits: hits)
    }
    
    static func getMockErrorGallery() -> Gallery {
        let hits: [Hits] = []
        return Gallery(total: 1, totalHits: 0, hits: hits)
    }
}
