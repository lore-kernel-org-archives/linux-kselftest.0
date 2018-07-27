From: jmattson@google.com (Jim Mattson)
Date: Fri, 27 Jul 2018 10:15:32 -0700
Subject: [PATCH v14 8/9] KVM: x86: virtualize cpuid faulting
In-Reply-To: <20170208080917.24320-9-khuey@kylehuey.com>
References: <20170208080917.24320-1-khuey@kylehuey.com>
 <20170208080917.24320-9-khuey@kylehuey.com>
Message-ID:
 <CALMp9eQfrbhZ-K8H3RTa75+OJggMyD+Ly_Ch0bTpazQQ7XbPEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727171532.AoHsrPHdwV9YzfoHP79NnU5af35-JjG1IRxaimbPpOI@z>

On Wed, Feb 8, 2017@12:09 AM, Kyle Huey <me@kylehuey.com> wrote:
> Hardware support for faulting on the cpuid instruction is not required to
> emulate it, because cpuid triggers a VM exit anyways. KVM handles the relevant
> MSRs (MSR_PLATFORM_INFO and MSR_MISC_FEATURES_ENABLE) and upon a
> cpuid-induced VM exit checks the cpuid faulting state and the CPL.
> kvm_require_cpl is even kind enough to inject the GP fault for us.
>
> Signed-off-by: Kyle Huey <khuey at kylehuey.com>
> Reviewed-by: David Matlack <dmatlack at google.com>

I have a couple of concerns about portions of this patch:

1) There are some backward compatibility issues:
  A) Suppose we have an old userspace that doesn't know it needs to
zero MSR_PLATFORM_INFO to preserve existing behavior (to the extent
possible). If a VM starts on a new kernel it could set the bit in
MSR_MISC_FEATURES_ENABLES that enables CPUID faulting. On
live-migration to an old kernel, that bit would be lost.
  B) With either an old userspace or a new userspace, as a VM migrates
between old and new kernels, the behavior of RDMSR with ECX set to
either MSR_PLATFORM_INFO or MSR_MISC_FEATURES_ENABLES will vary
depending on which kernel the VM is currently running on.
  Ideally, I think this new functionality should be guarded by a KVM
capability that has to be enabled from userspace.

2) This doesn't really play well with volume 3 of the SDM, section
18.7.3, where Intel instructs developers to use
MSR_PLATFORM_INFO[15:8] to determine the TSC frequency for a variety
of microarchitectures. When reads of this MSR raised #GP, it was
pretty clear that one couldn't get the TSC frequency that way, but I
don't think many consumers would specifically check for a 0 in that
field when the RDMSR succeeds. If a guest hypervisor used that value
in the computation of the TSC scaling factor for a VMCS12, for
example, it might be surprised to get a #DE.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
