// 【ChaoCode】 Swift 基礎篇 16：Dictionary 實作作業
//
// 1. 這一題是練習 Dictionary 基本操作，請跟著以下步驟完成。
//
// 1️⃣ 建立一個空的翻譯機 Dictionary 變數，Key 和 Value 都是 String。
var 翻譯機: [String: String] = [:]
// 2️⃣ 下面 Array 裡的 Tuple 第一個位置是全為小寫的英文，第二個位置是對應的中文翻譯。請透過迴圈把這些資料都放進翻譯機裡，用英文當作 Key，中文當作 Value。
let 翻譯 = [
  ("and", "和"), ("is", "是"), ("taiwan", "台灣"), ("love", "愛"), ("i", "我"),
  ("hotpot", "火鍋"), ("awesome", "牛"),
]

翻譯.forEach { element in
  翻譯機[element.0] = element.1
}

// 3️⃣ 透過翻譯機印出 Taiwan 的中文。

print("Taiwan 的中文是「\(翻譯機["taiwan"]!)」")

// 4️⃣ 把 awesome 的翻譯改成棒棒。

翻譯機["awesome"] = "棒棒"

// 5️⃣ 透過翻譯機翻譯「I love hotpot」並印出中文。
// 💡 你會需要使用 String 中 「.split(separator:)」這個方法。
let sentence = "Hotpot is awesome and I love hotpot"
let splitArray = sentence.split(separator: " ")
var finalSentence = ""

splitArray.forEach { element in
  let k = element.lowercased()
  let word = 翻譯機[k]!
  finalSentence += word
}

print("\(sentence) 的中文是「\(finalSentence)」")

// 2. 請透過奧斯卡入圍名單資料，計算每部電影總共入圍幾個獎項，最後印出入圍最多獎項的電影以及「沙丘」入圍幾個獎項。
// 💡 找出入圍最多獎項這點其實有一個 .sorted 方法可以使用，但因為我們還沒有學過 closure，所以請先用迴圈的方式找哦。

let 奧斯卡入圍名單 = 取得奧斯卡入圍名單()
//var 電影入圍獎項: [String: Int] = [:]
//var 次數最多電影: String = ""
//
//for (獎項, movies) in 奧斯卡入圍名單 {
//  movies.forEach { movie in
//    if 電影入圍獎項[movie] == nil {
//      電影入圍獎項[movie] = 1
//    } else {
//      var 次數 = 電影入圍獎項[movie]! + 1
//      電影入圍獎項[movie] = 次數
//    }
//  }
//}
//
//for (電影, 次數) in 電影入圍獎項 {
//  if 次數最多電影.isEmpty {
//    次數最多電影 = 電影
//  } else {
//    let 最多次數 = 電影入圍獎項[次數最多電影]!
//    if 次數 > 最多次數 {
//      次數最多電影 = 電影
//    }
//  }
//}
//
//let 沙丘入圍幾項 = 電影入圍獎項["沙丘"]!
//print("📣 入圍最多獎項的電影是「\(次數最多電影)」")
//print("🏜 沙丘入圍了 \(沙丘入圍幾項) 個獎項")

//MARK: Test sorted
var 電影入圍獎項 = Dictionary<String, Int>.init(minimumCapacity: 10)

for (獎項, 入圍電影列表) in 奧斯卡入圍名單 {
  入圍電影列表.forEach { movie in
    電影入圍獎項[movie, default: 0] += 1
  }
}

let 排序結果 = 電影入圍獎項.sorted { $0.value > $1.value }

print("📣 入圍最多獎項的電影是「\(排序結果.first!.key)」")
