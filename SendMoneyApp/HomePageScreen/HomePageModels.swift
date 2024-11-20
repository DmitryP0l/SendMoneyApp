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

enum HomePageModels {
	enum UserData {
		struct Request {}
		struct Response {
			var mainUser: MainUser
		}
		struct ViewModel {
			var mainUserName: String
			var mainUserBalance: Int
		}
	}
	
	enum Transactions {
		struct Request {}
		struct Response {
			var transactions: [Transaction]
		}
		struct ViewModel {
			struct DisplayedTransaction {
				var description: String
				var amount: String
			}
			var displayedTransactions: [DisplayedTransaction]
		}
	}
	
	enum AddMoney {
		struct Request {
			var amount: Int
		}
	}
}
