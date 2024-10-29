//
//  WelcomeScreenViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 20.08.24.
//
// отвечает за отображение данных и обработку пользовательских действий

import UIKit

/// протокол, определяющий методы для отображения данных в WelcomeViewController
protocol WelcomeDisplayLogic: AnyObject {
	func displayRegistrationScreen()
}

final class WelcomeScreenViewController: UIViewController {

	// MARK: - Internal properties
	
	var interactor: WelcomeScreenBusinessLogic?
	
	// MARK: - Private properties
	
	/// вью контейнер для UILabel и UIButton,и для визуального выделения
	private var startingViewContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	/// текст приветствия
	private let welcomeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Welcome to Send Money App"
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(60)
		label.numberOfLines = 0
		return label
	}()
	/// информационный текст
	private let informationLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Transfer money that is easier."
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(28)
		label.numberOfLines = 0
		return label
	}()
	/// кнопка перехода на следующую страницу
	private let startButton: UIButton = {
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
		setupViews()
		setupScene()
	}
	
	// MARK: - Private methods
	
	///  Метод настройки всего экрана приветствия
	private func setupViews() {
		view.backgroundColor = .darkGray
		setupWelcomeLabel()
		setupStartingViewContainer()
		setupInformationLabel()
		setupStartButton()
	}
	
	private func setupScene() {
		let viewController = self
		let interactor = WelcomeScreenInteractor()
		let presenter = WelcomeScreenPresenter()
		let router = WelcomeScreenRouter()
		
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
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
		startingViewContainer.layer.cornerRadius = 40
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
	
	// MARK: - objc Actions
	@objc private func buttonTapped() {
		interactor?.startButtonTapped()
	}
}

// MARK: - extension WelcomeDisplayLogic

extension WelcomeScreenViewController: WelcomeDisplayLogic {
	
	/// метод вызывается презентером для отображения следующего экрана
	func displayRegistrationScreen() {
		let router = WelcomeScreenRouter()
		router.viewController = self
		router.routeToRegistrationScreen()
	}
}
