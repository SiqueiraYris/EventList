//
//  EventDetailViewModelTest.swift
//  EventListTests
//
//  Created by Yris Siqueira da Silva on 06/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import XCTest
@testable import EventList

class EventDetailViewModelTest: XCTestCase {
    
    var viewModel: EventDetailViewModel!
    var interactor: EventDetailInteractorMock!

    override func setUp() {
        interactor = EventDetailInteractorMock()
        viewModel = EventDetailViewModel(interactor: interactor)
        viewModel.delegate = self
    }

    override func tearDown() {
        viewModel = nil
        interactor = nil
    }

    func testcheckIn() {
        viewModel.checkIn(eventID: "1", userName: "Teste", userEmail: "teste@teste.com")
        XCTAssert(interactor.isCheckInCalled)
    }

}

extension EventDetailViewModelTest: EventDetailViewModelDelegate {
    
    func success(message: String) {
        XCTAssert(true, message)
    }
    
    func hasError(error: Error) {
        XCTFail(error.localizedDescription)
    }
    
}
