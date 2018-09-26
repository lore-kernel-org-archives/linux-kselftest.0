From: 0x7f454c46 at gmail.com (Dmitry Safonov)
Date: Wed, 26 Sep 2018 18:59:49 +0100
Subject: [RFC 00/20] ns: Introduce Time Namespace
In-Reply-To: <87zhw4rwiq.fsf@xmission.com>
References: <20180919205037.9574-1-dima@arista.com>
 <874lej6nny.fsf@xmission.com>
 <20180924205119.GA14833@outlook.office365.com> <874leezh8n.fsf@xmission.com>
 <20180925014150.GA6302@outlook.office365.com> <87zhw4rwiq.fsf@xmission.com>
Message-ID: <CAJwJo6bseG42YNqA0cxWpB0C252_CWER0gDrF0OUOm+=DJ7XdQ@mail.gmail.com>

2018-09-26 18:36 GMT+01:00 Eric W. Biederman <ebiederm at xmission.com>:
> The advantage of timekeeping_update per time namespace is that it allows
> different lengths of seconds per time namespace.  Which allows testing
> ntp and the kernel in interesting ways while still having a working
> production configuration on the same system.

Just a quick note: the different length of second per namespace sounds
very interesting in my POV, I remember I've seen this article:
http://publish.illinois.edu/science-of-security-lablet/files/2014/05/DSSnet-A-Smart-Grid-Modeling-Platform-Combining-Electrical-Power-Distributtion-System-Simulation-and-Software-Defined-Networking-Emulation.pdf

And their realisation with a simulation of time going with different speed
per-pid  (with vdso disabled):
https://github.com/littlepretty/VirtualTimeKernel

Thanks,
             Dmitry
