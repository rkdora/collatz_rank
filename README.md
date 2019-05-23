# Progrm Circuit
プログラムの速度をランキング化する

## Description
異なるプログラムの速度を比較し、ランキング化する。

## Features
- ユーザー（新規登録・ログイン・ログアウト）
- テーマ作成
- コード提出
- コード速度の計測

## Requirement
- Rails 5.2.3
- Ruby 2.6.1

## Usage
ログイン中のみ、コード提出・テーマ作成が可能。  
コード提出後、「計測」をクリックすることでコード速度の計測ができる。

## Installation
1. `git clone git@github.com:rkdora/collatz_rank.git`
2. `cd collatz-rank`
3. `bundle install`
4. `rails db:migrate`
5. `rails s`
