//
//  Search.swift
//  IT Book
//
//  Created by Eryk Chrustek on 25/09/2020.
//  Copyright © 2020 Eryk Chrustek. All rights reserved.
//

import UIKit
import Foundation

// MARK: ViewController
struct Welcome: Codable {
    
    let error, total, page: String
    let books: [Book]
}

struct Book: Codable {
    
    let title, subtitle, isbn13, price: String
    let image: String
    let url: String
}
