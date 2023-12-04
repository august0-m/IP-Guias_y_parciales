{--
relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs) | tuplaDistinta (x)   && tuplasDistintasAux  x xs  = True
                         |otherwise = False   

tuplaDistinta :: (String,String) -> Bool
tuplaDistinta (x,y) = x/= y

tuplasDistintasAux :: (String,String) -> (String,String) -> Bool
tuplasDistintasAux x y   | fst x == fst y && snd x == snd y = False
                         | fst x == snd y && snd x == fst y = False
                         | fst x == snd y && snd x == fst y = False
                         |otherwise = True
                         --}
{-ej 2-}
personas :: [(String,String)] -> [(String)]
personas x = (sacarRepes(apilarPersonas x))

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece a (x:xs) | a == x  = True
                   | otherwise = pertenece a xs

apilarPersonas :: [(String,String)] -> [String]
apilarPersonas [] =[]
apilarPersonas ((x,y):xs) = x : y : apilarPersonas xs

sacarRepes :: (Eq t) => [t] -> [t]
sacarRepes [] = []
sacarRepes (x:xs) | pertenece x xs = sacarRepes xs
                  | otherwise = x : sacarRepes xs
{-ej 3-}
amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe a ((x,y):xs) |(a == x) = y : amigosDe a xs
                      |(a == y) = x :amigosDe a xs
                      |otherwise = amigosDe a xs
{-ej 4-} {-
personaConMasAmigos :: [(String,String)] -> [String] 
personaConMasAmigos (x:y:xs) | cantidadApariciones x >= cantidadApariciones y = personaConMasAmigos  x xs
                             | otherwise = personaConMasAmigos y xs
-}
cantidadApariciones :: String -> [String] -> Integer
cantidadApariciones _ [] = 0
cantidadApariciones  a (x:xs) | a == x = 1 + cantidadApariciones a xs
                              | otherwise = cantidadApariciones a xs

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos rs = maximo listaPersonas cantAmigosPersonas
                where
                    listaPersonas      = personas rs
                    cantAmigosPersonas = cantidadDeAmigos listaPersonas rs

cantidadDeAmigos :: [String] -> [(String,String)] -> [Int]
cantidadDeAmigos [] _ = []
cantidadDeAmigos (p:ps) rs = (cantidadDeAmigosDe p rs) : (cantidadDeAmigos ps rs)    

maximo :: [String] -> [Int] -> String
maximo [p] _ = p
maximo (p0:p1:ps) (c0:c1:cs)  | c0 > c1   = maximo (p0:ps) (c0:cs)
                              | otherwise = maximo (p1:ps) (c1:cs)

cantidadDeAmigosDe :: String -> [(String,String)] -> Int
cantidadDeAmigosDe p rs = length (amigosDe p rs)

