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
        let networkManagerMock = NetworkManager()
        viewModel = GalleryViewModel(initNetworkManager: networkManagerMock)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    func testFetchGallerySuccess()  async {
        let expectedTotalHits = 500
//        let expectedTotal = 242563
        let expectedHits = 20
        let result =  await viewModel!.getImageGallery(searchParameter: "nature")
        switch result {
        case .success(let res):
            XCTAssertEqual(res.totalHits, expectedTotalHits, "Total Hits are not equal")
//            XCTAssertEqual(res.total, expectedTotal, "Total are not equal")
            XCTAssertEqual(res.hits?.count, expectedHits, "Hits are not equal")
        case .failure(let error):
            print(error)
        }
    }

}
