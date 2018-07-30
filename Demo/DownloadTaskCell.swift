//
//  DownloadTaskCell.swift
//  Example
//
//  Created by InitialC on 2018/7/30.
//  Copyright © 2018年 InitialC. All rights reserved.
//

import UIKit
import Cribug

class DownloadTaskCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var bytesLabel: UILabel!
    @IBOutlet weak var controlButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!

    var tapClosure: ((DownloadTaskCell) -> Void)?


    @IBAction func didTapButton(_ sender: Any) {
        tapClosure?(self)
    }

    func updateProgress(task: MCTask) {
        progressView.progress = Float(task.progress.fractionCompleted)
        bytesLabel.text = "\(task.progress.completedUnitCount.mc.convertBytesToString())/\(task.progress.totalUnitCount.mc.convertBytesToString())"
        speedLabel.text = task.speed.mc.convertSpeedToString()
        timeRemainingLabel.text = "剩余时间：\(task.timeRemaining.mc.convertTimeToString())"
        startDateLabel.text = "开始时间：\(task.startDate.mc.convertTimeToDateString())"
        endDateLabel.text = "结束时间：\(task.endDate.mc.convertTimeToDateString())"

    }

}
