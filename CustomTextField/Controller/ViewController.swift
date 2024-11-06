//
//  ViewController.swift
//  CustomTextField
//
//  Created by Saadet Şimşek on 05/11/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let nameLabel = UILabel(text: "Your username",
                                    textColor: .black,
                                    fontSize: 16)
    
    private let descriptionLabel = UILabel(text: "Aucomatically saves as you change it to valid username",
                                           textColor: .gray,
                                           fontSize:12)
    
    private let customTextField = CustomTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account"
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(customTextField)
        
        setConstraints()
    }

    private func setConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            customTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            customTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            customTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}

