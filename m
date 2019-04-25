From: bigeasy at linutronix.de (Sebastian Andrzej Siewior)
Date: Thu, 25 Apr 2019 19:13:03 +0200
Subject: [PATCH] rcutorture: Tweak kvm options
In-Reply-To: <20190425164558.GA233442@google.com>
References: <20190424073446.8577-1-bigeasy@linutronix.de>
 <20190425164558.GA233442@google.com>
Message-ID: <20190425171303.eofzt4hjp2445yon@linutronix.de>

On 2019-04-25 12:45:58 [-0400], Joel Fernandes wrote:
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
> 
> I was wondering why the tsc deadline timer can't just be the default in the
> kernel if it is "nicer" / "better" , and why does it need to be an option.

The tsc-deadline=on part tells qemu to expose it. Otherwise the kernel
can't use HW that isn't there.
I added q35 as the machine which should pass enough sane default
options. If this tsc-deadline timer is a problem we could probably drop
it. The local-apic should work.

> > - I didn't add a random HW device. It would make the random device ready
> >   earlier (not it doesn't complete the initialisation at all) but I
> >   doubt that there is any need for this.
> 
> Didn't follow this point about "random HW device". It looks like there is no
> part of the patch that matches this comment. There was no "random HW device"
> needed for this change of the clocksource, so could you clarify what this means?

I wanted to "upgrade" the kvm options and as part of it also add:
         -object rng-random,filename=/dev/urandom,id=rng0
         -device virtio-rng-pci,rng=rng0

With that change you would see
|random: crng init done

during boot. Now you should end up with "only" 
|random: fast init done

I mentioned it because I didn't see a reason why to do so. If someone
has an idea why it would make sense for rcutorture to use it, I can add
it.

> Otherwise lgtm, thanks!
> 
> Reviewed-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> 
> - Joel

Sebastian
