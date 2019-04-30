From: xiyou.wangcong@gmail.com (Cong Wang)
Date: Tue, 30 Apr 2019 14:47:32 -0700
Subject: [PATCH net-next] net: sched: Introduce act_ctinfo action
In-Reply-To: <20190427130739.44614-1-ldir@darbyshire-bryant.me.uk>
References: <20190427130739.44614-1-ldir@darbyshire-bryant.me.uk>
Message-ID:
 <CAM_iQpXnXyfLZ2+gjDufbdMrZLgtf9uKbzbUf50Xm-2Go7maVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430214732.4yDXyeyBa1TDaJvFIyE30kL_kuxZUuz7zLpLJtYoNnw@z>

On Sat, Apr 27, 2019 at 6:08 AM Kevin 'ldir' Darbyshire-Bryant
<ldir@darbyshire-bryant.me.uk> wrote:
>
> ctinfo is a new tc filter action module.  It is designed to restore DSCPs
> stored in conntrack marks into the ipv4/v6 diffserv field.

I think we can retrieve any information from conntrack with such
a general name, including skb mark. So, as you already pick the
name ctinfo, please make it general rather than just DSCP.
You can add skb mark into your ctinfo too so that act_connmark
can be just replaced.

Your patch looks fine from a quick galance, please make sure
you run checkpatch.pl to keep your coding style aligned to Linux
kernel's, at least I don't think we accept C++ style comments.

Thanks.
