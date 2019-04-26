From: paulmck@linux.ibm.com (Paul E. McKenney)
Date: Fri, 26 Apr 2019 06:50:58 -0700
Subject: [PATCH] rcutorture: Tweak kvm options
In-Reply-To: <20190426105413.rajcon4vyzov446c@linutronix.de>
References: <20190424073446.8577-1-bigeasy@linutronix.de>
 <20190424103809.GM3923@linux.ibm.com>
 <20190424183039.GA4494@linux.ibm.com>
 <20190425194638.GA7238@linux.ibm.com>
 <20190426105413.rajcon4vyzov446c@linutronix.de>
Message-ID: <20190426135058.GD3923@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426135058.mKtwXOvZCyDO70UHHtOdXXPmyS3yGgb3Mv4E0ESWkak@z>

On Fri, Apr 26, 2019@12:54:14PM +0200, Sebastian Andrzej Siewior wrote:
> On 2019-04-25 12:46:38 [-0700], Paul E. McKenney wrote:
> > > And it doesn't like my (admittedly ancient) QEMU, complaining about not
> > > knowing about "x2apic=on,tsc-deadline=on,hypervisor=on,tsc_adjust=on".
> > > If I remove these, it works.  I will be upgrading soon (famous last
> > > words), so what I am going to do is queue the following separate
> > > not-for-upstream patch that makes it work on my setup.
> > 
> > Also, the !SMP scenarios get this:
> > 
> > :CONFIG_PARAVIRT_SPINLOCKS=y: improperly set
> 
> I ignored that (because there is a CHECK option to ensure that certain
> options are set).

True enough, but these things are a bit like compiler warnings in that
it is good to have a clean run.

> > Would it make sense to only set this on CONFIG_SMP=y runs?  The easy
> > way to do this is to move it from CFcommon to the scenario files not
> > having CONFIG_SMP=n.

(Which is how I am currently running, I should have added.)

> > having CONFIG_SMP=n.  Or would something else work better?
> > 
> > Or am I doing something wrong?
> 
> You should also get that warning on ARM for instance since those
> PARAVIRT SPINLOCKS are only implemented on x86.

OK, so we would want this to only be added for x86 runs.

> I have no numbers to compare the performance with and without that
> option. So we could drop that option or you tell me where to look after
> a run with/without that option so I can tell if it is worth the effort.

One place to look is in the summary output:

TREE01 ------- 17540 GPs (58.4667/s) [rcu: g130629 f0x0 ]

The "58.4667/s" is the number of grace periods per second.  I would be
surprised if CONFIG_PARAVIRT_SPINLOCKS made a noticeable difference in
grace-period rate (given the natural variation), but you never know.

							Thanx, Paul
