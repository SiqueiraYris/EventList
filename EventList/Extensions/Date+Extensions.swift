//
//  Date+Extensions.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 05/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import Foundation

extension Date {
    
    func createDateFromTimestamp(timestamp: Int) -> String {
        let unixTimeStamp: Double = Double(timestamp) / 1000.0
        let exactDate = NSDate.init(timeIntervalSince1970: unixTimeStamp)
        let dateFormatt = DateFormatter();
        dateFormatt.dateFormat = "dd/MM/yyy hh:mm"
        return dateFormatt.string(from: exactDate as Date)
    }
    
}
