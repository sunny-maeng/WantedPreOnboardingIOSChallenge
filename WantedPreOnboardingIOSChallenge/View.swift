//
//  View.swift
//  WantedPreOnboardingIOSChallenge
//
//  Created by 맹선아 on 2023/03/01.
//

import UIKit

class ImageDownLoadStackView: UIStackView {

    private let imageView: UIImageView = {
        let photoImage: UIImage? = UIImage(systemName: "photo")
        let imageView: UIImageView = UIImageView(image: photoImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor,
                                          multiplier: imageView.frame.height/imageView.frame.width).isActive = true

        return imageView
    }()

    private let progressView: UIProgressView = {
        let progressView: UIProgressView = UIProgressView(progressViewStyle: .bar)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .systemGray3
        progressView.progress = 0.5

        return progressView
    }()

    private let fetchButton: UIButton = {
        let config = UIButton.Configuration.filled()
        let button: UIButton = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Load", for: .normal)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        [imageView, progressView, fetchButton].forEach { self.addArrangedSubview($0) }

        self.spacing = 5
        self.alignment = .center
        self.distribution = .fillEqually
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class View: UIView {

    let imageDownLoadStackView1: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)
    let imageDownLoadStackView2: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)
    let imageDownLoadStackView3: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)
    let imageDownLoadStackView4: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)
    let imageDownLoadStackView5: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)

    let imageAllLoadButton: UIButton = {
        let config = UIButton.Configuration.filled()
        let button: UIButton = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Load All Images", for: .normal)

        return button
    }()

    let verticalStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10

        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemBackground
        configureHierarchy()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHierarchy() {
        verticalStackView.addArrangedSubview(imageDownLoadStackView1)
        verticalStackView.addArrangedSubview(imageDownLoadStackView2)
        verticalStackView.addArrangedSubview(imageDownLoadStackView3)
        verticalStackView.addArrangedSubview(imageDownLoadStackView4)
        verticalStackView.addArrangedSubview(imageDownLoadStackView5)
        verticalStackView.addArrangedSubview(imageAllLoadButton)

        self.addSubview(verticalStackView)
    }
    private func configureLayout() {
        let margin: CGFloat = 10
        let safeArea = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin),
            verticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margin),
            verticalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin),
        ])
    }
}
