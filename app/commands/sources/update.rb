module Sources
  class Update
    prepend SimpleCommand

    def initialize(source:, source_params:)
      @source = source
      @source_params = source_params
    end

    def call
      Source.transaction do
        raise ActiveRecord::Rollback unless @source.update(@source_params)

        cleanup_orphaned_images
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
