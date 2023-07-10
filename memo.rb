require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

#新規作成
if memo_type == 1
  
  #ファイル名入力
  puts "拡張子除いたをファイル名を入力してください"
  file_name = gets.chomp
  
  begin
    #存在しているか判断
    csv = CSV.open("#{file_name}.csv","r")
    csv.close
    puts "すでにそのCSVファイルは存在します"
  rescue
    #作成、テキスト入力
    puts "メモ内容を記入してください"
    puts "記入が完了したらCtrl＋Dを押しましょう"
    get_text = STDIN.read
    
    #csv作成し記入する
    csv = CSV.open("#{file_name}.csv","a")
    csv << [get_text]
    csv.close
    puts "\n#{file_name}.csvが作成されました"
  end

#既存のメモの編集
elsif memo_type == 2

  #ファイル名入力
  puts "既存の拡張子除いたファイル名を入力してください"
  file_name = gets.chomp
  
  begin
    #存在しているか判断
    csv = CSV.open("#{file_name}.csv","r")
    csv.close
    
    #テキスト入力
    puts "メモ内容を記入してください"
    puts "記入が完了したらCtrl＋Dを押しましょう"
    get_text = STDIN.read
    
    #csvに追記する
    csv = CSV.open("#{file_name}.csv","a")
    csv << [get_text]
    csv.close
    puts "\n#{file_name}.csvが編集されました"
  
  rescue
    #存在しない
    puts "そのCSVファイルは存在しません"
    puts "新規作成してください"
  end

else
  puts "値は１ｏｒ２を入力してください"
end