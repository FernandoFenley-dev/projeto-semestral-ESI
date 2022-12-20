FactoryBot.define do  
    factory :usuario do |f|
        nome {"Joe"}
        email {"joe@gmail.com"}
        password {"123123"}
        iscliente {false}
    end

    factory :invalido_usuario, parent: :usuario do |f|
        nome {"Joe"}
    end
end
