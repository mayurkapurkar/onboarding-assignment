# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "Policyfile_Mayur"

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "assignment1::default"

# Specify a custom source for a single cookbook
cookbook 'assignment1', '~> 0.1.0', git: 'git@github.com:mayurkapurkar/onboarding-assignment.git', branch: 'master'
