import grpc
from concurrent import futures

import login_pb2
import login_pb2_grpc
import base64


def login(username, password):
    if username == 'admin' and password == 'qwerty':
        return True, 'Login successful'
    return False, 'Invalid credentials'

class Authentication(login_pb2_grpc.AuthenticationServicer):
    def Login(self, request, context):
        username = request.username
        password = request.password
        result, message = login(username, password)
        return login_pb2.LoginResponse(result=result, message=message)

if __name__ == '__main__':
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    login_pb2_grpc.add_AuthenticationServicer_to_server(Authentication(), server)
    server.add_insecure_port('[::]:50000')
    server.start()
    server.wait_for_termination()