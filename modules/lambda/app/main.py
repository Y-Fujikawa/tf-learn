import json

def lambda_handler(event, context):
    resultBody = { 'execution_name': event['execution_name'] }
    return {
        'statusCode': 200,
        'body': resultBody
    }
