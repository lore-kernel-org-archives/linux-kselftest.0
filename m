From: anton.ivanov@cambridgegreys.com (Anton Ivanov)
Date: Wed, 5 Dec 2018 13:15:28 +0000
Subject: [RFC v3 01/19] kunit: test: add KUnit test runner core
In-Reply-To: <20181130031438.GQ4922@garbanzo.do-not-panic.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-2-brendanhiggins@google.com>
 <20181130031438.GQ4922@garbanzo.do-not-panic.com>
Message-ID: <e2ed9df2-c06b-f0d3-d50a-d03166f586df@cambridgegreys.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181205131528.oEPawcEn52o-fox3uBcQTM10YFzNBTh1DmA7WIDmJew@z>

On 30/11/2018 03:14, Luis Chamberlain wrote:
> On Wed, Nov 28, 2018@11:36:18AM -0800, Brendan Higgins wrote:
>> +#define module_test(module) \
>> +		static int module_kunit_init##module(void) \
>> +		{ \
>> +			return kunit_run_tests(&module); \
>> +		} \
>> +		late_initcall(module_kunit_init##module)
> Here in lies an assumption that suffices. I'm inclined to believe we
> need new initcall level here so to ensure we *do* run after all the
> respective kernels iniut calls. Otherwise we're left at the whims of
> link order for kunit. For instance if a kunit test relies on frameworks
> which are also late_initcall() we'd have complete incompatibility with
> anything linked *after* kunit.
>
>> diff --git a/kunit/Kconfig b/kunit/Kconfig
>> new file mode 100644
>> index 0000000000000..49b44c4f6630a
>> --- /dev/null
>> +++ b/kunit/Kconfig
>> @@ -0,0 +1,17 @@
>> +#
>> +# KUnit base configuration
>> +#
>> +
>> +menu "KUnit support"
>> +
>> +config KUNIT
>> +	bool "Enable support for unit tests (KUnit)"
>> +	depends on UML
> Consider using:
>
> if UML
>     ...
> endif
>
> That allows the depends to be done once.
>
>> +	help
>> +	  Enables support for kernel unit tests (KUnit), a lightweight unit
>> +	  testing and mocking framework for the Linux kernel. These tests are
>> +	  able to be run locally on a developer's workstation without a VM or
>> +	  special hardware.
>
> Some mention of UML may be good here?
>
>> For more information, please see
>> +	  Documentation/kunit/
>> +
>> +endmenu
> I'm a bit conflicted here. This currently depends on UML but yet you
> noted on RFC v2 that your intention is to liberate kunit from UML and
> ideally allow unit tests to depend only on userspace. I've addressed
> tests using both selftests kernels drivers and also re-written kernel
> APIs to userspace to test there. I think we may need to live with both.
>
> Then for the UML stuff, I think if we *really* accept that UML will
> always be a viable option we should probably consider now throwing these
> things under drivers/platform/uml/. This follows the pattern of arch
> specific drivers. Whether or not we end up with a complete userspace

UML platform drivers predate that and are under arch/um/drivers/

We should either keep to current convention or consider relocating the 
existing ones - having things spread in different places around the tree 
is not good in the long run (UML already has a few of those under the 
x86 tree, let's not increase the number).

> component independent of UML may implicate having a shared component
> somewhere else.
>
> Likewise, I realize the goal is to *avoid* using a virtual machine for
> these tests, but would it in any way make sense to share kunit to be
> supported for other architectures to allow easier-to-write tests as
> well?
>
>    Luis
>
> _______________________________________________
> linux-um mailing list
> linux-um at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-um
>

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
