require_relative "playbook_helpers"

module AnsibleUtils
  class DependencyManager
    include PlaybookHelpers

    attr_reader :playbook_path, :options

    def initialize playbook_path, options = {}
      @playbook_path = playbook_path
      @options = options
    end

    def symlink_roles
      paths.each{|path| execute_in_path(:symlink, path) }
    end

    def copy_roles
      paths.each{|path| execute_in_path(:copy, path) }
    end

    private

    def execute_in_path action, path
      populate_ansible_path = File.join(generic_roles_folder, path) if generic_roles_folder
      project_path = File.join(project_folder, path)
      file_utils_method = action == :copy ? :copy_entry : :ln_s

      if !File.directory?(populate_ansible_path)
        puts "- Ignoring role '#{path}' because it does not exist in populate-ansible"
      else
        dirname = File.dirname(project_path)
        if Dir.exists?(project_path)
          if options.force
            puts "+ Overwritting role '#{path}'"
            delete_if_exists(project_path)
          else
            puts "- Skipping existing role '#{path}' (use --force option to overwrite it)"
            return
          end
        end
        puts "+ Adding role '#{path}'"
        FileUtils.mkdir_p(dirname)
        FileUtils.send(file_utils_method, populate_ansible_path, project_path)
      end
    end
  end
end
