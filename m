Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A03B9DB3
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 22:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786402702; cv=none; b=p3yeGOt1M9P9cQjm0iLxH7E+evqFMIs7ax+6UpUIE6ru3r6/SllVr1l3zaYrxhJqjh7ZaeUvd5GxVdJT6xnneToLwUj4S1hSuU/RxDDeHnjrt/YG/kbkS+Z8Xq5dNCcaqEi3PEBRnecxvhsD5ftInIby7hWJ9fHn7Acr0FdRDtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786402702; c=relaxed/simple;
	bh=CFuIJ7Uu9OrHMxjTOKTqmRsJbmdzzsMA0Hirgq5XFeY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j1XvRTAT9fVWYZZMfRVNrulc2G+C2u+57RKmhoiFBrkYPcdun7tk1e5Eq6A1ORWG9Xz/TN8WiO8tirHZUpTOMJ1QcXMaQAG43fpVC0TduTDvqt+oeHCxgj2FxS+MItkXiNE1pPULFrLAUNF0Z9/FtE5vLHIHoPLzk8W+tdT2UTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BFzdxsgw; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BFzdxsgw"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso2348193a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786402701; x=1787007501; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Mn9WKaRVsVTpGaOSKTBrlWB9M3O9fuL04U/nAsMmiI=;
        b=BFzdxsgwmV9AfYECEQb5U55p7KLFSBr1yWq0jKJgtc2uNPBAF/Ra9vEUmuP4bFDo5O
         2fBcSBN81+M/Jhh1Mr45n7WXZ6tqpeZLkK8CvmATDeGurMRBKASPp/+4kVyma7fV9Asz
         ldyuq6Dsv51G6aA/smBxoIrNF5VySBDAvPHioJDokN+e8BOnLxnwzQuFdaDqV0xtKJ2S
         +LHrfNlfRx98FGJ55MA9YhsUHBjC0rht1TtMJkyMmhaypoVXC34bWQCwexkV/mct8Qai
         ENvvCPZWhvZUCsH26DRBUDjqfWrVS5mU/WxP6I229e/DXvsROJzSchKbs93cv/2Ea+MN
         9ZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786402701; x=1787007501;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Mn9WKaRVsVTpGaOSKTBrlWB9M3O9fuL04U/nAsMmiI=;
        b=jXh1QUMs8X8TqH8Y4gC0wWwB4/bZ4r7dnDDgjJ/YYknqeBA1rREz+poU+AoQpzDr7V
         jllemJs/CZkVDoEs1yUyLQL2keqelSQP/68mpa99L3fXYts9WQJHnvdlsgk5e1lcrhkS
         Cu4eOcwOBaj8OyJBOQCnmmQBgGR6l0B1ZK62TQB8XC/ke2Qca/MMXDZMS56P0L4mKCFz
         rF3eXqrY02hswfN8e1orpA39MIqMaFCTrSi4n/Cnp1f5B1XGEJsOYEvDNK61SHGN9RkJ
         5I6FaMVPY03VOElkqBhSnFGVtldtmNwh/7cGaa+3OO+xFFJakcwLZI5y2MqfcIBPen3X
         WAIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkQXYTMUsDufk/tKIuFL5lfuXhNfznqNGP1VVRqPUqww5ZgE2E2/3zM4HcLXdEQhgIkKoJJWqmDnnN+FcIP7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNYXbXGAQM+O+Kz9MyDZRZgJa3SLNq7Bydly2/8bg+TMjJ3cO
	Z8sM57/RvTOXonPBEj2pYo9FSFkuwrkw4KmGAdBgZ94l8YDFAsj05uQSt3gq+wIOq31mDjsrxCQ
	9DE5trQ==
X-Received: from pjse9.prod.google.com ([2002:a17:90a:77c9:b0:384:934b:9128])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:590e:b0:38e:6a44:671b
 with SMTP id 98e67ed59e1d1-3909d301d9cmr33802476a91.0.1786402700758; Mon, 10
 Aug 2026 15:58:20 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:58:20 -0700
In-Reply-To: <20260728121138.1103610-2-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-2-tarunsahu@google.com>
Message-ID: <anpXjM_lg_UTpl0q@google.com>
Subject: Re: [PATCH v4 01/11] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
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
> Introduce the LIVEUPDATE_GUEST_MEMFD Kconfig option. This option
> enables live update support for KVM guest_memfd files, enabling
> guest_memfd-backed memory preservation across kernel upgrades.
> 
> Currently this support only guest_memfd files that are full-shared
> (INIT_SHARED and no support for private_mem).

Why?  Specifically, why do we need/want a separate Kconfig for guest_memfd
liveupdate versus KVM liveupdate?  I can _maybe_ see a KVM-wide Kconfig, but
even that seems like a stretch given that (AFAIK) hypervisors are the one and
only use-case for liveupdate.
