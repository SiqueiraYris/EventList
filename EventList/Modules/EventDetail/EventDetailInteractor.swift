//
//  EventDetailInteractor.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 05/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation
import Alamofire

public enum CustomErrors: Error {
    case unknowError
    case serverError
}

class EventDetailInteractor: EventDetailInteractorProtocol {
    
    func checkIn(eventID: String, userName: String, userEmail: String, completion: @escaping (Error?, Bool) -> Void) {
        let url: String = "http://5b840ba5db24a100142dcd8c.mockapi.io/api/checkin"
        
        let parameters = [
            "eventId": eventID,
            "name": userName,
            "email": userEmail
        ]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.response?.statusCode {
            case 200:
                completion(nil, true)
            case 500:
                completion(CustomErrors.serverError, false)
            default:
                completion(CustomErrors.unknowError, false)
            }
        }
    }
    
}
