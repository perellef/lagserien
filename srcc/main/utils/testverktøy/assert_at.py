from srcc.main.kontrollsenter.tilganger import Tilganger

class AssertAt:

    def __init__(self, input):
        self.__input = input

    def feiler_med(self, feiltype):
        try:
            self.__input()
        except feiltype:
            return
        except Exception as e:
            raise AssertionError(f"Skulle ha feilet på {feiltype}, men fikk feiltypen: {e}.")
        raise AssertionError(f"Skulle ha feilet på {feiltype}, men feilet ikke.")
    
    def ikke_feiler(self):
        try:
            self.__input()
            return
        except Exception as e:
            raise AssertionError(f"Skulle ikke ha feilet, men kastet feilmeldingen: {e}.")    

    def kun_har(self, elementer):
        assert set(self.__input) == set(elementer), f"Skulle hatt elementene {set(elementer)}, men hadde: {set(self.__input)}"

    def kun_inneholder(self, *elementer):
        self.kun_har(elementer)

    def er_tilnærmet_lik(self, objekt, presisjon):
        assert objekt - presisjon <= self.__input and self.__input <= objekt + presisjon

    def er_lik(self, objekt):
        assert self.__input == objekt, f"Forventet {objekt}, men fikk {self.__input}."

    def er_ulik(self, objekt):
        assert self.__input != objekt, f"Forventet ulik {objekt}, men var {self.__input}."

    def er_true(self):
        assert self.__input is True

    def er_false(self):
        assert self.__input is False

    def er_none(self):
        assert self.__input is None

    def ikke_er(self, objekt):
        assert self.__input is not objekt

class AssertAtSeriedata:
    
    def __init__(self, seriedata):
        self.__seriedata = seriedata

    def av_type(self, cls):
        return AssertAtSeriedata.AvType(self.__seriedata, cls)
    
    class AvType:
        def __init__(self, seriedata, cls):
            self.__seriedata = seriedata
            self.__seriedata._Seriedata__tilganger = Tilganger.ALT
            self.__cls = cls

        def kun_har(self, elementer):
            assert set(self.__seriedata.hent(self.__cls)) == set(elementer), f"Skulle hatt elementene {set(elementer)}, men hadde: {set(self.__seriedata.hent(self.__cls))}"

        def kun_inneholder(self, *elementer):
            self.kun_har(elementer)         

        def er_tom(self):
            assert len(set(self.__seriedata.hent(self.__cls))) == 0, f"Skulle vært tom, men var {set(self.__seriedata.hent(self.__cls))}"

def assert_at(input):
    if type(input).__name__ == 'Seriedata':
        return AssertAtSeriedata(input)
    return AssertAt(input)
