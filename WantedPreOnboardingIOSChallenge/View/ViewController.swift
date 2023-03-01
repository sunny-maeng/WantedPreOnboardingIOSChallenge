//
//  ViewController.swift
//  WantedPreOnboardingIOSChallenge
//
//  Created by 맹선아 on 2023/03/01.
//

import UIKit

final class ViewController: UIViewController {

    private let viewModel: ViewModel = ViewModel()
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
        bindViewModel()
        addActionToLoadButton()
        addActionToLoadAllImageButton()
    }

    private func bindViewModel() {
        viewModel.updateImage1 = { [weak self] image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self?.imageDownLoadStackView1.imageView.image = image
            }
        }

        viewModel.updateImage2 = { [weak self] image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self?.imageDownLoadStackView2.imageView.image = image
            }
        }

        viewModel.updateImage3 = { [weak self] image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self?.imageDownLoadStackView3.imageView.image = image
            }
        }

        viewModel.updateImage4 = { [weak self] image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self?.imageDownLoadStackView4.imageView.image = image
            }
        }

        viewModel.updateImage5 = { [weak self] image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self?.imageDownLoadStackView5.imageView.image = image
            }
        }
    }

    private func generateLoadButtonAction(buttonNumber: Int) -> UIAction {
        return UIAction { [weak self] _ in
            self?.viewModel.placeDefaultImage(number: buttonNumber)
            self?.viewModel.loadImage(number: buttonNumber)
        }
    }

    private func addActionToLoadButton() {
        imageDownLoadStackView1.loadㅣButton.addAction(generateLoadButtonAction(buttonNumber: 1), for: .touchUpInside)
        imageDownLoadStackView2.loadㅣButton.addAction(generateLoadButtonAction(buttonNumber: 2), for: .touchUpInside)
        imageDownLoadStackView3.loadㅣButton.addAction(generateLoadButtonAction(buttonNumber: 3), for: .touchUpInside)
        imageDownLoadStackView4.loadㅣButton.addAction(generateLoadButtonAction(buttonNumber: 4), for: .touchUpInside)
        imageDownLoadStackView5.loadㅣButton.addAction(generateLoadButtonAction(buttonNumber: 5), for: .touchUpInside)
    }

    private func addActionToLoadAllImageButton() {
        let action: UIAction = UIAction { [weak self] _ in
            self?.viewModel.loadAllImage()
        }

        imageAllLoadButton.addAction(action, for: .touchUpInside)
    }

}

extension ViewController {

    final class ImageDownLoadStackView: UIStackView {

        fileprivate let imageView: UIImageView = {
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

        fileprivate lazy var loadㅣButton: UIButton = {
            let config = UIButton.Configuration.filled()
            let button: UIButton = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Load", for: .normal)

            return button
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            [imageView, progressView, loadㅣButton].forEach { self.addArrangedSubview($0) }

            self.spacing = 5
            self.alignment = .center
            self.distribution = .fillEqually
            self.translatesAutoresizingMaskIntoConstraints = false
        }

        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
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
