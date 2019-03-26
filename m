From: paulmck at linux.ibm.com (Paul E. McKenney)
Date: Tue, 26 Mar 2019 09:01:40 -0700
Subject: [PATCH] rcutorture: Select from only online CPUs
In-Reply-To: <CAEXW_YT8dS--pBrQoBO=G_d+4Ffi7o2++PQukh6dyNHqX-TLBg@mail.gmail.com>
References: <20190323034619.15792-1-joel@joelfernandes.org>
 <20190325150133.GA4102@linux.ibm.com>
 <CAEXW_YRDfOEr-hdbKGDC6amRaaqTCCBsowRhVwDqJd-1BoO17g@mail.gmail.com>
 <20190325164253.GE4102@linux.ibm.com>
 <CAEXW_YT8dS--pBrQoBO=G_d+4Ffi7o2++PQukh6dyNHqX-TLBg@mail.gmail.com>
Message-ID: <20190326160140.GP4102@linux.ibm.com>

On Mon, Mar 25, 2019 at 06:40:17PM -0400, Joel Fernandes wrote:
> On Mon, Mar 25, 2019 at 12:42 PM Paul E. McKenney <paulmck at linux.ibm.com> wrote:
> >
> > On Mon, Mar 25, 2019 at 12:33:37PM -0400, Joel Fernandes wrote:
> > > On Mon, Mar 25, 2019 at 11:02 AM Paul E. McKenney <paulmck at linux.ibm.com> wrote:
> > > >
> > > > On Fri, Mar 22, 2019 at 11:46:19PM -0400, Joel Fernandes (Google) wrote:
> > > > > The rcutorture jitter.sh script selects a random CPU but does not check
> > > > > if it is offline or online. This leads to taskset errors many times. On
> > > > > my machine, hyper threading is disabled so half the cores are offline
> > > > > causing taskset errors a lot of times. Let us fix this by checking from
> > > > > only the online CPUs on the system.
> > > > >
> > > > > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > > >
> > > > Good catch!
> > > >
> > > > Please see below for one suggestion for simplification.
> > > >
> > > >                                                         Thanx, Paul
> > > >
> > > > > ---
> > > > >  tools/testing/selftests/rcutorture/bin/jitter.sh | 11 ++++++++++-
> > > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/tools/testing/selftests/rcutorture/bin/jitter.sh b/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > > index 3633828375e3..53bf9d99b5cd 100755
> > > > > --- a/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > > +++ b/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > > @@ -47,10 +47,19 @@ do
> > > > >               exit 0;
> > > > >       fi
> > > > >
> > > > > -     # Set affinity to randomly selected CPU
> > > > > +     # Set affinity to randomly selected online CPU
> > > > >       cpus=`ls /sys/devices/system/cpu/*/online |
> > > >
> > > >         cpus=`grep 1 /sys/devices/system/cpu/*/online |
> > >
> > > Yes, this is better. Lets do it this way :)
> > >
> > > > >               sed -e 's,/[^/]*$,,' -e 's/^[^0-9]*//' |
> > > > >               grep -v '^0*$'`
> > > >
> > > > Of course, now I have no idea why I excluded CPU 0...  :-/
> > >
> > > Yes, I was wondering as well about that :-)
> >
> > Please feel free to try including CPU 0 and running the set of single-CPU
> > rcutorture scenarios.  ;-)
> 
> Will do and then will update the patch by adding the CPU back, if all
> is well. Thanks.

And rcutorture doesn't like the rcu_is_cpu_rrupt_from_idle() patch on
scenarios SRCU-P, TASKS01, and TREE05, which are the Tree RCU scenarios
that enable CONFIG_PROVE_RCU.  The compiler error is:

kernel/rcu/tree.c:391:2: error: implicit declaration of function ‘_this_cpu_read’ [-Werror=implicit-function-declaration]

My guess is that the initial underscore needs to go.  I will drop
these two patches in favor of an update from you.  ;-)

							Thanx, Paul
