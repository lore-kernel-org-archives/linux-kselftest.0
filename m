From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 13 Nov 2018 02:10:34 -0800
Subject: [RFC v2 00/14] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <04f677b1-bc44-f004-cf2a-51b47baf0965@gmail.com>
References: <20181023235750.103146-1-brendanhiggins@google.com>
 <f3682d48-6f27-5eef-8274-02f90dd65188@kernel.org>
 <CAFd5g45Tgcx4RisrCF8QHneR7ELezPfpEPKh_mH8KEUi3skE7g@mail.gmail.com>
 <04f677b1-bc44-f004-cf2a-51b47baf0965@gmail.com>
Message-ID:
 <CAFd5g46bzF-+1VzAFYb5cF=e45O2rjagX+NY4UFKgU7cyujc7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181113101034.xBGwjUNhPRFK-XPK-6E1yK-4k-eFePrP3kBToJhLW94@z>

On Wed, Nov 7, 2018@9:46 AM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 11/6/18 5:17 PM, Brendan Higgins wrote:
> > On Fri, Nov 2, 2018@11:23 AM Shuah Khan <shuah@kernel.org> wrote:
> >>
> >> Hi Brendan,
> > <snip>
> >> Framework looks good. I think it would be helpful to include a real test
> >
> > Great to hear!
> >
> >> in the patch series to get a feel for how effective it is.
> >
> > Alright, will do. Rob suggested converting
> > https://elixir.bootlin.com/linux/v4.19/source/drivers/of/unittest.c to
> > KUnit, so that might offer a good comparison.
>
> drivers/of/unittest.c might be a bit bigger and more complex test than
> you want to start with.

I already got it working under KUnit. Admittedly, structurally it is
not so different, so it will require some work to make it pretty.

I think now it is a question of whether you want me to start here or not.

Probably best just to share what I have now along with Shuah's
requested changes and we can go from there.

Let me know what you think.

Cheers
