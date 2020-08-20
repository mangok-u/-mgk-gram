class Api::V1::PostsController < ApiController
  before_action :set_post, only: [:show,:update,:destroy]

 # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
 rescue_from Exception, with: :render_status_500

 # ActiveRecordのレコードが見つからなければ404 not foundを応答する
 rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    # @posts = Post.with_attached_mgk_image
    @posts = Post.with_attached_mgk_image.order(id: "desc")

    
   
    render 'index', formats: :json, handlers: 'jbuilder'
    # シンボル！！！！！！！
  end

  def show
    render 'show', formats: :json, handlers: 'jbuilder'
  end

  def create
   binding.pry
    @post=Post.new(post_params)
  
    if @post.save
      @post.parse_base64(params[:image])
    
   
      render json: @post, staus: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
        # beforeアクション忘れでunpermitted
   
    if @post.update_attributes(post_params)
      # すでに保存されていると、data名でエラーが怒るので新たな画像来た時だけ
      unless params[:image].include?("active_storage") 
        @post.parse_base64(params[:image])
      end
      head :no_content
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def destroy
  
    @post.destroy!
    head :no_content
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      # params.fetch(:post, {}).permit(:name,:text,:image)
      params.require(:post).permit(:text,:image,:user_id)
       #  userパラメータがなかったときはActionController::ParameterMissingのエラーが起きるようになっています。
# 上記の設定をしてあるとuserパラメータの代わりに{}がデフォルト値として評価されるようになります。
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end

end