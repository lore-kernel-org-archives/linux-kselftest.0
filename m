From: peterx at redhat.com (Peter Xu)
Date: Fri, 17 May 2019 10:45:10 +0800
Subject: [PATCH] KVM: selftests: Compile code with warnings enabled
In-Reply-To: <20190516130257.29445-1-thuth@redhat.com>
References: <20190516130257.29445-1-thuth@redhat.com>
Message-ID: <20190517024510.GN16681@xz-x1>

Hi, Thomas,

On Thu, May 16, 2019 at 03:02:57PM +0200, Thomas Huth wrote:
> So far the KVM selftests are compiled without any compiler warnings
> enabled. That's quite bad, since we miss a lot of possible bugs this
> way. Let's enable at least "-Wall" and some other useful warning flags
> now.
> 
> Signed-off-by: Thomas Huth <thuth at redhat.com>
> ---
>  This patch fixes most of the warnings in the x86 code already - but
>  for some warnings, I was not quite sure (e.g. about the need for the
>  kvm_get_supported_cpuid_entry(1) in some tests), so I did not touch

If you mean the two calls in state_test and evmcs_test I would agree
they should be dropped directly.

Just to mention that the patch may not apply cleanly to kvm/queue now
probably because the dirty-log-test.c touchup recently, so may need a
rebase.  Otherwise it looks nice at least to me to have these checks.

Thanks,

-- 
Peter Xu
