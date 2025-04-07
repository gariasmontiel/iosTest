//
//  SneakerViewModelTests.swift
//  store
//
//  Created by Greylin on 6/4/25.
//

import Testing
import XCTest

@testable import store

class SneakerViewModelTests: XCTestCase {
    var viewModel: SneakerViewModel!
    var mockapiService:MockSneakerAPIService!
    
    
    override func setUp() {
        super.setUp()
        //        mockapiService = MockSneakerAPIService()
        //        viewModel = SneakerViewModel(apiService: mockapiService as! SneakerAPIServiceProtocol) // Directly using the mock service
        
    }
    
    override func tearDown() {
        //        viewModel = nil
        //        mockapiService = nil
        super.tearDown()
    }
    
}
//    func testFetchSneakersSuccess() {
//        let mockSneakers = [
//            Sneaker(
//                id: 1,
//                name: "Sneaker A",
//                price: 120000,
//                imageName: "imageName",
//                discount: "",
//                category: ["basketball"]
//            ),
//            Sneaker(
//                id: 2,
//                name: "Sneaker A",
//                price: 400000,
//                imageName: "imageName",
//                discount: "",
//                category: ["basketball"]
//            ), Sneaker(
//                id: 3,
//                name: "Sneaker A",
//                price: 600000,
//                imageName: "imageName",
//                discount: "",
//                category: ["lifestyle"]
//            )
//        ]
//        mockapiService.sneakersResponse = SneakersResponse(healthcheck: HealthCheck(message: "Ok"), sneakers: mockSneakers)
//        viewModel.fetchSneakers()
//        XCTAssertEqual(viewModel.sneakers.count, 3)
//        XCTAssertEqual(viewModel.filteredSneaker.count, 3)
//        XCTAssertNil(viewModel.errorMessage)
//    }
//}
//
//    func testFetchSneakersError() {
//        mockAPIService.shouldReturnError = true
//        viewModel.fetchSneakers()
//        XCTAssertEqual(viewModel.sneakers.count, 0)
//        XCTAssertEqual(viewModel.filteredSneaker.count, 0)
//        XCTAssertNotNil(viewModel.errorMessage)
//        XCTAssertEqual(viewModel.errorMessage, "Error")
//    }
//
//    func testSelectCategoryBasketball() {
//        mockAPIService.shouldReturnError = false
//        viewModel.fetchSneakers()
//        viewModel.selectCategory("basketball")
//        XCTAssertEqual(viewModel.filteredSneaker.count, 2)
//    }
//
//    func testSelectCategoryCasual() {
//        mockAPIService.shouldReturnError = false
//        viewModel.fetchSneakers()
//        viewModel.selectCategory("Casual")
//        XCTAssertEqual(viewModel.filteredSneaker.count, 1)
//    }
//
//    func testSelectCategoryAll() {
//        mockAPIService.shouldReturnError = false
//        viewModel.fetchSneakers()
//        viewModel.selectCategory("All")
//        XCTAssertEqual(viewModel.filteredSneaker.count, 4)
//    }

