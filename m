From: drjones at redhat.com (Andrew Jones)
Date: Thu, 15 Nov 2018 10:02:03 +0100
Subject: KVM selftests are failing
In-Reply-To: <CANBxJ=EB8izWM8iLd49Uvd1z1O-gLvkGmiKNHjfHifFohj2xbg@mail.gmail.com>
References: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
 <20181114180807.6crs7awhvo26ldbr@hawk.localdomain>
 <CADYN=9Jh10guVNFfhS8XH+RwZAouLJQu7Svg4+Tz3rQDexzDkg@mail.gmail.com>
 <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>
 <CANBxJ=EB8izWM8iLd49Uvd1z1O-gLvkGmiKNHjfHifFohj2xbg@mail.gmail.com>
Message-ID: <20181115090203.5z25gwa2yznj6mmu@kamzik.brq.redhat.com>

On Wed, Nov 14, 2018 at 11:29:59PM +0200, Ahmed Soliman wrote:
> Hello again,
> On Wed, Nov 14, 2018 at 9:23 PM Ahmed Soliman <ahmedsoliman at mena.vt.edu> wrote:
> > I don't do a make clean normally, but I will do it this time when
> > bisecting, also I only use shallow
> >  clones so it will also take some time pulling. Also to note, The arch
> > I am using is Haswell, I am not
> > sure if that should make any difference though.
> 
> I started bisecting from commit 783e9e51266ebb7f78c606a53cb0fa41bb7c31a0
> which introduces kvm selftests. I started from complete clean kernel build and
> run, but unfortunately, I got the Assert there too.

I think you should be able to pre-compile the selftests and save them,
and then bisect the kernel further back than their introduction. Actually
you may want to simplify the test case to just a mmap/madvise pair and
see if that reproduces, since kvm selftests doesn't do much more than
that. (Other than all the /dev/kvm ioctls - you have the right perms
on /dev/kvm, or are running as root, right?)

Thanks,
drew
