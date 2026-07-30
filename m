Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC24144B67F
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435875; cv=none; b=e3U9Xu21j+EXnMIf3+BdDD1rTuyOZ6K1rZdzTHqd+CSY8WxGY36S1B0Mx532l1uF4NsDE1gFhrkL8QLOAR78XZ1HIkRtShdLn0HyYe553CLivsNAaK7SkEqOuK6CBpex96m63GWHR1eit6Prrr9ooSmM8vmnMdot5JNROkKolgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435875; c=relaxed/simple;
	bh=WmC0rz+Iq3rxPGrf8sHcUVcKnqR8nA46jesqA2w8hOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pRdTyRYl9gzz5TAYb3cK7rAunNNKBhvPLx5bVYn3lRX881thuxw157sChB6fif3dIZ0+QGv2Jysb4BUjY20a49GsPlzkt02PL8bKwRMtai2nv5os1qM8ArZfdfndX53wtUJAlSKTSI9GneeCcRezlH+W4ldXcqdlT/25DgDYT0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FjJ4Yi3o; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FjJ4Yi3o"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954df200ddso686515e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785435871; x=1786040671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWg5Br4dovuA6zfdYwI8dsMXvZRa2U86H6MD/QZgnCo=;
        b=FjJ4Yi3ow4AvKLMqQ61zzq1S1NFMu5d2UFAk/QaIdIGrQuK8lFzbJBP+bt5KVQxiJe
         M2LJGMPC4U5MT5zHY6pEpnHnOLOR4egQu8+vRGg6dJdKKl6icCjfL8ImlvTlE3JYebkd
         BFGN6DYgpMbMHHgRyx/AA04J7RON+I1tX4Nb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435871; x=1786040671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWg5Br4dovuA6zfdYwI8dsMXvZRa2U86H6MD/QZgnCo=;
        b=N5ZglOx4vccgdqhvcHntWkTaHGwi3oCRq5PtBYo8Lt+aLh0rQEWv3Yj/xWUEsq5s9K
         y06dFwV3CrcICFJSOjDp5GsGjTLKq0pAoRz/BBNMtgQDtoy4v8+xNvtXtMPreWyBBYlE
         2hASPQNYNWFJwTws5HeVJRvo8a5o1jFJwdlk3YVLxD+TAG523BmCx2YdQH62KwHLOtNC
         nCr8ZT/orq4ezuGuNlFGDLn/letHORjWyQR7kGaBv9Skb9yWWsiDP6/wQKpNUBFXxfB7
         enE/FyGlFfD3DTiVSRJHYf3l0PN2cbvzHs33BBl6Twsvxb5lkTgkQVsdotasGU5+V3uZ
         qpLA==
X-Forwarded-Encrypted: i=1; AHgh+RpHyKg3yVxfmzIQVpuvDtqNH5eqmYR4VrO7odhYKq4VzIIxdvwRCeoX4T7vEVROAVL67P0HiZdwToVIAYre2fo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNYCzrZOTuchqxp7twWeVjb0eP2qnc8vhj+xEFJ93Rdl/TsggW
	ge5M6Kg2WajrMjEmw4PON+sghTLtxEC0gSC0wwnT7ECZwbosJAns8aIbDI1ztU1fUg==
X-Gm-Gg: AR+sD13TTcSSo9g7H1uPIURZZjkfYMUxAjSKNtAMIY0MrQtJhwQbVaPAATE9Lvf18mz
	ux6t6iviMNcK/FFH691jiUUIVGHM/LtNDJcC482ZfPtYFF6djDYGh+NaHk2jICyhtkKcvnCBDQX
	VoGfvdWVGrQ6m7QemZ8Dt6v3po3P/sgnofn7DB4dSb01Q6+2WkcUce4Qy27LWHtD+4YkBY6gC8L
	TC5xeOHnGp7B2UhZ6ISSjVrdBziVgO1KHmn5xxULDVIzFdU1PWe5Kudb76WMj2b/oMOyUxQpY7k
	Lyqxkc4c3XtgWqxCp93/70qZ1+ivS7f9ofVtEAugMxQVG4eBh9OKDedLLTCLLi5fmjV0+1Yr6dB
	FkS8EbUm/M8X9QAgPfixLAMhuvjnJnmsa2H0VAhV7TjtcgbAA78dhrIx+XOrhlb1aN2v6bCWqHL
	tf2qnlOLDFQxlkKff7SXZm6VIv6pPUVD+oLYpij/pYQhjLZ2ZwlBTVnh4g71cVlVVkn6KffYJ2H
	oAhkW0+cNe2fIpMgGtJGxlKoWnnAai5eiU1jJaDkUDna5lt7502PxCv9NcW56kYag==
X-Received: by 2002:a05:600c:8b51:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49800e6cffcmr53667995e9.2.1785435871010;
        Thu, 30 Jul 2026 11:24:31 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aade3sm84008685e9.14.2026.07.30.11.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:24:30 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mathias Krause <minipli@grsecurity.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>,
	Aashish Sharma <aashish@aashishsharma.net>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Dmytro Maluka <dmaluka@chromium.org>
Subject: [PATCH 0/3] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
Date: Thu, 30 Jul 2026 18:24:22 +0000
Message-ID: <20260730182425.1223530-1-dmaluka@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max_vcpu_ids and KVM_CAP_MAX_VCPU_ID are exclusive, i.e. the maximum
allowed vcpu_id value is max_vcpu_ids minus one, not max_vcpu_ids.

Fix the sanity checks for KVM_SET_BOOT_CPU_ID and KVM_CAP_MAX_VCPU_ID
and the selftests for them (added in series [1]) to fail when
bsp_vcpu_id is incorrectly set to max_vcpu_ids, not to a value below
max_vcpu_ids.

Also clarify that in the documentation of KVM_CAP_MAX_VCPU_ID, in an
attempt to make this a bit less confusing.

[1] https://lore.kernel.org/all/20240614202859.3597745-1-minipli@grsecurity.net/

Dmytro Maluka (3):
  KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
  KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
  Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive

 Documentation/virt/kvm/api.rst                  | 13 ++++++++-----
 arch/x86/kvm/x86.c                              |  6 +++---
 .../selftests/kvm/x86/max_vcpuid_cap_test.c     | 17 ++++++++++-------
 .../testing/selftests/kvm/x86/set_boot_cpu_id.c |  4 ++--
 4 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.55.0.508.g3f0d502094-goog

