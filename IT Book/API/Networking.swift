//
//  Networking.swift
//  IT Book
//
//  Created by Eryk Chrustek on 27/09/2020.
//  Copyright © 2020 Eryk Chrustek. All rights reserved.
//

import UIKit

extension ViewController {
    
    func getJSON(titleOfBook: String, completed: @escaping () -> ()) {
        
        let url = URL(string: "https://api.itbook.store/1.0/search/\(titleOfBook)?format=json")

        URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }

            do {
                self.result = try JSONDecoder().decode(Welcome.self, from: data)
                self.numberOfRows = self.result?.books.count ?? 0

                DispatchQueue.main.sync { completed()
                return
                }
            }
            catch { print("failed") }
        }).resume()
      
    }
}

extension SecondScreen {
    
    func getJSON(isbn13: String, completed: @escaping () -> ()) {
        
        let url = URL(string: "https://api.itbook.store/1.0/books/\(isbn13)?format=json")

        URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }

            do {
                self.selectedBook = try JSONDecoder().decode(SelectedBook.self, from: data)
                let urlImg = self.selectedBook?.image ?? "none"
                
                let url = URL(string: urlImg)!
                self.downloadImage(from: url)

                DispatchQueue.main.sync {
                completed()
                    return
                }
            }
            catch { print("failed") }
        }).resume()
      
    }
}

var przepraszamZaTo: String!
