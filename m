From: dima at arista.com (Dmitry Safonov)
Date: Mon, 30 Jul 2018 18:39:20 +0100
Subject: [PATCH 00/18] xfrm: Add compat layer
In-Reply-To: <20180728.141812.1026007723536955024.davem@davemloft.net>
References: <1532703111.2679.20.camel@arista.com>
 <CADhJOfam+cY8uD4XTGvZSEFQdAgTu49G6cg6c64NJoP3bNuBmw@mail.gmail.com>
 <1532795215.2679.27.camel@arista.com>
 <20180728.141812.1026007723536955024.davem@davemloft.net>
Message-ID: <1532972360.2679.32.camel@arista.com>

On Sat, 2018-07-28 at 14:18 -0700, David Miller wrote:
> From: Dmitry Safonov <dima at arista.com>
> Date: Sat, 28 Jul 2018 17:26:55 +0100
> 
> > Well, I think, I'll rework my patches set according to critics and
> > separate compat xfrm layer. I've already a selftest to check that
> 32/64
> > bit xfrm works - so the most time-taking part is done.
> 
> The way you've done the compat structures using __packed is only
> going
> to work on x86, just FYI.

Thanks for pointing, so I'll probably cover it under something like
HAS_COMPAT_XFRM.
(if there isn't any better idea).

> The "32-bit alignment for 64-bit objects" thing x86 has is very much
> not universal amongst ABIs having 32-bit and 64-bit variants.

-- 
Thanks,
             Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
