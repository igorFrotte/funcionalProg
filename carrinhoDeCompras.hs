module Main where

-- Tipos

type ProdutoEstoque = ([Char], Int, Int)
type EstoqueProdutos = [ProdutoEstoque]
type CarrinhoCompra = [ProdutoEstoque]

-- Métodos Get

getNome :: ([Char], Int, Int) -> [Char]
getNome(nome, _, _) = nome

getValor :: ([Char], Int, Int) -> Int
getValor(_, valor, _) = valor

getQuantidade :: ([Char], Int, Int) -> Int
getQuantidade(_, _, quantidade) = quantidade

-- Preencher o estoque

monitor :: ProdutoEstoque
monitor = ("monitor", 500, 100)

telefone :: ProdutoEstoque
telefone = ("telefone", 150, 300)

teclado :: ProdutoEstoque
teclado = ("teclado", 70, 50)

mouse :: ProdutoEstoque
mouse = ("mouse", 50, 50)

estoque :: EstoqueProdutos
estoque = [monitor, telefone, teclado, mouse]

-- Colocar produtos no Carrinho

colocaNoCarrinho :: ProdutoEstoque -> Int -> ProdutoEstoque
colocaNoCarrinho produto quantidade = (getNome produto, getValor produto, quantidade)

monitorCarrinho :: ProdutoEstoque
monitorCarrinho = colocaNoCarrinho monitor 2

telefoneCarrinho :: ProdutoEstoque
telefoneCarrinho = colocaNoCarrinho telefone 5

tecladoCarrinho :: ProdutoEstoque
tecladoCarrinho = colocaNoCarrinho teclado 2

carrinho :: CarrinhoCompra
carrinho = [monitorCarrinho, telefoneCarrinho, tecladoCarrinho]

-- Atualizar o estoque

attEstoque :: ProdutoEstoque -> Int -> ProdutoEstoque
attEstoque produto quantidade = (getNome produto, getValor produto, getQuantidade produto - quantidade)

estoqueAtualizado :: EstoqueProdutos
estoqueAtualizado = [attEstoque monitor 2, attEstoque teclado 2, attEstoque telefone 5, mouse]

-- Finalizar a compra

calculaTotal :: ProdutoEstoque -> Int
calculaTotal produto = getValor produto * getQuantidade produto

totalCompra :: Int 
totalCompra = sum (map calculaTotal carrinho) 

main :: IO ()
main = do

    putStrLn "A soma dos produtos :"
    print totalCompra
    -- print estoqueAtualizado