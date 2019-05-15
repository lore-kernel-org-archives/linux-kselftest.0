From: frowand.list@gmail.com (Frank Rowand)
Date: Tue, 14 May 2019 17:26:47 -0700
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20190511173344.GA8507@mit.edu>
References: <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
Message-ID: <a305c732-9953-8724-b4a4-25aa50c89365@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190515002647.ckvS9ngsUKizxPQeLjEZz2ID1R4vWjDh277uVCA6s9c@z>

On 5/11/19 10:33 AM, Theodore Ts'o wrote:
> On Fri, May 10, 2019@02:12:40PM -0700, Frank Rowand wrote:
>> However, the reply is incorrect.  Kselftest in-kernel tests (which
>> is the context here) can be configured as built in instead of as
>> a module, and built in a UML kernel.  The UML kernel can boot,
>> running the in-kernel tests before UML attempts to invoke the
>> init process.
> 
> Um, Citation needed?

The paragraph that you quoted tells you exactly how to run a kselftest
in-kernel test in a UML kernel.  Just to what that paragraph says.


> 
> I don't see any evidence for this in the kselftest documentation, nor
> do I see any evidence of this in the kselftest Makefiles.
> 
> There exists test modules in the kernel that run before the init
> scripts run --- but that's not strictly speaking part of kselftests,
> and do not have any kind of infrastructure.  As noted, the
> kselftests_harness header file fundamentally assumes that you are
> running test code in userspace.

You are ignoring the kselftest in-kernel tests.

We are talking in circles.  I'm done with this thread.

-Frank

> 
> 				- Ted
> .
> 
