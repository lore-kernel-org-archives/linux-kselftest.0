From: paulmck at linux.ibm.com (Paul E. McKenney)
Date: Wed, 24 Apr 2019 11:30:39 -0700
Subject: [PATCH] rcutorture: Tweak kvm options
In-Reply-To: <20190424103809.GM3923@linux.ibm.com>
References: <20190424073446.8577-1-bigeasy@linutronix.de>
 <20190424103809.GM3923@linux.ibm.com>
Message-ID: <20190424183039.GA4494@linux.ibm.com>

On Wed, Apr 24, 2019 at 03:38:09AM -0700, Paul E. McKenney wrote:
> On Wed, Apr 24, 2019 at 09:34:46AM +0200, Sebastian Andrzej Siewior wrote:
> > In one of my rcutorture tests the TSC clocksource got marked unstable
> > due to a large difference in the TSC value. I'm not sure if the guest
> > run for a long time with disabled interrupts or if the host was very
> > busy and didn't schedule the guest for some time.
> > I took a look on the qemu/KVM options and decided to update the options:
> > - Use kvm{32|64} as CPU. We could probably use `host' (like ARM does)
> >   for maximum available features but since we don't run any userland I'm
> >   not sure if it makes any difference.
> > 
> > - Drop the "noapic" option, enable TSC deadline timer. There is no
> >   history why the APIC was disabled, I see no reason for it. The
> >   deadline timer is probably "nicer".
> > 
> > - Additional config options. It ensures that the kernel knowns that it
> >   runs as a kvm guest and can use virt devices like the kvm-clock as
> >   clocksource. The kvm-clock was the main motivation here.
> > 
> > - I didn't add a random HW device. It would make the random device ready
> >   earlier (not it doesn't complete the initialisation at all) but I
> >   doubt that there is any need for this.
> > 
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
> 
> Thank you, Sebastian!  Queued for review and testing.

And it doesn't like my (admittedly ancient) QEMU, complaining about not
knowing about "x2apic=on,tsc-deadline=on,hypervisor=on,tsc_adjust=on".
If I remove these, it works.  I will be upgrading soon (famous last
words), so what I am going to do is queue the following separate
not-for-upstream patch that makes it work on my setup.

							Thanx, Paul

------------------------------------------------------------------------

commit d33dffe7d1f05adfc798836a9d30b9f6bf69635d
Author: Paul E. McKenney <paulmck at linux.ibm.com>
Date:   Wed Apr 24 05:20:07 2019 -0700

    EXP torture: Hack patch to support ancient QEMU
    
    To be removed before upstreaming or when Paul gets his QEMU act together,
    whichever comes first.  ;-)
    
    Signed-off-by: Paul E. McKenney <paulmck at linux.ibm.com>

diff --git a/tools/testing/selftests/rcutorture/bin/functions.sh b/tools/testing/selftests/rcutorture/bin/functions.sh
index be3c5c73d7e7..c3a49fb4d6f6 100644
--- a/tools/testing/selftests/rcutorture/bin/functions.sh
+++ b/tools/testing/selftests/rcutorture/bin/functions.sh
@@ -203,7 +203,7 @@ identify_qemu_args () {
 	case "$1" in
 	qemu-system-x86_64|qemu-system-i386)
 		echo -machine q35,accel=kvm
-		echo -cpu ${KVM_CPU},x2apic=on,tsc-deadline=on,hypervisor=on,tsc_adjust=on
+		echo -cpu ${KVM_CPU}
 		;;
 	qemu-system-aarch64)
 		echo -machine virt,gic-version=host -cpu host
