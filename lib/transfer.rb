class Transfer
  attr_accessor :sender, :amount, :receiver, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end
  def execute_transaction
    if valid? && sender.balance - @amount > 0 && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
    end
    @status = "reversed"
  end
end
