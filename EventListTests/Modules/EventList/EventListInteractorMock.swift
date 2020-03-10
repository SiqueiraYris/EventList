//
//  EventListInteractorMock.swift
//  EventListTests
//
//  Created by Yris Siqueira da Silva on 06/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
@testable import EventList

class EventListInteractorMock: EventListInteractorProtocol {
    
    var isfetchEventsCalled = false
    
    func fetchEvents(completion: @escaping (Error?, [Event]?) -> Void) {
        isfetchEventsCalled = true
        
        guard let path = Bundle.main.path(forResource: "events", ofType: "json") else {
            fatalError("Doesnt find any events.json on this project")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            fatalError("Error on creating data from events.json")
        }
        
        if let events = try? JSONDecoder.init().decode([Event].self, from: data) {
            completion(nil, events)
        } else {
            completion(nil, [])
        }
    }
    
}
