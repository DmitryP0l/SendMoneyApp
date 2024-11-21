//
//  DataManager.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 30.10.24.
//
// фаил содержит массив глобальных данных о пользователях

import Foundation

class GlobalData {
	
	var database: DataBase
	
	init() {
		self.database = DataBase(
			mainUser: MainUser(
				user: User(id: UUID(),
						name: "MainUser",
						image: "person.circle",
						balance: 100),
			 transactions: []),
			otherUsers: [
				User(id: UUID(), name: "FirstUser", image: "person.circle", balance: 50),
			 User(id: UUID(), name: "SecondUser", image: "person.circle", balance: 150)
		 ])
	}
}
