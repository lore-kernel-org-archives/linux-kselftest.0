Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CB842E40F
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157840; cv=none; b=L+oewjRbHpAbinSKzh80JTwiAERkNM/KFOx/er2v8MWrs863cf/S6LUlHkXUKymFAqcvTLNnQc8SgbSW9IT/5Am/YJ4il77KvGjkgl+I14H+i4Z48HuUb9MV0sl2vf7DDMGpPLb9Lm/z4y0TO4yvvKgJL16GDs7p5ijHQL+XqLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157840; c=relaxed/simple;
	bh=xyyxgX6Z2IBzQdllFbMd3l1KS0QkIUQEnt09r+FTDSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6VJw0aCjkZTmJXc1T34WtcjVIZrsYTahoX1HoW0V7AfyS9NNjzO7Y+19ddaW6K6x9Sm/567TSpAYBub0RtbCvXV+LeepPIRdqnamh7cXJhDCwxgAV0LIH4wYYuKd+rIxXetAKEgi8KYFmQv/4tKpm9WqG+FyVurQf92D3HcnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w1XL8vr4; arc=none smtp.client-ip=95.215.58.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w1XL8vr4"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xyyxgX6Z2IBzQdllFbMd3l1KS0QkIUQEnt09r+FTDSw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790157836; v=1; x=1790762636;
 b=w1XL8vr4DX/F/SVohxkQna2KJfhkjuYXt02fDxrQxujKZBQh7jRuRg6mVjku4LNVJ5N6DXDz
 ig5jXYnE1ZiQ8xM4OO3vNLCdLqALQGFKi5mtDl1AQt5ycaToPGNqU/t7Tq1FXv89ruqjGuCurlf
 dT1vfOG7BNoo6G6zSGPEkun4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2abdc29687e91d12;
	Wed, 23 Sep 2026 10:03:56 +0000
X-Mizu-Trace-ID: 2abdc29687e91d12
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso4715e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 03:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8X/uo/Gwr6YdGrQqJIQig3eCh6Y7gejdS5k4m4McHJFnjhlQfXQeyTE0K1+2771TraFF+JrzgkUMT1SGASKE=@vger.kernel.org
X-Gm-Message-State: AFuF++kOUFl4NadjsgADYWS6RsBrrS/zRDmg/6GNahUc7hKi59JTYZzQ
	DNU+RHH0rHAIt+bC+daXk/EfO/LLrTCwU2C2jlRZNreOossbhfbKc3DFZNG1aHVFOA4XhgU4lWB
	ZMKSxia9o/DaaEWRNI31TolCjmYI7QZ3XZoXyrqyR
X-Received: by 2002:a05:6512:ba8:b0:5b6:bcb:26c4 with SMTP id
 2adb3069b0e04-5b8d885c755mr142676e87.16.1790157835308; Wed, 23 Sep 2026
 03:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 11:03:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzpYRu2xq5VdoxodyDqLTJrcoaSrfGq=DXh283TYPJ-OQ@mail.gmail.com>
X-Gm-Features: AcwNN1Uc3FNAcNduJiv3v9IEKpsaLZzqL8bqap-uQ6FOvMoC3rZk-evpRR8tlZg
Message-ID: <CA+EHjTzpYRu2xq5VdoxodyDqLTJrcoaSrfGq=DXh283TYPJ-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 22 Sep 2026 15:17:54 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
> This series implements the KVM stage 2 page table pre-faulting feature for
> arm64.

There's likely going to be a respin for the arch hook, but FWIW,
tested as follows:

QEMU/arm64 -cpu max:
- guests boot on VHE, nVHE and protected-mode hosts, protected guests included
- pre_fault_memory_test (all guest modes, anonymous, THP, hugetlb and
shmem backing) and nv_pre_fault_memory_test pass
- pre-faulting an uninitialised vCPU returns -ENOEXEC
- dirty_log_test, demand_paging_test, mmu_stress_test and
stage2_block_transitions also pass

Apple M4 (nVHE, 4K and 16K pages):
- pre_fault_memory_test passes on the five guest modes available
there, with the same backings
- in protected mode (4K pages), the cap isn't advertised, the ioctl
returns -EOPNOTSUPP, and guests boot

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
