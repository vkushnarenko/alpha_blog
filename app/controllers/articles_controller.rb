class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    

def index
    @articles= Article.paginate(page: params[:page], per_page: 2)
end

def new
    @article = Article.new
end

def create
  #render plain: params[:article].inspect 
  @article = Article.new(article_params)
  @article.user = User.first
   if @article.save
       flash[:success] = "Successfully created"
   redirect_to article_path(@article)
   else        
   render 'new'   
   end
end    

def edit
end    

def update
    #render plain: params[:article].inspect 
   if @article.update(article_params)
       flash[:success] = "Successfully updated"
   redirect_to article_path(@article)
   else        
   render 'new'   
   end  
end

def show
end 


def destroy
   @article.destroy
   flash[:danger] = "Successfully deleted"     
   redirect_to articles_path
end

    
private

def set_article
    @article = Article.find(params[:id])
end

def article_params
    params.require(:article).permit(:title, :description)
end

end
    