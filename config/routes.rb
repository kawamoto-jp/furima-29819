Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
end

ルートパスを書く
rails routesでdeviseのルーティングがわかる
そのパスをログイン、新規登録ボタンに貼る