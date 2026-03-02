//%attributes = {}
var $en; $fr : 4D:C1709.Vector
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8082/v1"  // CTranslate2

$en:=$AIClient.embeddings.create("How do I reset my password?").embedding.embedding
$fr:=$AIClient.embeddings.create("Comment réinitialiser mon mot de passe?").embedding.embedding

$cosineSimilarity:=$en.cosineSimilarity($fr)
//0.9631007786682

ALERT:C41([$cosineSimilarity].join())

/*

this model is quite slow on cpu...

*/