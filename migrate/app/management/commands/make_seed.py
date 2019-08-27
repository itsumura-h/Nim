import json
import random
from django.core.management.base import BaseCommand
from faker import Faker

from datetime import datetime
from django.contrib.auth.hashers import make_password


class Command(BaseCommand):
    help = 'dataに配列を作ってね！app/fixtures/seed.jsonが出力されるよ！'

    def handle(self, *args, **options):
        fake = Faker()

        data = {}

        seeder_path = 'app/fixtures/seed.json'
        with open(seeder_path, 'w') as f:
            json.dump(data, f, ensure_ascii=False, indent=4, sort_keys=True)
