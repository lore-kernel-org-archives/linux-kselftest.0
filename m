From: ahmedsoliman@mena.vt.edu (Ahmed Soliman)
Date: Sat, 17 Nov 2018 21:43:43 +0200
Subject: KVM selftests are failing
In-Reply-To: <8736s1qh3d.fsf@vitty.brq.redhat.com>
References: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
 <20181114180807.6crs7awhvo26ldbr@hawk.localdomain>
 <CADYN=9Jh10guVNFfhS8XH+RwZAouLJQu7Svg4+Tz3rQDexzDkg@mail.gmail.com>
 <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>
 <CANBxJ=EB8izWM8iLd49Uvd1z1O-gLvkGmiKNHjfHifFohj2xbg@mail.gmail.com>
 <20181115090203.5z25gwa2yznj6mmu@kamzik.brq.redhat.com>
 <CANBxJ=EHkuxKFoQw=K21o=9_FMhi_=on=Poq+ZF37eieoKV4zg@mail.gmail.com>
 <20181115145028.qijg7hjswcuabrt2@kamzik.brq.redhat.com>
 <CANBxJ=EGR=7RrO8ZtJFUwpNZRy_adjCObNtWtcMA=y4rLgeWaQ@mail.gmail.com>
 <87efbmqore.fsf@vitty.brq.redhat.com>
 <CANBxJ=FDOpySC7w1fVbWCOy+ASO=A7WcsFiDJEcGtzWbYM6NqQ@mail.gmail.com>
 <8736s1qh3d.fsf@vitty.brq.redhat.com>
Message-ID:
 <CANBxJ=FX01h6OZt=zApu6tz_enJxg_kXN+yb8_z52TzucU7H7Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181117194343.Pm5vJeRS7-bf07qEUwPc6m_c83sM4CTnLy_uFUi15kg@z>

On Fri, Nov 16, 2018@3:37 PM Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
> Ahmed Soliman <ahmedsoliman at mena.vt.edu> writes:
>
> > Hello once again,
> >
> > I noticed that there is still more problems with kvmself test (at
> > least on my machine)
> >
> > Any test that would successfully reach the guest's code immediately
> > VMexit by a shutdown.
> >
> > $ ./vmx_tsc_adjust_test
> > ==== Test Assertion Failure ====
> >  x86_64/vmx_tsc_adjust_test.c:156: run->exit_reason == KVM_EXIT_IO
> >  pid=8499 tid=8499 - Success
> >     1  0x00005604f07bd36c: ?? ??:0
> >     2  0x00007f5c0dc53ae6: ?? ??:0
> >     3  0x00005604f07bd4b9: ?? ??:0
> >  Got exit_reason other than KVM_EXIT_IO: 8 (SHUTDOWN)
> >
>
> Hm, this is weird. Do other KVM users, e.g. qemu work on this host? Are
> you sure this happens on the first VCPU_RUN invocation?

Yes and I have just tested:
   qemu-system-x86_64 -enable-kvm -cpu host,+vmx -m 2G

And Linux as well as android for x86 booted up. Also I kinda have my
kvm tests that works
but they are not built on top of kvm selftest api.

> Could you try doing
>
> trace-cmd record -e kvm  ./x86_64/vmx_tsc_adjust_test && trace-cmd report
>
> to see if there's anything suspicious?

Yes, there is a triple fault induced shutdown probably during EPT handling:

 vmx_tsc_adjust_-17638 [001] 15628.729863: kvm_update_master_clock:
masterclock 0 hostclock tsc offsetmatched 0
vmx_tsc_adjust_-17638 [001] 15628.730820: kvm_write_tsc_offset: vcpu=5
prev=0 next=18446733817569215369
vmx_tsc_adjust_-17638 [001] 15628.730822: kvm_track_tsc:
vcpu_id 5 masterclock 0 offsetmatched 0 nr_online 1 hostclock tsc
vmx_tsc_adjust_-17638 [001] 15628.730911: kvm_fpu:              load
vmx_tsc_adjust_-17638 [001] 15628.730913: kvm_update_master_clock:
masterclock 1 hostclock tsc offsetmatched 1
vmx_tsc_adjust_-17638 [001] 15628.730954: kvm_entry:            vcpu 5
vmx_tsc_adjust_-17638 [001] 15628.730974: kvm_exit:             reason
EPT_VIOLATION rip 0x56545f0b8760 info 83 0
vmx_tsc_adjust_-17638 [001] 15628.730976: kvm_page_fault:
address 180560 error_code 83
vmx_tsc_adjust_-17638 [001] 15628.730989: kvm_entry:            vcpu 5
vmx_tsc_adjust_-17638 [001] 15628.730992: kvm_exit:             reason
TRIPLE_FAULT rip 0x56545f0b8760 info 0 0
vmx_tsc_adjust_-17638 [001] 15628.730993: kvm_fpu:              unload
vmx_tsc_adjust_-17638 [001] 15628.730996: kvm_userspace_exit:   reason
KVM_EXIT_SHUTDOWN (8)
vmx_tsc_adjust_-17638 [002] 15628.739237: kvm_hv_stimer_cleanup:
vcpu_id 5 timer 0
vmx_tsc_adjust_-17638 [002] 15628.739244: kvm_hv_stimer_cleanup:
vcpu_id 5 timer 1
vmx_tsc_adjust_-17638 [002] 15628.739244: kvm_hv_stimer_cleanup:
vcpu_id 5 timer 2
vmx_tsc_adjust_-17638 [002] 15628.739245: kvm_hv_stimer_cleanup:
vcpu_id 5 timer 3

I will try to dive into them after my midterms are over(ends tomorrow)
but I would need to verify that someone else can
reproduce this, I tried bisecting but it seams that this bug was there
from kvmselftests commit one
(rebuilt kernel, kvm and the kvm selftests each time).

Thanks,
