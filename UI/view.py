import flet as ft

from UI.alert import AlertManager

class View:
    def __init__(self, page):
        # Page
        self.page = page
        self.page.title = "Lab06"
        self.page.horizontal_alignment = "center"
        self.page.theme_mode = ft.ThemeMode.DARK
        # Alert
        self.alert = AlertManager(page)
        # Controller
        self.controller = None
        # Elementi UI
        self.txt_titolo = None
        self.txt_responsabile = None
        self.input_responsabile = None
        self.lista_auto = None
        self.txt_ricerca_automobili = None
        self.input_modello_auto = None
        self.lista_auto_ricerca = None
        #tema
        self.toggle_cambia_tema = None

    def show_alert(self, messaggio):
        self.alert.show_alert(messaggio)

    def set_controller(self, controller):
        self.controller = controller

    def update(self):
        self.page.update()

    def load_interface(self):
        # Text del titolo
        self.txt_titolo = ft.Text(value = self.controller.get_nome(), size = 38, weight = ft.FontWeight.BOLD)

        # Text del responsabile
        self.txt_responsabile = ft.Text(value = f"Responsabile: {self.controller.get_responsabile()}", size = 16,
                                        weight = ft.FontWeight.BOLD)

        # TextField per responsabile
        self.input_responsabile = ft.TextField(value = self.controller.get_responsabile(), label = "Responsabile")

        # ListView per mostrare la lista di auto aggiornata
        self.lista_auto = ft.ListView(expand = True, spacing = 5, padding = 10, auto_scroll = True)

        # Text della ricerca automobili
        self.txt_ricerca_automobili = ft.Text(value = "Cerca automobile", size = 16, weight = ft.FontWeight.BOLD)

        # TextField per ricerca auto per modello
        self.input_modello_auto = ft.TextField(label = "Modello")

        # ListView per mostrare il risultato della ricerca auto per modello
        self.lista_auto_ricerca = ft.ListView(expand = True, spacing = 5, padding = 10, auto_scroll = True)

        # Tema
        self.toggle_cambia_tema = ft.Switch(label = "Tema scuro", value = True, on_change = self.cambia_tema)
        pulsante_conferma_responsabile = ft.ElevatedButton("Conferma", on_click = self.controller.conferma_responsabile)

        # Altri Pulsanti da implementare (es. "Mostra" e "Cerca")
        pulsante_mostra_automobili = ft.ElevatedButton("Mostra", on_click = self.controller.mostra_automobili)
        pulsante_cerca_automobili = ft.ElevatedButton("Cerca", on_click = self.controller.cerca_automobili)

        # --- LAYOUT ---
        self.page.add(
            self.toggle_cambia_tema,
            # Sezione del titolo
            self.txt_titolo,
            self.txt_responsabile,
            ft.Divider(),
            # Sezione di modifica informazioni
            ft.Text("Modifica Informazioni", size = 20),
            ft.Row(spacing = 200,
                   controls = [self.input_responsabile, pulsante_conferma_responsabile],
                   alignment = ft.MainAxisAlignment.CENTER),
            ft.Divider(),

            # Sezione per mostrare la lista delle automobili
            ft.Row(controls = [ft.Text("Automobili", size = 20), pulsante_mostra_automobili],
                   alignment = ft.MainAxisAlignment.CENTER),
            self.lista_auto,
            ft.Divider(),

            # Sezione per cercare automobili per modello
            self.txt_ricerca_automobili,
            ft.Row(controls = [self.input_modello_auto, pulsante_cerca_automobili],
                   alignment = ft.MainAxisAlignment.CENTER),
            self.lista_auto_ricerca
        )

    def cambia_tema(self, e):
        self.page.theme_mode = ft.ThemeMode.DARK if self.toggle_cambia_tema.value else ft.ThemeMode.LIGHT
        self.toggle_cambia_tema.label = "Tema scuro" if self.toggle_cambia_tema.value else "Tema chiaro"
        self.page.update()
