Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4141F5FC;
	Mon, 31 Aug 2026 16:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194260; cv=none; b=kYrRVen8e8H8ClA1TtfZeNG3RJXDZchnm+TlkVUCyjgo63SyltXOQcUDFF5XJVd9AMEZgbWcVi8Y/oVem+AQEUIr/qOYm8EUEPyO30AYAvHfDDCx+u8hY/4KiaXgzqbF0CjXhvx2D9IJXVcJirlQaYUKvJSaLRPKA3wenD0olBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194260; c=relaxed/simple;
	bh=DOK1uoduY8MpzfNIRS74AOcCLrKDEbk0VdP+jwY0iPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdWsdjtlPr45I6JvkAjR0bg5bxZ4c2aHf0Ize4QaMHw9zZrdDZdYuqgce+7p//zDHcra6g9lbXMJDHmR9HWYVJUfiFtwbh6ydx+FdX+MpSQlLV6muv/pFBgSeSqzVsarobzFzZmFFBBm0BKQ3QZI9YKqZiGfdbs4kcjw83PU8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYVLbtAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYVLbtAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00881F00A3D;
	Mon, 31 Aug 2026 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194259;
	bh=7gIw5gp97uKAlzd3ycLRaDSFhe71YMEtrkH8ehr7amM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VYVLbtADjLHinZ/S7+TVBz2zaWBa8HlFupsS0eS6TfWY2zrLbC2/JI/tWEOKpB0lm
	 KOnQ9S1Rkesh/fQ6qNBIY1RqtcvFDrlcMIeX/YkaL9lV6j01eQ8JLqEbTCcxh8BJ3G
	 sJAle3IzulHRZmqGI8KE26tmm8X1eNuNCW3BG5XMFxDBP1cdIx2DgFAh2uZeUxD8rR
	 tHHzkoRNRpBKkCU9JIqhf/MF5q4Q5j7dqypi1OdU/VCdLKQyIoJdHAU+xUrEFfDsc0
	 tziHYFISxX11DBahMDdf1PFobRWdAXzNSZMFPDOewTYTOn/T9ioyxjn1xhlz8+2bor
	 v4SnfKWez0jwQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	linux-kselftest@vger.kernel.org,
	noren@nvidia.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 1/3] selftests: drv-net: hw: rename gro_hw.py to gro_stats.py
Date: Mon, 31 Aug 2026 09:37:32 -0700
Message-ID: <20260831163734.1121891-2-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831163734.1121891-1-kuba@kernel.org>
References: <20260831163734.1121891-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to free up the gro_hw.py name for the HW-GRO half of gro.py,
which we need to split by mode (sw / hw / lro). The file checks mostly
qstat counters, so name it after stats.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/hw/Makefile                 | 2 +-
 .../selftests/drivers/net/hw/{gro_hw.py => gro_stats.py}        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/drivers/net/hw/{gro_hw.py => gro_stats.py} (100%)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 78bb0169350b..6105be8e590f 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -27,7 +27,7 @@ TEST_PROGS = \
 	ethtool_mm.sh \
 	ethtool_rmon.sh \
 	ethtool_std_stats.sh \
-	gro_hw.py \
+	gro_stats.py \
 	hw_stats_l3.sh \
 	hw_stats_l3_gre.sh \
 	iou-zcrx.py \
diff --git a/tools/testing/selftests/drivers/net/hw/gro_hw.py b/tools/testing/selftests/drivers/net/hw/gro_stats.py
similarity index 100%
rename from tools/testing/selftests/drivers/net/hw/gro_hw.py
rename to tools/testing/selftests/drivers/net/hw/gro_stats.py
-- 
2.55.0

