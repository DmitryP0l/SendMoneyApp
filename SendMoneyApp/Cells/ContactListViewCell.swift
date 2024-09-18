//
//  ContactListViewCell.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 18.09.24.
//

import UIKit

/// Класс ячейки для табличного вида класса ContactListViewController.
/// Содержит UIImageView для аватара, UILabel для информации о контакте в записной книге

final class ContactListViewCell: UITableViewCell {
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов и констант
	static let identifier = "ContactListViewCell"
	
	let profileImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	let nameLabel: UILabel = {
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
		
		contentView.addSubview(profileImageView)
		contentView.addSubview(nameLabel)
		
		NSLayoutConstraint.activate([
			profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			profileImageView.widthAnchor.constraint(equalToConstant: 40),
			profileImageView.heightAnchor.constraint(equalToConstant: 40),
			
			nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
			nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
			]
		)
		profileImageView.layer.cornerRadius = 20
		profileImageView.clipsToBounds = true
	}
}
