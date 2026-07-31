Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748CD437471
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510555; cv=none; b=sEYFRYIfOAPzkGVKv72wM/6EWUdw6v0lTESvwoGzpKh8TfC6mgGmClMDK1/qRGbS1HztWB89vEO4LC53Pr9lc6zHqDlL2E1K29TlZmUyenJgrccsgNbdui6dtg+mP4uQgZ2Hy4aeR7tukffbS8FqUFfRZuFGS34VhKo+icx5LiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510555; c=relaxed/simple;
	bh=O14zjjovGhUS1oisSmIPImyZNtw8PEWRZRj6BhjFqXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrZrD81+o7gbz/PsMu37Fw8PoL86myFPhL+/lKk//l6qCBnVmQ2D8OIwE2z7XvxO0KOu9+tLcCeKsAw7gPL273+LAZ5LWeTzpxQtOJr4/9nBzOnmVcL1irxDXIA5IK4wu/KJtMDD2RGOK4VYqZflx5y9XXjb22+wWggbhhwJcgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z4Lm5Ch6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z4Lm5Ch6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso720165f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785510537; x=1786115337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flDxck68r8K2V0lreAAuQvFuepl9jlGM1LdPTHPMSDc=;
        b=Z4Lm5Ch69LK7n5bZYSmYZFGQD/6rLOOhEYUWoND+Mva8bO5aq7Q7iO6B7sRJAJEIS4
         SF024u0dr3Oz3xLQe16c3y+TpNb72aQlMT7lsSBCRnPq+FNQNoEalEefnww+hmGG0WnY
         ZkbtRZgpmjiOmHZrjkZDm/wQSKQdyQRDDH1LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510537; x=1786115337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flDxck68r8K2V0lreAAuQvFuepl9jlGM1LdPTHPMSDc=;
        b=euo+U4jbTLnPl9ujijJrKweCmNk51wZBrmbZKaxsYMre8aNKdsB2IU+l6rvrNf/RnH
         28+GrdCgYIKttvBSGapTAySNanXRsqiJ3ROyV4M2vfc7ks10vxexPUfO3UL/LkYvnFqQ
         nVzS09A6kgr46qtnQF3aouDPLPyWfWD1dWegCP7B73ErB/M7GUOmKp8LXSIHZBukrQqP
         sPNWApc+A9ZesLr7XVT0pn0c1UaIcG0SJILE751mvWNJdPf8IYLRKPElDZTOGtkYL5pU
         XmCvX1yNSMzb4aptsjBGEnkX8+zw5w1SldTt5ehU/+IZjQJ4jpANEoZ+jarAwtRjytDy
         Lipw==
X-Forwarded-Encrypted: i=1; AHgh+RpAu1nxbldjnZm3e0Vs93XIyifuE5bpTkAA4y4LI9W3fG0546IfyrdoBvwZhjD/h4RCiqs6+wR+H8UeIguBiDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2VCMaDOxs+iXedH52LxwWBqCH89XywlzJloks2Na66+vULgDS
	ko61YfWJcJjOguzf1bhyC/sf0eETTrhj2857xItojIp35DHTA/unjzg48vlEXPEwgw==
X-Gm-Gg: AR+sD105N6wiatU4L6MJ02yAJv8bdw0geA5py5/G+U+3aavefSDUFj5NGBM9EnWOm88
	JMe426wV3sWPBz+pRscWOcE/eCCOa8qrhh2vbsw5n0K/mxQoWKM+LejiJs9JSVo/3GaztYoAu4R
	Z1JINg1RMEmLMmMfzKX7SVcXNf4NwfnRvwN1bGEl/ld9hrC+UZbhcbBCnlD2O9zcUFbWAaJgA49
	Hc4wD7MMKFG1vX30vKoO9w+NzwF3aXGfuzKLHd8HiZ6w74ktO1G+OAiRH+AGJxhLzhyUTwFwaeL
	+AFFB1Mbx+XYorvcRJ8tuKzf54zFoGI9NN89EE9Urb/cPLn/KyyDUwgYFa/Rrp7WqnU/P3gXXhh
	6IBHUPtPSpIb638hxUunByb6/8GJ1hYb/NOD2jKb0fhtJTALP8WSgLZPaX9B1o3732HhKBG9SVo
	2eoFYwPxJ56UdVjhFpMhYVQeDJ0Ie5VHBSou6i/vBP2kImil3a7MYrTOmSA72zWKSG5zEQFa/Vg
	bdZYXK7pekoBjdlH8kn5cGM71eXtK/IlCWtT7hgDiQi95KTESRoqWk=
X-Received: by 2002:a05:6000:46d8:b0:47f:4dfc:ca1e with SMTP id ffacd0b85a97d-47fd72ab3dbmr35826f8f.5.1785510537114;
        Fri, 31 Jul 2026 08:08:57 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm5647974f8f.34.2026.07.31.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:08:56 -0700 (PDT)
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
Subject: [PATCH v2 4/4] Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive
Date: Fri, 31 Jul 2026 15:08:45 +0000
Message-ID: <20260731150846.1728164-5-dmaluka@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
In-Reply-To: <20260731150846.1728164-1-dmaluka@chromium.org>
References: <20260731150846.1728164-1-dmaluka@chromium.org>
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

