class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy, :update]
  skip_before_action :require_Admin,only: [:new, :create,:join_new,:join_create]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact.toggle!(:checked) if !@contact.checked
    @home = @contact.event
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    if params[:title] == "I want to be a teacher"
      @title_value = params[:title]
      @message_value = "【Nearest station】\n【type of visa】\n【Gender】\n【Age】\n"
    end
    if params[:title] == "Meet up English Group × 町田コンディショニングジム健介"
      @title_value = params[:title]
      @message_value = "【日程】11/30 16:00~17:30\n【料金】1500円\n【場所】町田コンディションニングジム健介\n町田市根岸2丁目1-20TMビル3F"
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
    @event = Event.find(params[:id])
    @contact = @event.contacts.new
    @title_value = "I want to go to Meet up English"
    @message_value =
      if @event.cafe.id == 2 #カフェが武相庵なら、
        "【希望滞在時間】〇〇:〇〇～〇〇:〇〇\n*#{ @event.start.strftime("%H:%M") }～#{ @event.end.strftime("%H:%M") }の間で予定滞在時間を↑に記入してください\n\n【形態】1:3(最大)\n【日程】#{@event.date.strftime("%Y年 %m月 %d日")}\n【場所】#{@event.city.name}:#{@event.cafe.name}\n【料金】1000円/h\n*カフェにつき、ワンオーダーあり"
      else
        "【形態】マンツーマン\n【時間】#{ @event.start.strftime("%H:%M") }～#{ @event.end.strftime("%H:%M") }\n【日程】#{@event.date.strftime("%Y年 %m月 %d日")}\n【場所】#{@event.city.name}:#{@event.cafe.name}\n【料金】1700円/h\n*カフェにつき、ワンオーダーあり"
      end
    render :new
  end



  # PUSH contacts/:id/create
  def join_create
    @contact = Event.find(params[:id]).contacts.new
    @content = 'reservation'
    @content_ja = 'ご予約'
    if @contact.update(contact_params)
      render :thanks
    else
      render :new
    end
  end

  def update
    @contact.update(name: params[:contact][:name])
    redirect_to contacts_path
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
