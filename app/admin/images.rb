ActiveAdmin.register Image do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :image

  form do |f|
    f.inputs do
      f.input :name
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :image do |photo|
        if photo.image.attached?
          image_tag url_for(photo.image), size: '200x200'
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :image do |photo|
      if photo.image.attached?
        image_tag url_for(photo.image), size: '50x50'
      end
    end
    actions
  end
  
end
