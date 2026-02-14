Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E114330DEA2
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 20:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771099794; cv=pass; b=rd6gOJPvm0R0pF96lM03SYyvDbqufWnfojTlOML+LCTetDSEPig7+SQ/ymFr6inqr/UyUwJgO50OkU7xmycUayaNhxyLDNqWMjPtCFyPn3e+/ziTnEO/NaBwd52pcPY7A7TAqpFQQaK3M/hgSO5lMdiWPJLO1w41aR04pJ8R5jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771099794; c=relaxed/simple;
	bh=FufzZ4uU/iS1q/sxK46E3rWJ6kguU0PcbAexdJqkwRY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XweDygOKvDP9NxRqnSGeZ9mvhaiCVIvmw1PJ64UBl13n8YhD35aECS7cKmfP3g91C1g0Wm2Iyh5TEKjHOwA+njgOQWkovf/jv3M/MuLLpYoI78pr2PRkscZta+lePTzDZtvC+Yrmuj4C65izp7CvamLI+7e2asLddNfZINsXR8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c69O+6Wi; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c69O+6Wi"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-948ab1c79ebso579961241.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 12:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771099790; cv=none;
        d=google.com; s=arc-20240605;
        b=CBpZCZLprYek6hgOD8sXbQwoYcH03F7IH3hLciOZL5HRSlqYnHVlyPtp5v42aFD4p2
         v0jEwDlEMtuc5tSwSWS/ms2GaY5jfaFGE0ZLg64tm7MXPjZ61A0JtoST4SX6InbM5cvh
         vGqglfh0VVSh+6OuWGme8Jdu0yPFev/9f0XkfEHInpPIIt5sd8rIy9Pq48D+lt0K1p0p
         G5xkaBNhPUMPWw6k5pBDrlR7w8sesbzh+enklKwVF/wfbgKw/isPXfasaWoT1iK35QBG
         5s1Lf0pbAwDthXX2dBGhMSfpOqr5/KR/yUnWywy4BFTQsFti4bNpMOWWFMLtBee+/3/b
         xFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1jQpoSMsRYyXQLWbsh+LVZl2/hfELtMQa6Z0sSC+Mns=;
        fh=Z72PkxcyVa3gaOHPBOzBTugtvdeMyQGMmArqvrQSQSc=;
        b=ZgZas6OHa5C2cU0RjOpP5EsINKsdG0KFZ2JYDlH64eCicLB7+GjQIYCr1uXE8XC3n+
         JqosaA86VYnCD1wJr0N1llNmoIvsNt30Yp24cfcUPR8YON3jN1GWgczgRPGU8mEXyI++
         YOUgUr2tSoDQO1NioSK+A540NyYCQQATmy89CHxJfj0Id4JbwTiVmgDGVYX3sPIR2vZ0
         nPr53VnvB/OaUmn452jO0QysN4CgyeQsZCgX66zpAwGAJX3gs8BCi8XQ9FyG2LxzIZHv
         8rl6womdt0Cxg3EDJyMhkxeDMuQVJgye1EzKkUFDB0BlRPctD3Uc+21ZpYoRqNoyOf4c
         nkjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771099790; x=1771704590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jQpoSMsRYyXQLWbsh+LVZl2/hfELtMQa6Z0sSC+Mns=;
        b=c69O+6WiC3D+oJAldcWVy75tWL6Mk44q+MqO47KVEoV5FFmTtNXa4HHKYQqvin5C0B
         YITY0Zl4Bb5dk1Gb9Kg9IItF5V2q+I3ljh6fFxT5z0WH9zR+vRHKKN3qQ5bVMIuFHFGb
         0TsCMeSIZFZo4sHTNKuukgp1yl8svj9AJOZL1+oHO9iz/hXfeBpRR6ZU1tyinaySe8Rm
         BSBo+26xTip+Prhs0Pk3m0K42AXyNb2CR0yAYWZ9XPOFpad36EKw8re+wODVR2/MYgri
         /stt/vgWae1KJydSMTz0LmxIfYnsmdcbtBnCjaNIh5TGSM3apBbwoTtbMQByIKvO1/LO
         Iz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771099790; x=1771704590;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jQpoSMsRYyXQLWbsh+LVZl2/hfELtMQa6Z0sSC+Mns=;
        b=SCEZhokM+nNVjqPVj2xIPV7ICBgKDryZ37l3uiRlp1qjyw0ktmlglSKj5c0Dd5MVVy
         LxaxyCRI0CtTf18ggJ0gLs4teKW3eNqNNYAUS/SJag+5U6s+I+Tlx0EAN5MK98Jvjfrl
         BwERI0G41vFPsZO19qf7Rud63WB8JsDeW8vLtZg5ebCirQJIlwOsjAYqdAKQKam46L4V
         2xlGdygkKEcZvAYP3IZuI+qAMc+fd6n0FMULoIYJ8M5Xlvg3BJbo+2JNZ8RKQDS6AOSb
         3ydSiKNNq/Ww1GmlIrfyJbuNdmkSZEO/t0T8c+iqFloDOndCEt8dhf4+uCP+YmlLSTA1
         dlqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjw9T2EM8slYyvawyC2ePkdwerRGO9vBeuJGXkifzgt0CgoIEui8NoWWVE4fdfPsZjmaAGhhTT9GYAOmImC80=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2nVwy2dwJ3CmmpLLZPhkOtXcVoIiJKGon5LpN3dyNs3GdiHt
	7p8fJJ0q6IQr1hYdgOoe0k0HNldi6Z8KK0wfjBZYJyMeORy2Q+IlES9ZZLtQRExy1GmwkOdxG7N
	e4GZ3uXH5zUWG8eE9/Sjk1Bt5vdLboGQ5krP/JasY
