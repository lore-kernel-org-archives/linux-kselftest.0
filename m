From: toke at redhat.com (Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?=)
Date: Sun, 05 May 2019 12:43:20 +0200
Subject: [net-next v2] net: sched: Introduce act_ctinfo action
In-Reply-To: <B6426224-12CC-417B-9A38-6DDBE574A85C@darbyshire-bryant.me.uk>
References: <CAM_iQpXnXyfLZ2+gjDufbdMrZLgtf9uKbzbUf50Xm-2Go7maVw@mail.gmail.com>
 <20190505101523.48425-1-ldir@darbyshire-bryant.me.uk>
 <20190505102314.GA12761@kroah.com>
 <B6426224-12CC-417B-9A38-6DDBE574A85C@darbyshire-bryant.me.uk>
Message-ID: <8736lt9o6v.fsf@toke.dk>

Kevin 'ldir' Darbyshire-Bryant <ldir at darbyshire-bryant.me.uk> writes:

>> On 5 May 2019, at 11:23, Greg KH <greg at kroah.com> wrote:
>> 
>> On Sun, May 05, 2019 at 10:15:43AM +0000, Kevin 'ldir' Darbyshire-Bryant wrote:
>>> --- /dev/null
>>> +++ b/net/sched/act_ctinfo.c
>>> @@ -0,0 +1,407 @@
>>> +// SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
>> 
>
> Hey Greg, thanks for the review.
>
>> How can a .c file, buried in the kernel tree, have a Linux-syscall-note
>> exception to it?
>
> Because I’m a moron and nobody else spotted it.
>> 
>> Are you _sure_ that is ok?  That license should only be for files in the
>> uapi header directory.
>
> Expect a v3 shortly.  I shall wear your chastisement with honour :-)

While you're at it, you don't actually need the GPL text blob when using
the SPDX headers... :)

-Toke
