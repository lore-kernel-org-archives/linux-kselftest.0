From: fklassen@appneta.com (Fred Klassen)
Date: Thu, 30 May 2019 09:11:11 -0700
Subject: [PATCH net-next v3 1/1] net/udp_gso: Allow TX timestamp with UDP
 GSO
In-Reply-To: <CAF=yD-JvNFdWCBJ6w1_XWSHu1CDiG_QimrUT8ZCxw=U+OVvBMA@mail.gmail.com>
References: <20190528184415.16020-1-fklassen@appneta.com>
 <20190528184415.16020-2-fklassen@appneta.com>
 <CAF=yD-JvNFdWCBJ6w1_XWSHu1CDiG_QimrUT8ZCxw=U+OVvBMA@mail.gmail.com>
Message-ID: <8A1636C9-7476-43B2-BAE0-B03675B3920E@appneta.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190530161111.PWtIC7fGsGkMZvz0J8WTh5qUa-imzsPHb-tH1P_F1n0@z>



> On May 28, 2019,@2:44 PM, Willem de Bruijn <willemdebruijn.kernel@gmail.com> wrote:
>> It also appears that other TX CMSG types cause similar issues, for
>> example trying to set SOL_IP/IP_TOS.
> 
> See previous comment in v2
> 
> http://patchwork.ozlabs.org/patch/1105564/
> 

Sorry, missed those updates. I am still relying too much on my emails.
Will fix for next version, and will scrub through messages on patchwork.

> FYI, no need for a cover letter for a single patch. Also, I think the
> cc list can be more concise. Mainly netdev.

Fixed.

> Same as above. This is not about zerocopy.
> 

Will fix next patchset.


> Asked elsewhere, but best answered here: given that xmit_more delays
> delivery to the NIC until the last segment in a train, is the first
> segment in your opinion still the best to attach the timestamp request
> to?
> 
> To reiterate, we do not want to need a follow-up patch to disable
> xmit_more when timestamps are requested.
> 

I think it would be worthwhile. I was playing with this patch …

+               /* software TX timeststamps are sent immediately */
+               if (tsflags & SKBTX_SW_TSTAMP)
+                       seg->xmit_more = 0;

… which attempts to address this issue. I believe that the patch
should be applied for software timestamps only. However when
I applied in net-next I got the following compile error, which suggests
there is more investigation needed, and therefore requires a separate
patch.

net/ipv4/udp_offload.c: In function ‘__udp_gso_segment’:
net/ipv4/udp_offload.c:251:7: error: ‘struct sk_buff’ has no member named ‘xmit_more’
    seg->xmit_more = 0;
