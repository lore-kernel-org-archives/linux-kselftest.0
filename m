Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB8137DAA6
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098461; cv=none; b=XA/x0bQLNkIjTqaFjuJss3BEaMS2QBclk+4dN8sURB/nLznuyUgHUKZv1zcBgax4pg82tXKISGWGulCF/ftZJSFgGzzYJMk8+pF01AxDgVeGoen9bMmB9BQvTI4pLxsJQ5SYOuZosJWb9nHTpYCaivRCcTv5qVdWb2GJuAklwzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098461; c=relaxed/simple;
	bh=rt/RQHghnxw7tZr/54eyWUo+acP3u3Qkow4JuaefVyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=luYcidQb+/hcRCtzDRtLOA3b7OvBzeZzJVphsNz+s4Pa9IbiODfdQCTJXVUXLZlSEkq6o4ZuCZMy68k6WmYAP0y0NmaH3vZxGOer8Wt0unkZ/6xF6f5Q3augPT8UX6O1HMbtidEuL7cFRgCJ9Axx585Xy1Aj/01/VIiBQWfG4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npEputI4; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npEputI4"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d9181b7e1bso212415ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 20:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789098459; x=1789703259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pr1Ch0BaKi/64NHX7xXxpGZW9BCmPJIomM9HA09NxQY=;
        b=npEputI4I9PJm25b7D17BD3UY/81vc3rUDIu25vsBsI2M1tvkxFL5O+mF7XD5vYoGm
         Arp9ESTEpP1NjIe1XjO9dGuF04lqfL4rNpU7jShbwwvdkl6t4x1+KgmHzlJvpLdh8RVk
         Q7FI8oiTfZpTrMQnC7JlhXD8wFAU/W88CfoyGRdX7E851tmb12xSB+O3v+Mr3xHXPuW/
         Cj79c+dJntWMfpgi3WLhRxneVocbAuWzYUKQaiM2ZYRRKNNkP0yTwi3BHt66hWIWKTJs
         EPzKIVWRqJq436ebR8sa+Vfap25VBVdKkXRr85RYjhiW2zLkmfU7qo11k6PXZDYQcOxS
         ajbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098459; x=1789703259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pr1Ch0BaKi/64NHX7xXxpGZW9BCmPJIomM9HA09NxQY=;
        b=Sr6266OjJkVE8CUCjBm5Vu0t7/LEkXNvQ9EwLKnh3Nq5CYoS9VbNIwYBcim+Eft904
         Mge4x2uhkLSMclcWO4f3q4/K8XRoKEPAM1khdWFZ2bwhbZurAHckfI0zTdwbi3nI+U6S
         tVGMeGmflJ49l7IpLDf8/X17PdhLWAMtbJA+e4cViRs08VsYmLQqMO+Gkq4WFv9geOTO
         xa4+ph5xQ3ifOcKeIBwhFfKwHIfOBKqmS27p9mhz2QToDEmfbJKFq6aM6OvoWJ20YFmg
         7RDk7FsTpLrHx+S8hXpFbKrBbdLNmE0W2Dphku8ANPIOoB8MBQc4/fsIgJNNsUBWbQlQ
         sFqA==
X-Forwarded-Encrypted: i=1; AKwUvBynWyCd95rVqiRhexX7rXg/JnK8MfSg/RDy2TAWJXBcyrSKKCgVWHyBRfKDer1nkMs4Iy1FdtnshnN5qja/kgw=@vger.kernel.org
X-Gm-Message-State: AFuF++kSiw1oMT8pWn+Ey9aDjrZcxVjlzjx0XPDSSonhxOJRvXp0PmJx
	MRPkVB7kEO3KlWFzT1Uj0el9hC0hEcyG+XPX6Ib0xi4LsFKIxngICyVm
X-Gm-Gg: AYBFou3Qv1nvynKbjHkG0R6LuOmPUPa9a23j4XWeYrJ8Lg1XKiB8INcWlwfEZypwvOK
	w3JPEdGACumDE2AfR/yrPLfxabiWs3iL5jGfngFISnybo148OqTxfhf3PWR1mubrmFOr6ih4UOx
	5KVimeBzNTLz6Hat8UXmho74VjM/q3tnL+eHPmkrZ7gTvFBRlNa4xgqIXKguybMrf3rTogSkl8v
	rlKtaZn44LI/z/MI9Ong3SgAUeMrR9FM9qNfc9f7z0IXBqkU+FK+VJ7KP9O1phZmSAY0B4Vj590
	Ed4K6AQAfFBZL03nPwoK/ykIXBB/Tcgh3E3AghKbMzND0WuRNjdlhpvAsZDjSN2E1v1Ng5plRg8
	y9mzmmbN695yEK2jtnX9//CoAMlGA/HOkLUhDfcbACCufua2nzPDpH0hw+ViTx46C4mi7leXJiU
	h0UYcCg1119V8G3QyQxpSk3PcxXnX+29Zh1cQU8ivsN54eJ2Pr3B6JsSSjRh8BvcDS
X-Received: by 2002:a17:90b:5108:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39d97f392d3mr2543101a91.8.1789098459503;
        Thu, 10 Sep 2026 20:47:39 -0700 (PDT)
Received: from 192.168.5.7 ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm2770852a91.9.2026.09.10.20.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:47:39 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v4 0/2] bpftool: Batch bounded hash map dumps
Date: Fri, 11 Sep 2026 11:47:30 +0800
Message-ID: <20260911034732.219752-1-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use lookup batches for ordinary hash maps whose maximum key/value
storage fits within 4 MiB, with selftests for complete output around
batch boundaries, short keys, odd-sized values and BTF formatting.

Changes in v4:
- Name MAP_DUMP_BATCH_FALLBACK at both return sites and the caller,
  replacing the literal 1 while preserving the existing control flow.

The helper retains three outcomes: zero for completion, -1 for error,
and the named fallback result. Internal errno values are normalized
before return, so EPERM does not escape as the fallback result.
A separate output parameter is unnecessary for this distinction.

v3: https://lore.kernel.org/r/20260911025130.191011-1-diannaaav@gmail.com
Review: https://lore.kernel.org/r/7aea07c4220781305b7e972abfa9d2e4776276a64bc4837b80325d177799a371@mail.kernel.org

Validation:
- Rebuilt bpftool, its manual pages and the focused selftest runner.
- All 11 bpftool_map_batch subtests passed. The three revised series
  were tested together: 52 subtests passed with no skips or failures in
  an x86-64 KVM guest running Linux 7.3.0-rc2 from bpf/master, with
  LLVM 20-built BPF test objects.
- Bash syntax, bpftool synchronization checks and diff checks passed.
- The generated patches apply cleanly to current bpf-next.

This was a focused run. Unrelated selftests requiring unavailable kernel
features were excluded from the build with PERMISSIVE=1.

Tianyi Chen (2):
  bpftool: Use batch lookups for bounded hash map dumps
  selftests/bpf: Check bpftool batch map dump contents

 tools/bpf/bpftool/map.c                       | 117 ++++++++++-
 .../bpf/prog_tests/bpftool_map_batch.c        | 187 ++++++++++++++++++
 2 files changed, 296 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_batch.c


base-commit: af0b84a9215d951d16f26b7ee34353b970cf5d4e
-- 
2.55.0

