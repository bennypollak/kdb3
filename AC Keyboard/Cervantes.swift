//
//  Cervantes.swift
//  kdb3
//
//  Created by Benny Pollak on 8/18/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//
import Foundation

class Cervantes {
    // http://www.taringa.net/posts/humor/6506274/Insultos-Graciosos-Y-Originales.html
    static let insults: [String] = [
      "Eres la mejor prueba de que Dios realmente tiene sentido del humor."
    , "Me eres tan indiferente que no he tenido tiempo para olvidarte."
    , "Dime como te llamas para poder poner nombre a mis pesadillas."
    , "Si la ignorancia fuese oro, te convertirías en el mayor tesoro."
    , "Deberías poner a trabajar la única neurona que te queda."
    , "Tesoro, ¿por qué no buscas alguien que te entierre?"
    , "La mona aunque se vista de seda, mona se queda."
    , "Eres mas simple que el mecanismo de un chupete."
    , "Hay días tontos y tontos todos los días."
    , "Te diferencias de los caballos en una sola neurona, lo justo como para no cagarte en los desfiles."
    , "Te tendrían que dar dos medallas, una por corto y otra por si la pierdes."
    , "Tienes menos luces que un cayuco."
    , "Te bautizaron en una plaza de toros y con camiones de riego."
    , "Eres mas inútil que un teclado sin Intro."
    , "Las fotos en las que sales tienen miedo a revelarse."
    , "Me enviastes una foto x el msn y la detecto el anti-virus"
    , "Te apuntastes a un concurso de feos y diieron k no admitian profesionales"
    , "Las fotos en las que sales tienen miedo a revelarse"
    , "Tu madre es puta y cobra muy caro"
    , "Tu padre es puto y tu madre su jefe"
    , "El otro dia vi a tu madre sacando al perro... no... espera... paseaba contigo"
    , "Tu madre es tan fea tan fea y tan peluda que el unico que se la follo fue king kong y ahora tu eres la consecuencia"
    , "Vi a tu madre montando una perfumeria en el baño de la discoteca, lo se por que no paraba de oler"
    , "Señores... un ejemplo del aborto caido"
    , "He visto a tu novia, dile que mañana le pago"
    , "Tu hermana lleva barba o me enseño otra cosa?"
    , "La ultima vez que vi a tu madre fue en la cama de un hotel chupando un polo de chocolate que le ofrecio un amable señor negro"
    , "Tu padre bebe mucha leche? le vi en una esquina con el bigote blanco"
    , "Tu padre no es gay, es afeminadamente femenino"
    , "Tu madre lo debe tener mas cedido entre los polvos que le echo y el coñazo de tio que echo por culpa de un polvo..."
    , "Dile a tu padre que deje de violar a mi perro, que ya tiene a la perra de su mujer y a su hijo animal"    ]
    

    static func insult() -> String {
        return Cervantes.insults[Int(arc4random_uniform(UInt32(Cervantes.insults.count)))]
    }
}
