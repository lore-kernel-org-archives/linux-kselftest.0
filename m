From: brendanhiggins@google.com (Brendan Higgins)
Date: Fri, 8 Feb 2019 16:56:34 -0800
Subject: [RFC v3 14/19] Documentation: kunit: add documentation for KUnit
In-Reply-To: <0927c42a-8e65-f410-e6ed-27576572577f@ideasonboard.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-15-brendanhiggins@google.com>
 <b4c72234-8c56-6efa-8003-f89d99a9779e@ideasonboard.com>
 <20181130034525.GP18410@garbanzo.do-not-panic.com>
 <CAFd5g47Cew6pmebsopjzmkd4RpnnC3zLAUfxCybjdhrO35OBpQ@mail.gmail.com>
 <0927c42a-8e65-f410-e6ed-27576572577f@ideasonboard.com>
Message-ID:
 <CAFd5g44fKzriEs_pGyANxe7GuC9Ji2SD7EEz76__h8q9jjg8yA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190209005634.Eldo9rRR56TVpqEmFZnHbgTy1jcOEBFc8CZgpGl3GRM@z>

On Thu, Dec 6, 2018 at 4:16 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi Brendan,
>
> On 03/12/2018 23:53, Brendan Higgins wrote:
> > On Thu, Nov 29, 2018@7:45 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >>
> >> On Thu, Nov 29, 2018@01:56:37PM +0000, Kieran Bingham wrote:
> >>> Hi Brendan,
> >>>
> >>> Please excuse the top posting, but I'm replying here as I'm following
> >>> the section "Creating a kunitconfig" in Documentation/kunit/start.rst.
> >>>
> >>> Could the three line kunitconfig file live under say
> >>>        arch/um/configs/kunit_defconfig?
>
>
> Further consideration to this topic - I mentioned putting it in
>   arch/um/configs
>
> - but I think this is wrong.
>
> We now have a location for config-fragments, which is essentially what
> this is, under kernel/configs
>
> So perhaps an addition as :
>
>  kernel/configs/kunit.config
>
> Would be more appropriate - and less (UM) architecture specific.

Sorry for the long radio silence.

I just got around to doing this and I found that there are some
configs that are desirable to have when running KUnit under x86 in a
VM, but not UML. So should we have one that goes in with
config-fragments and others that go into architectures? Another idea,
it would be nice to have a KUnit config that runs all known tests
(this probably won't work in practice once we start testing mutually
exclusive things or things with lots of ifdeffery, but it probably
something we should try to maintain as best as we can?); this probably
shouldn't go in with the fragments, right?

I will be sending another revision out soon, but I figured I might be
able to catch you before I did so.
