#288796341:AAGcyQMNIn5KtAiKOjGgyCxD2L07iM6UYYc

require 'telegram/bot'
require 'rubygems'
require 'json'

token = '288796341:AAGcyQMNIn5KtAiKOjGgyCxD2L07iM6UYYc'

print "Starting..."
# Publish example

def mensagem(bot,message)
  bot.api.send_message(chat_id: message.chat.id, text: "tentando")
end

atendida = {}

Telegram::Bot::Client.run(token) do |bot|

  bot.listen do |message|

    case message
    when Telegram::Bot::Types::CallbackQuery
      case message.data
      when "oi"
        yesNo = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Sim', callback_data: 'sim'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Não', callback_data: 'não')
        ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: yesNo)
        bot.api.send_message(chat_id: message.from.id, text: 'Você procura ajuda?', reply_markup: markup)

        bot.listen do |message|
          case message
          # when 'sim' || 'Sim' || 'SIM' || 'SIm'
          when Telegram::Bot::Types::CallbackQuery
            # formulario()
            case message.data
            when 'sim'
              bot.api.send_message(chat_id: message.from.id, text: "Formulário")
              break
            when 'não'
              markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: yesNo)
              bot.api.send_message(chat_id: message.from.id, text: 'Você está com medo de algo?', reply_markup: markup)

              bot.listen do |message|
                bot.api.send_message(chat_id: message.from.id, text: "Pode contar conosco, está segura!")
                bot.api.send_message(chat_id: message.from.id, text: "Sofrendo Alguma agressão?\n Ligue agora para o ")
                bot.api.send_contact(chat_id: message.from.id, phone_number:"180", first_name:"Central", last_name:"de Atendimento a mulher", user_id:1)
                bot.api.send_message(chat_id: message.from.id, text: "Ou ligue para:")
                bot.api.send_contact(chat_id: message.from.id, phone_number:"180", first_name:"Polícia", last_name:"Militar", user_id:1)
                break
              end

          # else
          #   # bot.api.send_message(chat_id: message.chat.id, text: "Você está com medo de algo?")
          #   bot.listen do |message|
          #     bot.api.send_message(chat_id: message.chat.id, text: "Pode contar está segura!")
          #     bot.api.send_message(chat_id: message.chat.id, text: "Sofrendo Alguma agressão?\n Ligue agora para o ")
          #     bot.api.send_contact(chat_id: message.chat.id, phone_number:"180", first_name:"Central", last_name:"de Atendimento a mulher", user_id:1)
          #     bot.api.send_message(chat_id: message.chat.id, text: "Ou ligue para:")
          #     bot.api.send_contact(chat_id: message.chat.id, phone_number:"180", first_name:"Polícia", last_name:"Militar", user_id:1)
          #
          #     break
          #   end
            end
          end
        break
        end
      when "recusa"
        bot.api.send_message(chat_id: message.from.id, text: 'Certifico que aos', reply_markup: markup)
        bot.listen do |message|
          atendida["Dias"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: 'dias do mês de', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Mês"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: 'do ano de', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Ano"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: ', compareci juntamente com o (a)', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Nome"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: 'no Endereço', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Endereço"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: 'nº ', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Numero"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: 'Bairro', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Bairro"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: 'Telefone', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Telefone"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: 'residência da senhora', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Atendida"] = message.text;
          bot.api.send_message(chat_id: message.chat.id, text: 'informando que a mesma RECUSA receber atendimento por parte da Operação Ronda Maria da Penha pelos seguintes motivos:', reply_markup: markup)
          break
        end
        bot.listen do |message|
          atendida["Motivos"] = message.text;
          # bot.api.send_message(chat_id: message.chat.id, text: 'Telefone', reply_markup: markup)
          break
        end
        atendida.each do |x,y|
          print x + " : "
          puts y
        end
        break
      end
    else
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Oi', callback_data: 'oi'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Recusa', callback_data: 'recusa')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: 'Converse com o bot', reply_markup: markup)
    end
  end
end
