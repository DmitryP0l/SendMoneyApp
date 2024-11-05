//
//  BusinessLogic.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 5.11.24.
//
// модуль описывает основную логику приложения

import Foundation

protocol BusinessLogic {
	/// Метод добавления средств основному пользователю
	func addMoney(to user: MainUser, amount: Int) -> MainUser
	/// Метод перевода средств другому пользователю
	func sendMoney(from mainUser: MainUser, to user: User, amount: Int) -> (MainUser, User)?
	/// Метод запроса средств у другого пользователя
	func requestMoney(from user: User, to mainUser: MainUser, amount: Int)  -> (MainUser, User)?
}

class BusinessLogicModule: BusinessLogic {
	
	func addMoney(to mainUser: MainUser, amount: Int) -> MainUser {
		var updatedMainUser = mainUser
			updatedMainUser.user.balance += amount
			
			let transaction = Transaction(
				id: UUID(),
				amount: amount,
				date: Date(),
				userId: mainUser.user.id,
				isIncoming: true
			)
			updatedMainUser.transactions.append(transaction)
			
			return updatedMainUser
	}
	
	func sendMoney(from mainUser: MainUser, to user: User, amount: Int) -> (MainUser, User)? {
		guard mainUser.user.balance >= amount else { return nil }
		
		var updatedMainUser = mainUser
		var updatedUser = user
		
		updatedMainUser.user.balance -= amount
		updatedUser.balance += amount
		
		let transaction = Transaction(
			id: UUID(),
			amount: amount,
			date: Date(),
			userId: user.id,
			isIncoming: false
		)
		updatedMainUser.transactions.append(transaction)
		
		return (updatedMainUser, updatedUser)
	}
	
	func requestMoney(from user: User, to mainUser: MainUser, amount: Int) -> (MainUser, User)? {
		guard user.balance >= amount else { return nil }
		
		var updatedMainUser = mainUser
		var updatedUser = user
		
		updatedMainUser.user.balance += amount
		updatedUser.balance -= amount
		
		let transaction = Transaction(
			id: UUID(),
			amount: amount,
			date: Date(),
			userId: user.id,
			isIncoming: false
		)
		updatedMainUser.transactions.append(transaction)
		
		return (updatedMainUser, updatedUser)
	}
}
