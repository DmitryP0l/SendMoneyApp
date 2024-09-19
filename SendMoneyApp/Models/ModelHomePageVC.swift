//
//  ModelHomePageVC.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 12.09.24.
//

/// Структура модели, описывающая данные, необходимые для заполнения полей в ячейке таблицы HomePageViewController
///imageName - имя системного изображения, name - именная идентификация участника транзакции, amount - сумма транзакции

struct TransactionInfo {
	let imageName: String
	let name: String
	let amount: String
}
