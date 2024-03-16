//
//  UIView+Extension.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

extension UIView {
    func addCornerRadius(radius: CGFloat) {
        layer.masksToBounds = false
        layer.cornerRadius = radius
    }
}
