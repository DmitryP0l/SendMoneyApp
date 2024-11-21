//
//  HomePagePresenter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// отвечает за подготовку данных к отображению

import Foundation

final class HomePagePresenter: HomePagePresentationLogic {
	
	weak var viewController: HomePageDisplayLogic?
	
	/// Метод для подготовки данных пользователя для отображения и передачи их ViewController
	func presentUserData(response: HomePageModels.UserData.Response) {
		let viewModel = HomePageModels.UserData.ViewModel(
			mainUserName: response.mainUser.user.name,
			mainUserBalance: response.mainUser.user.balance
		)
		viewController?.displayUserData(viewModel: viewModel)
	}
	
	/// Метод для подготовки списка транзакций для отображения и передачи их ViewController
	func presentTransactions(response: HomePageModels.Transactions.Response) {
		let displayedTransactions = response.transactions.map { transaction in
			HomePageModels.Transactions.ViewModel.DisplayedTransaction(
				description: transaction.isIncoming ? "Incoming" : "Outgoing",
				amount: "\(transaction.amount)"
			)
		}
		let viewModel = HomePageModels.Transactions.ViewModel(
			displayedTransactions: displayedTransactions
		)
		viewController?.displayTransactions(viewModel: viewModel)
	}
}
