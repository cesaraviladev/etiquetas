class TipoEtiqueta < EnumerateIt::Base
  associate_values(
    autenticidade: 0,
    semelhanca: 1
  )
end
