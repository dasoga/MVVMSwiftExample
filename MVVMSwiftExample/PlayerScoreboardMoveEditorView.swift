//
//  PlayerScoreboardMoveEditorView.swift
//  MVVMSwiftExample
//
//  Created by Dino Bartosak on 26/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

class PlayerScoreboardMoveEditorView: UIView {
    
    @IBOutlet weak var onePointCountLabel: UILabel!
    @IBOutlet weak var twoPointCountLabel: UILabel!
    @IBOutlet weak var assistCountLabel: UILabel!
    @IBOutlet weak var reboundCountLabel: UILabel!
    @IBOutlet weak var foulCountLabel: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var onePointButton: UIButton!
    @IBOutlet weak var twoPointsButton: UIButton!
    @IBOutlet weak var assistButton: UIButton!
    @IBOutlet weak var reboundButton: UIButton!
    @IBOutlet weak var foulButton: UIButton!
    
    fileprivate weak var playerNibView: UIView!
    
    var viewModel: PlayerScoreboardMoveEditorViewModel? {
        didSet{
            fillUI()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let playerView: UIView = UINib.loadPlayerScoreboardMoveEditorView(self)
        self.addSubview(playerView)
        self.playerNibView = playerView
        
        styleUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerNibView.frame = self.bounds
    }
    
    // MARK: Button Action
    
    @IBAction func onePointAction(_ sender: Any) {
        viewModel?.onePointMove()
    }
    
    @IBAction func twoPointsAction(_ sender: Any) {
        viewModel?.twoPointsMove()
    }
    
    @IBAction func assistAction(_ sender: Any) {
        viewModel?.assistMove()
    }
    
    @IBAction func reboundAction(_ sender: Any) {
        viewModel?.reboundMove()
    }
    
    @IBAction func foulAction(_ sender: Any) {
        viewModel?.foulMove()
    }
    
    // MARK: Private
    
    fileprivate func styleUI() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.borderColor.cgColor
        self.clipsToBounds = true
    
        self.backgroundColor = UIColor.playerBackgroundColor
        
        styleActionButton(onePointButton)
        styleActionButton(twoPointsButton)
        styleActionButton(assistButton)
        styleActionButton(reboundButton)
        styleActionButton(foulButton)
    }
    
    fileprivate func styleActionButton(_ button: UIButton) {
        button.setTitleColor(UIColor.scoreColor, for: UIControlState())
        button.layer.cornerRadius = button.bounds.size.width / 2.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.brightPlayerBackgroundColor.cgColor
        button.backgroundColor = UIColor.brightPlayerBackgroundColor
    }
    
    fileprivate func fillUI() {
        guard let viewModel = viewModel else {
            return
        }
        
        self.name.text = viewModel.playerName
        
        viewModel.onePointMoveCount.bindAndFire { [unowned self] in self.onePointCountLabel.text = $0 }
        viewModel.twoPointMoveCount.bindAndFire { [unowned self] in self.twoPointCountLabel.text = $0 }
        viewModel.assistMoveCount.bindAndFire { [unowned self] in self.assistCountLabel.text = $0 }
        viewModel.reboundMoveCount.bindAndFire { [unowned self] in self.reboundCountLabel.text = $0 }
        viewModel.foulMoveCount.bindAndFire { [unowned self] in self.foulCountLabel.text = $0 }
    }
}
