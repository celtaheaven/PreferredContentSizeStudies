# PreferredContentSizeStudies

## Para configurar a TESTING compiler flag
* Vá no menu principal do projeto
* Na Aba `Info`, perceba que há duas configurações em Configurations (Debug e Release) 
* Adicione uma nova clicando em +, baseando seu clone na Debug, e chame-a de **Test**
* Clique na Aba de `Build Settings`, sub-aba `All`, busque por `Other Swift Flags`
* Abra e selecione o ítem `Test`, adicione um ítem contendo `-DTESTING`.
* Aperte [Cmd] [Shift] [,] para ir nas configurações de Scheme
* Na aba de Test, coloque `Test` em `Build Configuration`

Essa configuração já está realizada nesse projeto.
