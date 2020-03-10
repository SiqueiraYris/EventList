//
//  EventDetailInteractorMock.swift
//  EventListTests
//
//  Created by Yris Siqueira da Silva on 06/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
@testable import EventList

class EventDetailInteractorMock: EventDetailInteractorProtocol {
    
    var isCheckInCalled = false
    
    func checkIn(eventID: String, userName: String, userEmail: String, completion: @escaping (Error?, Bool) -> Void) {
        isCheckInCalled = true
        completion(nil, true)
    }
    
}
