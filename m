Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254570;
	b=Op4IKXJ4dG4g9aKf+3KtFYWSvTMi9a3P5N9jd/g0xfW3MVoswxOVY20VU5exoBt/iHJB
	 6F8g/62mP641Bs9HlFH8HefKT6ERue6qIT0xrymWdzMT5a0oYIqTmCKusrkKyqVn/ASSE
	 ANyxOl/TLHqArQRhruKHSABbn9YEFipb/TnEnLihenV3FWz9/rvleRMp4fXO1trQ1cs77
	 1CZl0L6tPLnn2eBO4WS/0jpdTRKZ8CxYoyq8RpyTuMVnHZb3uRpfCW56cA/NExD9NJ/K4
	 X0tGtebnGyQHpUgP6GPBLmNJmRgaF2ic//I6gZfFSLkn4vdAsPFF18j9bvyFs9s0P/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
	b=U3MB1J8Dl6eQMqL37ov+FtEfw52g5gxUIekn8/80gylOUnpXNje7S8XZcEpcUOGxqhj0
	 dAPdfGeoNWsPAvh4oNoetAOyIZf2a0zUMsZ3WIcBjF/QoaM1tQum9Ck5/gIexcbUKP3l4
	 MJqL4DbWIzGf8XBqEj9JHSxLevlc5DFWKw2ChE8hZGC/mizMrkCNU6dP1wBQksp2ld2sb
	 OI6pjwj15UlJeGVdxZJf4+aVVIHFuGo+IjBHqt2ajcK8H6A1rLZrBGA9UjxEjP/bhyOxm
	 8HUUt7sqjZm7gRuBAKuzRxtYUsnjmokuM29DdE8I4RPtWqqmm7cBHwzXAfVX9keyQKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MDVfxjyH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400F606A33B
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 20:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F400F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MDVfxjyH
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99be509f943so305324241.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 12:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254569; cv=none;
        d=google.com; s=arc-20260327;
        b=nWpz7Iir8O2lz+Td7ay2E7KMuSM7VxDmvZnUjp2iPSNS/reI8jedS2NlkRfCypYGlF
         y5P5BXeDql+75oIHmOFqqTgfcRtqmYtO2aq03BI+KKpTCZnlz3zMBYZsMdxbCQEestrN
         37tr2GtQpXFMUMiRmFYMQpV4lKLYur+bPd+UCseZP4GhR6kFXvIBUxbvgWJwgrOeY18q
         rJidf7D3c1kLN0CXWghKr8sO160pU2Co6qtTE15hhJ2R1iE6FsQnL8SSWwU5l5rAUGrT
         uRM1OPsrix45+tjEQDiXncv1FxfIX88oIjwprOdTuUgNnxxuRRfjrqwwuyhR9AP9qcRj
         wfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        fh=M1V60x6nwupg+FzKL3eQAVFTV+1rU+T+BU3ir9Rlv9w=;
        b=IWnOY8/AE9icnq1oYr7CGUT+HHcsrzsF1snuRreVrIYr7W/tGV8g6bt+x3IP2HC43s
         oic9KNYP8FZEa8uS83lZO6yX2X5Vnm/BVFqOa+foVYKNJ/bBXSBRbasLVM0hu/09HzGX
         fE3BCn6z4DdqF+JHKmViO4MqPAbkv+lCruyAR23wuA8Jf8vFHaBPGxHGqjkuNHPj806P
         j/seS3Lve3JdVH6fmrkesAED0NniSDjoTKhQD4pZXWxuyzBP4D/GtXmN5M4X0EblvqOC
         feq9icdKa1ffcJifXf3YsdLql365nM2+19RoXdm5ptXB/ZDN8a9dgK+mdXKWXE0tZh2k
         Pf1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254569; x=1794859369; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        b=MDVfxjyHJJz7nSVac0/MzxNYBAz0gz5mw1nMRucJC8aUp+/mnDPCU44ZxNDT4hUiYs
         0VO6PuphdsyMx+3xKWYiLk9jOaIwUsbGRkOu0zsaG5mQaDtr2x4nwdguACt/ZWzkD5Zw
         LwYq1XXvp3WJjCiZQPyddb1UADLTSJUEFAooPlzFkNi3lS9+RDyZZ7VAuQXH7AQvz1Of
         0ObyKgznWixBSZh4qMgT3j9WWstoilMA2gS6Kvgh4lHWmYaPSH2nkLlZVxbOEyXYahDe
         7Oxcnxorznvrl/eWoXpjXz8oZ/hixEvnUQqbctYoU7NfzmkCWSo36Kc0RM5K/Bh9cL+5
         qDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254569; x=1794859369;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        b=Z+teTcgzZzZLeoTdl96Bu4Jcus0eV+sTX9v4vvJBpB5/VpI/+6Fg4+A8eaYZyztFB3
         5Dl8vnrTkBuy2xYNX0mpxhii77yL6XStrTYu05TEGrWj09Rq00bKl6hmNm3f6sIUKNjr
         qpO2ysGrMAYqNSSzPBui/uSHlsiko8t1I6Kyu+USNP4XfEKdygZjlA9dxLJrQS+OkXkr
         26w/HhbhRP+6JuvhSJMDNArtd//EXlXfw3clwA/Gqr7Beaj9+4XNH2BLfEBNx/U0JeqS
         G/xcwWerrYiGPf1+s9AQqajhrXUiw8f0V++8RyCbixetOe3Q/9EtrKEgU72XyvqpKIv/
         rePg==
