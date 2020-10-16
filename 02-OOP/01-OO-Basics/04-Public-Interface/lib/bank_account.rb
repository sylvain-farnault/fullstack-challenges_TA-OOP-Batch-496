require_relative 'transaction'

# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  attr_reader :name, :balance

  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)

  MIN_DEPOSIT = 100

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    add_transaction(-amount)
    # TODO: returns a string with a message
    "You have just withdraw #{amount}€."
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    add_transaction(amount)
    # TODO: returns a string with a message
    "You have just deposit #{amount}€."
  end

  def transactions_history(args = {})
    answer = ""
    # TODO: Check if there is a password and if so if it is correct
    if args.empty?
      answer += "no password given"
    elsif args[:password] != @password
      answer += "wrong password"
    else
      @transactions.each { |transaction|
        # answer += "#{transaction[0]} at #{transaction[1]}\n"
        answer += transaction.to_s
      }
    end
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
    answer
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    "#{@iban.split('').first(4).join}********#{@iban.split('').last(3).join}"
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
    "Owner: #{@name} - Iban: #{iban} - Balance: #{@balance}€."
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array

    # basic ////////////
    # @transactions.push(amount)
    # optional ////////////
    @transactions.push(Transaction.new(amount))

    # TODO: update the current balance (which represents the balance of the account)
    @balance += amount
  end
end
