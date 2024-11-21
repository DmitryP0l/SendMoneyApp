//
//  HomePageRouter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// отвечает за навигацию и передачу данных между экранами

import UIKit

/// Класс, реализующий протокол HomePageRoutingLogic для перехода на ContactListViewController
final class HomePageRouter: HomePageRoutingLogic {
	weak var viewController: UIViewController?
	
	/// Метод для перехода на экран списка контактов
	func routeToContacts() {
		let contactListVC = ContactListViewController()
		viewController?.navigationController?.pushViewController(contactListVC, animated: true)
	}
}
