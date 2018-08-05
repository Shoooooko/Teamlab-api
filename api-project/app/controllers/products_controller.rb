class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    if @products = Product.all
      render json: @products
    else
      render status: 400, json: { status: 400, message: 'Unauthorized input' }
    end
  end

  # GET /products/1
  #resourceの表示
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      #render json: @product, status: :created, location: @product
      render status: 200, json: { status: 200, message: "Success"}
    else
      #render json: @product.errors, status: :unprocessable_entity
      render status: 400, json: { status: 400, message: 'Bad Request' }
    end
  end



  # PATCH/PUT /products/1
  #resourceの更新、保存
  def update
    @Product= Product.find(params[:id])
    #更新されている"カラム＝値”のペアをすべてupdate
    if @product.update_all(product_params)
      #render json: @product
      render status: 200, json: { status: 200, message: "Success"}

    else
      #render json: @product.errors, status: :unprocessable_entity
      render status: 400, json: { status: 400, message: 'Bad Request' }
    end
  end

  #編集するデータをとってくる
  def edit
    @Product= Product.find(params[:id])
  end

  # DELETE /products/1
  #削除
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      #クライアントから入力された商品IDの情報をすでに登録されているDBから取ってくる 
      #/product/1
      @product = Product.find(params[:id])
      
    end

    # Only allow a trusted parameter "white list" through.
    #入力のparams[:id]に紐づいたbodyん内容を取得
    def product_params
      params.fetch(:product, {}).permit(:Item, :content, :image_name, :price)
    end
end

'''#リクエストの返し方
# 200 Success
def response_success(class_name, action_name)
  render status: 200, json: { status: 200, message: "Success #{class_name.capitalize} #{action_name.capitalize}" }
end

# 400 Bad Request
def response_bad_request
  render status: 400, json: { status: 400, message: "Bad Request" }
end

# 401 Unauthorized
def response_unauthorized
  render status: 401, json: { status: 401, message: "Unauthorized"}
end

# 404 Not Found
def response_not_found(class_name = "page")
  render status: 404, json: { status: 404, message: "#{class_name.capitalize} Not Found" }
end

# 409 Conflict
def response_conflict(class_name)
  render status: 409, json: { status: 409, message: "#{class_name.capitalize} Conflict" }
end

# 500 Internal Server Error
def response_internal_server_error
  render status: 500, json: { status: 500, message: "Internal Server Error"}
end
'''