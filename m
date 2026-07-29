Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C59476CDE
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325185; cv=none; b=YxmkTrKYtgvhduPrFYkk3ydd/i8bzjR/VKW6rnPj1MuM5xRana5oewYXZB6f/nn8pffEk8YTlM384QTb258aVsCQY1YpVPk3ejrVLeWTOus8y1Jr6IIYVjoCqwzQGTp29vnSHYjO1GqWjYKqcmgHoXx3wg//t2d59X+Ff3Tf+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325185; c=relaxed/simple;
	bh=TdIA0C+hvWbuO2z/X3tRH27TnhL//kWqbhu9cqVNunU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oH8nCFMZDiYggXhLHXwkVw4+JfTMdPOpia3CKhFdkv53HqdjuWRNDkfiSTjmMzytbB2QUJFiEkLLXh6xy1sUzv2O0QLuEVHIe+Eai366XRoqKmN3cEVYSFSNiCoTVcfp2l9Wa53va92sc6JmxpHKd2MPrjzDFxMsOvLZnM822/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M9UqTl2+; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M9UqTl2+"
X-Forwarded-Encrypted: i=1; AHgh+RqnKHeYWrdtl9gkq7/HGGNHKvCgaSR9e98rtd38ztTn6yvMEpt87g5BbymQiv/88A1Ye6+IXyv61u4dZ0Grtq0=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785325181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgvBuiLRj24R5eL34h27DbmmXIsCnSbcavTOpGhYHMk=;
	b=M9UqTl2+sjfchHy9dQ65eX/9HZKSyBOvvivOl6iki5YH5gJPh1tMap+VPiaznT/soPQz1z
	SsC+FkY41wAFsKh52bQ+9XrZInJTEZSsz3BNAAKFvk5yFKbjLuQZUwEm8XU3VIQv2Knpud
	UvAiSAQAzPgufxwlwana3I7kn6NLzs8=
X-Gm-Message-State: AOJu0YwNymH6o0Qqhb9W5sSbN6tmf4r+mPxk23opk8RUO3DGEj37dXPS
	beQ4ejmRBffgPbODIi8kkaCUVDhnjgLQGkrEztvdJ00BY1HrUXMeAMtIUU5LXVtrjOVUpp8TGxr
	O2krnsb9aZjrBkZuNrLKbawNWDsfONrx1G+HFUHVM
X-Received: by 2002:a05:622a:8359:b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-52b2cc84a3emr5917821cf.9.1785325173789; Wed, 29 Jul 2026
 04:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722202702.4165917-1-congkai@amazon.com>
In-Reply-To: <20260722202702.4165917-1-congkai@amazon.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 12:38:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyMjsF6jp98TQhc+xBm3+p7wykeK-JMvybU+mjyu5gveA@mail.gmail.com>
X-Gm-Features: AUfX_myrOBKJjGr1oQQJhjpP2gtOW_slUtGnIubwUV7eVBsMrgW-SzxzJTTjCds
Message-ID: <CA+EHjTyMjsF6jp98TQhc+xBm3+p7wykeK-JMvybU+mjyu5gveA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
To: Congkai Tan <congkai@amazon.com>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Haris Okanovic <harisokn@amazon.com>, 
	Geoff Blake <blakgeof@amazon.com>, Stanislav Spassov <stanspas@amazon.de>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

On Wed, 22 Jul 2026 at 21:27, Congkai Tan <congkai@amazon.com> wrote:
...
>
> Congkai Tan (3):
>   KVM: arm64: Expose PMMIR_EL1.SLOTS under strict PMUv3 UAPI
>   KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI
>   KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature
>
> Oliver Upton (1):
>   KVM: arm64: Ignore writes to PMCR_EL0.N when using strict UAPI

Tested on QEMU: boot, get-reg-list, and vpmu_counter_access pass. This
doesn't exercise the KVM_ARM_VCPU_PMU_V3_STRICT runtime path, and the
series adds no functional selftest for the flag.

For the series:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad
