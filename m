Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627612D8762
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786149932; cv=none; b=sHJeV8sWr/qLfe4lnKavwwbmEqrENXY5lLR13Wga0w49Qx4TYmVeLGhyN9y7/Sg/8aGcpBTZ1HtGZ9EscRZYStdr399LtW/dWSm3ZLgo37kyRxIAKzybVGLu1P0R2wQZX++WwbeDHvSAHPijcKf90xOM8OBvWBUrspMGE1r1UnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786149932; c=relaxed/simple;
	bh=ppv/jqQbYTVsrOVriwES52+srvTfmZpEEwyfCWYYuek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bH/0V78KdWNtQv7CT6cCwo3DtNIGPUp9ETiuZVxlqEXTtXQj7h9FPgzl6cXy3WJkz1Wjrtn8CuTxhUYh4jItXuCu3HOykAeoYT9Hhg1SCjZCrmk/nDOQg7XvqibI4eN/4fk1liLqEzD23m1b4JhxC69WMEYqZ9irBB6ZyleZW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJNz8P7l; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJNz8P7l"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fe76491b8so1346f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786149928; x=1786754728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ka3/MGKm7iR8+5/jZtQsRAkV/u/WIGmun5FvIccrHyk=;
        b=XJNz8P7lzdUA57B6mAL9A5TF9j9H6nOwDe/csTsn+/yWSwfa/cGu12cLjb+SOoa75h
         etyX3AIIkcvFxE0YpJ6pueoh85t45oHV1aw9/KE95nE9WePjAvsIhVn0m8nX14T1KaJr
         S3CdTPMBG0zt+jSrNrnOgqCMh2I+322I0kTmasK58ovc/3+q9JIPWiajz1ZmMkjiCBsY
         5e7Scq7KLLOYaMkEKpIlFZZIegzouiQUUc6YSPtTNOQtNwhKlXdLUF8pV4d/vlCdP1tO
         c6r9QsQcE4/o6mrZMBv+CVzC2drJR8BfljQSpd4J88oo8F0XR+laeXN9A3PR6Syx9n4t
         kEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786149928; x=1786754728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ka3/MGKm7iR8+5/jZtQsRAkV/u/WIGmun5FvIccrHyk=;
        b=CdOcqwoCq3pj98PFbk63Vh9GfQEL4KUXsivHbxH1gsfpGb+3d6thLACwvxF5a856j1
         N9h5wga7V3oR1MuVvq8Mato0gbLOpU/Nq+1qDk3KBf13llhqhdVIi31FIEfEbgVGp+0b
         ph1j74SI9Bl+2YRJMJyhPmLrOSq8y5WvzGbg9ruOumhPsCvLpu3JPDbjEcJjS4aKWaXh
         ghttdbZkmrEhzHXCNaikUymUyAlDBA9QrSGudKBqiWsfq9KvsqL/lL/hNNg1IOLB3vp0
         dg51KODUYGigm3cM0OJy2jsFalB+A64KhoOpt1EUV/QhzzMMr5EDHDWWqly/njlYn76N
         qz3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoX9LA5lZr96MU1uFWXvmrSoAJsKbJ8F4kJvogUMT6+s0mTp4Hwk0FsSe4E/u9K6tThVUl8EzubUhYsI4/+e8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6IRHcEcBaWjBxgJPcPjYnciqYMpMJrZwh5cxV+kvUTY6wRsj1
	s0WW7MHGbq/NIE6b5fOg/WNAgLvyYqjq1gebWVQtnYvzRN8v+jCRey7k6cEe9U5/iNg=
