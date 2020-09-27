//
//  ViewController.swift
//  IT Book
//
//  Created by Eryk Chrustek on 24/09/2020.
//  Copyright © 2020 Eryk Chrustek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var titleTextField: UITextField!
    var result: Welcome?
    var numberOfRows: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar()
        constraintsInit()

    // MARK: * Tap w obszar poza UITextField powinien schować klawiaturę - opcja ta blokuje możliwość tapowania na rekordy, a nie znalazłem innej
    //        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
    //        view.addGestureRecognizer(tap)
    }
    
    //    @objc func dismissKeyboard() {
    //        view.endEditing(true)
    //    }
    
    
    // MARK: Klikając “return” na klawiaturze, klawiatura ma się schować i wyszukać wpisaną fraze.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        getJSON(titleOfBook: "\(titleTextField.text!)") { self.tableView() }
        return false
    }
    
    func searchBar() {
        
        titleTextField = UITextField(frame: .zero)
        titleTextField.placeholder = "Wyszukaj"
        titleTextField.borderStyle = .roundedRect
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.delegate = self
        view.addSubview(titleTextField)
    }
    
    func constraintsInit() {
        
      NSLayoutConstraint.activate([
        titleTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 90),
        titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
      ])
    }
}

