//
//  CircleView.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class CircleView: UIView {
    private let gradientLayer = CAGradientLayer()

    init(colors: [UIColor], cornerRadius: CGFloat) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius

        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        layer.addSublayer(gradientLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = bounds.height / 2
    }

    func animate() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = CGFloat.pi * 2
        rotationAnimation.duration = 2
        rotationAnimation.repeatCount = .greatestFiniteMagnitude

        gradientLayer.add(rotationAnimation, forKey: "rotationAnimation")
    }
}
