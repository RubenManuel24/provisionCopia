import '../models/certificado_models.dart';
import '../models/history_models.dart';
import '../models/message_model.dart';
import '../models/sheduling_models.dart';


// List<MaterialModels> materialmovicel1 = [
//   MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 11),
// ];


// List<MaterialModels>  materialmovicel2 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "dwert45", name: "Sabonete Líquido Antisséptico", quant: 9),
//     MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 11),
// ];


// List<MaterialModels> materialmovicel3 = [
//   MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "dwert45", name: "Sabonete Líquido Antisséptico", quant: 9),
//     MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 11),
// ];

// List<MaterialModels> materialmovicel4 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Limpa-alumínio", quant: 3),
// ];


// List<MaterialModels> materialmovicel5 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Rodo de Borracha", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
// ];

// List<MaterialModels> materialmovicel6 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 143),
// ];


// List<MaterialModels> materialmovicel7 = [
//   MaterialModels(id: "we4ud3", name: "Álcool Isopropílico", quant: 14),
//   MaterialModels(id: "wasd323", name: "Mop Descartável", quant: 7),
//   MaterialModels(id: "wae2345", name: "Álcool Isopropílico", quant: 9),
//   MaterialModels(id: "weer43", name: "Sacos de Aspirador Descartáveis", quant: 45),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 53),
//    MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "dwert45", name: "Sabonete Líquido Antisséptico", quant: 9),
//     MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
// ];


// List<MaterialModels> materialmovicel8 = [
//   MaterialModels(id: "we4ud3", name: "Álcool Isopropílico", quant: 14),
//   MaterialModels(id: "wasd323", name: "Mop Descartável", quant: 7),
//   MaterialModels(id: "wae2345", name: "Álcool Isopropílico", quant: 9),
//   MaterialModels(id: "weer43", name: "Sacos de Aspirador Descartáveis", quant: 45),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 53),
//    MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),

//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
// ];


// List<MaterialModels> materialunitel1 = [
//   MaterialModels(id: "wae2345", name: "Álcool Isopropílico", quant: 9),
//   MaterialModels(id: "weer43", name: "Sacos de Aspirador Descartáveis", quant: 45),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 53),
// ];

// List<MaterialModels> materialunitel2 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 11),
//   MaterialModels(id: "we45fgdf", name: "Sacos de Lixo Resistentes", quant: 10),
//   MaterialModels(id: "dwert45", name: "Sabonete Líquido Antisséptico", quant: 9),
// ];


// List<MaterialModels> materialunitel3 = [
//   MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
// ];


// List<MaterialModels> materialunitel4 = [
//   MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 11),
// ];


// List<MaterialModels> materialunitel5 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "dwert45", name: "Sabonete Líquido Antisséptico", quant: 9),
// ];


// List<MaterialModels> materialunitel6 = [
//   MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
// ];


// List<MaterialModels> materialunitel7 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 143),
// ];


// List<MaterialModels> materialunitel8 = [
//   MaterialModels(id: "we4ud3", name: "Álcool Isopropílico", quant: 14),
//   MaterialModels(id: "wasd323", name: "Mop Descartável", quant: 7),
//   MaterialModels(id: "wae2345", name: "Álcool Isopropílico", quant: 9),
//   MaterialModels(id: "weer43", name: "Sacos de Aspirador Descartáveis", quant: 45),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 53),
//    MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "dwert45", name: "Sabonete Líquido Antisséptico", quant: 9),
//     MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
// ];


// List<MaterialModels> materialsonagol1 = [
//   MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 11),
// ];


// List<MaterialModels> materialsonagol2 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "dwert45", name: "Sabonete Líquido Antisséptico", quant: 9),
// ];


// List<MaterialModels> materialsonagol3 = [
//   MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
// ];

// List<MaterialModels> materialsonagol4 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//  MaterialModels(id: "wasd323", name: "Limpa-alumínio", quant: 3),
// ];


// List<MaterialModels> materialsonagol5 = [
//   MaterialModels(id: "we4ud3", name: "Detergente Multiuso", quant: 1),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Rodo de Borracha", quant: 5),
//  MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
// ];


// List<MaterialModels> materialsonagol6 = [
//   MaterialModels(id: "we4ud3", name: "Sacos de Lixo Resistentes", quant: 14),
//   MaterialModels(id: "wasd323", name: "Sabão Neutro", quant: 3),
//   MaterialModels(id: "wasd323", name: "Desinfetante Hospitalar", quant: 2),
//   MaterialModels(id: "wae2345", name: "Limpa-cal", quant: 5),
//   MaterialModels(id: "weer43", name: "Desinfetante para Superfícies", quant: 4),
//   MaterialModels(id: "we45we", name: "Esponjas Abrasivas", quant: 11),
// ];











