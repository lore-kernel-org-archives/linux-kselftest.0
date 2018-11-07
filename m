From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 6 Nov 2018 17:28:43 -0800
Subject: [RFC v2 01/14] kunit: test: add KUnit test runner core
In-Reply-To: <017b111f-d960-c1ef-46ae-eb0eb639fe5b@kernel.org>
References: <20181023235750.103146-1-brendanhiggins@google.com>
 <20181023235750.103146-2-brendanhiggins@google.com>
 <017b111f-d960-c1ef-46ae-eb0eb639fe5b@kernel.org>
Message-ID: <CAFd5g45KNNGPVh4EBm8vKGdVhqajZZA0TU=CFbceJziYufb0Ug@mail.gmail.com>

On Fri, Nov 2, 2018 at 11:44 AM Shuah Khan <shuah at kernel.org> wrote:
>
> On 10/23/2018 05:57 PM, Brendan Higgins wrote:
<snip>
> > + * Example:
> > + *
> > + * .. code-block:: c
> > + *
> > + *   void add_test_basic(struct test *test)
> > + *   {
> > + *           TEST_EXPECT_EQ(test, 1, add(1, 0));
> > + *           TEST_EXPECT_EQ(test, 2, add(1, 1));
> > + *           TEST_EXPECT_EQ(test, 0, add(-1, 1));
> > + *           TEST_EXPECT_EQ(test, INT_MAX, add(0, INT_MAX));
> > + *           TEST_EXPECT_EQ(test, -1, add(INT_MAX, INT_MIN));
> > + *   }
> > + *
> > + *   static struct test_case example_test_cases[] = {
> > + *           TEST_CASE(add_test_basic),
> > + *           {},
> > + *   };
> > + *
> > + */
> > +struct test_case {
> > +     void (*run_case)(struct test *test);
> > +     const char name[256];
> > +
> > +     /* private: internal use only. */
> > +     bool success;
> > +};
> > +
>
> Introducing a prefix kunit_* might be a good idea for the API.
> This comment applies to the rest of patches as well.

What about kunit_* instead of test_* and kmock_* instead of mock_*?
Does that seem reasonable?
