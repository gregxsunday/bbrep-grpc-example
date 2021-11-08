this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'login_services_pb'

def main
  username = ARGV.size > 0 ?  ARGV[0] : 'test'
  password = ARGV.size > 1 ?  ARGV[1] : 'test'
  stub = Authentication::Stub.new("localhost:50000", :this_channel_is_insecure)
  begin
    resp = stub.login(LoginRequest.new(username: username, password: password))
    p "Success: #{resp.result}, Message: #{resp.message}"
  rescue GRPC::BadStatus => e
    abort "ERROR: #{e.message}"
  end
end

main