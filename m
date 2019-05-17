From: peterx at redhat.com (Peter Xu)
Date: Fri, 17 May 2019 17:30:00 +0800
Subject: [PATCH v2] KVM: selftests: Compile code with warnings enabled
In-Reply-To: <20190517090445.4502-1-thuth@redhat.com>
References: <20190517090445.4502-1-thuth@redhat.com>
Message-ID: <20190517093000.GO16681@xz-x1>

On Fri, May 17, 2019 at 11:04:45AM +0200, Thomas Huth wrote:
> So far the KVM selftests are compiled without any compiler warnings
> enabled. That's quite bad, since we miss a lot of possible bugs this
> way. Let's enable at least "-Wall" and some other useful warning flags
> now, and fix at least the trivial problems in the code (like unused
> variables).
> 
> Signed-off-by: Thomas Huth <thuth at redhat.com>
> ---
>  v2:
>  - Rebased to kvm/queue
>  - Fix warnings in state_test.c and evmcs_test.c, too

I still see these warnings (probably because the hyperv_cpuid.c is a
new test):

In file included from x86_64/hyperv_cpuid.c:18:
x86_64/hyperv_cpuid.c: In function ‘test_hv_cpuid’:
x86_64/hyperv_cpuid.c:61:33: warning: suggest parentheses around comparison in operand of ‘==’ [-Wparentheses]
   TEST_ASSERT(entry->padding[0] == entry->padding[1]
               ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
include/test_util.h:32:15: note: in definition of macro ‘TEST_ASSERT’
  test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
               ^
x86_64/hyperv_cpuid.c:62:8: warning: suggest parentheses around comparison in operand of ‘==’ [-Wparentheses]
   TEST_ASSERT(entry->padding[0] == entry->padding[1]
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        == entry->padding[2] == 0,
        ^~~~~~~~~~~~~~~~~~~~
include/test_util.h:32:15: note: in definition of macro ‘TEST_ASSERT’
  test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
               ^
x86_64/hyperv_cpuid.c: In function ‘kvm_get_supported_hv_cpuid’:
x86_64/hyperv_cpuid.c:93:6: warning: unused variable ‘ret’ [-Wunused-variable]
  int ret;
      ^~~

The first two seem to be real bugs in the test code, and the 3rd one
might need a cleanup too.

Thanks,

-- 
Peter Xu
