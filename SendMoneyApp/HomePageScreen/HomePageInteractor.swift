//
//  HomePageInteractor.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// отвечает за бизнес логику и хранение данных

import Foundation
/// класс, реализующий бизнес логику на экране HomePageScreen
final class HomePageInteractor: HomePageBussinessLogic {
	var presenter: HomePagePresentationLogic?
	var globalData: GlobalData?
	var mainUser: MainUser?
	
	init(globalData: GlobalData) {
		self.globalData = globalData
		self.mainUser = globalData.database.mainUser
	}
	/// Метод для получения данных пользователя из глобального БД и передачи в presenter
	func fetchUserData(request: HomePageModels.UserData.Request) {
		guard let mainUser = mainUser else { return }
		let response = HomePageModels.UserData.Response(mainUser: mainUser)
		presenter?.presentUserData(response: response)
	}
	/// Метод для получения списка транзакций из глобального БД и передачи в presenter
	func fetchTransactions(request: HomePageModels.Transactions.Request) {
		guard let mainUser = mainUser else { return }
		let response = HomePageModels.Transactions.Response(transactions: mainUser.transactions)
		presenter?.presentTransactions(response: response)
	}
	/// Метод для добавления средств на счет основного пользователя и внесения данных о транзакции в БД
	func addMoney(request: HomePageModels.AddMoney.Request) {
		guard var mainUser = mainUser else { return }
		mainUser.user.balance += request.amount
		
		let transaction = Transaction(
			id: UUID(),
			amount: request.amount,
			date: Date(),
			userId: UUID(),
			isIncoming: true)
		mainUser.transactions.append(transaction)
		
		globalData?.database.mainUser = mainUser
		self.mainUser = mainUser
		
		fetchUserData(request: HomePageModels.UserData.Request())
		fetchTransactions(request: HomePageModels.Transactions.Request())
	}
}
