module Api
    class CocktailsController < ApplicationController
      def search
        index = params[:index].to_i || 0
        limit = params[:limit].to_i || 10
        query = params[:query].to_s
  
        cocktails = if query.present?
                      Cocktail.where("name LIKE ?", "%#{query}%")
                    else
                      Cocktail.all
                    end
  
        total_count = cocktails.count
        drinks = cocktails.offset(index).limit(limit).map do |cocktail|
          {
            id: cocktail.id,
            name: cocktail.name,
            category: cocktail.category,
            image: cocktail.image
          }
        end
  
        render json: { drinks: drinks, totalCount: total_count }
      end
  
      def detail
        cocktail = Cocktail.find_by(id: params[:id])
        if cocktail
          render json: {
            drinks: [
              {
                id: cocktail.id,
                name: cocktail.name,
                category: cocktail.category,
                container: cocktail.container,
                instructions: cocktail.instructions,
                image: cocktail.image,
                ingredients: cocktail.ingredients.map do |ingredient|
                  {
                    name: ingredient.name,
                    measurement: ingredient.measurement
                  }
                end
              }
            ]
          }
        else
          render json: { error: "Cocktail not found" }, status: :not_found
        end
      end
    end
  end
  