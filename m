From: mcgrof@kernel.org (Luis Chamberlain)
Date: Tue, 4 Dec 2018 12:48:10 -0800
Subject: [RFC v3 11/19] kunit: add Python libraries for handing KUnit
 config and kernel
In-Reply-To: <CAFd5g44L1dV61CPm9GUvOgs-tH_urN-Twm-fj=Pw6h-kgfZ5rQ@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-12-brendanhiggins@google.com>
 <20181130034425.GO18410@garbanzo.do-not-panic.com>
 <CAFd5g44L1dV61CPm9GUvOgs-tH_urN-Twm-fj=Pw6h-kgfZ5rQ@mail.gmail.com>
Message-ID: <20181204204810.GU28501@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181204204810.0mMLPZwn50DbFP8i__T60wR4Fit2kygbfukM9w7dJbA@z>

On Mon, Dec 03, 2018@03:50:48PM -0800, Brendan Higgins wrote:
> On Thu, Nov 29, 2018@7:44 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Nov 28, 2018@11:36:28AM -0800, Brendan Higgins wrote:
> > > The ultimate goal is to create minimal isolated test binaries; in the
> > > meantime we are using UML to provide the infrastructure to run tests, so
> > > define an abstract way to configure and run tests that allow us to
> > > change the context in which tests are built without affecting the user.
> > > This also makes pretty and dynamic error reporting, and a lot of other
> > > nice features easier.
> > >
> > > kunit_config.py:
> > >   - parse .config and Kconfig files.
> > >
> > >
> > > kunit_kernel.py: provides helper functions to:
> > >   - configure the kernel using kunitconfig.
> >
> > We get the tools to run the config stuff, build, etc, but not a top
> > level 'make kunitconfig' or whatever. We have things like 'make
> > kvmconfig' and 'make xenconfig', I think it would be reasonable to
> > add similar for this.
> 
> Are you just asking for a defconfig for KUnit, or are you asking for a
> way to run KUnit from make?

At least the first. The later seems intrusive as a top level Makefile
thing.

  Luis
