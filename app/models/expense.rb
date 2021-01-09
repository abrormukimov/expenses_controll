class Expense < ApplicationRecord
  belongs_to :user, optional: true
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses, dependent: :destroy

  validates_presence_of :name, :amount
  # , :createdAt

  scope :total_expenses, ->(expenses) { expenses.pluck(:amount).sum }
  scope :by_recent_created, -> { order('created_at desc') }
  scope :by_user, ->(user) { where(user_id: user.id) }
  scope :external, ->(user) { where.not(id: GroupExpense.where(expense_id: user.expenses.pluck(:id)).pluck(:expense_id)) }

  def add_expense_to_group(groups, expense)
    exp_groups = groups.pluck(:id)
    exp_groups.each do |group|
      GroupExpense.create!(expense_id: expense.id, group_id: group)
    end
  end
end
