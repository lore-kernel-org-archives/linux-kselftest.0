From: ahmedsoliman at mena.vt.edu (Ahmed Soliman)
Date: Fri, 16 Nov 2018 14:00:08 +0200
Subject: KVM selftests are failing
In-Reply-To: <87efbmqore.fsf@vitty.brq.redhat.com>
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
Message-ID: <CANBxJ=FDOpySC7w1fVbWCOy+ASO=A7WcsFiDJEcGtzWbYM6NqQ@mail.gmail.com>

Hello once again,

I noticed that there is still more problems with kvmself test (at
least on my machine)

Any test that would successfully reach the guest's code immediately
VMexit by a shutdown.

$ ./vmx_tsc_adjust_test
==== Test Assertion Failure ====
 x86_64/vmx_tsc_adjust_test.c:156: run->exit_reason == KVM_EXIT_IO
 pid=8499 tid=8499 - Success
    1  0x00005604f07bd36c: ?? ??:0
    2  0x00007f5c0dc53ae6: ?? ??:0
    3  0x00005604f07bd4b9: ?? ??:0
 Got exit_reason other than KVM_EXIT_IO: 8 (SHUTDOWN)

Also I have got a question I noticed 2 kvm test suites, kvm selftests
in tools/testing/selftests/kvm/
and this kvm unit test at [1] I am curious if I should put my tests in
the kvm unit test intead of kvm selftest


-- links --
[1] https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git

Thanks
Ahmed,
