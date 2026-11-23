Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428452;
	b=F0OHn1nrdhmGcrQNxGC44KughhDS7m3Dh+sNtUrPMA6gCaDTpPdTMfaL8UO9DxjPnSSK
	 RZ25dhJhqrO76iYMx4ilwTYQJCNYi+QVqtLsxDFJx9taAkYRS7emJ4dWJ9CUS6zEDgcLQ
	 naIXNvcwHZXyxX+2O3HXOz7qhXJwQvrguxBCPQwZEo3aOjhx7PcTz9WDVYge+hc3yWfQ6
	 hRxwwBsCGTZxcbJs6vaJ93xnIOBKOXQ9cIDu4H0gdW5WPMgjLL9iT563/Reab+/yiS/T0
	 aAA2MZSt5TBl7JUC8lYka5r9hUPTHz28UQHQ4f/STWcjilSuwVxKGUwb5WveUIF67SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
	b=NvrpO8vZrITmuoVE1EzWp8V528Scb4Zgg/r7fwamwD8gPzmzP3MuAlYo3sZliwkMNrkm
	 O8sfKIq4ohcPTuYymx+GAZKkIeSvsnKB6i/OVUKSeUzpGflcU13vs/HCGH2mh9qZ7FtNw
	 00nvkYFDZHNZFUYRsVjplmMIe4aPhL/KEk7RiAmLTojaWql1mYvbvR1Avu6B4pPqESeu+
	 JWJrKwWdKRHlYV0/D5Fc3o8X89SlsbOUOfHakVYl5r2Ln0yIEO2VPXE+mWv41vSN0CJuy
	 ZffO15KB3hu6xlAlqRsPNGfkNVBGkxb2W9q1rD8XSjFGYCR1H1QWimvrqMW33SysUQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQUCWc3K;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E49B606A327
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E49B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQUCWc3K
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so4243147c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 02:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428451; x=1796033251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
        b=GQUCWc3KywEfq1ONwfcZkeWJcU6L2Hx2PycLnXFhTrAeH6Gzevp/76LTW3tRD5S3LA
         gZ3EnzYY6pdymFYyV29/mxm1mQ+FG6/8eD6U7vJoweA0WiWqcaJJxwLfJxKNuYJfXsER
         kDUOv+IueG+/i0RSJTa8Y7Z5ODBug5CUz5nDFLtxLgq9FrPYbjLGqQFHs6P3WUgT5TMp
         6TNe4u/BIY+fGHQA7l3/u8hH04fyF3zlrFy/zFHdDf3xEjnIlbk/hEIkQFGZ09jfbO8c
         cO354H9nlXR0hgd/aYx3VTBAWKnzfxIdKDZP3jiyRbp3+JFutEQ6WbcVfclnIZ/rv5GN
         9jEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428451; x=1796033251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
        b=Bg79l8nIp0Z8nYCk0cw9pwQ7nG4QJWDplpY4A+1i+HUMNpYroYELzMPpIjuYsnDBvB
         6u/UbMmjt4xN4/L64lPYWbtDE3hVrFeGRhcrgrq6CzR5/TE3ZAKUe2vPey4LE1noOXlE
         owRTXVoMBKYW6Peer/0YrUhOXSq3htwS7saF/etnOLEo2H2q8CS5cBKnaqJ7wg8Y5NNA
         ZeRZyciWA2zApp2KswFGA/XZE/fC8rNsP40kSOeCE7LbAw9IIoeN+3y5mp5u2Ut+hXry
         gCuZjVGNCARUAnY0oqM2ySiJ5uX2L8WeAMsjQUVRBQGGd3q8JTf8qBIITfyQdh90maCM
         iMHw==
X-Forwarded-Encrypted: i=1; AL+hErGGr/w8/w4OHoL67h1v1jLWoTg4k4ivYloc4rQ12kjs4HyuxLQ72H367Sc7Vt5TxDVMj2To3h3PpFiQGV8GsTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zYM50mAEhyXvbsgHYhLs7o62ntdYB0+59cMS60PKPVd97k4hy
	L95aFxk6VDUVMMdgWC+GvERIrMf23cAN248+j2j4/mjYp9VIin7xp8NZ
X-Gm-Gg: AZFdTZffp63SgmWL9v3SurZGSS16E1aJxftl+eSoJ4OYFPiztk9wIbrDC3Q0F5cq+17
	p/IRGOSxzK3CaaYcW4l46KOpz5Yq+AhW7kQyUlZ4ZReuD1QYWKIaNLIO4THvqkrKtVvqO/dks+d
	rLZtUeNFPx7zPm09J0BtD5+HbWrrnJcwawwgHQaG7U8BzizBknaB5R+MpeXoXqwHwYyAd/3dBAj
	ubENH7v3Xrk/koPBMwhz/aihjuHs7RPHDYVdq/n3oKFQDeXp6hZ5SflPHZHgFJ/+fkxKk5zYVAZ
	r5DRUyPrG5R+MBizAktKiK5kTEhUmJ7bDqRB+PsHrA6ed5oU/doeTRupVqpG7S5zP1YtttdjcdC
	mWuAPQEpnsGOGFZxzgd9T4MuZcEZMcclfv3cAogVBLcYn0CAZlsIBYhLAXkmpWJXfJ2V8vNzuYE
	NxXnRE2Mg9x7N5gUZOBkZw8gOUGj//xllIw7Xmh+NZoJhAYWvbAtayw9rDk3GRS5zgklaOHiHAH
	h8DsR4sfhulkY6lD6qXmPIFptiaoXL9mIofXjctfyd3LoquPlslW/ggC5qW0KzCsSGcIep6nLmO
	IBnYgyAXJAyXPzIuQMG4fdN+rb3ZbzeSu1rY3NzS2g==
X-Received: by 2002:a05:7022:ea8d:b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1b5568eebafmr10409997c88.40.1795428450986;
        Mon, 23 Nov 2026 02:07:30 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm37650054eec.21.2026.11.23.02.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:30 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MAINTAINERS: Add the LoongArch KVM selftests directory
Date: Mon, 23 Nov 2026 15:37:00 +0530
Message-ID: <20261123100701.1679376-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123100701.1679376-1-gokul02k@gmail.com>
References: <20261123100701.1679376-1-gokul02k@gmail.com>
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

The KVM/LoongArch entry covers tools/testing/selftests/kvm/*/loongarch/
and lib/loongarch/, but not tools/testing/selftests/kvm/loongarch/,
where the tests themselves live. The */loongarch/ pattern needs a
directory between kvm/ and loongarch/, so it does not match it.

As a result get_maintainer.pl omits the LoongArch KVM maintainers and
loongarch@lists.linux.dev for patches to those tests. arm64, riscv, s390
and x86 each list both forms.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..fed2245b979f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14327,6 +14327,7 @@ F:	arch/loongarch/include/uapi/asm/kvm*
 F:	arch/loongarch/kvm/
 F:	tools/testing/selftests/kvm/*/loongarch/
 F:	tools/testing/selftests/kvm/lib/loongarch/
+F:	tools/testing/selftests/kvm/loongarch/
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
 M:	Huacai Chen <chenhuacai@kernel.org>
-- 
2.54.0


