require 'active_record'
require 'sqlite3'

system('cls')

# ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'w'))

# base = ActiveRecord::Base

# base.establish_connection(
# 	adapter:  'sqlite3',
# 	database: 'development.sqlite3'
# )

# conn = base.connection
# tables = conn.tables# - ['schema_migrations']

# tables.each do |t|
# 	puts 'table: ' + t
# 	conn.columns(t.to_s).each do |c|
# 		puts "- " + c.name + ": " + c.type.to_s + " " + c.limit.to_s
# 	end
# 	puts ''
# end

# result = conn.execute "select * from articles limit 2"
# puts result.inspect


# class CreatePublications < ActiveRecord::Migration
# 	def change
# 		create_table :publications do |t|
# 			t.string :title
# 			t.text :description
# 			t.boolean :single_issue

#       t.timestamps
#     end
#     # add_index :publications, :publication_type_id
#   end
#   def down
#   	drop_table :publications
#   end
# end

# CreatePublications.migrate(:change)
# CreatePublications.migrate(:down)
# CreatePublications.rollback 1

# class Publication < ActiveRecord::Base
# end

# class Article < ActiveRecord::Base
# end

# system('cls')

# p = Publication.new
# p.title = 'teste publication'
# p.text = 'teste text publication'
# p.save

# all = Publication.all
# puts all.inspect

# sleep(3)

# a = Article.new
# a.title = 'teste 2'
# a.text = 'texto texto texto texto texto texto'
# a.save
# sleep(10)

# all = Article.all
# puts all.inspect

# all.each do |s|
# 	puts s.title
# 	puts s.text
# end

# puts a.methods