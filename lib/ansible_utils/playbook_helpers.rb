module AnsibleUtils
  module PlaybookHelpers

    def config_file_path
      @config_file_path ||= File.join(ENV.fetch('HOME'), '.config', 'ansible-utils', 'config.yml')
    end

    def delete_if_exists path
      FileUtils.remove_entry(path, true)
    end

    def paths
      @paths ||= roles.map{|role| role['role'] }
    end

    def roles
      playbook['roles']
    end

    def project_folder
      @project_folder ||= File.dirname(playbook_path)
    end

    def generic_roles_folder
      begin
        if File.file?(config_file_path)
          return YAML.load(File.read(config_file_path))['generic_roles_path']
        else
          raise "Missing config file at #{config_file_path}. Run `ansible-utils config` for proper setup"
        end
      rescue Psych::SyntaxError
        raise "Error reading config file at #{config_file_path}"
      end
    end

    def playbook
      @playbook ||= YAML.load_file(playbook_path).first
    end
  end
end
