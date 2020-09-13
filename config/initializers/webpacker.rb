Webpacker::Compiler.env["APIKEY"] =  Rails.application.credentials.api_key
Webpacker::Compiler.env["AUTHDOMAIN"] =  Rails.application.credentials.auth_domain
Webpacker::Compiler.env["DATABASEURL"] =  Rails.application.credentials.database_url
Webpacker::Compiler.env["PROJECTID"] =  Rails.application.credentials.project_id
Webpacker::Compiler.env["STORAGEBUCKET"] =  Rails.application.credentials.storage_bucket
Webpacker::Compiler.env["MESSAGINGSENDERID"] =  Rails.application.credentials.messaging_sender_id
Webpacker::Compiler.env["APPID"] =  Rails.application.credentials.app_id
