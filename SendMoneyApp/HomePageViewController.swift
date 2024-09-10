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
	
	private var userNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Hello User"
		label.textAlignment = .left
		label.textColor = .white
		label.font = label.font.withSize(30)
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
		navigationItem.hidesBackButton = false //  убирает кнопку "назад" из навбара. в релизе - true
		view.backgroundColor = .darkGray
		setupUserInfoContainerView()
		setupTableViewContainerView()
		setupUserNameLabel()
		
		
	}
	/// Настройка ограничений (constrains) для setupUserInfoContainerView
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
	/// Настройка ограничений (constrains) для setupTableViewContainerView
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
	
	private func setupUserNameLabel() {
		userInfoContainerView.addSubview(userNameLabel)
		
		NSLayoutConstraint.activate([
			userNameLabel.topAnchor.constraint(equalTo: userInfoContainerView.topAnchor, constant: 16),
			userNameLabel.leadingAnchor.constraint(equalTo: userInfoContainerView.leadingAnchor, constant: 16)
		])
		
	}
	// MARK: - Actions
}
