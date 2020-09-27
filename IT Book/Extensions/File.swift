//
//  File.swift
//  IT Book
//
//  Created by Eryk Chrustek on 24/09/2020.
//  Copyright © 2020 Eryk Chrustek. All rights reserved.
//

import UIKit

protocol Networking {
//
//    func getJSON(completed: @escaping () -> ()) {
//
//        let code = secondView?.code
//        let table = tableInfo!.table
//
//        let url = URL(string: "https://api.nbp.pl/api/exchangerates/rates/\(table)/\(code!)/\(startDate)/\(endDate)?format=json")
//
//        URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
//            guard let data = data, error == nil else {
//            print("sth wrong")
//                return
//            }
//
//            do {
//                self.result = try JSONDecoder().decode(Between.self, from: data)
//
//                self.numberOfRows = self.result!.rates.count
//
//                DispatchQueue.main.sync {
//                completed()
//
//                return self.tableView.reloadData()
//                }
//            }
//            catch {
//                print("failed")
//            }
//
//            }).resume()
//
//    }
}
