//
//  HomePageModels.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// отвечает за модели данных передаваемых между компонентами VIP цикла

/// Request - данные, передаваемые из ViewController в Interactor
/// Response - данные, передаваемые из Interactor в Presenter
/// ViewModel - данные, передаваемые из Presenter обратно во ViewController

import Foundation

struct HomePageModels {
	
	struct MainUserData {
		struct Request {}
		struct Response {
			var mainUser: MainUser
		}
		struct ViewModel {
			var mainUserName: String
			var mainUserBalance: Int
		}
	}
	
	struct UserData {
		struct Request {}
		struct Response {
			var user: User
		}
		struct ViewModel {
			var userName: String
			var balance: Int
		}
	}
	
	struct Transactions {
		struct Request {}
		struct Response {
			var transactions: [Transaction]
		}
		struct ViewModel {
			var transactions: [TransactionViewModel]
		}
	}
	
	struct TransactionViewModel {
		var id: String
		var amount: String
		var date: String
		var isIncoming: Bool
	}
}

