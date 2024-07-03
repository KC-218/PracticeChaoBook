import Foundation

// 【ChaoCode】 Swift 基礎篇 10：Range 運算子實作作業
//
// 1. 保羅在學校活動的時間是 7:00~13:00 點，艾莉在學校活動的時間是 12:30~17:00 點，溫蒂在學校活動的時間是 10:00~16:00 點，他們有辦法在學校碰面嗎？如果可以的話是幾點到幾點？
// ⚠️ 嘗試用下面提供的 formatter 讓你的數字一律印出兩位數，比方 1 應該印出 01。請用這種一律有兩位數的顯示方式來印出時間。例如 1 點 5 分應該是 01 點 05 分。

let paulRange = 700...1300
let ellyRange = 1230...1700
let wendyRange = 1000...1600

let canMeet: Bool = paulRange.overlaps(ellyRange) && ellyRange.overlaps(wendyRange) && paulRange.overlaps(wendyRange)

if canMeet {
    
    let newRange = paulRange.clamped(to: ellyRange)
    let finalRange = newRange.clamped(to: wendyRange)

    let start = finalRange.first!
    let end = finalRange.last!

    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 4

    let sTime = formatter.string(for: start)!
    let eTime = formatter.string(for: end)!

    print(canMeet ? "他們可以在 \(sTime) ~ \(eTime) 之間碰面" : "不能碰面")
}

// 2. 請設計一個隨機抽獎活動，每次執行時會從 1 到 1000 隨機抽一個數字。如果這個數字在 100 ~ 200 的範圍中（不含 200）則中 200 元；如果這個數字尾數是 8 或 6 則中 500 元；如果這個數字剛好是 888 或 666 則中 10,000 元。

func 抽獎活動(自選隨機數字: Int? = nil)
{
    let range = 1...1000
    var 隨機數字: Int = range.randomElement()! // ⚠️ 請勿改變數名稱，只修改 ? 的部分，? 必須是隨機產生的數字。
    隨機數字 = 自選隨機數字 ?? 隨機數字 // ⚠️ 請勿刪掉這行，測試用
    
    let range200 = 100..<200
    
    if range200.contains(隨機數字) {
        print("您抽中的數字是：\(隨機數字)，🎉 恭喜你中了 200 元！")
    } else if 隨機數字 == 888 || 隨機數字 == 666 {
        print("您抽中的數字是：\(隨機數字)，🎉 恭喜你中了 10,000 元！")
    } else if 隨機數字 % 10 == 8 || 隨機數字 % 10 == 6 {
        print("您抽中的數字是：\(隨機數字)，🎉 恭喜你中了 500 元！")
    } else {
        print("您抽中的數字是：\(隨機數字)，很可惜，這次沒有中獎。")
    }
    
}

抽獎活動(自選隨機數字: 1)
抽獎活動(自選隨機數字: 100)
抽獎活動(自選隨機數字: 116)
抽獎活動(自選隨機數字: 239)
抽獎活動(自選隨機數字: 200)
抽獎活動(自選隨機數字: 344)
抽獎活動(自選隨機數字: 246)
抽獎活動(自選隨機數字: 666)
抽獎活動(自選隨機數字: 888)
抽獎活動(自選隨機數字: 777)
抽獎活動(自選隨機數字: 150)
抽獎活動()


