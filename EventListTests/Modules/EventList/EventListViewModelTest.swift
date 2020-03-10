//
//  EventListViewModelTest.swift
//  EventListTests
//
//  Created by Yris Siqueira da Silva on 06/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import XCTest
@testable import EventList

class EventListViewModelTest: XCTestCase {
    
    var viewModel: EventListViewModel!
    var interactor: EventListInteractorMock!

    override func setUp() {
        interactor = EventListInteractorMock()
        viewModel = EventListViewModel(interactor: interactor)
        viewModel.delegate = self
    }

    override func tearDown() {
        viewModel = nil
        interactor = nil
    }

    func testFetchEvents() {
        viewModel.fetchEvents()
        XCTAssert(interactor.isfetchEventsCalled)
    }

}

extension EventListViewModelTest: EventListViewModelDelegate {
    
    // Testing model decode
    func updateData(events: [Event]) {
        XCTAssertNotNil(events)
    }
    
    func hasError(error: Error) {
        XCTFail(error.localizedDescription)
    }
    
}
