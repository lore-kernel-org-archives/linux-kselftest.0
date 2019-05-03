From: ldir@darbyshire-bryant.me.uk (Kevin 'ldir' Darbyshire-Bryant)
Date: Fri, 3 May 2019 21:20:03 +0000
Subject: [PATCH net-next] net: sched: Introduce act_ctinfo action
In-Reply-To: <CAM_iQpXnXyfLZ2+gjDufbdMrZLgtf9uKbzbUf50Xm-2Go7maVw@mail.gmail.com>
References: <20190427130739.44614-1-ldir@darbyshire-bryant.me.uk>
 <CAM_iQpXnXyfLZ2+gjDufbdMrZLgtf9uKbzbUf50Xm-2Go7maVw@mail.gmail.com>
Message-ID: <9FB6B9CF-1767-4598-8859-C5D8A47DEC85@darbyshire-bryant.me.uk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503212003.GaYvhZ6MXppUp6CGuEkE-meNDA7F5uaHmJK3xrGgXHw@z>



> On 30 Apr 2019,@22:47, Cong Wang <xiyou.wangcong@gmail.com> wrote:
> 
> On Sat, Apr 27, 2019 at 6:08 AM Kevin 'ldir' Darbyshire-Bryant
> <ldir@darbyshire-bryant.me.uk> wrote:
>> 
>> ctinfo is a new tc filter action module.  It is designed to restore DSCPs
>> stored in conntrack marks into the ipv4/v6 diffserv field.
> 
> I think we can retrieve any information from conntrack with such
> a general name, including skb mark. So, as you already pick the
> name ctinfo, please make it general rather than just DSCP.
> You can add skb mark into your ctinfo too so that act_connmark
> can be just replaced.

Hi Cong,

Thanks for the review, I have a v2 in progress addressing that along
with another silly that got through.  I’m also re-working the stats
reporting to return act_ctinfo stats instead of usurping the dropped,
overlimits & dropped figures.

> 
> Your patch looks fine from a quick galance, please make sure
> you run checkpatch.pl to keep your coding style aligned to Linux
> kernel's, at least I don't think we accept C++ style comments.

This time I’ll remember to run checkpatch before I submit instead of
after :-)

> 
> Thanks.


Cheers,

Kevin D-B

gpg: 012C ACB2 28C6 C53E 9775  9123 B3A2 389B 9DE2 334A
