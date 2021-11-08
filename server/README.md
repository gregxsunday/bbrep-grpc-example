# Installation
```sh
python3 -m venv env
source env/bin/activate
pip install grpcio-tools
python -m grpc_tools.protoc -Iprotos --python_out=server protos/login.proto
python -m grpc_tools.protoc -Iprotos --grpc_python_out=server protos/login.proto
```