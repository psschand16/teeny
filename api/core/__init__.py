from pymongo import MongoClient

from core.config import settings

client = MongoClient(settings.MONGO_DATABASE_URL)
print(settings.MONGO_DATABASE_URL,settings.SECRET_KEY)
db = client.teenyurl
