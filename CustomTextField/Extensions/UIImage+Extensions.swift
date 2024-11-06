//
//  UIImage+Extensions.swift
//  CustomTextField
//
//  Created by Saadet Şimşek on 06/11/2024.
//

import UIKit

extension UIImage { // resme renkli geçiş ekleme
    
    func drawLinearGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) -> UIImage {
        
        let renderer = UIGraphicsImageRenderer(size: size)
        let gradientImage = renderer.image { context in
            context.cgContext.translateBy(x: 0,
                                          y: size.height)
            context.cgContext.scaleBy(x: 1,
                                      y: -1)
            
            let colors = colors.map { $0.cgColor } as CFArray
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            
            guard let gradient = CGGradient(colorsSpace: colorSpace,
                                            colors: colors,
                                            locations: nil) else{
                return
            }
            
            let rect = CGRect(x: 0,
                              y: 0,
                              width: size.width,
                              height: size.height)
            
            guard let cgImage else { return }
            context.cgContext.clip(to: rect, mask: cgImage)
            context.cgContext.drawLinearGradient(gradient, start: startPoint,
                                                 end: endPoint,
                                                 options: .init(rawValue: 1))
        }
        return gradientImage
    }
}
