//
//  Books.swift
//  IT Book
//
//  Created by Eryk Chrustek on 24/09/2020.
//  Copyright © 2020 Eryk Chrustek. All rights reserved.
//

import Foundation
import UIKit

struct Books: Codable {
    
    let title: String
    let subtitle: String
    let authors: String
    let pages: Int
    let price: String
}
