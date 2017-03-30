class CharactersController < ApplicationController
  self.per_form_csrf_tokens = true
  def index
    @greetings = ["Eat my shorts!","Cowabunga!","Get bent!"]
    @greeting = @greetings[rand(0..@greetings.length-1)]
    @characters = Character.all
  end
  def new
    @character=Character.new
  end
  def show
    @character=Character.find(params[:id])
    family 
  end
  def edit
    @character=Character.find(params[:id])
    render layout:"two_cols"
  end
  def update
    character=Character.find(params[:id])
    character.update(character_permits)
    redirect_to action: "index"
  end
  def create
    Character.create(character_permits)
    redirect_to "/"
  end
  def destroy
    z = Character.find(params[:id]).delete
    redirect_to action: "index"
  end
  def family
    @family = @character.family_members
  end
  private
    def character_permits
      return params.require(:character).permit(:first_name, :last_name, :workplace, :nickname)
    end
end
