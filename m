Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E4D554089
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876260; cv=none; b=uWr9xm5Ri5GoE12wrj6+pSev5W1lJofYMXN0/d1Mh53MeLGzsKBP1aoxNN5rHwqKh2CpT0vvZYxVuISuAsTid/TfrDNK/Fjc7FiQnkkMiOgISwhRwSnZYl5G+6MFhnD15KKQman2BHquIRaUNidupSpeJjaX86+cRWQkTUecfvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876260; c=relaxed/simple;
	bh=/hf+JaN80kkUeIvT9savcMWGneOYjndNEDsyR1nSTpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JjQ4VzGyLOYrT+Rn/ZHHZOS+PMKp+adZAmXXM3Oo6jnEtqx4H0HQdw0pC+KyxIaF6OCsvdh7tD0M2g9sKvD/xlxsqd6GpmNwLmwCNb4NDzJa/jtx/MpmSt+T0O62k2m1WZNQW0sgY579TdVED3OxNDe5BIg6g6NfFg0f3wvLSB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZV74oGSo; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZV74oGSo"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E29253F606
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788876231;
	bh=SXIMe4oMHTuXDpcB4oft04tFKxq0tl8ji9Vspwz0rd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=ZV74oGSoYG/zp3kL+6d+KDfb/+MKdDXlnwQyShnz8QylS2uXQOMYe+sIhNI3/imeT
	 Ng2tTbc/aBvOtvEfpUYDsGK5cF3YNK5yxKxs3zZ3BdMxBv5rivbCswvQnkidVGLnTg
	 77bkxhykoCsvGT3CchIxJCDFEiJTiYFm7jpBn0wUhBNJF0IccYyP595gOYn/NJdSp4
	 04I8L+80HUqBs/8odxfNdrZO01x6/Nyuys4P6XjFYRB39XM5DEpcSb+ulqJXtc2uwT
	 Z6tiv2w8T/mP1DpQhgAAuvqYPYt3ccEMi28jQ+VcuEHrbr4saA7aV2MNppyjzvY8D3
	 KFStZ9vZGUrqM4US/XdzpuPxkWCaNcHDi0RjStwAy9IJ9TzpR8Q8xUQYeNIAKWUP07
	 7vw8whRIW9AWfQbgnfF/jNUwucBPRRHP4TY/nA2Vfv1Q7LSu0Z9VrY/amdq50kydtm
	 LUyYroP5Bhr1w3y/94gWvjYpvM/EdfxlemscT4JFf5XkJRt2uqDZczHce5vYWxwBop
	 4Mz2oZEkeSWx5tCIM+eJsCRNctA3BqX6TEqUVd/w6oDVq3yEYSzI5jc0gCVEdnPVJ4
	 IODg2RkmUxuy6jTBXt3ekipCIKWfcEjM5OhMhzc5/RrmkeSZt6FHYgCPdSA3Mwq/ET
	 XAZzs6ooaUPdzrQQxhKBHPp4=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c1c232fa136so591237966b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 07:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876231; x=1789481031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXIMe4oMHTuXDpcB4oft04tFKxq0tl8ji9Vspwz0rd0=;
        b=MOmii3ULzEES1joDZuR3B4kBb+PtOWP1tYpvPWOJytv1eWCb9RWNeffRD5+XCXtAgP
         p3awCRZU+pyd3+xktic1f1ps5Bta+aXjBqPWldSiNuAiywxlvnvNstjFM9olCjaLw2xL
         EdEh2V2ohykK2gj/9Xt1/c7YUIsO9lBa1B9ofQ9akPLmQO3toWpcAln2yG7b/VHuPtFB
         XX6PIjEdoCY9/iUoLcIPC9MA3Q+FjmPhJaILI+0H7bMzXYel8s/ASkolHvsOXsvTLm85
         AikRbCSxdg3gkJMXvLC89NhKlBRYw2VXKeTpYSu+blwVioqZh0z0dY12V1FyRAdXIKgK
         ++rA==
X-Forwarded-Encrypted: i=1; AKwUvBybeQ7fZreEHDdHqJANFQrVClKth6b4DZOalM7nCaq30TObjRjisBB1mm8p7dY7Zf+/hrG+SsBVfzKR/f8VGLs=@vger.kernel.org
X-Gm-Message-State: AFuF++lnxGeDtWLWea/6kYh4DNpo51JhQm+80kEC3llNi1CBAiINxLTd
	wnqDolZwPFC9uHAWFiSbElH+6KJlHrgGOkRS7R/m4I0D369rl7juZSECA4KPrwwGeo27yMu5l8j
	oQCDElPflHMUAlkEtckNx0Rnxr6d3P+7FQF/dM7mINE0AzLlKohGp+L3irAQgqfwLGBItiHDVTf
	72Ck7k2x6q3A==
