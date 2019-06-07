From: brendanhiggins at google.com (Brendan Higgins)
Date: Fri, 7 Jun 2019 15:22:53 -0700
Subject: [PATCH v4 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
In-Reply-To: <20190607190047.C3E7A20868@mail.kernel.org>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-18-brendanhiggins@google.com>
 <20190517182254.548EA20815@mail.kernel.org>
 <CAAXuY3p4qhKVsSpQ44_kQeGDMfg7OuFLgFyxhcFWS3yf-5A_7g@mail.gmail.com>
 <20190607190047.C3E7A20868@mail.kernel.org>
Message-ID: <CAFd5g475eUKnpNM3kDe_9PboCyZ=aanPeV2gTuzuJXRp-xbsWg@mail.gmail.com>

On Fri, Jun 7, 2019 at 12:00 PM Stephen Boyd <sboyd at kernel.org> wrote:
>
> Quoting Iurii Zaikin (2019-06-05 18:29:42)
> > On Fri, May 17, 2019 at 11:22 AM Stephen Boyd <sboyd at kernel.org> wrote:
> > >
> > > Quoting Brendan Higgins (2019-05-14 15:17:10)
> > > > diff --git a/kernel/sysctl-test.c b/kernel/sysctl-test.c
> > > > new file mode 100644
> > > > index 0000000000000..fe0f2bae66085
> > > > --- /dev/null
> > > > +++ b/kernel/sysctl-test.c
> > > > +
> > > > +
> > > > +static void sysctl_test_dointvec_happy_single_negative(struct kunit *test)
> > > > +{
> > > > +       struct ctl_table table = {
> > > > +               .procname = "foo",
> > > > +               .data           = &test_data.int_0001,
> > > > +               .maxlen         = sizeof(int),
> > > > +               .mode           = 0644,
> > > > +               .proc_handler   = proc_dointvec,
> > > > +               .extra1         = &i_zero,
> > > > +               .extra2         = &i_one_hundred,
> > > > +       };
> > > > +       char input[] = "-9";
> > > > +       size_t len = sizeof(input) - 1;
> > > > +       loff_t pos = 0;
> > > > +
> > > > +       table.data = kunit_kzalloc(test, sizeof(int), GFP_USER);
> > > > +       KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, 1, input, &len, &pos));
> > > > +       KUNIT_EXPECT_EQ(test, sizeof(input) - 1, len);
> > > > +       KUNIT_EXPECT_EQ(test, sizeof(input) - 1, pos);
> > > > +       KUNIT_EXPECT_EQ(test, -9, *(int *)table.data);
> > >
> > > Is the casting necessary? Or can the macro do a type coercion of the
> > > second parameter based on the first type?
> >  Data field is defined as void* so I believe casting is necessary to
> > dereference it as a pointer to an array of ints. I don't think the
> > macro should do any type coercion that == operator wouldn't do.
> >  I did change the cast to make it more clear that it's a pointer to an
> > array of ints being dereferenced.
>
> Ok, I still wonder if we should make KUNIT_EXPECT_EQ check the types on
> both sides and cause a build warning/error if the types aren't the same.
> This would be similar to our min/max macros that complain about
> mismatched types in the comparisons. Then if a test developer needs to
> convert one type or the other they could do so with a
> KUNIT_EXPECT_EQ_T() macro that lists the types to coerce both sides to
> explicitly.

Good point. I would definitely like to do this, for me it is only a
question of how difficult it would be to make all that happen.

We will investigate and report back on it.

Thanks for the suggestion! It's a really good idea!

Cheers
