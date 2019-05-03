From: gregkh at linuxfoundation.org (Greg KH)
Date: Fri, 3 May 2019 08:41:49 +0200
Subject: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
In-Reply-To: <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
 <20190502110220.GD12416@kroah.com>
 <CAFd5g47t=EdLKFCT=CnPkrM2z0nDVo24Gz4j0VxFOJbARP37Lg@mail.gmail.com>
 <a49c5088-a821-210c-66de-f422536f5b01@gmail.com>
 <CAFd5g44iWRchQKdJYtjRtPY6e-6e0eXpKXXsx5Ooi6sWE474KA@mail.gmail.com>
Message-ID: <20190503064149.GB20723@kroah.com>

On Thu, May 02, 2019 at 04:45:29PM -0700, Brendan Higgins wrote:
> On Thu, May 2, 2019 at 2:16 PM Frank Rowand <frowand.list at gmail.com> wrote:
> >
> > On 5/2/19 11:07 AM, Brendan Higgins wrote:
> > > On Thu, May 2, 2019 at 4:02 AM Greg KH <gregkh at linuxfoundation.org> wrote:
> > >>
> > >> On Wed, May 01, 2019 at 04:01:21PM -0700, Brendan Higgins wrote:
> > >>> From: Felix Guo <felixguoxiuping at gmail.com>
> > >>>
> > >>> The ultimate goal is to create minimal isolated test binaries; in the
> > >>> meantime we are using UML to provide the infrastructure to run tests, so
> > >>> define an abstract way to configure and run tests that allow us to
> > >>> change the context in which tests are built without affecting the user.
> > >>> This also makes pretty and dynamic error reporting, and a lot of other
> > >>> nice features easier.
> > >>>
> > >>> kunit_config.py:
> > >>>   - parse .config and Kconfig files.
> > >>>
> > >>> kunit_kernel.py: provides helper functions to:
> > >>>   - configure the kernel using kunitconfig.
> > >>>   - build the kernel with the appropriate configuration.
> > >>>   - provide function to invoke the kernel and stream the output back.
> > >>>
> > >>> Signed-off-by: Felix Guo <felixguoxiuping at gmail.com>
> > >>> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> > >>
> > >> Ah, here's probably my answer to my previous logging format question,
> > >> right?  What's the chance that these wrappers output stuff in a standard
> > >> format that test-framework-tools can already parse?  :)
> 
> To be clear, the test-framework-tools format we are talking about is
> TAP13[1], correct?

Yes.

> My understanding is that is what kselftest is being converted to use.

Yes, and I think it's almost done.  The core of kselftest provides
functions that all tests can use to log messages in the correct format.

The core of kunit should also log the messages in this format as well,
and not rely on the helper scripts as Frank points out, not everyone
will use/want them.  Might as well make it easy for everyone to always
do the right thing and not force it to always be added in later.

thanks,

greg k-h
