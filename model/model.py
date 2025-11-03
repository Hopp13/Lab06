from database.DB_connect import get_connection
from model.automobile import Automobile

class Autonoleggio:
    def __init__(self, nome, responsabile):
        self._nome = nome
        self._responsabile = responsabile
        self._automobili = []

    @property
    def nome(self):
        return self._nome

    @nome.setter
    def nome(self, nome):
        self._nome = nome

    @property
    def responsabile(self):
        return self._responsabile

    @responsabile.setter
    def responsabile(self, responsabile):
        self._responsabile = responsabile

    @property
    def automobili(self):
        return self._automobili

    def get_automobili(self):
        connection = get_connection()
        with connection.cursor() as cursor:
            query = "SELECT * FROM automobile"
            cursor.execute(query)
            for row in cursor.fetchall():
                self.automobili.append(Automobile(row[0], row[1] ,row[2], row[3], row[4], row[5]))

            return self.automobili

    def cerca_automobili_per_modello(self, modello):
        connection = get_connection()
        with connection.cursor() as cursor:
            query = "SELECT * FROM automobile WHERE modello = %s;"
            cursor.execute(query, (modello, ))
            automobili = []
            for row in cursor.fetchall():
                automobili.append(Automobile(row[0], row[1] ,row[2], row[3], row[4], row[5]))

            return automobili
