From: daniel.diaz at linaro.org (=?UTF-8?B?RGFuaWVsIETDrWF6?=)
Date: Tue, 16 Oct 2018 13:20:03 -0500
Subject: [PATCH] selftests/ftrace: Use colored output when available
In-Reply-To: <037e072a-5695-1343-35d1-37b9450581d4@kernel.org>
References: <20181016170220.31156-1-daniel.diaz@linaro.org>
 <037e072a-5695-1343-35d1-37b9450581d4@kernel.org>
Message-ID: <CAEUSe79cj8i6kH1O2a6vJO8RHnEPVMx5UjbVvxsJqRZ38N5wBg@mail.gmail.com>

Hello!

On Tue, 16 Oct 2018 at 12:43, Shuah Khan <shuah at kernel.org> wrote:
> On 10/16/2018 11:02 AM, Daniel Díaz wrote:
> > If test is being directly executed (with stdout opened on the
> > terminal) and the terminal capabilities indicate enough
> > colors, then use the existing scheme of green, red, and blue
> > to show when tests pass, fail or end in a different way.
> >
> > When running the tests redirecting the stdout, for instance,
> > to a file, then colors are not shown, thus producing a more
> > readable output.
> >
> > Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> > ---
>
> Hi Daniel,
> Thanks for the patch. Steve is working on adding this functionality. Please
> see the latest linux-kselftest next for the patch.

I hadn't seen today's discussion until after Steve replied to this
patch. Mine is based on your next branch, building upon Steve's patch.

These changes here are somewhat different, in that color is enabled
only if color is available in the terminal in the first place! And if
the standard output is redirected to a file (which is what Masami
reported today), then colors are avoided even if available.

Greetings!

Daniel Díaz
daniel.diaz at linaro.org


> Steve just sent an update to the patch to fix an issue. Please test and see
> if that solves the problem you are trying address with this patch.
>
> thanks,
> -- Shuah
