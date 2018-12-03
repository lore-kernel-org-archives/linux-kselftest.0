From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 3 Dec 2018 14:47:19 -0800
Subject: [RFC v3 01/19] kunit: test: add KUnit test runner core
In-Reply-To: <20181201031049.GL28501@garbanzo.do-not-panic.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-2-brendanhiggins@google.com>
 <20181130032802.GG18410@garbanzo.do-not-panic.com>
 <CAFd5g45F0RViYDQyXRwyxVPAU=CO_Goqy3yHz=BbcMeAT7o6-g@mail.gmail.com>
 <20181201031049.GL28501@garbanzo.do-not-panic.com>
Message-ID:
 <CAFd5g45DQ7V_pMpkNpRw3iRsCgO-MQvJV=hV7axP4gG++qm2JA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181203224719.arg4K88YTuBf5s8-_IBmCL7A5MBVnfzMuT683pW8Nf8@z>

On Fri, Nov 30, 2018@7:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Fri, Nov 30, 2018@06:08:36PM -0800, Brendan Higgins wrote:
> > On Thu, Nov 29, 2018@7:28 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > >
> > > > +static void kunit_run_case_internal(struct kunit *test,
> > > > +                                 struct kunit_module *module,
> > > > +                                 struct kunit_case *test_case)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     if (module->init) {
> > > > +             ret = module->init(test);
> > > > +             if (ret) {
> > > > +                     kunit_err(test, "failed to initialize: %d", ret);
> > > > +                     kunit_set_success(test, false);
> > > > +                     return;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     test_case->run_case(test);
> > > > +}
> > >
> > > <-- snip -->
> > >
> > > > +static bool kunit_run_case(struct kunit *test,
> > > > +                        struct kunit_module *module,
> > > > +                        struct kunit_case *test_case)
> > > > +{
> > > > +     kunit_set_success(test, true);
> > > > +
> > > > +     kunit_run_case_internal(test, module, test_case);
> > > > +     kunit_run_case_cleanup(test, module, test_case);
> > > > +
> > > > +     return kunit_get_success(test);
> > > > +}
> > >
> > > So we are running the module->init() for each test case... is that
> > > correct? Shouldn't the init run once? Also, typically init calls are
> >
> > Yep, it's correct. `module->init()` should run once before every test
> > case, reason being that the kunit_module serves as a test fixture in
> > which each test cases should be run completely independently of every
> > other.
>
> Shouldn't the init be test_case specific as well? Right now we just
> past the struct kunit, but not the struct kunit_case. I though that
> that the struct kunit_case was where we'd customize each specific
> test case as we see fit for each test case. If not, how would we
> do say, a different type of initialization for a different type of
> test (for the same unit)?

Maybe there should be other init functions, but specifying an init
function per case is not typical. In most unit testing frameworks
there is some sort of optional per test case init function that sets
up the fixture common to all cases; it is also fairly common to have
an init function that runs once at the very beginning of the entire
test suite (like what you thought I was doing); however, it is not
used nearly as often as the former, and even then is usually used in
conjunction with the former.

Nevertheless, I don't think I have ever seen a unit test framework
provide a way to make init functions specific to each case. I don't
see any good reason not to do it other than the lack of examples in
the wild suggest it would not get much usage.

In general, some limited initialization specific to a test case is
allowed in the test case itself, and if you have really complicated
initialization that warrants a separate init function, but isn't
shared between cases, you should probably put the test in a separate
test suite with a separate test fixture. I am sure there will be edge
cases that don't fit, but there is no technical reason why you cannot
just do the initialization in the test case itself in these cases.

>
> > init and exit is supposed to allow code common to all test
> > cases to run since it is so common to have dependencies needed for a
> > test to be common to every test case.
>
> Sure things in common make sense, however the differntiating aspects
> seem important as well on init? Or should the author be doing all
> custom specific initializations on run_case() instead?
>

Usually limited initialization specific to a test case will just go in
that test case.

Cheers
