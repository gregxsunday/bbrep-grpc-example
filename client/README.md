# Commands used
```sh
cd client
bundle
bundle exec grpc_tools_ruby_protoc -I ../protos --ruby_out=lib --grpc_out=lib ../protos/login.proto
bundle exec ruby client.rb admin qwerty
```