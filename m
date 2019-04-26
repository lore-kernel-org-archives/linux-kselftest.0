From: bigeasy@linutronix.de (Sebastian Andrzej Siewior)
Date: Fri, 26 Apr 2019 12:54:14 +0200
Subject: [PATCH] rcutorture: Tweak kvm options
In-Reply-To: <20190425194638.GA7238@linux.ibm.com>
References: <20190424073446.8577-1-bigeasy@linutronix.de>
 <20190424103809.GM3923@linux.ibm.com>
 <20190424183039.GA4494@linux.ibm.com>
 <20190425194638.GA7238@linux.ibm.com>
Message-ID: <20190426105413.rajcon4vyzov446c@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426105414.-d2dNBpCqY45twnPyloaBU9sMCdv0buJIiOFZSvQQpA@z>

On 2019-04-25 12:46:38 [-0700], Paul E. McKenney wrote:
> > And it doesn't like my (admittedly ancient) QEMU, complaining about not
> > knowing about "x2apic=on,tsc-deadline=on,hypervisor=on,tsc_adjust=on".
> > If I remove these, it works.  I will be upgrading soon (famous last
> > words), so what I am going to do is queue the following separate
> > not-for-upstream patch that makes it work on my setup.
> 
> Also, the !SMP scenarios get this:
> 
> :CONFIG_PARAVIRT_SPINLOCKS=y: improperly set

I ignored that (because there is a CHECK option to ensure that certain
options are set).

> Would it make sense to only set this on CONFIG_SMP=y runs?  The easy
> way to do this is to move it from CFcommon to the scenario files not
> having CONFIG_SMP=n.  Or would something else work better?
> 
> Or am I doing something wrong?

You should also get that warning on ARM for instance since those
PARAVIRT SPINLOCKS are only implemented on x86.
I have no numbers to compare the performance with and without that
option. So we could drop that option or you tell me where to look after
a run with/without that option so I can tell if it is worth the effort.

> 							Thanx, Paul

Sebastian
