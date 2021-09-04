public with sharing class ContactControllerClass {
    public ContactControllerClass() {

    }
    @AuraEnabled
    Public static List<Contact> getContacts()
    {
        List<Contact> contacts = [select Id, Name, Email from Contact];
        
        return (contacts);
    }

    @AuraEnabled(Cacheable=true)
    public static List<Contact> searchContacts(String namePattern) {
        
        String likeParam = '%' +namePattern+'%';
        String Query = '';
       
        if(namePattern != null){
           Query  = 'select id, name, email from Contact where Name like :searchString LIMIT 50 ';
        }else{
           Query  = 'select id, name, email from Contact LIMIT 50 '; 
        }

        List<Contact> contactList = Database.query(Query);
        return contactList;
    }



    
    
}