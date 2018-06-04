
import scrapy


class MusicItem(scrapy.Item):
    # define the fields for your item here like:
    table_name = 'music'
    id = scrapy.Field()
    artist = scrapy.Field()
    album = scrapy.Field()
    music = scrapy.Field()
    comments = scrapy.Field()
