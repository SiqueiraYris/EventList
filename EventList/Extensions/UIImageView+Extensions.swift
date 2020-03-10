//
//  UIImageView+Extensions.swift
//  EventList
//
//  Created by Yris Siqueira da Silva on 06/12/19.
//  Copyright © 2019 Yris Siqueira da Silva. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.width / 2.0
        self.layer.masksToBounds = true
    }
    
}
