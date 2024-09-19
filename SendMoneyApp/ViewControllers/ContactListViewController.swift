//
//  ContactListViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 12.09.24.
//


// добавить хэдер
// разобраться с поиском

import UIKit

final class ContactListViewController: UIViewController {
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов
	
	private let headerLabel: UILabel = {
		let label = UILabel()
		label.text = "Contacts"
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 24)
		return label
	}()
	
	private var contactListTableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .white
		tableView.rowHeight = 80
		tableView.separatorStyle = .none
		return tableView
	}()
	
	private lazy var searchController: UISearchController = {
			   let controller = UISearchController(searchResultsController: nil)
			   controller.searchResultsUpdater = self
			   controller.hidesNavigationBarDuringPresentation = true
			   return controller
		   }()

	private var contactsDataSource = [
		Contact(imageName: "person.fill", name: "Ivan Ivanov"),
		Contact(imageName: "person.fill", name: "Semen Semenov"),
		Contact(imageName: "person.fill", name: "Fedor Fedorov")
	]
	
	private var filteredContactsDataSource = [Contact]()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupScreen()
		setupSearchController()
	}
	
	
	// MARK: - Private methods
	
	///  Метод настройки всего экрана ContactListViewController. Назначение пустому массиву filteredContactsDataSource значений основного массива. Необходимо потому, что в начале, пока поле поиска пустое, эти массивы идентичны. в дальнейшем массив filteredContactsDataSource будет менять количество значений в зависимости от желаемого поиска и вводимых символов в поисковую строку
	private func setupScreen() {
		view.backgroundColor = .gray
		filteredContactsDataSource = contactsDataSource
		
		setupContactListTableView()
		setupHeaderLabel()
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
		contactListTableView.layer.cornerRadius = 12
	}
	/// Инициализация строки поиска
	private func setupSearchController() {
		contactListTableView.tableHeaderView = searchController.searchBar
	}
	
	///Инициализация и добавление хэдера
	private func setupHeaderLabel() {
		headerLabel.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 50)
		contactListTableView.tableHeaderView = headerLabel
	}
}

// MARK: - extension UITableViewDelegate, UITableViewDataSource
extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredContactsDataSource.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ContactListViewCell.identifier, for: indexPath) as! ContactListViewCell
		let contacts = contactsDataSource[indexPath.row]
		cell.profileImageView.image = UIImage(systemName: contacts.imageName)
		cell.nameLabel.text = contacts.name
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

//MARK: - extension UISearchResultsUpdating
extension ContactListViewController: UISearchResultsUpdating {
	
	func updateSearchResults(for searchController: UISearchController) {
		let searchText = searchController.searchBar.text ?? ""
		filteredContactsDataSource = searchText.isEmpty ? contactsDataSource : contactsDataSource.filter { $0.name.lowercased().contains(searchText.lowercased())}
		contactListTableView.reloadData()
	}
}
