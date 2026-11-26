Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717419;
	b=AFv47rfTs5s6p1HPJc7LLEavqxOHkMmY+cuCxptj7hI5LFmEe2LI3eBcBET9NmetChMw
	 cAxd4C+ieVXO9dG9oHzryi6Z1HgRxwrlicKtwo3UhU9yZTsWOLJ4XJNA31PPgWFZrtQ4T
	 XvYug/Rw/g3vXONuWdKZmwjoaJ8KiENSj6Kdxp2pBOA8Wp7yButJvz/2R2d0HwczMFe0P
	 lCZM9o17OZ/LCLWAwNluElfB5Mu/jzNVzJNx0+aklog/E6klL23wVQpQveYuNAYST3KIl
	 CUT4H7G4P9qRwu7D3BEQkFq0urm6cnrDL49AGsvWO6h6hgyH20scpZvMh29cAfycwFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uIphw3j1z96h8uTiUhwuuY5bkqMdxke2b6zGFFM9IrU=;
	b=XciXXsYSOHA+Q/FKrpxVq6jTL8DePXNgnySWLlzM4qUHwScFDyWbXbZpzKd3dFuzE/D0
	 AuD2tUVdSYlddyce/h7KYtoBMtwmu1VwgPqlTbkWMAUprtEOFx7xne2G0pK9nw7yQtIOV
	 hSJQKLpTLvKYIM7i+0k4fBkfenzl6+RcNZR+cJo1WjqeG2njOJXCVOwNnKWY4Wz8CPYsL
	 QMPqDU/PyIFS8zvFisf8ekRSjyR2onf2nFptzxXqDpeSErxjUiDFXVwvUfizJ4yUeNsHn
	 I54W8MtZpZEE8116GRSr+M6buxtD6PwALBdupekcMLfzvs64TjB0XH8jQkUXVQtzcBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NWVQ3/5Y";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C814B606A336
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 18:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C814B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWVQ3/5Y
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386c71feeeaso3734413eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717418; x=1796322218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uIphw3j1z96h8uTiUhwuuY5bkqMdxke2b6zGFFM9IrU=;
        b=NWVQ3/5Y/54sK5m1Ak377/sFmSJCTXKP4Wb8Ug5ZGyoqCPDTsIr+1rxFekGleY3lma
         1wb49zAOP52QgqAxBEEwDW3zKDVmbPotFc41+z/hsXzjJ/F0vlCTqxQORIZfEsOFJ11H
         t9Oy4bEP/750ac5xd6sRTMlpm3qgveOe407weMUitQ7g1BnmAXEaAwCt0zxp1EFcL3Bz
         l/67IvSn5Vwkj05EFNt7vQb8hRVa40nY/R8kU5Ed8th+35rb9JbtbqYtVc7WTv38f+0E
         V1Sg0UA5e3d15l1bjId4t+s5mKkvmH+OsGL5bIOtXrveCdA45pm05mCbgve5txFTjzjr
         ByLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717418; x=1796322218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uIphw3j1z96h8uTiUhwuuY5bkqMdxke2b6zGFFM9IrU=;
        b=UX6gbFdCXmgC2RciLZZmKkK3Y6J6yblREgRl+iDVyGKboSonGb67iynbTA9/MH2gj7
         2/zEiQD4yt3buk3vT+FAwVVSuTUlDLDGB45v5F3Hkp4NQleNWEAQRll+ga16faX4BbJQ
         Rl8I4RQEhWOGUjp+TBpaOTs1KIw92oupB0OYvnsei5cOms3rlGbmYYEYni2ge/oNCVxs
         W9vCljOrB+oponxbJ4cGbKrwMQBINTGoi5BY/r4XOD1CPqvTC3er9NBlsEOMhy76mbn/
         c1+DN6ZfZUlb1wZ4iqUWUKi0M0wOXptLV6Ai2GynXDYagdCZPrvlhmD8oCwAIsEQjkrM
         r4IQ==
X-Forwarded-Encrypted: i=1; AL+hErG9XMZANGOg3xyjAyscEhCUf543wzqYoZdXS3ytYLbA54ecf8TibEeOBfmbbQkIeIpTlRaF9cYIrz870UnpwuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qZ75QO6zxQ1LkfeUelIDw+rUztd0fwjcBP6bMMAhQ1fSaT1hX
	EKb2iFWt8qFA/ZTmDJJ7vTkcx1aFFL1uIZ/cHhVzVXoz3WwOBDUgYVym
