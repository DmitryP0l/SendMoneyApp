//
//  HomePageViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 8.09.24.
//

import UIKit

final class HomePageViewController: UIViewController {
	
	// MARK: - Internal properties
	var interactor: HomePageBussinessLogic?
	private var router: HomePageRoutingLogic?
	private var displayedTransactions: [HomePageModels.Transactions.ViewModel.DisplayedTransaction] = []
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов
	/// Views
	private var userInfoContainerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .lightGray
		return view
	}()
	
	private var tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .white
		tableView.rowHeight = 80
		tableView.separatorStyle = .none
		return tableView
	}()
	
	/// Labels
	private var userNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
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
		button.titleLabel?.adjustsFontSizeToFitWidth = true
		button.titleLabel?.minimumScaleFactor = 0.5
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
		
		setupUI()
		setupScene()
		fetchUserData()
		fetchTransactions()
	}
	// MARK: - Private methods UI
	/// Общий метод для настройки пользовательского интерфейса
	private func setupUI() {
		navigationItem.hidesBackButton = false //  убирает кнопку "назад" из навбара. в релизе - true
		view.backgroundColor = .darkGray
		setupUserInfoContainerView()
		setupTableView()
		setupUserNameLabel()
		setupCurrentBalanceLabel()
		setupTitleCurrentBalanceLabel()
		setupAddMoneyButton()
		setupContactsButton()
	}
	
	/// Метод настройки хедера для таблицы с текстовым полем
	private func createTableHeaderView() -> UIView {
		let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
		let titleLabel = UILabel()
		titleLabel.text = "last transactions"
		titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		headerView.addSubview(titleLabel)
		NSLayoutConstraint.activate([
			titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
		])
		return headerView
	}
	
	//MARK: - Setup constrains UI elements
	/// Настройка ограничений (constrains) для userInfoContainerView
	private func setupUserInfoContainerView() {
		view.addSubview(userInfoContainerView)
		
		NSLayoutConstraint.activate([
			userInfoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			userInfoContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			userInfoContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			userInfoContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
		])
		userInfoContainerView.layer.cornerRadius = 40
	}
	/// Настройка ограничений (constrains) для tableViewContainerView
	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(HomePageViewCell.self, forCellReuseIdentifier: HomePageViewCell.identifier)
		tableView.tableHeaderView = createTableHeaderView()
		
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: userInfoContainerView.bottomAnchor, constant: 8),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		tableView.layer.cornerRadius = 40
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
		addMoneyButton.addTarget(self, action: #selector(addMoneyButtonTapped), for: .touchUpInside)
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
		contactsButton.addTarget(self, action: #selector(contactsButtonTapped), for: .touchUpInside)
	}
	
	// MARK: - Private methods
	
	/// Метод для настройки связей между компонентами VIP цикла
	private func setupScene() {
		let viewController = self
		let interactor = HomePageInteractor(globalData: GlobalData())
		let presenter = HomePagePresenter()
		let router = HomePageRouter()
		
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController
		viewController.router = router
		router.viewController = viewController
	}
	
	/// Метод для запроса данных пользователя у interactor
	private func fetchUserData() {
		let request = HomePageModels.UserData.Request()
		interactor?.fetchUserData(request: request)
	}
	
	/// Метод для запроса данных о транзакциях у interactor
	private func fetchTransactions() {
		let request = HomePageModels.Transactions.Request()
		interactor?.fetchTransactions(request: request)
	}
	
	// MARK: - objc Actions
	/// метод отрабатывающий нажатие по addMoneyButton. содержит анимацию изменения размера кнопки при нажатии на нее. Создает и вызывает алерт контроллер, с полем ввода и цифровым типом клавиатуры. Передает данные в метод addMoney интерактора.
	@objc private func addMoneyButtonTapped() {
		let alertController = UIAlertController(
			title: "enter the amount to increase the balance",
			message: nil,
			preferredStyle: .alert)
		
		alertController.addTextField { textField in
			textField.placeholder = "enter"
			textField.keyboardType = .numberPad
		}
		
		let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
		let okAction = UIAlertAction(title: "ok", style: .default) { _ in
			if let amountText = alertController.textFields?.first?.text,
			   let amount = Int(amountText) {
				let request = HomePageModels.AddMoney.Request(amount: amount)
				self.interactor?.addMoney(request: request)
			}
		}
		alertController.addAction(cancelAction)
		alertController.addAction(okAction)
		
		present(alertController, animated: true)
	}
	
	/// Метод вызывает метод роутера на тап по кнопке contactsButton.
	@objc private func contactsButtonTapped() {
		router?.routeToContacts()
	}
}

// MARK: - extension HomePageDisplayLogic
extension HomePageViewController: HomePageDisplayLogic {
	/// Метод, отображающий данные пользователя
	func displayUserData(viewModel: HomePageModels.UserData.ViewModel) {
		userNameLabel.text = "Hello, \(viewModel.mainUserName)"
		currentBalanceLabel.text = "Balance \(viewModel.mainUserBalance)"
		tableView.reloadData()
	}
	
	/// Метод, отображающий список транзакций
	func displayTransactions(viewModel: HomePageModels.Transactions.ViewModel) {
		displayedTransactions = viewModel.displayedTransactions
		tableView.reloadData()
	}
}
// MARK: - extension UITableViewDelegate, UITableViewDataSource
extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return displayedTransactions.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: HomePageViewCell.identifier, for: indexPath) as! HomePageViewCell
		let transaction = displayedTransactions[indexPath.row]
		cell.transactionImageView.image = UIImage(systemName: "person.circle")
		cell.transactionNameLabel.text = transaction.description
		cell.transactionAmountLabel.text = String(transaction.amount)
		return cell
	}
}
	//важное
///  переделать контакты на  cleanSwift
/// сделать передачу средств между всеми контактами

/// разобраться с заполнением ячейки на главном экране, дополнить ярлыком даты, номером id транзакции, и тд
/// +создать массив с данными для заполнения по основной модели данных экрана с контактами и главного экрана
/// переделать генрацию массива на новый только для сторонних пользователей
/// основного пользователя брать из логина при вводе, генерировать ему уникальный idмпроверять со всеми пользователями
/// заполнять массив транзакций и передавать сгенерированный id операции долбавить метод для добавления в массив
///
