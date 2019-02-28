From: joel at joelfernandes.org (Joel Fernandes)
Date: Thu, 28 Feb 2019 10:37:41 -0500
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228153026.GG8481@kroah.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228173444.54403795211d80ba540b61cb@kernel.org>
 <20190228150054.GB156098@google.com>
 <20190228153026.GG8481@kroah.com>
Message-ID: <20190228153741.GA168373@google.com>

On Thu, Feb 28, 2019 at 04:30:26PM +0100, Greg KH wrote:
> On Thu, Feb 28, 2019 at 10:00:54AM -0500, Joel Fernandes wrote:
> > > Hmm, isn't it easier to add kernel-headers package on Android?
> > 
> > I have already been down that road. In the Android ecosystem, the Android
> > teams only provide a "userspace system image" which goes on the system
> > partition of the flash (and a couple other images are also provided but
> > system is the main one). The system image cannot contain GPL source code.
> 
> Note, that last sentance is not true, it can contain whatever license
> code it wants to, as long as the group doing the distribution abides by
> the license of the code contained in it.
> 
> The split of system and other images has nothing to do with license
> issues, but rather functional requirements.  There _might_ be GPL
> licensed code in the image if it meets a requirement for the proper
> functionality of the system, you never know :)

I am not a lawyer either but I know I tried to convince people to allow
headers (GPL sources) on the system image for this same reason and was told
that is not something allowed (allowed can also mean "people are Ok with").

In any case, it is not practical to provide headers for every kernel version on
the system image and maintain them, it will take up too much space and has to
be periodically packaged. Not to mention that there will be kernel versions
that are booting Android that simply don't have anyone maintaining headers
for. So the proposed solution is an easier path.

thanks,

 - Joel

> 
> thanks,
> 
> greg "not a lawyer but I work with a lot of them all the time" k-h
