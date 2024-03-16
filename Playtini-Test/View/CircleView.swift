//
//  CircleView.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class CircleView: UIView {

    init(color: UIColor, cornerRadius: CGFloat) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.layer.cornerRadius = cornerRadius
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
