Received: from mta1.migadu.com (out-118.mta1.migadu.com [95.215.58.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38773BED7D
	for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018972; cv=none; b=OBxzTns8ZA3HWg1l+YEieN7vMWOPvRpVlmmtFRSlveZWVNDwnLwDXxrSf3zwUHW50oP39eX6/0Uu8pFKJAi6RXZC2KimEAfeDDDkRuZT54XjkyZrJIemMCU2Y6JRiXVBGbKAwxa/lr1euDS/j9pvVzE+JWKfPmMJ0PBtvctDyoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018972; c=relaxed/simple;
	bh=3dTe4I+jOUWdWEDTdrRhpKO6zN5DvkrePHACeVTRXMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6om9suIRIi26ZPBzVpsWP5f8FJJxVU5C/2+p4rBWwnxcLRf8LwXyISLjwIsvMz58CqEo5eSWmSkg/2+q/Pctn5ypX2cu58z/JhheayT88pr6vk/bQXvSRHxh1Ct1bheIITfGa7owpkj8EO/z/bPPJrhI323RVxJ2/p9yAUEdu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dVvsLidc; arc=none smtp.client-ip=95.215.58.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dVvsLidc"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3dTe4I+jOUWdWEDTdrRhpKO6zN5DvkrePHACeVTRXMA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788018957; v=1; x=1788623757;
 b=dVvsLidcMR1dWi8BRMWNvY2WiZ7LvSHOqx/DoN+uDn0bNJi5i0K+PMyx9ExsmYnbBquGVCd6
 iLzYQ1ap5VaYAHd6KkxAy4HXom3iQulxuXZTQJrYaIjHaQ08K5tMGqVMRay4znTB8N9Nny+qZD6
 OFfbYsM39yzNm24lwUQQh7o4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8f1d69cdf6f3eb59;
	Sat, 29 Aug 2026 15:55:57 +0000
X-Mizu-Trace-ID: 8f1d69cdf6f3eb59
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so4295e87.0
        for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 08:55:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVgUcQdhnUyGUKRQ3COgem5fWwKm+Sq99qRDMrFEa9sH/McaqO7sWjZtsLgiaBrTXJgrtj1jX1tsimegOy20c=@vger.kernel.org
X-Gm-Message-State: AFuF++nNGMZBpaR5ME1lYnH90TVttb5Tq8ZKPDQ96VWF7m6H0tJ0B06T
	oPHV3tJSKlnViEi3TtqWA5lEQz3yP80/F4RhV741uDRPN4IszRlLNeFAQ3BBlX+kTfcYc6qbcxs
	pfogCjcANi7pGzv/MOnKD5jIqd8DcjLu81c7Wyfvw
X-Received: by 2002:a05:6512:4484:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b5ef1bf21emr94137e87.4.1788018952785; Sat, 29 Aug 2026
 08:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829054856.70549-1-kmehltretter@gmail.com>
 <20260829054856.70549-2-kmehltretter@gmail.com> <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>
 <apL9jzg-KM_n3Vv2@gmail.com>
In-Reply-To: <apL9jzg-KM_n3Vv2@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 29 Aug 2026 16:55:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzP0ijpos=1UOTz36b6_e1Ux90rNPm8HV5AKRhMOd76Zg@mail.gmail.com>
X-Gm-Features: AcwNN1VTjw50xqm9AUGeQ2iOjooRY4VH0Aw3j5JN4xMy5Uv_aVYtiX-pVxGi2Is
Message-ID: <CA+EHjTzP0ijpos=1UOTz36b6_e1Ux90rNPm8HV5AKRhMOd76Zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter
 range at base 0
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Aug 2026 at 16:53, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> On Sat, Aug 29, 2026 at 04:04:01PM +0100, Fuad Tabba wrote:
> > > Fixes: 821d935c87bc ("KVM: arm64: Introduce support for userspace SMCCC filtering")
> > > Assisted-by: LLM
> >
> > nit: this should be `Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1]
> > [TOOL2]` rather than LLM
> >
>
> When I first saw 'LLM' in a patch I thought so too.
>
> But it is now allowed, see recent discussion and merge:
>
>   https://lore.kernel.org/r/87qzkuahlr.fsf@trenco.lwn.net/

I missed that. Makes sense to be honest. Either way, that was just a nit :)

Thanks!
/fuad

>
>   816d9992d9ed ("coding-assistants: simplify attribution")
>
> > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
>
> Thanks for the review and also testing!
>
> Karl
