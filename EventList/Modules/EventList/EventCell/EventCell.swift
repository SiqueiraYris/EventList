//
//  EventCell.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 05/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit
import Kingfisher

class EventCell: UITableViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configure(event: Event) {
        eventName.text = event.title
        eventDescription.text = event.description
        price.text = String(event.price)
        
        if let imageURL = URL(string: event.image) {
            eventImage.kf.setImage(with: imageURL, placeholder: UIImage(named: "emptyImage"))
            eventImage.setRounded()
        }
    }
    
}
