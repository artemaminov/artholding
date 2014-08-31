class Order < ActionMailer::Base

  default to: ENV['GMAIL_USERNAME'],
          charset: "UTF-8",
          content_type: "text/plain"

  def complete(order)
    @order = order
    @group = Group.find order['group']
    email_with_name = "#{order['name']} <#{order['email']}>"
    mail(from: email_with_name, subject: 'Сообщение о возможном заказе с моего сайта')
  end


end
