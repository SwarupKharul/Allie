# Example posting a image URL:

import requests


def similar_img(YOUR_IMAGE_URL):
    r = requests.post(
        "https://api.deepai.org/api/image-similarity",
        data={
            "image1": YOUR_IMAGE_URL,
            "image2": "sample.png",
        },
        headers={"api-key": "879b74c1-62cc-4665-ab09-71175491de67"},
    )
    print(r.json())
    return r.json()
