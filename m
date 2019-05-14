From: vkuznets at redhat.com (Vitaly Kuznetsov)
Date: Tue, 14 May 2019 09:22:56 -0400
Subject: [PATCH] KVM: selftests: Fix a condition in test_hv_cpuid()
In-Reply-To: <20190514103451.GA1694@mwanda>
References: <20190514103451.GA1694@mwanda>
Message-ID: <87lfz9npan.fsf@vitty.brq.redhat.com>

Dan Carpenter <dan.carpenter at oracle.com> writes:

> The code is trying to check that all the padding is zeroed out and it
> does this:
>
>     entry->padding[0] == entry->padding[1] == entry->padding[2] == 0
>
> Assume everything is zeroed correctly, then the first comparison is
> true, the next comparison is false and false is equal to zero so the
> overall condition is true.  This bug doesn't affect run time very
> badly, but the code should instead just check that all three paddings
> are zero individually.
>
> Also the error message was copy and pasted from an earlier error and it
> wasn't correct.
>
> Fixes: 7edcb7343327 ("KVM: selftests: Add hyperv_cpuid test")
> Signed-off-by: Dan Carpenter <dan.carpenter at oracle.com>
> ---
>  tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c b/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
> index 9a21e912097c..63b9fc3fdfbe 100644
> --- a/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
> +++ b/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
> @@ -58,9 +58,8 @@ static void test_hv_cpuid(struct kvm_cpuid2
> *hv_cpuid_entries,

we also seem to check for 'entry->index == 0' twice here.

>  		TEST_ASSERT(entry->flags == 0,
>  			    ".flags field should be zero");
>  
> -		TEST_ASSERT(entry->padding[0] == entry->padding[1]
> -			    == entry->padding[2] == 0,
> -			    ".index field should be zero");
> +		TEST_ASSERT(!entry->padding[0] && !entry->padding[1] &&
> +			    !entry->padding[2], "padding should be zero");
>  
>  		/*
>  		 * If needed for debug:

Reviewed-by: Vitaly Kuznetsov <vkuznets at redhat.com>

-- 
Vitaly
