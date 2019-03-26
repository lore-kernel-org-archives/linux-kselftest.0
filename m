From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 26 Mar 2019 14:40:13 -0400
Subject: [PATCH] rcutorture: Select from only online CPUs
In-Reply-To: <20190326183549.GA162738@google.com>
References: <20190323034619.15792-1-joel@joelfernandes.org>
 <20190325150133.GA4102@linux.ibm.com>
 <CAEXW_YRDfOEr-hdbKGDC6amRaaqTCCBsowRhVwDqJd-1BoO17g@mail.gmail.com>
 <20190325164253.GE4102@linux.ibm.com>
 <CAEXW_YT8dS--pBrQoBO=G_d+4Ffi7o2++PQukh6dyNHqX-TLBg@mail.gmail.com>
 <20190326160140.GP4102@linux.ibm.com>
 <20190326183549.GA162738@google.com>
Message-ID: <20190326184013.GA114492@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190326184013.w6hac-PCIlPncguihVMSE1Dorck1lxbjjLj1u1wYTHQ@z>

On Tue, Mar 26, 2019@02:35:49PM -0400, Joel Fernandes wrote:
> On Tue, Mar 26, 2019@09:01:40AM -0700, Paul E. McKenney wrote:
> > On Mon, Mar 25, 2019@06:40:17PM -0400, Joel Fernandes wrote:
> > > On Mon, Mar 25, 2019@12:42 PM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
> > > >
> > > > On Mon, Mar 25, 2019@12:33:37PM -0400, Joel Fernandes wrote:
> > > > > On Mon, Mar 25, 2019@11:02 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
> > > > > >
> > > > > > On Fri, Mar 22, 2019@11:46:19PM -0400, Joel Fernandes (Google) wrote:
> > > > > > > The rcutorture jitter.sh script selects a random CPU but does not check
> > > > > > > if it is offline or online. This leads to taskset errors many times. On
> > > > > > > my machine, hyper threading is disabled so half the cores are offline
> > > > > > > causing taskset errors a lot of times. Let us fix this by checking from
> > > > > > > only the online CPUs on the system.
> > > > > > >
> > > > > > > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > > > > >
> > > > > > Good catch!
> > > > > >
> > > > > > Please see below for one suggestion for simplification.
> > > > > >
> > > > > >                                                         Thanx, Paul
> > > > > >
> > > > > > > ---
> > > > > > >  tools/testing/selftests/rcutorture/bin/jitter.sh | 11 ++++++++++-
> > > > > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/tools/testing/selftests/rcutorture/bin/jitter.sh b/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > > > > index 3633828375e3..53bf9d99b5cd 100755
> > > > > > > --- a/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > > > > +++ b/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > > > > @@ -47,10 +47,19 @@ do
> > > > > > >               exit 0;
> > > > > > >       fi
> > > > > > >
> > > > > > > -     # Set affinity to randomly selected CPU
> > > > > > > +     # Set affinity to randomly selected online CPU
> > > > > > >       cpus=`ls /sys/devices/system/cpu/*/online |
> > > > > >
> > > > > >         cpus=`grep 1 /sys/devices/system/cpu/*/online |
> > > > >
> > > > > Yes, this is better. Lets do it this way :)
> > > > >
> > > > > > >               sed -e 's,/[^/]*$,,' -e 's/^[^0-9]*//' |
> > > > > > >               grep -v '^0*$'`
> > > > > >
> > > > > > Of course, now I have no idea why I excluded CPU 0...  :-/
> > > > >
> > > > > Yes, I was wondering as well about that :-)
> > > >
> > > > Please feel free to try including CPU 0 and running the set of single-CPU
> > > > rcutorture scenarios.  ;-)
> > > 
> > > Will do and then will update the patch by adding the CPU back, if all
> > > is well. Thanks.
> > 
> > And rcutorture doesn't like the rcu_is_cpu_rrupt_from_idle() patch on
> > scenarios SRCU-P, TASKS01, and TREE05, which are the Tree RCU scenarios
> > that enable CONFIG_PROVE_RCU.  The compiler error is:
> > 
> > kernel/rcu/tree.c:391:2: error: implicit declaration of function ‘_this_cpu_read’ [-Werror=implicit-function-declaration]
> > 
> > My guess is that the initial underscore needs to go.  I will drop
> > these two patches in favor of an update from you.  ;-)
> 
> Sorry, I fixed that up and running tests now.
> 
> By the way, may be you decided to not run the jitter on CPU0 just because on
> some systems, CPU0 does not have an 'online' file? In this case, the grep may
> throw errors I guess which troubles the script.
> 
> From the old cpu hotplug docs, I found that if CONFIG_BOOTPARAM_HOTPLUG_CPU0
> or cpu0_hotplug boot command line option is not passed, then cpu0 cannot be
> offlined in which case, presumably the 'online' file will be missing, like
> some systems I am testing on.

Never mind, the "*" in your path search would take care of not erroring out :-)

The other reason you may have done it is for making the jitter be
consistent across systems that can offline CPU0, and the others that can't :-).
I am just guessing.

Any way, I will just add back CPU0 forcefully to the cpus list in my testing,
without checking for the online file existence, and see what happens :-) If
there's no smoke, then I'll roll that into a patch and send it out.

thanks.
