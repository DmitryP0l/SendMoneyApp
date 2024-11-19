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
	func presentMainUserData(response: HomePageModels.MainUserData.Response)
	func presentContacts()
}

final class HomePagePresenter: HomePagePresentationLogic {
	
	weak var viewController: HomePageDisplayLogic?
	
	/// Метод, упаковывающий данные, полученные из интерактора в методе addMoney, и передающий для отображения во ViewController
	func presentMainUserData(response: HomePageModels.MainUserData.Response) {
		let viewModel = HomePageModels.MainUserData.ViewModel(
			mainUserName: response.mainUser.user.name,
			mainUserBalance: response.mainUser.user.balance)
		viewController?.displayUserData(viewModel: viewModel)
	}
	
	/// Метод, передающий вызов экрана контактов по VIP циклу.
	func presentContacts() {
		viewController?.displayContacts()
	}	
}
