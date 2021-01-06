# ansible-utils

Ansible tools for our daily workflows.

`$ ansible-utils --help`:

```
  NAME:

    Ansible Utils

  DESCRIPTION:

    Utils for managing Ansible projects

  COMMANDS:

    config        Creates and edits the configuration
    copy_roles    Copy playbook roles from generic source
    help          Display global or [command] help documentation
    symlink_roles Symlink playbook roles from generic source

  GLOBAL OPTIONS:

    -h, --help
        Display help documentation

    -v, --version
        Display version information

    -t, --trace
        Display backtrace when an error occurs
```

## Setup

```
$ gem install ansible-utils
```

Once installed run `$ ansible-utils config` to complete the configuration. You'll need to add the path to the generic roles folder.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PopulateTools/ansible-utils. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Authors

This is a project developed by [Populate](https://populate.tools).
