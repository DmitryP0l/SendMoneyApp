//
//  HomePageViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 8.09.24.
//

import UIKit

class HomePageViewController: UIViewController {
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов
	
	/// Views
	private var userInfoContainerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	
	private var tableViewContainerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	
	/// Labels
	private var userNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Hello User"
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(24)
		label.numberOfLines = 0
		return label
	}()
	
	private var titleCurrentBalanceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Your Current balance is"
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(14)
		label.numberOfLines = 0
		return label
	}()
	
	private var currentBalanceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "100.000"
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(36)
		label.numberOfLines = 0
		return label
	}()
	
	/// Buttons
	private var addMoneyButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.setTitle("Add money", for: .normal)
		button.setTitleColor(.darkGray, for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.layer.cornerRadius = 12
		return button
	}()
	
	private var contactsButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.setTitle("Contacts", for: .normal)
		button.setTitleColor(.darkGray, for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.titleLabel?.minimumScaleFactor = 0.5
		button.layer.cornerRadius = 12
		return button
	}()
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupScreen()
	}
	
	// MARK: - Private methods
	///  Метод настройки всего экрана регистрации
	private func setupScreen() {
		navigationItem.hidesBackButton = false //  убирает кнопку "назад" из навбара. в релизе - true
		view.backgroundColor = .darkGray
		setupUserInfoContainerView()
		setupTableViewContainerView()
		setupUserNameLabel()
		setupCurrentBalanceLabel()
		setupTitleCurrentBalanceLabel()
		setupAddMoneyButton()
		setupContactsButton()
	}
	
	// MARK: - Setup constrains
	/// Настройка ограничений (constrains) для userInfoContainerView
	private func setupUserInfoContainerView() {
		view.addSubview(userInfoContainerView)
		
		NSLayoutConstraint.activate([
			userInfoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			userInfoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
			userInfoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			userInfoContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
		])
		userInfoContainerView.layer.cornerRadius = 12
	}
	/// Настройка ограничений (constrains) для tableViewContainerView
	private func setupTableViewContainerView() {
		view.addSubview(tableViewContainerView)
		
		NSLayoutConstraint.activate([
			tableViewContainerView.topAnchor.constraint(equalTo: userInfoContainerView.bottomAnchor, constant: 8),
			tableViewContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
			tableViewContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			tableViewContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		tableViewContainerView.layer.cornerRadius = 12
		
	}
	
	/// Настройка ограничений (constrains) для userNameLabel
	private func setupUserNameLabel() {
		userInfoContainerView.addSubview(userNameLabel)
		
		NSLayoutConstraint.activate([
			userNameLabel.topAnchor.constraint(equalTo: userInfoContainerView.topAnchor, constant: 16),
			userNameLabel.leadingAnchor.constraint(equalTo: userInfoContainerView.leadingAnchor, constant: 24)
		])
	}
	
	/// Настройка ограничений (constrains) для titleCurrentBalanceLabel
	private func setupTitleCurrentBalanceLabel() {
		userInfoContainerView.addSubview(titleCurrentBalanceLabel)
		
		NSLayoutConstraint.activate([
			titleCurrentBalanceLabel.bottomAnchor.constraint(equalTo: currentBalanceLabel.topAnchor, constant: -12),
			titleCurrentBalanceLabel.leadingAnchor.constraint(equalTo: userInfoContainerView.leadingAnchor, constant: 24)
		])
	}
	
	/// Настройка ограничений (constrains) для currentBalanceLabel
	private func setupCurrentBalanceLabel() {
		userInfoContainerView.addSubview(currentBalanceLabel)
		
		NSLayoutConstraint.activate([
			currentBalanceLabel.centerYAnchor.constraint(equalTo: userInfoContainerView.centerYAnchor),
			currentBalanceLabel.leadingAnchor.constraint(equalTo: userInfoContainerView.leadingAnchor, constant: 24)
		])
	}
	/// Настройка ограничений (constrains) для addMoneyButton с адаптивными размерами
	private func setupAddMoneyButton() {
		userInfoContainerView.addSubview(addMoneyButton)
		
		NSLayoutConstraint.activate([
			addMoneyButton.leadingAnchor.constraint(equalTo: userInfoContainerView.leadingAnchor, constant: view.frame.width * 0.05),
			addMoneyButton.bottomAnchor.constraint(equalTo: userInfoContainerView.bottomAnchor, constant: -24),
			addMoneyButton.widthAnchor.constraint(equalTo: userInfoContainerView.widthAnchor, multiplier: 0.4),
			addMoneyButton.heightAnchor.constraint(equalTo: userInfoContainerView.heightAnchor, multiplier: 0.2)
		])
	}
	/// Настройка ограничений (constrains) для contactsButton с адаптивными размерами
	private func setupContactsButton() {
		userInfoContainerView.addSubview(contactsButton)
		
		NSLayoutConstraint.activate([
			contactsButton.leadingAnchor.constraint(equalTo: addMoneyButton.trailingAnchor, constant: view.frame.width * 0.05),
			contactsButton.trailingAnchor.constraint(equalTo: userInfoContainerView.trailingAnchor, constant: -view.frame.width * 0.05),
			contactsButton.bottomAnchor.constraint(equalTo: userInfoContainerView.bottomAnchor, constant: -24),
			contactsButton.widthAnchor.constraint(equalTo: userInfoContainerView.widthAnchor, multiplier: 0.4),
			contactsButton.heightAnchor.constraint(equalTo: userInfoContainerView.heightAnchor, multiplier: 0.2)
		])
	}
	
	// MARK: - Actions
}
