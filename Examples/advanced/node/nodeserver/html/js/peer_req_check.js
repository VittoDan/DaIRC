

/*Worker that fetches peer requests from the prolog users.
The worker is triggered once every 5 seconds to cope with the lack of
distribution of the system (since it's going trough loopback)*/

self.addEventListener("message",(e)=>{
    setInterval(()=>{
        if(e.data){
            let fetchPeer= '\'{ \"action\": \"fetch_peer_req\", \"item\":{\"uname\":\"'+e.data+'\" }}\''
            self.postMessage(fetchPeer)
        }
    },5000);
});
