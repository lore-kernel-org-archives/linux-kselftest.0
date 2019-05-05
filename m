From: ldir@darbyshire-bryant.me.uk (Kevin 'ldir' Darbyshire-Bryant)
Date: Sun, 5 May 2019 10:32:15 +0000
Subject: [net-next v2] net: sched: Introduce act_ctinfo action
In-Reply-To: <20190505102314.GA12761@kroah.com>
References: <CAM_iQpXnXyfLZ2+gjDufbdMrZLgtf9uKbzbUf50Xm-2Go7maVw@mail.gmail.com>
 <20190505101523.48425-1-ldir@darbyshire-bryant.me.uk>
 <20190505102314.GA12761@kroah.com>
Message-ID: <B6426224-12CC-417B-9A38-6DDBE574A85C@darbyshire-bryant.me.uk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190505103215.lBSPI6FsK74OREdx_PUan5G9XbmMgQx_i5rUPv_OFhc@z>



> On 5 May 2019,@11:23, Greg KH <greg@kroah.com> wrote:
> 
> On Sun, May 05, 2019@10:15:43AM +0000, Kevin 'ldir' Darbyshire-Bryant wrote:
>> --- /dev/null
>> +++ b/net/sched/act_ctinfo.c
>> @@ -0,0 +1,407 @@
>> +// SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
> 

Hey Greg, thanks for the review.

> How can a .c file, buried in the kernel tree, have a Linux-syscall-note
> exception to it?

Because I’m a moron and nobody else spotted it.
> 
> Are you _sure_ that is ok?  That license should only be for files in the
> uapi header directory.

Expect a v3 shortly.  I shall wear your chastisement with honour :-)


Cheers,

Kevin D-B

gpg: 012C ACB2 28C6 C53E 9775  9123 B3A2 389B 9DE2 334A
