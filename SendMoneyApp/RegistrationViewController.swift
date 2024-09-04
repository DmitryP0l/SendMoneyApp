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
		label.text = "Log In"
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(60)
		label.numberOfLines = 0
		return label
	}()
	
	
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupScreen()
	}
	
	// MARK: - Private methods
	///  Метод настройки всего экрана регистрации
	private func setupScreen() {
		//navigationItem.hidesBackButton = true
		view.backgroundColor = .darkGray
		setupRegistrationViewContainer()
		setupLogInLabel()
	}
	/// Настройка ограничений (constrains) для registrationViewContainer
	private func setupRegistrationViewContainer() {
		view.addSubview(registrationViewContainer)
		
		NSLayoutConstraint.activate([
			registrationViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			registrationViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			registrationViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
			registrationViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
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
}
