//
//  RemoteImageUITest.swift
//  store
//
//  Created by Mario Segura on 6/4/25.
//

import XCTest
import SwiftUI
import Combine
import Foundation
@testable import store// Replace with your app's module name

class MockURLSession: URLSession {
    var mockData: Data?
    var mockError: Error?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(mockData, nil, mockError)
        return URLSessionDataTask()
    }
}

class RemoteImageUITests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    func testRemoteImageLoading() {
 
        }
    }

