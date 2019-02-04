From: mcgrof@kernel.org (Luis Chamberlain)
Date: Mon, 4 Feb 2019 17:39:57 -0600
Subject: [PATCH 2/2] selftests: firmware: add
 CONFIG_FW_LOADER_USER_HELPER_FALLBACK to config
In-Reply-To: <20181130023115.GN4922@garbanzo.do-not-panic.com>
References: <20181127031218.24419-1-dan.rue@linaro.org>
 <20181127031218.24419-3-dan.rue@linaro.org>
 <20181130023115.GN4922@garbanzo.do-not-panic.com>
Message-ID:
 <CAB=NE6Xxzee9+VeXWqe3o8Uf3Mb+jw=_-9C8RuqSSeWrVUXJng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190204233957.qMWvD8Mg3EtAsBEEKCSRP01H80xVCwYFPZfy25St5oQ@z>

On Thu, Nov 29, 2018@8:31 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Mon, Nov 26, 2018@09:12:16PM -0600, Dan Rue wrote:
> > CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y is required for fw_fallback.sh.
> > Without it, fw_fallback.sh fails with 'usermode helper disabled so
> > ignoring test'. Enable the config in selftest so that it gets built by
> > default.
> >
> > Signed-off-by: Dan Rue <dan.rue at linaro.org>
> > ---
> >  tools/testing/selftests/firmware/config | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/testing/selftests/firmware/config b/tools/testing/selftests/firmware/config
> > index bf634dda0720..913a25a4a32b 100644
> > --- a/tools/testing/selftests/firmware/config
> > +++ b/tools/testing/selftests/firmware/config
> > @@ -1,5 +1,6 @@
> >  CONFIG_TEST_FIRMWARE=y
> >  CONFIG_FW_LOADER=y
> >  CONFIG_FW_LOADER_USER_HELPER=y
> > +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> >  CONFIG_IKCONFIG=y
> >  CONFIG_IKCONFIG_PROC=y
>
> NACK -- the point of the changes was to *allow* us to mimic such
> configuration through a proc sysctl knob.
>
> You aren forcing CONFIG_FW_LOADER_USER_HELPER_FALLBACK but just having
> CONFIG_FW_LOADER_USER_HELPER suffices to emulate the_FALLBACK
> functionality.

Dan, again, you broke the whole point to the amount of work that went
into emulating testing. As such anyone testing their changes would
yield incorrect results.

> The issue here seems to be that *all* tests fail once a configuration is
> found which is not suitable a tests. With the shiny new proc sysctls we
> can test all 3 kernel configurations in one shot. Since we test 3
> different kernel configurations naturally some of these won't have the
> features needed, so that failure should be treated as non-fatal to allow
> the chain of other tests to continue.
>
> This issue was a regression due to commit a6a9be9270c87 ("selftests:
> firmware: return Kselftest Skip code for skipped tests") by Shuah for
> the verify_reqs(). We need to treat this as a non-fatal / don't skip
> return value.
>
> The following would fix this chaining issue:
>
> diff --git a/tools/testing/selftests/firmware/fw_lib.sh b/tools/testing/selftests/firmware/fw_lib.sh
> index 6c5f1b2ffb74..1cbb12e284a6 100755
> --- a/tools/testing/selftests/firmware/fw_lib.sh
> +++ b/tools/testing/selftests/firmware/fw_lib.sh
> @@ -91,7 +91,7 @@ verify_reqs()
>         if [ "$TEST_REQS_FW_SYSFS_FALLBACK" = "yes" ]; then
>                 if [ ! "$HAS_FW_LOADER_USER_HELPER" = "yes" ]; then
>                         echo "usermode helper disabled so ignoring test"
> -                       exit $ksft_skip
> +                       exit 0
>                 fi
>         fi
>  }
>
> However its not clear to me if instead we want some new special return
> value for selftests so that the framework can detect an that an error
> is non-fatal, and can continue. This is a tricky situation given the
> script, existing upstream kernel module, are aware of such emulation
> hacks via sysctl, but knowledge of this is not obvious to selftests.
>
> Shuah, how do you suggest we handle this corner case? If you are OK
> with the above hunk for now I can send a fix for it. In either case
> this commit was added on v4.18, so the fix would be a stable fix.

In lieu of any suggestion I'm going to request we revert this commit
and send the above fix.

 Luis
