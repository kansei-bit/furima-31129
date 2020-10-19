# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      @PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: "", with: @PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
      t.string :nickname, null: false, default: ""
      t.string :lname, null: false, default: ""
      t.string :fname, null: false, default: ""
      t.string :lname_katakana, null: false, default: "", format: { with: /^[ァ-ンヴー]*$/, message: '全角文字を使用してください' } 
      t.string :fname_katakana, null: false, default: "", format: { with: /^[ァ-ンヴー]*$/, message: '全角文字を使用してください' } 
      t.date :birth_date, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end