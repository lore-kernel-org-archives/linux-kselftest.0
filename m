Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577657;
	b=XKSDs8PLLDir4AjKpVDl//i0U5p27H5hBkmSapavkUccCmt4Uz6ggH0+l1US7gw9pez2
	 cBOjw7BclvMZu3J0XO9Jmr2J7ydvjR9ND5zpXsW0kRu3cNVp0nmAp4CGAdGcs8m6vi3xc
	 2XHOxr2EofO2kO/mwO/+3bMZCXOf/1jnz+qI/YclDux1C7YkZxF+H18WyrysTsWQhuN81
	 BSVsjevQH470EkWYuSS1F+DnSuxTgqwdIFE5IJ8jvPNjJ7seVISIIT1uqiNfB2v1Jwzm4
	 rh6VLqgXR2Bfg7/hHAPXfUH3EeDtkZuv5jpxo/EhlZxOJv8Z5yxGIuOlXbgB95d+CBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Uh3RNZiwQ8OEliQwz60GaSWCgjS92PjWqF45e5QPMWE=;
	b=rEZhmZFMkDJKCtLN3CpX14MwYtDqLEMjB/k0cR1zGtDumng1yQphu6C6LgwqY3tip0YF
	 as05JZM9aAqw45HDIVugr6mxln9XOIDStS3DS4WMnifG2VYLMW2VsgLKbVFIHQlmI07Cg
	 bPJLk4U483GsNoROlXfLiqtCOTm4AuZnFF/ii0fxl4U7ZfjPY3LBJcj6adOlIigqa2RoX
	 GxBpv7XXXIEQT+sAxbm58sc/7znii7MCpTqfg/XAiyzZgEZJfjSK12U0jPYg3W9t0Ch4E
	 vLc9g6piaW42S0PSGF8zZhvqECOrtZ+WJ0WznPXWZo5A96xlh6Hti1ENEjUdpM4mQjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mChKw73R;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1D606A32E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 13:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D1D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mChKw73R
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so851496a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 05:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577656; x=1795182456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uh3RNZiwQ8OEliQwz60GaSWCgjS92PjWqF45e5QPMWE=;
        b=mChKw73RMvMekalbwIWe8vJQeNvBuAqoFw9E6LWWYbcMqUuXDvVGlHTLU8n/PqxdKL
         j5K9gDqwD+/0CTMTFAtxDuqyu7cxgmBzY8Ju5hwgNLshJS4w/4lSN3SaYU3JEWz0+Xak
         da8uSjJJ10NkQfa73Hi//PBJluj78+H3S/po8W7LsqqH4uMBbF3g/iYIskDP2aKIdts9
         o7GQQLrvh2y8kGnXVLqcYJMCXCC9Jt9b8+0V65HBdYxpZFkn/ERRJ6MMZIMcrPOgV09m
         7eWINQ8gZ7gPfty3HBdvHYTcxr1IQD88TJYFrwZjM1pbJOzGg17meejlsNBHlIcEqiLo
         XdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577656; x=1795182456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uh3RNZiwQ8OEliQwz60GaSWCgjS92PjWqF45e5QPMWE=;
        b=z+9oFa9CLSWrkOzoj/1TBeZwwyse1IqpmP+FZCZ3fuS9IMncmcv3Gno4xM7zWg9kka
         6VbLfDySnnLCgJd/iPQItuhTy9pO5P+cedsxkz+hsBgEL6RA69iq+MfWWitlRN7XUykf
         I1fPN4tgDZMJ/iLaQOIAAkGb8NEKdEXuDGUeaWVhyUOMVHJduihByQ+/Pqp5OT8vPG+/
         dX2QXtASmN1ilvSlWWhvv9/4TejqmPl6/yJv0Q/fmTtkN5xJs5znQW6esF0WSzNFu7XC
         X9rZ2KHX16lgni9EndecCMNyZMx0UwstZehYkR6EdEUlkSbMoYsXg1nsC0QJ1Qmtit0z
         Ix2A==
X-Forwarded-Encrypted: i=1; AL+hErGexyQ0rt+Ou+NzQ4ZlSAAA4ddP69luppZi3pZMjU5z0GHqF76tpsZLkEUJ38LrsLRka5tnqoyzmxc6YfSWLAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qT9dCS3ER1d9Bevyp/iGi/fY9pgmxfrh7uJS8XUbcJqg/XANY
	GQqbpS0qWc/+bGRSAQSIaBrjfhscQ+m2sQtnv8GCjkG2NlwJhq9XPEQBPVZUT5bkHPlA8rMa3dM
	iXjWdig==
X-Received: from pjbgc19.prod.google.com ([2002:a17:90b:3113:b0:3b0:a379:b383])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a50:b0:3a8:c0cd:57f9
 with SMTP id 98e67ed59e1d1-3b1b0a0db23mr2345964a91.25.1794577656089; Fri, 13
 Nov 2026 05:47:36 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:14 -0800
In-Reply-To: <20260922071945.693714-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260922071945.693714-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441838666.82439.8379969006436543719.b4-ty@b4>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix incremental build dependencies
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 22 Sep 2026 08:19:43 +0100, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Use FORCE for the sysreg header rule instead of duplicating the
>     generator's inputs. (Oliver)
>   - Added patch 2, the same class of bug in libcgroup.mk, found while
>     testing patch 1.
> 
> Two fixes for Makefile rules that name a directory where a file's mtime
> is what matters. The first is arm64-only: the sysreg header isn't
> regenerated on an incremental build when the sysreg table changes. The
> second is arch-independent: cgroup_util.o recompiles, and every test
> relinks, on the run after any rebuild in lib/. The two patches are
> independent.
> 
> [...]

Applied patch 1 to kvm-x86 fixes, thanks!

[1/2] KVM: selftests: Fix arm64 sysreg header dependencies
      https://github.com/kvm-x86/linux/commit/b2ddd6af0646

--
https://github.com/kvm-x86/linux/tree/next
