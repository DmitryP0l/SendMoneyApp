//
//  ContactListModels.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 26.11.24.
//

import Foundation

enum ContactList {
	enum Users {
		struct Request{ }
		struct Response {
			var users: [User]
		}
		struct ViewModel {
			struct DisplayedUser {
				var id: UUID
				var name: String
				var image: String
				var balance: Int
			}
			var displayedUsers: [DisplayedUser]
		}
	}
}
