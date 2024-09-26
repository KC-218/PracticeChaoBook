// 【ChaoCode】 Swift 基礎篇 14：While Loop 實作作業
//
//
// 1. 請用 while loop 寫出整數「次方」的計算方法。

func 次方計算(_ base: Int, power: Int) -> Int {
    // base 表示底數；power 表是指數。例如：3 的 5 次方中，3 是底數、5 是指數。
    switch power {
    case 0:
        return 1
    case ..<0:
        return 0
    default:
        // 👇 請從這邊開始編輯，編輯範圍到「return result」那行之前，在這範圍中間你想加幾行都可以。
        var result = 1 // ⚠️ 最後請記得把你的運算結果存至這個變數中，你可以修改初始的「0」，但請勿更改變數名稱。
        var count = 0
        
        while count < power {
            result *= base
            count += 1
        }
        
        return result // ⚠️ 請勿刪除這行。
    }
}

作業檢查(次方計算)


// 2. 請設計一個剪刀石頭布的遊戲，獲勝條件是三戰兩勝，平手不算。每一回合都需要印出猜拳狀況，最後印出最後的獲勝者、經過的局數和最終比數。
// 💡 提示：你可以從 Array 中取得 randomElement，也可以從正整數中取得 randomElement。
let moves = ["✊", "✌️", "✋"]

var aWinCount = 0
var bWinCount = 0
var totalCount = 0

repeat {

    let aMove = moves.randomElement()
    let bMove = moves.randomElement()
        
    if (aMove == bMove) {
        print("兩方都出 \(aMove!)，平手。")
    }
    else if (aMove == "✊" && bMove == "✌️") || (aMove == "✌️" && bMove == "✋" || (aMove == "✋" && bMove == "✊")) {
        aWinCount += 1
        print("\(aMove!) VS \(bMove!)，這局由玩家A獲勝。")
    }
    else {
        bWinCount += 1
        print("\(aMove!) VS \(bMove!)，這局由玩家B獲勝。")
    }
    
    totalCount += 1
    
} while (aWinCount+bWinCount != 3)

let winner = aWinCount > bWinCount ? "玩家A" : "玩家B"
print("經過 \(totalCount) 次猜拳，最後的贏家是「\(winner)」，比數為 \(aWinCount)：\(bWinCount)。")
