//
//  PersonalPageProtocols.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 3.12.24.
//

import Foundation

protocol PersonalPageDisplayLogic: AnyObject {
	func displayUserData(viewModel: PersonalPage.UserData.ViewModel)
}

protocol PersonalPageBusinessLogic {
	func fetchUserData(request: PersonalPage.UserData.Request)
	func sendMoney(request: PersonalPage.SendMoney.Request)
}

protocol PersonalPagePresentationLogic {
	func presentUserData(response: PersonalPage.UserData.Response)
}

protocol PersonalPageDataStore {
	var user: User? { get set }
}

protocol PersonalPageDataPassing {
	var dataStore: PersonalPageDataStore? { get }
}
