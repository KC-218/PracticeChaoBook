// 【ChaoCode】 Swift 基礎篇 18：Function 實作作業
//
//
// 1. 請根據下列規則設計判斷生肖的 Function。
//      a. 單純用陽曆過年判斷，不考慮農曆。
//      b. 請設計兩個名字都是「查生肖」的 Function。
//      c. 一個需要名為「西元年」的 Int 屬性參數；另一個需要名為「國曆年」的 Int 屬性參數。
//      d. 兩個 Function 的回傳值都是 String，也就是對應的生肖。

//        [  4    5     6    7     8     9    10   11    0,    1,   2  ,  3 ]
let 生肖 = ["鼠", "牛", "虎", "兔", "龍", "蛇", "馬", "羊", "猴", "雞", "狗", "豬"]


public func 查生肖(西元年: Int) -> String {
  let index = (西元年 + 8) % 12
  let animal = 生肖[index]
  return animal
}

public func 查生肖(國曆年: Int) -> String {
  let 西元 = 國曆年 + 1911
  let animal = 查生肖(西元年: 西元)
  return animal
}

// 👆 在上面寫完你的 Function 後請 Uncomment 下面這行進行測試，請勿更改任何內容，如果無法執行表示你的 Function 設計不正確。
 生肖測試(西元年: 查生肖(西元年:), 國曆年: 查生肖(國曆年:))

// 2. 請根據下面規則設計數字相乘的 Function。
//      a. Function 名稱為「相乘」。
//      b. Function 接受兩個參數，兩個參數在呼叫使用時都不需要輸入標籤。
//      c. 兩個參數都「必須要」能接受「Int、Double、Decimal」任何一種數字類型並回傳 Double。你可以用設計多個同名稱的 Function 來解決這個問題。
//      d. 計算方法是把兩個數字都先都轉成 Double 後再相乘。
// 💡 如果你想對 Generic 設定一個以上的 Protocol 的話，可以用 & 區分。例如：Element: Hashable & Comparable。
// 💡 如果需要的話，Google 文件上還有其他提示。


func 相乘<T1: Numeric & CustomStringConvertible, T2: Numeric & CustomStringConvertible>(_ lhs: T1, _ rhs: T2) -> Double {
  let result = Double(lhs.description)! * Double(rhs.description)!
  return result
}


// 👆 在上面寫完你的 Function 後請 Uncomment 下面「全部」內容進行測試，請勿更改任何內容，如果無法執行表示你的 Function 設計不正確。

resetCounter()
for index in 0...4 {
    secondTest(相乘(intNumbers[index], intNumbers[index]))
    secondTest(相乘(doubleNumbers[index], doubleNumbers[index]))
    secondTest(相乘(decimalNumbers[index], decimalNumbers[index]))
    for index2 in 0...4 {
        if (index != index2) {
            secondTest(相乘(intNumbers[index], intNumbers[index2]))
            secondTest(相乘(doubleNumbers[index], doubleNumbers[index2]))
            secondTest(相乘(decimalNumbers[index], decimalNumbers[index2]))
        }

        secondTest(相乘(intNumbers[index], doubleNumbers[index2]))
        secondTest(相乘(intNumbers[index], decimalNumbers[index2]))
        secondTest(相乘(doubleNumbers[index], intNumbers[index2]))
        secondTest(相乘(doubleNumbers[index], decimalNumbers[index2]))
        secondTest(相乘(decimalNumbers[index], intNumbers[index2]))
        secondTest(相乘(decimalNumbers[index], doubleNumbers[index2]))
    }
}

print("✅ 您的相乘 function 沒有問題")
