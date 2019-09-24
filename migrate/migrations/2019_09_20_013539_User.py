from orator.migrations import Migration


class User(Migration):

    def up(self):
        """
        Run the migrations.
        """
        with self.schema.create('users') as table:
            table.increments('id')
            table.string('name', 255).nullable().default()
            table.string('email', 255).nullable().default()
            table.string('address', 255).nullable().default()
            table.string('password', 255).nullable().default()
            table.string('password_salt', 255).nullable().default()
            table.date('birth_date').nullable().default()
            table.integer('auth_id').unsigned().nullable().default()
            table.foreign('auth_id').references('id').on('auth')
            table.nullable_timestamps()

    def down(self):
        """
        Revert the migrations.
        """
        self.schema.drop('users')
