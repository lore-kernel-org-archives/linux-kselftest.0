From: anders.roxell at linaro.org (Anders Roxell)
Date: Fri, 29 Jun 2018 14:47:59 +0200
Subject: [PATCH] doc: dev-tools: kselftest.rst: update contributing new
 tests
In-Reply-To: <53d599f2-44a1-c366-4a5c-2ca6cd19b031@kernel.org>
References: <20180629100248.11560-1-anders.roxell@linaro.org>
 <53d599f2-44a1-c366-4a5c-2ca6cd19b031@kernel.org>
Message-ID: <CADYN=9L3hQCfiD2CBrx3_2pLxTaZGPTt-gAcScKqe7pTq4ZgCg@mail.gmail.com>

On Fri, 29 Jun 2018 at 14:10, Shuah Khan <shuah at kernel.org> wrote:
>
> On 06/29/2018 04:02 AM, Anders Roxell wrote:
> > Add a description that kernel config options should be added into a
> > config file that is placed next to the newly added test.
> >
> > Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> > ---
> >  Documentation/dev-tools/kselftest.rst | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> > index 3bf371a938d0..4c546a35bd58 100644
> > --- a/Documentation/dev-tools/kselftest.rst
> > +++ b/Documentation/dev-tools/kselftest.rst
> > @@ -156,6 +156,9 @@ Contributing new tests (details)
> >     installed by the distro on the system should be the primary focus to be able
> >     to find regressions.
> >
> > + * If a new test needs specific kernel options, they should be enabled in
>
> get rid of new
>
> > +   then config file in the same directory where the test is added.
>
> "the config" instead of "then config"
>
> Rephrasing this might be better:
>
> "If a test needs specific kernel config options enabled, add a config file in the
> test directory to enable them.
>
> e.g: tools/testing/selftests/android/ion/config

I like it. sending v2 shortly.

Thank you.

Cheers,
Anders

>
> > +
> >  Test Harness
> >  ============
> >
> >
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
