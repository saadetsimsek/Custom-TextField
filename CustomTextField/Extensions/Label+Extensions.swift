//
//  Label+Extensions.swift
//  CustomTextField
//
//  Created by Saadet Şimşek on 06/11/2024.
//

import UIKit

extension UILabel {
    convenience init(text: String, textColor: UIColor, fontSize: CGFloat) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
