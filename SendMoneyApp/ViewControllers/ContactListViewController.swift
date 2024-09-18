//
//  ContactListViewController.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 12.09.24.
//

import UIKit

final class ContactListViewController: UIViewController {
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов
	
	private var contactListTableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .lightGray
		tableView.rowHeight = 80
		tableView.separatorStyle = .none
		return tableView
	}()
	
	
	private var contactsData = [
		Contact(imageName: "person.fill", name: "Ivan Ivanov"),
		Contact(imageName: "person.fill", name: "Semen Semenov"),
		Contact(imageName: "person.fill", name: "Fedor Fedorov")
	]
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupScreen()
	}
	
	// MARK: - Private methods
	///  Метод настройки всего экрана регистрации
	private func setupScreen() {
		view.backgroundColor = .gray
		contactListTableView.delegate = self
		contactListTableView.dataSource = self
		contactListTableView.register(ContactListViewCell.self, forCellReuseIdentifier: ContactListViewCell.identifier)
		
		setupContactListTableView()
	}
	
	private func setupContactListTableView() {
		view.addSubview(contactListTableView)
		
		NSLayoutConstraint.activate([
			contactListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			contactListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			contactListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			contactListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		contactListTableView.layer.cornerRadius = 12
	}
}

// MARK: - extension UITableViewDelegate, UITableViewDataSource
extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return contactsData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ContactListViewCell.identifier, for: indexPath) as! ContactListViewCell
		let contacts = contactsData[indexPath.row]
		cell.profileImageView.image = UIImage(systemName: contacts.imageName)
		cell.nameLabel.text = contacts.name
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
