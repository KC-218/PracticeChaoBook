// 【ChaoCode】 Swift 基礎篇 19B：Closure 實作作業
//
// ⚠️ 請在不使用 Loop 語法的情況完成這次的每一項作業。
//
// 1. 請計算持有股票的總資產價值，計算方式為單股價格 * 持有股數。
typealias 股票 = (name: String, 單股價格: Double, 持有股數: Int)
let 持有股票: [股票] = [("台積電", 575.5, 1000), ("長榮航", 36.425, 7820), ("中鋼", 39.55, 5500), ("台泥", 47.95, 13600), ("元大台灣50", 135.15, 8000)]

let 總資產 = 持有股票.reduce(0) { (result, stock) in
  return result + stock.單股價格 * Double(stock.持有股數)
}

print("💰 股票總資產價值為 \(總資產) 元")


// 2. 請透過 getTeamRecords() 取得 NBA 球隊資料，並回答以下問題。
//    * getTeamRecords() 的回傳值是一個 [Team]，Team 是 (隊伍名: String, 勝場數: Int, 敗場數: Int, 分區: String) 的別稱。
let teams: [Team] = getTeamRecords()

// a. 請使用 .reduce 找出東區勝率最高的球隊。
let 東區勝率最高的隊伍 = teams.filter { $0.分區 == "東區" }.reduce(("", 0.0)) { (result, team) in
  let 勝率 = Double(team.勝場數) / Double(team.勝場數 + team.敗場數)
  return 勝率 > result.1 ? (team.隊伍名, 勝率) : result
}

print("🏆 東區勝率最高的隊伍是：\(東區勝率最高的隊伍.0)")

let 隊伍 = teams.map {
  let 勝率 = Double($0.勝場數) / Double($0.勝場數 + $0.敗場數)
  return (隊伍: $0.隊伍名, 分區: $0.分區, 勝率: 勝率)
}

let is東區 = 隊伍.filter { $0.分區 == "東區" }.contains(where: { $0.勝率 <= 0.25 })
let is西區 = 隊伍.filter { $0.分區 == "西區" }.contains(where: { $0.勝率 <= 0.25 })

print("🏀 東區和西區個別是否有勝率低於 25% 的隊伍？  東區 \(is東區) ，西區 \(is西區)")

// c. 請整理出一個「只有勝率至少有 60% 的隊伍」的 Array，Array 裡面的每筆資料是「隊伍名稱和勝率的 Tuple」，並將 Array 照勝率從高到低排序後印出。
// * 請把勝率 * 100 並轉成 Int，例如 0.52398 應轉為 52。

let 隊伍2 = teams.map {
  let 勝率 = Int(Double($0.勝場數) / Double($0.勝場數 + $0.敗場數) * 100)
  return (隊伍: $0.隊伍名, 勝率: 勝率)
}.filter { $0.勝率 >= 60 }
  .sorted(by: {
  $0.勝率 > $1.勝率
})

print("💪 勝率 60 % 以上（含）的隊伍: \(隊伍2)")
