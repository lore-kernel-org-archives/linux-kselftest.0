From: brendanhiggins at google.com (Brendan Higgins)
Date: Wed, 17 Oct 2018 10:43:17 -0700
Subject: [RFC v1 06/31] arch: um: enabled running kunit from User Mode
 Linux
In-Reply-To: <f0d64a0a-7914-f390-c0b5-dc7626b45476@ideasonboard.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-7-brendanhiggins@google.com>
 <f0d64a0a-7914-f390-c0b5-dc7626b45476@ideasonboard.com>
Message-ID: <CAFd5g46WZ9A0bDf3G2jkuc=w-hkyk8cMdF=HWzdO8nxNuvjpWA@mail.gmail.com>

On Wed, Oct 17, 2018 at 8:29 AM Kieran Bingham
<kieran.bingham at ideasonboard.com> wrote:
>
> Hi Brendan,
>
> I very excitedly jumped on these patches to try them out, as this is
> essentially something I was trying to do a few weeks back.
>
> On 17/10/18 00:50, Brendan Higgins wrote:
> > Makes minimum number of changes outside of the KUnit directories for
> > KUnit to build and run using UML.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> > ---
> >  Makefile             | 2 +-
> >  arch/um/Kconfig.rest | 3 +++
>
> But this file isn't present on v4.19-rc8
>
> It looks like the file is removed at f163977d21a2 ("um: cleanup Kconfig
> files")

Whoops.

>
> What version have you currently based these patches on?

This patch set is based on 4.18, but I have versions for 4.4, 4.9,
4.14, 4.16, and 4.17.

I will rebase this patch set to 4.19-rc8 and send it out shortly.

> Do you expect to keep a branch somewhere that's easy to pull in?

I have one here: https://kunit-review.googlesource.com/c/linux/+/1030
(you can check it out with git fetch
https://kunit.googlesource.com/linux refs/changes/30/1030/4 && git
checkout FETCH_HEAD)

>
> Please add me to the CC list as an interested party on later versions :-)

Will do.
