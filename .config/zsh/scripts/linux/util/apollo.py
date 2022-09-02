import json
import subprocess
import sys
import time

class bcolors:
    OKBLUE = '\033[34m'
    OKCYAN = '\033[36m'
    OKGREEN = '\033[32m'
    WARNING = '\033[33m'
    FAIL = '\033[31m'
    ENDC = '\033[0m'
    UNDERLINE = '\033[4m'


def wait_for_deployment(deployment_id):
    status_prev = 'Unknown'
    status = 'Unknown'
    while True:
        apollo_list_deployments = subprocess.run(
                [
                    '/apollo/env/ApolloCommandLine/bin/apollo',
                    'describe-deployment',
                    deployment_id
                ],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE)

        if apollo_list_deployments.stderr:
            print_subprocess_error(apollo_list_deployments)
            return 1

        result_json = json.loads(apollo_list_deployments.stdout.decode('utf-8'))
        status = result_json['deployment']['status']['deployment_status']['type']
        if status != status_prev:
            print(bcolors.WARNING + '  Deployment is ' + status)
        status_prev = status
        if status == 'Succeeded':
            return 0
        elif status == 'Failed':
            return 1
        time.sleep(5)


def print_subprocess_error(output):
    result_json = json.loads(output.stderr.decode('utf-8'))
    print(json.dumps(result_json, indent=3))
    return 1

