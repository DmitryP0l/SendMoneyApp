//
//  HomePagePresenter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// отвечает за подготовку данных к отображению

import Foundation

/// Этот потокол определяет логику презентации для экрана HomePageScreen
protocol HomePagePresentationLogic {
	func presentUserData(response: HomePageModels.UserData.Response)
	func presentContacts()
}

final class HomePagePresenter: HomePagePresentationLogic {
	weak var viewController: HomePageDisplayLogic?
	
	/// Метод, упаковывающий данные, полученные из интерактора в методе AddMoney, и передающий для отображения во ViewController
	func presentUserData(response: HomePageModels.UserData.Response) {
		let viewModel = HomePageModels.UserData.ViewModel(
			userName: response.user.name,
			balance: response.user.balance)
		viewController?.displayUserData(viewModel: viewModel)
	}
	
	/// Метод, передающий вызов экрана контактов по VIP циклу.
	func presentContacts() {
		viewController?.displayContacts()
	}
	
}
