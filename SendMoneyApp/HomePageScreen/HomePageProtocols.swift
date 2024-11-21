//
//  HomePageProtocols.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 19.11.24.
//

import Foundation

/// Протокол, определяющий методы для отображения данных, полученных от presenter на экране HomePageScreen
protocol HomePageDisplayLogic: AnyObject {
	func displayUserData(viewModel: HomePageModels.UserData.ViewModel)
	func displayTransactions(viewModel: HomePageModels.Transactions.ViewModel)
}

/// протокол, определяющий методы для обработки в interactor бизнес-логики для экрана HomePageScreen
protocol HomePageBussinessLogic {
	func fetchUserData(request: HomePageModels.UserData.Request)
	func fetchTransactions(request: HomePageModels.Transactions.Request)
	func addMoney(request: HomePageModels.AddMoney.Request)
}

/// Этот потокол определяет методы, которые presenter использует для подготовки данных для отображения, для экрана HomePageScreen
protocol HomePagePresentationLogic {
	func presentUserData(response: HomePageModels.UserData.Response)
	func presentTransactions(response: HomePageModels.Transactions.Response)
}

/// Протокол определяет логику маршрутизации для экрана HomePage Screen на экран списка контактов
protocol HomePageRoutingLogic {
	func routeToContacts()
}