X-Gm-Gg: AYBFou2e6MRQ+KQ9j85pq5RGjTie92DquJgjyppc9lA8xn8y+rh14ncjuFAvJ41Mgfs
	SEW2J1BnfysSPimIrgBW6D7sE/Zo7IXEGd596cBSXFCIP6yAp1R/6+J9rAucMnZucL4SJ2SQJj2
	vrh4mF0xgzbWQ8G8QwllfVccBSojF1RP2f+zYD8C8wqSt8WoBPW6FDGr25gaFGiMOWE0ghZGyAa
	+pwtsIvXx+oFAMsDyFppWkWQDgOCQK80jN5/I88DL5b2sXGeLXFjaKMTPl2Lbi0PpP/TCQU1pqX
	Wks/0UbBYzjrU0KlVvv1x9S9jh9e0K0++Lz2kFviTwnnYQbvxUwnpf5WlMcmXzMNkxq8gcaxnbZ
	3/s4rhw1KBdVg/nEmecChMJhtq8FcS3M0/hykSm3Ov8lALCuPFZ8qwAoo1EtEyZC8fg==
X-Received: by 2002:a17:907:c48b:b0:c25:f7dc:2dd with SMTP id a640c23a62f3a-c25f7dc091fmr1249500866b.30.1788876231455;
        Tue, 08 Sep 2026 07:03:51 -0700 (PDT)
X-Received: by 2002:a17:907:c48b:b0:c25:f7dc:2dd with SMTP id a640c23a62f3a-c25f7dc091fmr1249496266b.30.1788876230905;
        Tue, 08 Sep 2026 07:03:50 -0700 (PDT)
Received: from localhost ([154.62.191.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5768c2sm616647866b.39.2026.09.08.07.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:03:49 -0700 (PDT)
From: Andrei Gherzan <andrei.gherzan@canonical.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Kleber Sacilotto de Souza <kleber.souza@canonical.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Andrei Gherzan <andrei.gherzan@canonical.com>
Subject: [PATCH net 0/2] netdevsim: fix IPsec debugfs byte order
Date: Tue,  8 Sep 2026 15:03:23 +0100
Message-ID: <20260908140325.13367-1-andrei.gherzan@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netdevsim IPsec debugfs file (used by selftests/net/rtnetlink.sh's
ipsec_offload subtest) prints the SA salt and key in host CPU byte
order instead of network byte order, because nsim_sa.key[]/salt are
typed as plain u32 and printed directly with "%08x". This makes the
reported values differ between little-endian and big-endian hosts for
the same underlying key material, and breaks the selftest on
big-endian (e.g. s390x), which hardcodes the little-endian output.

A driver-side fix was proposed in 2022 but stalled in review: keeping
the fields as plain u32 meant sparse could not validate the added
ntohl()/be32_to_cpu() conversions.

  https://lore.kernel.org/netdev/20220308135106.890270-1-kleber.souza@canonical.com/

This series:

  1/2 retypes nsim_sa.key[]/salt to __be32 (matching the existing
      __be32 ipaddr[] field) and converts with be32_to_cpu() before
      printing, so the debugfs output is now network-order on every
      host, independent of endianness.

  2/2 updates the selftest's expected output to match the new,
      endianness-independent values. It depends on 1/2: applied on
      its own it would regress little-endian hosts (though it happens
      to have no effect on big-endian hosts, whose old host-order
      output already matched the new expected values).

Tested on real booted kernels, both patches applied:
  - x86_64 (little-endian): PASS: ipsec_offload
  - s390x (big-endian):     PASS: ipsec_offload

checkpatch.pl --strict and sparse (make C=2) are clean on both patches.

Andrei Gherzan (2):
  netdevsim: print IPsec salt/key in network byte order
  selftests: rtnetlink: update ipsec_offload expected output

 drivers/net/netdevsim/ipsec.c            | 10 +++++-----
 drivers/net/netdevsim/netdevsim.h        |  4 ++--
 tools/testing/selftests/net/rtnetlink.sh |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.43.0

