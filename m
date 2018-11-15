From: drjones@redhat.com (Andrew Jones)
Date: Thu, 15 Nov 2018 09:41:38 +0100
Subject: KVM selftests are failing
In-Reply-To: <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>
References: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
 <20181114180807.6crs7awhvo26ldbr@hawk.localdomain>
 <CADYN=9Jh10guVNFfhS8XH+RwZAouLJQu7Svg4+Tz3rQDexzDkg@mail.gmail.com>
 <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>
Message-ID: <20181115084138.m7oflwso6f72tgsx@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181115084138.BwQLkh_HtpOKD4qbUMJTUYU4koWsBtz2ruaJi0L3oaw@z>

On Wed, Nov 14, 2018@09:23:41PM +0200, Ahmed Soliman wrote:
> Hello,
> 
> > > I couldn't reproduce this on a Westmere. Are you sure you're testing
> > > a clean compilation? Can you bisect the kernel?
> I don't do a make clean normally, but I will do it this time when
> bisecting,

Sorry, I meant a clean build of the kvm selftests, not the kernel. The
kvm selftests makefile is a bit lacking and I've noticed that tests can
assert in random places if they aren't built from scratch - ensuring all
changed dependencies also get recompiled. Fixing up the makefile is on
my todo, but it wasn't very high on it, since 'make clean && make' is
fast enough.

> also I only use shallow
>  clones so it will also take some time pulling. Also to note, The arch
> I am using is Haswell, I am not
> sure if that should make any difference though.

I'm not sure either, and unfortunately I don't have the same hardware
as you to try and reproduce.

> > What would be the difference in CONFIG_* fragments that you both have enabled?
> 
> Here is my config file:
> https://pastebin.com/fCNV2z8c

I checked the differences but nothing interesting stood out. I'm using a
defconfig config with a couple extra file system modules tacked on.

drew
