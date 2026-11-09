Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187378;
	b=p15mak2cP8jtNBoL45QL5MNs2bVg5NWznB1rVvLdKutfkCPSDBz99RwtOaRFIMBILJIH
	 rhyodl3dpcYMqlY+O7v3lAem2D/1pnWBhPUxkN1Q9E6zxS6guBE1Nz4smwj6Ere2QtJoB
	 zXT+aiCdXwK3vclsAYwUv8H74fiW9/5AaRIJBtRZiXkTGzrOqbFi5GnNxm7VSmo3SMIT/
	 +/0UBPRYvn1jl7umgaZlfuAfTJwDb2g8vzlgBrlmqgqBYp+NSozAehVW4GrCL/sp/+gtr
	 ElDT8lsm0D1m60QBLSpI+B3ypBZ9+DFo37s10zz+58fAOL74HjpbMVkDRtK9+B+qJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=vdbzkytGXRhHN+l/mE1rRdmYyXtT3CDBuzLxY9K8xVc=;
	b=zRBNaLH/V3vVMse8qkaDcSi/9N8JZAgoki1ma5fxD6pqF4QSY7loJRRCfOV0GFatvg4x
	 07FxXI55V3X0QlqduTi9URd+RBrozEo4ahv0J7bYkyYnCidjuT7ciZAKJCDK84ajC5P8s
	 Dsc+orQLDM3I5/VbdLZMLUqNKfFIygM3A99K5R6JUhf8zf87TolFuwZm245MKH2hqGXIC
	 teKAk22d9lOn3sXANKievF+P5lpz5Q2f64Gm7b/iEZeW3EaADn3Ao8WYdbPfckUKhJ+G7
	 Bk0B4ZqC2fUMu64hwHP6eib/n3o2yhZJIpIkfJ87SbZpyC1MNb9z+J9psdhBZpCeZhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3UekpUa;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEBE606D820
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 01:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEBE606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3UekpUa
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so636229c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 17:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187378; x=1794792178; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vdbzkytGXRhHN+l/mE1rRdmYyXtT3CDBuzLxY9K8xVc=;
        b=a3UekpUaA4JIlfxinSS7NPD57AxZnwhcsa8MojRbUp+3TebzYP1Go6r8trx3GPnwz5
         G3GD+okyXsTduKd253Bbe0Fy1wU+o27kqTQSvd1ZivVKjgspxXIA6iW62Cs0lxUiS/L9
         Ru9kYy21WlxqIAHevkM31qMjTNoFd0/6C0NtarXysY+s1GGgW1+jirkLXTrbsaIe0xDp
         R9IEJMpcrrh6gj6mj7qbGTgjwlhPBNg30Od+fcQSy5Li+cvXDgpifvC9l65kz2OU7VPo
         KZKT3ys40TpD3UNWQKBbJxUUwXa+cjhZQ5056UF1Gs12jF1LMqtOERF7Ho5mCZ+Sp8z9
         7EAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187378; x=1794792178;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdbzkytGXRhHN+l/mE1rRdmYyXtT3CDBuzLxY9K8xVc=;
        b=pq4J7f9VIEZYh/nplR8IQrd9l2Q0lleNtlwGsvjCy46IHXa4aXlNbSRFmKjSlKqhlG
         p+k6fAbT9vzaQPPzFejLkvSswYrGAgqiY30239dkvZ0cnsf3TTLLviU+0Omyc2Whrr6r
         wG4ltfjIx1lfw4KXqsf+25Nx4k1lRxim4ne0u6oSpj/71Tq+ikgQ3vV1IDBSBh768m8U
         B7uU2o6l+UehdSP6UTiZa226s+uSpXQo5D/zxxcVfqAetx8lk1GE165TIBVVCx+37mFG
         2s1GEYXU2XCoCEelJjaKmwX3iu0OHkanSujk1j4/bVjQVt6kgy3emW5SQhKLVAqeyMJK
         u7gA==
X-Forwarded-Encrypted: i=1; AL+hErEr99ixbHcWHL02MgoBSq6YF7moXsEKJWdQUSKH0GRirIGhFB+xXeG/GkyQ5dFAKvd1JqZraPddKEdrcSFg9Ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XF7AA32olqFKSh2hhfvXGadzDJtVK+Yg+oCPYRwdom/Rghcjf
	prI70RQNyt6VIRsv2MRLgOarrZzwjf1UeSDpuz7Tt88sub9tOJJEL5bN
