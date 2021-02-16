# README

アプリケーション名
→Ankle(釣り師を英語でangler、釣り道具一式をtackle、この二つを掛け合わせて命名)

アプリケーション概要
→動画投稿機能と釣具購入機能を掛け合わせたアプリになります。
 現状釣り道具を購入するには、知り合いの詳しい人や釣具屋にいき店員に聞くなどして購入するのが多い状況です。
 ただ、それだとその人がどれくらいのレベルなのか、そんな場所でどのような経験をしているのかわかりません。
 釣具というのは、その人のレベルに合ったものでないと本来の釣具の良さを発揮できません。
 ですので、どんな経験をしている人がどんな釣具を使っているのかを動画媒体で知ることでより購入に繋がると感じております。

 また、プロのanglerになるためには試験はないので、メディア露出をし、釣具メーカーの目に止まらないとなれません。
 なので、その露出の架け橋にもなればと思い開発しました。

URL
→https://ankle8888.herokuapp.com/

利用方法
→まずは基本的な名前等（本名も含む）を入力していただき、『premium会員』か『standard会員』のどちらかで登録してもらいます。
 （未実装）『premium会員』に関しては、動画投稿と購入のどちらもできます。
  また、自身が投稿した動画から購入された場合インセンティブとして釣具の5％が入ります。※月額500円
 『standard会員』に関しては、購入のみになります。※月額300円
  釣具に関しては、アプリ管理会社から発送するものとし、ユーザー間でのやりとりはなし。
  
目指した課題解決
→動画媒体という今の時代に沿ったもので、購入者としてもより詳しく分かりやすい情報を得ることができる。
 動画投稿者としては、自分の釣具に関して誰かに購入してもらうように魅力を説明することで、もし釣具メーカーがこの投稿を見たときには
 目に留まる可能性が高くなり、プロへの道もグッと引き寄せられることもある。また、購入してもらうように説明し、購入してもらうことで
 単純にインセンティブが発生するのでどちらもウィンウィンの関係が完成する。	

洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。

実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。

実装予定の機能
→タイトル検索機能・インセンティブ計算機能・動画評価機能（いいね等）・ジャンル検索機能・オファー機能（こんな釣具を紹介してほしい）

ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。
これらを記述し終えたら、GitHubの公開リポジトリにPushしましょう。

データベース設計

## users テーブル

| Column               | Type   | Options     |
| ----------           | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| familyname           | string | null: false |
| firstname            | string | null: false |
| familyname_kana      | string | null: false |
| firstname_kana       | string | null: false |
| birthday             | date   | null: false |
| fishing_history      | string | null: false |
| target               | string | null: false |
| spot                 | string | null: false |
| main_rod             | string | null: false |
| main_reel            | string | null: false |
| appeal               | string | null: false |

### Association

- has_many :movies
- has_many :comments

## movies テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| explanation | text       | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| movie       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :movie

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| movie       | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- belongs_to :movie
- has_one :address



## addresses テーブル

| Column              | Type       | Options                        |
| -----------         | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| order               | references | null: false, foreign_key: true |


### Association

- belongs_to :order


##アプリ名

・概要(このアプリでできることを書いて下さい)						
・制作背景(意図)						
⇒どんな課題や不便なことを解決するためにこのアプリを作っろうと思ったのか。						
・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)						
⇒できている範囲で貼り付けましょう。						
・実装予定の内容						
・DB設計						

# Ankle
 
"Ankle" is an app that combines video posting and fishing tackle purchase.

# Overview

First, enter your basic name (including your real name) and have them register as either a "premium member" or a "standard member".
 (Not implemented) For "premium members", you can both post videos and purchase.
  Also, if you purchase from the video you posted, 5% of the fishing tackle will be included as an incentive. * 500 yen per month
 For "standard members", you can only purchase. * 300 yen per month
  Regarding fishing tackle, it shall be shipped from the application management company, and there is no exchange between users.

# Production background

Currently, in order to purchase fishing equipment, it is common to go to a person who is familiar with the fishing tackle or a fishing tackle shop and ask a clerk to purchase it.
 However, I don't know what level the person is or what kind of experience they have in such a place.
 Fishing tackle cannot demonstrate the original goodness of fishing tackle unless it matches the level of the person.
 Therefore, I feel that knowing what kind of fishing tackle people are using with video media will lead to more purchases.

 Also, there is no test to become a professional angler, so you have to expose the media and catch the eye of the fishing tackle maker.
 Therefore, I developed it with the hope that it would also serve as a bridge for that exposure.


# DEMO
 
###### top page
 
![demo](https://gyazo.com/ad0f11c7a6fd9d482016e03b17de0ca5)
 
This page shows videos about fishing tackle posted by various users.


###### New registration screen

![]()

# Features
 
 
# Requirement
 
* Python 3.6.5
* pyxel 1.0.2
 
Environments under [Anaconda for Windows](https://www.anaconda.com/distribution/) is tested.
 
```bash
conda create -n pyxel pip python=3.6 Anaconda
activate pyxel
```
 
# Installation
 
Install Pyxel with pip command.
 
```bash
pip install pyxel
```
 
# Usage
 
Please create python code named "demo.py".
And copy &amp; paste [Day4 tutorial code](https://cpp-learning.com/pyxel_physical_sim4/).
 
Run "demo.py"
 
```bash
python demo.py
```
 
# Note
 
I don't test environments under Linux and Mac.
 
# Author
 
* Hayabusa
* R&D Center
* Twitter : https://twitter.com/Cpp_Learning
 
# License
 
"Physics_Sim_Py" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
 
Enjoy making cute physics simulations!
 
Thank you!