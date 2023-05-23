//
//  UIView+.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 18.05.2023.
//

import UIKit

extension UIView {
  
  func applyShadow(cornerRadios: CGFloat) {
    layer.cornerRadius = cornerRadios
    layer.masksToBounds = false
    layer.shadowRadius = 4.0
    layer.shadowOpacity = 0.30
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOffset = CGSize(width: 0, height: 5)
  }
}
