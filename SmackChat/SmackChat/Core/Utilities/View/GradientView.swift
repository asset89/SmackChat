//
//  GradientView.swift
//  SmackChat
//
//  Created by Asset Ryskul on 14.10.2022.
//

import UIKit

class GradientView: UIView {

    var topColor: UIColor = UIColor(rgb: 0x4a4dd8) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var bottomColor: UIColor = UIColor(rgb: 0x2cd4d8) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    

}