X-Gm-Gg: AZuq6aJP0H6YzDsNcZFR4Iw8DXDe/elJf2oEbFQS0ZxM0ieYccllqibvVl0UJ9KK0du
	tkQQ3L33bpn42hgS0sQDDF3JAHCXk32dKCaCeQOzRQ89XdodOqIekMXBE3vHSw+bUbTH5EVNQOZ
	4bApqhjNEAgDeSzuPI7Q3Wn3mXNAyCD1ORoBR/WO70zv8CHvURlVwO/+YF+rW9iAHsNqH6HFQem
	tfihggBuWKnTKgBSjIl/R7CS5c0TiRgkaSryEViaFe0eqcZepN+31CLCblfQXS30e9yO1sQG4DA
	kkd0FML5cW3JnITFf/5gEc0ZjTJC4gJ2T988yyNVEg==
X-Received: by 2002:a05:6102:358d:b0:5f1:4fc3:855d with SMTP id
 ada2fe7eead31-5fe16f7123cmr2125991137.38.1771099789089; Sat, 14 Feb 2026
 12:09:49 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 14 Feb 2026 12:09:48 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 14 Feb 2026 12:09:48 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
References: <cover.1770071243.git.ackerleytng@google.com> <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 12:09:48 -0800
X-Gm-Features: AaiRm50-4IHejrw9QDCNjWRongMJUvF1-Uwjne7RAjYwOg9FxNIKczofN5-jceI
Message-ID: <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/37] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 23ec0b0c3e22..26e80745c8b4 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -117,7 +117,7 @@ description:
>        x86 includes both i386 and x86_64.
>
>    Type:
> -      system, vm, or vcpu.
> +      system, vm, vcpu or guest_memfd.
>
>    Parameters:
>        what parameters are accepted by the ioctl.
> @@ -6523,11 +6523,22 @@ the capability to be present.
>  ---------------------------------
>
>  :Capability: KVM_CAP_MEMORY_ATTRIBUTES2
> -:Architectures: x86
> -:Type: vm ioctl
> +:Architectures: all
> +:Type: vm, guest_memfd ioctl
>  :Parameters: struct kvm_memory_attributes2 (in/out)
>  :Returns: 0 on success, <0 on error
>
> +Errors:
> +
> +  ========== ===============================================================
> +  EINVAL     The specified `offset` or `size` were invalid (e.g. not
> +             page aligned, causes an overflow, or size is zero).
> +  EFAULT     The parameter address was invalid.
> +  EAGAIN     Some page within requested range had unexpected refcounts. The
> +             offset of the page will be returned in `error_offset`.
> +  ENOMEM     Ran out of memory trying to track private/shared state
> +  ========== ===============================================================
> +
>  KVM_SET_MEMORY_ATTRIBUTES2 is an extension to
>  KVM_SET_MEMORY_ATTRIBUTES that supports returning (writing) values to
>  userspace.  The original (pre-extension) fields are shared with
> @@ -6538,15 +6549,42 @@ Attribute values are shared with KVM_SET_MEMORY_ATTRIBUTES.
>  ::
>
>    struct kvm_memory_attributes2 {
> -	__u64 address;
> +	/* in */
> +	union {
> +		__u64 address;
> +		__u64 offset;
> +	};
>  	__u64 size;
>  	__u64 attributes;
>  	__u64 flags;
> -	__u64 reserved[12];
> +	/* out */
> +	__u64 error_offset;
> +	__u64 reserved[11];
>    };
>
>    #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
>
> +Set attributes for a range of offsets within a guest_memfd to
> +KVM_MEMORY_ATTRIBUTE_PRIVATE to limit the specified guest_memfd backed
> +memory range for guest_use. Even if KVM_CAP_GUEST_MEMFD_MMAP is
> +supported, after a successful call to set
> +KVM_MEMORY_ATTRIBUTE_PRIVATE, the requested range will not be mappable
> +into host userspace and will only be mappable by the guest.
> +
> +To allow the range to be mappable into host userspace again, call
> +KVM_SET_MEMORY_ATTRIBUTES2 on the guest_memfd again with
> +KVM_MEMORY_ATTRIBUTE_PRIVATE unset.
> +
> +If this ioctl returns -EAGAIN, the offset of the page with unexpected
> +refcounts will be returned in `error_offset`. This can occur if there
> +are transient refcounts on the pages, taken by other parts of the
> +kernel.
> +
> +Userspace is expected to figure out how to remove all known refcounts
> +on the shared pages, such as refcounts taken by get_user_pages(), and
> +try the ioctl again. A possible source of these long term refcounts is
> +if the guest_memfd memory was pinned in IOMMU page tables.
> +
>  See also: :ref: `KVM_SET_MEMORY_ATTRIBUTES`.
>

