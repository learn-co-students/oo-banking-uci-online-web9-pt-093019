class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount, @status = sender, receiver, amount, "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if valid? && sender.balance > amount && status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && receiver.balance > amount && status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end