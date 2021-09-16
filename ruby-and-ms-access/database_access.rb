system("cls")

require 'win32ole'

class ActiveRecord
	attr_accessor :mdb, :table, :columns

	def initialize()
		@mdb = File.basename(__FILE__).gsub('.rb', '.mdb')

		# nome da tabela
		@table = self.class.name.downcase

		# verifica colunas da tabela (fields)
		get_columns()
	end

	def add_column(column_name, column_type)
		@columns_hash = Hash.new if @columns_hash.nil?

		column_type = 'varchar' 	if column_type == 'string'
		column_type = 'longtext' 	if column_type == 'text'
		column_type = 'double' 		if column_type == 'decimal'
		column_type = 'long'   		if column_type == 'integer'

		@columns_hash["#{column_name}"] = "#{column_type}"
	end

	# def tables
	# 	tables = []
	# 	@catalog.tables.each {|t| tables << t.name if t.type == "TABLE" }
	# 	tables
	# end

	def save
		if @update_id.nil? || @update_id < 1
			gen_insert()
		else
			gen_update()
		end
	end

	def first
		select_execute("select top 1 * from #{@table};")
	end

	def all
		select_execute("select * from #{@table};")
	end

	def where(condicion)
		select_execute("select * from #{@table} where #{condicion};")

		# if @recordset.count == 1
		# 	get_id()
		# end
	end

	def set_update(id)
		@update_id = id
		where("#{@table}_id = #{@update_id}")
	end

	def last
		select_execute("select top 1 * from #{@table} order by #{@table}_id desc;")
	end

	def x
		puts ''
		puts @fields
		puts ''
		# gen_update
		# where("valor = 201.25")
		# puts [*(' '..'z')].sample(60).join
	end

	# métodos privados
	private

	# def get_id
	# 	@recordset.first.each do |first_id|
	# 		@update_id = first_id
	# 		break
	# 	end
	# end

	def create_table
		sql = "create table #{@table} (#{@table}_id COUNTER"

		# concatena outros campos da tabela
		@columns_hash.each do |key, typ|
			sql += ",#{key} #{typ}"
		end

		sql += ",created_at datetime default now(),updated_at datetime default now());"

		# apaga as colunas para ser usada no update
		@columns_hash = Hash.new

		# cria tabela
		execute_query(sql)
	end

	def get_columns
		# @catalog = WIN32OLE.new("ADOX.Catalog")
		# @catalog.ActiveConnection = @connection

		begin
			open_connection()
		rescue
			@catalog = WIN32OLE.new('ADOX.Catalog')
			@catalog.Create "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=#{@mdb}"
			get_columns()
		end

		begin
			open_connection()

			sql ="select top 1 * from #{@table};"

			recordset = WIN32OLE.new('ADODB.Recordset')
			recordset.Open(sql, @connection)
			@fields = Hash.new
			recordset.Fields.each do |field|
				@fields[field.Name] = field.Type
				self.class.send(:attr_accessor, field.Name)
			end

			@columns = @fields.keys

			@connection.Close
		rescue
			create_table()
			get_columns()
		end
	end

	def last_inserted
		execute_query("select top 1 #{@table}_id from #{@table} order by #{@table}_id desc;")
	end

	def gen_update
		cols = []
		@fields.each do |key, typ|
			value = self.instance_variable_get("@#{key}").to_s
			next if key =="#{@table}_id" || key == "created_at" || (value.empty? && key != "updated_at")

			val = ''
			if key == "updated_at"
				val = "'#{Time.now.strftime("%d/%m/%Y %H:%M:%S")}'"
			elsif [5, 6].include?(typ)
				val = "#{value.to_f}"
			else
				val = "'#{value}'"
			end
			cols << key + ' = ' + val
		end
		cols = cols * ", "

		sql = "update #{@table} set #{cols} where #{@table}_id = #{@update_id};"
		puts sql
		execute_query(sql)
		@update_id = nil
	end

	def gen_insert
		cols = []
		vals = []
		@fields.each do |key, typ|
			next if key == "#{@table}_id" || key == "created_at" || key == "updated_at"

			cols << key
			value = instance_variable_get("@#{key}").to_s
			unless value.empty?
				remove_instance_variable("@#{key}")
			end

			if typ == 7 and value.empty?
				value = "#{Time.now.strftime("%d/%m/%Y")}"
			end

			if [5, 6].include?(typ)
				vals << "#{value.to_f}"
			else
				vals << "'#{value}'"
			end
		end

		cols = cols * ", "
		vals = vals * ", "

		sql = "insert into #{@table} (#{cols}) values (#{vals});"
		puts sql
		execute_query(sql)
	end

	def select_execute(sql)
		puts sql
		execute_query(sql)

		puts @fields.keys.inspect
		puts @recordset.inspect
	end

	def execute_query(sql)
		open_connection()

		if sql[0..5] =="select"
			recordset = WIN32OLE.new('ADODB.Recordset')
			recordset.Open(sql, @connection)
			begin
				@recordset = recordset.GetRows.transpose
			rescue
				@recordset = []
			end

			recordset.Close
		else
			@connection.Execute(sql)
		end

		@connection.Close
		puts ""
	end

	def open_connection
		connection_string =  'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
		connection_string << @mdb
		@connection = WIN32OLE.new('ADODB.Connection')
		@connection.Open(connection_string)
	end
end







class Teste < ActiveRecord
	def initialize()
		add_column('nome', 'string')
		add_column('descricao', 'text')
		add_column('data', 'date')
		add_column('valor', 'decimal')
		super
	end
end

f = Teste.new
# f.nome ="teste " + [*('0'..'9')].sample(2).join
# f.descricao = [*('a'..'z'), ' '].sample(80).join.capitalize
# f.data = Time.now.strftime("%d/%m/%Y")
# f.valor = Random.rand(100...99999) / 100.00
# f.save

# f.where("valor = 620.05")
# f.valor = 222.22
# f.save

# f.first
f.all

f.x