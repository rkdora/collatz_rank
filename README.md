# Collatz Rank
コラッツ問題を解くプログラムの速度ランキング

## Description
> コラッツの問題は、「任意の正の整数 n をとり、
  n が偶数の場合、n を 2 で割る
  n が奇数の場合、n に 3 をかけて 1 を足す
  という操作を繰り返すと、どうなるか」というものである。  
[出典: コラッツの問題 フリー百科事典『ウィキペディア（Wikipedia）』](https://ja.wikipedia.org/wiki/%E3%82%B3%E3%83%A9%E3%83%83%E3%83%84%E3%81%AE%E5%95%8F%E9%A1%8C)

ユーザーは、コラッツ数列の長さが一番長い整数n（1 < n < 1000000）を求めるプログラムのコードを提出し、速度のランキングを表示する。

![Screenshot from 2019-05-19 14-50-06](https://user-images.githubusercontent.com/20394831/57978455-462bfd00-7a49-11e9-839c-2f5f6cef39b5.png)
![Screenshot from 2019-05-19 14-50-27](https://user-images.githubusercontent.com/20394831/57978456-462bfd00-7a49-11e9-9647-017844f4d796.png)
![Screenshot from 2019-05-19 14-50-32](https://user-images.githubusercontent.com/20394831/57978457-462bfd00-7a49-11e9-964e-3aa45c471fc1.png)


## Features
- ユーザー（新規登録・ログイン・ログアウト）
- コード提出
- コード速度の計測

## Requirement
- Rails 5.2.3
- Ruby 2.6.1

## Usage
ログイン中のみ、コード提出が可能。  
コード提出後、「計測」をクリックすることでコード速度の計測ができる。

## Installation
1. `git clone git@github.com:rkdora/collatz_rank.git`
2. `cd collatz-rank`
3. `bundle install`
4. `rails db:migrate`
5. `rails s`
