import chromadb
chroma_client = chromadb.Client()

def add_memory(userID):
    collection = chroma_client.create_collection(name=userID)
    collection.add(
        documents=[
            "This is a document about pineapple",
            "This is a document about oranges"
        ],
        ids=["id1", "id2"]
    )

def read_memory(userID, query):
    collection = chroma_client.create_collection(name=userID)
    results = collection.query(
    query_texts=[query], # Chroma will embed this for you
    n_results=2 # how many results to return
    )
    return results