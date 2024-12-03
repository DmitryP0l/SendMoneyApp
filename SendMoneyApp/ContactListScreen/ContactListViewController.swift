//
//  ContactListViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 12.09.24.
//


import UIKit

final class ContactListViewController: UIViewController {
	// MARK: - Constants
	var interactor: ContactListBusinessLogic?
	var router: ContactListRoutingLogic?
	var displayedUsers: [ContactList.Users.ViewModel.DisplayedUser] = []
	//private var filteredDisplayedUsers = [ContactList.Users.ViewModel.DisplayedUser]()
	
	// MARK: - UI Constants
	/// инициализация и настройка UI элементов
	private let headerView: UIView = {
		let view = UIView()
		return view
	}()
	
	private var headerLabel: UILabel = {
		let label = UILabel()
		label.text = "Contacts"
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 24)
		return label
	}()
	
	private var searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.placeholder = "Search contacts"
		searchBar.sizeToFit()
		return searchBar
	}()
	
	private var contactListTableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .white
		tableView.rowHeight = 80
		tableView.separatorStyle = .none
		return tableView
	}()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		setupScene()
		fetchUsers()
	}
	
	// MARK: - Private methods
	
	///  Метод настройки всего экрана ContactListViewController. Назначение пустому массиву filteredContactsDataSource значений основного массива. Необходимо потому, что в начале, пока поле поиска пустое, эти массивы идентичны. в дальнейшем массив filteredContactsDataSource будет менять количество значений в зависимости от желаемого поиска и вводимых символов в поисковую строку
	private func setupUI() {
		view.backgroundColor = .gray
		setupContactListTableView()
		setupHeaderLabel()
		//setFilteredDisplayedUsers()
	}
	
	/// Настройка ограничений (constrains). Инициализация делегата, источника данных и регистрация ячейки для contactListTableView
	private func setupContactListTableView() {
		
		contactListTableView.delegate = self
		contactListTableView.dataSource = self
		contactListTableView.register(ContactListViewCell.self, forCellReuseIdentifier: ContactListViewCell.identifier)
		
		view.addSubview(contactListTableView)
		
		NSLayoutConstraint.activate([
			contactListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			contactListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			contactListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			contactListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		contactListTableView.layer.cornerRadius = 40
	}
	private func setupScene() {
		let viewController = self
		let interactor = ContactListInteractor(globalData: GlobalData())
		let presenter = ContactListPresenter()
		let router = ContactListRouter()
		
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController
		viewController.router = router
		router.viewController = viewController
	}
	
	///Инициализация и добавление хэдера
	private func setupHeaderLabel() {
		headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
		headerLabel.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 50)
		headerView.addSubview(headerLabel)
		
		searchBar.frame = CGRect(x: 0, y: 50, width: view.bounds.width, height: 50)
		searchBar.delegate = self
		headerView.addSubview(searchBar)
		
		contactListTableView.tableHeaderView = headerView
	}
	
	private func fetchUsers() {
		let request = ContactList.Users.Request()
		interactor?.fetchUsers(request: request)
	}
	
	private func setFilteredDisplayedUsers() {
		//filteredDisplayedUsers = displayedUsers
	}
}
// MARK: - extension ContactListDisplayLogic
extension ContactListViewController: ContactListDisplayLogic {
	func displayUsers(viewModel: ContactList.Users.ViewModel) {
		displayedUsers = viewModel.displayedUsers
		contactListTableView.reloadData()
	}
}

// MARK: - extension UITableViewDelegate, UITableViewDataSource
/// Метод определяющий количество ячеек.
extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return displayedUsers.count
	}
	/// Метод создания и настройки ячейки. Передача информации в поля ячейки из массива filteredContactsDataSource
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ContactListViewCell.identifier, for: indexPath) as! ContactListViewCell
		let contact = displayedUsers[indexPath.row]
		cell.personImageView.image = UIImage(systemName: contact.image)
		cell.personNameLabel.text = contact.name
		return cell
	}
//	///Метод определяющий действие по нажатию на ячейку. Снято нажатие. Реализован переход на PersonalPageViewController
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		
//		tableView.deselectRow(at: indexPath, animated: true)
//		
//		let detailContactVC = PersonalPageViewController()
//		detailContactVC.person = filteredDisplayedUsers
//		navigationController?.pushViewController(detailContactVC, animated: true)
//	}
}

//MARK: - extension UISearchResultsUpdating
extension ContactListViewController: UISearchBarDelegate {
	/// метод, отрабатывающий поиск по основному массиву контактов и наполняющий массив отфильтрованных контактов
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//		filteredDisplayedUsers = []
//		if searchText.isEmpty {
//			filteredDisplayedUsers = displayedUsers
//		} else {
//			filteredDisplayedUsers = displayedUsers.filter {
//				$0.name.lowercased().contains(searchText.lowercased())}
//		}
//		contactListTableView.reloadData()
	}
}
