//
//  HomePageViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 8.09.24.
//

	
import UIKit

final class HomePageViewController: UIViewController {
	
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
		tableView.backgroundColor = .lightGray
		tableView.rowHeight = 80
		tableView.separatorStyle = .none
		return tableView
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
	
	private let transactions = [
	Transaction(imageName: "person.fill", name: "Ivan Ivanov", amount: "12345"),
	Transaction(imageName: "person.fill", name: "Semen Semenov", amount: "21345"),
	Transaction(imageName: "person.fill", name: "Fedor Fedorov", amount: "65432")
	]
	
	// MARK: - Lifecycle
		
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(HomePageViewCell.self, forCellReuseIdentifier: HomePageViewCell.identifier)
		tableView.tableHeaderView = createTableHeaderView()
		setupScreen()
	}
	
	// MARK: - Private methods
	///  Метод настройки всего экрана регистрации
	private func setupScreen() {
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
	private func setupTableView() {
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: userInfoContainerView.bottomAnchor, constant: 8),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		tableView.layer.cornerRadius = 12
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
	
	// MARK: - Actions
	
	/// метод действия на тап по addMoneyButton. содержит анимацию изменения размера кнопки при нажатии на нее.
	@objc private func addMoneyButtonTapped(sender: UIButton) {
		print("addMoneyButtonTapped")
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
	}
	/// метод действия на тап по contactsButton. содержит анимацию изменения размера кнопки при нажатии на нее.
	@objc private func contactsButtonTapped(sender: UIButton) {
		print("contactsButtonTapped")
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
		let contactListVC = ContactListViewController()
		navigationController?.pushViewController(contactListVC, animated: true)
	}
	
}

// MARK: - extension UITableViewDelegate, UITableViewDataSource

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return transactions.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: HomePageViewCell.identifier, for: indexPath) as! HomePageViewCell
		let transaction = transactions[indexPath.row]
		cell.profileImageView.image = UIImage(systemName: transaction.imageName)
		cell.nameLabel.text = transaction.name
		cell.amountLabel.text = transaction.amount
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
