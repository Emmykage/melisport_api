class RenameRefCodeToReferralCodeOnOrderDetails < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_details, :ref_code, :referral_code
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
