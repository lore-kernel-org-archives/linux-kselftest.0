Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804037;
	b=nK8ql7YY1WA17qW/lgFKsTX1Cz72GGDqP20bQm1svja/6A5JXWR9BItd4A0t2SN0oJAn
	 723kLXisFmSa7irR8Hls4cxRSwTuLoYvawXDgiLiRM88s0zvj2joVlnI2mcjm5OVGT5v0
	 zxFcK6LWeWnLscJclnqn9shR/ryvnRnSsOQupQ9+sR+39EFmIbZ8jy9vcW/r28Jp0qmPS
	 YQEhC7DvFNPkny4HeL64G8DX3xVmJ5+ePcXeigWTfPeV5iXvWo3HCWHOQ5FR/U23BBnDt
	 eMNVjoef8cLmnLRsLlRtqlX+KEoBBGwUy8SJjg7KuWGB4W6bqnJid930ciAJZj4V78g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Mg40lROHKMJpuheArNs1FLRBw+BpmUksYbkdM5o4WG8=;
	b=Rg2+Z/+JlsweiouWcFJyZ/yN0eyVIP2m1M1qMFwAXnwJk3Xuy2x7WZIscdzWUuQpHdCM
	 WdhDvD6e0E+J3Vp9P+dEyg0BTALvhzk2OoBZDDiCVoRDxvlvONiC+FD5COt3LuIaHSQoz
	 zWFPF6WZfUAMmGxbJ4IThCyQoOo+gEhRY0hxtUgyPlQ/h8CingvdaR4OLM05a+Btb5/ta
	 HiTgywG2mX5tEkxUh4HVtGJADewS6PaF2nkdFZKZKYhxarpkIN7d+KaWUN0kxZfwGbNBp
	 KJP2EVVDKVh97FMaN+Ok0guDLrgUx5eKKm7jVuBz1B8p6J71ha5TADWjF/euKtvV9xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KcffofZ3;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A168606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A168606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KcffofZ3
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so952701b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793804037; x=1794408837; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg40lROHKMJpuheArNs1FLRBw+BpmUksYbkdM5o4WG8=;
        b=KcffofZ364WrrhyE6ofKLqmFxmg7CSE9Fzkp3CVK0lCAv7ToKzakKxVlfCn7t5v6+D
         LqGCMA7pOOgzLJgEUmrAxx5PTHeGfEuxgsXVEGChIFYv+nsEBoIK6Q/LUaWlD2yXlNJI
         6zq4ydC3SpvhElqcDpD92ccQozcMG9NUKen3POCDbBqICjAUS3sYiCEnu1AYpSRK29ql
         NAhGevLKC6y5saIcrtxiNDOnH5cGC1SJq0/+T842ohmsU/tpCYVCsirvIoKV5TpmalU2
         MVu6izFD+BUMwnayWyyPYZ17XjYa/7o5BFYZhgQObtZf1clQq+CTSRcCZTnK4NXhQkhC
         wkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804037; x=1794408837;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg40lROHKMJpuheArNs1FLRBw+BpmUksYbkdM5o4WG8=;
        b=lQ/OFO4VEsIZmyDrtzOmQC+5F1Ca3q7XS5AoUrIUo3yTQ9sg0/aaNSYhH4CfHgisbs
         oreZxSLPByL6i2c2bbSeslm1njl1nDdB0JyPCVVuZ1N7fc92fLDOsGCRc/GAZDobUKC7
         JmwhHessj+HueO0+cK/7GdUZBXuT7KG9aUlU0dpl2YdUss/JcVsXGa0O5fl4r8PxbClO
         QiwkMKandVTW9EcK0FIUanr5nXFhG9gfNt3zasCuWX88wZmjrOBU1iRpvAV1o+ychdZO
         +NBZu26AukLxq8mNBbulbOe+t88fiYQEH/2JNXzGh0W0b1DNnHe3aXdBvuYoc1QseI0k
         D7aA==
X-Forwarded-Encrypted: i=1; AKwUvBwAieikeSP3jVsnqO5GNKdJSYzjZg+utjJ04YZZrAb82Q+2t+0QUdsQxZxlBnKjDetUtrIWXNn2vAv3ShMoy9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2WUXLWQ9JWprCoW0HCTSYZmCWWRe4tpr9EnqaWN9oPweF7Zim
	y2/XkkHshdHgSEmC6N/bquMV7wTxhwcSEs0Jq+w8j3W/HPTxpLxd61SV14uETddV4Xc9BEyXS5h
	Sg+1kcA==
