From: brendanhiggins at google.com (Brendan Higgins)
Date: Mon, 3 Dec 2018 15:53:55 -0800
Subject: [RFC v3 14/19] Documentation: kunit: add documentation for KUnit
In-Reply-To: <20181130034525.GP18410@garbanzo.do-not-panic.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-15-brendanhiggins@google.com>
 <b4c72234-8c56-6efa-8003-f89d99a9779e@ideasonboard.com>
 <20181130034525.GP18410@garbanzo.do-not-panic.com>
Message-ID: <CAFd5g47Cew6pmebsopjzmkd4RpnnC3zLAUfxCybjdhrO35OBpQ@mail.gmail.com>

On Thu, Nov 29, 2018 at 7:45 PM Luis Chamberlain <mcgrof at kernel.org> wrote:
>
> On Thu, Nov 29, 2018 at 01:56:37PM +0000, Kieran Bingham wrote:
> > Hi Brendan,
> >
> > Please excuse the top posting, but I'm replying here as I'm following
> > the section "Creating a kunitconfig" in Documentation/kunit/start.rst.
> >
> > Could the three line kunitconfig file live under say
> >        arch/um/configs/kunit_defconfig?
> >
> > So that it's always provided? And could even be extended with tests
> > which people would expect to be run by default? (say in distributions)
>
> Indeed, and then a top level 'make kunitconfig' could use it as well.

Yep, I totally agree.
