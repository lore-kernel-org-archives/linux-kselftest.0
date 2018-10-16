From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 16 Oct 2018 14:34:04 -0400
Subject: [PATCH] selftests/ftrace: Use colored output when available
In-Reply-To: <037e072a-5695-1343-35d1-37b9450581d4@kernel.org>
References: <20181016170220.31156-1-daniel.diaz@linaro.org>
 <037e072a-5695-1343-35d1-37b9450581d4@kernel.org>
Message-ID: <20181016143404.6847beb4@gandalf.local.home>

On Tue, 16 Oct 2018 11:43:29 -0600
Shuah Khan <shuah at kernel.org> wrote:

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
> 
> Thanks for the patch. Steve is working on adding this functionality. Please
> see the latest linux-kselftest next for the patch.
> 
> Steve just sent an update to the patch to fix an issue. Please test and see
> if that solves the problem you are trying address with this patch.
> 

Hi Shuah,

I think this patch actually addresses the issue of my last patch, and I
haven't sent another one.

I'm waiting to hear from Masami if it fixes the issues he saw.

-- Steve
