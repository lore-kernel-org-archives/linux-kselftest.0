From: brendanhiggins at google.com (Brendan Higgins)
Date: Fri, 30 Nov 2018 18:08:36 -0800
Subject: [RFC v3 01/19] kunit: test: add KUnit test runner core
In-Reply-To: <20181130032802.GG18410@garbanzo.do-not-panic.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-2-brendanhiggins@google.com>
 <20181130032802.GG18410@garbanzo.do-not-panic.com>
Message-ID: <CAFd5g45F0RViYDQyXRwyxVPAU=CO_Goqy3yHz=BbcMeAT7o6-g@mail.gmail.com>

On Thu, Nov 29, 2018 at 7:28 PM Luis Chamberlain <mcgrof at kernel.org> wrote:
>
> > +static void kunit_run_case_internal(struct kunit *test,
> > +                                 struct kunit_module *module,
> > +                                 struct kunit_case *test_case)
> > +{
> > +     int ret;
> > +
> > +     if (module->init) {
> > +             ret = module->init(test);
> > +             if (ret) {
> > +                     kunit_err(test, "failed to initialize: %d", ret);
> > +                     kunit_set_success(test, false);
> > +                     return;
> > +             }
> > +     }
> > +
> > +     test_case->run_case(test);
> > +}
>
> <-- snip -->
>
> > +static bool kunit_run_case(struct kunit *test,
> > +                        struct kunit_module *module,
> > +                        struct kunit_case *test_case)
> > +{
> > +     kunit_set_success(test, true);
> > +
> > +     kunit_run_case_internal(test, module, test_case);
> > +     kunit_run_case_cleanup(test, module, test_case);
> > +
> > +     return kunit_get_success(test);
> > +}
>
> So we are running the module->init() for each test case... is that
> correct? Shouldn't the init run once? Also, typically init calls are

Yep, it's correct. `module->init()` should run once before every test
case, reason being that the kunit_module serves as a test fixture in
which each test cases should be run completely independently of every
other. init and exit is supposed to allow code common to all test
cases to run since it is so common to have dependencies needed for a
test to be common to every test case.

Maybe it is confusing that I call it kunit_module? Maybe I should call
it kunit_fixture or something?

> pegged with __init so we free them later. You seem to have skipped the
> init annotations. Why?

Like I said above, these aren't normal init functions. A
kunit_module->init() function should run once before each test case
and thus should reside in the same linker section as any other KUnit
test code.

Cheers
