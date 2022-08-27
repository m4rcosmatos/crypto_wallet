# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin
coins=[
        {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: 'https://imagensemoldes.com.br/wp-content/uploads/2020/09/Logo-Bitcoin-PNG.png'
        },
        {
        description: "Ethereum",
        acronym: "ETH",
        url_image: 'https://img1.gratispng.com/20180516/ouw/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9b20d86.8643914515265041217293.jpg'
        },
        {
        description: "Dash",
        acronym: "DASH",
        url_image: 'https://cryptomined.com/images/flags/dash_circle_Flag_1.png'
        }
     ]
 coins.each do |coin|
 Coin.find_or_create_by!(coin)
 end

 spinner.success("(Concluido!)")
