# Centrias Jenkins Base Profile

Checks a Jenkins installation for common setup pitfalls.

## Example Usage

Assuming you have functional SSH access to the Jenkins Server "lpci42":

```bash

  inspec exec \
    -t ssh://sshuser@lpci42 --show-progress \
    https://github.com/centriascolocation/inspec-jenkins/archive/master.tar.gz

```

**Remember**: InSpec considers you local SSH client configuration!
