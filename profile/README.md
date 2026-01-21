<h1 style="text-align:center">🛡️ Guardia Tech</h1>

<h2>🏗️ Sobre a Organização</h2>

<p style="font-size:16px">
    Essa organização agrega os repositórios da Solução Guardia, um <b>Sistema de Monitoramento e Automação Industrial</b> desenvolvido no curso Big Data para Negócios na Fatec Ipiranga.
</p>

<h2>💬 Sobre a Solução Guardia</h2>

<p style="font-size:16px">
    A solução Guardia surgiu com a implementação de uma solução de IoT para monitoramento térmico em tempo real na indústria alimentícia, focando na conformidade de temperatura e umidade oferecendo:
    </br>
      
<ul>
    <li>
    <b>Arquitetura Serverless:</b> Firebase Cloud Functions para processamento de eventos e lógica de negócio na nuvem, automatizando o envio de alertas e o controle de dispositivos externos.
    </li>
    <li>
    <b>Monitoramento em Tempo Real:</b> Os sensores DHT22 e ESP32 permitem telemetria contínua enviando os dados para o Firebase Realtime Database para armazenamento e sincronização de dados.
    </li>
    <li>
    <b>Automação de Dispositivos (Edge Computing)</b> Sistema de controle de climatização automatizado via emissor IR, acionado via nuvem para manter a temperatura dentro dos limites operacionais.
    </li>
    <li>
    <b>Aplicativo Mobile:</b> Guardia conta também com um aplicativo mobile para visualização de métricas e recebimento de notificações push em caso de anomalias térmicas.
    </li>
</ul>
    
</p>

<h2>🔃 Fluxo da Solução</h2>



```mermaid
sequenceDiagram
    loop Envio de Dados
        Thermal Analyzer ->> Cloud Functions: Envia dados do ambiente (20s)
    end
    
    Mobile Monitor ->> Cloud Functions: Consulta dados em tempo real
    Cloud Functions ->> Mobile Monitor: Notifica leituras fora do limite
    Cloud Functions ->> IR Control: Aciona/Desliga Ar-condicionado
```

<h2>ℹ️ Descrição dos segmentos</h2>

<p style="text-align: justify; font-size:16px">
    Nessa seção será descrito o funcionamento de cada segmento do projeto, explicando seus objetivos, tecnologias e funcionamento.
</p>

<h3>🌡️ Segmento 1: Guardia Thermal Analyzer </h3>

<p style="text-align: justify; font-size:15px">
    Esse foi o primeiro segmento desenvolvido e que deu origem a todos os demais, seu objetivo é <b>coletar dados de temperatura e umidade</b> do ambiente. Para isso foi elaborado um sistema com <b>ESP-32</b> e sensores <b>DHT-22</b> que coletam esses dados em um intervalo de tempo determinado, por padrão é de 20 segundos. O ESP-32 tem a capacidade de se conectar a internet via Wi-Fi, com isso ele envia esses dados para serem processados, no caso ele envia para o <b>Firebase</b>, que é onde temos o segundo segmento do projeto.
    <br/>
    A linguagem de programação utilizada foi micropython, devido a sua facilidade de uso e aprendizagem.
</p>

<h3>☁️ Segmento 2: Guardia Cloud Functions</h3>

<p style="text-align: justify; font-size:16px">
    Esse segmento é o que contempla as configurações utilizadas no Firebase e no Firebase Cloud Functions. Este é um projeto serverless que utiliza o Cloud Functions para executar a lógica de backend e o Firebase Realtime Database para armazenar os dados.</br>
    No Cloud Functions foi criada uma função em Typescript que executa sempre que um novo registro, referente a uma leitura dos sensores, é realizado com isso é validado se os valores estão dentro do limite de segurança definido pelo usuário, caso não esteja ele envia uma notificação para o aplicativo móvel (Segemento 3) avisando da anomalia e pode acionar automaticamente o sistema de controle do ar-condicionado (Segmento 4). 
</p>

<h3>📊 Segmento 3: Guardia Mobile Monitor</h3>

<p style="text-align: justify; font-size:16px">
    O Mobile Monitor é a forma prática do usuário poder conferir as medições em tempo real e ser notificado quando a temperatura ou umidade saem do limite estipulado.<br/>
    Ele foi desenvolvido em Flutter com linguagem Dart, e utiliza a biblioteca flutter fire para se comunicar o Firebase.
</p>


<h3>🤖 Segmento 4: Guardia IR Control</h3>

<p style="text-align: justify; font-size:16px">
    Guardia IR Control é o sistema de automação baseado em sinal infravermelho, com ele é possível decodificar o sinal de um controle, por exemplo de um ar-condicionado, e replicá-lo com um emissor IR, dessa forma permitindo automatizar o controle desses sistemas.<br>
    O projeto foi escrito em Linguagem C do Arduino devido ao melhor suporte de bibliotecas. 
</p>