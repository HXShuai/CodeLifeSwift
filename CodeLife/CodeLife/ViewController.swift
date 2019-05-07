//
//  ViewController.swift
//  CodeLife
//
//  Created by GlobalOneEdu on 2019/5/5.
//  Copyright © 2019 CodeLifeForAnyOne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var  tableView :UITableView = {
       let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.separatorStyle = .none
        table.estimatedRowHeight = 120
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //在这个位置写个冲突吧

        //我也在这里写了一个冲突测试

//        print("1")
//        //测试冲突点1
//        DispatchQueue.global().async {
//            print("2")
//            DispatchQueue.main.async {
//                print("3")
//            }
//            print("4")
//        }
//        print("5")
        
        let group = DispatchGroup.init()
        group.notify(queue: DispatchQueue.global()) {
            print("Group执行")
        }
        let queue = DispatchQueue.main
        print("1")
        queue.async(group: group, execute: {
            print("2")
        })
        print("3")
        queue.async(group: group, execute: {
            print("4")
        })
        print("5")
        
      
        
    }
    
    //每十个任务并发执行
    func GCDTest() {
        let group = DispatchGroup.init()
        let queue = DispatchQueue.global()
        //剩余10个车位
        let semaphore = DispatchSemaphore.init(value: 10)
        for i in 1...100 {
            //来了一辆车，信号量减一
            let result = semaphore.wait(timeout: .distantFuture)
            if result == .success {
                queue.async(group: group, execute: {
                    print("队列执行\(i)--\(Thread.current)")
                    //模拟执行任务时间
                    sleep(3)
                    //延迟3s后，走了一辆车，信号量+！
                    semaphore.signal()
                })
            }
        }
        
//        group.wait()
        group.notify(queue: DispatchQueue.main) {
            print("Group执行")
        }
    }


}
