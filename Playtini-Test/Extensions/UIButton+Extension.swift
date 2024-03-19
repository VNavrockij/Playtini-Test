//
//  UIButton+Extension.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 19.03.2024.
//

import UIKit

struct ButtonFactory {
    static func buldButton(text: Mark, radius: CGFloat, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text.stringValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.addCornerRadius(radius: radius)
        return button
    }
}
