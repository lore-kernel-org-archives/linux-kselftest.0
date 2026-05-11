Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872AC36A360
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 23:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543778; cv=none; b=PZUn6xpu1PLLP6vx60T0G0kGmRsWeaHx7BniNjZ+SIc47uPDqdlKnmimX8QTDXCxj80wB7kZgQG8Zt6LvwFDwZ4X9IDXlrspYaIvry3EGbN4xyuTA3jk7nh3E2osJw0QSdyzDVQRpQXxubEfeUKLX3hriJLFOeorrwm8O82d0ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543778; c=relaxed/simple;
	bh=uhJJu2sViOipR9a5Qsb1geMr6rsuIpzzaV4wu115wnc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VmzFPxH4P7NFnxPdR5R2POuphE7iCExd7LY7j0YNwR/5iuE6PT0Fwqc0dKSdCfctFDtVSRAjfnHsZo6CoMW26A/10aZYWQ1JFuFeQZxyxuBBYuBIDm0liDcgkvd7zW5dNnL8beDVXnkKl4vDCCftHHTunNt1qx1R33oM/GdZn+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mU/8CCvy; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mU/8CCvy"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so6035962b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778543777; x=1779148577; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jY/CI1emJnWJUrMbY14/x8c4oyuxC6FFn11+TJQjNkI=;
        b=mU/8CCvy38iU3nHzXKrap4zaEyh74QVla1dcuX0skA1O5VYR80Rwrfqn4J62fuJhjI
         omoYa53f5dTF/byKG08rNf2CSh4oJjVdyiXdt8jK7FMHLL3iMuhwalzzG/NGomkLbvqj
         VjdT1RzFkhClI99Ax4FkWm/xJTv+YZyPKi0u6ga3HH/SyWaC0FNHfn89Hv3OtWguYt/Y
         WLt9IU8QwTTVEyHGlfmf9Hv3Y9TFg/EAmIULTqbO75ZzI2ZoUEo7eYWio1pwnsp+iwYK
         O4EVG3g3mBbiRWj/7c8aESnLEABSi9fjuljXDwLOl79orV+D3dI9qkKRjQQNTAQPPSDk
         MATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778543777; x=1779148577;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jY/CI1emJnWJUrMbY14/x8c4oyuxC6FFn11+TJQjNkI=;
        b=A//KRVl3vR6Og6pN34R8Ap4ERWM2yFteQ7/4RtJ7/hCGdsdQ1OcGvPm2Zv59jubeiw
         BGDtUDzkAkdTXUl8iR27nJG2dK0FMeO+INLKU51yHPzbbYzAisftI6goCAhxrRlya4pb
         3X9FrTg9vJcH6y/0qHDsvfvL8o2ji9YJ0SLA9x5UyoqHm2naF9i6W33bT7qfzRH7YMRF
         rqCFuWl41sdV7KrMinVa3Mh6Esno9QjmNmiuQwrZOQKmEHvAAqmTStIGvgIDun/GCOlm
         7m8hsDNPk10r6/G6ucN0rmzZdU5+Br5/ygdsTjST2YS3fivjG1p4Sxj2KRHcHQCb8P5y
         PqsA==
X-Forwarded-Encrypted: i=1; AFNElJ9VeMviOP7wREDossiRjm9Ghmr0ocmcV/5c9aKXaO8Tdo66QDv95hbv1pGEgeU9saXJAGgWv+YDCc6nghuVoGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOZfzrGgKtb1zRLbWNt88t1+O8tIelhVzYznQolrXMZdooaF7
	fIIhE0yKVgrvS8Q3W9OOcCWD/GbVHu5OyPZY2s+wN+iY0/lSo8LMZPW0NqGfwOpupMs8v2/afT7
	iZ5KOOQ==
X-Received: from pfbfj34.prod.google.com ([2002:a05:6a00:3a22:b0:82f:b709:3747])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3014:b0:82a:65fa:cecf
 with SMTP id d2e1a72fcca58-83eeb9fe90fmr563040b3a.4.1778543776645; Mon, 11
 May 2026 16:56:16 -0700 (PDT)
Date: Mon, 11 May 2026 16:56:16 -0700
In-Reply-To: <20260102142429.896101-1-griffoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260102142429.896101-1-griffoul@gmail.com>
Message-ID: <agJsoCzokGcG5xwo@google.com>
Subject: Re: [PATCH v4 00/10] KVM: nVMX: Improve performance for unmanaged
 guest memory
From: Sean Christopherson <seanjc@google.com>
To: Fred Griffoul <griffoul@gmail.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	shuah@kernel.org, dwmw@amazon.co.uk, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fred Griffoul <fgriffo@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jan 02, 2026, Fred Griffoul wrote:
> First, the current approach is missing proper invalidation handling in
> critical scenarios. Enlightened VMCS (eVMCS) pages can become stale when
> memslots are modified, as there is no mechanism to invalidate the cached
> mappings.

This is a non-issue.  Modifying memslots while vCPUs are active will cause problems,
period.  There is no magic on earth that will prevent that.

> Similarly, APIC access and virtual APIC pages can be migrated
> by the host, but without proper notification through mmu_notifier
> callbacks, the mappings become invalid and can lead to incorrect
> behavior.

No, they can't, at least not for unmanaged memory.  For kernel-managed memory,
KVM obtains a long-term pin, which prevents the host from migrating the page.
