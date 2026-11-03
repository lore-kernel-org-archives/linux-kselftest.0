Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721296;
	b=twzB76TdV0sdNmMYlhywL+5x80iEBVS3jFqWTHs4V98SHSE31qg7cPq9nXmO0k7SQyee
	 Bjqw+HcjRZSdkwDdYcOOEDb6UODvUAlbxGOM8jidM4ngmfQQb+v5p/0TAbyWQpDnOcthU
	 8k2zXr2DFzvTORozFs+NimXu6FRgyB3SM+e0bVMzi2J94rpGIlq0vPczBwyf++dNdrsRO
	 xvUNyizTSW2NITBD1YQk11AoXXlYA2iNjp/4U3E7BM/h4/yz/ZX9aUx7jiLYqC3T4Od0p
	 4iEgpCQYJGM+f5N7tr5Og+Uqe0HPmH4xL2FtCqzet/zZM8XZuxuL4Tywex1ZiF1CZKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721296;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ck44c2UfWH+h/SZjs6hhnY4TSP8skS7HgYjW2Pc3Sw8=;
	b=aLKtRuZN+Bxjxl+/KiExZltblRgcy0CfznwUaT7XI04FMnhGRnH+a78V1iSTH7a0pdfe
	 SbU2b3aSB4vUHkPKrmRLkGTdwIDqwXCcMQBjdwNjFoA0zSMnABd8icr+oifpdjKqg1KEU
	 n9ggJBLB3Ra2sI3bkuEgoee/eVZx29mslfOoCZ4ePxq1lKoUC5TxGwVX0bBvVTlF3e/F9
	 vYQbnAx91bEPfhQItAaOZJZVzrlwoZJmPps2wXkdDuYclFY8aPBcW2T2/ZV0SVj4Tglhx
	 BzyTNNYLePlPLsnqP33Oo+yjZR9zrKBtLTMXzUp0CrbZdDLvfQ4Nw5ScjCjhkAh5i6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muMo7dJ+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297F606D83B;
	Tue,  3 Nov 2026 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muMo7dJ+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC571F00A1D;
	Tue,  3 Nov 2026 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721296;
	bh=Ck44c2UfWH+h/SZjs6hhnY4TSP8skS7HgYjW2Pc3Sw8=;
	h=From:To:Cc:Subject:Date;
	b=muMo7dJ+XRD3cJ3oFIwHl/jPZeP8jiC9wxWa1y734cCt4RL6GEyoT/YLz5Wp14p8H
	 tX/Dk+tFd8w0P191zFqGB5ErDAS5dxY8hMgyuYmseMWOoV1v0Y++TgJtY7erk17Gs5
	 w0uiiT+BIn54P4tiGOghaAasKgMYSmetD+wZGCvHGS0Nf2FEo4MwyW9P7J2XtPDG4R
	 fEQhh4dgFN2h8WL4E6MXQC1Sf2i+JFkDn5Yd8cv7GWnaBj1a/+I5EtP9mRq9K8N7gL
	 XbFE/pA0H7TTrmXBM5EFZpfjzIds8LFOpysf0OkaSe2Rb0YaNOkWHv7ASsIlpt8kM9
	 xB4Awo/sGIZQg==
From: Sasha Levin <sashal@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Hao Ge <hao.ge@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kselftest: alloc_tag: use the ll64 types on powerpc64
Date: Tue,  3 Nov 2026 10:54:54 -0500
Message-ID: <20261103155454.534649-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

On powerpc64 __u64 is an unsigned long unless __SANE_USERSPACE_TYPES__
is defined, so printing and scanning the __u64 fields with %llu warns:

  allocinfo_ioctl_test.c:93:73: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]

Define __SANE_USERSPACE_TYPES__, as other selftests do.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
KernelCI's powerpc kselftest builds show this. The define makes the same
change on alpha and mips64 and none on the other architectures; the
x86_64 and 32-bit builds don't change.

 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
index 74fd64b2370cc..18c761fecfde0 100644
--- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
+++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#define __SANE_USERSPACE_TYPES__
 
 /* kselftest for allocinfo ioctl
  * allocinfo ioctl retrieves allocinfo data through ioctl
-- 
2.53.0

