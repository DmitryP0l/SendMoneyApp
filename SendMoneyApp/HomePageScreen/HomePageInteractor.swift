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
	var database: DataBase?
	/// Добавление денег к балансу основного пользователя
	/// - Parameter amount: число, на которое будет увеличен баланс пользователя
	func addMoney(amount: Int) {
		database?.mainUser.user.balance += amount
		/// Создание новой транзакции
		let transaction = Transaction(
			id: UUID(),
			amount: amount,
			date: Date(),
			userId: database?.mainUser.user.id ?? UUID(),
			isIncoming: true)
		/// Обновление данных для отображения
		let response = HomePageModels.UserData.Response(user: (database?.mainUser.user)!)
		presenter?.presentUserData(response: response)
	}
	
	/// Вызов метода у презентера для перехода на экран контактов
	func showContacts() {
		presenter?.presentContacts()
	}
}
