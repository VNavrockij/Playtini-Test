//
//  ViewController.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 16.03.2024.
//

import UIKit

class ViewController: UIViewController {
    var circleRadius: CGFloat = 100
    var countOfCollision = 0 {
        didSet {
            if countOfCollision >= 5 {
                presentAlert()
            }
        }
    }

    private var isAnimating = false

    private var circleWidthConstraint: NSLayoutConstraint?
    private var circleHeightConstraint: NSLayoutConstraint?

    let topBlock = UIView()
    let bottomBlock = UIView()

    private var topBlockInitialPosition: CGFloat = 0.0
    private var topBlockFinalPosition: CGFloat = 0.0
    private var bottomBlockInitialPosition: CGFloat = 0.0
    private var bottomBlockFinalPosition: CGFloat = 0.0

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
        view.addSubview(topBlock)
        view.addSubview(bottomBlock)

        setConstraintsForButtons()
        setConstraintsForCircle()
        setBlocks()

        setTargetsForButtons()

        circleView.animate()
        animateBlocks()

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            //            print("timer")
            self.checkCollision()
        }
    }

    private func checkCollision() {
        if let circleRect = circleView.layer.presentation()?.frame,
           let topBlockRect = topBlock.layer.presentation()?.frame,
           let bottomBlockRect = bottomBlock.layer.presentation()?.frame {
            if circleRect.intersects(topBlockRect)  {
                countOfCollision += 1
                resetTopBlock()
                print("Collision detected! Count: \(countOfCollision)")
                return
            } else if circleRect.intersects(bottomBlockRect) {
                countOfCollision += 1
                resetBottomBlock()
                print("Collision detected! Count: \(countOfCollision)")
                return
            }
        }
    }

    private func presentAlert() {
    // TODO: alert - Restart - vibration
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

    private func animateBlocks() {
        animateTopBlock()
        animateBottomBlock()
    }

    private func animateTopBlock() {
        UIView.animate(withDuration: 2.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.topBlock.frame.origin.x = self.topBlockFinalPosition
        }, completion: { _ in
            self.resetTopBlock()
            self.animateTopBlock()
        })
    }
    private func animateBottomBlock() {
        UIView.animate(withDuration: 2.0, delay: 1.5, options: .curveEaseInOut, animations: {
            self.bottomBlock.frame.origin.x = self.bottomBlockFinalPosition
        }, completion: { _ in
            self.resetBottomBlock()
            self.animateBottomBlock()
        })
    }

    private func resetTopBlock() {
        topBlock.frame.origin.x = topBlockInitialPosition
    }

    private func resetBottomBlock() {
        bottomBlock.frame.origin.x = bottomBlockInitialPosition
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
            NSLog("Not set width and height for circle")
            return
        }

        NSLayoutConstraint.activate([
            circleWidthConstraint!,
            circleHeightConstraint!,
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setBlocks() {
        topBlockInitialPosition = view.frame.maxX
        bottomBlockInitialPosition = view.frame.maxX

        topBlockFinalPosition = view.frame.minX - 200
        bottomBlockFinalPosition = view.frame.minX - 250

        topBlock.frame = CGRect(x: topBlockInitialPosition, y: 300, width: 200, height: 10)
        topBlock.backgroundColor = UIColor(hexString: "6b9080")

        bottomBlock.frame = CGRect(x: bottomBlockInitialPosition, y: view.frame.maxY - 310, width: 200, height: 10)
        bottomBlock.backgroundColor = UIColor(hexString: "a4c3b2")
    }
}
