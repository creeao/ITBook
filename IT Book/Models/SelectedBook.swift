//
//  SelectedBook.swift
//  IT Book
//
//  Created by Eryk Chrustek on 25/09/2020.
//  Copyright © 2020 Eryk Chrustek. All rights reserved.
//

import Foundation
import UIKit

// MARK: SecondScreen
struct SelectedBook: Codable {
    
    let error, title, subtitle, authors: String
    let publisher, language, isbn10, isbn13: String
    let pages, year, rating, desc: String
    let price: String
    let image: String
    let url: String
}
