# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#COWWWW moo
cow = Animal.find_or_create_by_name('Cow')

cow_primal_cuts = ['Chuck', 'Short Loin', 'Rib']
cow_rib_cuts = ['Prime Rib', 'Ribeye']

cow_cuts = ['Porterhouse','T-bone','Strip']

#Add primal cuts to cow
cow_primal_cuts.each do |pcut|
  cow.primal_cuts.find_or_create_by_name(pcut)
end

#Add cuts to rib
rib = cow.primal_cuts.find_by_name('Rib')
cow_rib_cuts.each do |rcut|
  rib.cuts.find_or_create_by_name(rcut)
end

#Add cuts to cow
cow_cuts.each do |ccut|
  cow.cuts.find_or_create_by_name(ccut)
end

#PIGGG oink
pig = Animal.find_or_create_by_name('Pig')

pig_primal_cuts = ['Jowl', 'Ham', 'Loin']
pig_loin_cuts = ['Loin Chop', 'Blade Roast']

pig_cuts = ['Babyback Ribs', 'Spareribs', 'Hock']

#Add primal cuts to pig
pig_primal_cuts.each do |ppc|
  pig.primal_cuts.find_or_create_by_name(ppc)
end

#Add cuts to loin
loin = pig.primal_cuts.find_by_name('Loin')
pig_loin_cuts.each do |plc|
  loin.cuts.find_or_create_by_name(plc)
end

pig_cuts.each do |pc|
  pig.cuts.find_or_create_by_name(pc)
end