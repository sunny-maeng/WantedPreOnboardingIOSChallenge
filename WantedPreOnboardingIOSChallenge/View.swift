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

        return imageView
    }()

    private let progressView: UIProgressView = {
        let progressView: UIProgressView = UIProgressView(progressViewStyle: .bar)
        progressView.progress = 0.5
        progressView.trackTintColor = .systemGray3
        progressView.translatesAutoresizingMaskIntoConstraints = false

        return progressView
    }()

    private let fetchButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        button.setTitle("Load", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addArrangedSubview(imageView)
        self.addArrangedSubview(progressView)
        self.addArrangedSubview(fetchButton)

        self.spacing = 10
        self.alignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class View: UIView {

    let firstImageDownLoadStackView: ImageDownLoadStackView = ImageDownLoadStackView(frame: .zero)

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

        self.addSubview(firstImageDownLoadStackView)
    }
    private func configureLayout() {
        let margin: CGFloat = 10
        let safeArea = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            firstImageDownLoadStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin),
            firstImageDownLoadStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margin),
            firstImageDownLoadStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin),
        ])
    }
}
