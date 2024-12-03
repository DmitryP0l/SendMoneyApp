//
//  ContactListRouter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 26.11.24.
//

import UIKit

final class ContactListRouter: ContactListRoutingLogic, ContactListDataPassing {
	weak var viewController: UIViewController?
	var DataStore: ContactListDataStore?
	
	func routeToPersonalPage(user: User) {
		let personalPageVC = PersonalPageViewController()  /// здесь прописать  перенос данных
		viewController?.navigationController?.pushViewController(personalPageVC, animated: true)
	}
}
