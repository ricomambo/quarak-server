task :migrate_csv_sheet, [:file] => :environment do |t, args|
  all_members = [
    User.create!(name: 'Rodrigo', email: 'rodrigopavano@gmail.com', password: '123456'),
    User.create!(name: 'Mauricio', email: 'maurimiranda@gmail.com', password: '123456'),
    User.create!(name: 'Federico', email: 'fborgnia@gmail.com', password: '123456'),
    User.create!(name: 'Sebastián', email: 'default50@gmail.com', password: '123456'),
    User.create!(name: 'Matías', email: 'matyax@gmail.com', password: '123456'),
    User.create!(name: 'Damián', email: 'damianfarina@gmail.com', password: '123456'),
    User.create!(name: 'Fabricio', email: 'faripavano@gmail.com', password: '123456')
  ]

  all_members_but_fabri = all_members.select { |m| m.name != "Fabricio" }
  project = Project.create!(title: 'RicoMambo', members: all_members)

  require 'csv'

  index = 2
  CSV.foreach(Rails.root.join(ENV['csv_file']), headers: true, col_sep: ',') do |row|
    Expense.create(
      date:       DateTime.parse(row["Fecha"]),
      project:    project,
      category:   row["Categoría"],
      provider:   row["Descripción"],
      comments:   row["Comentarios"],
      amount:     row["Monto"].delete('$').delete(',').to_f,
      payer:      User.find_by_name(row["Pagado por"].strip) || raise("User not found #{row}"),
      members:    (index >= 69 && index <= 113) ? all_members : all_members_but_fabri
    )

    index += 1
  end

end


task :display_balances => :environment do
  p = Project.find_by_title "RicoMambo"
  p.balances.each do |b|
    puts "#{b.user.name} - #{b.balance.round(2)} - #{b.payments.round(2)}"
  end
end

task :show_mauricios_payments => :environment do
  require 'csv'
  total = 0
  index = 0
  CSV.foreach(Rails.root.join(ENV['csv_file']), headers: true, col_sep: ',') do |row|
    num = row["Monto"].delete('$').delete(',').to_f
    if row["Pagado por"].strip == "Mauricio"
      index += 1
      puts num
      total += num
    end
  end
  puts 'TOTAL'
  puts total
  puts "COUNT"
  puts index

end