X-Gm-Gg: AZFdTZc5OVHj6aFnwJAlLdC4zyFlaNvBDVt9s8LC9dAs8CySBcLA1UMhChJ5eoSbMeC
	HE1uJ19J+hcG3KYVMaDIdTKBqYIpuKSx21PX0vUAbRwcGLb+z9IpKzKZsrSgsizh0f6OAhzfa3r
	Y1H9GzCqsZLkeLmh1uIxn7B3LEcAXO9GimFcUlGvF0dPm4haFvWxAyHIfP48ZGh1+huZ/1ncXVU
	dvKa/R4VLdoyEftR/ehruSgkhQWStUHm25137fqkap32m4DGa3DUb6izbOSNYNOC0ID/NrWhjTA
	83y5TcXvWf3ZNeDax31fDf+IeorgaGFQaexT+0wf0V9Dy3HteWWhtEx3qWWIR91Jt4j3dh9099L
	IMtYQOF3Wqt7JBrRP978+lJRm6a9cFk2zpclaLTIc/FdENapkCG49IfPNGkNnmzZxqqoUG5a0e0
	sUo+wE87sIIp05FF6dKPYlK3NZ3VBN+DT7TmMmsA+dpU9fmWaGVbC58iFnft382n7lnQ5bJAnm1
	IWYlN1wwzIYLg25FIyEf2+G8Vtsm9eq3J05L07fMCFuqCtkKOEHB1biX7ClYuy7tugEQ4pGfhfd
	pXMAVrBTe2KPkiNBa+77L0K4PlfWOwfH99gDxnnBGvT7HV9EFnyMPJQSn20G2FJBzHNTtltsRxc
	Gm9iSNgUiFTSYjEV4fEKq4RGEqBs=
X-Received: by 2002:a05:693c:600c:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38570451dbemr24927038eec.18.1795717417596;
        Thu, 26 Nov 2026 10:23:37 -0800 (PST)
Received: from localhost.localdomain ([203.202.252.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm11826582eec.2.2026.11.26.10.23.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 10:23:36 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v7 0/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Fri, 27 Nov 2026 00:23:27 +0600
Message-ID: <20261126182329.91058-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a learning VXLAN device snoops a known MAC from another VTEP, it
rewrites the remote's IP address in place but keeps the remote's
dst_cache and remote_ifindex. Traffic to the moved MAC can then use the
route cached for the previous remote and be blackholed. Patch 1 updates
the remote the way vxlan_fdb_replace() does, under vxlan->hash_lock,
and compares remote_ifindex in the early return only for link-local
sources, so a "via" device set on a dynamic entry is kept. Patch 2 adds
a selftest.

Results on net with 1, 2 and 4 CPUs, per selftest case (move behind a
router, move to link-local, via kept):
- without patch 1: 0/7, 0/7, 7/7
- with this version: 14/14, 14/14, 14/14
- with this version and CONFIG_PROVE_LOCKING: 7/7 for each case, no
  lockdep splats

v7:
- share all checks between the lockless path and the locked recheck in
  one helper, which also makes their order the same, and drop the
  redundant lockdep assertion (Paolo Abeni)

v6: https://lore.kernel.org/netdev/20261119095256.42005-1-ilskdw@gmail.com/
- update the remote under vxlan->hash_lock and check the entry again
  once the lock is held, so concurrent snoops cannot mix remote_ip and
  remote_ifindex (Sashiko)
- selftest: pin pings to an allowed CPU instead of CPU 0, skip when
  setup_ns fails, and drop the CPU pinning from the IPv6 case, which
  does not test the route cache (Sashiko)

v5: https://lore.kernel.org/netdev/20261115040609.61134-1-ilskdw@gmail.com/
- compare remote_ifindex in the early return only for link-local
  sources, so traffic from the same remote no longer resets a "via"
  device to 0 (Sashiko)
- selftest: add a case for the above and keep lines within 80 columns

v4: https://lore.kernel.org/netdev/20261113155133.75090-1-ilskdw@gmail.com/
- add the selftest (Nicolas Dichtel)

v3: https://lore.kernel.org/netdev/20261111180001.2475-1-ilskdw@gmail.com/
- use my real name in From: and Signed-off-by:

v2: https://lore.kernel.org/netdev/20261110153020.9635-1-ilskdw@gmail.com/
- also update remote_ifindex and clear offloaded, as vxlan_fdb_replace() does
- add the IPv6 link-local case to the changelog and a second Fixes tag

v1: https://lore.kernel.org/netdev/20261106144406.66035-1-ilskdw@gmail.com/

Zhefu Peng (2):
  vxlan: reset the remote's dst cache when snooping moves a MAC
  selftests: net: add a test for vxlan snooping moving a MAC

 drivers/net/vxlan/vxlan_core.c                |  87 +++++--
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 222 ++++++++++++++++++
 3 files changed, 292 insertions(+), 18 deletions(-)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

-- 
2.54.0

