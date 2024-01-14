//
//  SpaceXAppTests.swift
//  SpaceXAppTests
//
//  Created by Amit Rawal on 13/01/24.
//

import XCTest
@testable import SpaceXApp

final class SpaceXAppTests: XCTestCase {
    
    var viewModel: LaunchListViewModel!

    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // Use the mock networking service during testing
        let mockNetworkingService = MockManager.shared
        viewModel = LaunchListViewModel(networkingService: mockNetworkingService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        super.tearDown()
    }
    
    
    @MainActor func testFetchLaunchData() {

        let expectation = self.expectation(description: "Fetch Launch data")
        
        viewModel.getLaunches { result in
            switch result {
            case .success(let arr):
                // Assert the properties of the movie object you expect to receive
                XCTAssertTrue(arr.count > 0 , "No data found")
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30.0)
    }
    
    func test_MockManager() async {
        do {
            let arr: [LaunchModel] = try await MockManager.shared.fetch(from: URLs.launchURL)
            XCTAssertTrue(arr.count > 0 , "No data found")
        } catch {
            XCTFail("Error: \(error.localizedDescription)")
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
