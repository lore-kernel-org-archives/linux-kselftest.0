From: drjones at redhat.com (Andrew Jones)
Date: Thu, 15 Nov 2018 15:50:28 +0100
Subject: KVM selftests are failing
In-Reply-To: <CANBxJ=EHkuxKFoQw=K21o=9_FMhi_=on=Poq+ZF37eieoKV4zg@mail.gmail.com>
References: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
 <20181114180807.6crs7awhvo26ldbr@hawk.localdomain>
 <CADYN=9Jh10guVNFfhS8XH+RwZAouLJQu7Svg4+Tz3rQDexzDkg@mail.gmail.com>
 <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>
 <CANBxJ=EB8izWM8iLd49Uvd1z1O-gLvkGmiKNHjfHifFohj2xbg@mail.gmail.com>
 <20181115090203.5z25gwa2yznj6mmu@kamzik.brq.redhat.com>
 <CANBxJ=EHkuxKFoQw=K21o=9_FMhi_=on=Poq+ZF37eieoKV4zg@mail.gmail.com>
Message-ID: <20181115145028.qijg7hjswcuabrt2@kamzik.brq.redhat.com>

On Thu, Nov 15, 2018 at 03:36:44PM +0200, Ahmed Soliman wrote:
> mmap(NULL, 6291456, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
> -1, 0) = 0x7f46ea2a1000
> madvise(0x7f46ea2a1000, 6291456, MADV_NOHUGEPAGE) = -1 EINVAL (Invalid argument)
> 
> For comprehension, this is done on intel core i7-4500U CPU @ 1.80GHz

Argh. I see what it is. Your config doesn't have CONFIG_TRANSPARENT_HUGEPAGE=y,
so madvise_behavior_valid() returns false, which causes madvise() to
immediately return EINVAL. We should be more careful in kvm selftests with
our madvise behavior use.

> 
> As for now I will comment the madvise line and the assert when writing
> my own kvm self test. I think it wouldn't cause any trouble?, If it is
> not the case, please let me know.
> 

You may not need madvise() at all for your test, depending on what you're
doing. So leaving it out may be fine. Reworking kvm selftests to ensure
only valid madvise behaviors are used (and only when necessary), before
adding new tests, would be best.

Thanks,
drew
