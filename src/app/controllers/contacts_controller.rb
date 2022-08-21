class ContactsController < ApplicationController
  def index
      @contact = Contact.new
    end
   
    def confirm
      @contact = Contact.new(contact_params)
      #contacを作る
      if @contact.valid?
      #contactにバリデーションが実行されると
        render :action => 'confirm'
      else
        render :action => 'index'
      end
    end

    def done
      @contact = Contact.new(contact_params)
      if params[:back]
      #backだった場合
        render :action => 'index'
      else
        ContactMailer.send_mail(@contact).deliver_now
        #自分用のメール
        ContactMailer.send_mail_client(@contact).deliver_now
        #相手用のメール
        render :action => 'done'
      end
    end

    private
      def contact_params
        params.require(:contact).permit(:name, :email, :content)
      end
end