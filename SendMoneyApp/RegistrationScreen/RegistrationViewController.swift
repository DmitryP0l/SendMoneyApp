//
//  RegistrationViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 3.09.24.
//

import UIKit

/// Протокол определяющий методы для отображения данных в RegistrationViewController
protocol RegistrationDisplayLogic: AnyObject {
	func displayHomePage()
	func displayAlert(viewModel: RegistrationModels.EnterCredentials.ViewModel)
}

final class RegistrationViewController: UIViewController {
	
	// MARK: - Internal properties
	
	var interactor: RegistrationBusinessLogic?
	
	// MARK: - Private properties
	
	/// вью контейнер для UILabel и UIButton,и для визуального выделения
	private var registrationViewContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	/// текст "log in"
	private var logInLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Log in"
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(60)
		label.numberOfLines = 0
		return label
	}()
	/// поле ввода логина
	private var logInTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Login"
		textField.textColor = .darkGray
		textField.font = UIFont.systemFont(ofSize: 16)
		textField.textAlignment = .center
		textField.borderStyle = .roundedRect
		textField.keyboardType = .default
		textField.returnKeyType = .continue
		textField.clearButtonMode = .whileEditing
		return textField
	}()
	/// поле ввода пароля
	private var passwordTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Password"
		textField.textColor = .darkGray
		textField.font = UIFont.systemFont(ofSize: 16)
		textField.textAlignment = .center
		textField.borderStyle = .roundedRect
		textField.keyboardType = .default
		textField.returnKeyType = .done
		textField.clearButtonMode = .whileEditing
		return textField
	}()
	/// кнопка ввода логин/пароль и перехода на следующий экран HomePage
	private var enterButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.setTitle("Enter", for: .normal)
		button.setTitleColor(.darkGray, for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.layer.cornerRadius = 12
		return button
	}()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupScene()
		setupScreen()
		keyboardNotification()
	}
	
	// MARK: - Private methods
	///  Метод настройки всего экрана регистрации
	private func setupScreen() {
		navigationItem.hidesBackButton = false //  убирает кнопку "назад" из навбара. в релизе - true
		view.backgroundColor = .darkGray
		setupRegistrationViewContainer()
		setupLogInLabel()
		setupLogInTextField()
		setupPasswordTextField()
		setupEnterButton()
	}
	private func setupScene() {
		let viewController = self
		let interactor = RegistrationInteractor()
		let presenter = RegistrationPresenter()
		let router = RegistrationRouter()
		
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
	}
	
	// MARK: - Setup constrains
	/// Настройка ограничений (constrains) для registrationViewContainer
	private func setupRegistrationViewContainer() {
		view.addSubview(registrationViewContainer)
		
		NSLayoutConstraint.activate([
			registrationViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			registrationViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			registrationViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
			registrationViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
		])
		
		registrationViewContainer.layer.cornerRadius = 40
		registrationViewContainer.layer.maskedCorners = [.layerMinXMinYCorner]
	}
	/// Настройка ограничений (constrains) для logInLabel
	private func setupLogInLabel() {
		view.addSubview(logInLabel)
		
		NSLayoutConstraint.activate([
			logInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			logInLabel.bottomAnchor.constraint(equalTo: registrationViewContainer.topAnchor, constant: -20)
		])
	}
	
	/// Настройка ограничений (constrains) для loginTextField
	private func setupLogInTextField() {
		registrationViewContainer.addSubview(logInTextField)
		
		NSLayoutConstraint.activate([
			logInTextField.centerXAnchor.constraint(equalTo: registrationViewContainer.centerXAnchor),
			logInTextField.topAnchor.constraint(equalTo: registrationViewContainer.topAnchor, constant: 40),
			logInTextField.widthAnchor.constraint(equalToConstant: 300),
			logInTextField.heightAnchor.constraint(equalToConstant: 40)
		])
		logInTextField.layer.cornerRadius = 20
		logInTextField.clipsToBounds = true
	}
	
	/// Настройка ограничений (constrains) для passwordTextField
	private func setupPasswordTextField() {
		registrationViewContainer.addSubview(passwordTextField)
		
		NSLayoutConstraint.activate([
			passwordTextField.centerXAnchor.constraint(equalTo: registrationViewContainer.centerXAnchor),
			passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor, constant: 20),
			passwordTextField.widthAnchor.constraint(equalToConstant: 300),
			passwordTextField.heightAnchor.constraint(equalToConstant: 40)
		])
		passwordTextField.layer.cornerRadius = 20
		passwordTextField.clipsToBounds = true
	}
	
	/// Настройка ограничений (constrains) для enterButton
	private func setupEnterButton() {
		registrationViewContainer.addSubview(enterButton)
		
		NSLayoutConstraint.activate([
			enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			enterButton.bottomAnchor.constraint(equalTo: registrationViewContainer.bottomAnchor, constant: -40),
			enterButton.widthAnchor.constraint(equalToConstant: 200),
			enterButton.heightAnchor.constraint(equalToConstant: 50)
		])
		enterButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}
	
	/// Регистрация уведомлений на появление/скрытие клавиатуры
	private func keyboardNotification() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	// MARK: - objc Actions
	/// Методы, отрабатывающие по нотификации на появление и скрытие клавиатуры, и изменяющие размер self.view
	@objc private func keyboardWillShow(notification: Notification) {
		guard let userInfo = notification.userInfo else {return}
		guard let keyboardSize = userInfo[RegistrationViewController.keyboardFrameEndUserInfoKey] as? NSValue else {return}
		let keyboardFrame = keyboardSize.cgRectValue
		if self.view.frame.origin.y == 0 {
			self.view.frame.origin.y -= keyboardFrame.height
		}
	}
	
	@objc private func keyboardWillHide(notification: Notification) {
		if self.view.frame.origin.y != 0 {
			self.view.frame.origin.y = 0
		}
	}
	/// Метод действия на тап по enterButton. содержит анимацию изменения размера кнопки при нажатии на нее. Переход на HomePageViewController через NavigationController
	@objc private func buttonTapped() {
		let request = RegistrationModels.EnterCredentials.Request(
			login: logInTextField.text,
			password: passwordTextField.text)
		
		interactor?.enterButtonTapped(request: request)
	}
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}

// MARK: - extension RegistrationDisplayLogic
extension RegistrationViewController: RegistrationDisplayLogic {
	
	/// Метод вызывается презентером для отображения следующего экрана HomePage Screen
	func displayHomePage() {
		let router = RegistrationRouter()
		router.viewController = self
		router.routeToHomePage()
	}
	
	/// Метод вызывается презентером для отображения сообщения об ошибке
	func displayAlert(viewModel: RegistrationModels.EnterCredentials.ViewModel) {
		let alert = UIAlertController(title: "Error", message: viewModel.message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .default))
		present(alert, animated: true)
	}
}
