From: fklassen@appneta.com (Fred Klassen)
Date: Sat, 25 May 2019 13:46:07 -0700
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
 <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
Message-ID: <7FB4B2F6-A7F3-4565-8D53-CF0E5A3EEFA4@appneta.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190525204607.3JYvri7wdlgO5HV9z3PyWdb_25F1TwOyxgDO8boRL84@z>



> On May 23, 2019,@2:39 PM, Willem de Bruijn <willemdebruijn.kernel@gmail.com> wrote:
> Zerocopy notification reference count is managed in skb_segment. That
> should work.
> 

I’m trying to understand the context of reference counting in skb_segment. I assume that
there is an opportunity to optimize the count of outstanding zerocopy buffers, but I 
can’t see it. Please clarify.
