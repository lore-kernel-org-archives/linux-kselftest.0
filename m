Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89C3B27FB
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510546; cv=none; b=TLGNbgqVL2zHENCpTWvyfmw8snTE0GKFy/lnwonwpIgUD4FozNeSdePO2CAa3jdgvw1DJegBQdQox1g9+I8dPqoMftFaPS1x70Jinttw+lMNVjSYWqBq5pNv+q9Y4nnLf0VX2Cl2qtyVZKcVchH2v9TFy3yhOajPm9yKmhst/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510546; c=relaxed/simple;
	bh=ZLXgSTC1xaiI6a9LalfXnkq5VEO4QKxt9vodQK1/FG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWpE84X1tnhBpriGD8VDlFZZ3ZK1uf+N3adVWnxyXqLlOwAxjALhs34yNbQfDdrxMq25zEJP5WHyyp88k8aoXjSV69STrcOaG1cjvePx7JaZBTZazho5iCv/fEevu0ovxmCnUYN6gj83EgKWA2qsP+6aOMT/YyeDcb485DyYSe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ADxyP+uK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ADxyP+uK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so555632f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785510533; x=1786115333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+0P+R2A756VjaLeieE8ZcHad5KvFTCwR/lqQP3cLlzg=;
        b=ADxyP+uKVM4UdQ0S9OvFXMFPQKYdm3vPRZNrHYH2IyvV0i2kbFLO7f3tKUMyN5ROYf
         qkguDENLrOoS1mtW6GaIWlwDcsf5HEJWyjAXjkhNGSNQw4+wSfUJypnBLWZ6qr9PrqCr
         Gye+TUTZwZrrH4gaolSkEmK7Vn0+3hxZFq6yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510533; x=1786115333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0P+R2A756VjaLeieE8ZcHad5KvFTCwR/lqQP3cLlzg=;
        b=e4bRVUJOh6WbwHLKUudTuGCoqbssWqfZwkkngGCPo6x64Cw3EzfGiCN5gxsdMDhLMx
         1rX+AhfK8oQSG+aSlXtjun07yIzyMNuLyqdlfURgJ9wOcpURohShvbI3eDmRIU573NN6
         WYkT4hld9KTAQW1a9/Cj0xVgvTwYfaIrgbZTlZThNUY839EZnpBry4C4vAQPIdoBiRDl
         Ule10BCqwCVet46iPtSHM8iTMO0vgADsYgoMHLvE1XXWj9zUYvhWmt5EfvfXA3w3cBUM
         B/oSCfNStKfSzbfSuLvALl8WeguWneEw2IlU0oG+dznD7L51GNgQGdl14NRNmvgCxgls
         XAsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpN7l4gE6CWmuTZLn76gbZR3jiYe9wIYT5Q8wWHGMiNG8zw6fOApgXHE092Dfgt4bTxMP1XJHGSnJYZ1GMF7UE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL2wRTKOgt/Ea2ze+O2ttB+jJPdGFLcFZgKz6K5pKf7nVegxEz
	aIewoFVDrL9VrtObqIjHY6r+mfZJaJCZP+r3Ixc/3FWVRkELrvunYqbHjpG3ZCtbGQ==
X-Gm-Gg: AR+sD10COj3HSc0wEwU6SLhV3UZ3BEHUzOyqHq0s5l2B03FqXrc+JqGF7M+p/EFf1OH
	rlEuM00UiNHsZhGnNGuIvxZKLq65A9krUaakkXFl+0wNjW/YaFOA/tqSQszt7fkLMPA1u26eJ+c
	wxOrTRun9Dw092Vb3CYTqayAK51x1eDMa/eK313sontJIpskvP2FaD5G8zc9alog1S4VXY/fFHW
	pznuVDx8m5fpK9FWVu0By2jrreCI3V6iClkcSUejjnHYnUm3Jw8KQikKRsDCevDCuyWvbkUpY4c
	9FMIAYCcp5UB7TbnwNgwQtok9aHk3VGmVteSmxEXPNFLD8gchjupjOu+a6OMcf+fsQZR759Q8Lc
	uze/Sxxc/VDmiEJreThjfXjZp8RnJ6jqZmk8AEJXHDFWZPHcE7qc4khYmNRNGgI2c2LbghbVpvQ
	4SWKAn/mq9psBemXQG49Vs7vMV3+NzqidRITR+hlV2INX8j73bX3Y3Utc26d+mytOP5gs9voS+L
	VKkhmpBaJHTwAkLt2ZeCmiE/ot9CHKMRAiLOoa8aqIkpWQCi3RAuNVG+TRV5s/HVE8=
X-Received: by 2002:a05:6000:1787:b0:47f:673c:42cc with SMTP id ffacd0b85a97d-47fd72c3732mr37783f8f.27.1785510532009;
        Fri, 31 Jul 2026 08:08:52 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm5647974f8f.34.2026.07.31.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:08:51 -0700 (PDT)
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
Subject: [PATCH v2 0/4] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
Date: Fri, 31 Jul 2026 15:08:41 +0000
Message-ID: <20260731150846.1728164-1-dmaluka@chromium.org>
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

v1 -> v2:
Split selftest fix into two patches, to avoid interim breakage of tests.

[1] https://lore.kernel.org/all/20240614202859.3597745-1-minipli@grsecurity.net/

Dmytro Maluka (4):
  KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
  KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
  KVM: selftests: Improve bsp_vcpu_id and max_vcpu_ids out-of-bound
    tests
  Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive

 Documentation/virt/kvm/api.rst                  | 13 ++++++++-----
 arch/x86/kvm/x86.c                              |  6 +++---
 .../selftests/kvm/x86/max_vcpuid_cap_test.c     | 17 ++++++++++-------
 .../testing/selftests/kvm/x86/set_boot_cpu_id.c |  4 ++--
 4 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.55.0.508.g3f0d502094-goog

