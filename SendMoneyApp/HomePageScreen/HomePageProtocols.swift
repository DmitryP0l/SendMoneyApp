//
//  HomePageProtocols.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 19.11.24.
//

import Foundation

protocol HomePageDisplayLogic: AnyObject {
	func displayUserData(viewModel: HomePageModels.UserData.ViewModel)
	func displayTransactions(viewModel: HomePageModels.Transactions.ViewModel)
}

/// протокол, определяющий бизнес логику на экране HomePageScreen
protocol HomePageBussinessLogic {
	func fetchUserData(request: HomePageModels.UserData.Request)
	func fetchTransactions(request: HomePageModels.Transactions.Request)
	func addMoney(request: HomePageModels.AddMoney.Request)
}

/// Этот потокол определяет логику презентации для экрана HomePageScreen
protocol HomePagePresentationLogic {
	func presentUserData(response: HomePageModels.UserData.Response)
	func presentTransactions(response: HomePageModels.Transactions.Response)
}

/// Протокол определяет логику маршрутизации для экрана HomePage Screen
protocol HomePageRoutingLogic {
	func routeToContacts()
}
