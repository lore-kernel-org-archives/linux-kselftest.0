From: fw@strlen.de (Florian Westphal)
Date: Thu, 26 Jul 2018 10:49:59 +0200
Subject: [PATCH 00/18] xfrm: Add compat layer
In-Reply-To: <20180726023144.31066-1-dima@arista.com>
References: <20180726023144.31066-1-dima@arista.com>
Message-ID: <20180726084959.pzjvflfjq6a76du6@breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180726084959.J7vjb3zTYkF3evUhk0AwMdbdEXF8-evPYGyvmMn8T0s@z>

Dmitry Safonov <dima@arista.com> wrote:
> So, here I add a compatible layer to xfrm.
> As xfrm uses netlink notifications, kernel should send them in ABI
> format that an application will parse. The proposed solution is
> to save the ABI of bind() syscall. The realization detail is
> to create kernel-hidden, non visible to userspace netlink groups
> for compat applications.

Why not use exisiting netlink support?
Just add the 32bit skb to skb64->frag_list and let
netlink find if tasks needs 64 or 32 one.

It only needs this small fix to properly signal the end of a dump:
https://marc.info/?l=linux-netdev&m=126625240303351&w=2

I had started a second attempt to make xfrm compat work,
but its still in early stage.

One link that might still have some value:
https://git.breakpoint.cc/cgit/fw/net-next.git/commit/?h=xfrm_config_compat_07&id=f64430e6d9e297f3990f485a4832e273751b9869
(compat structure definitions with BUILD_BUG_ON checking)

My plan was to make xfrm compat work strictly as shrinker (64->32)
and expander (32->64), i.e. no/little changes to exisiting code and
pass all "expanded" skbs through existing xfrm rcv functions.

Example to illustrate idea:
https://git.breakpoint.cc/cgit/fw/net-next.git/commit/?h=xfrm_config_compat_07&id=c622f067849b02170127b69471cb3481e4bc9e49

... its supposed to take 64bit skb and create a 32bit one from it.

Just for reference; I currently don't plan to work on this again.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
