from openai import OpenAI
from app.core.config import settings

# Configuration for OpenAI API
client = OpenAI(
    # This is the default and can be omitted
    api_key=settings.OPENAI_API_KEY,
)

chat_completion = client.chat.completions.create(
    messages=[
        {
            "role": "user",
            "content": "Say this is a test",
        }
    ],
    model="gpt-3.5-turbo",
)

def get_gpt_4o_response(prompt: str) -> str:
    response = client.chat.completions.create(
    messages=[
        {
            "role": "user",
            "content": prompt,
        }
    ],
    model="gpt-4o",
    )

    return response.choices[0].message.content