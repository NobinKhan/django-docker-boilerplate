from strawberry import type, field, Schema

@type
class Query:
    @field
    def hello(self) -> str:
        return "Hello World"

schema = Schema(Query)