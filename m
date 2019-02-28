From: gregkh at linuxfoundation.org (Greg KH)
Date: Thu, 28 Feb 2019 16:30:26 +0100
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228150054.GB156098@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228173444.54403795211d80ba540b61cb@kernel.org>
 <20190228150054.GB156098@google.com>
Message-ID: <20190228153026.GG8481@kroah.com>

On Thu, Feb 28, 2019 at 10:00:54AM -0500, Joel Fernandes wrote:
> > Hmm, isn't it easier to add kernel-headers package on Android?
> 
> I have already been down that road. In the Android ecosystem, the Android
> teams only provide a "userspace system image" which goes on the system
> partition of the flash (and a couple other images are also provided but
> system is the main one). The system image cannot contain GPL source code.

Note, that last sentance is not true, it can contain whatever license
code it wants to, as long as the group doing the distribution abides by
the license of the code contained in it.

The split of system and other images has nothing to do with license
issues, but rather functional requirements.  There _might_ be GPL
licensed code in the image if it meets a requirement for the proper
functionality of the system, you never know :)

thanks,

greg "not a lawyer but I work with a lot of them all the time" k-h
