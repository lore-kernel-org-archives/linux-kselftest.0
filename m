From: dima@arista.com (Dmitry Safonov)
Date: Fri, 27 Jul 2018 15:51:51 +0100
Subject: [PATCH 00/18] xfrm: Add compat layer
In-Reply-To: <20180727141936.uze6ohordx7ue3no@breakpoint.cc>
References: <20180726023144.31066-1-dima@arista.com>
 <20180726084959.pzjvflfjq6a76du6@breakpoint.cc>
 <20180727073747.h27dtojlnmc3k25v@gauss3.secunet.de>
 <1532700173.2679.18.camel@arista.com>
 <20180727141936.uze6ohordx7ue3no@breakpoint.cc>
Message-ID: <1532703111.2679.20.camel@arista.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727145151.8ShfW8etkK0BZRLxAleYrOHgNqQcHyx4wDYkJFCbUTQ@z>

On Fri, 2018-07-27@16:19 +0200, Florian Westphal wrote:
> Dmitry Safonov <dima@arista.com> wrote:
> > 1. It will double copy netlink messages, making it O(n) instead of
> > O(1), where n - is number of bind()s.. Probably we don't care much.
> 
> About those bind() patches, I don't understand why they are needed.
> 
> Why can't you just add the compat skb to the native skb when doing
> the multicast call?
> 
> skb_shinfo(skb)->frag_list = compat_skb;
> xfrm_nlmsg_multicast(net, skb, 0, ...

Oh yeah, sorry, I think I misread the patch - will try to add compat
skb in the multicast call.

-- 
Thanks,
             Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
