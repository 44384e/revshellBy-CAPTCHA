# revshellBy-CAPTCHA

> 44384e | Outubro 27, 2024

------------------------------


Este código deve ser utilizado em ambiente controlado onde você tenha permissão para realizar o teste de fishing.

Ouça com o netcat em uma porta especifica, lembre de alterar no `sed` abaixo.
```
nc -nvlp 999
```


altere no codigo para seu ip publico e a porta que está ouvindo o netcat.
```
ip-address=$(curl ip.me)
sed -i 's/localhost/$ip-address/g' ./revshell.ps1
sed -i 's/localhost/$ip-address/g' ./index.html
sed -i 's/port/SuaPortaDoNETCAT/g' ./revshell.ps1
```



![Verify You Are Human](https://github.com/user-attachments/assets/56be51b9-e58d-40e9-bdb1-54bcc11d4180)

Este é uma pequena amostra para recriar a engenharia social e a isca de phishing vista recentemente na natureza por volta de agosto/setembro de 2024.

## 🪝 Usando a Isca

Visto originalmente com o disfarce **"Verifique se você é humano"**, o vetor de ataque sendo _**copiar e colar**_.

Ele literalmente instrui o usuário a abrir a caixa de diálogo Executar do Windows com a tecla de atalho `Win+R` e fazer com que ele cole um comando malicioso com `Ctrl+V` que o navegador da web copiou preventivamente para a área de transferência.

![Verification Steps](https://github.com/user-attachments/assets/77e9adcb-672e-4a45-845d-58a90ba22935)

Apesar de ser... **_idiota_**... claro, provavelmente funciona. 😅


----------

## 🎨 Recriação

> [!CAUTION]
> O código é ruim porque sou um péssimo programador.

Considerando que o original foi criado para emular um formulário reCAPTCHA , pensei que essa "arte" (se é que você ousa chamá-la assim) poderia ser melhorada. 😈Por que não fazer com que pareça o mais próximo possível do botão real do reCAPTCHA?

![reCAPTCHA](https://github.com/user-attachments/assets/3967e15b-0717-4db4-afa1-62394e47f3b2)

![New Steps](https://github.com/user-attachments/assets/2fac92b1-fdff-4a67-883b-b8c1b8ae4aa7)

Este repositório inclui parte do meu código brincando com essa ideia.

Na verdade, tudo o que você precisa é `index.html`. Ele inclui o CSS e o JavaScript em um único arquivo para facilitar o uso, mas pode precisar de mais personalização para alterar o comando que é executado (veja o JavaScript no final da `showVerifyWindow`função). Isso pode ser usado como um arquivo autônomo e executar qualquer comando local, mas para obter um pouco mais de flexibilidade com a execução do código, este repositório inclui um arquivo HTA de amostra `recaptcha-verify` para uma prova inocente de conceito de abrir o aplicativo da calculadora do Windows. Este arquivo HTA secundário significaria que ele precisa ser hospedado no lado do servidor ou ter alguma outra infraestrutura de suporte para oferecer a carga útil.

Para testes locais rápidos, eu literalmente usei apenas `python -m http.server 8000`.

O arquivo HTA também oferece uma oportunidade para uma charada mais convincente, potencialmente com uma janela que aparece para "tentar se conectar aos servidores reCAPTCHA", mas informa que falhou e solicita que o usuário faça tudo de novo. 🤪 (Alguém quer retornos de chamada extras?)

![Fail to connect](https://github.com/user-attachments/assets/b3e062a5-eb2a-4c43-9b6f-411625e7f740)

Então esta recreação tem algumas vantagens extras:

* Parece e funciona como um reCAPTCHA "real" ( imagem do site oficial do Google )
* Validação na caixa Executar para "ocultar" o comando (✅ "Não sou um robô - ID de verificação do reCAPTCHA: 7624" )
* Botão "Verificar" desabilitado para incentivar ainda mais os usuários a concluir as etapas de copiar e colar. 🚫
* Phishing desenvolvido com as janelas de acompanhamento "falha na verificação"
* Limpa a área de transferência para que o comando de carga útil seja removido.


-------------

## 🤔 Outras reflexões 

* Talvez isso pudesse ser usado dentro de um `iframe` elemento ou facilmente incorporado como um widget em qualquer lugar .
* Talvez isso pudesse ter um pouco mais de controle do lado do servidor para verificar o agente do usuário do cliente e fazer as coisas de forma diferente, ou ajustar a carga útil adequadamente.
* Talvez isso pudesse ser transformado em um Github Pages ou Vercel tidbit fácil para ter um domínio público e ferramentas fáceis


<h1>Legal Disclaimer:</h1>
**O uso desta ferramenta para atacar alvos sem consentimento mútuo prévio é ilegal. É responsabilidade do usuário final obedecer a todas as leis locais, estaduais e federais aplicáveis. Os desenvolvedores não assumem nenhuma responsabilidade e não são responsáveis ​​por qualquer uso indevido ou dano causado pelo programa

