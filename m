From: frowand.list@gmail.com (Frank Rowand)
Date: Fri, 10 May 2019 14:12:40 -0700
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20190509214233.GA20877@mit.edu>
References: <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
Message-ID: <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190510211240.1O3bg03Ns54GXgs1RISwhspzP5pR-tdHg2Tg1sBji2M@z>

On 5/9/19 2:42 PM, Theodore Ts'o wrote:
> On Thu, May 09, 2019@11:12:12AM -0700, Frank Rowand wrote:
>>
>>    "My understanding is that the intent of KUnit is to avoid booting a kernel on
>>    real hardware or in a virtual machine.  That seems to be a matter of semantics
>>    to me because isn't invoking a UML Linux just running the Linux kernel in
>>    a different form of virtualization?
>>
>>    So I do not understand why KUnit is an improvement over kselftest.
>>
>>    ...
>>
>>    What am I missing?"
> 
> One major difference: kselftest requires a userspace environment; it
> starts systemd, requires a root file system from which you can load
> modules, etc.  Kunit doesn't require a root file system; doesn't
> require that you start systemd; doesn't allow you to run arbitrary
> perl, python, bash, etc. scripts.  As such, it's much lighter weight
> than kselftest, and will have much less overhead before you can start
> running tests.  So it's not really the same kind of virtualization.
> 
> Does this help?
> 
> 					- Ted
> 

I'm back to reply to this subthread, after a delay, as promised.

That is the type of information that I was looking for, so
thank you for the reply.

However, the reply is incorrect.  Kselftest in-kernel tests (which
is the context here) can be configured as built in instead of as
a module, and built in a UML kernel.  The UML kernel can boot,
running the in-kernel tests before UML attempts to invoke the
init process.

No userspace environment needed.  So exactly the same overhead
as KUnit when invoked in that manner.
