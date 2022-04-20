from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from core.config import settings

from urls.routes import urls_router
from users.routes import users_router

api = FastAPI(title="TeenyURL API",
              version="0.0.1",
              description="Shorten Your URLs superfast 🚀")

api.include_router(urls_router, prefix="/urls", tags=["Urls API"])
api.include_router(users_router, prefix="/users", tags=["Users API"])

api.include_router(urls_router, prefix="/api/v1/urls", tags=["Urls API"])
api.include_router(users_router, prefix="/api/v1/users", tags=["Users API"])

origins = ["*"]

# origins = [
#     "http://shatkon.tk",
#     "https://shatkon.com",
#     "http://localhost",
#     "http://localhost:8000",
# ]

api.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@api.get("/")
async def root():
    return {"message": "Hello World"}

movie_list = {
    "1": "The Shawshank Redemption",
    "2": "The Godfather",
    "3": "The Godfather: Part II",
    "4": "The Dark Knight",
    "5": "12 Angry Men",
}


class Movie(BaseModel):
    movie_name: str
    movie_rank: int
    movie_genre: str
    movie_language: Optional[str] = None
    movie_year: Optional[str] = None


@api.get("/movies")
def read_root():
    return movie_list


@api.get("/movies/{rank}")
def read_items(rank: str, q: Optional[str] = None):
    if rank not in movie_list:
        return {"msg": "requested movie data not found"}
    return {"rank": rank, "movie": movie_list[rank]}


@api.post("/movie")
def add_movie(movie: Movie):
    print(type(movie))
    movie_data = movie.dict()
    print(type(movie_data))
    if movie_data["movie_rank"] > 9:
        return {"message": "Good Movie"}
    else:
        return {"message": "Average Movie", **movie_data}
