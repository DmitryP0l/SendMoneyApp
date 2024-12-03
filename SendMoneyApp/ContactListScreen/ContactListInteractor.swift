//
//  ContactListInteractor.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 26.11.24.
//

import Foundation

final class ContactListInteractor: ContactListBusinessLogic, ContactListDataStore {
	var presenter: ContactListPresentationLogic?
	var globalData: GlobalData?
	
	var users: [User]?
	
	init(globalData: GlobalData) {
		self.globalData = globalData
		self.users = globalData.database.otherUsers
	}
	
	func fetchUsers(request: ContactList.Users.Request) {
		guard let users = users else { return }
		let response = ContactList.Users.Response(users: users)
		presenter?.presentUsers(response: response)
	}
	
	
	
	
}
