import Foundation

var pessoas: [String: [String]] = [:]

func exibirMenu() {
    print("""
    Menu Principal:
    1. Criar
    2. Alterar
    3. Apagar
    4. Buscar pelo nome
    5. Exibir todos os dados
    6. Sair
    """)
}

func criarPessoa() {
    print("Digite o nome:")
    guard let nome = readLine(), !nome.isEmpty else {
        print("Nome inválido.")
        return
    }
    
    if pessoas[nome] != nil {
        print("Erro: Já existe uma pessoa com este nome.")
        return
    }
    
    print("Digite o email:")
    guard let email = readLine(), !email.isEmpty else {
        print("Email inválido.")
        return
    }
    
    print("Digite o celular:")
    guard let celular = readLine(), !celular.isEmpty else {
        print("Celular inválido.")
        return
    }
    
    print("Digite a idade:")
    guard let idade = readLine(), !idade.isEmpty else {
        print("Idade inválida.")
        return
    }
    
    pessoas[nome] = [email, celular, idade]
    print("Pessoa criada com sucesso!")
}

func alterarPessoa() {
    print("Digite o nome da pessoa que deseja alterar:")
    guard let nome = readLine(), !nome.isEmpty else {
        print("Nome inválido.")
        return
    }
    
    guard let dadosExistentes = pessoas[nome] else {
        print("Erro: Pessoa não encontrada.")
        return
    }
    
    print("Pessoa encontrada. Dados atuais: Email: \(dadosExistentes[0]), Celular: \(dadosExistentes[1]), Idade: \(dadosExistentes[2])")
    
    print("Digite o novo email:")
    guard let novoEmail = readLine(), !novoEmail.isEmpty else {
        print("Email inválido.")
        return
    }
    
    print("Digite o novo celular:")
    guard let novoCelular = readLine(), !novoCelular.isEmpty else {
        print("Celular inválido.")
        return
    }
    
    print("Digite a nova idade:")
    guard let novaIdade = readLine(), !novaIdade.isEmpty else {
        print("Idade inválida.")
        return
    }
    
    pessoas[nome] = [novoEmail, novoCelular, novaIdade]
    print("Dados da pessoa alterados com sucesso!")
}

func apagarPessoa() {
    print("Digite o nome da pessoa que deseja apagar:")
    guard let nome = readLine(), !nome.isEmpty else {
        print("Nome inválido.")
        return
    }
    
    if pessoas.removeValue(forKey: nome) != nil {
        print("Pessoa apagada com sucesso!")
    } else {
        print("Erro: Pessoa não encontrada.")
    }
}

func buscarPessoa() {
    print("Digite o nome da pessoa que deseja buscar:")
    guard let nome = readLine(), !nome.isEmpty else {
        print("Nome inválido.")
        return
    }
    
    if let dados = pessoas[nome] {
        print("Dados da pessoa: Email: \(dados[0]), Celular: \(dados[1]), Idade: \(dados[2])")
    } else {
        print("Erro: Pessoa não encontrada.")
    }
}

func exibirTodos() {
    if pessoas.isEmpty {
        print("Nenhuma pessoa cadastrada.")
    } else {
        for (nome, dados) in pessoas {
            print("Nome: \(nome), Email: \(dados[0]), Celular: \(dados[1]), Idade: \(dados[2])")
        }
    }
}

func iniciarPrograma() {
    var continuar = true
    
    while continuar {
        exibirMenu()
        guard let opcao = readLine() else { continue }
        
        switch opcao {
        case "1":
            criarPessoa()
        case "2":
            alterarPessoa()
        case "3":
            apagarPessoa()
        case "4":
            buscarPessoa()
        case "5":
            exibirTodos()
        case "6":
            continuar = false
            print("Encerrando o programa...")
        default:
            print("Opção inválida.")
        }
    }
}

iniciarPrograma()