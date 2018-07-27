From: luto@amacapital.net (Andy Lutomirski)
Date: Fri, 27 Jul 2018 10:09:50 -0700
Subject: [PATCH 00/18] xfrm: Add compat layer
In-Reply-To: <CADhJOfam+cY8uD4XTGvZSEFQdAgTu49G6cg6c64NJoP3bNuBmw@mail.gmail.com>
References: <20180726023144.31066-1-dima@arista.com>
 <20180726084959.pzjvflfjq6a76du6@breakpoint.cc>
 <20180727073747.h27dtojlnmc3k25v@gauss3.secunet.de>
 <1532700173.2679.18.camel@arista.com>
 <20180727141936.uze6ohordx7ue3no@breakpoint.cc>
 <1532703111.2679.20.camel@arista.com>
 <CADhJOfam+cY8uD4XTGvZSEFQdAgTu49G6cg6c64NJoP3bNuBmw@mail.gmail.com>
Message-ID: <9907339A-4CBE-4F5C-88CB-A1C6DBCB4CED@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727170950.DIA_JSL8TyQPyO0hBRhmd4jFP-19hryv2MHVOxz1Tco@z>



> On Jul 27, 2018,@9:48 AM, Nathan Harold <nharold@google.com> wrote:
> 
> We (Android) are very interested in removing the restriction for 32-bit userspace processes accessing xfrm netlink on 64-bit kernels. IPsec support is required to pass Android conformance tests, and any manufacturer wishing to ship 32-bit userspace with a recent kernel needs out-of-tree changes (removing the compat_task check) to do so.
> 
> That said, it’s not difficult to work around alignment issues directly in userspace, so maybe we could just remove the check and make this the caller's responsibility? Here’s an example of the workaround currently in the Android tree:
> https://android.googlesource.com/platform/system/netd/+/refs/heads/master/server/XfrmController.h#257
> 
> We could also employ a (relatively simple) solution such as the one above in the uapi XFRM header itself, though it would require a caller to declare the target kernel ABI at compile time. Maybe that’s not unthinkable for an uncommon case?
> 

Could there just be an XFRM2 that is entirely identical to XFRM for 64-bit userspace but makes the 32-bit structures match?  If there are a grand total of two or so userspace implementations, that should cover most use cases. L

> -Nathan
> 
> 
>> On Fri, Jul 27, 2018@7:51 AM, Dmitry Safonov <dima@arista.com> wrote:
>> On Fri, 2018-07-27@16:19 +0200, Florian Westphal wrote:
>> > Dmitry Safonov <dima@arista.com> wrote:
>> > > 1. It will double copy netlink messages, making it O(n) instead of
>> > > O(1), where n - is number of bind()s.. Probably we don't care much.
>> > 
>> > About those bind() patches, I don't understand why they are needed.
>> > 
>> > Why can't you just add the compat skb to the native skb when doing
>> > the multicast call?
>> > 
>> > skb_shinfo(skb)->frag_list = compat_skb;
>> > xfrm_nlmsg_multicast(net, skb, 0, ...
>> 
>> Oh yeah, sorry, I think I misread the patch - will try to add compat
>> skb in the multicast call.
>> 
>> -- 
>> Thanks,
>>              Dmitry
> 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180727/62f1409d/attachment-0001.html>
