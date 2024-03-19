//
//  ViewController.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class ViewController: UIViewController {
    var circleRadius: CGFloat = 100
//    var newRadius: CGFloat {
//
//    }

    private lazy var circleView: CircleView = {
        let colors: [UIColor] = [.red, .blue]
        let value = CircleView(colors: colors, cornerRadius: 50)
        return value
    }()

    private lazy var decreaseButton: UIButton = {
        ButtonFactory.buldButton(text: .minus, radius: 8, color: .blue)
    }()

    private lazy var increaseButton: UIButton = {
        ButtonFactory.buldButton(text: .plus, radius: 8, color: .red)
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

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(circleView)
        view.addSubview(stackView)

        setConstraintsForButtons()
        setConstraintsForCircle()

        setTargetsForButtons()

        circleView.animate()
    }

    private func setTargetsForButtons() {
        decreaseButton.addTarget(self, action: #selector(decreseButtonPressed), for: .touchUpInside)
        increaseButton.addTarget(self, action: #selector(increaseButtonPressed), for: .touchUpInside)
    }

    @objc private func decreseButtonPressed() {
        circleRadius -= 10
        updateCircle()
    }

    @objc private func increaseButtonPressed() {
        circleRadius += 10
        updateCircle()
    }

    private func updateCircle() {

    }

    private func setConstraintsForButtons() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
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

    private func setConstraintsForCircle() {
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: circleRadius),
            circleView.heightAnchor.constraint(equalToConstant: circleRadius),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


