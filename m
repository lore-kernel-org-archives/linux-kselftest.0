From: fklassen at appneta.com (Fred Klassen)
Date: Sat, 25 May 2019 13:09:33 -0700
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <CAF=yD-+4g-HjmCnDWaVfdsyruePXqYeUDJgnffz9ro+rgNGv1g@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
 <CAF=yD-+4g-HjmCnDWaVfdsyruePXqYeUDJgnffz9ro+rgNGv1g@mail.gmail.com>
Message-ID: <D37889F4-104C-4E9A-B5CB-A0FCCEFF2D93@appneta.com>



> On May 23, 2019, at 2:59 PM, Willem de Bruijn <willemdebruijn.kernel at gmail.com> wrote:
> what exactly is the issue with IP_TOS?
> 
> If I understand correctly, the issue here is that the new 'P' option
> that polls on the error queue times out. This is unrelated to
> specifying TOS bits? Without zerocopy or timestamps, no message is
> expected on the error queue.

I was not able to get to the root cause, but I noticed that IP_TOS
CMSG was lost until I applied this fix. I also found it confusing as to
why that may be the case.
