From: mcgrof at kernel.org (Luis Chamberlain)
Date: Fri, 30 Nov 2018 19:10:49 -0800
Subject: [RFC v3 01/19] kunit: test: add KUnit test runner core
In-Reply-To: <CAFd5g45F0RViYDQyXRwyxVPAU=CO_Goqy3yHz=BbcMeAT7o6-g@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-2-brendanhiggins@google.com>
 <20181130032802.GG18410@garbanzo.do-not-panic.com>
 <CAFd5g45F0RViYDQyXRwyxVPAU=CO_Goqy3yHz=BbcMeAT7o6-g@mail.gmail.com>
Message-ID: <20181201031049.GL28501@garbanzo.do-not-panic.com>

On Fri, Nov 30, 2018 at 06:08:36PM -0800, Brendan Higgins wrote:
> On Thu, Nov 29, 2018 at 7:28 PM Luis Chamberlain <mcgrof at kernel.org> wrote:
> >
> > > +static void kunit_run_case_internal(struct kunit *test,
> > > +                                 struct kunit_module *module,
> > > +                                 struct kunit_case *test_case)
> > > +{
> > > +     int ret;
> > > +
> > > +     if (module->init) {
> > > +             ret = module->init(test);
> > > +             if (ret) {
> > > +                     kunit_err(test, "failed to initialize: %d", ret);
> > > +                     kunit_set_success(test, false);
> > > +                     return;
> > > +             }
> > > +     }
> > > +
> > > +     test_case->run_case(test);
> > > +}
> >
> > <-- snip -->
> >
> > > +static bool kunit_run_case(struct kunit *test,
> > > +                        struct kunit_module *module,
> > > +                        struct kunit_case *test_case)
> > > +{
> > > +     kunit_set_success(test, true);
> > > +
> > > +     kunit_run_case_internal(test, module, test_case);
> > > +     kunit_run_case_cleanup(test, module, test_case);
> > > +
> > > +     return kunit_get_success(test);
> > > +}
> >
> > So we are running the module->init() for each test case... is that
> > correct? Shouldn't the init run once? Also, typically init calls are
> 
> Yep, it's correct. `module->init()` should run once before every test
> case, reason being that the kunit_module serves as a test fixture in
> which each test cases should be run completely independently of every
> other.

Shouldn't the init be test_case specific as well? Right now we just
past the struct kunit, but not the struct kunit_case. I though that
that the struct kunit_case was where we'd customize each specific
test case as we see fit for each test case. If not, how would we
do say, a different type of initialization for a different type of
test (for the same unit)?

> init and exit is supposed to allow code common to all test
> cases to run since it is so common to have dependencies needed for a
> test to be common to every test case.

Sure things in common make sense, however the differntiating aspects
seem important as well on init? Or should the author be doing all
custom specific initializations on run_case() instead?

  Luis
