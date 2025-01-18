//
//  BusinessLogicRealm.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 18.01.25.
//

import Foundation
import RealmSwift

/// Определяет методы для добавления, перевода и запроса средств. Эти методы работают с объектами UserRealm
protocol BusinessLogicRealmProtocol {
	/// Метод добавления средств основному пользователю
	func addMoney(to mainUser: UserRealm, amount: Int)
	/// Метод перевода средств другому пользователю
	func sendMoney(from mainUser: UserRealm, to user: UserRealm, amount: Int)
	/// Метод запроса средств у другого пользователя
	func requestMoney(from user: UserRealm, to mainUser: UserRealm, amount: Int)
}

final class BusinessLogicRealm: BusinessLogicRealmProtocol {
	private var globalData: GlobalDataManagerRealmProtocol
	
	init(globalData: GlobalDataManagerRealmProtocol) {
		self.globalData = globalData
	}
	/// Этот метод добавляет средства основному пользователю. Он открывает транзакцию Realm, увеличивает баланс пользователя, создает объект транзакции и добавляет его в список транзакций пользователя. Затем обновляет данные пользователя в базе данных.
	func addMoney(to mainUser: UserRealm, amount: Int) {
		try! Realm().write {
			mainUser.balance += amount
			
			let transaction = TransactionRealm()
			transaction.id = UUID().uuidString
			transaction.amount = amount
			transaction.date = Date()
			transaction.userId = mainUser.id
			transaction.isIncoming = true
			
			mainUser.transactions.append(transaction)
			globalData.addTransaction(transaction: transaction)
			globalData.updateUser(user: mainUser)
		}
	}
	/// Этот метод переводит средства от основного пользователя к другому пользователю. Он проверяет, достаточно ли средств у основного пользователя, открывает транзакцию Realm, уменьшает баланс основного пользователя и увеличивает баланс другого пользователя. Затем создает объект транзакции и добавляет его в список транзакций основного пользователя. Обновляет данные обоих пользователей в базе данных.
	func sendMoney(from mainUser: UserRealm, to user: UserRealm, amount: Int) {
		guard mainUser.balance >= amount else { return }
		
		try! Realm().write {
			mainUser.balance -= amount
			user.balance += amount
			
			let transaction = TransactionRealm()
			transaction.id = UUID().uuidString
			transaction.amount = amount
			transaction.date = Date()
			transaction.userId = mainUser.id
			transaction.isIncoming = false
			
			mainUser.transactions.append(transaction)
			globalData.addTransaction(transaction: transaction)
			globalData.updateUser(user: mainUser)
			globalData.updateUser(user: user)
		}
	}
	/// Этот метод запрашивает средства у другого пользователя. Он проверяет, достаточно ли средств у другого пользователя, открывает транзакцию Realm, увеличивает баланс основного пользователя и уменьшает баланс другого пользователя. Затем создает объект транзакции и добавляет его в список транзакций основного пользователя. Обновляет данные обоих пользователей в базе данных.
	func requestMoney(from user: UserRealm, to mainUser: UserRealm, amount: Int) {
		guard user.balance >= amount else { return }
		
		try! Realm().write {
			mainUser.balance += amount
			user.balance -= amount
			
		let transaction = TransactionRealm()
			transaction.id = UUID().uuidString
			transaction.amount = amount
			transaction.date = Date()
			transaction.userId = mainUser.id
			transaction.isIncoming = true
			
			mainUser.transactions.append(transaction)
			globalData.addTransaction(transaction: transaction)
			globalData.updateUser(user: mainUser)
			globalData.updateUser(user: user)
			
		}
	}
}
