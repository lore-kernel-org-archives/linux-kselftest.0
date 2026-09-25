Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7914A341C;
	Fri, 25 Sep 2026 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343796; cv=none; b=j7ZGKGnA+Nw+mUBliBzckFkkKnfxd1dzz7tsyXGJUGnLICIYa6XVubCTBezcEI+i4t2QI4X7Zc2gdI3fMO1BvrjzgvTafX4eBSskA2AtC5hFJR0CWPYJKtFiohFd3UIqTdsejL2CPWK9tKC+IX7JUtd3k2Q6KKgNPPEmPvpDvqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343796; c=relaxed/simple;
	bh=dTPNVWC3GqDzXoDZiV1+ftHoQtBycIMXju7p5UdkEoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wse5y4bbrw/YFPeiC6qgeIbmAeRpcVOxTRXJoSg9xXfcjO2uvphEAr6Re53+INuRslVPVYI7t3ZoQsGyTJEbrGVYhvLh1B4m3zTaIkHGwHOZfoUA+xPWZMTTtvs8VsdxF/+i+u3CJYFfPmukLD/a8VxC0hoxAS89ki/C8JtusCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=hW87PTmt; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="hW87PTmt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=yukDxVZM8TYgs/dTZmqHs1ilO4it9VjQAViY7Dxnklg=; b=hW87PTmtfTnK
	VF2jWpkmT7iq7clKI19FS9dMOaPFqyEQ5p5CVuHcE3hKzd4J6aShHmpl81Tiu4Ia0DbyTZXRkWb0Q
	agNK5LELQQV847fCkxIUNmBHNo5iT8GB8OOuGVJtpM1Uf6uBNEoi4nhHPiHvwj1lL820w0wXozdUt
	SRTtkUHTYcI3cY98hSrc34N/fdNmOxvEfrQiy2BTFNEls3ZpdtWr/XDSaVRQ4hdzFO3xzZTbngGsz
	rem10N3PK2PLuF3m+yG3aNgtJS9E2J4J/tdnSfS/LPkyMgtpb0SDvzfhe7ErjD85kodmtt8p9R4HY
	J9zdewBuwvYM16WmqS4ycA==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1xA69k-008d8O-0x;
	Fri, 25 Sep 2026 15:43:04 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: David Heidelberg <david@ixit.cz>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/nci: skip when the virtual NCI device is absent
Date: Fri, 25 Sep 2026 16:41:59 +0300
Message-ID: <20260925134232.3638500-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All 8 tests fail in setup without CONFIG_NFC_VIRTUAL_NCI.

Skip only when the device node is missing, so that a real open()
failure, EPERM or EBUSY, still fails the test instead of being
reported as a skip.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/nci/nci_dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 07427fa42888..cb567d6f32ed 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -430,6 +430,8 @@ FIXTURE_SETUP(NCI)
 	ASSERT_NE(self->fid, -1);
 
 	self->virtual_nci_fd = open("/dev/virtual_nci", O_RDWR);
+	if (self->virtual_nci_fd < 0 && errno == ENOENT)
+		SKIP(return, "virtual NCI device is not available");
 	ASSERT_GT(self->virtual_nci_fd, -1);
 
 	rc = setsockopt(self->sd, SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, &event_group,
-- 
2.55.0

