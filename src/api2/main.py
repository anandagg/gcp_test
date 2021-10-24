import requests
from google.cloud import storage


class GetApiUrlException(Exception):
    pass


def get_api(event, context):
    try:
        bucket = 'gcp-test-aa'
        prefix = 'api2'
        bucket = storage.Client().get_bucket(bucket)
        get_api_url = f'https://open.er-api.com/v6/latest/USD'
        response = requests.get(get_api_url)
        blob = bucket.blob(f'{prefix}/api2.json')
        blob.upload_from_string(data=response.text, content_type='application/json')
        print("Complete")
    except Exception as e:
        raise GetApiUrlException("Error Getting API Data: {0}".format(e))
