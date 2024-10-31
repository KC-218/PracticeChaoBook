// 【ChaoCode】 Swift 基礎篇 19A：Closure 實作作業
//
// ⚠️ 請在不使用 Loop 語法的情況完成這次的每一項作業。
//
// 1. 請把箱子由大到小堆疊，從最下面開始，先放最寬的箱子，如果遇到寬度一樣箱子則先放較厚的箱子。
// ＊Box 是一個有寬度（width）和高（height）的 Tuple。
// 👇 請把這疊箱子改成從大到小排序。（也就是要放在下面的應在 Array 前面。）
let boxes: [Box] = [(2, 1), (1, 1), (4, 1), (6, 1), (4, 3)]

let sorted1Closure = { (box1: Box, box2: Box) -> Bool in
  box1.width > box2.width || (box1.width == box2.width && box1.height > box2.height)
}

let sortedBoxes = boxes.sorted(by: sorted1Closure)

print("排序後的箱子順序是 \(sortedBoxes)")
// 你可以使用下面這個 function 印看看箱子疊起來的樣子。
drawBoxes(sortedBoxes)


// 👇 上面的 box 排序成功後，請呼叫「箱子疊疊樂」function，這個 function 會用你提供的排序方式重新排列 13 組箱子，請用和第一題同樣的規則來重新排列這些箱子。
// 如果不確定為什麼不對的話，也可以自己使用上面的 drawBoxes() 來看看有什麼不一樣。
箱子疊疊樂(排序: sorted1Closure)

// 2. 請設計一個把一組撲克牌組按照「大老二」大小規則，由大到小重新排序，並回傳排序後的牌組的 Function。
// 大小規則：先比數字大小，假如同大小的話再比花色。
// ＊號碼大小：2 > A > K > Q > J > 10 > 9 > 8 > 7 > 6 > 5 > 4 > 3
// ＊花色大小：黑桃 > 紅心 > 方塊 > 梅花
// 💡 你可以設計一個幫助你對照大小的 Dictionary。
// 你的 function 應接收一個「撲克牌的 Array」並回傳一個「撲克牌的 Array」
// ＊撲克牌是 (花色: String, 號碼: String) 的別稱。

// 👇 請呼叫「大老二排序測試」這個 function 測試你的 function。你會需要把你設計的 function 當作引數丟進去。

let numberDic: [String: Int] = ["2": 15, "A": 14, "K": 13, "Q": 12, "J": 11, "10": 10, "9": 9, "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3]
let flowerDic: [String: Int] = ["黑桃": 4, "紅心": 3, "方塊": 2, "梅花": 1]

typealias Card = (花色: String, 號碼: String)

let sorted2Closure = { (cards: [Card]) -> [Card] in
  
  let sortedCards = cards.sorted { card1, card2 in
    if numberDic[card1.號碼]! > numberDic[card2.號碼]! {
      return true
    } else if numberDic[card1.號碼]! < numberDic[card2.號碼]! {
      return false
    } else {
      return flowerDic[card1.花色]! > flowerDic[card2.花色]!
    }
  }
  
  return sortedCards
}

大老二排序測試(sorted2Closure)
