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


[![Image from Gyazo](https://i.gyazo.com/ad0f11c7a6fd9d482016e03b17de0ca5.gif)](https://gyazo.com/ad0f11c7a6fd9d482016e03b17de0ca5)

 
This page shows videos about fishing tackle posted by various users.


###### New registration screen

[![Image from Gyazo](https://i.gyazo.com/7464bdd4534a61f5b031ec003db2b90d.gif)](https://gyazo.com/7464bdd4534a61f5b031ec003db2b90d)

On this page, register a new user.
Since it is a fishing app, you will be asked to enter information related to fishing.


###### Video posting screen

[![Image from Gyazo](https://i.gyazo.com/59d0b3c2395c89b3220478df219260da.gif)](https://gyazo.com/59d0b3c2395c89b3220478df219260da)


Ask them to prepare a "title", "description", "fixed price", and "video file" and post them.
Currently, we ask you to enter the list price once, but in the future, we would like to manage the name and ID of the fishing tackle to some extent so that it can be displayed without having to enter the list price in association with it.
In addition, the reason why we want to display the list price is that the operating company and inventory management shipping company wants to offer their own discount.


###### Video details display screen

[![Image from Gyazo](https://i.gyazo.com/6a42b0ad09f053ae4fb12f458effb3a5.gif)](https://gyazo.com/6a42b0ad09f053ae4fb12f458effb3a5)

On this screen, "Title", "Description", "Fishing tackle price", "Purchase button" are displayed, and you can also play the video.
You can also comment on your requests and questions about the video in the comments section.

###### Purchase screen

[![Image from Gyazo](https://i.gyazo.com/f09439eaa80f46620520c22857413183.gif)](https://gyazo.com/f09439eaa80f46620520c22857413183)

The fishing tackle purchase function uses credit card payment, and validation is built so that you cannot purchase without entering the default card information.

###### User details screen

[![Image from Gyazo](https://i.gyazo.com/a184164fe86a015c91af82674dcbcc00.gif)](https://gyazo.com/a184164fe86a015c91af82674dcbcc00)

Details for each user can be seen.
In addition, the card information is conditional so that other users cannot see it.



# Features to be implemented

1、Membership registration selection and subscription function
→ Registration is divided between premium members and standard members, and each is a monthly fee.

2, video search function
→ Title search and category search are possible

3, designated video display function
→ You can display only the categories you are interested in, or display them in descending order of the number of likes.

4, video favorite function
→ You can specify your favorite videos for each user and manage them on My Page.

5, video "Like" function
→ You can rate the video you like as you like it.
 
# DB design
 
## users table

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

## movies table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| explanation | text       | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## comments table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| movie       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :movie

## orders table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| movie       | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- belongs_to :movie
- has_one :address



## addresses table

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
 

## cards table

| Column           | Type       | Options                        |
| -----------      | ---------- | ------------------------------ |
| card_token       | string     | null: false                    |
| costomer_token   | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

