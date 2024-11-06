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
    
    private var timer = Timer()
    private let loginName = ["Like", "Saadet", "Anna"]
    
    private var textFieldState: ValidState = .start {
        didSet {
            switch textFieldState {
            case .start:
                rightView = nil
            case .loading:
                rightViewLoadingConfigure()
            case .result:
                if loginName.contains(text ?? "") {
                    rightImageViewConfigure(imageName: "checkmark.seal.fill", tintColor: .green)
                }
                else{
                    rightImageViewConfigure(imageName: "multiply.circle", tintColor: .red)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
        leftImageViewConfigure()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        CGRect(x: 0, y: 0, width: 40, height: frame.height)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        CGRect(x: frame.width - 40, y: 0, width: 40, height: frame.height)
    }
    
//MARK: - Configuration
    
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
        leftImageView.image = UIImage(systemName: "person")?.drawLinearGradient(colors: [.red, .blue],
                                                                                startPoint: .init(x: 0, y: 0),
                                                                                endPoint: .init(x: 5, y: 40))
        leftView = leftImageView
    }
    
    private func rightViewLoadingConfigure(){
        let rightValidView = UIActivityIndicatorView()
        rightValidView.startAnimating()
        rightValidView.color = .lightGray
        rightView = rightValidView
    }
    
    @objc private func stopTyping(){
        textFieldState = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.textFieldState = .result
        })
    }
    
    private func rightImageViewConfigure(imageName: String, tintColor: UIColor){
        let rightImageView = UIImageView()
        rightImageView.contentMode = .center
        rightImageView.tintColor = tintColor
        rightImageView.image = UIImage(systemName: imageName)
        rightView = rightImageView
    }
    
    
}

//MARK: - Textfield Delegate

extension CustomTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        timer.invalidate()
        
        guard let text, let textRange = Range(range, in: text) else { return true } // her harfte kontrol ediyor
        let updateText = text.replacingCharacters(in: textRange, with: string)
      //  print(updateText)
        if updateText.isEmpty {
            textFieldState = .start
            return true
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.5,
                                     target: self,
                                     selector: #selector(stopTyping),
                                     userInfo: nil,
                                     repeats: false)
        return true
    }
}
