//
//  ViewController.swift
//  WantedPreOnboardingIOSChallenge
//
//  Created by 맹선아 on 2023/03/01.
//

import UIKit

final class ViewController: UIViewController {

    private let imageDownLoadStackView1: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)
    private let imageDownLoadStackView2: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)
    private let imageDownLoadStackView3: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)
    private let imageDownLoadStackView4: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)
    private let imageDownLoadStackView5: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)

    private let imageAllLoadButton: UIButton = {
        let config = UIButton.Configuration.filled()
        let button: UIButton = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Load All Images", for: .normal)

        return button
    }()

    private let verticalStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10

        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        configureHierarchy()
        configureLayout()
    }

}

extension ViewController {

    private func configureHierarchy() {
        verticalStackView.addArrangedSubview(imageDownLoadStackView1)
        verticalStackView.addArrangedSubview(imageDownLoadStackView2)
        verticalStackView.addArrangedSubview(imageDownLoadStackView3)
        verticalStackView.addArrangedSubview(imageDownLoadStackView4)
        verticalStackView.addArrangedSubview(imageDownLoadStackView5)
        verticalStackView.addArrangedSubview(imageAllLoadButton)

        view.addSubview(verticalStackView)
    }

    private func configureLayout() {
        let margin: CGFloat = 10
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin),
            verticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margin),
            verticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin),
        ])
    }

}
