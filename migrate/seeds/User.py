from orator.seeds import Seeder
import bcrypt
from faker import Faker
from datetime import datetime
from tqdm import tqdm


class User(Seeder):

    def run(self):
        """Run the database seeds."""
        fake = Faker('ja')

        data = []
        for i in tqdm(range(1, 200)):
            salt = bcrypt.gensalt(rounds=10, prefix=b'2a')
            password = bcrypt.hashpw(f'password{i}'.encode('utf8'), salt)

            data.append(
                {
                    'name': f'user{i}',
                    'email': f'user{i}@gmail.com',
                    'address': fake.address(),
                    'password': password,
                    'password_salt': salt,
                    'birth_date': fake.date_between(start_date="-40y", end_date="today"),
                    'auth_id': 1 if i % 2 == 0 else 2,
                    'created_at': datetime.now(),
                    'updated_at': datetime.now()
                }
            )

        self.db.table('users').insert(data)
