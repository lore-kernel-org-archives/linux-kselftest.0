From: davem at redhat.com (David Miller)
Date: Fri, 15 Jun 2018 09:41:45 -0700 (PDT)
Subject: [PATCH] selftests: sparc64: Fix to do nothing on non-sparc64
In-Reply-To: <d8ec82b2-a27a-7a7a-9d8a-b3b937e8e959@kernel.org>
References: <20180612232348.27979-1-shuah@kernel.org>
 <d6a1ce6d-4903-ec7a-10aa-d40118fce45c@oracle.com>
 <d8ec82b2-a27a-7a7a-9d8a-b3b937e8e959@kernel.org>
Message-ID: <20180615.094145.334438195653112696.davem@redhat.com>

From: Shuah Khan <shuah at kernel.org>
Date: Fri, 15 Jun 2018 10:33:21 -0600

> On 06/13/2018 11:20 AM, Tom Hromatka wrote:
>> Thanks, Shuah!
>> 
>> Tom
>> 
>> 
>> On 06/12/2018 05:23 PM, Shuah Khan (Samsung OSG) wrote:
>>> sparc64 test fails with the following errors on non-sparc64 systems. Fix
>>> the Makefile to do nothing on non-sparc64 systems to suppress the errors:
>>>
>>> make run_tests
>>> adi-test.c: Assembler messages:
>>> adi-test.c:302: Error: no such instruction: `rd %tick,%r13'
>>> adi-test.c:304: Error: no such instruction: `rd %tick,%rbp'
>>> adi-test.c:190: Error: no such instruction: `rd %tick,%rbp'
>>> adi-test.c:192: Error: no such instruction: `rd %tick,%rdx'
>>> adi-test.c:273: Error: no such instruction: `rd %tick,%rbx'
>>> adi-test.c:276: Error: no such instruction: `rd %tick,%rdx'
>>> adi-test.c:217: Error: no such instruction: `rd %tick,%rbp'
>>> adi-test.c:220: Error: no such instruction: `rd %tick,%rdx'
>>> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
>>> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
>>> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
>>> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
>>> adi-test.c:246: Error: no such instruction: `rd %tick,%rbp'
>>> adi-test.c:248: Error: no such instruction: `rd %tick,%rdx'
>>> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
>>> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
>>> adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
>>> <builtin>: recipe for target 'adi-test' failed
>>> make[1]: *** [adi-test] Error 1
>>> adi: [FAIL]
>>> ./drivers_test.sh: 24: ./drivers_test.sh: ./adi-test: not found
>>> ../lib.mk:73: recipe for target 'run_tests' failed
>>> make: *** [run_tests] Error 1
>>>
>>> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
>> 
>> Reviewed-by: Tom Hromatka <tom.hromatka at oracle.com>
>> 
> 
> get_maintainers didn't include your name for this patch. Would you like to
> take this fix through sparc tree? It would be good to get this in for
> 4.18-rc2
> 
> If so, please let me know if you would like me to resend the patch
> with Tom's Reviewed-by tag.

I'm very busy, so this time could you merge this for me?  Thanks!

Acked-by: David S. Miller <davem at davemloft.net>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
