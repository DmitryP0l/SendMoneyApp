//
//  RegistrationInteractor.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 15.10.24.
//
// отвечает за бизнес логику и хранение данных

import Foundation

/// определяет бизнес логику для для экрана Registration Screen
protocol RegistrationBusinessLogic {
	func enterButtonTapped(request: RegistrationModels.EnterCredentials.Request)
}

class RegistrationInteractor: RegistrationBusinessLogic {
	var presenter: RegistrationPresentationLogic?
	
	/// func enterButtonTapped(request:) вызывается когда пользователь нажимает на кнопку enterButton, и передает данные для обработки
	/// в методе происходит проверка на наличие символов в полях ввода, при отсутствии будут выведен алерт вью с предупреждением
	func enterButtonTapped(request: RegistrationModels.EnterCredentials.Request) {
		if let login = request.login, !login.isEmpty,
		   let password = request.password, !password.isEmpty {
			let response = RegistrationModels.EnterCredentials.Response(isSuccess: true)
			presenter?.presentHomePage(response: response)
		} else {
			let response = RegistrationModels.EnterCredentials.Response(isSuccess: false)
			presenter?.presentAlert(response: response)
		}
	}
}
