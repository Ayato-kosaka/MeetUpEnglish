class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy]
  skip_before_action :require_Admin,only: [:new, :create,:join_new,:join_create]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact.update(checked: true) if !@contact.checked
    @home = @contact.home
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    if params[:title] == "I want to be a teacher"
      @title_value = params[:title]
      @message_value = "【Nearest station】\n【type of visa】\n【Gender】\n【Age】\n"
    end
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @content = 'inquiry'
    @content_ja = 'お問い合わせ'
    if @contact.save
      render :thanks
    else
      render :new
    end
  end


  # GET /contacts/1/join
  def join_new
    @home = Home.find(params[:id])
    @contact = @home.contacts.new
    @title_value = "I want to go to Meet Up English"
    @message_value = "【希望滞在時間】〇〇:〇〇～〇〇:〇〇\n*#{ @home.start.strftime("%H:%M") }～#{ @home.end.strftime("%H:%M") }の間で予定滞在時間を↑に記入してください\n\n 【日程】#{@home.date.strftime("%Y年 %m月 %d日")}\n【場所】#{City.find(@home.cityId).name}:#{Cafe.find(@home.cafeId).name}\n"

    render :new
  end



  # PUSH contacts/:id/create
  def join_create
    @contact = Home.find(params[:id]).contacts.new
    @content = 'reservation'
    @content_ja = 'ご予約'
    if @contact.update(contact_params)
      render :thanks
    else
      render :new
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :title, :message)
    end
end
