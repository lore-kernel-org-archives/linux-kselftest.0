From: brendanhiggins@google.com (Brendan Higgins)
Date: Thu, 2 May 2019 11:07:57 -0700
Subject: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
In-Reply-To: <20190502110220.GD12416@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
Message-ID:
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502180757.8hhj0MPGShoQ4nhZvrPUOxUYCm5275nvVKkoYtHUheg@z>

On Thu, May 2, 2019@4:02 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 01, 2019@04:01:21PM -0700, Brendan Higgins wrote:
> > From: Felix Guo <felixguoxiuping at gmail.com>
> >
> > The ultimate goal is to create minimal isolated test binaries; in the
> > meantime we are using UML to provide the infrastructure to run tests, so
> > define an abstract way to configure and run tests that allow us to
> > change the context in which tests are built without affecting the user.
> > This also makes pretty and dynamic error reporting, and a lot of other
> > nice features easier.
> >
> > kunit_config.py:
> >   - parse .config and Kconfig files.
> >
> > kunit_kernel.py: provides helper functions to:
> >   - configure the kernel using kunitconfig.
> >   - build the kernel with the appropriate configuration.
> >   - provide function to invoke the kernel and stream the output back.
> >
> > Signed-off-by: Felix Guo <felixguoxiuping at gmail.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
>
> Ah, here's probably my answer to my previous logging format question,
> right?  What's the chance that these wrappers output stuff in a standard
> format that test-framework-tools can already parse?  :)

It should be pretty easy to do. I had some patches that pack up the
results into a serialized format for a presubmit service; it should be
pretty straightforward to take the same logic and just change the
output format.

Cheers
