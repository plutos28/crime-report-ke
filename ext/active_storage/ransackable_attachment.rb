module RansackableAttachment
    def ransackable_attributes(_auth_object = nil)
      %w[blob_id created_at id id_value name record_id record_type]
    end
end
  
ActiveSupport.on_load(:active_storage_attachment) do
    ActiveStorage::Attachment.extend RansackableAttachment
end