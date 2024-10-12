
/*Worker that fetches messages from the prolog users.
The worker is triggered once every 5 seconds to cope with the lack of
distribution of the system (since it's going trough loopback)*/

self.addEventListener("message",(e)=>{
    setInterval(()=>{
        if(e.data){
            let msgUname= '\'{ \"action\": \"fetch_messages\", \"item\":{\"server\":\"user\",\"uname\":\"'+e.data+'\" }}\''
            self.postMessage(msgUname)
        }
    },5000);
});