Transferring/re-summarizing an internal comment from Sean upstream here!
We can also follow up on this topic at the next guest_memfd biweekly.


Before this lands, Sean wants, at the very minimum, an in-principle
agreement on guest_memfd behavior with respect to whether or not memory
should be preserved on conversion.

Sean is against deferring whether to preserve memory to the underlying
hardware because that is letting (effectively) micro-architectural
behavior to define KVM's ABI. KVM's uAPI cannot let behavior be
undefined, or be based on vendor, and maybe even on firmware version.

Sean says that all decisions that affect guest data must be made by
userspace. The architecture can restrict what is possible, e.g. neither
SNP nor TDX currently support "generic" in-place conversion, but whether
or not data is to be preserved must be an explicit request from
userspace. If preserving data is impossible, then KVM needs to reject
the request.

(Vendor specific ioctls are out-of-scope, SNP and TDX cases were brought
up purely to highlight that there's nothing that fundamentally prevents
preserving data on conversion.)

I suggested a few uAPI options for configuring content preservation on
conversion:

1. guest_memfd creation time flag like
   GUEST_MEMFD_FLAG_PRESERVE_CONTENTS. This can be valid only if the
   kernel and vendor support content preservation

This was rejected because we should not assume all current and future
use cases will want the same content preservation config for a given
guest_memfd.

2. KConfig: automatically select to preserve contents if the
   architecture supports content preservation

This was rejected because it's not a decision explicitly made by
userspace.

3. KVM module param to configure content preservation.

This was rejected because the configuration may not generalize across
all VMs on the same host.

4. guest_memfd ioctl flag
   SET_MEMORY_ATTRIBUTES2_FLAG_PRESERVE_CONTENTS. -EINVAL if kernel and
   vendor don't support content preservation

Specifying a flag to choose whether content should be preserved at
conversion-time is the current best suggestion.

What does the rest of the community think of a conversion ioctl flag to
choose whether to preserve memory contents on conversion?

Fuad, I think you also made a related comment on an earlier internal
version we were working on. What do you/pKVM think?

>
> [...snip...]
>
