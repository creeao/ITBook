//
//  SecondScreen.swift
//  IT Book
//
//  Created by Eryk Chrustek on 26/09/2020.
//  Copyright © 2020 Eryk Chrustek. All rights reserved.
//

import UIKit

class SecondScreen: UIViewController {
    
    var titleOfBook = UILabel()
    var subtitle: String?
    var authors: String?
    var pages: String?
    var price: String?
    
    var passData: String?

    var selectedBook: SelectedBook?
    
    lazy var containerView: UIView = {

        let view = UIView()
        view.backgroundColor = .white

        view.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.anchor(top: view.topAnchor, paddingTop: 20, width: 290, height: 350)
        
        view.addSubview(titleLabel)

        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 20)
        titleLabel.text = self.selectedBook?.title ?? "None"
        
        view.addSubview(subtitleLabel)
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 12)
        subtitleLabel.text = self.selectedBook?.subtitle ?? "None"
        
        view.addSubview(authorsLabel)
        authorsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        authorsLabel.anchor(top: subtitleLabel.bottomAnchor, paddingTop: 12)
        authorsLabel.text = self.selectedBook?.authors ?? "None"
        
        view.addSubview(pagesLabel)
        pagesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pagesLabel.anchor(top: authorsLabel.bottomAnchor, paddingTop: 12)
        pagesLabel.text = ("Pages: \(self.selectedBook?.pages ?? "None")")
        
        view.addSubview(priceLabel)
        priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceLabel.anchor(top: pagesLabel.bottomAnchor, paddingTop: 12)
        priceLabel.text = self.selectedBook?.price ?? "None"
        
        return view
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        return image
       }()
    
    
       
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let authorsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let pagesLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           label.font = UIFont.systemFont(ofSize: 18)
           return label
    }()
    
    let priceLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           label.font = UIFont.systemFont(ofSize: 22)
           return label
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        getJSON(isbn13: passData!) {
            self.view.addSubview(self.containerView)
            self.containerView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,
                                      right: self.view.rightAnchor, height: 300)
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.profileImageView.image = UIImage(data: data)
            }
        }
    }

}

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
                paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}


