module Sources
  class Update
    prepend SimpleCommand

    def initialize(source:, source_params:)
      @source = source
      @source_params = source_params
    end

    def call
      Source.transaction do
        if @source.update(@source_params)
          cleanup_orphaned_images
        else
          errors.add_multiple_errors(@source.errors.messages) if @source.errors.any?
          raise ActiveRecord::Rollback
        end
      end
    end

    private

    def cleanup_orphaned_images
      @source.source_images.each do |image|
        image.destroy unless image.file.attached?
      end
    end
  end
end
