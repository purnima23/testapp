if Rails.env == "development"
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")  
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device.sync = true 
  ActiveMerchant::Billing::Base.mode = :test

  login = "AJ0677-05"
  password="qxm9vxf519rh5768l8uamu45g06j9k6j"
elsif Rails.env == "production"
  login = "AJ0677-05"
  password='qxm9vxf519rh5768l8uamu45g06j9k6j'
end
GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new({
      login: login,
      password: password
})