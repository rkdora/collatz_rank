# Progrm Circuit
プログラムの速度をランキング化する

## Description
異なるプログラムの速度を比較し、ランキング化する。
![Screenshot from 2019-05-23 12-13-15](https://user-images.githubusercontent.com/20394831/58223346-374c8f80-7d54-11e9-848a-332c8c9b6560.png)


## Features
- ユーザー（新規登録・ログイン・ログアウト）
- テーマ作成
- コード提出
- コード速度の計測

## Requirement
- Rails 5.2.3
- Ruby 2.6.1
- Racket 7.2

## Usage
ログイン中のみ、コード提出・テーマ作成が可能。  
コード提出後、「計測」をクリックすることでコード速度の計測ができる。

## Installation
1. `git clone git@github.com:rkdora/collatz_rank.git`
2. `cd collatz-rank`
3. `bundle install`
4. `rails db:migrate`
5. `rails s`
