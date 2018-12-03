From: mcgrof at kernel.org (Luis Chamberlain)
Date: Mon, 3 Dec 2018 15:43:55 -0800
Subject: [RFC v3 07/19] kunit: test: add initial tests
In-Reply-To: <CAFd5g47CJnfE3Gqc03onidd5FiZSW43-6_dA5czb30-Rb3dyfg@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-8-brendanhiggins@google.com>
 <20181130034001.GM18410@garbanzo.do-not-panic.com>
 <CAFd5g47CJnfE3Gqc03onidd5FiZSW43-6_dA5czb30-Rb3dyfg@mail.gmail.com>
Message-ID: <20181203234355.GQ28501@garbanzo.do-not-panic.com>

On Mon, Dec 03, 2018 at 03:26:26PM -0800, Brendan Higgins wrote:
> On Thu, Nov 29, 2018 at 7:40 PM Luis Chamberlain <mcgrof at kernel.org> wrote:
> >
> > On Wed, Nov 28, 2018 at 11:36:24AM -0800, Brendan Higgins wrote:
> > > Add a test for string stream along with a simpler example.
> > >
> > > Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> > > ---
> > >  kunit/Kconfig              | 12 ++++++
> > >  kunit/Makefile             |  4 ++
> > >  kunit/example-test.c       | 88 ++++++++++++++++++++++++++++++++++++++
> >
> > BTW if you need another more concrete but very simple example I think it
> > may be possible to port tools/testing/selftests/sysctl/sysctl.sh +
> > lib/test_sysctl.c into a kunit test. Correct me if I'm wrong.
> 
> I think that is pretty doable. I don't know that I want to shoot for
> that on the next revision. But I can definitely do it in a later
> revision, or a later patchset, unless you would strongly prefer it
> now, that is.

No rush on my end, just figured I'd mention a simple candidate in case
you needed another one to evaluate.

  Luis
