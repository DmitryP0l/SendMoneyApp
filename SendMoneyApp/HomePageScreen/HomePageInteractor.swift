//
//  HomePageInteractor.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// отвечает за бизнес логику и хранение данных

import Foundation

/// протокол, определяющий бизнес логику на экране HomePageScreen
protocol HomePageBussinessLogic {
	func addMoney(amount: Int)
	func showContacts()
}

/// класс, реализующий бизнес логику на экране HomePageScreen
final class HomePageInteractor: HomePageBussinessLogic {
	
	var presenter: HomePagePresentationLogic?
	private var database: DataBase?
	private let businessLogicModule: BusinessLogicModule? = nil
	
	/// Добавление денег к балансу основного пользователя
	/// - Parameter amount: число, на которое будет увеличен баланс пользователя
	func addMoney(amount: Int) {
		let updatedMainUser = businessLogicModule!.addMoney(to: database!.mainUser, amount: amount)
		/// Обновление данных для отображения
		let response = HomePageModels.MainUserData.Response(mainUser: updatedMainUser)
		
		presenter!.presentMainUserData(response: response)
	}
	
	/// Вызов метода у презентера для перехода на экран контактов
	func showContacts() {
		presenter?.presentContacts()
	}
}
