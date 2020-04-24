# Centrias Jenkins Base Profile

Checks a Jenkins installation for common setup pitfalls.

## Example Usage

Assuming you have working SSH access to the Jenkins Server "lpci42":

```bash
inspec exec profiles/cc-jenkins-base --show-progress -t ssh://sshuser@lpci42
```

**Remember**: InSpec considers you local SSH client configuration!
