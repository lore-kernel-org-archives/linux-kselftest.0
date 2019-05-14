From: keescook at chromium.org (Kees Cook)
Date: Tue, 14 May 2019 08:46:14 -0700
Subject: next-20190510 kselftest results
In-Reply-To: <CADYN=9+nwM4Kw-PWHHDpQ5hpf=N5N8Ewy=h7Y2RTyO5Kwak88A@mail.gmail.com>
References: <359070592.29.1557569697898.JavaMail.jenkins@db10df53eddc>
 <201905110746.D6C85E86F6@keescook>
 <CADYN=9+nwM4Kw-PWHHDpQ5hpf=N5N8Ewy=h7Y2RTyO5Kwak88A@mail.gmail.com>
Message-ID: <201905140843.B972AA13B6@keescook>

On Tue, May 14, 2019 at 05:28:45PM +0200, Anders Roxell wrote:
> On Sat, 11 May 2019 at 16:51, Kees Cook <keescook at chromium.org> wrote:
> > > Test Suites
> > > -----------
> > > * boot-lkft-kselftests-master-519
> >
> > What counts as a "pass" for this? I looked at the x86_64 log, and there are lots of kselftest failures, but the dashboard counts it as a "pass"?
> 
> The boot is passed when the auto-login-action in suite 'lava' is passed [1].
> 
> There's is two issues:
> 1. We had a way that changed the run_kselftest.sh file in order to
> skip tests that hanged (that results in no test output from the run)
> various boards. Since the new change to kselftest, the patch to
> run_kselftest.sh got added that breaks our way to skip the tests and
> kernel hangs.

There's a fix in -next that adds an "alarm" check now so no tests should ever hang for more than 30 seconds now:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?id=a745f7af3cbd04b9c9c9e803429e1c20775b538d

> 2. The way we parse the output doesn't match the new output format.
> 
> We will turn off the "next-* kselftest restults" until we have
> resolved this issue.

I'd prefer to keep the tests running -- they're still valuable logs to
have. I was just curious about the specific reporting. As long as the
issue is known, that's fine. No need to disable it entirely. :)

-Kees

-- 
Kees Cook
