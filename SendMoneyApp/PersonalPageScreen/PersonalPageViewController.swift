//
//  PersonalPageViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 24.09.24.
//

import UIKit

final class PersonalPageViewController: UIViewController {
	
	// MARK: - Constants
	private var interactor: PersonalPageBusinessLogic?
	private var router: PersonalPageDataPassing?
	private var user: User?
	
	// MARK: - Constants UI
	/// инициализация и настройка UI элементов
	private var personInfoContainerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	
	private let personImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		imageView.layer.borderWidth = 2
		imageView.layer.borderColor = UIColor.white.cgColor
		return imageView
	}()
	
	private var personNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.textColor = .white
		label.font = label.font.withSize(30)
		label.numberOfLines = 0
		return label
	}()
	
	private var titleCurrentBalanceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Current balance is"
		label.textAlignment = .center
		label.textColor = .white
		label.font = label.font.withSize(18)
		label.numberOfLines = 0
		return label
	}()
	
	private var currentBalanceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "100.000"
		label.textAlignment = .center
		label.textColor = .white
		label.font = label.font.withSize(36)
		label.numberOfLines = 0
		return label
	}()
	
	private var sendMoneyButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.setTitle("Send money", for: .normal)
		button.setTitleColor(.darkGray, for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.titleLabel?.minimumScaleFactor = 0.5
		button.layer.cornerRadius = 12
		return button
	}()
	
	private var requestMoneyButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.setTitle("Request money", for: .normal)
		button.setTitleColor(.darkGray, for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.titleLabel?.minimumScaleFactor = 0.5
		button.layer.cornerRadius = 12
		return button
	}()
	
	// MARK: - init
	init(user: User) {
		super.init(nibName: nil, bundle: nil)
		self.user = user
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupScreen()
		setupScene()
		fetchUserData()
	}
	// MARK: - Private methods
	///  Метод настройки всего экрана регистрации
	private func setupScreen() {
		view.backgroundColor = .gray
		setupPersonInfoContainerView()
		setupPersonImageView()
		setupPersonNameLabel()
		setupTitleCurrentBalanceLabel()
		setupCurrentBalanceLabel()
		setupSendMoneyButton()
		setupRequestMoneyButton()
	}
	
	private func setupScene() {
		let viewController = self
		let interactor = PersonalPageInteractor(globalData: GlobalData())
		let presenter = PersonalPagePresenter()
		let router = PersonalPageRouter()
		
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController
		viewController.router = router
		router.viewController = viewController
	}
	
	// MARK: - Setup constrains UI Elements
	/// Настройка ограничений (constrains) для userInfoContainerView
	private func setupPersonInfoContainerView() {
		view.addSubview(personInfoContainerView)
		
		NSLayoutConstraint.activate([
			personInfoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			personInfoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			personInfoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			personInfoContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		personInfoContainerView.layer.cornerRadius = 40
	}
	/// Настройка ограничений (constrains) для personImageView.
	private func setupPersonImageView() {
		personInfoContainerView.addSubview(personImageView)
		if let user = user {
			personImageView.image = UIImage(systemName: user.image)
		}
		NSLayoutConstraint.activate([
			personImageView.topAnchor.constraint(equalTo: personInfoContainerView.topAnchor, constant: 130),
			personImageView.centerXAnchor.constraint(equalTo: personInfoContainerView.centerXAnchor),
			personImageView.heightAnchor.constraint(equalToConstant: 200),
			personImageView.widthAnchor.constraint(equalToConstant: 200)
		])
		personImageView.layer.cornerRadius = 100
	}
	
	/// Настройка ограничений (constrains) для personNameLabel.
	private func setupPersonNameLabel() {
		personInfoContainerView.addSubview(personNameLabel)
		if let user = user {
			personNameLabel.text = user.name
		}
		NSLayoutConstraint.activate([
			personNameLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 24),
			personNameLabel.centerXAnchor.constraint(equalTo: personInfoContainerView.centerXAnchor)
		])
	}
	/// Настройка ограничений (constrains) для titleCurrentBalanceLabel.
	private func setupTitleCurrentBalanceLabel() {
		personInfoContainerView.addSubview(titleCurrentBalanceLabel)
		
		NSLayoutConstraint.activate([
			titleCurrentBalanceLabel.topAnchor.constraint(equalTo: personNameLabel.bottomAnchor, constant: 24),
			titleCurrentBalanceLabel.centerXAnchor.constraint(equalTo: personInfoContainerView.centerXAnchor)
		])
	}
	/// Настройка ограничений (constrains) для currentBalanceLabel.
	private func setupCurrentBalanceLabel() {
		personInfoContainerView.addSubview(currentBalanceLabel)
		
		if let user = user {
			currentBalanceLabel.text = String(user.balance)
		}
		
		NSLayoutConstraint.activate([
			currentBalanceLabel.topAnchor.constraint(equalTo: titleCurrentBalanceLabel.bottomAnchor, constant: 14),
			currentBalanceLabel.centerXAnchor.constraint(equalTo: personInfoContainerView.centerXAnchor)
		])
	}
	/// Настройка ограничений (constrains) для sendMoneyButton с адаптивными размерами
	private func setupSendMoneyButton() {
		personInfoContainerView.addSubview(sendMoneyButton)
		
		NSLayoutConstraint.activate([
			sendMoneyButton.leadingAnchor.constraint(equalTo: personInfoContainerView.leadingAnchor, constant: view.frame.width * 0.05),
			sendMoneyButton.bottomAnchor.constraint(equalTo: personInfoContainerView.bottomAnchor, constant: -40),
			sendMoneyButton.widthAnchor.constraint(equalTo: personInfoContainerView.widthAnchor, multiplier: 0.4),
			sendMoneyButton.heightAnchor.constraint(equalTo: sendMoneyButton.widthAnchor, multiplier: 0.4)
		])
		sendMoneyButton.addTarget(self, action: #selector(sendMoneyButtonTapped), for: .touchUpInside)
	}
	/// Настройка ограничений (constrains) для requestMoneyButton с адаптивными размерами
	private func setupRequestMoneyButton() {
		personInfoContainerView.addSubview(requestMoneyButton)
		
		NSLayoutConstraint.activate([
			requestMoneyButton.trailingAnchor.constraint(equalTo: personInfoContainerView.trailingAnchor, constant: -view.frame.width * 0.05),
			requestMoneyButton.bottomAnchor.constraint(equalTo: personInfoContainerView.bottomAnchor, constant: -40),
			requestMoneyButton.widthAnchor.constraint(equalTo: personInfoContainerView.widthAnchor, multiplier: 0.4),
			requestMoneyButton.heightAnchor.constraint(equalTo: requestMoneyButton.widthAnchor, multiplier: 0.4)
		])
		requestMoneyButton.addTarget(self, action: #selector(requestMoneyButtonTapped), for: .touchUpInside)
	}
	
	private func fetchUserData() {
		let request = PersonalPage.UserData.Request()
		interactor?.fetchUserData(request: request)
	}
	// MARK: - objc Actions
	/// Метод отрабатывающий нажатие на sendMoneyButton. Создает и вызывает алерт контроллер, с полем ввода и цифровым типом клавиатуры
	@objc private func sendMoneyButtonTapped() {
		let alertController = UIAlertController(title: "enter the amount to transfer", message: nil, preferredStyle: .alert)
		
		alertController.addTextField { textField in
			textField.placeholder = "enter"
			textField.keyboardType = .numberPad
		}
		
		let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
		let okAction = UIAlertAction(title: "ok", style: .default, handler: { [weak self] _ in
			guard let self = self else { return }
			if let amountText = alertController.textFields?.first?.text, let amount = Int(amountText) {
				let request = PersonalPage.SendMoney.Request(amount: amount)
				self.interactor?.sendMoney(request: request)
			}
		})
		alertController.addAction(cancelAction)
		alertController.addAction(okAction)
		
		present(alertController, animated: true)
	}

	/// Метод отрабатывающий нажатие на requestMoneyButton. Создает и вызывает алерт контроллер, с полем ввода и цифровым типом клавиатуры
	@objc private func requestMoneyButtonTapped() {
		let alertController = UIAlertController(title: "enter the amount to request", message: nil, preferredStyle: .alert)
		
		alertController.addTextField { textField in
			textField.placeholder = "enter"
			textField.keyboardType = .numberPad
		}
		
		let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
		let okAction = UIAlertAction(title: "ok", style: .default) { _ in
			if let textField = alertController.textFields?.first, let text = textField.text {
				print(text)
			}
		}
		alertController.addAction(cancelAction)
		alertController.addAction(okAction)
		
		present(alertController, animated: true)
	}
}

extension PersonalPageViewController: PersonalPageDisplayLogic {
	func displayUserData(viewModel: PersonalPage.UserData.ViewModel) {
		personNameLabel.text = viewModel.userName
		currentBalanceLabel.text = "\(viewModel.balance)"
	}
}
//  реализовать переход на personal Page
// проверить роутер в контакт лист для передач
//  проверить реализацию отправки денег другому юзеру, если ок реализовать запрос у юзера
