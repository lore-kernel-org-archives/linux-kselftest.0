From: mcgrof@kernel.org (Luis Chamberlain)
Date: Fri, 30 Nov 2018 10:22:03 -0800
Subject: [RFC v3 06/19] arch: um: enable running kunit from User Mode Linux
In-Reply-To: <CAL_Jsq+jxHHmT5bLnABnF7S0fSBZvH72nDPyY5LHTn9Zm9hCUw@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-7-brendanhiggins@google.com>
 <CAL_JsqJLNSg-38hej8LV+Oh-YXBM2hRGomie3b_psa9LvzoRYg@mail.gmail.com>
 <20181130033704.GL18410@garbanzo.do-not-panic.com>
 <CAL_Jsq+jxHHmT5bLnABnF7S0fSBZvH72nDPyY5LHTn9Zm9hCUw@mail.gmail.com>
Message-ID: <20181130182203.GS18410@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181130182203.CxbgMcYbfhd4eGKMEdC1HoS1MKP4ZOLR2njvxgMPkOA@z>

On Fri, Nov 30, 2018@08:05:34AM -0600, Rob Herring wrote:
> On Thu, Nov 29, 2018@9:37 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Nov 28, 2018@03:26:03PM -0600, Rob Herring wrote:
> > > On Wed, Nov 28, 2018 at 1:37 PM Brendan Higgins
> > > <brendanhiggins@google.com> wrote:
> > > >
> > > > Make minimum number of changes outside of the KUnit directories for
> > > > KUnit to build and run using UML.
> > >
> > > There's nothing in this patch limiting this to UML.
> >
> > Not that one, but the abort thing segv thing is, eventually.
> > To support other architectures we'd need to make a wrapper to that
> > hack which Brendan added, and then allow each os to implement
> > its own call, and add an asm-generic helper.
> 
> I've not looked into why this is needed, but can't you make the abort
> support optional and arches can select it when they support it.

Its why I have asked for it to be properly documented. The patches in no
way illustrate *why* such thing is done. And if we are going to
potentially have other archs do something similar best to make it
explicit.

> At
> least before, the DT unittests didn't need this to run and shouldn't
> depend on it after converting to kunit.

  Luis
