//
//  Restaurant.swift
//  xh244_P5
//
//  Created by 胡雪枫 on 2020/6/15.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import Foundation

struct Restaurant: Equatable {
    
    var imageName: String
    var restaurantName: String
    var cuisine: [String]
    var time: [String]
    var priceLevel: String
    
    enum Category {
        case cheap
        case acceptable
    }
    
}
