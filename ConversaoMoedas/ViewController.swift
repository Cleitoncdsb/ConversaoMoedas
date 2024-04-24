import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

@IBOutlet weak var lblOrigem: UILabel!
@IBOutlet weak var txtValor: UITextField!
@IBOutlet weak var btnDolar: UIButton!
@IBOutlet weak var btnEuro: UIButton!
@IBOutlet weak var btnLibra: UIButton!
@IBOutlet weak var lblResultado: UILabel!
@IBOutlet weak var lblNovaMoeda: UILabel!
    
  let codigoOrigem = "Converter de Real >> BRL"
    
  override func viewDidLoad() {
    super.viewDidLoad()

    // Configurar interface inicial
    lblOrigem.text = codigoOrigem
      txtValor.delegate = self
      
      let fundo = UIImageView(frame: UIScreen.main.bounds)
      fundo.image = UIImage(named: "fundo")
      
      fundo.contentMode = .scaleToFill
      
      view.insertSubview(fundo, at: 0)
      
  }

    
    @IBAction func converterUSD(_ sender: UIButton) {
      // Obter valor a ser convertido
      guard let valor = Double(txtValor.text!) else {
        return
      }

      // Realizar conversão para USD
        let resultado = valor * 0.20

      // Exibir resultado
      lblResultado.text = String(format: "%.2f", resultado)+" US$"
      lblNovaMoeda.text = "Dolar Americano"
    }

    @IBAction func converterGPB(_ sender: UIButton) {

        // Obter valor a ser convertido
      guard let valor = Double(txtValor.text!) else {
        return
      }

      // Realizar conversão para USD
        let resultado = valor * 0.16

      // Exibir resultado
      lblResultado.text = String(format: "%.2f", resultado)+" £"
        lblNovaMoeda.text = "Libra Estrelinha"
    }
    
    @IBAction func converterEURO(_ sender: UIButton) {
      // Obter valor a ser convertido
      guard let valor = Double(txtValor.text!) else {
        return
      }

      // Realizar conversão para USD
        let resultado = valor * 0.18

      // Exibir resultado
      lblResultado.text = String(format: "%.2f", resultado)+" Є"
        lblNovaMoeda.text = "Euros"
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Verificar se a string de substituição contém apenas números e um único ponto decimal
        let allowedCharacters = CharacterSet(charactersIn: "0123456789.,") // Permitir números e ponto decimal
        let characterSet = CharacterSet(charactersIn: string)
        
        // Verificar se a string de substituição contém apenas caracteres permitidos
        guard allowedCharacters.isSuperset(of: characterSet) else {
            return false
        }
        
        // Verificar se a string resultante é um número float válido
        let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        return isValidFloat(text: newText)
    }

    // Função auxiliar para validar se uma string representa um número float válido
    func isValidFloat(text: String) -> Bool {
        return Float(text) != nil
    }
}

