From: thuth@redhat.com (Thomas Huth)
Date: Fri, 17 May 2019 12:07:18 +0200
Subject: [PATCH v2] KVM: selftests: Compile code with warnings enabled
In-Reply-To: <8736ldquyw.fsf@vitty.brq.redhat.com>
References: <20190517090445.4502-1-thuth@redhat.com>
 <20190517093000.GO16681@xz-x1> <8736ldquyw.fsf@vitty.brq.redhat.com>
Message-ID: <1834df0f-b377-2231-0e5c-c5acd3298973@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190517100718.7IoR5cwNesykh8NY4VF19rfaEmquHShh9ElyacwcS-4@z>

On 17/05/2019 11.41, Vitaly Kuznetsov wrote:
> Peter Xu <peterx at redhat.com> writes:
> 
>> On Fri, May 17, 2019@11:04:45AM +0200, Thomas Huth wrote:
>>> So far the KVM selftests are compiled without any compiler warnings
>>> enabled. That's quite bad, since we miss a lot of possible bugs this
>>> way. Let's enable at least "-Wall" and some other useful warning flags
>>> now, and fix at least the trivial problems in the code (like unused
>>> variables).
>>>
>>> Signed-off-by: Thomas Huth <thuth at redhat.com>
>>> ---
>>>  v2:
>>>  - Rebased to kvm/queue
>>>  - Fix warnings in state_test.c and evmcs_test.c, too
>>
>> I still see these warnings (probably because the hyperv_cpuid.c is a
>> new test):
>>
>> In file included from x86_64/hyperv_cpuid.c:18:
>> x86_64/hyperv_cpuid.c: In function ‘test_hv_cpuid’:
>> x86_64/hyperv_cpuid.c:61:33: warning: suggest parentheses around comparison in operand of ‘==’ [-Wparentheses]
>>    TEST_ASSERT(entry->padding[0] == entry->padding[1]
>>                ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
>> include/test_util.h:32:15: note: in definition of macro ‘TEST_ASSERT’
>>   test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
>>                ^
>> x86_64/hyperv_cpuid.c:62:8: warning: suggest parentheses around comparison in operand of ‘==’ [-Wparentheses]
>>    TEST_ASSERT(entry->padding[0] == entry->padding[1]
>>                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>         == entry->padding[2] == 0,
>>         ^~~~~~~~~~~~~~~~~~~~
>> include/test_util.h:32:15: note: in definition of macro ‘TEST_ASSERT’
>>   test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
> 
> There's a fix from Dan Carpenter on the list:
> https://marc.info/?l=kernel-janitors&m=155783012012532&w=2

Right, that fix should preferably be committed first.

>> x86_64/hyperv_cpuid.c: In function ‘kvm_get_supported_hv_cpuid’:
>> x86_64/hyperv_cpuid.c:93:6: warning: unused variable ‘ret’ [-Wunused-variable]
>>   int ret;
>>       ^~~

... but I obviously missed this one here again :-/

There are also these compiler warnings left:

lib/ucall.c: In function ‘get_ucall’:
lib/ucall.c:145:3: warning: dereferencing type-punned pointer will break
strict-aliasing rules [-Wstrict-aliasing]
   gva = *(vm_vaddr_t *)run->mmio.data;

x86_64/vmx_set_nested_state_test.c: In function
‘set_revision_id_for_vmcs12’:
x86_64/vmx_set_nested_state_test.c:78:2: warning: dereferencing
type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
  *(u32 *)(state->data) = vmcs12_revision;

... how do we want to handle such spots in the kvm selftest code?
Compile with -fno-strict-aliasing? Or fix it with type-punning through
unions?

 Thomas
