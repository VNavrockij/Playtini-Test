//
//  DecreaseAndIncreaseButtonsView.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class DecreaseAndIncreaseButtonsView: UIView {

    private lazy var decreaseButton: UIButton = {
        let value = buldButton(
            text: "-",
            radius: 8)

        return value
    }()

    private lazy var increaseButton: UIButton = {
        let value = buldButton(
            text: "+",
            radius: 8)

        return value
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            decreaseButton,
            increaseButton
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 48
        return stackView
    }()


    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])

        NSLayoutConstraint.activate([
//            decreaseButton.widthAnchor.constraint(equalToConstant: 50),
            decreaseButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
//            increaseButton.widthAnchor.constraint(equalToConstant: 50),
            increaseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func buldButton(text: String, radius: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.addCornerRadius(radius: radius)
        return button
    }
}
