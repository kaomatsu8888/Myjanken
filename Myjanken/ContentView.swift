//
//  ContentView.swift
//  Myjanken
//
//  Created by kaoru matsunaga on 2023/08/08.
//

import SwiftUI

struct ContentView: View {
    
    // じゃんけんの結果を格納する変数(0=初期画面 1=グー 2=チョキ 3＝パー)
    @State var anserNumber = 0
    
    var body: some View {
        // 垂直にレイアウト(縦方向にレイアウト)
        VStack {
            // スペースを追加
            Spacer()
            
            // じゃんけんの数字が0だったら
            if anserNumber == 0 {
                // 初期画面のテキストを表示
                Text("これからじゃんけんをします！")
                // 下辺に余白を設定
                    .padding(.bottom)
            } else if anserNumber == 1 {
                // じゃんけんの数字が1だったら、グー画像を指定
                Image("gu")
                // リサイズを指定
                    .resizable()
                // アスペクト比を維持(縦横比)
                    .scaledToFit()
                // スペースを追加
                Spacer()
                // じゃんけんの種類を指定
                Text("グー")
                // 下辺に余白を設定
                    .padding(.bottom)
            } else if anserNumber == 2 {
                // じゃんけんの数字が2だったら、チョキ画像を指定
                Image("choki")
                // リサイズを指定
                    .resizable()
                // アスペクト比を維持(縦横比)
                    .scaledToFit()
                // スペースを追加
                Spacer()
                // じゃんけんの種類を指定
                Text("チョキ")
                // 下辺に余白を設定
                    .padding(.bottom)
            } else {
                // じゃんけんの数字が「1」、「2」以外だったらバー画像を指定
                Image("pa")
                // リサイズを指定
                    .resizable()
                // アスペクト比を維持(縦横比)
                    .scaledToFit()
                // スペースを追加
                Spacer()
                // じゃんけんの種類を指定
                Text("パー")
                // 下辺に余白を設定
                    .padding(.bottom)
            } // ifここまで
 
            Button {
                // 次のじゃんけんへ
                // anserNumber = Int.random(in: 1...3)同じものが続くため削除
                // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newAnswerNumber = 0
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                // repeatは繰り返し
                repeat {
                    // 1,2,3の数値をランダムに算出(乱数)
                    newAnswerNumber = Int.random(in: 1...3)
                    // 前回と同じ結果のときは、再度ランダムに数値を出す
                    // 異なる結果のときは、repeatを抜ける
                }   while anserNumber == newAnswerNumber
                // 新しいじゃんけんの結果を格納
                anserNumber = newAnswerNumber
            } label: {
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }// じゃんけんをするボタンはここまで
        }// vstackはここまで
    } // bodyはここまで
} // ContrentViewはここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
