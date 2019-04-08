From: karim.yaghmour at opersys.com (Karim Yaghmour)
Date: Mon, 8 Apr 2019 16:52:18 -0400
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
Message-ID: <79b6bdbc-890a-5a51-7fa1-aec57889046a@opersys.com>


Hi Olof,

On 4/8/19 12:29 PM, Olof Johansson wrote:
> Sorry to be late at the party with this kind of feedback, but I find
> the whole ".tar.gz in procfs" to be an awkward solution, especially if
> there's expected to be userspace tooling that depends on this
> long-term.
> 
> Wouldn't it be more convenient to provide it in a standardized format
> such that you won't have to take an additional step, and always have
> it in a known location?
> 
> Something like:
> 
>   - Pseudo-filesystem, that can just be mounted under
> /sys/kernel/headers or something (similar to debugfs or
> /proc/device-tree).
>   - Exporting something like a squashfs image instead, allowing
> loopback mounting of it (or by providing a pseudo-/dev entry for it),
> again allowing direct export of the contents and avoiding the
> extracted directory from being out of sync with currently running
> kernel.
> 
> Having to copy and extract the tarball is the most awkward step, IMHO.
> I also find the waste of kernel memory for it to be an issue, but
> given that it can be built as a module I guess that's the obvious
> solution for those who care about memory consumption.

One of the things I pointed out earlier in the thread is that 
/proc/config.gz has already set a precedent as to the interface for this 
sort of artifact. It's a plain compressed file and it's directly 
accessible from toplevel /proc. From a consistency perspective there's 
an idiomatic angle to some sort of "/proc/kheaders.gz".

In some offline discussions I was also told that squashfs (I'm no expert 
of it) required special user-space tools and had some security issues.

Cheers,

-- 
Karim Yaghmour
CEO - Opersys inc. / www.opersys.com
http://twitter.com/karimyaghmour
