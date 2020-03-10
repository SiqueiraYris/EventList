//
//  EventDetailViewModel.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 05/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

protocol EventDetailViewModelDelegate: class {
    func success(message: String)
    func hasError(error: Error)
}

class EventDetailViewModel {
    
    let interactor: EventDetailInteractorProtocol
    
    weak var delegate: EventDetailViewModelDelegate?
    
    init(interactor: EventDetailInteractorProtocol = EventDetailInteractor()) {
        self.interactor = interactor
    }
    
    func checkIn(eventID: String, userName: String, userEmail: String) {
        interactor.checkIn(eventID: eventID, userName: userName, userEmail: userEmail) { error, status in
            if status {
                self.delegate?.success(message: "Check-In feito com sucesso!")
            }
            if let err = error {
                self.delegate?.hasError(error: err)
            }
        }
    }
    
}
