From: frowand.list@gmail.com (Frank Rowand)
Date: Wed, 8 May 2019 19:18:30 -0700
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20190509014407.GA7031@mit.edu>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com> <20190507172256.GB5900@mit.edu>
 <4d963cdc-1cbb-35a3-292c-552f865ed1f7@gmail.com>
 <20190509014407.GA7031@mit.edu>
Message-ID: <458dcb03-8dee-a005-97e1-7296a9e5bbfd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190509021830.oNaH8D4GXWvol1mRX5uaXQwTKfvammtUiijHkYVpoo8@z>

On 5/8/19 6:44 PM, Theodore Ts'o wrote:
> On Wed, May 08, 2019@05:58:49PM -0700, Frank Rowand wrote:
>>
>> If KUnit is added to the kernel, and a subsystem that I am submitting
>> code for has chosen to use KUnit instead of kselftest, then yes, I do
>> *have* to use KUnit if my submission needs to contain a test for the
>> code unless I want to convince the maintainer that somehow my case
>> is special and I prefer to use kselftest instead of KUnittest.
> 
> That's going to be between you and the maintainer.  Today, if you want
> to submit a substantive change to xfs or ext4, you're going to be
> asked to create test for that new feature using xfstests.  It doesn't
> matter that xfstests isn't in the kernel --- if that's what is
> required by the maintainer.

Yes, that is exactly what I was saying.

Please do not cut the pertinent parts of context that I am replying to.


>>> supposed to be a simple way to run a large number of small tests that
>>> for specific small components in a system.
>>
>> kselftest also supports running a subset of tests.  That subset of tests
>> can also be a large number of small tests.  There is nothing inherent
>> in KUnit vs kselftest in this regard, as far as I am aware.


> The big difference is that kselftests are driven by a C program that
> runs in userspace.  Take a look at tools/testing/selftests/filesystem/dnotify_test.c
> it has a main(int argc, char *argv) function.
> 
> In contrast, KUnit are fragments of C code which run in the kernel;
> not in userspace.  This allows us to test internal functions inside
> complex file system (such as the block allocator in ext4) directly.
> This makes it *fundamentally* different from kselftest.

No, totally incorrect.  kselftests also supports in kernel modules as
I mention in another reply to this patch.

This is talking past each other a little bit, because your next reply
is a reply to my email about modules.

-Frank

> 
> Cheers,
> 
> 						- Ted
> 
