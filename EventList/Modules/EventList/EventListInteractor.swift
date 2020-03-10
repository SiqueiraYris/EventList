//
//  EventListInteractor.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 05/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
import Alamofire

class EventListInteractor: EventListInteractorProtocol {
    
    func fetchEvents(completion: @escaping (Error?, [Event]?) -> Void) {
        let url: String = "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events"
        Alamofire.request(url)
          .responseJSON { response in
            if let error = response.result.error {
                completion(error, nil)
            }

            if let data = response.data,
                let events = try? JSONDecoder.init().decode([Event].self, from: data) {
                completion(nil, events)
            } else {
                completion(nil, [])
            }
        }
    }
    
}
