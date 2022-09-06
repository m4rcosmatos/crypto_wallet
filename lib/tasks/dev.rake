namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("Apagando db"){%x(rails db:drop)}
      
      show_spinner("Criando db"){%x(rails db:create)}

      show_spinner("Migrando db"){%x(rails db:migrate)}

      %x(rails dev:add_coins)

      %x(rails dev:add_mining_types)

    else
      puts "Voce nao esta em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as Moedas"
  task add_coins: :environment do

    show_spinner("Cadastrando Moedas...") do
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
end
end

desc "Cadastra os Tipos de Mineraçao"
task add_mining_types: :environment do
  show_spinner("Cadastrando Tipos de Mineraçao...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
end
 


  private

  def show_spinner(msg_start,msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")


  end

end
