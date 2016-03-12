# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def fighter_create
  fighter = Fighter.create(
    first_name: Faker::Name.first_name,
    nickname: Faker::Superhero.name,
    last_name: Faker::Name.last_name,
    experience: Random.new.rand(1..15)
  )
  tmp = *(1..9)

  (1..3).each do
    sample = tmp.sample
    tmp.delete(sample)
    fighter.skills << Skill.find(sample)
  end

  fighter.fighter_skills.each do |skill|
    skill.value = Random.new.rand(1..15)
    skill.save
  end

  fighter.remote_image_url = Faker::Avatar.image(fighter.nickname, "300x300", 'jpg')

  fighter.save
end

def skill_create
  Skill.create(name: Faker::Superhero.power)
end

def fight_create
  fight = Fight.new
  tmp = *(1..20)
  sample = tmp.sample
  tmp.delete(sample)
  fight.fighters << Fighter.find(sample)
  sample = tmp.sample
  tmp.delete(sample)
  fight.fighters << Fighter.find(sample)
  fight.save
end

(1..9).each do
  skill_create
end
(1..20).each do
  fighter_create
end

(1..30).each do
  fight_create
end




