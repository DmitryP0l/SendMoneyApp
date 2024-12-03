//
//  ContactListProtocols.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 26.11.24.
//

import Foundation

protocol ContactListDisplayLogic: AnyObject {
	func displayUsers(viewModel: ContactList.Users.ViewModel)
}

protocol ContactListBusinessLogic {
	func fetchUsers(request: ContactList.Users.Request)
}

protocol ContactListPresentationLogic {
	func presentUsers(response: ContactList.Users.Response)
}

protocol ContactListRoutingLogic {
	func routeToPersonalPage(user: User)
}

protocol ContactListDataPassing {
	var DataStore: ContactListDataStore? { get }
}

protocol ContactListDataStore {
	var users: [User]? { get set }
}
