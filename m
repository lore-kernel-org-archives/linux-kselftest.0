Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002218;
	b=pCi5Cffxfz8lGcP4g9SP8jYXPr92xhZJwivpoEOqGjFUtaSu4nWX24nPAF7elHBeN7pq
	 xrzYVjnKoZCHrrnL+NddDL7+vwdLy0RfdLktMIivoQbyWJzlsL93vzVLVD7DN/WsZfXy4
	 lUjp3vRuhQSIJiwRXnWK1ZzMh89QYaXaza8GlG9TZ3ZCmBMWBP5z3yCd7leMUVsuGPiGx
	 HUCaG3v/FZIeq53mUOdqmuf+YdzXbrPz9RvXYAqMI0lgafduyW9jL6CRPYSDN66wEcbqi
	 lt1UUYJEfOsBCJCbFR6JIGq8VWfhLqAR+JicbDAZdEw56+d4P1YlFS91vaS9OZaKIIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002218;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SU/p59HmrY1l63uWO1J6fBGj9iSaP1sfb4BVk3OH0dM=;
	b=NOtiMI5EAsr4n5sTrLofAAaWHzqsWq1kuyWmqqx3cTwfrmueNRZxoxI5O85vM/QoHnzs
	 1Rj3IGMv1uTi/qH7N6VgHursa8kRrXj9dI5pjWDzMzJTMnSv1EJS3ErIc/EQRg3YAexN5
	 javffhNy9q4MYXsg1fTFfQGnnRynwn4BJjzPk7LWWn51Wiq2xenE+n5hBDOPsxSQaH/DW
	 99Ygspnnqvol3PAQpVE848WAt4RSWFKyjTe50IYNc64/8vIdUWJV1WAhEouoPgrgpsKi4
	 mnbcGPjK7b9kftMboDs1olzQAEO1DTYtjXWbpF6YqFYNy1B8P2h5z35IN6uHBC94XIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xo3+QzWz;
	arc=none smtp.remote-ip=91.218.175.244
Received: from mta0.migadu.com (out-244.mta0.migadu.com [91.218.175.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34541606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 08:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34541606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xo3+QzWz
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SU/p59HmrY1l63uWO1J6fBGj9iSaP1sfb4BVk3OH0dM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793002215; v=1; x=1793607015;
 b=xo3+QzWzJteLbNU3D1rBb0LpexN/nOrP7sDl+8i4KFfDJcU9wNZ2WIWFqwnFUoj1ib7qZThH
 lFjHr0YLkJCsd/hWTefzgbNhW2rrkXKc8xl7pus2z5UaMUQyNPBW9xQ+ffavvCLLWI8xl+6ormc
 2wV70k43g48QzCeHXIBFAAug=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cc84be8be0ab8bb8;
	Mon, 26 Oct 2026 08:10:15 +0000
X-Mizu-Trace-ID: cc84be8be0ab8bb8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso6226e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:10:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwv+upKjgxHRIXmt5itsgdWxoHvX8RroFHZSjmOgbTpyVR2DnL0CA5FMsbEBBs2YDEn+oI5zZGmzQk0zx//suo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjS8NUCywUklAiysUHzdUz0KIx/jWhGOim2IBQFlvJrkx7CzvN
	ly3yiNOBIPPvq8yFjYjnv8J4MmNQr653K972IkE6e+sYRlzwptT+xJYex9E10f47KwlsBcV00oG
	+wHW59Kdk6lq7OmbKNtjkoUUU1wEhsRlVpxGbfIrf
X-Received: by 2002:a05:6512:3f03:b0:5bf:a28a:f2d9 with SMTP id
 2adb3069b0e04-5bfb79dafd3mr111700e87.4.1793002210084; Mon, 26 Oct 2026
 01:10:10 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026012128.2270251-1-sashal@kernel.org>
In-Reply-To: <20261026012128.2270251-1-sashal@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 08:09:33 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzF5PsNt+riasW-SK-nhkLYh3kojMFyCEqs372-Mficnw@mail.gmail.com>
X-Gm-Features: AclHuK9ieRbKRZ3vlLRpK7x9lOVSGw-njZY_CzO5qLbrpHOtyOHbR5m8v7LhEMQ
Message-ID: <CA+EHjTzF5PsNt+riasW-SK-nhkLYh3kojMFyCEqs372-Mficnw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: selftests: Skip unwritable ID fields in
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

On Mon, 26 Oct 2026 01:21:28 +0000, Sasha Levin <sashal@kernel.org> wrote:
> test_idreg_frozen_after_failed_run() checks that changing a feature ID
> register after a failed first KVM_RUN is rejected with -EBUSY, and does
> so for every field of every register in test_regs.
[...]

I tested v2 on the FVP AEM model configured with no AArch32 at any EL
and with PMUv3, under nVHE: set_id_regs fails on ID_DFR0_EL1_PerfMon
without this patch and passes with it. It also passes on QEMU (which
supports AArch32 at EL0) under VHE, nVHE and pKVM.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
