Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CC948EBF6
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338425; cv=pass; b=im4DtImhOuEVII74MH11xk/koPVUVJBWiAN2BcFqB0PUMtGcF91inRraytgsXh4fSA3BCrDTu62iriZ1BzdxHsk35gMixSdP3aCcXKQ/5y/OGnKISHKGQU1UH0OsAPQ7vztRLum9jn/Sl87R3taAI7WOIOty6fy7JVOP4UDiORc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338425; c=relaxed/simple;
	bh=3BAdkEbGZqLfwXxKr2RxchaDtVa9lkmIZOkFm2/fWWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0K5WVRvDtxPWffLGDXSFJcQ3dmDtXwhJKgQY4Rv+Tw/Km09T9xTYBWYT6RGmGBcWwoa3khN/tj0G+v2Ib0/oBpXnrlwgmaPAdPXS3YcptW2kGtSdmWyb+yP3alF/Izszn32C/9horFYE6No6WM64F/phpPsovkT4XUIsGIpaDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iTXLKyqy; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iTXLKyqy"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c10e86e52so280061cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 08:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785338423; cv=none;
        d=google.com; s=arc-20260327;
        b=lFgeCQWdSnS6DmBbZehGiDd2XgW48Dtf3t35pJij8mBSR4gaLf++Uqp/9WaJPaUers
         1vutbo5OZSE/52bSBRlnKMeJMDHeVrPcjSqFpxNkQ9LdctH0aGLGchpgu1O9UQnG/zIA
         IaL6yuI3CHLORFa5p+KjFCTg4YudiDj9+c0DIrylAG1/250nkOgttiT/0HWF04IOM1Fn
         zmXBifl//T5DANtwUIQrAGNem16LjM88icGDJssvrpZvhrHz5yok+WZQj8DKD0vx8mm2
         jjVoiMvZAXTpe9RZQ3Cga7Txj660+5r74MmhDaNzfQlCAbEhCrrIN4hRfZkBtPQHIKxa
         VY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        fh=GhFEQSm6oTf3zjIfHM15xhzKmrzhi+qyjjH75ERGaRE=;
        b=RTbh3CXaxZxxvMx2PDWFeUTY2dwU+ilISqQsxUbWtO3uVEavcEO4gBp6jgv8MFBEiJ
         gGqQdpT5HGcLigOQsQhtnAB6yEoraJ8Z8GL5sgMzIgEX1uMMgMlkVhnH19Dxkok9KKRj
         q1McFrP65ONl45HcP7xipb0RgKTgEUvUN2iWHOuZLFF1UF4NdowL940dG8gw4Iedl+MP
         pp7q9lpdpYXKgH//zeuyME7mDSD8yos9aCMGFHUQ4V+Q90ZockAKTI7ff/SfJY2TomLv
         YLQp12xYDZCm5t+co9APDT+CrvWrinRvlQsHzOyiYcpWNFjicKoyblrTRtxgb7F9r7Rn
         Sn2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785338423; x=1785943223; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        b=iTXLKyqyt8Z2geR+56oqRE+EncacpyKD2KMdlnSM5PuRfqi2fKerSutFyZsoRU7+4N
         9Wj9OiI71KNqzHhFzGI7NHBa4HxYXIZwmRl9O6GasK/rjCrhKN32rdm6l5IUNEfUKuWz
         GbtqpxGTHYvH9DNWsdrRUd40tTAFjeq4mE9rKF2QRacWXKXBLUs5Pivzbu2K0LFFKmL5
         M/hj7TCaYDz8WnZcCRUvS4jTMMwTppWyrGgRdf//0Z7uwvAkqlYkJwbp4WhP/n8kqtZm
         0wbj5fonYLEHgLswz9rOP9ePCYb5QVFqKTTOtKfmEFJS8bEPeYGA+0KEMhFg5N2ZJmZD
         xlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338423; x=1785943223;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        b=E41gRSFZs1jVNbAcAtvA1AjiXoyGEtJHJqbIE3Uv/lQBFoWxmQ/dmIN8Y7oJpbie+9
         gVdnG5lFny1smSXOTJQ9lG8vxFFoXAGMkiP+okmdg08PCH3zNihn9tqg31JJc7DC3Nma
         VUrFz5fWRQLv/N+t2hnb1h9xu5biSHT0FoRF6w0/Knsx1pWWWfGZ63rBVj2r2OTypvXE
         BnlfSoSBAdNbxm2oZg/z5tcZ3utg/7/b8VKYdyGSNnIioFY4kBVXPMnbize2qH2D0CED
         6qrBBZ1FGZQ4CMjaai7Ed00p4VmqXjdSBQJuNp8oa50gATMd8TrLaWaahwgsG9Adg31A
         nWrw==
