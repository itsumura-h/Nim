from orator.seeds import Seeder
from .Auth import Auth
from .User import User

class DatabaseSeeder(Seeder):

    def run(self):
        """
        Run the database seeds.
        """
        self.call(Auth)
        self.call(User)

