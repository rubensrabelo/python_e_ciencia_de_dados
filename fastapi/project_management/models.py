from typing import Optional
from pydantic import BaseModel, Field
from datetime import date


class ProjectRequest(BaseModel):
    id: Optional[int] = Field(default=None)
    name: str = Field(..., min_length=3, max_length=100)
    description: str = Field(..., max_length=250)
    start_date: date = Field(...)
    end_date: Optional[date] = Field(default="undefined")
    completion_prediction: date = Field(...)
    status: str = Field(default="Em espera")
