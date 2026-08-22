# **Plugin Name** Plugin

**Plugin Summary**

Implements a custom bad words filter that replaces them with "belgium"
(when cooking the post content)


## Tests and checks

Can be ran with the following command:
```shell
bundle exec rubocop . && bundle exec stree check $(git ls-files "*.rb") && bundle exec ruby -Ilib -Itest test/censor/censor_test.rb
```
