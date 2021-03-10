(*
* Projet TIPE sur la cryptographie
* et le chiffrement
*
* Partie : AES - Demo
* On fait un essaie de l'algorithme
*
* Auteurs :
* FALLET Nathan
* LAMIDEL Arthur
* MAKALOU Shérif
*)

(*
* On importe notre algorithme
*)

open Ciphers;;

(*
* Fonction utile pour la démonstration
* On affiche un array en héxadécimal
*)
let print_array array =
    for k = 0 to 15 do
        print_string (Printf.sprintf "%02x" array.(k));
    done;
    print_newline();;

(*
* On fait notre démonstration
*
* Vérifie les données de test :
* National Institute of Standards and Technology Special Publication 800-38A 2001 ED
* https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38a.pdf
*)

(*
* Example Vectors for Modes of Operation of the AES - ECB-AES123 Example Vectors - Block #1
*
* Clé    : 2b7e151628aed2a6abf7158809cf4f3c
* Entrée : 6bc1bee22e409f96e93d7e117393172a
* Sortie : 3ad77bb40d7a3660a89ecaf32466ef97
*)
let cle =    [|0x2b; 0x7e; 0x15; 0x16; 0x28; 0xae; 0xd2; 0xa6; 0xab; 0xf7; 0x15; 0x88; 0x09; 0xcf; 0x4f; 0x3c|] in
let entree = [|0x6b; 0xc1; 0xbe; 0xe2; 0x2e; 0x40; 0x9f; 0x96; 0xe9; 0x3d; 0x7e; 0x11; 0x73; 0x93; 0x17; 0x2a|] in
let check  = [|0x3a; 0xd7; 0x7b; 0xb4; 0x0d; 0x7a; 0x36; 0x60; 0xa8; 0x9e; 0xca; 0xf3; 0x24; 0x66; 0xef; 0x97|] in
let sortie = ecb entree cle in

print_string "-- ECB --\nClé    : ";
print_array cle;
print_string "Entrée : ";
print_array entree;
print_string "Sortie : ";
print_array sortie;
print_endline (if sortie = check then "OK" else "ERREUR");;

(*
* Example Vectors for Modes of Operation of the AES - CFB128-AES128 Example Vectors - Block #1
*
* Clé    : 2b7e151628aed2a6abf7158809cf4f3c
* Entrée : 6bc1bee22e409f96e93d7e117393172a
* VI     : 000102030405060708090a0b0c0d0e0f
* Sortie : 3b3fd92eb72dad20333449f8e83cfb4a
*)
let cle =    [|0x2b; 0x7e; 0x15; 0x16; 0x28; 0xae; 0xd2; 0xa6; 0xab; 0xf7; 0x15; 0x88; 0x09; 0xcf; 0x4f; 0x3c|] in
let entree = [|0x6b; 0xc1; 0xbe; 0xe2; 0x2e; 0x40; 0x9f; 0x96; 0xe9; 0x3d; 0x7e; 0x11; 0x73; 0x93; 0x17; 0x2a|] in
let vi =     [|0x00; 0x01; 0x02; 0x03; 0x04; 0x05; 0x06; 0x07; 0x08; 0x09; 0x0a; 0x0b; 0x0c; 0x0d; 0x0e; 0x0f|] in
let check =  [|0x3b; 0x3f; 0xd9; 0x2e; 0xb7; 0x2d; 0xad; 0x20; 0x33; 0x34; 0x49; 0xf8; 0xe8; 0x3c; 0xfb; 0x4a|] in
let sortie = cfb entree cle vi in

print_string "\n-- CFB --\nClé    : ";
print_array cle;
print_string "Entrée : ";
print_array entree;
print_string "VI     : ";
print_array vi;
print_string "Sortie : ";
print_array sortie;
print_endline (if sortie = check then "OK" else "ERREUR");;