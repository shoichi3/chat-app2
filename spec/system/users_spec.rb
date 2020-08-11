require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない場合，サインインページへ遷移する' do
    #トップページに遷移する
    visit root_path
    #ログインしていない場合，サインインページに遷移する
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し，ルートパスに遷移する' do
    #予めユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    #サインインページに遷移する
    visit new_user_session_path
    #ログインしていない場合サインインページへ遷移することを期待する
    expect(current_path).to eq new_user_session_path
    #すでに保存されているemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    #ログインボタンをクリックする
    # find('input[name="commit"]').click
    click_on('Log in')
    #ルートページに遷移されていることを期待する
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗し，再びサインインページに戻ってくる' do
    #予めユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    #サインインページに遷移する
    visit new_user_session_path
    #ログインしていない場合サインインページへ遷移することを期待する
    expect(current_path).to eq new_user_session_path
    #誤ったユーザー情報を入力する
    fill_in 'user_email', with: "aneagaraha"
    fill_in 'user_password', with: "fjanaa@fae.com"
    #ログインボタンをクリックする
    click_on('Log in')
    #サインインページに遷移されていることを期待する
    expect(current_path).to eq new_user_session_path
  end
end
