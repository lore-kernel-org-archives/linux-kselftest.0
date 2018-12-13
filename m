From: shuah at kernel.org (shuah)
Date: Thu, 13 Dec 2018 15:50:01 -0700
Subject: [PATCH] selftests: Fix test errors related to lib.mk khdr target
In-Reply-To: <623cdf7b-fc3c-2a93-c61a-a043e3d7f75b@redhat.com>
References: <20181213200011.10779-1-shuah@kernel.org>
 <623cdf7b-fc3c-2a93-c61a-a043e3d7f75b@redhat.com>
Message-ID: <25593aa4-a2a7-6567-11f2-b702b6e5563c@kernel.org>

On 12/13/18 3:40 PM, Paolo Bonzini wrote:
> On 13/12/18 21:00, shuah at kernel.org wrote:
>> From: Shuah Khan <shuah at kernel.org>
>>
>> Commit b2d35fa5fc80 ("selftests: add headers_install to lib.mk") added
>> khdr target to run headers_install target from the main Makefile. The
>> logic uses KSFT_KHDR_INSTALL and top_srcdir as controls to initialize
>> variables and include files to run headers_install from the top level
>> Makefile. There are a few problems with this logic.
>>
>> 1. Exposes top_srcdir to all tests
>> 2. Common logic impacts all tests
>> 3. Uses KSFT_KHDR_INSTALL, top_srcdir, and khdr in an adhoc way. Tests
>>     add "khdr" dependency in their Makefiles to TEST_PROGS_EXTENDED in
>>     some cases, and STATIC_LIBS in other cases. This makes this framework
>>     confusing to use.
>>
>> The common logic that runs for all tests even when KSFT_KHDR_INSTALL
>> isn't defined by the test. top_srcdir is initialized to a default value
>> when test doesn't initialize it. It works for all tests without a sub-dir
>> structure and tests with sub-dir structure fail to build.
>>
>> e.g: make -C sparc64/drivers/ or make -C drivers/dma-buf
>>
>> ../../lib.mk:20: ../../../../scripts/subarch.include: No such file or directory
>> make: *** No rule to make target '../../../../scripts/subarch.include'.  Stop.
>>
>> There is no reason to require all tests to define top_srcdir and there is
>> no need to require tests to add khdr dependency using adhoc changes to
>> TEST_* and other variables.
>>
>> Fix it with a consistent use of KSFT_KHDR_INSTALL and top_srcdir from tests
>> that have the dependency on headers_install.
>>
>> Change common logic to include khdr target define and "all" target with
>> dependency on khdr when KSFT_KHDR_INSTALL is defined.
>>
>> Only tests that have dependency on headers_install have to define just
>> the KSFT_KHDR_INSTALL, and top_srcdir variables and there is no need to
>> specify khdr dependency in the test Makefiles.
> 
> Looks good.  Could you please provide a topic branch so that we can
> avoid conflicts between our trees at the next merge window.
> 

Thanks. The topic branch is

git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next

I will apply it in a day or two to get ready for the merge window.

thanks,
-- Shuah
