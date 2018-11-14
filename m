From: ahmedsoliman at mena.vt.edu (Ahmed Soliman)
Date: Wed, 14 Nov 2018 21:23:41 +0200
Subject: KVM selftests are failing
In-Reply-To: <CADYN=9Jh10guVNFfhS8XH+RwZAouLJQu7Svg4+Tz3rQDexzDkg@mail.gmail.com>
References: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
 <20181114180807.6crs7awhvo26ldbr@hawk.localdomain>
 <CADYN=9Jh10guVNFfhS8XH+RwZAouLJQu7Svg4+Tz3rQDexzDkg@mail.gmail.com>
Message-ID: <CANBxJ=G4xdF8ZOR4zyoX1edNa=jYxk1xrzoi+7Xgcqt9qDoM2w@mail.gmail.com>

Hello,

> > I couldn't reproduce this on a Westmere. Are you sure you're testing
> > a clean compilation? Can you bisect the kernel?
I don't do a make clean normally, but I will do it this time when
bisecting, also I only use shallow
 clones so it will also take some time pulling. Also to note, The arch
I am using is Haswell, I am not
sure if that should make any difference though.
> What would be the difference in CONFIG_* fragments that you both have enabled?

Here is my config file:
https://pastebin.com/fCNV2z8c

Thanks,
-- 
Ahmed,
Junior Researcher, IoT and Cyber Security lab, SmartCI, Alexandria
University, & CIS @  VMI
