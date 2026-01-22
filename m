Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9343A9DA1
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097856; cv=none; b=f8p3/Lx2WayaQrJlW22GsQlP7sVzeAZEeydIESg6TL47TPoCRgB0GGVpP22JV41mNYaA2IAAl/54ibOp5E09nPbyG0gmdq3b6IuM1svEP9PlPlMjX+w9tVwBH0T54z0+qeZEo+bb6OkaE3nzjM/icpi+P00UJxc/SfOYXj2peQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097856; c=relaxed/simple;
	bh=viNnaReSsAyqS/zLOY2ifZng9HyswNpsZThiO/XVk1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DAK0oOQ6+DA6PP35VPEXPenObz4Qda/iPWu+uqs0czymnouTk874Yh60FSJLcdOfpAmcRVrNjTzlXz2FgixqAAelqwbKneKRCnfh1DCLhu70QU4L8uA0c+00KDMRjd6XhJNWZiSYjOlQblGk/fx4rsD9dQGzjqjTAuAhXUTU128=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y4v2IVtM; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y4v2IVtM"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a77040ede0so11005705ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 08:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769097848; x=1769702648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LD2LZ6P6QaQ5VD5Wh4MR8dbmyUc9EnoiEwigMQRIrTc=;
        b=Y4v2IVtM0BkDOyuRdJqbjoJxqyfmoGS39JUV2Bo/sM19bW5u6wojwwa35/8lFRDzA1
         quVRKzDNcgwIl5CtdbyNKtsAJmJB9tm6PZDKXDP8neXc9BZX1p9roP7ve17ug39vutro
         urTIOulDUu0OA381er/9Kz+YhvEPbORgueJ67uVT8jLh8qqAjdFFUNvElpf+gMCtNKuz
         dKeSHHy9lsgGHVTCbAXg/GRnJJTzgwYepOYzMNywryy9ccXy2nUgTf32VR7JZr+4MSDO
         NvBuVi+BGLBPoEOpBGKcv8FLgL4FSMrjNjTT9z5EsnAHqHxTOXtf/6PUTFsgDH6zFie+
         bwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097848; x=1769702648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LD2LZ6P6QaQ5VD5Wh4MR8dbmyUc9EnoiEwigMQRIrTc=;
        b=knza63ebdhd0mAOQHDDiVqm5QMnfRXeAw+wQlFGKk9ud/MR6kns/24X4CX2elOeZui
         W4XTywOEK9eRIq9DVDfuxgGbC3HFsb+ZNl4hDtgut3wM6s+YhMCcR4Zl3anwU/Y8KUNS
         sKjC/1Urk2KEEjBF2zN3ewgMYuB3DKEKHwFxoWKaLYEYbJEecKRlqltV4TVxXaSWf6/N
         xwij2wsuc+evEgRSiM/68IGWJo766z78GeqKxqapyx8+P1asdH6Z8Wig3yD3B5JU6OeA
         oiYngYJql+Ze941wII4nqXHL4pzYjYU/jGrI3U0LFN5rhV2GC781iO1fqfGro7NmPg+1
         4Qnw==
X-Forwarded-Encrypted: i=1; AJvYcCVLDgBGIFp4PKt/JeGMBzCgeFY2x79ijCmPiZPs54jY7VMf+SeQ8+D34O8asFbff/sYoavUjLRHsK+XZFFxoDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOopQ8USL7PfIuvzGeIIJfoHBr+ya1TQBTT83zxMHgGdt4Nra
	kV0+02Cq2gkXoQ6Nc1wYea0VxR9TYfoHpKgRJ56M9xTZKrFWHbgcLBF8Bnf4iAMrHMhxY4n6lEV
	BYn8e9A==
X-Received: from plbmi13.prod.google.com ([2002:a17:902:fccd:b0:29f:cd:e7da])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec90:b0:2a2:d2e8:9f25
 with SMTP id d9443c01a7336-2a76ad742e9mr77688705ad.33.1769097848122; Thu, 22
 Jan 2026 08:04:08 -0800 (PST)
Date: Thu, 22 Jan 2026 08:04:06 -0800
In-Reply-To: <20260121225438.3908422-2-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121225438.3908422-1-jmattson@google.com> <20260121225438.3908422-2-jmattson@google.com>
Message-ID: <aXJKdlJI3fg42gim@google.com>
Subject: Re: [PATCH 1/6] KVM: x86/pmu: Introduce amd_pmu_set_eventsel_hw()
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jan 21, 2026, Jim Mattson wrote:
> Extract the computation of eventsel_hw from amd_pmu_set_msr() into a
> separate helper function, amd_pmu_set_eventsel_hw().
> 
> No functional change intended.
> 
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/svm/pmu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
> index 7aa298eeb072..33c139b23a9e 100644
> --- a/arch/x86/kvm/svm/pmu.c
> +++ b/arch/x86/kvm/svm/pmu.c
> @@ -147,6 +147,12 @@ static int amd_pmu_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
>  	return 1;
>  }
>  
> +static void amd_pmu_set_eventsel_hw(struct kvm_pmc *pmc)
> +{
> +	pmc->eventsel_hw = (pmc->eventsel & ~AMD64_EVENTSEL_HOSTONLY) |
> +		AMD64_EVENTSEL_GUESTONLY;

Align indentation.

	pmc->eventsel_hw = (pmc->eventsel & ~AMD64_EVENTSEL_HOSTONLY) |
			   AMD64_EVENTSEL_GUESTONLY;

> +}
> +
>  static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
>  {
>  	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
> @@ -166,8 +172,7 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
>  		data &= ~pmu->reserved_bits;
>  		if (data != pmc->eventsel) {
>  			pmc->eventsel = data;
> -			pmc->eventsel_hw = (data & ~AMD64_EVENTSEL_HOSTONLY) |
> -					   AMD64_EVENTSEL_GUESTONLY;
> +			amd_pmu_set_eventsel_hw(pmc);
>  			kvm_pmu_request_counter_reprogram(pmc);
>  		}
>  		return 0;
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
