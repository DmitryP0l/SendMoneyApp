//
//  ContactListPresenter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 26.11.24.
//

import Foundation

final class ContactListPresenter: ContactListPresentationLogic {
	weak var viewController: ContactListDisplayLogic?
	
	func presentUsers(response: ContactList.Users.Response) {
		let displayUsers = response.users.map { user in
			ContactList.Users.ViewModel.DisplayedUser(name: user.name, image: user.image)
		}
		let viewModel = ContactList.Users.ViewModel(displayedUsers: displayUsers)
		viewController?.displayUsers(viewModel: viewModel)
	}
}
