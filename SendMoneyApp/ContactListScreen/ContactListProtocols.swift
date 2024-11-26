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

protocol ContactLisrRoutingLogic {
	func routeToPersonalPage(user: User)
}

protocol ContactListDataStore {
	var users: [User]? { get set }
}
