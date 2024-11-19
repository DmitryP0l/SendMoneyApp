//
//  HomePageInteractor.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// отвечает за бизнес логику и хранение данных

import Foundation

final class HomePageInteractor: HomePageBussinessLogic, HomePageDataStore {
	var presenter: HomePagePresentationLogic?
	var globalData: GlobalData
	var mainUser: MainUser?
	
	init(globalData: GlobalData) {
		self.globalData = globalData
		self.mainUser = globalData.database.mainUser
	}
	
	func fetchUserData(request: HomePageModels.UserData.Request) {
		guard let mainUser = mainUser else { return }
		let response = HomePageModels.UserData.Response(mainUser: mainUser)
		presenter?.presentUserData(response: response)
	}
	
	func fetchTransactions(request: HomePageModels.Transactions.Request) {
		guard let mainUser = mainUser else { return }
		let response = HomePageModels.Transactions.Response(transactions: mainUser.transactions)
		presenter?.presentTransactions(response: response)
	}
	
	func addMoney(request: HomePageModels.AddMoney.Request) {
		guard var mainUser = mainUser else { return }
		mainUser.user.balance += request.amount
		globalData.database.mainUser = mainUser
		self.mainUser = mainUser
		fetchUserData(request: HomePageModels.UserData.Request())
		fetchTransactions(request: HomePageModels.Transactions.Request())
	}
}





//old version


//
///// класс, реализующий бизнес логику на экране HomePageScreen
//final class HomePageInteractor: HomePageBussinessLogic {
//	
//	var presenter: HomePagePresentationLogic?
//	private var database: DataBase?
//	private let businessLogicModule: BusinessLogicModule? = nil
//	
//	/// Добавление денег к балансу основного пользователя
//	/// - Parameter amount: число, на которое будет увеличен баланс пользователя
//	func addMoney(amount: Int) {
//		let updatedMainUser = businessLogicModule!.addMoney(to: database!.mainUser, amount: amount)
//		/// Обновление данных для отображения
//		let response = HomePageModels.MainUserData.Response(mainUser: updatedMainUser)
//		
//		presenter!.presentMainUserData(response: response)
//	}
//	
//	/// Вызов метода у презентера для перехода на экран контактов
//	func showContacts() {
//		presenter?.presentContacts()
//	}
//}
