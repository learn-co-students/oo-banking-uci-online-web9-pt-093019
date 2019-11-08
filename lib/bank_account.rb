class BankAccount
attr_accessor :status, :balance


def name
@name.dup.freeze
end

def initialize(name, balance=1000)
  @name = name
  @balance = balance
  @status = "open"
end

def deposit(value)
 self.balance += value
end

def display_balance
  "Your balance is $#{balance.dup.freeze}."
end

def valid?
if status == "open" && balance > 0
  true
else
  false
end #end of if block
end # end of method

def close_account
 self.status = "closed"
end #end of method

end #end of class