// List<ToolModels> equipamentobai1 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
// ];

// List<ToolModels> equipamentobai2 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
// ];

// List<ToolModels> equipamentobai3 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 11),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 12),
//   ToolModels(id: "we4ud3", name: "Unidade de Reciclagem de Água", quant: 7),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentobai4 = [
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora de Vidros", quant: 12),
//   ToolModels(id: "we4ud3", name: "Unidade de Reciclagem de Água", quant: 7),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
// ];

// List<ToolModels> equipamentobai5 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 23),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 69),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
//    ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
// ];


// List<ToolModels> equipamentoagt1 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
// ];

// List<ToolModels> equipamentoagt2 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
// ];

// List<ToolModels> equipamentoagt3 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 11),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 12),
//   ToolModels(id: "we4ud3", name: "Unidade de Reciclagem de Água", quant: 7),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentoagt4 = [
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora de Vidros", quant: 12),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentoagt5 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
// ];

// List<ToolModels> equipamentobic1 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
// ];

// List<ToolModels> equipamentobic2 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
// ];

// List<ToolModels> equipamentobic3 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentobic4 = [
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentobic5= [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
// ];



// List<ToolModels> equipamentomacon1 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];


// List<ToolModels> equipamentomacon2 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 11),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 12),
//   ToolModels(id: "we4ud3", name: "Unidade de Reciclagem de Água", quant: 7),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];


// List<ToolModels> equipamentobaikasaude1 = [
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentobaikasaude2 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
// ];


// List<ToolModels> equipamentomovicel1 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
// ];

// List<ToolModels> equipamentomovicel2 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 11),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 12),
//   ToolModels(id: "we4ud3", name: "Unidade de Reciclagem de Água", quant: 7),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentomovicel3 = [
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora de Vidros", quant: 12),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentomovicel4 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
// ];

// List<ToolModels> equipamentomovicel5 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
// ];

// List<ToolModels> equipamentomovicel6 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
// ];

// List<ToolModels> equipamentomovicel7 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentomovicel8 = [
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentounitel1 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
// ];

// List<ToolModels> equipamentounitel2 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentounitel3 = [
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentounitel4 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
// ];



// List<ToolModels> equipamentounitel5 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];


// List<ToolModels> equipamentounitel16 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 11),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 12),
//   ToolModels(id: "we4ud3", name: "Unidade de Reciclagem de Água", quant: 7),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];


// List<ToolModels> equipamentounitel6 = [
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentounitel7 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
// ];


// List<ToolModels> equipamentounitel8 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
// ];

// List<ToolModels> equipamentosonangol1 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 23),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 69),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
//    ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
// ];


// List<ToolModels> equipamentosonangol2 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
// ];

// List<ToolModels> equipamentosonangol3 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 10),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 10),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 10),
// ];

// List<ToolModels> equipamentosonangol4 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Enceradeira Industrial", quant: 2),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 1),
//   ToolModels(id: "we4ud3", name: "Lavadora de Alta Pressão", quant: 3),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 11),
//   ToolModels(id: "we4ud3", name: "Soprador de Pó", quant: 12),
//   ToolModels(id: "we4ud3", name: "Unidade de Reciclagem de Água", quant: 7),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 13),
//   ToolModels(id: "we4ud3", name: "Aparelho de Limpeza a Vapor para Roupas", quant: 2),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 6),
//   ToolModels(id: "we4ud3", name: "Soprador de Gelo Seco", quant: 3),
//   ToolModels(id: "we4ud3", name: "Limpador de Grãos", quant: 1),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentosonangol5 = [
//   ToolModels(id: "we4ud3", name: "Lavadora e Secadora de Pisos", quant: 9),
//   ToolModels(id: "we4ud3", name: "Desinfetante de Ar por UV", quant: 10),
//   ToolModels(id: "we4ud3", name: "Lavadora de Vidros", quant: 12),
//   ToolModels(id: "we4ud3", name: "Vassoura Elétrica", quant: 5),
// ];

// List<ToolModels> equipamentosonangol6 = [
//   ToolModels(id: "we4ud3", name: "Aspirador de Pó Industrial", quant: 1),
//   ToolModels(id: "we4ud3", name: "Máquina de Vapor", quant: 14),
// ];

List<CertificateModels> listCertificate = [
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado1.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado2.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado3.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado4.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado5.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado6.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado7.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado8.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado9.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado10.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado11.jpg"),
 CertificateModels(id: "qewqrrwwew", image: "assets/certificate/certificado12.jpg"),
];


List<ShedulingModels> listShedulingModels = [
  ShedulingModels(id: "sfsfsd", title: "Limpeza Profunda Residencial", descrition: "Desfrute de um ambiente impecavelmente limpo em sua casa. Nossa equipe especializada realizará uma limpeza profunda em todos os cantos, garantindo um lar fresco e saudável.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Desinfecção de Ambientes Comerciais", descrition: "Proteja seus clientes e funcionários. Agende a desinfecção regular de seu espaço comercial para garantir um ambiente seguro e higiênico.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Agendamento para Limpeza de Carpetes", descrition: "Renove a aparência de seus carpetes. Nossa equipe utilizará métodos avançados para limpar e revitalizar seus carpetes, removendo manchas e odores indesejados.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Serviço de Limpeza de Estofados", descrition: "Seus móveis merecem cuidado especial. Agende uma limpeza profissional de estofados para manter sua mobília limpa, fresca e duradoura.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Manutenção de Ambientes Corporativos", descrition: "Mantenha seu escritório impecável. Agende a manutenção regular para garantir um ambiente de trabalho limpo e produtivo.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Limpeza e Desinfecção de Banheiros", descrition: "Garanta banheiros imaculados em seu estabelecimento. Nossa equipe realiza limpeza profunda e desinfecção para manter a higiene.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Higienização de Tapetes e Cortinas", descrition: "Tapetes e cortinas limpos fazem toda a diferença. Agende nossa equipe para uma higienização completa, removendo poeira e alérgenos.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Programação de Limpeza de Vidros", descrition: "Janelas e vidros transparentes. Agende a limpeza regular para manter uma visão clara e uma impressão positiva.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Serviço de Limpeza Pós-Obra", descrition: "Após a construção ou reforma, sua casa ou escritório merece uma limpeza profunda. Agende para remover resíduos e deixar tudo impecável.", date: DateTime(2024,11,10,10,30),),
  ShedulingModels(id: "sfsfsd", title: "Tratamento de Pisos e Superfícies", descrition: "Preserve a beleza de seus pisos. Agende um tratamento especializado para proteger e prolongar a vida útil de suas superfícies.", date: DateTime(2024,11,10,10,30), ),
];



// List<MessgeModel> listMessage = [
//    MessgeModel(idUsuarioDestinario: "", idUsuarioAtual: " ", mensagem: "Bom dia! Estou bem, obrigado. Pronto para começar o dia.", urlImagem: " "),
//    MessgeModel(idUsuarioDestinario: "", idUsuarioAtual: " ", mensagem: "Ótimo. Precisamos finalizar o relatório até sexta-feira. Como está progredindo?", urlImagem: " "),
//    MessgeModel(idUsuarioDestinario: "", idUsuarioAtual: " ", mensagem: "Estou revisando os dados agora. Devo terminar até o final do dia.", urlImagem: " "),
//    MessgeModel(idUsuarioDestinario: "", idUsuarioAtual: " ", mensagem: "Perfeito. Recebi elogios pelo seu trabalho no último projeto. Continue assim!", urlImagem: " "),
//    MessgeModel(idUsuarioDestinario: "", idUsuarioAtual: " ", mensagem: "Fico feliz em ouvir isso. Alguma meta específica para o próximo trimestre?", urlImagem: " "),
//    MessgeModel(idUsuarioDestinario: "", idUsuarioAtual: " ", mensagem: "Quero que você lidere mais projetos. Pode contar comigo para apoio.", urlImagem: " "),
//    MessgeModel(idUsuarioDestinario: "", idUsuarioAtual: " ", mensagem: "Entendido. Vamos manter a comunicação aberta. Alguma outra coisa?", urlImagem: " "),
// ];

// List<HistoryModels> listHistoryModels = [

//   HistoryModels(title: "Histórico 1", data: "10/01/2024"),
//   HistoryModels(title: "Histórico 2", data: "12/01/2024"),
//   HistoryModels(title: "Histórico 3", data: "22/08/2024"),
//   HistoryModels(title: "Histórico 4", data: "23/09/2024"),
//   HistoryModels(title: "Histórico 5", data: "10/10/2024"),
//   HistoryModels(title: "Histórico 6", data: "18/12/2024"),
//   HistoryModels(title: "Histórico 7", data: "17/11/2024"),
//   HistoryModels(title: "Histórico 8", data: "13/12/2024"),
//   HistoryModels(title: "Histórico 9", data: "10/11/2024"),
  
// ];