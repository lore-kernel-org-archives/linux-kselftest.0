Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4244643F4A6
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435881; cv=none; b=pQ0XBCYLgdSzNVvmUFiziYLiwnsd9LuxV0CVj6Kw4t6K2OCskuBv6nTwbAX3whOYsWFxrRwKUhzYh9iJiKH9b1T7vD3sK1OdcqyCMpNuT4oOpwR9NjZJpdQMC/74heSxUZbAu0HuWuIWX0IN/y+OiB8OVEPYIUyB2Gs3vg7SDOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435881; c=relaxed/simple;
	bh=O14zjjovGhUS1oisSmIPImyZNtw8PEWRZRj6BhjFqXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBJaT0y8NeFCQTqn4RLqPKk91cOQybqE9hloOjpdIm+olgCvYhWqbm65Uh0BaGbPlBJMu6nAxH83GFoi88XUAv3RTTHOQX2TIM1ss8krU/NkoT4Y3UVyU8yVDT2jYAMcEk46L6TG/0Y2bKi2pWiC+KL6WVqpOphGoeURjQlD4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mokaldYi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mokaldYi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49553515a8bso1055085e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785435875; x=1786040675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flDxck68r8K2V0lreAAuQvFuepl9jlGM1LdPTHPMSDc=;
        b=mokaldYi7J7Pf10stqOrObcnJXzIGGGMd6j8NPwU6LrLjpFybAPW7BxrhTlDAKxtbo
         GyfLb9bUjmhr0dSsYqWV+ddiISgko7ojqKYRAi/Stm7Yir6Fv3LTcmk9yqJFev4c1dIt
         YW2LAaPXQqnoW4md+2+kdg4lVLvvYvzhgG62Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435875; x=1786040675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flDxck68r8K2V0lreAAuQvFuepl9jlGM1LdPTHPMSDc=;
        b=imlo8K/g3AkOnswvzV46RatNEMNBNDLoyykXhiGkZYzuNMjA9nKkTcvPe5jKNupfa9
         tmYydopbP3ngi1yufHupQki3tDNiy5bBNwHVP8TgNllh3fzpE55T+yzV7b2XLazRnez8
         L0DMR/YK6hoC9HrcVg6E5vHE+htggbD43nJis+5Re7uxCHrB6QrP+XeXwipJ7iZ53GBg
         nPcfP6WHwREoYdSuZhpFwe662zoBYy8UgVUm6oEOnmK0L446BrUqhxun8YmsruU4do/v
         tVHC6pSW9Hju8ujwUrfg6XtCoyMQQDmhShOy9cgsqEckhKh1bbuLXjeASILzy7QWVzqu
         vCBg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9ARUlxG+E0soNl3WUs4AyukGOb07iERPQ2WGq3AerGz8D9ayUEMwjnuSctPuLW0udBHGFwk/DzoCTLjw+dUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbqPlvp9j61dcfhRyR6f7Byo/gvJL6N0X2OJhFVpe9+rnIhydo
	303qRb1FB6Kc13I0xUspi/YQXI/SoFkiMvmK6tFWiRpS/fsY4lbhlUSfGRa8Hr3+aQ==
X-Gm-Gg: AR+sD11mVb4yqtDiUd4uPgIPkBesbhAhZHt/743Q8LdQ/iofMnkrSTFeRHpQ7svxgjZ
	Rhsyf/vdFjIU8fq7u/w9e0405N7Mv1zn1zZGKlwckU/jQkKrbjxwimvwaUwbATY9CrsnDkMLC14
	8BtkgH/1ndrj6TylfAiigsHC9GGjpt/WuLjIwZXA5Zrl+flCWcsFDiSA8TMYiqly59WFAgPDxkQ
	6OEXD+UWZHRTv6AQiMQ1Ujy9q9uGLoz2N+GQ1CNlYLj/SN8I9yex2gau5b+eUvumKFY+2k9PVl0
	Jt5Hsd/9PUPY1CXWVEjnNUWyXLqvbRnZATdvHRLlbYMk/BSfvi8V0DE+2Idi+VrCJYB9R5SUqJW
	43VU/YSdND6k9TcjDGTV0GmzPcCBf97Xwynm+ecrgCGVCmad57cZKz70L+oiLGaqD0VWr2U65n7
	aTJTu2Zx2MeWL7ey7J5KFNBva79lTKPwa/nvYpZA3o07bMoXVLWsHAUM6qpQtc+y1kiSXbsPphC
	KShNXKDA7wcVFZkklndYfAblpVn+jSnBtsK/zVGyZ3BBkUECRcs4qI=
X-Received: by 2002:a05:600c:4e89:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-498028b10f7mr47675555e9.5.1785435874942;
        Thu, 30 Jul 2026 11:24:34 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aade3sm84008685e9.14.2026.07.30.11.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:24:34 -0700 (PDT)
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
Subject: [PATCH 3/3] Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive
Date: Thu, 30 Jul 2026 18:24:25 +0000
Message-ID: <20260730182425.1223530-4-dmaluka@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
In-Reply-To: <20260730182425.1223530-1-dmaluka@chromium.org>
References: <20260730182425.1223530-1-dmaluka@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KVM_CAP_MAX_VCPU_ID capability value is exclusive, i.e. valid APIC
ID values are only values below this value, not including it. Its
documentation doesn't make that clear, and even suggests otherwise.
Fix it and explicitly state that it is exclusive.

Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 Documentation/virt/kvm/api.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e3003a241d5b..dab9a28c0fb5 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8593,21 +8593,24 @@ KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT        By default, KVM for nested SVM guests
 
 :Architectures: x86
 :Target: VM
-:Parameters: args[0] - maximum APIC ID value set for current VM
+:Parameters: args[0] - maximum APIC ID value (plus one) set for current VM
 :Returns: 0 on success, -EINVAL if args[0] is beyond KVM_MAX_VCPU_IDS
           supported in KVM or if it has been set.
 
-This capability allows userspace to specify maximum possible APIC ID
+This capability allows userspace to specify a limit on APIC ID values
 assigned for current VM session prior to the creation of vCPUs, saving
 memory for data structures indexed by the APIC ID.  Userspace is able
 to calculate the limit to APIC ID values from designated
 CPU topology.
 
-The value can be changed only until KVM_ENABLE_CAP is set to a nonzero
+The limit is not inclusive, i.e. the maximum possible APIC ID value is
+args[0] - 1.
+
+The capability value can only be changed until it is set to a nonzero
 value or until a vCPU is created.  Upon creation of the first vCPU,
 if the value was set to zero or KVM_ENABLE_CAP was not invoked, KVM
-uses the return value of KVM_CHECK_EXTENSION(KVM_CAP_MAX_VCPU_ID) as
-the maximum APIC ID.
+uses the return value of KVM_CHECK_EXTENSION(KVM_CAP_MAX_VCPU_ID) - 1
+as the maximum APIC ID.
 
 7.33 KVM_CAP_X86_NOTIFY_VMEXIT
 ------------------------------
-- 
2.55.0.508.g3f0d502094-goog

