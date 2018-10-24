//
//  MCSessionDelegate.swift
//  Cribug
//
//  Created by InitialC on 2018/7/16.
//  Copyright © 2018年 InitialC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

public class MCSessionDelegate: NSObject {
    public var manager: MCManager?

}

extension MCSessionDelegate: URLSessionDataDelegate {
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let manager = manager,
            let URLString = dataTask.originalRequest?.url?.absoluteString,
            let task = manager.fetchTask(URLString) as? MCDownloadTask,
            let response = response as? HTTPURLResponse
            else { return  }
        task.task(didReceive: response, completionHandler: completionHandler)

    }

    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard let manager = manager,
            let URLString = dataTask.originalRequest?.url?.absoluteString,
            let task = manager.fetchTask(URLString) as? MCDownloadTask
            else { return  }
        task.task(didReceive: data)

    }
}

extension MCSessionDelegate: URLSessionTaskDelegate {
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let manager = manager,
            let URLString = task.originalRequest?.url?.absoluteString,
            let task = manager.fetchTask(URLString) as? MCDownloadTask
            else { return  }
        task.task(didCompleteWithError: error)

    }
}
