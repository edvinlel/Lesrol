//
//  DayCell.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 9/8/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

    // MARK: Reuse Identifier
    
    static let reuseIdentifier = "DayCell"
    
    // MARK: Properties
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:00 AM"
        label.textColor = UIColor.TripsColor.paragraphGray
        label.font = UIFont.gilroyBold(ofSize: 16)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.numberOfLines = 1
        return label
    }()
    
    let activityLabel: UILabel = {
        let label = UILabel()
        label.text = "Drive to Idaho"
        label.textColor = UIColor.TripsColor.mainBlack
        label.font = UIFont.gilroyBold(ofSize: 16)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.contentCompressionResistancePriority(for: .horizontal)
        return label
    }()
    
    lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.timeLabel, self.activityLabel])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()
    
    // MARK: Initializers
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setSubviewsForAutoLayout([stackView])
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(time: String, activity: String) {
        timeLabel.text = time
        activityLabel.text = activity
    }
    
    // MARK: Constraints
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            timeLabel.widthAnchor.constraint(equalToConstant: 80),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            
//            activityLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
//            timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        ])
    }
}
