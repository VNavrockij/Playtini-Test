//
//  ViewController.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var circleView: CircleView = {
        let value = CircleView(color: .red, cornerRadius: 50)
        return value
    }()

    private lazy var buttons = DecreaseAndIncreaseButtonsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(circleView)
        view.addSubview(buttons)
        setConstraintsForCircle()
        setConstraintsForButtons()
    }

    func setConstraintsForCircle() {
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: 100),
            circleView.heightAnchor.constraint(equalToConstant: 100),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func setConstraintsForButtons() {
        buttons.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttons.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttons.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttons.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


