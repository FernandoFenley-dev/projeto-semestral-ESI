FactoryBot.define do  
    factory :usuario do
        nome {"Joe"}
        email {"joe@gmail.com"}
        password {"123123"}
        iscliente {false}
    end
end
