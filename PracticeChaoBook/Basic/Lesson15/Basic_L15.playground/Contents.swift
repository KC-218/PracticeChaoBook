// 【ChaoCode】 Swift 基礎篇 15：Set 實作作業
//
//
// 1. 以下是一個班級的模擬考的結果，請印出全班人數、兩科都 Pass 的有幾人以及他們的名字。
//英文 Pass："菲尼克斯", "安東尼", "伊恩", "羅恩", "約翰", "黛西", "格理芬", "凱登", "麥可", "傑克森", "約瑟夫", "艾斯", "諾亞", "約拿", "埃利奧特", "凱勒", "雅莉安娜", "凱特"
//數學 Pass："潔西卡", "諾亞", "雅莉森", "凱特", "黛西", "伊恩", "賈斯丁", "艾米", "羅恩", "以賽亞", "達克斯", "伊萊賈", "雅莉安娜", "約翰", "昆恩"
//都沒 Pass 的有："戴蒙", "雷蒙", "艾莉克西雅", "菲碧"

var englishPassSet: Set<String> = ["菲尼克斯", "安東尼", "伊恩", "羅恩", "約翰", "黛西", "格理芬", "凱登", "麥可", "傑克森", "約瑟夫", "艾斯", "諾亞", "約拿", "埃利奧特", "凱勒", "雅莉安娜", "凱特"]
let mathPassSet: Set<String> = ["潔西卡", "諾亞", "雅莉森", "凱特", "黛西", "伊恩", "賈斯丁", "艾米", "羅恩", "以賽亞", "達克斯", "伊萊賈", "雅莉安娜", "約翰", "昆恩"]
let noPassSet: Set<String> = ["戴蒙", "雷蒙", "艾莉克西雅", "菲碧"]

let allClassSet = englishPassSet.union(mathPassSet).union(noPassSet)
print("全班一共有 \(allClassSet.count) 人")
let twoPassSet = englishPassSet.intersection(mathPassSet)
print("兩科都 Pass 的有 \(twoPassSet.count) 人，他們是：\(twoPassSet)")


print("===========================")

// 2. 請寫一個簡單版的狼人殺遊戲。12 個人被分為狼人隊伍和村民隊伍，每天早上會從全部的人中隨機流放一人，而晚上會從村民中隨機送走一人。重複這個流程直到其中一個隊伍內所有人都離開，剩餘還有人的那一隊獲勝。最後請印出花了多少天、哪一個隊伍獲勝以及倖存者姓名。
// * 第一天是從晚上開始，接著就是第二天白天。
// * 如果白天只剩下一個村民和一個狼人，則狼人獲勝。
 
var 狼人們: Set<String> = ["妙麗","天狼星","榮恩","石內卜"]
var 村民們: Set<String> = ["跩哥","哈利","多比","佛地魔","金妮","鄧不利多","露娜","海格"]
var day = 1
var isNight = true

while !(狼人們.isEmpty || 村民們.isEmpty) {
    
    if isNight {
        
        let leave = 村民們.randomElement()!
        村民們.remove(leave)
        print("夜晚狼人行動，送走「\(leave)」。")
        
    } else {
        
        let totals = 狼人們.union(村民們)
        
        let isOneManOneWolf = totals.count == 2
        
        let leave = isOneManOneWolf ? 村民們.first! : totals.randomElement()!
        
        狼人們.remove(leave)
        村民們.remove(leave)
        print("白天大家投票決定，流放「\(leave)」。")
        
        day += 1
    }
    
    isNight.toggle()
}

let winner = 狼人們.isEmpty ? "村民們" : "狼人們"
print("🗓 經過了 \(day) 天，\(winner) 獲勝了。")
print("🎉 倖存者：\(狼人們.union(村民們).joined(separator: ","))")


//Me
//repeat {
//    
//    let leavePerson = 村民們.randomElement()!
//    print("夜晚狼人行動，送走「\(leavePerson)」。")
//    村民們.remove(leavePerson)
//    
//    day += 1
//    
//    let leavePerson2 = 狼人們.union(村民們).randomElement()!
//    print("白天大家投票決定，流放「\(leavePerson2)」。")
//    
//    if 狼人們.contains(leavePerson2) {
//        狼人們.remove(leavePerson2)
//    } else if 村民們.contains(leavePerson2) {
//        村民們.remove(leavePerson2)
//    }
//    
//    if 村民們.count == 1 && 狼人們.count == 1 {
//        print("🗓 經過了 \(day) 天，狼人們獲勝了。")
//        print("🎉 倖存者：\(狼人們) ｜｜ \(村民們)")
//        break
//    }
//    
//    if 村民們.isEmpty {
//        print("🗓 經過了 \(day) 天，狼人們獲勝了。")
//        print("🎉 倖存者：\(狼人們)")
//        break
//    } else if 狼人們.isEmpty {
//        print("🗓 經過了 \(day) 天，村民們獲勝了。")
//        print("🎉 倖存者：\(村民們)")
//        break
//    }
//    
//} while !(狼人們.isEmpty || 村民們.isEmpty)


