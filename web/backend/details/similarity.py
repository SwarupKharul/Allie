# Example posting a image URL:

import requests
r = requests.post(
    "https://api.deepai.org/api/image-similarity",
    data={
        'image1': 'YOUR_IMAGE_URL',
        'image2': 'YOUR_IMAGE_URL',
    },
    headers={'api-key': '879b74c1-62cc-4665-ab09-71175491de67'}
)
print(r.json())


# Example posting a local image file:

import requests
r = requests.post(
    "https://api.deepai.org/api/image-similarity",
    files={
        'image1': open('/path/to/your/file.jpg', 'rb'),
        'image2': open('/path/to/your/file.jpg', 'rb'),
    },
    headers={'api-key': '879b74c1-62cc-4665-ab09-71175491de67'}
)
print(r.json())