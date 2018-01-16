From: idosch at idosch.org (Ido Schimmel)
Date: Tue, 16 Jan 2018 09:59:18 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 00/12] selftests:
 forwarding: Add VRF-based tests
In-Reply-To: <bc5439a0-5761-47c8-7d3a-d05bb83b4e87@gmail.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <df929bcd-f15e-1897-fc54-c9aba9b65667@gmail.com>
 <20180115231735.GI2103@nanopsycho>
 <bc5439a0-5761-47c8-7d3a-d05bb83b4e87@gmail.com>
Message-ID: <20180116075917.GA770@splinter>

On Mon, Jan 15, 2018 at 04:48:25PM -0700, David Ahern wrote:
> On 1/15/18 4:17 PM, Jiri Pirko wrote:
> >> A couple of feature requests:
> >> 1. an option to pause on any error to allow inspection of the setup
> > 
> > Good idea. Should be easy to add.
> 
> Here is a snippet from my vrf test script:
> 
> PAUSE_ON_FAIL=no
> -p option sets PAUSE_ON_FAIL=yes
> 
> log_test()
> {
>         local rc=$1
>         local expected=$2
>         local msg="$3"
> 
>         if [ ${rc} -eq ${expected} ]; then
>                 nsuccess=$((nsuccess+1))
>                 printf "\n    TEST: %-80s  [ OK ]\n" "${msg}"
>         else
>                 nfail=$((nfail+1))
>                 printf "\n    TEST: %-80s  [FAIL]\n" "${msg}"
>                 if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
>                         echo
>                         echo "hit enter to continue, 'q' to quit"
>                         read a
>                         [ "$a" = "q" ] && exit 1
>                 fi
>         fi
> }

Nice. Will add.

[...]

> >> 2. an option to configure the system and leave it in that state (ie,
> >> don't trap exit and run cleanup). By extension, an option is needed to
> >> do cleanup only.
> > 
> > Checkout the last patch. It has "noprepare" and "nocleanup" options.
> > So I guess you imagine something like that, but generic?
> > 
> 
> Sure that is one way.

I think we can do something similar to your 'PAUSE_ON_FAIL' option. At
the end of the run the system is supposed to be configured as it was in
the beginning of the test, so we can have the trap wait for user to hit
'c' for cleanup if the option is set. By default it will run cleanup.

> Something else I have found useful is to not redirect stdout/stderr from
> the commands and to have tags that can be grep'ed to provide a summary.
> I run my VRF test script as:
> 
> $ run-test.sh 2>&1 | tee vrf-results.txt | grep TEST

Good idea. Will change.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
