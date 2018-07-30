//
//  ViewController3.swift
//  Example
//
//  Created by InitialC on 2018/7/30.
//  Copyright © 2018年 InitialC. All rights reserved.
//

import UIKit
import Cribug

class ViewController3: BaseViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        downloadManager = MCManager("ViewController3", isStoreInfo: true)
        
        // 因为会读取缓存到沙盒的任务，所以第一次的时候，不要马上开始下载
        downloadManager?.isStartDownloadImmediately = false

        URLStrings = ["http://api.gfs100.cn/upload/20171219/201712191530562229.mp4",
                      "http://api.gfs100.cn/upload/20180202/201802021621577474.mp4",
                      "http://api.gfs100.cn/upload/20180202/201802021048136875.mp4",
                      "http://api.gfs100.cn/upload/20180202/201802021436174669.mp4",
                      "http://api.gfs100.cn/upload/20180131/201801311435101664.mp4",
                      "http://api.gfs100.cn/upload/20180131/201801311059389211.mp4",
                      "http://api.gfs100.cn/upload/20171219/201712190944143459.mp4"]
        
        guard let downloadManager = downloadManager else { return  }

        setupManager()

        downloadURLStrings = downloadManager.tasks.map({ $0.URLString })

        updateUI()
        tableView.reloadData()
    }


    deinit {
        downloadManager?.invalidate()
    }

}


// MARK: - tap event
extension ViewController3 {


    @IBAction func multiDownload(_ sender: Any) {
        downloadManager?.isStartDownloadImmediately = true
        downloadManager?.multiDownload(URLStrings)
        downloadURLStrings.append(contentsOf: URLStrings)
        updateUI()
        tableView.reloadData()
    }

}

