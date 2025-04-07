////
////  SneakAPIServerTests.swift
////  store
////
////  Created by Mario Segura on 6/4/25.
////
//
//import Testing
//import XCTest
//
//@testable import store
//
//class MockURLSession: URLSession {
//
//    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        // Simulate no data response
//        completionHandler(nil, nil, nil)
//        return URLSessionDataTask()
//    }
//}
//
//class SneakerAPIServiceTests: XCTestCase {
//
//    var sneakerAPIService: SneakerAPIService!
//
//    override func setUp() {
//        super.setUp()
//        sneakerAPIService = SneakerAPIService()
//    }
//
//    override func tearDown() {
//        sneakerAPIService = nil
//        super.tearDown()
//    }
//
//    func testFetchSneakersSuccess() {
//        let expectation = self.expectation(description: "Fetch Sneakers Success")
//
//        sneakerAPIService.fetchSneakers { result in
//            switch result {
//            case .success(let response):
//                XCTAssertNotNil(response)
//                XCTAssertGreaterThan(response.sneakers.count, 0)
//                expectation.fulfill()
//            case .failure(let error):
//                XCTFail("Expected success but got error: \(error)")
//            }
//        }
//
//        waitForExpectations(timeout: 10, handler: nil)
//    }
//
//    func testFetchSneakersInvalidURL() {
//        let expectation = self.expectation(description: "Fetch Sneakers Invalid URL")
//
//        // Modify the service to use an invalid URL for testing
//        sneakerAPIService = SneakerAPIService() // Ensure it's a fresh instance
//
//        sneakerAPIService.fetchSneakers { result in
//            switch result {
//            case .success:
//                XCTFail("Expected failure but got success")
//            case .failure(let error):
//                XCTAssertEqual(error as? SneakerAPIServiceError, SneakerAPIServiceError.invalidURL)
//                expectation.fulfill()
//            }
//        }
//
//        waitForExpectations(timeout: 10, handler: nil)
//    }
//
//    func testFetchSneakersNoData() {
//        let expectation = self.expectation(description: "Fetch Sneakers No Data")
//
//        // Mock the URLSession to return no data
//        let mockSession = MockURLSession()
//        sneakerAPIService = SneakerAPIService(session: mockSession)
//
//        sneakerAPIService.fetchSneakers { result in
//            switch result {
//            case .success:
//                XCTFail("Expected failure but got success")
//            case .failure(let error):
//               // XCTAssertEqual(error as? SneakerAPIServiceError, SneakerAPIServiceError.noData)
//                expectation.fulfill()
//            }
//        }
//
//        waitForExpectations(timeout: 10, handler: nil)
//    }
//
//    // Additional tests can be added here for parsing errors, etc.
//}
//
