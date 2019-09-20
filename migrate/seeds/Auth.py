from orator.seeds import Seeder


class Auth(Seeder):

    def run(self):
        """
        Run the database seeds.
        """
        self.db.table('auth').insert([
            {'name': 'administrator'},
            {'name': 'user'},
        ])

