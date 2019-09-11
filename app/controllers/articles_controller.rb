class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :set_article, except: [:index, :new, :create]
    #GET /articles
    def index
        #Todos registros SELECT ALL
        @articles = Article.all 
    end
    #GET /articles/:id
    def show
        @article.update_visits_count
        @comment = Comment.new
    end

    #GET /articles/new
    def new
        @article = Article.new
        @categories = Category.all
    end
    #POST /articles
    def create
        #INSERT INTO
        @article = current_user.articles.new(article_params)
        @article.categories = params[:categories]
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end
    #ELimina el objeto de la BD
    def destroy
        #DELETE FROM
        @article.destroy
        redirect_to articles_path
    end
    #PUT /articles/:id
    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    #EDIT articles
    def edit
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def validate_user
        redirect_to new_user_session_path, notice:  "Necesitas iniciar sesion"
    end

    def article_params
        params.require(:article).permit(:title,:body,:cover,:categories)
    end

end