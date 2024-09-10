//
//  WelcomeViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 20.08.24.
//

import UIKit

final class WelcomeViewController: UIViewController {
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов
	private var startingViewContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	
	private var welcomeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Welcome to Send Money App"
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(60)
		label.numberOfLines = 0
		return label
	}()
	
	private var informationLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Transfer money that is easier."
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(28)
		label.numberOfLines = 0
		return label
	}()
	
	private var startButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.setTitle("Start Banking", for: .normal)
		button.setTitleColor(.darkGray, for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.layer.cornerRadius = 12
		return button
	}()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupScreen()
	}
	
	// MARK: - Private methods
	///  Метод настройки всего экрана приветствия
	private func setupScreen() {
		view.backgroundColor = .darkGray
		setupWelcomeLabel()
		setupStartingViewContainer()
		setupInformationLabel()
		setupStartButton()
	}
	
	// MARK: - Setup constrains
	/// Настройка ограничений (constrains) для welcomeLabel
	private func setupWelcomeLabel() {
		
		view.addSubview(welcomeLabel)
		
		NSLayoutConstraint.activate([
			welcomeLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
			welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
		])
	}
	
	/// Настройка ограничений (constrains) для startingViewContainer
	private func setupStartingViewContainer() {
		view.addSubview(startingViewContainer)
		
		NSLayoutConstraint.activate([
			startingViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			startingViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			startingViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
			startingViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
		])
		startingViewContainer.layer.cornerRadius = 60
		startingViewContainer.layer.maskedCorners = [.layerMaxXMinYCorner]
	}
	
	/// Настройка ограницений (constrains) для informationLabel
	private func setupInformationLabel() {
		startingViewContainer.addSubview(informationLabel)
		
		NSLayoutConstraint.activate([
			informationLabel.topAnchor.constraint(equalTo: startingViewContainer.topAnchor, constant: 20),
			informationLabel.leadingAnchor.constraint(equalTo: startingViewContainer.leadingAnchor, constant: 20),
			informationLabel.trailingAnchor.constraint(equalTo: startingViewContainer.trailingAnchor, constant: -20)
		])
	}
	
	/// Настройка ограницений (constrains) для startButton
	private func setupStartButton() {
		startingViewContainer.addSubview(startButton)
		
		NSLayoutConstraint.activate([
			startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			startButton.bottomAnchor.constraint(equalTo: startingViewContainer.bottomAnchor, constant: -40),
			startButton.widthAnchor.constraint(equalToConstant: 200),
			startButton.heightAnchor.constraint(equalToConstant: 50)
		])
		startButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}
	
	// MARK: - Actions
	/// метод содержит анимацию изменения размера кнопки при нажатии на нее. Переход на RegistrationViewController через NavigationController
	@objc private func buttonTapped(sender: UIButton) {
		UIView.animate(
			withDuration: 0.1,
			animations: {
				sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
			},
			completion: { _ in
				UIView.animate(withDuration: 0.1) {
					sender.transform = CGAffineTransform.identity
				}
			})
		
		let registrationVC = RegistrationViewController()
		navigationController?.pushViewController(registrationVC, animated: true)
	}
}

