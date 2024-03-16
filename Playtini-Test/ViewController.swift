//
//  ViewController.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var circleView: UIView = {
        let value = UIView()
        value.translatesAutoresizingMaskIntoConstraints = false
        value.backgroundColor = .red
        value.layer.cornerRadius = 50
        return value
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(circleView)

        setConstraintsForShape()
    }

    func setConstraintsForShape() {
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: 100),
            circleView.heightAnchor.constraint(equalToConstant: 100),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


