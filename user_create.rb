class Users::Create < ActiveInteraction::Base
  hash :params do
    string :name,
           :surname,
           :patronymic,
           :email,
           :nationality,
           :country,
           :gender
    integer :age
    array :interests, :skills do
      string :name
    end
  end

  def execute
    interests = Interest.where(name: params[:interests])
    skills = Skill.where(name: params[:skills])

    User.create(user_params, interests: interests, skills: skills)
  end

  private

  def user_params
    full_name = "#{params[:surname]} #{params[:name]} #{params[:patronymic]}"
    params.except(:interests, :skills).merge(full_name)
  end
end
