//
//  EventListViewModel.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 05/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

protocol EventListViewModelDelegate: class {
    func updateData(events: [Event])
    func hasError(error: Error)
}

class EventListViewModel {
    
    let interactor: EventListInteractorProtocol
    var events: [Event] = []
    
    weak var delegate: EventListViewModelDelegate?
    
    init(interactor: EventListInteractorProtocol = EventListInteractor()) {
        self.interactor = interactor
    }
    
    func fetchEvents() {
        interactor.fetchEvents { error, eventList in
            if let err = error {
                self.delegate?.hasError(error: err)
            }
            guard let events = eventList else { return }
            self.delegate?.updateData(events: events)
        }
    }
    
}
