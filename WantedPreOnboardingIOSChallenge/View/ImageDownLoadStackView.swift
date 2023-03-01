//
//  ImageDownLoadStackView.swift
//  WantedPreOnboardingIOSChallenge
//
//  Created by 맹선아 on 2023/03/01.
//

import UIKit

final class ImageDownLoadStackView: UIStackView {

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

    private lazy var fetchButton: UIButton = {
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

    func changeImage(_ image: UIImage) {
        imageView.image = image
    }
}
