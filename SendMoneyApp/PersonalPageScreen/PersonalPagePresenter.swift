//
//  PersonalPagePresenter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 3.12.24.
//

import Foundation

final class PersonalPagePresenter: PersonalPagePresentationLogic {
	weak var viewController: PersonalPageDisplayLogic?
	
	func presentUserData(response: PersonalPage.UserData.Response) {
		let viewModel = PersonalPage.UserData.ViewModel(
			userName: response.user.name,
			balance: response.user.balance
		)
		viewController?.displayUserData(viewModel: viewModel)
	}
}
