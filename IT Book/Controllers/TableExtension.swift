//
//  TableExtension.swift
//  IT Book
//
//  Created by Eryk Chrustek on 27/09/2020.
//  Copyright © 2020 Eryk Chrustek. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    

       func tableView() {
           let tableView = UITableView(frame: self.view.frame, style: .plain)
           tableView.rowHeight = 50
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
           tableView.delegate = self
           tableView.dataSource = self
           view.addSubview(tableView)
           
           tableView.separatorStyle = .none
           
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
           
           NSLayoutConstraint.activate([
               tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ])
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return numberOfRows
         }
         
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell: UITableViewCell = UITableViewCell (style: .default, reuseIdentifier: "cell")
             cell.textLabel!.text = self.result?.books[indexPath.row].title ?? "No name"
           
             return cell
       }

       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let secondScreen = SecondScreen()
            secondScreen.passData = self.result?.books[indexPath.row].isbn13
//            secondScreen.delegate = self
            navigationController?.pushViewController(secondScreen, animated: true)


           przepraszamZaTo = self.result?.books[indexPath.row].isbn13
           self.modalTransitionStyle = UIModalTransitionStyle.coverVertical
           self.modalPresentationStyle = .currentContext
           self.present(SecondScreen(), animated: true, completion: nil)
           tableView.deselectRow(at: indexPath, animated: true)
       }
    
}
