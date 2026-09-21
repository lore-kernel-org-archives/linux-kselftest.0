Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE33AE1BD
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974665; cv=none; b=DQbBQ4jnL0ctybhmCgahg/ageMZAYHh8x932iQ0qvL4KTePS3+nJQRbxf6D19V59iYM3XnrfQICBiqlyCEMvqzpEmaQ8+++e1U4hYy5dHIk+0+X1k/vDQvMFCa9cqoR9fm1DforPoRasQNtmP+Aj9Euj0qXNH3nQcI0IWEhaFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974665; c=relaxed/simple;
	bh=Eux8pfzDoKUAWcecKGVOzPBlEfy59s1p123uGcIZ0h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXay749g3P4k7+tqq2UPZ1hwUyLcq1Xd4t/RDTJblk2mD8nojLqblPDm3X/PSBg1A0qMfmFCEfOsRxF5YQ8wpVwhL2pU0dkhIgcji4tfVzBUgQe/KtvcI6+aXbChkwpc/CBGofKov7dnWptHuBXb+4oO4Wg+/LfWU2RhvMMPF5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r71lbY6X; arc=none smtp.client-ip=91.218.175.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r71lbY6X"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Eux8pfzDoKUAWcecKGVOzPBlEfy59s1p123uGcIZ0h4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789974662; v=1; x=1790579462;
 b=r71lbY6XSvQn6RbC0czrmQ2R2SUPDEsIfWzGpZzYVA9BOxmWvOIL7uWuIHmqLEAI4fJHGbbY
 SaDfbTk2uLpHzB62Q9/lRLQIRoPNzM3P/4Dz/Sc7kOPXr3p9RAyaNzMROVLeLM+YbnO0g9txlxq
 +10A9vqMVSXd6CnecKgl1Sls=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d8378753b5471857;
	Mon, 21 Sep 2026 07:11:01 +0000
X-Mizu-Trace-ID: d8378753b5471857
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso5963e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 00:11:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVgzzkFnd4U/h5GkFZLIfYOrhm/Hf7cce/Bm8xRjLER9zfK1XIFdzLrkF985XsarFvd1N0Cj6sQ8VEnHXDglA=@vger.kernel.org
X-Gm-Message-State: AFuF++nJXlib1rdXZTcyvGKQKqzhtmqEoOAkPK4kvhdcBkDbYodddnV/
	oWN8syhjL9xw2R0+U1hgxoX0tZbnxAUoH4Bc+yIAeMGGHYBPrIAa/iCKeK3Sgct9fyK8XjF0xvD
	YDC8MyXXRabXIGNQhrEvA6Ptyd5PPPNBqE2vCinXC
X-Received: by 2002:a05:6512:2216:b0:5b8:d049:c45f with SMTP id
 2adb3069b0e04-5b8d049c61amr15291e87.14.1789974660051; Mon, 21 Sep 2026
 00:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902134118.2718200-1-fuad.tabba@linux.dev>
In-Reply-To: <20260902134118.2718200-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 21 Sep 2026 08:10:23 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyHJjN28zXYJUF9otZvyWP5-3Ln0fy=xJ_EE-bOdvMmHQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xk01oNkxJ7UZIT8ZwQcfv1F3nhRMlj7kGCMC3JqdaEoVZDyc6bymlUU9I
Message-ID: <CA+EHjTyHJjN28zXYJUF9otZvyWP5-3Ln0fy=xJ_EE-bOdvMmHQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Fix arm64 sysreg header dependencies
To: Oliver Upton <oupton@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Wed, 2 Sep 2026 14:41:18 +0100, Fuad Tabba <fuad.tabba@linux.dev> wrote:
> The rule generating the arm64 sysreg header targets the generated
> directory, and its only prerequisites are tools/arch/arm64/tools/*,
> which is the inner Makefile. An existing directory looks up to date,
> so an incremental build never regenerates sysreg-defs.h. A selftest
> referencing a register added to the table since then fails with
> undeclared SYS_* identifiers. Clean builds are unaffected.

[...]

Gentle ping on this one. It's arm64-only (the Makefile.kvm rule that
generates sysreg-defs.h), so I think it'd go through kvmarm rather
than Paolo's tree. Could you take a look when you get a chance?

Cheers,
/fuad
