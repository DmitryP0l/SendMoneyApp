//
//  PersonModel.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 18.09.24.
//

/// Структура модели, описывающая данные, необходимые для заполнения полей в ячейке таблицы ContactListViewController
///imageName - имя системного изображения, name - именная идентификация контакта в записной книге

import Foundation

struct Person {
	let imageName: String
	let name: String
	let currentBalanse: Int
}
