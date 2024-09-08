//
//  RegistrationViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 3.09.24.
//

import UIKit

final class RegistrationViewController: UIViewController {
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов

	private var registrationViewContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	
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
	///  Регистрация уведомлений на появление/скрытие клавиатуры
	private func keyboardNotification() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	/// Настройка ограничений (constrains) для registrationViewContainer
	private func setupRegistrationViewContainer() {
		view.addSubview(registrationViewContainer)
		
		NSLayoutConstraint.activate([
			registrationViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			registrationViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			registrationViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
			registrationViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
		])
		
		registrationViewContainer.layer.cornerRadius = 60
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
	
	///Настройка ограничений (constrains) для enterButton
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
	
	// MARK: - Actions
	///  методы, отрабатывающие по нотификации на появление и скрытие клавиатуры, и изменяющие размер self.view
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
	/// метод содержит анимацию изменения размера кнопки при нажатии на нее. Переход на HomePageViewController через NavigationController
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
		
		let homePageVC = HomePageViewController()
		navigationController?.pushViewController(homePageVC, animated: true)
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}