X-Received: from pgjy16.prod.google.com ([2002:a63:e250:0:b0:cc7:85ef:361e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:485:b0:3e2:6daf:f7fc
 with SMTP id adf61e73a8af0-3e928a7c910mr13865633637.4.1793804036471; Wed, 04
 Nov 2026 06:53:56 -0800 (PST)
Date: Wed, 4 Nov 2026 06:53:55 -0800
In-Reply-To: <20261103002205.3348519-6-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103002205.3348519-1-dmatlack@google.com> <20261103002205.3348519-6-dmatlack@google.com>
Message-ID: <autHA6aNrg4s5PkV@google.com>
Subject: Re: [PATCH v2 5/5] KVM: selftests: List the known IOMMU modes in
 irq_test's help output
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 03, 2026, David Matlack wrote:
> List the names of all known IOMMU modes in the help output for irq_test's
> -t option, using iommu_mode_names() from the VFIO selftests library, and
> clarify that the IOMMU mode is auto-detected by default.
> 
> The help output currently claims that the only valid modes are
> vfio_type1_iommu and iommufd, which was never true, and would get stale
> any time a mode is added to the VFIO selftests library.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  tools/testing/selftests/kvm/irq_test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> index 8a345472df5f..ef69f9d7ac3d 100644
> --- a/tools/testing/selftests/kvm/irq_test.c
> +++ b/tools/testing/selftests/kvm/irq_test.c
> @@ -159,7 +159,8 @@ static void help(const char *name)

If you're going to do s/type/mode below, then the initial help lines should also
use iommu_mode.

>  	printf("-i	The number of IRQs to generate during the test\n");
>  	printf("-m	Pin target vCPU to random physical CPU before triggering interrupt\n");
>  	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
> -	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
> +	printf("-t	Override the IOMMU mode to use instead of auto-detecting it (%s)\n",

IMO, the "auto-detecting" blurb does more harm than good.  It makes the code harder
to read, and for me at least it's just extra noise in understanding what the '-t'
option does.  It also makes the line reaaaaaaally long.

I know the parentheses are pre-existing, but that was somewhat ok when there were
only two options.  With a big list, it's again noisy to reach the end and have to
think about that the closing ')' is terminating.

What about this?

	printf("-t      Override the IOMMU mode.  Options: %s\n", iommu_mode_names());

To go from:

  -t	Override the IOMMU mode to use instead of auto-detecting it (iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1)

to

  -t	Override the IOMMU mode.  Options: iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1

> +	       iommu_mode_names());

This really should spit out only the available modes.  For the internal assert,
it makes sense to print all modes since that's just doing a lookup, but it's
annoying to have to manually probe to see what's available.

Juggling all vs. available is mildly tricky to avoid having to dynamically
allocate, but not that hard in the end.  And IMO, it's totally ok to print a
misleading message if a mode becomes (un)available mid-test, especially since
this helper is unlikely to be used except in terminal situations.

E.g.

static const char *__iommu_mode_names(bool include_unavailable)
{
	static char all_names[256];
	static char avl_names[sizeof(all_names)];
	char *names = include_unavailable ? all_names : avl_names;
	int i, len = 0;

	if (names[0])
		return names;

	for (i = 0; i < ARRAY_SIZE(iommu_modes); i++) {
		if (!include_unavailable && !iommu_mode_probe(&iommu_modes[i]))
			continue;

		len += snprintf(names + len, sizeof(all_names) - len, "%s%s",
				names[0] ? ", " : "", iommu_modes[i].name);
		VFIO_ASSERT_LT(len, (int)sizeof(all_names));
	}

	if (!names[0])
		return NO_IOMMU_MODE_AVAILABLE_MSG;

	return names;
}

const char *iommu_mode_names(void)
{
	return __iommu_mode_names(false);
}

Side topic, the use of parantheses in iommu_mode_lookup() also yields hard to
read output.  E.g. if there's a typo in the command line, the error message is
rather hard to visually parse:

  Unrecognized IOMMU mode: a (known modes: iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1)

Coupled with the above, how about this:

	VFIO_FAIL("Unrecognized IOMMU mode '%s'.  Known modes: %s.\n",
		  iommu_mode, __iommu_mode_names(true));

to generate:

  Unrecognized IOMMU mode 'a'.  Known modes: iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1.

Which to me makes it much easier to identify the bad input.

>  	printf("-v	Number of vCPUS to run\n");
>  	printf("-x	Use xAPIC mode instead of x2APIC mode in the guest\n");
>  	printf("\n");
> -- 
> 2.56.0.385.gac671c819a-goog
> 
