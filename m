Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2183033EC
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786454769; cv=none; b=ONoTmsS5UyR8m77O8VQmhUB7GiVsiNT6gdYLquIPeiUNhYENIKtYNLsZyntmThQDC6oBwRIJUbTpuecEa4DEFrSEa2yX09NUPRmygFF+ct0h/qy1U6hEToudO1P4mIc4zkc3Bs81fNU6h+p0i+M6JNae22rAuvYmlgQ02h5Zpuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786454769; c=relaxed/simple;
	bh=PcviRXye7natTlINzT+MvBO3x69BTv0hYr7HauJL144=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pJgxfK8jStFaJDjs13njRn/uwoPZjeKJ3u+XquyyTfN/e1j99mJFjeUmZekb0y8PIueY0iW1kN83qVJhxgcipzFcmBizv+n1P5CY8SpMKoBZe9C1OCNQroPrEBrPDe3DBSf0VY9oteSvcDspIrkEE3/I4TpZudmCK7GxfCOeTdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrQwmzod; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrQwmzod"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso237994766b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786454766; x=1787059566; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W70NQ8qweOhk0vfOOOPEvDwhbPTM+yme1ctvOdIAjTY=;
        b=rrQwmzod6QJCSkRxvUvvXeMEA1fDpglFPp1okxL8f045DNrihEzBjHnGd0cwLleLEz
         I2P7427w/RkFi/Rj22f2qdUEO5xOfzg6ydUEP5VvEPRonfAC7n8rvPR4tl0oKqUiULJ2
         ZilSuODiWGwbafuXWrLADJvMK+x3cWM21d7V7KTAjHI784aGPGxNEwaO+BYH2Vvj1g41
         oVE1y8BS+9xEkj4+m1d6BQLzOIAXPUXqUplDmW1b6uIh3ngHUPbM+vZe6YZknKRwITqR
         vfGNhHusExYkFtK8jcT8YaPtYZQCVK0D16EJXRWC0Y6SF2Oaz9b/wdYPw+R0SOlAkoZl
         ME0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454766; x=1787059566;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W70NQ8qweOhk0vfOOOPEvDwhbPTM+yme1ctvOdIAjTY=;
        b=ncXHaL3XgxcuZPNo57se7FyCxtVaBjHcLjEx5pgtI/mmgmsNQaR2HjNjZoPuwuwWDM
         cYBlXtnaR9FMQO3aIy8IHMOlUNewi2harkOHm2XVljOpxSnFcWTGexuxbqipGrHxoHfg
         Q8IFsz+2jcuKryVRFWDbMtYbVzBAX25Zd/3OJ3yESITUmNU36ytHo/4UQWloBkV6MRve
         N7skeH0VjpaNJ2vljnXQXd/BfbIvUolK5/OPHYNs9DU/Mh7l879VWYLjWtO55i1qqkB7
         7TyjJZlLQ44iEO0aLN6WqC3A/vBf8OGlmM1bURa2QrR3VQC4x31bdrAkYzpeMVhc0fLM
         urug==
X-Forwarded-Encrypted: i=1; AHgh+RqEfBury535WSF1UxMTW4aT95SYVe+6aTXXPoMoLB8Sz6VuTcxpqNxmeCvo7DAdFNmNZ+9lfvMLh4U8nU7InMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxU7ioUq70Mk4EP/PjV6gmVCUbK8XjVy0rgvJz7hBFUW7ZXnRN
	5ZKR9zw9ELLPR3ZbAgy3a9qnfmRo+8BK2+d3OruGFaRLVSmTm/ZtE+nDFIEpqWFK+yGxf6qVtwW
	3GLec/oOxjG8dDRK5bA==
X-Received: from edqs15.prod.google.com ([2002:aa7:d78f:0:b0:698:b78e:8827])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:158b:b0:6a1:e59c:62c6 with SMTP id 4fb4d7f45d1cf-6a364525fe5mr1952585a12.18.1786454765239;
 Tue, 11 Aug 2026 06:26:05 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:26:04 +0000
In-Reply-To: <anpXjM_lg_UTpl0q@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-2-tarunsahu@google.com> <anpXjM_lg_UTpl0q@google.com>
Message-ID: <9huzqzk4zt3n.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 01/11] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
From: tarunsahu@google.com
To: Sean Christopherson <seanjc@google.com>
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
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Jul 28, 2026, Tarun Sahu wrote:
>> Introduce the LIVEUPDATE_GUEST_MEMFD Kconfig option. This option
>> enables live update support for KVM guest_memfd files, enabling
>> guest_memfd-backed memory preservation across kernel upgrades.
>> 
>> Currently this support only guest_memfd files that are full-shared
>> (INIT_SHARED and no support for private_mem).
>
> Why?  Specifically, why do we need/want a separate Kconfig for guest_memfd
> liveupdate versus KVM liveupdate?  I can _maybe_ see a KVM-wide Kconfig, but
> even that seems like a stretch given that (AFAIK) hypervisors are the one and
> only use-case for liveupdate.

LIVEUPDATE is used in many subsystem. It is possible to enable
liveupdate and kvm without enabling KVM_GUEST_MEMFD. So GUEST_MEMFD
preservation must depend on CONFIG_LIVEUPDATE and KVM_GUEST_MEMFD both.
LIVEUPDATE_GUEST_MEMFD Kconfig is wrapper on both of them. It need not
to be visible in menu, So I can make it hidden. WDYT?

Also, KVM VM_FILE preservation and GUEST_MEMFD preservation both depends
on LIVEUPDATE_GUEST_MEMFD in this patch series. [PATCH 05/11]*
Which is wrong. So I will update KVM VM_FILE preservation to depend only
on CONFIG_LIVEUPDATE.

*https://lore.kernel.org/all/20260728121138.1103610-6-tarunsahu@google.com/#Z31virt:kvm:Makefile.kvm

~Tarun
