// 【ChaoCode】 Swift 基礎篇 5：Bool 和條件運算子實作作業

// ⚠️ 注意這次的寫法比較不同，你只要編輯👇符號下面的內容即可，編輯範圍到 print 那行（包含 print），這之間你可以任意新增行數，如果還是不確定可以看影片結尾有解釋。
// 這個寫法是為了讓你能比較輕鬆測試不同結果，我把你的 code 包進 function 裡面。現在看不懂沒關係，function 是我們這系列之後會學到的內容。

// 1. 根據不同體重和身高印出不同訊息。

func 體重檢測(weight: Double, height: Double) {
    print("🌼 體重：\(weight) 公斤，身高 \(height * 100) 公分")
    // 👇 體重低於 50 時印出「不能捐血」；50 或 50 以上印出可以捐血。
    
    let isAllow = (weight < 50) ? "不能捐血" : "可以捐血"
    print(isAllow)
    // 👇 計算出 BMI: 體重 / (身高 * 身高)
    let bmi = weight / (height * height)
    print("你的 BMI 是：\(bmi)")
    // 👇 BMI 小於等於 18.5 時印出「過瘦體型」；BMI 大於等於 30 時印出「過胖」；其餘印出「正常體型」。
    
    let isThin = (bmi <= 18.5) ? "過瘦體型" : (bmi > 30) ? "過胖" : "正常體型"
    
    print(isThin, terminator: "\n\n")
}

體重檢測(weight: 47.95385, height: 1.61)
體重檢測(weight: 75, height: 1.75)
體重檢測(weight: 130, height: 1.80)


// 2. 因應虎年，商店舉辦了名字裡有虎的客人可以獲得優惠的活動。請根據客人名字印出他能獲得多少優惠。


func 名字優惠活動(name: String) {
    // 👇 請印出正確的折扣資訊。名字裡有虎的人可以打 8 折；名字開頭是虎的人可以打 5 折；其餘沒有折扣。
    
    let hasDiscount = name.first == "虎" ? "打五折" : name.contains("虎") ? "打八折" : "沒折扣"
    
    print("📢 名字是 \(name) 的客人，您可以獲得 \(hasDiscount)", terminator: "\n\n")
}


名字優惠活動(name: "小老虎")
名字優惠活動(name: "虎牙妹")
名字優惠活動(name: "小貓咪")
