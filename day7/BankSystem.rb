module AccountAccessModule

   module SavingModule
    def interest
      rate=0.075
      puts "Give me Time in Month's"
      time=gets.chomp.to_i
      time=time.to_f/12
      time=rate.to_f*time.to_f
      time=1+time.to_f
      puts "#{balance.to_f*time.to_f}"
    end
   end

   module CurrentModule
    def interest
      rate=0.12
      puts "Give me Time in Month's"
      time=gets.chomp.to_i
      time=time.to_f/12
      time=rate.to_f*time.to_f
      time=1+time.to_f
      puts "#{balance.to_f*time.to_f}"
    end
   end
end

class  BankFile
  @@data=nil
  @@flag=0

  def self.get_file_info
    if @@data==nil and @@flag==0
      @@data=Array.new
      file_data = File.read('/home/jitendra/Training/josh-traininng/day7/BankAccount.txt')
      acc_details = file_data.split(',')
      acc_details.each do |x|
        arr = x.split(':')
        obj = Account.new
        obj.account_no=arr[0]
        obj.type=arr[1]
        obj.balance=arr[2]
        @@data.push obj
      end
    end
    @@data
  end

  def self.add_in_file str
    File.write('/home/jitendra/Training/josh-traininng/day7/BankAccount.txt',"#{str}",mode:'a')
  end
end

class Account
  attr_accessor :account_no,:type,:balance,:bank_name
  @@file=BankFile.get_file_info
  def initialize 
    @account_no
    @type
    @balance
    @bank_name = "Hdfc"
  end

  def create_account
    time =Time.new
    account_no= "#{time.year}#{time.month}#{time.day}#{time.hour}#{time.min}#{time.sec}"
    puts "Which Type (Saving,Current)"
    @type=gets.chomp.to_s
    @balance=1000
    str="#{account_no}:#{type}:#{balance},"
    puts str
    BankFile.add_in_file str
  end

  def self.valid_account num
    obj=nil
    @@file.each  do |x|
      if x.account_no == num
        puts "#{x.account_no}  #{x.type}  #{x.balance}"
        obj= x
      end
    end
    obj
  end

  def deposit
    puts "Deposit Amount"
    money=gets.chomp.to_i
    @balance=@balance.to_i+money
  end

  def withdraw
    puts "withdraw Amount"
    money=gets.chomp.to_i

    if @balance.to_i>=(money+1000)
      @balance=@balance.to_i-money
    else
      puts "Insufficient Balance"
    end
    
  end
  def check_balance
    puts "Balance is #{@balance}"
  end

  def close_account
  
  end

  def convert_account
    
  end 

  def add_permission
    if type=="Saving"
      self.extend(AccountAccessModule::SavingModule)
    elsif type=="Current"
      self.extend(CurrentModule)
    end
  end
end

class Bank
  
  def initialize
    @bank_name = "Hdfc"
    @acc_obj = Account.new
  end
  
  def entrance
    while true
      puts  "-------------------Welcome To #{@bank_name} Bank-----------------"
      puts "Do you have any account in #{@bank_name} Bank"
      valid=gets.chomp
      if  valid== "Yes" or valid == "yes" or valid == 'y' or valid=='Y'
        puts "Enter Account Number"
        num=gets.chomp
        @acc_obj = Account.valid_account num
        if @acc_obj!=nil
          self.operation
        else
          puts "Account Not Present "
        end
      else
        @acc_obj.create_account
        self.operation 
      end
      puts "Do you Want to continue Press any If N5o then press n"
      i=gets.chomp.to_s
      if i=='n'
        self.update
        break
      end
    end
  end

  def operation 
    @acc_obj.add_permission
    while true
      puts"Press\n 1.Deposit  2.Withdraw  3.Check Balance 4.Balance with interest 5 Exit"
      i = gets.chomp.to_i
      case i
      when 1
         @acc_obj.deposit
      when 2
        @acc_obj.withdraw
      when 3
        @acc_obj.check_balance
      when 4
        @acc_obj.interest
      when 5
        break
      else
        puts "Wrong"
      end
    end
  end

  def update
    File.truncate('/home/jitendra/Training/josh-traininng/day7/BankAccount.txt',30)
    Account.class_variable_get(:@@file).each do |x|
      str="#{x.account_no}:#{x.type}:#{x.balance},"
      BankFile.add_in_file str
    end
  end

end

bank_obj=Bank.new
bank_obj.entrance