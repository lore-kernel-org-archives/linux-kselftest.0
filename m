From: jeffrin@rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Sat, 13 Apr 2019 18:11:45 +0530
Subject: Fwd: [PATCH] selftests : netfilter: Wrote a error and exit code for a
 command which needed veth kernel module.
In-Reply-To: <CAG=yYwnN37OoL1DSN8qPeKWhzVJOcUFtR-7Q9fVT5AULk5S54w@mail.gmail.com>
References: <20190405163126.7278-1-jeffrin@rajagiritech.edu.in>
 <20190405164746.pfc6wxj4nrynjma4@breakpoint.cc>
 <CAG=yYwnN37OoL1DSN8qPeKWhzVJOcUFtR-7Q9fVT5AULk5S54w@mail.gmail.com>
Message-ID:
 <CAG=yYwkCRsKTmPJ-7utdN4fVf+Y_C1gDp7PWJbbNOw0b+QvhbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190413124145.Bjy0mDDPWnYBWj2B4WZvhq923V2d6OCpir6Mus2sudE@z>

---------- Forwarded message ---------
From: Jeffrin Thalakkottoor <jeffrin@rajagiritech.edu.in>
Date: Sat, Apr 13, 2019 at 6:09 PM
Subject: Re: [PATCH] selftests : netfilter: Wrote a error and exit
code for a command which needed veth kernel module.
To: Shuah Khan <shuah at kernel.org>
Cc: Florian Westphal <fw at strlen.de>, <linu-kselftest at vger.kernel.org>,
<pablo at netfilter.org>, lkml <linux-kernel at vger.kernel.org>


Hello Shuah,

did you get the mail related stuff below ?

On Fri, Apr 5, 2019@10:17 PM Florian Westphal <fw@strlen.de> wrote:
>
> Jeffrin Jose T <jeffrin@rajagiritech.edu.in> wrote:
> > A test for  the basic NAT functionality uses ip command which
> > needs veth device.There is a condition where the kernel support
> > for veth is not compiled into the kernel and the test script
> > breaks.This patch contains code for reasonable error display
> > and correct code exit.
>
> Looks good to me, thanks for following up on this.
>
> Acked-by: Florian Westphal <fw at strlen.de>



--
software engineer
rajagiri school of engineering and technology


-- 
software engineer
rajagiri school of engineering and technology
