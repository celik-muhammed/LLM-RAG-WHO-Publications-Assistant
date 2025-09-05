try:
    from config import SETTINGS  # Settings: API_KEY, MODEL_EMBED, BASE_URL, etc.
    from db import create_table, insert_chunks
    from scraper import fetch_links_selenium, fetch_pdf_text
    from text_processing import split_into_chunks
except Exception:
    from .config import SETTINGS
    from .db import create_table, insert_chunks
    from .scraper import fetch_links_selenium, fetch_pdf_text
    from .text_processing import split_into_chunks


def ingest(
    url: str = SETTINGS.DATA_URL,
    pages: int = SETTINGS.DEFAULT_MAX_PAGES,
    pause: int = 5,
):
    create_table()
    links = fetch_links_selenium(url=url, end=pages, pause_s=pause)
    for i, link in enumerate(links, start=1):
        text = fetch_pdf_text(link)
        chunks = split_into_chunks(text)
        insert_chunks(chunks, i)
        print(f"Ingested {link} (Group {i})")


if __name__ == '__main__':
    ingest()