X-Gm-Gg: AR+sD11fFzGquwbso9Y7SdVlRzT2uxwoT65t2xX9ds6mmfNVX9q2TBHtWB/Db46ExEI
	84T35Ocvpy0aEn8TBtbudqN/mYcfMdHjiitRp4ortW4ffkJDfeKJ1HY8evBsBNIpjVvwUo8fI5p
	sGnBdR16PE224hCvHpk3JExmHRmJxuHWEzYtpIIldELUoz7tyRqAQYDvVeY5qAw/CYNA7+Cm4vn
	YVYdfRcsWI68qbK6YLbztQ3lm9Dhdo7882E0zP4C5E9ipSFSR40dRTz5uRng29jpZV9LlSmPe1e
	jqmcpeS/fv/4ww1/U9s0PRCy5tDpjfo85NuO7oTjBg+ce6x6vrTb/iPu6MEVKqSFGNcsVxgLQK5
	2jd5T6vSd6z9zMDYAg07dxCDpOU9LRdoaKLdY4pAKWZpiWoe50IzuZ7EkMUyYW/R/2/tJzMS89h
	ey9/w3j+uzkvxH6pJ3S78pUfpYCzIBawPZHVeSc8yJVG8LaK3lFP3c10eqwsQBoCHIxZHK3r8d9
	RpMp1+K9CcOa4CHD3NeImBUgE/uSYjKlwH+eTD+bRYB/KHEMwZ9xZ5KJ5c7yXIyi+ZUZEirTMzN
	Pr+2UEdjkJQJtcbLIfE/BeY=
X-Received: by 2002:a05:6000:200f:b0:46f:7d90:8124 with SMTP id ffacd0b85a97d-47fec528a60mr19597292f8f.2.1786149928005;
        Fri, 07 Aug 2026 17:45:28 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-201-133.77.179.pool.telefonica.de. [77.179.201.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220aa83sm8848170f8f.36.2026.08.07.17.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:45:26 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	ali@iusegentoo.com,
	qingfang.deng@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v3 0/3] net: hsr: fix shared-skb mutations in the forwarding path
Date: Sat,  8 Aug 2026 02:45:21 +0200
Message-ID: <20260808004525.1551-1-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two existing HSR/PRP forwarding paths modify data shared by multiple
skbs. One changes RedBox interlink source addresses, and the other
updates per-egress HSR path or PRP LAN IDs. A later consumer can then
observe another consumer's value.

Patch 1 makes interlink address substitution private. Patch 2 uses one
clone/COW helper for tagged HSR/PRP frames and both hardware
tag-insertion branches. Patch 3 adds regressions for both corruptions.

The series is independent of the posted GRO/GSO v5 series:
https://lore.kernel.org/all/20260807140751.1351-1-xiexinet@gmail.com/
Both orders apply to current net. On current net-next, patch 3 needs
git am -3 because hsr_prp_redbox.sh is already in the same Makefile
block; the merged list remains sorted and validates.

Validation:
- the targeted test fails both cases on the base and passes on the
  candidate
- the affected HSR/PRP regression tests pass
- base-versus-candidate W=1 allmodconfig and allyesconfig add no
  diagnostics
- no TAG_INS hardware was available; those branches have source
  review only

Changes since v2, including official Sashiko dispositions:
- use a shared clone/COW helper and cover both TAG_INS branches
- correct the helper comment and interlink eligibility wording
- fix HSR LSDU encoding, capture draining, and result aggregation
- defer the existing dev->stats races per Paolo
- leave VLAN/non-linear receive parsing and receive-side tap aliases
  unchanged

Previous postings:
v2: https://lore.kernel.org/all/20260802202504.2962-1-xiexinet@gmail.com/
v1: https://lore.kernel.org/all/20260728143604.26-1-xiexinet@gmail.com/

Xin Xie (3):
  net: hsr: privatize interlink-bound skbs before address mutation
  net: hsr: return private clones from the tagged-frame helpers
  selftests: net: hsr: add shared-mutation regression test

 net/hsr/hsr_forward.c                         |  65 ++++-
 tools/testing/selftests/net/hsr/Makefile      |   1 +
 .../selftests/net/hsr/hsr_shared_mutation.sh  | 242 ++++++++++++++++++
 3 files changed, 299 insertions(+), 9 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_shared_mutation.sh


base-commit: 594d905195024b228c962627ae5ae7c17bd582a4
-- 
2.43.0

