//
//  PersonalPageModels.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 3.12.24.
//

import Foundation

enum PersonalPage {
	enum UserData {
		struct Request {}
		struct Response {
			var user: User
		}
		struct ViewModel {
			var userName: String
			var balance: Int
		}
	}
	enum SendMoney {
		struct Request {
			var amount: Int
		}
	}
}