X-Forwarded-Encrypted: i=1; AHgh+RpoxymreGX6OpgYEUtKNFhQBViE9mCNZZGCZeKFUynY6pC3KrdCcTXVP0IctdN9nT/kFlkeAZXpOxv5i+R1XyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUCjdCep/o0fh1oKkamjU6/xBdjyMhdr4RdnQxjxyPRJU4MjI
	gKuzs81U7vvfMeJa/bxKGV+xrXSAt4u3er9U8LSKkiW6Bv55gITTXEC/6eYUBxXZGbaDLjzMakX
	w9l9oY2NsYCka5N+GO8tv25AlNpR4hqY5LRBNInMU
X-Gm-Gg: AR+sD134SfqY3C/ARb282IiAMI9QXj2p+lZhlO7pKzqzPbmQCyBkefu6HBIEgBkjAo5
	w0syOqVS79iCjLN6nYCXgE+0fKIE9kT5Re6vhSyZDr1O0xch940QiqA48462nbfEspGpgApDd1e
	rbCEpJBVteCE+nDfwQ+WL4zYfFnYLUdzmg8O3wg+KJQxFnxxvXvWLtwyhmEU8mxp80Vi8UiZSXZ
	NQdkAlTvN97Z+RwK79xYsm2fEWbU2GI9Fh8VIbpY3rAScVH0QH4cNAWnqezYA3E0fyrs2jWlX04
	C25r++fD3iumODmh8FmRGk6iSfTt1WfeUkmJ1NlHlm65HeDfCbjZ1iUFBAwJ+NM1tUViFyPhSDK
	7SnJyZKo+ZA==
X-Received: by 2002:a05:622a:9014:b0:517:6010:7c71 with SMTP id
 d75a77b69052e-52b34e95118mr803001cf.4.1785338408902; Wed, 29 Jul 2026
 08:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-3-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-3-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jul 2026 16:19:31 +0100
X-Gm-Features: AUfX_mwnVrQrZWbAViwhlMWDHtZtcw4flUU1g4ENMs-4TGfR7On64kQESsXcw8M
Message-ID: <CA+EHjTyYk0Dcc-8RbvQZHFBZ7HM7cekfg3O5MR4jo57qX5SohA@mail.gmail.com>
Subject: Re: [PATCH v9 03/16] KVM: arm64: PMU: Freeze counter count after
 first run
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> PMU configuration is VM-scoped, but SET_NR_COUNTERS can be issued
> through any vCPU. Checking only whether that vCPU's PMU has been
> initialized allows userspace to change the counter count through an idle
> sibling after another vCPU has run.
>
> Reject the attribute once any vCPU has run. This keeps the VM-wide
> implemented counter mask and the PMCR_EL0.N value stable after guest
> execution begins.
>
> Fixes: b7628c797376 ("KVM: arm64: Allow userspace to limit the number of PMU counters for EL2 VMs")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pmu-emul.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index b5df6843dbcd..b4b877f31097 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -1087,6 +1087,9 @@ static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
>  {
>         struct kvm *kvm = vcpu->kvm;
>
> +       if (kvm_vm_has_ran_once(kvm))
> +               return -EBUSY;
> +
>         if (!kvm->arch.arm_pmu)
>                 return -EINVAL;
>
>
> --
> 2.55.0
>
>
