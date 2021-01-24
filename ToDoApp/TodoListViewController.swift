//
//  ViewController.swift
//  ToDoApp
//
//  Created by Kou on 2021/01/19.
//  Copyright © 2021 KouMitobe. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    //クラス変数の型定義
    class Task{
        var title:String//タイトル
        var done:Bool = false//完了フラグ
        //イニシャライズメソッド
        init(title:String){
            self.title = title
        }
    }
    //クラス変数としてタスクを格納する配列
    var taskArray:[Task] = []
    //画面オープン処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("起動成功")

        //ナビゲーションバーのタイトルの拡大
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //テスト用
        let task1:Task = Task(title: "テスト用タスク1")
        let task2:Task = Task(title: "２つ目のタスクだけど")
        let task3:Task = Task(title: "this is 3Task")
        
        //タスク用配列にテスト用の値を格納
        taskArray.append(task1)
        taskArray.append(task2)
        taskArray.append(task3)
        
    }
    
    //テーブルビューでの設定
    //テーブルビューのセルの数の設定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //配列の数だけせるを準備する
        return taskArray.count
    }
    //テーブルビューのセルのカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let task = taskArray[indexPath.row]
        //タスクのタイトルをセルのラベルとして設定
        cell.textLabel?.text = task.title
        cell.accessoryType = task.done ? .checkmark:.none
        return cell
    }
    //チェックマークの機能のカスタマイズ
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //選択されたセルに該当する配列を取得
        let task = taskArray[indexPath.row]
        //配列のboolを反転させるこれがチェックマークになる
        task.done = !task.done
        //リロードして更新し、変更された値を反映する
        self.tableView.reloadData()
        //選択時の背景を操作する
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
}

