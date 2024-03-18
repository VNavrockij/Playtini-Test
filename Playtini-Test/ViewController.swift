//
//  ViewController.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var circleView: CircleView = {
        let colors: [UIColor] = [.red, .blue]
        let value = CircleView(colors: colors, cornerRadius: 50)
        return value
    }()

    private lazy var buttons = DecreaseAndIncreaseButtonsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(circleView)
        view.addSubview(buttons)
        setConstraintsForCircle()
        setConstraintsForButtons()
        circleView.animate()
    }

    private func setConstraintsForCircle() {
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: 100),
            circleView.heightAnchor.constraint(equalToConstant: 100),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setConstraintsForButtons() {
        buttons.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttons.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttons.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttons.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


