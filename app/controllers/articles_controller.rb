class ArticlesController < ApplicationController

    #GET /articles
    def index
        #Todos registros SELECT ALL
        @articles = Article.all 
    end
    #GET /articles/:id
    def show
        #Encontrar un registro por id
        @article = Article.find(params[:id])
    end

    #GET /articles/new
    def new
        @article = Article.new
    end
    #POST /articles
    def create
        #INSERT INTO
        @article = current_user.articles.new(article_params)
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end
    #ELimina el objeto de la BD
    def destroy
        #DELETE FROM
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    #PUT /articles/:id
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    #EDIT articles
    def edit
        @article = Article.find(params[:id])
    end

    private

    def article_params
        params.require(:article).permit(:title,:body)
    end

end