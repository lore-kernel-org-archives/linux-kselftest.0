Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0794B3C76BE
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 21:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975319; cv=none; b=CBg1uwrXidDbWSn8dDZpZ2AHRpOsLB8eLC0ACVryuFGrFs0I4e1SvOThsQOAxe0Sa2kkoTCWDG+XGhREleSmoanLukyytKBbxUMruNUcHbsaFafE7sFNQqlXqpi8zytVue+4xwylDDd5vjWgpDgh91MmFN7sepVeQbsQpQt2xX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975319; c=relaxed/simple;
	bh=qQHaUt9Qx5ui/jf3XA5Vx5WKrzuF2vNTVY9zHZ1+IO0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a5q7c117Gq/C+o/J7wrOrt/5e33+1yCN4g7fni/fXIrA/KyfJw372LTVYLQcWlWeu57jbbcBrokLv5G0XXzWR/PMKaYPbHF6hwUzR+R23+MSY8nF78vYYmD3q3+XSPBM5KKGxMOsjCO1nIijsZF/L8EyMqe1fjHBZfcRSAh9yDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rTHVnQIr; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rTHVnQIr"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso249476a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975317; x=1791580117; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXEfwIOrmzhpBjI7xrdNHIpyWDkfRzHF/aF4EjJTCJM=;
        b=rTHVnQIryc/r/dGpsTYHEwVq8muAbWn83N7iVF+z/vMLf88XupNiz6O7clrfXZplvD
         OR3jpBAxh+4s9brWx1B4KPmHRF37y3gqp9ijdT8/bWemR/Fd5p8OL/usa+w8Qdk0+VHs
         X9MHq30HhYLSgQhepI31fFx7zcNEUr8wQowW3fM8wCw8AvgFoMYWPxabBs7bf7lvseHP
         XvlepOVkqDSLK4mzZnwU9X1+/2RrFbWSYDbcaM38xB53vSow0HAp6ye9AHqRT35EEb8v
         2FVRgjEeWUs26s6aSizMy3dFFRF9BW733ohk1v+rBdBEWNLvDm1/5NMjdlcbwY8Hmboa
         dZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975317; x=1791580117;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXEfwIOrmzhpBjI7xrdNHIpyWDkfRzHF/aF4EjJTCJM=;
        b=cHUA2W6DwBqp31VVi242bX8O8ynf4lInoBCraWgqdpHU4HlPM27DkQtSqHUqYZ6X2R
         g2kPkyKnnp1ImWsNgKoFez6+cYy2t6fC7UDr/MmYxoNoD/NjTwOm2vO0sTGEmMK8XD8K
         Yd7w79NZ/F2fJAPy6TjXDGChiptrWdrWh1AZVqmQ1upVEAJM+3+zi0n3JiyOiGpSXHop
         YPlnFzehu2/3YgfzWqHPNO69BDjiHRdWYurhNoO5dTcY/JlsNjzQztf7PwfpRTrGiQq8
         GGkjiDmTGwfuwuUs5e6p12Sg05e7aKUIvJECNAodRXE1ciWOCIVw8PdmT1tvY/DhwM4h
         QOvg==
X-Forwarded-Encrypted: i=1; AKwUvBwLFhtv+tydMmSVsT+Yo0xKJ7dBNSpE+G2yseJeAba6uljn88M52xcIFL4R3dBtrjUZHpXISWTLP/anj7hA8CU=@vger.kernel.org
X-Gm-Message-State: AFq9FYID4QHtfhGROKqFGpeaRv/z9FPqkTTGexCtO7BJJewUsR98/sJr
	tpFdo53GyoTFcex2dq2o4AJwV0HOGy4H8VkQbYTTYLmCTVrig0EfQDhoIlHSsz/KglHJ0aVqG/b
	kEmlFcQ==
X-Received: from pjbrr6.prod.google.com ([2002:a17:90b:2b46:b0:3a6:c8c9:1392])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b46:b0:3a7:250:333e
 with SMTP id 98e67ed59e1d1-3a7025038dfmr1422619a91.11.1790975316920; Fri, 02
 Oct 2026 14:08:36 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:07:00 -0700
In-Reply-To: <20261002053723.3275202-1-loc@ryzome.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261002053723.3275202-1-loc@ryzome.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097455441.4065912.17506123016485694511.b4-ty@b4>
Subject: Re: [PATCH 0/2] KVM: x86: Fix lost nested APF VM-Exits
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Loc Nguyen <loc@ryzome.com>
Cc: Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, hpa@zytor.com, 
	x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 02 Oct 2026 05:41:43 +0000, Loc Nguyen wrote:
> A nested asynchronous page fault delivered to L1 as a synthetic #PF
> VM-Exit can be lost after KVM queues the exception.  Most callers of
> kvm_queue_exception_vmexit() arrive through kvm_multiple_exception(),
> which requests event processing, but the nested APF path calls the
> helper directly.
> 
> Without KVM_REQ_EVENT, vcpu_enter_guest() can skip
> kvm_check_and_inject_events() and re-enter L2.  A later VM-Exit can then
> clear the pending exception while reconstructing vectoring state.  The
> APF reason remains PAGE_NOT_PRESENT, allowing a later regular #PF to
> consume the stale reason.
> 
> [...]

Applied the fix to kvm-x86 misc.  I'm going to hold off on the selftest for
the moment, I'd like to go straight to having it support both AMD and Intel.

Thanks!

[1/2] KVM: x86: Request event processing for exception VM-Exits
      https://github.com/kvm-x86/linux/commit/88b23a2e8286
[2/2] KVM: selftests: Add a test for lost nested APF VM-Exits
      [SKIP, for now]

--
https://github.com/kvm-x86/linux/tree/next
