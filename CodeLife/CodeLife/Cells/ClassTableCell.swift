//
//  ClassTableCell.swift
//  CodeLife
//
//  Created by GlobalOneEdu on 2019/5/6.
//  Copyright © 2019 CodeLifeForAnyOne. All rights reserved.
//

import UIKit


class ClassTableCell: UITableViewCell {
    
    //承载课程表的table
    lazy var talbeView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.separatorStyle = .none
        table.estimatedRowHeight = 120
        
        return table
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //setupUI
    private func setupUI() {
        
    }

}
