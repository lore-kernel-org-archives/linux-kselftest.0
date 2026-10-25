Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917312;
	b=2ngCUpx0iGzq7BIXOBOpjquDZ+uSF9Pe/0AdqraC1EydMwNdUEk6su21A1us/B/WS77/
	 TT3WUpiPC/esweKZ1wlugZoc8WJTrO9N9+79+6rW3baRI20+JjVEQD1it3MHJApbNivkS
	 Torj1SU5I1p/4blVE6ZGN8iZ5V34mU1nJAyTVkDH262VIrNa+8EUqCzmJqfYTuzMxm09Y
	 OEL7pE0Dz6J6iMFooCqEr8lggTGrulf7U2GQy1BFoJhI6iFZEdSjOGrlVbQnruICTLfrO
	 bSX+hGbTE/W0Qpc8HVJZzY3c+1UC0K8qbuuRZELfXY93HCcvatixnbw73j3PgrNokKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917312;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Umtx2QekNJJOh/UY3thL10Al6ydHDa8XNgIJCQa01dk=;
	b=xmo0I6ZDqaX6PQySy50fSmDwPvwIxW06/Z1k9l61LruglZ3giOjmrrVUozpT/RHHfKJN
	 xJH9Vr1VsP6rt7VQqM6uQ7Iu4Z26oFLqnX2tuc53urJdt3rejGCilojYLC/OR9bHpJMwj
	 ZtT39eo0lpOOdMDcvKyEQvDbCjitX7YSHRoqER68B9o4DF4xlN46ImeXplu/CHEDsBSp1
	 ZgCfhlMpXRn5RkE4W7UHd3+PFrk/6jwo5tKqIYZUjT42O2v8ESrGwHd9wb8a9ykD4x0SN
	 Vfv1fNESHdG2hJgt1yugKc2EsDhERWiwCNqxvCZp+OBOGGEoq+5fuSR64dOGMpvo+mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kajcdNzS;
	arc=none smtp.remote-ip=95.215.58.129
Received: from mta1.migadu.com (out-129.mta1.migadu.com [95.215.58.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF0A606A31B
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 08:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kajcdNzS
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Umtx2QekNJJOh/UY3thL10Al6ydHDa8XNgIJCQa01dk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792917309; v=1; x=1793522109;
 b=kajcdNzScUtbbaW7DnHWa4/ZghWKPwytrBOKBJpupAdKlGHSk6I+tbG2uL/MrtVVwIPI/rwC
 UbCEnfsPny7ALQYzeoqIJEXQRpuTwiWsMTnDvhLhh4U5oXCBXAU0dzv/J+i+OVVGElYVxUyuUgD
 ANIdWrf0wSTCEW5b8UOmCf3E=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bb230e1cf130009c;
	Sun, 25 Oct 2026 08:35:08 +0000
X-Mizu-Trace-ID: bb230e1cf130009c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so3998e87.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 01:35:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDHO1vKYqXCOV/dXjb10xmXB4XO8pdjqPU3S8Nqjrv7V5+nVCsgriVoI/JeITzD3/LGS4l3Fh53ZRvQaZiE5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU/zx5YoxLT2Nbdywz3QH4aRdYLSCcQxKdCBfnLLasiEoExsjq
	qECD7egYLe3SXVDcErCGKgeaIMNuMBFOx7i5G/OXGKlsYD6jLKrmzv+RAsM+koioQuwgDWVUWQe
	gxSaf1vW9IoiABU5ClVb61ie530/Wh8o5/xqzjFp4
X-Received: by 2002:a05:6512:3a8a:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bfb79cfb9dmr89930e87.14.1792917307506; Sun, 25 Oct 2026
 01:35:07 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024161118.1007472-1-sashal@kernel.org>
In-Reply-To: <20261024161118.1007472-1-sashal@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 25 Oct 2026 08:34:31 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxKRThB+kp33nALkEejj2L8vDxE=SZYw+0KyHodYu0y8g@mail.gmail.com>
X-Gm-Features: AclHuK_kP_F3xF9Iyo3ZWQZWl_t2OJWVWAHcLTFVaYw38-o0EI2yWRjxxMOJhA0
Message-ID: <CA+EHjTxKRThB+kp33nALkEejj2L8vDxE=SZYw+0KyHodYu0y8g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: selftests: Skip ignored AArch32 ID regs in
 the failed-run test
To: Sasha Levin <sashal@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sat, 24 Oct 2026 17:11:18 +0100, Sasha Levin <sashal@kernel.org> wrote:
> test_idreg_frozen_after_failed_run() checks that changing a feature ID
> register after a failed first KVM_RUN is rejected with -EBUSY, and does
> so for every register in test_regs.
[...]

I reproduced this on the FVP AEM model configured with no AArch32 at
any EL and with PMUv3, under nVHE: set_id_regs fails on
ID_DFR0_EL1_PerfMon without this patch and passes with it. It also
passes on QEMU (which supports AArch32 at EL0) under VHE, nVHE and
pKVM.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
