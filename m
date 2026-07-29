Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3633955E4
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347209; cv=none; b=A1Np9gO1uTnQWVNl8cDUdDxXuSmisqdMkfDTtxbNZWjSmmP4XOx8CiIHu/g/vzxH+Dc4fc+JXXqbCp1vhN30Fmp1+kH50LK0royLIwdMf1Y0gg5fLkaiFfCBSVGVx+OHZzR2eAmgRhDQhNx2mXnQqzYVHFLdIV8nbfa5at+be0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347209; c=relaxed/simple;
	bh=ap92kwRr/a7fNVjoXbmvUUcASL44iSYrV9EftYQE43U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0czIvJ5qEdJ342wawlbsCuPzbWWWDNzDW61FT7JCfanEOmG+V1q3ez/txpAHQK+EF2qChfVf2kl8PLlnk9/3cX92p6K3mWxs9HicNI+UWKNB28i1pXiuXo6DQbt0bmzOtjbxrXCP8VbzJNNkn18XAyMprEwwQCa/ZGYpHaBFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CTg4U76I; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CTg4U76I"
X-Forwarded-Encrypted: i=1; AHgh+RpsngZgKwbE5S1kilMMisHTfGQkfgdL+ezqUNM/zn23XqYrrXqt+BOyWvqfUjlcqkmGIgyiQVGno8H/LA2eSIY=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785347202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VeiwwUTVEJhKZbSrlTRImNB7jVC969Sz3ID5XycdSNM=;
	b=CTg4U76IuX8i4GPzRk6wwxqOSkYbSb/90KeZSjQXvTFA1fQChddSCyUc3nTxQNErNjXH6H
	5Re/d8tAaEDpfhBwVW+mY9MFRApn+HNZjbDDZcyifXR74ByRmtbyCEjnGDRc/Gqr1gVWVk
	QTTm7ZgpDeJLtOODnAUGH8UrYjhxf1w=
X-Gm-Message-State: AOJu0Yz3MTfcbbpQ13+5wTlFlOrZg7coPIipKVCnnEwJ3TwQGZrU2Bjk
	Ll2M35rEOoHGV7Ls+H4EHN8qvJqWBorVoYw4BgKQhK6+RdBVEQcu86yGEZEBk1IjMtPb99XIYir
	Ot6UL8IjfGk2iyH/JeVARGHlOxjNVIWUMcFdkG6t9
X-Received: by 2002:a05:6512:340b:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b2d9b5e246mr38229e87.8.1785347192415; Wed, 29 Jul 2026
 10:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-12-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-12-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 18:45:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzqXV7wmzevDdiezK+dbXYB-+SHOTu==_EiBrGpcekMSw@mail.gmail.com>
X-Gm-Features: AUfX_mxRkX-Zqid_e-BAuwcS03ps7VJdHqOkA3Ldb7q_0YRC6ZP02uwIv7QUnxo
Message-ID: <CA+EHjTzqXV7wmzevDdiezK+dbXYB-+SHOTu==_EiBrGpcekMSw@mail.gmail.com>
Subject: Re: [PATCH v9 12/16] KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
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
X-Migadu-Flow: FLOW_OUT

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Replace the VM argument with the pPMU used for event creation. The
> current caller still passes the VM's default pPMU, but this removes the
> implicit lookup from kvm_map_pmu_event() so later changes can map events
> against the pPMU selected for an individual vCPU.
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pmu-emul.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index c5c505b6fc61..27db8877f96e 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -670,10 +670,8 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
>         return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
>  }
>
> -static int kvm_map_pmu_event(struct kvm *kvm, unsigned int eventsel)
> +static int kvm_map_pmu_event(struct arm_pmu *pmu, unsigned int eventsel)
>  {
> -       struct arm_pmu *pmu = kvm->arch.arm_pmu;
> -
>         /*
>          * The CPU PMU likely isn't PMUv3; let the driver provide a mapping
>          * for the guest's PMUv3 event ID.
> @@ -725,7 +723,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>          * Don't create an event if we're running on hardware that requires
>          * PMUv3 event translation and we couldn't find a valid mapping.
>          */
> -       eventsel = kvm_map_pmu_event(vcpu->kvm, eventsel);
> +       eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
>         if (eventsel < 0)
>                 return;
>
>
> --
> 2.55.0
>
>
