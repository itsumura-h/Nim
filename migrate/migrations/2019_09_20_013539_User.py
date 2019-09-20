from orator.migrations import Migration


class User(Migration):

    def up(self):
        """
        Run the migrations.
        """
        with self.schema.create('users') as table:
            table.increments('id')
            table.string('name', 255)
            table.string('email', 255)
            table.string('address', 255)
            table.string('password', 255)
            table.string('password_salt', 255)
            table.date('birth_date')
            table.integer('auth_id').unsigned()
            table.foreign('auth_id').references('id').on('auth')
            table.nullable_timestamps()

    def down(self):
        """
        Revert the migrations.
        """
        self.schema.drop('users')
