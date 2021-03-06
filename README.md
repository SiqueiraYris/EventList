# EventList

https://github.com/WoopSicredi/jobs/issues/3

Seja bem vindo! Obrigado pelo interesse em participar do nosso processo seletivo.

Leia atentamente as instruções abaixo e não hesite em entrar em contato com a gente :)

## Objetivo

Criar um aplicativo em Swift que consuma uma REST API e exiba uma listagem de eventos
Cada item da lista deve permitir acesso à detalhes do evento
No detalhe do evento é importante exibir suas informações e opções de check-in e compartilhamento

## Sobre seu código
Analisaremos:
Organização do código
Boas práticas de programação
Possíveis bugs
Tratamento de erros
O uso de frameworks e libraries é livre
Uso de testes unitários
AutoLayout

Diferencial:
Usar RxSwift
MVVM

## API
A API de eventos está disponivel em:
http://5b840ba5db24a100142dcd8c.mockapi.io/api/events

Para acessar cada detalhe do evento basta adicionar o ID do item ao final da URL. Ex: http://5b840ba5db24a100142dcd8c.mockapi.io/api/events/1

Para realizar o check-in faça um POST no seguinte endereço: http://5b840ba5db24a100142dcd8c.mockapi.io/api/checkin

O POST deve conter os dados do interessado (Nome, e-mail) e o id do evento. Ex:

{ "eventId": "1", "name": "Otávio", "email": "otavio_souza@..." }

## Dicas
Faça commits frequentes. Queremos entender como você pensa :)
Fique a vontade para utilizar animações e recursos especias (ex: parallax etc...)
Teste bem seu aplicativo, evite crashes

## Observações importantes
Fique à vontade para tirar dúvidas em qualquer etapa do processo
A API pode ter falhas, prepare seu aplicativo para contorná-las
Crie um repositório e compartilhe conosco para avaliarmos o seu código


## About code
The project is structured based on the MVVM design pattern. The app is a set of modules each module is basically a screen of the app.

### Prerequisites
For execute this project you need have installed Cocoapods and Xcode.

$ gem install cocoapods

Through terminal go to the project folder and execute the following command:

$ pod install

### Run

Just open the project xcworkspace and execute.

### Built With

[Alamofire](https://github.com/Alamofire/Alamofire "Alamofire") /  [Kingfisher](https://github.com/onevcat/Kingfisher "Kingfisher")