X-Gm-Gg: AYBFou1yKp/1lXom1cCJ19USlaavSBkTTfV8amdjng96iy/xeAE/HTaLU6XW6k22DVz
	yKkSkl8NSiG5pfMVsWWCjTa2j92M09Csb4+2FmoL/RGCgHm4tJVrvfSRgnELra3t12PGnPWYi18
	n2mtgnli5KWjKhYfc1J4eLFMuJ6MWByOh/eeVEtyLmStcYXoJT9EK7J4uB+j7x8fdDdVzIluwWr
	DFfo5WKY+fiZoCLwx64y27KC+QDClrfkEejCLI9Km4UsmaJtyen6M+ZGPhwNQ/xa1l/MZ+k0Kmu
	/ETi/6egAkywrrrvEjtjWBU8c1NYPaVi5V46KXENnDBh91jVz/InJ4dkqJPqbFeFGpdNJN9MsPx
	6v+WtU8/dWxGtTLLzaBoQd5YPJ54WLw/BEnOLvOeQXw4uKTYOsf6dmVRM4Hpji6nti3gKgiyfIM
	RcpwCEI9L6phTpXW1gPQtj5P8/WQni7NzhkMu9MOQN2EH92j65iLB0CaBbfIHUzoIxIwEPIFckC
	Ab5BzISED4To14xkBRzGZBX4Z6SODn1XGBV05Jg5WUpcrEuiNi80aHGwAU102ecxx/p99CvfUEM
	ADSXggGnL67r9HwbZpcmYXqE
X-Received: by 2002:a05:701b:2702:b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1b39ff04e7bmr4005319c88.36.1794187377412;
        Sun, 08 Nov 2026 17:22:57 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:22:56 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v4 0/5] mm/ksm: keep smart scan from losing duplicate pages
Date: Sun, 08 Nov 2026 20:22:49 -0500
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkg8WoC/5XNQQ6CMBCF4auYrh3TqVCKK+9hXJS24EQLpKNEY
 7i71Y0mbnT5v8X37oJDosBis7iLFCZiGvocxXIh3MH2XQDyuYWSSqNEDc2lgxjhyBE42nQGdrY
 He6KuBz7SyOC8xFDa2pjaiuyMKbR0fX3s9rkPxOch3V6XEz7Xf/QJQYJqa/SVLlA3YdtFS6eVG
 6J46pN6iyjLX0SVRWPryshGm6L4EtefYvWLuM4ial+6YJqy9fpTnOf5AbYWliB2AQAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

With smart scan, which is on by default, two identical pages that become
mergeable some scans apart can stay unmerged for as long as they live:
each page times its skipped scans on its own, and once both are old they
may never be looked at in the same scan, which merging through the
unstable tree requires. This was first noticed as intermittent failures
of ksm_tests "KSM NUMA merging" in run_vmtests.sh.

Patch 1 picks the skipped scans by the global scan number, so all old
pages are looked at together every eighth scan. Over 420 pairs made
mergeable 0 to 20 scans apart, 361 and 334 merged before on two boots
and all of them after, at the cost of about 10% more ksmd time on memory
that never merges. Pairs whose pages are both old before they become
identical fare worse: of 1800 such pairs, 200 merged before, still 200
after 256 scans, and all 1800 within 32 scans after.

Patch 2 documents how smart scan picks the scans to skip.

Patch 3 makes the KSM helpers in vm_util fail on short reads and
writes, which could make ksm_functional_tests hang or fail cases that
should be skipped. Patch 4 moves waiting for KSM full scans into a
vm_util helper, and patch 5 adds a ksm_functional_tests case that fails
20/20 without patch 1 and 0/20 with it, on both boots.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V3 -> V4:
- Make the KSM helpers in vm_util fail on short reads and writes, in a
  new patch 3, and the smart_scan helpers of patch 5 likewise
- Add Cc: stable to patch 1
- Add Reviewed-by and Tested-by tags

V2 -> V3:
- Document smart scan in Documentation/mm/ksm.rst, as Xu Xin suggested
- Wait for full scans and switch smart scan through vm_util helpers, as
  David suggested
- Rebase onto v7.4-rc1-345-geedaa7d61f1e and retest there
- Measure ksmd CPU time with schedstat, which puts the cost at about 10%

V1 -> V2:
- Rebase onto v7.4-rc1-132-g05441d697f7f and retest there
- Drop the ksm_tests -N -m 1 numbers, as it no longer fails on this base
  without the fix
- Update the ksmd cost to 10-12%, measured on this base

v3: https://lore.kernel.org/r/20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com
v2: https://lore.kernel.org/r/20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com
v1: https://lore.kernel.org/r/20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com

---
Qiliang Yuan (5):
      mm/ksm: align smart scan skips with the scan number
      docs/mm: ksm: describe how smart scan picks the scans to skip
      selftests/mm: fail KSM helpers on short reads and writes
      selftests/mm: move waiting for KSM full scans into a helper
      selftests/mm: cover merging KSM pages aged by smart scan

 Documentation/mm/ksm.rst                          | 16 ++++
 mm/ksm.c                                          | 24 +++---
 tools/testing/selftests/mm/ksm_functional_tests.c | 89 ++++++++++++++++++++++-
 tools/testing/selftests/mm/vm_util.c              | 89 ++++++++++++++++++-----
 tools/testing/selftests/mm/vm_util.h              |  3 +
 5 files changed, 188 insertions(+), 33 deletions(-)
---
base-commit: eedaa7d61f1ec8ae053a9ece0d553785350ac486
change-id: 20261016-bug-mm-ksm-smart-scan-align-skips-cd01e5a9889a

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

