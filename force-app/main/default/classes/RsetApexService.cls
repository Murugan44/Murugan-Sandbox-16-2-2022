@RestResource(urlMapping='/murugan/*')
global with sharing class RsetApexService {
    global final static String Welcome_Message = 'Hey Im Rest Apex Service';

    @httpGet
    global static String getMsg() {
        return Welcome_Message;
    }

    @HttpPost
    global static String postMsg() {
        return Welcome_Message;
    }

    @HttpPatch
    global static String patchMsg() {
        return Welcome_Message+'Patch is Updated';
    }
}