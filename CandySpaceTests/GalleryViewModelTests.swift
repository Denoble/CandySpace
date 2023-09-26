//
//  GalleryViewModelTests.swift
//  CandySpaceTests
//
//  Created by William Rozier on 9/19/23.
//

import XCTest
@testable import CandySpace

final class GalleryViewModelTests: XCTestCase {
    var viewModel: GalleryViewModel?
     override func setUp() {
         super.setUp()
     }

     override func tearDown() {
         super.tearDown()
         viewModel = nil
     }

     func testGetImageGallerySuccess() async throws {
         let mockNetworkManager = MockNetworkManager()
         viewModel = GalleryViewModel(networkManager: mockNetworkManager,
                                      imageCache: ImageCache(), searchResultCache: SearchResultCache())
         let expectedImageCount = 2
         let viewState = ViewState.loaded
         try await viewModel!.getImageGallery(searchTerm: "nature")
         XCTAssertEqual(viewModel?.images.count, expectedImageCount, "Number of images is not correct.")
         XCTAssertEqual(viewState, .loaded, "View state is not in correct state")
         XCTAssertEqual(viewModel?.searchResultCache.getResults(searchTerm: "nature")?.count,
                        expectedImageCount, "Cache did not get set")
     }

    func testGetImageGalleryFailure() async throws {
        var mockNetworkManager = MockNetworkManager()
        mockNetworkManager.success = false
        viewModel = GalleryViewModel(networkManager: mockNetworkManager,
                                     imageCache: ImageCache(), searchResultCache: SearchResultCache())
        try await viewModel!.getImageGallery(searchTerm: "nature")
        XCTAssertEqual(viewModel?.state, .error, "View state is not correct")
        XCTAssertEqual(viewModel?.images.count, 0, "Number of images is not correct.")
    }

    func testGetImageCache() async throws {
        var mockNetworkManager = MockNetworkManager()
        mockNetworkManager.success = false
        viewModel = GalleryViewModel(networkManager: mockNetworkManager,
                                     imageCache: ImageCache(), searchResultCache: SearchResultCache())
        viewModel!.imageCache.setImage(image: UIImage(), url: "firstImage.jpg")
        viewModel!.imageCache.setImage(image: UIImage(), url: "secondImage.jpg")
        guard let firstUrl = URL(string: "firstImage.jpg") else {
            return
        }
        guard let secondUrl = URL(string: "secondImage.jpg") else {
            return
        }
        let firstImage = await viewModel!.getImage(url: firstUrl)
        let secondImage = await viewModel!.getImage(url: secondUrl)
        XCTAssertNotNil(firstImage)
        XCTAssertNotNil(secondImage)
    }
}
