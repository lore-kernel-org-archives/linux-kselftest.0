From: joel@joelfernandes.org (Joel Fernandes)
Date: Mon, 25 Mar 2019 18:02:37 -0400
Subject: [PATCH] rcutorture: Select from only online CPUs
In-Reply-To: <20190325164253.GE4102@linux.ibm.com>
References: <20190323034619.15792-1-joel@joelfernandes.org>
 <20190325150133.GA4102@linux.ibm.com>
 <CAEXW_YRDfOEr-hdbKGDC6amRaaqTCCBsowRhVwDqJd-1BoO17g@mail.gmail.com>
 <20190325164253.GE4102@linux.ibm.com>
Message-ID: <20190325220237.GA22743@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190325220237.xiN_BM95js2_YiAFP1SuzjSpk310RAqe1_etK8Fxirw@z>

On Mon, Mar 25, 2019@09:42:53AM -0700, Paul E. McKenney wrote:
> On Mon, Mar 25, 2019@12:33:37PM -0400, Joel Fernandes wrote:
> > On Mon, Mar 25, 2019@11:02 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
> > >
> > > On Fri, Mar 22, 2019@11:46:19PM -0400, Joel Fernandes (Google) wrote:
> > > > The rcutorture jitter.sh script selects a random CPU but does not check
> > > > if it is offline or online. This leads to taskset errors many times. On
> > > > my machine, hyper threading is disabled so half the cores are offline
> > > > causing taskset errors a lot of times. Let us fix this by checking from
> > > > only the online CPUs on the system.
> > > >
> > > > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > >
> > > Good catch!
> > >
> > > Please see below for one suggestion for simplification.
> > >
> > >                                                         Thanx, Paul
> > >
> > > > ---
> > > >  tools/testing/selftests/rcutorture/bin/jitter.sh | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/tools/testing/selftests/rcutorture/bin/jitter.sh b/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > index 3633828375e3..53bf9d99b5cd 100755
> > > > --- a/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > +++ b/tools/testing/selftests/rcutorture/bin/jitter.sh
> > > > @@ -47,10 +47,19 @@ do
> > > >               exit 0;
> > > >       fi
> > > >
> > > > -     # Set affinity to randomly selected CPU
> > > > +     # Set affinity to randomly selected online CPU
> > > >       cpus=`ls /sys/devices/system/cpu/*/online |
> > >
> > >         cpus=`grep 1 /sys/devices/system/cpu/*/online |
> > 
> > Yes, this is better. Lets do it this way :)
> > 
> > > >               sed -e 's,/[^/]*$,,' -e 's/^[^0-9]*//' |
> > > >               grep -v '^0*$'`
> > >
> > > Of course, now I have no idea why I excluded CPU 0...  :-/
> > 
> > Yes, I was wondering as well about that :-)
> 
> Please feel free to try including CPU 0 and running the set of single-CPU
> rcutorture scenarios.  ;-)

Sounds good, I will test that out on your latest dev branch. Thanks,

- Joel
