From: vincenzo.frascino@arm.com (Vincenzo Frascino)
Date: Mon, 10 Jun 2019 11:19:15 +0100
Subject: [PATCH v6 03/19] kernel: Unify update_vsyscall implementation
In-Reply-To: <20190610093447.GC11076@merlot.physics.ox.ac.uk>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-4-vincenzo.frascino@arm.com>
 <20190610093447.GC11076@merlot.physics.ox.ac.uk>
Message-ID: <90329b94-6cac-63dd-acad-a04c0d283a83@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190610101915.2U5nkquDcOYBdrDYcfczGLwmP8f0D4aFs9SdzZGwn9Q@z>

On 10/06/2019 10:34, Huw Davies wrote:
> On Thu, May 30, 2019@03:15:15PM +0100, Vincenzo Frascino wrote:
>> With the definition of the unified vDSO library the implementations of
>> update_vsyscall and update_vsyscall_tz became quite similar across
>> architectures.
>>
>> Define a unified implementation of this two functions in kernel/vdso and
> 
> ... of these two functions ...

Thanks for this, I will fix in v7.

> 
>> provide the bindings that can be implemented by every architecture that
>> takes advantage of the unified vDSO library.

-- 
Regards,
Vincenzo
