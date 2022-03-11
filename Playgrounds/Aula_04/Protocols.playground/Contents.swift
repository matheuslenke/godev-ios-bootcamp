import UIKit

protocol SomeProtocol {
    
}

protocol ReformarCampo {
    func plantarNovaGrama()
    func pintarNovasLinhas()
}

// Cada classe pode implementar da sua forma o protocolo, ambas seguindo as mesmas 
class EmpresaA: ReformarCampo {
    func plantarNovaGrama() {
        // contratarEmpregados()
        // fazerEmpregadosPlantaremGrama()
    }
    
    func pintarNovasLinhas() {
        // contratarEmpregados()
        // fazerEmpregadosPintaremLinhas()
    }
}

class EmpresaB: ReformarCampo {
    func plantarNovaGrama() {
        // comprarMaquinas
        // usarMaquinas
    }
    
    func pintarNovasLinhas() {
        // comprarMaquinas
        // usarMaquinas
    }
    
    
}
