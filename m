Received: from mail-108-mta136.mxroute.com (mail-108-mta136.mxroute.com [136.175.108.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85A3C5DDC
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 06:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087143; cv=none; b=U/06ZbTxY15Z/VPP1Hv//awFK12yj+nxS0X29ydArVXt+/wdclsbtChZC6ZQVIXSWX0LmDTnx+CJUupLnxPBZU//5Y+p9EIBDRQie5vUB7ZMqK8e0q9kyCYjXxHlpKqt/rpeYdhmKqC3jQD/rGJq9VuAfmJI7fO0NNdA7TFKMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087143; c=relaxed/simple;
	bh=9Ul8tDS8RWFcTTIB7woEmHR85Y17odDIHxPntVubcGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSGGxSkvnD4Z1UkC1g7aaH5SUbGzDbyOLxo+OH6gHYPcRDnhVjXYBUjun1RS0HCgrkNVAEaBLm6zqKL8/95XTgGAQswfR+YGi5IAMmyL1ZHTIEjPiuFkYunLa00ethmebyVW+swm0KDVkrMSSGU+b+oVQ2pNwLhe4xsGQIdsHpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=YI4PRc4v; arc=none smtp.client-ip=136.175.108.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="YI4PRc4v"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta136.mxroute.com (ZoneMTA) with ESMTPSA id 19e39d69e2400067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 06:47:07 +0000
X-Zone-Loop: 89725232838cf32224530d351f533aade434724958fd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=w0UMA+XCQeCnqyZuB8gmN29dfFtWO2qyTm3HmkBTUuU=; b=YI4PRc4vDwNj+zXZNo9U/emECj
	YKzWO813etclhr4C/YNrEh47L/JglHJOilKiKHsbVy8AgDYzzXfcq3BJpWGDF1EAYMvhn20KDeaOh
	4UqL3gRmEPrvHv9vK7yPvroLm0pBgOVJxahE0AlgNaMv+16Mk4OxW4pJPzhj+z/EpMYTrwc47jJLo
	ujsRsSW/TgnzMwrYEeaPqQiHe95nUdpMUOakxKQXh6CBXCHDI240Okr0vqfTG3+IQ4JqS2aWSB3PE
	MCjXvvvHpfNVvS6B8c71ppn2Ym6jWch1M/yyjixNuBuroX1/uMSExPYC1YOWtjImsJI3ialQ/NyiO
	J4MLY5/Q==;
Date: Mon, 18 May 2026 06:46:56 +0000
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] x86: expose user IBT via PR_CFI_BRANCH_LANDING_PADS
Message-ID: <agq14AaohMEb8mDt@gusc1c-ossdev-firedancer66.jumpisolated.com>
References: <20260517183024.16292-1-ripatel@wii.dev>
 <20260517183024.16292-6-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517183024.16292-6-ripatel@wii.dev>
X-Authenticated-Id: ripatel@wii.dev

Thinking out loud ... sorry for the noise

On Sun, May 17, 2026 at 01:30:22PM -0500, Richard Patel wrote:
> +int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long state)
> +{
> +	if (!cpu_feature_enabled(X86_FEATURE_USER_IBT) || in_ia32_syscall())
> +		return -EINVAL;
> +
> +	if (t != current)
> +		return -EINVAL;
> +
> +	if (user_ibt_locked(t))
> +		return -EINVAL;
> +
> +	if (!(state & (PR_CFI_ENABLE | PR_CFI_DISABLE)))
> +		return -EINVAL;
> +
> +	if (state & PR_CFI_ENABLE && state & PR_CFI_DISABLE)
> +		return -EINVAL;

I noticed the caller doesn't filter input arguments, so uapi could pass
garbage flags, and we need to filter here. Will fix and add a selftest
for this in v2.

I think the RISC-V code from which I ported this has the same problem.

> +void reset_thread_ibt(void)
> +{
> +	current->thread.ibt = false;
> +	current->thread.ibt_locked = false;
> +}

Should I add a comment here explaining why setting U_CET MSR is not
necessary here?

>  	reset_thread_features();
> +	reset_thread_ibt();

There is quite obvious overlap with ARCH_SHSTK here. The problem is that
'features' is gated by USER_SHADOW_STACK, and I didn't want to cause a
mess there before asking. x86 maintainers, what is your preference?
