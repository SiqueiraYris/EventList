//
//  Protocols.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 06/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
import Alamofire

protocol EventListInteractorProtocol: class {
    func fetchEvents(completion: @escaping (Error?, [Event]?) -> Void)
}

protocol EventDetailInteractorProtocol: class {
    func checkIn(eventID: String, userName: String, userEmail: String, completion: @escaping (Error?, Bool) -> Void)
}
