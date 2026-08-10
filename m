Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E124425886
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403124; cv=none; b=JaTi6i+CPKmor0mtGJ/ecfHJKW4pv4p5QH00Fe8u7PH0vuho81Ok3Wli7BLxKfyoQPwMXs5cBogFOdpOv1bXnDOakuYdRho+LtvNstQ2IP12ocykEE42FZtzCOgNjEiT/50h4vPP5Gt4gjHaKYwUEUlR4MX1I4AMqyJyNyTbx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403124; c=relaxed/simple;
	bh=1UixVDhcKktfLAVV3KH2xdxG9X17YLjD04ZwlUbLKmA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f18d/RYHoLWM0NAxoXpIY4eMEw4yV55HjEgmL/2FrG4XIvU4SYW3OdVvUknqU/kZLPhBjRk7fGcKkJKKhopeEXgk2/TDvPOCcaBzAqFT+6nll221QsVPU8ZT0Av0LDV2jddjvK5JKUIx7Xo+7ozdqZOYuM6L96ExK6D4zsc9kzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=in7jiRgQ; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="in7jiRgQ"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8486c3411c8so3423874b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786403122; x=1787007922; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9OrpqxZWhRM/HFUiR8JGN523y//wB+NGc5onZ0jOJQ=;
        b=in7jiRgQ4y4nSlP2ti2hlC4pWj0ssxrD7VlSOSQ23O2AZZQPOoPApx0AdVZ/KZiZaS
         vCKgfCLVcQx/CuPJcA4oe/2eL1Zq1v5jKF+38D+z616QAHspIus7C112/8NhLZw5+YWV
         8CShGUyObkww6pRdQA4+yRq9hgAGA58FWXz5A78WNhXfjQ/n6tNYqGRk9z8qVsJWXFnK
         wrqf/eC7+2BXcxX51uqLYJU2BFug4zyTSJG6EupkLav4U1ouCL2xQlDVnNrQTTqKhqH/
         Zzb0f5a97+Ng0zfpv8udzvIKiU8KI+CfOd5qSYz3eKw9umlbP8N7i7dPpW3u8Lky0etc
         qGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403122; x=1787007922;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9OrpqxZWhRM/HFUiR8JGN523y//wB+NGc5onZ0jOJQ=;
        b=G2TZOnR55QHYEdLzZwQe37HLC7XYWfFsT+OA56O2JUqBO6Ix9JrKzNo/FDzqCfIk3l
         +OULZWZOY4PcLbunF01z+UyibHX2nW8jVsn8hPNRaduJAzsCRKQlNKCp4zCM0EYjsOBI
         B2dAYbBRzZq5KHA8KEqWzij5kfKvgDB3dAby4gA8qch6IklJyLkmNkGmztt+4jzK6WEM
         kEnf+NIqr+r3f3re0iWcbY6qYZsNBbJmdtUTisl7l4Fq+tPVqkG0iAYahkBObGeDaZdr
         IzcgY/1J9vqYGXP1I9aVaMM7pfqi6L+p4lAJ+VL3XdKKduR0hsWNef7VRP53kL2HFmbq
         2XwA==
X-Forwarded-Encrypted: i=1; AHgh+Rrmagv023ZlbWGelHx+6Onsf2zobD3/Oc0cjJiLwXeW86QySzEZFYwfaV6BWtmQysyhEGRS5gQOaVVJLASgcg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza53QuzAIR0jKgpJRfamNZdyvQ8aIKE/vY0kXiqx43l8PnkTIA
	IlUZ9CgTsry0/0LlVHaVf/N6PJFBIBO/BJwjpQ2VunmHSkjrFcrViyQdtV+z8JvqidZQiPeoPbx
	hk20GcA==
X-Received: from pfnv2.prod.google.com ([2002:aa7:8502:0:b0:847:7765:a4c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:420c:b0:848:2f2c:b2c8
 with SMTP id d2e1a72fcca58-84f9c95f809mr5850968b3a.24.1786403121703; Mon, 10
 Aug 2026 16:05:21 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:05:21 -0700
In-Reply-To: <20260728121138.1103610-3-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-3-tarunsahu@google.com>
Message-ID: <anpZMemVz5yC_WLo@google.com>
Subject: Re: [PATCH v4 02/11] KVM: Introduce kvm_create_vm_file() helper
From: Sean Christopherson <seanjc@google.com>
To: Tarun Sahu <tarunsahu@google.com>
Cc: ackerleytng@google.com, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	linux-kselftest@vger.kernel.org, andre.przywara@arm.com, michael.roth@amd.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, will@kernel.org, 
	vannapurve@google.com, maz@kernel.org, fvdl@google.com, kvm@vger.kernel.org, 
	oliver.upton@linux.dev, kvmarm@lists.linux.dev, alexandru.elisei@arm.com, 
	skhawaja@google.com, aneesh.kumar@kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, kexec@lists.infradead.org, 
	suzuki.poulose@arm.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 28, 2026, Tarun Sahu wrote:
> - Move ITOA_MAX_LEN to kvm_mm.h for reuse by upcoming kvm_luo code.
> - Introduce kvm_create_vm_file() to wrap kvm_create_vm() and
>   anon_inode_getfile(), providing a unified VM file creation API.

As Ackerley pointed out, changelogs that are literally a list pretty much always
needs to be split.

These also need to explain *why*.  "providing a unified VM file creation API"
isn't sufficient justification.  In general, all of these changelogs need to
provide more of the "why"; I can figure out what the patches are doing easily
enough, but in my speed read of the series, it's hard to figure out the "why".
