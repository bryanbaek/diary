import openai
from app.core.config import settings

# Configuration for OpenAI API
openai.api_key = settings.OPENAI_API_KEY

def get_chatgpt_4o_response(prompt: str) -> str:
    response = openai.Completion.create(
        engine="gpt-4o",
        prompt=prompt,
        max_tokens=150,
        temperature=0.7
    )

    return response.choices[0].text