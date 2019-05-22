From: jeffrin@rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Wed, 22 May 2019 19:59:53 +0530
Subject: [PATCH v2] selftests: netfilter: missing error check when setting
 up veth interface
In-Reply-To: <20190521181125.anqj32v3gcwjxs3z@salvia>
References: <20190515064405.3981-1-jeffrin@rajagiritech.edu.in>
 <20190521181125.anqj32v3gcwjxs3z@salvia>
Message-ID:
 <CAG=yYwkAUzGZWdVpcjRScARyOyO9KaTCL_7LUxaav5os+6rsEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190522142953.wOqgug_osze6EAYDmDpp3pLcses8eVDUvOdPjTI2ZfU@z>

Thanks to all !

On Tue, May 21, 2019@11:41 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Wed, May 15, 2019@12:14:04PM +0530, Jeffrin Jose T wrote:
> > A test for  the basic NAT functionality uses ip command which
> > needs veth device.There is a condition where the kernel support
> > for veth is not compiled into the kernel and the test script
> > breaks.This patch contains code for reasonable error display
> > and correct code exit.
>
> Applied, thanks.



-- 
software engineer
rajagiri school of engineering and technology
