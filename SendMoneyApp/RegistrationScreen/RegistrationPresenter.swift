//
//  RegistrationPresenter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 15.10.24.
//
// отвечает за подготовку данных к отображению

import Foundation

/// Этот потокол определяет логику презентации для экрана Registration Screen
protocol RegistrationPresentationLogic {
	func presentHomePage(response: RegistrationModels.EnterCredentials.Response)
	func presentAlert(response: RegistrationModels.EnterCredentials.Response)
}

final class RegistrationPresenter: RegistrationPresentationLogic {
	weak var viewController: RegistrationDisplayLogic?
	
	/// func presentHomePage(response: ) - Метод вызывается интерактором для подготовки данных и передачи их обратно во ViewController при успешной валидации
	func presentHomePage(response: RegistrationModels.EnterCredentials.Response) {
		if response.isSuccess {
			viewController?.displayHomePage()
		}
	}
	/// func presentAlert(response: ) - Метод вызывается интерактором для подготовки данных и передачи их обратно во ViewController при ошибке валидации
	func presentAlert(response: RegistrationModels.EnterCredentials.Response) {
		if !response.isSuccess {
			let viewModel = RegistrationModels.EnterCredentials.ViewModel(message: "fill in the fields")
			viewController?.displayAlert(viewModel: viewModel)
		}
	}
}
