//
//  PersonalPageInteractor.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 3.12.24.
//

import Foundation

final class PersonalPageInteractor: PersonalPageBusinessLogic, PersonalPageDataStore {
	var presenter: PersonalPagePresentationLogic?
	var globalData: GlobalData?
	
	var user: User?
	
	init(globalData: GlobalData) {
		self.globalData = globalData
	}
	
	func fetchUserData(request: PersonalPage.UserData.Request) {
		guard let user = user else { return }
		let responce = PersonalPage.UserData.Response(user: user)
		presenter?.presentUserData(response: responce)
	}
	
	func sendMoney(request: PersonalPage.SendMoney.Request) {
		guard var mainUser = globalData?.database.mainUser else { return }
		guard var user = user else { return }
		
		if mainUser.user.balance >= request.amount {
			mainUser.user.balance -= request.amount
			user.balance += request.amount
			
			let transaction = Transaction(
				id: UUID(),
				amount: request.amount,
				date: Date(),
				userId: UUID(),
				isIncoming: false
			)
			mainUser.transactions.append(transaction)
			
			globalData?.database.mainUser = mainUser
			self.user = user
			
			fetchUserData(request: PersonalPage.UserData.Request())
		} else {
			print("недостаточно средств")
		}
	}
}