X-Forwarded-Encrypted: i=1; AL+hErFSGZyVUr3pzp7M6KoCSmWdLoVi54uUbaHFAi/T9EzgOPkqnJkrlpjjjTp2Xt8emTMIijPfQ5CvXGbhI7b6Z2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dXQ46K8NPb7SZOuwcUI7hBhRBd8P45X5Npo2s93cRbV/YFkoB
	wcgtQU3sgp+3wlc6mD3QFCs8ygdKew4TOz/69FKVgV4/rM+CafPdcHOK4mEAG+wY7UH/SJWYhqv
	WaIJKs9kl3esI9kZGqR4+G8/D3fcF//Vp3H+UfoQY
X-Gm-Gg: AYBFou0AnVnvjnS2VW2cwucHl7DFAH66IzadmfC230Q5bCm/dN0QpKGF3QaZfR+xG14
	FscyNVqmJItqOoReZSIlXRzeGmwognGJM6oKKUiJkVLM6W7mWVfev/69qi7q/hZIQB3K++WfhLd
	HT46sMkBSHjA5IAG0hbKZoy5BzIG3py/JEdSE8cTIRzqYeGbvipkVKlV0xxMadFNLgsQDuIF3+L
	aYNO2O8yl9JXy8dMztYG2TK6xOHbt8IumYtrhVYxYNRWUmW+2ycSSIM5A+oygYiAxhsUvVbIzgG
	fhZKe147ab+YN6et6U3cjIC4F1PQccn34j2R5tWfdTAzgFL5ODfoa5m0fkQpSU5z4v8ZIHKFEki
	ouQREnloG7ZuIKM1o4Q/ht/ZOEGgjZDqABgCvaMP522ItPKfoyEmaC6iQoBq34IwfnM6X8XTM5f
	A56z9Iz2rr9pqFtEXsbsNMrfJPEJiEb502yTY7eBt4htKF
X-Received: by 2002:a05:6122:218b:b0:5ea:b04a:cefd with SMTP id
 71dfb90a1353d-5ee0d0a58a3mr105598e0c.7.1794254568208; Mon, 09 Nov 2026
 12:02:48 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 12:02:47 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 12:02:47 -0800
X-Gm-Features: AclHuK93pizTTBvqPPHn8tyB102k3E6xp0ArgfRjiMFhvMMSdBvoYQSIxOQgtlQ
Message-ID: <CAEvNRgGQqdrcLcYbSbiXmFRAHwvGW5Ha_2NPWhMNs-qpnWhZCg@mail.gmail.com>
Subject: Re: [PATCH v16 16/20] KVM: selftests: Load private memory and
 finalize TDX VM in kvm_arch_vm_finalize_vcpus()
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Initialize TDX private memory and finalize the TDX VM after VM and VCPU
> creation.
>
> Hook tdx_load_private_memory() and tdx_vm_finalize() into
> kvm_arch_vm_finalize_vcpus() to avoid the need for every TDX selftest to
> manually load initial private memory and finalize the VM. While this
> prevents TDX selftests that use vm_create() helpers from customizing
> memory before it is locked, no current selftests require this.
>
> In TDX, finalization is a mandatory step to make the TD runnable. It
> also finalizes the MRTD of the VM's initial memory and state, locking
> them in for future attestation and preventing any further modifications.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> ---
>  tools/testing/selftests/kvm/lib/x86/processor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 11db6a3b0366..ee8a1715d844 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -1503,6 +1503,14 @@ bool kvm_arch_has_default_irqchip(void)
>  	return true;
>  }
>
> +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
> +{
> +	if (is_tdx_vm(vm)) {
> +		tdx_load_private_memory(vm);
> +		tdx_vm_finalize(vm);
> +	}
> +}
> +
>  void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
>  		 const void *smi_handler, size_t handler_size)
>  {
>
> --
> 2.56.0.455.g6c5a503b38-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
