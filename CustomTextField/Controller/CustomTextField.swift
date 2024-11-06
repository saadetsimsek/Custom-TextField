//
//  CustomTextField.swift
//  CustomTextField
//
//  Created by Saadet Şimşek on 06/11/2024.
//

import UIKit

enum ValidState{
    case start
    case loading
    case result
}

final class CustomTextField: UITextField {
    
    private var textFieldState: ValidState = .start {
        didSet {
            switch textFieldState {
            case .start:
                rightView = nil
            case .loading:
                print("loading")
            case .result:
                print("result")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        leftImageViewConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        borderStyle = .roundedRect
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        tintColor = .darkGray
        textColor = .black
       /* leftView = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 40,
                                        height: 40))
        leftView?.backgroundColor = .red
        */
        leftViewMode = .always
        rightViewMode = .always
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func leftImageViewConfigure(){
        let leftImageView = UIImageView()
        leftImageView.contentMode = .center
        leftImageView.image = UIImage(systemName: "person")
        leftView = leftImageView
    }
    
}
