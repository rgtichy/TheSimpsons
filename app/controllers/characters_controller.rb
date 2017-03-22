class CharactersController < ApplicationController
  # self.per_form_csrf_tokens = true
  def index
    @greetings = ["Eat my shorts!","Cowabunga!","Get bent!"]
    @greeting = @greetings[rand(0..2)]
    @characters = Character.all
  end

  def new
    @character=Character.new
  end

  def show
    @character=Character.find(params[:id])
  end
  def create
    Character.create(sanitized_character)
    redirect_to "/"
  end
  def destroy
    z = Character.find(params[:id])
    z.delete
    redirect_to action: "index"
  end
  def sanitized_character
    return params.require(:character).permit(:first_name, :last_name, :workplace)
  end
end
