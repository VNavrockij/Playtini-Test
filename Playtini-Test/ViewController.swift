//
//  ViewController.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class ViewController: UIViewController {
    var circleRadius: CGFloat = 100

    private var isAnimating = false

    private var circleWidthConstraint: NSLayoutConstraint?
    private var circleHeightConstraint: NSLayoutConstraint?

    private lazy var circleView: CircleView = {
        let colors: [UIColor] = [UIColor(hexString: "a4c3b2"), UIColor(hexString: "eaf4f4")]
        let value = CircleView(colors: colors, cornerRadius: 50)
        return value
    }()

    private lazy var decreaseButton: UIButton = {
        ButtonFactory.buldButton(text: .minus, radius: 8, color: UIColor(hexString: "6b9080"))
    }()

    private lazy var increaseButton: UIButton = {
        ButtonFactory.buldButton(text: .plus, radius: 8, color: UIColor(hexString: "a4c3b2"))
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
        view.backgroundColor = UIColor(hexString: "f6fff8")
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
        if circleRadius > 50 {
            circleRadius -= 10
            updateCircle()
        }
    }

    @objc private func increaseButtonPressed() {
        if circleRadius < 250 {
            circleRadius += 10
            updateCircle()
        }
    }

    private func updateCircle() {
        guard !isAnimating else { return }
            isAnimating = true

        UIView.animate(withDuration: 0.1, animations: {
                self.circleWidthConstraint?.constant = self.circleRadius
                self.circleHeightConstraint?.constant = self.circleRadius
                self.view.layoutIfNeeded()
            }) { _ in
                self.isAnimating = false
            }
    }

    private func setConstraintsForButtons() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),

            decreaseButton.heightAnchor.constraint(equalToConstant: 50),
            increaseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setConstraintsForCircle() {
        circleWidthConstraint = circleView.widthAnchor.constraint(equalToConstant: circleRadius)
        circleHeightConstraint = circleView.heightAnchor.constraint(equalToConstant: circleRadius)

        guard circleWidthConstraint != nil,
        circleHeightConstraint != nil else {
            print("Not set width and height for circle")
            return
        }

        NSLayoutConstraint.activate([
            circleWidthConstraint!,
            circleHeightConstraint!,
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


