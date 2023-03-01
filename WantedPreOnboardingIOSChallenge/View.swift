//
//  View.swift
//  WantedPreOnboardingIOSChallenge
//
//  Created by 맹선아 on 2023/03/01.
//

import UIKit

class View: UIView {

    private let firstImageView: UIImageView = {
        let photoImage: UIImage? = UIImage(systemName: "photo")
        let imageView: UIImageView = UIImageView(image: photoImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let progressView: UIProgressView = {
        let progressView: UIProgressView = UIProgressView(frame: .zero)
        progressView.translatesAutoresizingMaskIntoConstraints = false

        return progressView
    }()

    private let firstImageHorizontalStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .blue

        return stack
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
        firstImageHorizontalStackView.addArrangedSubview(firstImageView)
        self.addSubview(firstImageHorizontalStackView)
    }
    private func configureLayout() {
        let margin: CGFloat = 10
        let safeArea = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            firstImageHorizontalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin),
            firstImageHorizontalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margin),
            firstImageHorizontalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: margin),
        ])
    }
}
