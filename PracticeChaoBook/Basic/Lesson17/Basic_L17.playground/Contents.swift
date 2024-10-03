// 【ChaoCode】 Swift 基礎篇 17：Protocol & Generic 實作作業
//
// 💡 這兩題都是練習 String 的 Index 操作，所以你可能會想讀一下 String 文件裡頭「Manipulating Indices」這個分類下的屬性和方法。
//
// 1. 請印出位置所對應的 Character，你可以假設 string 不會是空的和 position 的數值大於 0 並且不大於 string.count。
// 例如：string 是 "Hello"，position 是 2 的話應印出 e。
//      string 是 "很好👍🏾"，position 是 3 的話應印出 👍🏾。

func 印出指定位置(_ string: String, position: Int) {
  var index = string.startIndex
  var count = 1

  while index != string.endIndex, count < position {
    let nextIndex = string.index(after: index)
    index = nextIndex
    count += 1
  }
  print(string[index])
}

func 印出指定位置2(_ string: String, position: Int) {
  // 👇 請從這邊開始編輯，最後記得要改 print 的內容。
  if !string.isEmpty || position > 0 && position <= string.count {
    let index = string.index(string.startIndex, offsetBy: position - 1)
    let character = string[index]
    print("\(character)")
  }
}

// 2. 請檢查一個 input 是不是迴文字，你可以假設 string 一定不是空的且一定是小寫。
// 💡 迴文字指的是反過來看也一模一樣，例如「文言文」。
// 💡 CustomStringConvertible 是一個能把他的資料轉換成 String 的 Protocol，你可以看一下文件要怎麼拿到轉換後的 String。
// ⚠️ 請不要使用 .reversed() 方法。

func 迴文測試(_ input: CustomStringConvertible) -> Bool {
  var 是迴文 = true
  let string = input.description
  var startIndex = string.startIndex
  var endIndex = string.index(before: string.endIndex)

  while startIndex < endIndex && 是迴文 {
    是迴文 = string[startIndex] == string[endIndex]
    startIndex = string.index(after: startIndex)
    endIndex = string.index(before: endIndex)
  }

  return 是迴文
}

func 迴文測試2(_ input: CustomStringConvertible) -> Bool {
  // 👇 請從這邊開始編輯。
  var 是迴文 = true // 請勿修改這個變數名稱，但是你可以更改初始值，記得判斷完是否為迴文之後要把結果賦予這個變數。

  if input.description.isEmpty || (input.description == input.description.lowercased()) {
    var newInput = ""
    let count = input.description.count

    for i in stride(from: count - 1, to: -1, by: -1) {
      let index = input.description.index(input.description.startIndex, offsetBy: i)
      let character = input.description[index]
      newInput.append(character)
    }

    if input.description != newInput {
      是迴文 = false
    }
  }
  // ⚠️ 請勿刪除和編輯這行以下的內容。
  return 是迴文
}

作業檢查(第一題: 印出指定位置, 第二題: 迴文測試)
