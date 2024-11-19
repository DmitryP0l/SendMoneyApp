//
//  HomePagePresenter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// отвечает за подготовку данных к отображению

import Foundation

final class HomePagePresenter: HomePagePresentationLogic {
	
	
	
	weak var viewController: HomePageDisplayLogic?
	
	func presentUserData(response: HomePageModels.UserData.Response) {
		let viewModel = HomePageModels.UserData.ViewModel(
			userName: response.user.name,
			balance: response.user.balance)
		viewController?.displayUserData(viewModel: viewModel)
	}
	/// Метод, упаковывающий данные, полученные из интерактора в методе addMoney, и передающий для отображения во ViewController
//	func presentUserData(response: HomePageModels.UserData.Response) {
//		let viewModel = HomePageModels.UserData.ViewModel(
//			mainUserName: response.mainUser.user.name,
//			mainUserBalance: response.mainUser.user.balance)
//		viewController?.displayUserData(viewModel: viewModel)
//	}
	
	/// Метод, передающий вызов экрана контактов по VIP циклу.
	func presentContacts() {
		viewController?.displayContacts()
	}	
}
