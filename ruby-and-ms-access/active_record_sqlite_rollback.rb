require 'rubygems'
require 'active_record'
require 'sqlite3'

system('cls')
system('clear')

base = ActiveRecord::Base

base.establish_connection(
	adapter: 'sqlite3',
	database: 'database.sqlite3'
)

class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end

begin
	CreateSurveys.rollback
rescue
	puts "\n** Erro rollback **\n\n"
end

conn = base.connection
tables = conn.tables # - ['schema_migrations']

tables.each do |t|
	print 'table: ' + t
	conn.columns(t.to_s).each do |c|
		print " " + c.name + ": " + c.type.to_s + " " + c.limit.to_s
	end
	puts ''
end

class Survey < ActiveRecord::Base
end

puts Survey.all.inspect

