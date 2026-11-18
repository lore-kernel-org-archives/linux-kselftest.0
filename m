Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999507;
	b=BFfp5pj+lnT17LDy8QGZmVHutFB/10+E2SjvQDC1BY9NVcQlIse4SkOzDBGdU35Mi2EO
	 a0+TVJSRPpiB4ez+2GDvKATbcG/ezVJ0N8iwh7m72Gi4/tjpFPKbA1NvqwlPm/W8MNYf3
	 U8sFxEt25X5ZZZEd+LJCOr+y4o71D5Fur0T0JhTDViiiZrIO1cHJGhDcPPVDgfQxhrWG6
	 TSbv5BJlrFEcZTLG4wsjSGiTLXEl+xb6DrWvaKbJ6vZYpVE7LWMNhIVqWOqdurgi4ILpH
	 s6ZMftJKuup8SqNQYN7xdjQuYg7K9VqMj0Bk5Q1fxXQivs9sVTjhodZw8Fovzx/oORw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999507;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ji0Sy7yk69gklaMPP5Zc2g+qgmHVYq7bGDR02Mw+y7w=;
	b=2WclXqvbzwV/0OyyQzf6pJCCjA95WmK7kDzWY48DOTNjYIJONgN0I8sIabGuHZIBmmFS
	 RDaXBMQldnyAckYDsqyfG5nDOoBzu5x36R/ZUF65CXejPg/L7ScFIEzpw6dwW3Ki5q+dP
	 zstIhmMPpLKgZchriSWRz6GYyS1fc/qBq9KjAUvvU6lX3FsHy5S5ujNkuP0/qL3cntRL9
	 yeryHaNd0b++K+iHqLewwIdwWUY9ffgsgf6hMH9F7Jfoott6uNxJvEY/ETdhs6SS4tSVK
	 tufWTON8x7Hc2ZbvIuLgN9f+GNqg7D385y1ciakO4nOLt/IL3zdUTonNNPinZXo/gUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZGNmggXu;
	arc=none smtp.remote-ip=95.215.58.199
Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64B1606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 10:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C64B1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZGNmggXu
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ji0Sy7yk69gklaMPP5Zc2g+qgmHVYq7bGDR02Mw+y7w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794999504; v=1; x=1795604304;
 b=ZGNmggXurR8lJiCivOFgmm9zGexE/Sc3Ef9Jh96Ssyl8lUqutCToLMG+RiH2QetOo0eOI/LO
 e4pKhpPwjqABMTV5Kl3HChUqpqSa+a1C82KpZECRDuYHye7CR1FKR7VVObanxhd2A11GZJeI2N7
 5572+hQFtAIS7mZAFg7GirF0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15c8ec06d710020f;
	Wed, 18 Nov 2026 10:58:24 +0000
X-Mizu-Trace-ID: 15c8ec06d710020f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5330e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 02:58:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEIM2DEVV/TkP8V4YlH+3aQnAtnAMJlg+FGcsjx+lF9A/sDUHuZicCfYy27wum0dE3l6asWaSxCQJ15B81vK9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2ahrK08KOOso7vK9XP1Bv/P+D25puG64t8yFmfYtpd1ToUfwe
	kkUI2y9BgRZWGhvtksk0UgolwVGPjpeVmYlLmgZYASz+Gu+sY8Awhe5DnoahYzJNVWZtmh+dF/O
	gz438bg+uZHaAWWSPFUKkBkR9zRoh39xrJhDeVfJ4
X-Received: by 2002:a05:6512:2346:b0:5c1:6e17:16fc with SMTP id
 2adb3069b0e04-5c1a985f78cmr169644e87.2.1794999499497; Wed, 18 Nov 2026
 02:58:19 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev> <20261109084854.840576-2-fuad.tabba@linux.dev>
 <86bj7n1bzx.wl-maz@kernel.org> <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
 <867bia1kab.wl-maz@kernel.org>
In-Reply-To: <867bia1kab.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 18 Nov 2026 10:57:43 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxMVXR11s5_U5144hdpYStkd1-gi1P2HK6DLnn5D4RW8Q@mail.gmail.com>
X-Gm-Features: AclHuK8nMc23WqG7bzjhLPz1LETcOHXAsv2Kso31Kz9QH-6JXZhmhiORkbvHHMI
Message-ID: <CA+EHjTxMVXR11s5_U5144hdpYStkd1-gi1P2HK6DLnn5D4RW8Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] KVM: arm64: Hide generic ptrauth from protected
 VMs without ptrauth
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 10:55, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > It's in this one because pkvm_id_regs depends on it. The test checks
> > that GPA and GPI read 0 in a protected VM without ptrauth, and it
> > fails without the fix.
>
> But that's a *test*. Nobody runs tests as a production workload.
> Delaying a fix to satisfy testing makes no sense to me. If someone
> screams that their tests are failing, let them scream, safe in the
> knowledge that you have fixed the problem rather than the symptom.

Ack.

> > Would you prefer that I send it on its own, or with the respin of the
> > features series?
>
> I'll cherry-pick it directly.

Thanks Marc,
/fuad
