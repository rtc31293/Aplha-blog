class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def new
        @article = Article.new
    end
    
    def edit
        set_article
    end
    
    def update
        set_article
        
        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated."
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def create
       @article = Article.new(article_params)
       
       if @article.save
           #do something
           flash[:notice] = "Article was successfully created!"
           redirect_to article_path(@article)
       else
           render 'new'
       end
    end
    
    def show
       set_article
    end
    
    def index
        @articles = Article.all
    end
    
        
    def destroy
        set_article
        @article.destroy
        flash[:notice] = "The article has been deleted!"
        redirect_to articles_path
    end
    
    private
    
    def article_params
        params.require(:article).permit(:title, :description)
    end
    
    def set_article
        @article = Article.find(params[:id])
    end

    
end