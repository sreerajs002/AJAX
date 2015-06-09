class ProductsController < ApplicationController

  # GET /products
  # GET /products.json
  $pid= (Product.all.order('pid DESC').first)? Product.all.order('pid DESC').first.pid.to_i : 9999
  def index
    @products = Product.all.order('pid DESC')
    @product=[]
  end

  def update_text
    puts "============ #{params["pid"]}============="
    $pid+=1
    pid=(params["pid"])? params["pid"]: $pid
    flag=(params["pid"])? 0:1
    @flag=(params["pid"])? "Updat": "Creat"
     @ar=["#{pid}","#{params["name"]}","#{params["cost"]}",flag]
    @flash="Name cant be empty" if params[:name]==""
    @flash="Cost cant be other than number" if params[:cost].to_i.to_s!=params[:cost]
    @flash="Cost cant be empty" if params[:cost]==""

    if @flash
      respond_to do |format| 
         format.js 
       end
    else  
      @pr=Product.find_or_initialize_by( pid:"#{pid}")
      @flash=false if @pro 
      @pro=@pr.update_attributes!(name: "#{params["name"]}", cost: "#{params["cost"]}")
      respond_to do |format| 
         format.js 
      end
    end
  end
  def delete_text
    puts "============ #{params["pid"]}============="
    
    product = Product.find_by(pid: "#{params["pid"]}")
    @del=product.destroy
       respond_to do |format|           
          format.js 
    end
      end
end
