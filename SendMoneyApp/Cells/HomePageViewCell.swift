//
//  HomePageViewCell.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 10.09.24.
//

import UIKit
/// Класс ячейки для табличного вида класса HomePageViewController.
/// Содержит UIImageView для аватара, UILabel для информации о источнике изменения баланса, и UILabel для информации о сумме транзакции
final class HomePageViewCell: UITableViewCell {
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов и констант
	static let identifier = "HomePageViewCell"
	
	let transactionImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	let transactionNameLabel: UILabel = {
		let label = UILabel()
		return label
	}()
	
	let transactionAmountLabel: UILabel = {
		let label = UILabel()
		return label
	}()
	
	// MARK: - Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Private methods
	/// Настройка ограничений (constrains) для элементов ячейки.
	private func setupViews() {
		transactionImageView.translatesAutoresizingMaskIntoConstraints = false
		transactionNameLabel.translatesAutoresizingMaskIntoConstraints = false
		transactionAmountLabel.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(transactionImageView)
		contentView.addSubview(transactionNameLabel)
		contentView.addSubview(transactionAmountLabel)
		
		NSLayoutConstraint.activate([
			transactionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			transactionImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			transactionImageView.widthAnchor.constraint(equalToConstant: 40),
			transactionImageView.heightAnchor.constraint(equalToConstant: 40),
			
			transactionNameLabel.leadingAnchor.constraint(equalTo: transactionImageView.trailingAnchor, constant: 10),
			transactionNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			
			transactionAmountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			transactionAmountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		]
		)
		
		transactionImageView.layer.cornerRadius = 20
		transactionImageView.clipsToBounds = true
	}
}

