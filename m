From: huw at codeweavers.com (Huw Davies)
Date: Mon, 10 Jun 2019 10:34:47 +0100
Subject: [PATCH v6 03/19] kernel: Unify update_vsyscall implementation
In-Reply-To: <20190530141531.43462-4-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-4-vincenzo.frascino@arm.com>
Message-ID: <20190610093447.GC11076@merlot.physics.ox.ac.uk>

On Thu, May 30, 2019 at 03:15:15PM +0100, Vincenzo Frascino wrote:
> With the definition of the unified vDSO library the implementations of
> update_vsyscall and update_vsyscall_tz became quite similar across
> architectures.
> 
> Define a unified implementation of this two functions in kernel/vdso and

... of these two functions ...

> provide the bindings that can be implemented by every architecture that
> takes advantage of the unified vDSO library.
