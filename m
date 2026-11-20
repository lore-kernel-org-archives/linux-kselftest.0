Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183768;
	b=Ol+7bGFffQdvLuS8eQPYnvONvVfKEvFUzgO1VJuS32x//b0YGh1KH2yw++Y5a9B9yJhY
	 /WminFlfZbUq0SkQ8j88Cw6fIrfCtxMayMaTGAqg9/vodD2709qifc11NL5WB7wcbihtg
	 bH/YTrXzAha6dkS3GIp+fEKL9TmOJPRhx4Y+RZ5F/wSXXXKUZyQrjunz/Bphu3R+tWaNb
	 fhUyHQrajL1sEX0bPii39xagWhCcoYMQ7fdsCrEz+3GwU4qmYXMajE+U191+LD62777Xg
	 jCWh4CgpPPeVbEaxn9baGSq8ro39/AGIxYFWyJT54uzjeSoNtmt4boINxj7O78FF0LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Fcs0DJBKtZLUxloKKuDwNaVEQG5Sv/NarhrhzSQukPk=;
	b=TKVwDOOAT6SjDuNBm7tgtxoBExFxzqvFm9oVwb50qYvOM62TfJJtjp0Am15VTOxXblLe
	 4W1x73DBeEgJXYWGoUamVP/krjR8pCFzMTaMCp7qHYlmwTmUaMdZf0xk31rqYCrVsmsAg
	 VDEfUbO5QDPzlHxkQ1Q1zKTgNS4QVMjWwlQbMdr6X/EGZ3W/PwWzNlXy9lGWLlzvkRRN6
	 H/oRGUfIy6fRxO1rvsKygeiyzUX2bpAbfl94gzwhxkzju/O0NT399fGs9688GZCaAY+F8
	 TCO3d64hn3A3JO0aRXfolhw0n7PHpq5T0O8S+PdWeR0ZNTHFJOx/eIczo6zYK40Fu0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=phsZOd6F;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A959606A320
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 14:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A959606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=phsZOd6F
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so923707b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 06:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795183768; x=1795788568; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fcs0DJBKtZLUxloKKuDwNaVEQG5Sv/NarhrhzSQukPk=;
        b=phsZOd6FHm2fLXlBEPUk4HxHQsr2YjaF/8w8uBbsM/PVnx356OU/hMbwUbzUHLeBg3
         qHulj4rKFN9eSri/EBSKVaLa+0AQcb3ImuX8vxCNSMnrR8V4jU54wTq6dFhHpi71fH/z
         6XWFpi8deUl4U2lVzNSiE/+4/UY2tuES1tkJhoC5wME/1koEmYrUy2UyQ4zF3rnIdiAG
         TJu2vG9djnhknQ0fmwqmmjfxBxl7SrmDA2hz0Sc6d/KfCkF1tkKrSF4jZZUo0Paf6fJN
         zBUoCLo9FqJpdsnseJS2iTmbWZtGMaTAuCyL5OEHvpppSWxcOl9ntNLlkK99SXPO9/6y
         kEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183768; x=1795788568;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fcs0DJBKtZLUxloKKuDwNaVEQG5Sv/NarhrhzSQukPk=;
        b=Zqukpk6Wo8DK9MQ5CjVGTZ2oD/oEmER8VjvGPWjrzisRoMyuij7Tu8i4fT6Ix16XPb
         AaoRbqKOw67NlgCq7wQRk9yKRoW++EeyqOA3CYRDs97nQthWVja1C0KXJk5hyux9cpbk
         og2ufg/vnX2sd24wCMgVt1qnWbz7cjboOI+FdAZgwC/Ut7AznHT0VHcltFG83pug5Ka2
         f9qi8I8ePnj8EdLlyDEvtIq2My7gkFvI7zu1T3XZoStI7VrHrBhNPgh0hxlfb3YGHgo8
         D7//XrIaWcZejLpM1nYmXb/c+HQl4uJfpjFO1eaLy2TzM5x07FftLQT/ye79AkPkflzZ
         dNOg==
X-Forwarded-Encrypted: i=1; AL+hErH/KJylfcMVb5tjRPn9gcHAycvaouM6R3txG8bREQ3ELo7BR6gREoZQi966/vEaBmoaJxM/MMsbJNbMooc8yeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XEtRDv+Tabq4SU6+hZtCj/0JBS27ZFhglxE8p6Ns8/YCUHmv9
	wFRhzN0VMPUdNls+8CxSlqOv6DKtcm+J46n+R9M3AlQN4IP9Ch3sK1Fy3t3qPuxGAWRhtEP2mSx
	D2rWnJQ==
X-Received: from pgin4-n1.prod.google.com ([2002:a05:6a02:8784:10b0:cc7:cad8:adb5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d52f:b0:3de:b95:d50f
 with SMTP id adf61e73a8af0-4014c945bf6mr2794811637.24.1795183767718; Fri, 20
 Nov 2026 06:09:27 -0800 (PST)
Date: Fri, 20 Nov 2026 06:09:26 -0800
In-Reply-To: <20261120-gmem-selftests-fix-v3-0-d94ffe17ead6@amd.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120-gmem-selftests-fix-v3-0-d94ffe17ead6@amd.com>
Message-ID: <awBUlv3ItZiyZvlS@seanjc-mac.roam.internal>
Subject: Re: [PATCH RESEND v3 0/4] KVM: guest_memfd: fix NUMA selftests
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Jim Mattson <jmattson@google.com>, Peter Shier <pshier@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 20, 2026, Shivank Garg wrote:
> NUMA selftests in guest_memfd_test assumes that node 0 and 1 exist and
> have memory. However, nodes can be sparse or memoryless which would
> break this selftest.  Select the nodes from MPOL_F_MEMS_ALLOWED instead.
> 
> Based on kvm-x86/next.
> 
> Tested on bare metal and in QEMU. Without this series, the test fails
> with EINVAL when node 0 or node 1 is not an allowed memory node. With it,
> the test passes for any set of allowed NUMA nodes.
> 
> RESEND:
> - Rebase on kvm-x86/next. No code changes.

If there are no code changes, then there's no need to rebase.  Please use
RESEND if and only if you are sending the *exact* same patches/emails, e.g.
because you missed a To: or Cc:, or a mail got dropped by your server, etc.

If you want to ping a patch/series, just ping.  v3 is sitting in my TODO folder
and applies cleanly, i.e. there was no need to send the entire series again.
