class DeviseCreateEntrepreneurs < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default user
    Entrepreneur.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if direction == :up
  end

  def change
    create_table(:entrepreneurs) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
    end

    add_index :entrepreneurs, :email,                unique: true
    add_index :entrepreneurs, :reset_password_token, unique: true
    # add_index :entrepreneurs, :confirmation_token,   unique: true
    # add_index :entrepreneurs, :unlock_token,         unique: true
  end
end