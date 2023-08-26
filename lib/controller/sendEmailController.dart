import 'dart:convert';

import 'package:http/http.dart' as http;

class SendEmailController{
  
  static Future<Null> sendEmailFunc(String user_email,String message )async{
    http.Response response=await http.post(Uri.parse("https://api.emailjs.com/api/v1.0/email/send"),
        headers: {
      'origin':'http://localhost',
        'Content-Type' : 'application/json'
        },
    body: json.encode({
      'service_id': 'service_k3i1xjv',
      'template_id': 'template_4ml2mj4',
      'user_id': 'jwsycbkMMhaaBoLrF',
      'template_params': {
        'user_subject': 'new Request',
        'user_name':'hesham',
        'message':message,
        'user_email': user_email
      }
    })) ;
    print("response.bodyresponse.body${response.body}");
    
  } 
  
}