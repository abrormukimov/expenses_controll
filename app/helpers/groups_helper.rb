module GroupsHelper
  def image_generator1
    'https://cdn4.iconfinder.com/data/icons/people-std-pack/512/customers-512.png'
  end

  def group_img(img)
    img || image_generator1
  end

  def group_expense(group)
    group.expenses.pluck(:amount).sum
  end

  def add_group_img(group)
    if group.icon.nil?
      ''
    else
      image_tag group_img(group.icon.url), class: 'bd-placeholder-img card-img-top group-img img-size'
    end
  end
end
