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
         let networkManager = NetworkManager()
         viewModel = GalleryViewModel(networkManager: networkManager)
     }

     override func tearDown() {
         super.tearDown()
         viewModel = nil
     }
     func testGetImageGallery() async {
         let expectedImages = 20
         await viewModel!.getImageGallery(searchTerm: "nature")
         XCTAssertEqual(viewModel?.images.count, expectedImages, "Hits are not equal")
         await viewModel!.getImageGallery(searchTerm: "nature")
         XCTAssertEqual(viewModel?.images.count, expectedImages, "Hits are not equal")
     }
}
