from orator.migrations import Migration


class Auth(Migration):

    def up(self):
        """
        Run the migrations.
        """
        with self.schema.create('auth') as table:
            table.increments('id')
            table.string('name', 255)
            table.nullable_timestamps()



    def down(self):
        """
        Revert the migrations.
        """
        self.schema.drop('auth')
