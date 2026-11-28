Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850845;
	b=B9Pj+4Lmk15MrHJK1ZMA8aeym18uRGd17JTvNMGfRAlgQtE99/JvRtsK5dV6J5JFGcPr
	 xvpgoZ9Qz8u6lBKxqTYbOgayC6mJYtRTVUKEN6PXA9AXVtZAL0LTlV0AyDcXH1jG20QCp
	 /V7YKEfXFodO96P6PrMBORbh0aP8o4u58QNFucWGerQuczFqNiEyZlxi6KfFj2KLHrPf/
	 JtuEDgseq5Yw0Z68TxHcHYIdJ7n9M4eKrrGtq6/WTHsS++KOk3/b1mHNzqFMHk+JcL99v
	 Uiq9RabSSgLrLxIwovI23KMsKDiSn9aMoOgpV5D8UdHYZ/ezBHszzIa4p/Fzsv96TIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850845;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=uXPgXvBJT57DR1S+V3IBkpL9Dt6mi6Z/uuu7CuFzrb8=;
	b=iO7d3wJjkiXZxam8HiFRZRnUTsiVd9vx7UQTRW3uqw7HnyB+u11yy33sl8y5zsLUEMqn
	 e8LZ5AgaQFlkbJ3ntLTE/U+KbD2lVCffD18zuaQNUw48CMjE5a+GJXjB6wQLXX7sAbA7C
	 A3+6WYydcY6hFyFd+JxMe+X4AE8EHc2Hy3/mLV+5EmCOTr9qSD5mDll+Ms2t/5o6vofBN
	 VM8mUZWGUr3ImpIjHV42s7AW/FgyCwtLhktOYjHyPokkpErp38EeL1T0sKrIJSCIZfCXT
	 xmyVSy/DzRnatb0RTplKuPzdjEVkPgLReKX5xScfSETShAzf++ZjpqPPVMtKbKcvOBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SQJC7cRS;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131F4606A31C;
	Sat, 28 Nov 2026 07:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 131F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SQJC7cRS
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uXPgXvBJT57DR1S+V3IBkpL9Dt6mi6Z/uuu7CuFzrb8=;
	b=SQJC7cRSWEjLbpHqVRB+BqMMel7rrly3hil4T6/9JLroEsRPJ7J9axzhBt/AYqMCverJa6To+
	QQ51V35MLf4A36Vab01XTQM1VnVkLvh4PzsAyivPZ0/YlnEt0SJ2jsw8YAngiu3b+uGKW7Ew8JY
	jZJzF/KYZUPKeMGBczEfZCo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jc20Y6V9FzmV6J;
	Sat, 28 Nov 2026 15:26:53 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C12D40586;
	Sat, 28 Nov 2026 15:27:19 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 28 Nov 2026 15:27:18 +0800
From: Long Wei <longwei27@huawei.com>
To: <rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>
CC: <shuah@kernel.org>, <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <hewenliang4@huawei.com>, Long Wei
	<longwei27@huawei.com>
Subject: [PATCH 0/2] mm: memfd_luo: pick up seals added after preserve at freeze
Date: Sat, 28 Nov 2026 15:24:42 +0800
Message-ID: <20261128072444.1114964-1-longwei27@huawei.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo200009.china.huawei.com (7.202.195.26)

A seal added to a memfd after the memfd was preserved with a liveupdate
session is accepted without any error, but the seal is silently gone once
the kexec handover is over: the retrieved memfd no longer has it.

memfd_luo_preserve() snapshots the file seals, but userspace may keep
operating on the memfd until the handover, so the preserve-time snapshot
is naturally incomplete.  memfd_luo_freeze() never re-read the seals and
memfd_luo_retrieve() replays the stale snapshot, so seals added in the
window between preserve() and kexec were dropped without any notice.

Patch 1 re-reads the seals at freeze time, mirroring the file position
handling: freeze is the last snapshot point before kexec and the only
place where the final value can still be sampled and, when it diverged
from the preserve-time snapshot, validated while the live update can
still be aborted.

Patch 2 adds a kexec round-trip selftest that adds F_SEAL_GROW after
preserve and asserts that the seal survives the handover.

Tested on arm64 and x86_64 with two consecutive kexec handovers each:
with the fix the seal survives and dmesg stays free of new warnings.

This series applies on the current next branch of liveupdate.git,
where the file is still named memfd_luo.c. I am aware of the
pending "mm: Rename memfd_luo to shmem_luo" series. If that series
lands first, a trivial s/memfd_luo/shmem_luo/ rebase will be needed,
which I am happy to provide.


Long Wei (2):
  mm: memfd_luo: pick up seals added after preserve at freeze
  selftests/liveupdate: add seal-after-preserve kexec test

 mm/memfd_luo.c                                |  27 ++-
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 .../liveupdate/luo_seal_after_preserve.c      | 170 ++++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 4 files changed, 197 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/liveupdate/luo_seal_after_preserve.c

-- 
2.43.0

