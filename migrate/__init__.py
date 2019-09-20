import logging

from orator import DatabaseManager
from orator import Model

config = {
    'default': 'database',
    'database': {
        'driver': 'sqlite',  
        'database': '/home/db/db.sqlite3',
        'log_queries': True,
    }
}

db = DatabaseManager(config)
Model.set_connection_resolver(db)


logger = logging.getLogger('orator.connection.queries')
logger.setLevel(logging.DEBUG)

formatter = logging.Formatter(
    'It took %(elapsed_time)sms to execute the query %(query)s'
)

handler = logging.StreamHandler()
handler.setFormatter(formatter)

logger.addHandler(handler)
