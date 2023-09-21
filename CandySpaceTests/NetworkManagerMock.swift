//
//  NetworkManagerMock.swift
//  CandySpaceTests
//
//  Created by William Rozier on 9/21/23.
//

import XCTest

@testable import  CandySpace

class MockNetworkManager: NetworkManagerHelper {
    var success = false
    
    func taskForGETRequest<ResponseType>(url: URL, responseType: ResponseType.Type) async throws -> ResponseType where ResponseType : Decodable {
        if success {
            return Gallery.getMockGallery() as! ResponseType
        } else {
            let jsondecoder = JSONDecoder()
            let data = Data()
            let failData = try jsondecoder.decode(MockGallery.self, from: data)
            print("Fail: \(failData)")
            return failData as! ResponseType
        }
    }
}
struct MockGallery: Decodable {
    let tota: Int
    let totalHit: Int
    let hits: [Hits]
}

extension Gallery {
    static func getMockGallery() -> Gallery {
        let hits = [Hits(id: 0, pageURL: nil, type: nil, tags: nil, previewURL: nil, previewWidth: nil, previewHeight: nil, webformatURL: nil, webformatWidth: nil, webformatHeight: nil, largeImageURL: nil, imageWidth: nil, imageHeight: nil, imageSize: nil, views: nil, downloads: nil, collections: nil, likes: nil, comments: nil, userId: nil, user: nil, userImageURL: nil), Hits(id: 1, pageURL: nil, type: nil, tags: nil, previewURL: nil, previewWidth: nil, previewHeight: nil, webformatURL: nil, webformatWidth: nil, webformatHeight: nil, largeImageURL: nil, imageWidth: nil, imageHeight: nil, imageSize: nil, views: nil, downloads: nil, collections: nil, likes: nil, comments: nil, userId: nil, user: nil, userImageURL: nil)]
        return Gallery(total: 1, totalHits: 2, hits: hits)
    }
}

//final class NetworkManagerHelperMock: XCTestCase  {
//
//    var mockGalleryResponse: Gallery?
//    var shouldThrowError = false
//
//    // Implement the required methods of NetworkManagerHelper protocol
//    func taskForGETRequest<T: Decodable>(url: URL, responseType: T.Type) async throws -> T {
//        if shouldThrowError {
//            throw NetworkError.networkManagerFailed
//        }
//
//        if let gallery = mockGalleryResponse as? T {
//            return gallery
//        }
//
//        throw NetworkError.networkManagerFailed
//    }
//}
