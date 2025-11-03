import flet as ft

class Controller:
    def __init__(self, view, model):
        self._model = model
        self._view = view

    @property
    def model(self):
        return self._model

    @property
    def view(self):
        return self._view

    def get_nome(self):
        return self._model.nome

    def get_responsabile(self):
        return self._model.responsabile

    def set_responsabile(self, responsabile):
        self._model.responsabile = responsabile

    def conferma_responsabile(self, e):
        self._model.responsabile = self._view.input_responsabile.value
        self._view.txt_responsabile.value = f"Responsabile: {self._model.responsabile}"
        self._view.update()

    # Altre Funzioni Event Handler
    def mostra_automobili(self, e):
        automobili = self.model.get_automobili()
        for automobile in automobili:
            self.view.lista_auto.controls.append(ft.Text(value = automobile))
        self.view.update()

    def cerca_automobili(self, e):
        self.view.lista_auto_ricerca.controls.clear()
        automobili = self.model.cerca_automobili_per_modello(self.view.input_modello_auto.value)
        for automobile in automobili:
            self.view.lista_auto_ricerca.controls.append(ft.Text(value = automobile))
        self.view.update()
