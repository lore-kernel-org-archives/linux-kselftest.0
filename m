Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979387;
	b=vKZ7Y4aBT8MM+rL9NMG9tUxP3VQ5vdzQktQt2r/IP2Fd52AoF6MoNxnUnFPrYok2m9gw
	 OyrTJvhtPosRcyDuQYzN8sDmSvSc4eTjDx4QkP8ac9Uqdb4jiGznfpCU61oJ4QqvYgyTq
	 hkvICaO7P1VCvaFdVdj9bxB4xvqa/9V9GjQd1kMpnXgVl6M1BOcWmMmy++Efv2xwReHid
	 7OJ/zvOBDz/w53ohSXR8DgHj/NZylVwe6woKP26CEemhr32ucx9ivRbZpLdwVjsxjv+UV
	 igEuFzeH1+srC38Mcil4QABldRyGlwOMQbuV/xPAWuKRJsg6zWBe++dOSlApItUMtnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979387;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ofV2qVpqrfBMyd1/zLMm6/WPtcgEV4myUPpyNdz12kw=;
	b=LUwsJjTHkFWzs0Xnyq54s+Y03U4/D6CW9ZT3czavOCUySm3XDoIpUVkT2tcGYZxGIYZk
	 cVbbdJrq4BvjjDmZO+VJl7/P6LEB6Y2Mb/5OSl9PH0LOMC5+MSWV4uXLL4ybK6D2DDed6
	 2E/mFfarjDv5s46iBVFpl8BhU9omxBzjfqaYF7fPXsvSOgKYo/cMTGWcf8yvvVzQU6jEt
	 zomc/kmgiznhZ/Pro1pI/c2Uimn4SVQzsxTu2tH8HK3SBKy+cvvSbbZoxdXh9FRtykzck
	 L78C45/J5c0UbhLSslZa4RzaZTgeYrcs98VuCAvgwAISCHSZ2jMeVFxqLepcpRf6/sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="S/gsSeFn";
	arc=none smtp.remote-ip=95.215.58.141
Received: from mta1.migadu.com (out-141.mta1.migadu.com [95.215.58.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985B606A332
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 15:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0985B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S/gsSeFn
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ofV2qVpqrfBMyd1/zLMm6/WPtcgEV4myUPpyNdz12kw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793979385; v=1; x=1794584185;
 b=S/gsSeFnokFkx8nPcNXUrBm32YP291abQeKX4TDjgIYEXLyWf/PtmjDda/dTmf02WCz5IyRw
 Lpnxc2vUXj4ewrMgQkalcGsovWgtoa4BNOpf2Vu5e1BeAEFPyKQV+LNwIgNVx3tKkE30lLBcqZ2
 9XiOr+QKebA3NFO09LYfjuQ4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aaed89f5e0194f40;
	Fri, 06 Nov 2026 15:36:25 +0000
X-Mizu-Trace-ID: aaed89f5e0194f40
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so807e87.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 07:36:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBybxnxF2QAefjcrQer6mMLfLES4vnltP6E45AQ4oOBHyFq3M+m2uGjQYKjas+Tb/s1a9Ju6Sxs41ENez21OLHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nae9Jeq4U6kU6HGR1hmwg2reR0TmEPi9kuyNSaUgvdYO1PJSO
	ZZambudx6VPT6K1vDk9QD27zUs7zmQrxAHs/L/J2gLcTbXCrO1NlF0cLUrMn7wF+GdROZLSO4op
	f2mB1nUF6bKet2qKVIs5rUwYZ1YI/XCSbI8lpOqij
X-Received: by 2002:a05:6512:1056:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c00a413bc5mr6933e87.10.1793979382196; Fri, 06 Nov 2026
 07:36:22 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104084842.132944-1-fuad.tabba@linux.dev> <20261104084842.132944-7-fuad.tabba@linux.dev>
 <au3pNFOMeIx2X4Dp@e143914.arm.com>
In-Reply-To: <au3pNFOMeIx2X4Dp@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 15:35:45 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwMv8NZvTy2cVtGRLoHxABZiv7yYUdRBHE69ieFUxoRXQ@mail.gmail.com>
X-Gm-Features: AclHuK_ZZQXxaDxpRQHq7T9rnG0s3OxixfWJ81iGmmqdPNJp-0OMdSXL2rZvnds
Message-ID: <CA+EHjTwMv8NZvTy2cVtGRLoHxABZiv7yYUdRBHE69ieFUxoRXQ@mail.gmail.com>
Subject: Re: [PATCH 06/16] KVM: arm64: selftests: Add protected-VM library helpers
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 14:50, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> One minor thing below, that could be addressed or not.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks!

[...]

> > +void pkvm_run_loop(struct kvm_vcpu *vcpu, void (*on_sync)(struct kvm_vcpu *vcpu, struct ucall *uc));
> > +size_t pkvm_host_locked_vm(void);
> > +
>
> Could add a comment here:
>
> // Called from the guest
>
> As you have those 'Call' / contract comments above.

Ack.

Cheers,
/fuad
