Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9858F3BB138
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975296; cv=none; b=ciwoyJs3I1RY0t0nTKSARKl8hrR/HvlS+Tr+DdKNJGnuYSXtqFfImh4XFK4ABpWr0FOXXniPQ2Q9QF5UWKNXsbE62KxzgoH3iuyoEXRhDQAoyjge7g9dOgcbZqrCEqM5d8bzybJ455dDnkEWwkLckjTPHAtEeYJuGnoQMXtUngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975296; c=relaxed/simple;
	bh=kq9QBghL40dkfA1F5V17cYmnpGDV/utwNPq4lbzDp1E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XzSSeriAfy518J1u1tuYSWp0uL38juQ5jrxf8XIolRqQTooYOw/wCAbvMhkSUiIZsFtcetdbZOkOw0cDGMFAxVKgCwJFoL7OvZz7IuTXa5tbMcdifutJEgaN2mp8KRuow9kJvRItCp3ybWjUnFswLUlyp/qWIFwjld5gQeJ6Wqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IMvMKvTz; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IMvMKvTz"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so513388a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975295; x=1791580095; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIA33Q6ZV2okJc3I0sp5o6bypG+QRL/TeBpUQuge1fg=;
        b=IMvMKvTzRa4M6lzXYZ99QKWyMvlepxxtHjg3ZeGMSlmuhRSWqOpB8QzQ8Clun8co8r
         odjGJOvJgKsluF9ZPb7ynj1Pr8yoAFeuz1skGOK2HMivouw2B2qFsUttvm00la/ejAvJ
         cAOe8S5k/Vtt4BK8l9B8COsFkDg43tOWgKt27F129NS4Yy9XEuX6ICLkWo+N5bVgSHgU
         FGGbvvXz8AdciXKt/YnclZaXK7YwhipYYM1O9Dhaa60ETvLdTazB/LbTbgEwRE3OVNjc
         BNVTw692mrq8yVxBxHWiHmkPfaJHKmYOiH6vq32DBuAH1aFb2CWLfgYIPkXDtYnehQ2w
         MJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975295; x=1791580095;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIA33Q6ZV2okJc3I0sp5o6bypG+QRL/TeBpUQuge1fg=;
        b=Uz1ns9EHONUAON5cqihJo4TyFucmSSuDqeRA/C93yowQPVI63UjGkGiVjemXXJ2jcJ
         i19q8Jkwh8WV5b6Y5ES+lX4yF7IYKXUQag4AY2A7rsTwbPW38LQvd1UNegyQc1VAt6mY
         myNuk8vY566vl1DWKCQPrNrlpL+MeYkG7gkDOvgvcfZL+2lAkd9npP0uKgaf9l69AkPg
         C7XQQtDRIncRcdyUf4a/VyqSfIHWZDPhF9sHh11NsQKORfZc5qjQD+RVljgfidZ+kB8G
         yJh1WREDqvT4FtcgWmw2WxDEnSw6cPQW+Pe/8fhcX/ak+LLasnHpOqJpTR5ssv5gIboW
         PFWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwnJ2er+DaqbDI+qSilRrJZAx1v3ORRqohblT+1a9o8rqas7HUh02Qio+HlBk15bPlyDLM26KpOl0vCgoHNF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCETje+2ENghX5B8b19ImhB1ZCNb56vr/8FCl4uw9foUZM8bWc
	eFNPNhZIzvqJhWFJ0Patbo3C6Mz3mPGsm7D0Yla5r72ENP4sYQHk2Mi8FvZ2a0yJwAtj4JuQI8I
	HLffPjw==
X-Received: from pjbmd9.prod.google.com ([2002:a17:90b:23c9:b0:3a6:df94:8170])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:548d:b0:3a0:f0a4:a2c7
 with SMTP id 98e67ed59e1d1-3a6cec13a8emr3789780a91.20.1790975294587; Fri, 02
 Oct 2026 14:08:14 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:06:52 -0700
In-Reply-To: <20260918054420.338842-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918054420.338842-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097475934.4071676.12331909604242085588.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: selftests: Move test_read() into elf.c and delete lib/io.c
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Gokul K <gokul02k@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 18 Sep 2026 11:14:20 +0530, Gokul K wrote:
> lib/io.c has outlived its purpose.  test_read() has exactly one caller,
> lib/elf.c; test_write() has none at all; and test_seq_read() is a
> declaration in test_util.h with no definition anywhere in the tree.
> 
> Both surviving helpers open with
> 
> 	TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: selftests: Move test_read() into elf.c and delete lib/io.c
      https://github.com/kvm-x86/linux/commit/3069f4036dff

--
https://github.com/kvm-x86/linux/tree/next
