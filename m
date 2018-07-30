From: fw@strlen.de (Florian Westphal)
Date: Mon, 30 Jul 2018 21:43:14 +0200
Subject: [PATCH 00/18] xfrm: Add compat layer
In-Reply-To: <1532972360.2679.32.camel@arista.com>
References: <1532703111.2679.20.camel@arista.com>
 <CADhJOfam+cY8uD4XTGvZSEFQdAgTu49G6cg6c64NJoP3bNuBmw@mail.gmail.com>
 <1532795215.2679.27.camel@arista.com>
 <20180728.141812.1026007723536955024.davem@davemloft.net>
 <1532972360.2679.32.camel@arista.com>
Message-ID: <20180730194314.ixzvniuvdfofvvpj@breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180730194314.D5vaCTvHI_r8YJN9qSpFLPrxSPykhfwsNJELNGGN0nA@z>

Dmitry Safonov <dima@arista.com> wrote:
> On Sat, 2018-07-28@14:18 -0700, David Miller wrote:
> > From: Dmitry Safonov <dima at arista.com>
> > Date: Sat, 28 Jul 2018 17:26:55 +0100
> > 
> > > Well, I think, I'll rework my patches set according to critics and
> > > separate compat xfrm layer. I've already a selftest to check that
> > 32/64
> > > bit xfrm works - so the most time-taking part is done.
> > 
> > The way you've done the compat structures using __packed is only
> > going
> > to work on x86, just FYI.
> 
> Thanks for pointing, so I'll probably cover it under something like
> HAS_COMPAT_XFRM.
> (if there isn't any better idea).

You can do that, I suspect you can use
CONFIG_COMPAT_FOR_U64_ALIGNMENT
as AFAICR the only reason for the compat problem is different alignment
requirements of 64bit integer types in the structs, not e.g. due to
"long" size differences.

Instead of __packed, you can use the "compat" data types, e.g.
compat_u64 instead of u64:

struct compat_xfrm_lifetime_cur {
	compat_u64 bytes, packets, add_time, use_time;
}; /* same size on i386, but only 4 byte alignment required even on x86_64*/

You might be able to reuse
https://git.breakpoint.cc/cgit/fw/net-next.git/commit/?h=xfrm_config_compat_07&id=f64430e6d9e297f3990f485a4832e273751b9869

in your patch set.

I can try to submit the first few patches (which are not related to
compat, they just add const qualifiers) for inclusion later this week.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
