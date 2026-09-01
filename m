Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E5145629A;
	Tue,  1 Sep 2026 20:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293266; cv=none; b=nGNTgjcXuIigtAw79a7acfrTp9EWcRBGsQKwsr0nQ7FRyDevj0HsAMGFsutmBqwU474+q9rZCu9/mMSnL64q0SxxAdDcc+RqoTQWSgamx3otI2LUs1UYrCxkZD+5oUk+E6unYomHVc1nuDWXtUYvaIYrdCYwkzeEOv+MKNDg7Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293266; c=relaxed/simple;
	bh=7T/rB3KDf9n2alrSuJvEn/3OdJakyG+68+tyU1u5ZLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8WSBNfuBLyc2pItLTGT6Pc76lll+rtM/5BdnpCdO1+bhFlNBahwVtcKgIVv5um5EfzstiMwL7pEK6336+ZtIV7RAzP+3oWFNlN6zXWO9k/Q6uBXgcLDNIpDN1itkyyveAp5pyx1ac8FglP6CM/Xey6Si+9UAh2YSLHl4qPB0co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjY7S4bH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjY7S4bH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E7A1F00A3F;
	Tue,  1 Sep 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293264;
	bh=TZzK9JUSS3i9o6OuTcerPJo4SJ6LDrQrOK4WX04KnYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GjY7S4bHQF4ARRbz4QNPdJJgACJZ4QcVm9MM95pyu9CUhEwVy2RGbXbAxYSUF3hNM
	 7nt2tOUhLd1OgdqbdeKVgXlBo+4/GDxGlgff/Zx+VWyFHi2otueXe//a5hszfRqBsI
	 j1+WeTCHjH4mlC5DdZ7iANYBPc2g6jW9Z5y4TY25jfLmQ3vImxxN4/txYSJSAlIxfR
	 pXyFy7plPCdMFikKrJ8NEKeWG0D8MaXGo+JTRxNLO7jv32e5+PxRjStLyTiOCGVT/w
	 F1SlHGRprlbkEbs/7nrt7g/r2TJV0C83gSV6cSSjixxBpdj7i9inzAXJFVcDmjImT0
	 gRK6QvZhsJKCw==
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
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 1/3] selftests: drv-net: hw: rename gro_hw.py to gro_stats.py
Date: Tue,  1 Sep 2026 13:07:26 -0700
Message-ID: <20260901200728.2063720-2-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901200728.2063720-1-kuba@kernel.org>
References: <20260901200728.2063720-1-kuba@kernel.org>
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

Reviewed-by: Joe Damato <joe@dama.to>
Reviewed-by: Nimrod Oren <noren@nvidia.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
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

