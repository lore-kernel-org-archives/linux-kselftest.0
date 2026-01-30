Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B252F6562
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786814; cv=none; b=mEpUSflNqrbfzNCJhBFpMP/UrlsaursTggkVM4DK8A9ZDyycYrCJI1BvGefSkgvGL8HMhBM/dl36lx/jXyjNPnDcApYRPCPfl6AnXA/63sMaArZCdpqMcSf0JwsdkwcAOEF873FZ6QLODYBM/TJhfu9X0DArpQCchuETwpp0ld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786814; c=relaxed/simple;
	bh=WKbgIjvqYsLnhI8lLynWC+gpwRwjqUOcqoGqHgkaXhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsfFZwdyVttYX0ijoP7DPDNui0pb8Yi4bfwddznacR6ABLrropHOng2VSLCO5Q7bwkDJebBKj4Pt70R2cRnD3Nd1GiP8GwH/UtcE895+N41fTsC5r0mIRgdOeztGvcsIx6GnW4YcZj4xt1lhvenTpEf/17k9G20G0dnMEFaLnWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EfBMc1L3; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EfBMc1L3"
Date: Fri, 30 Jan 2026 15:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769786808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jnluWOJvX1pbBkYtIrk0e2TYXTHoU6kY5S2rGU4X2jU=;
	b=EfBMc1L343Kx6i2tvM/2pzmneB0CHfg31wKiPXSm4XuiAJ51giqKIPr6B9H+r03eyfu2su
	QCsABahe3heQOdfXC3xJ3UY72b5VBj4BTVLmSFjWdWgz8xlOTMnye9D12Oqtc7wG9CTNxp
	fvlCwm7mEWVycugXwOh7zyKJ0fbFDVA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Jim Mattson <jmattson@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, mizhang@google.com, 
	sandipan.das@amd.com
Subject: Re: [PATCH v2 3/5] KVM: x86/pmu: Refresh Host-Only/Guest-Only
 eventsel at nested transitions
Message-ID: <zzgnirkreq5r57favstiuxuc66ep3npassqgcymntrttgttt3c@g4pi4l2bvi6q>
References: <20260129232835.3710773-1-jmattson@google.com>
 <20260129232835.3710773-4-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129232835.3710773-4-jmattson@google.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 29, 2026 at 03:28:08PM -0800, Jim Mattson wrote:
> Add amd_pmu_refresh_host_guest_eventsel_hw() to recalculate eventsel_hw for
> all PMCs based on the current vCPU state. This is needed because Host-Only
> and Guest-Only counters must be enabled/disabled at:
> 
>   - SVME changes: When EFER.SVME is modified, counters with Guest-Only bits
>     need their hardware enable state updated.
> 
>   - Nested transitions: When entering or leaving guest mode, Host-Only
>     counters should be disabled/enabled and Guest-Only counters should be
>     enabled/disabled accordingly.
> 
> Introduce svm_enter_guest_mode() and svm_leave_guest_mode() wrappers that
> call enter_guest_mode()/leave_guest_mode() followed by the PMU refresh,
> ensuring the PMU state stays synchronized with guest mode transitions.
> 
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/svm/nested.c |  6 +++---
>  arch/x86/kvm/svm/pmu.c    | 12 ++++++++++++
>  arch/x86/kvm/svm/svm.c    |  2 ++
>  arch/x86/kvm/svm/svm.h    | 17 +++++++++++++++++
>  4 files changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index de90b104a0dd..a7d1901f256b 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -757,7 +757,7 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm,
>  	nested_svm_transition_tlb_flush(vcpu);
>  
>  	/* Enter Guest-Mode */
> -	enter_guest_mode(vcpu);
> +	svm_enter_guest_mode(vcpu);

FWIW, I think this name is a bit confusing because we also have
enter_svm_guest_mode(). So we end up with:

enter_svm_guest_mode() -> nested_vmcb02_prepare_control() ->
svm_enter_guest_mode() -> enter_guest_mode()

I actually have another proposed change [1] that moves
enter_guest_mode() directly into enter_svm_guest_mode(), so the sequence
would end up being:

enter_svm_guest_mode() -> svm_enter_guest_mode() -> enter_guest_mode()

[1] https://lore.kernel.org/kvm/20260115011312.3675857-9-yosry.ahmed@linux.dev/
