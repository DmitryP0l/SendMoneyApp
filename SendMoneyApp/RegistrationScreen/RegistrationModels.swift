//
//  RegistrationModels.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 15.10.24.
//
// отвечает за модели данных передаваемых между компонентами VIP цикла

import Foundation

/// Request - данные, передаваемые из ViewController в Interactor
/// Response - данные, передаваемые из Interactor в Presenter
/// ViewModel - данные, передаваемые из Presenter обратно во ViewController
struct RegistrationModels {
	struct EnterCredentials {
		struct Request {
			var login: String?
			var password: String?
		}
		struct Response {
			var isSuccess: Bool
		}
		struct ViewModel {
			var message: String
		}
	}
}
