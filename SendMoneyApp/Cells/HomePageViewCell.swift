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
	
	let profileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		return label
	}()
	
	let amountLabel: UILabel = {
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
		profileImageView.translatesAutoresizingMaskIntoConstraints = false
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		amountLabel.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(profileImageView)
		contentView.addSubview(nameLabel)
		contentView.addSubview(amountLabel)
		
		NSLayoutConstraint.activate([
			profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			profileImageView.widthAnchor.constraint(equalToConstant: 40),
			profileImageView.heightAnchor.constraint(equalToConstant: 40),
			
			nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
			nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			
			amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
		
		profileImageView.layer.cornerRadius = 20
		profileImageView.clipsToBounds = true
	}
}

