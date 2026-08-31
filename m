Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9124519A8;
	Mon, 31 Aug 2026 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194261; cv=none; b=NEHDrPZb/M+a3GbujwZESgd3YJ+9XZLgFv2wyCDr7Bd6dA2M1bcxvNiIUc+44qfOmI9S3hRCc5XjfXJIPXhmmP0KdywsU8h8uvovUCwKQj89mO4Quw4fHj0y4671ZxjtGWVrHgK9FI2l8jy6cBgluuiD3tQ8IU1fwwECkUrayWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194261; c=relaxed/simple;
	bh=fbfKZfRA7AtKuuyCsOqJjRir+VXWTs/ZnSW33vVXreo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdFIUP4nN2UEdAX8Oj6IGBOv3T4+7tEm9J6zTWaEdbrYJPu1/HEf+G5aX3Xcm6hSM/WKuPI00oCz40BrkDkB40E1+rALVS6o46Bgdkju7baeg/+gVS5iLoKdrogTMX1fdYzMCUr9TAK5V+4j/tArk6rmGrEn2aBTf8uooS5R9RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyKGXrOr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyKGXrOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2EA1F00A3E;
	Mon, 31 Aug 2026 16:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194260;
	bh=IsuDOHBR3cYkzpMEjzNFmrJijweGfX9WRCDy342vUt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MyKGXrOrlQfFTeJLhSbxzQubs0b8nt0jCupd0RN3yGQvowPrxNPukSmMUiZ4oCR/4
	 mceQ00GG06aq7gxXYKmtzcB2Sn87OPSEQpTEuHd9IUSmlMlA/w2j7z3VdEkDJbSqCv
	 3yPPkxcpu7bhGvZSHbbR5DDgyVIFXubOCsgW246KRveYU39rueXqxR0zVBV4s7iQd9
	 6f8b7lwDba0ywhzKYy1sxu/MX3UTJWTfBeSELe0LavmaNxA9pecJIb727DKHo7GT+b
	 N55aQsRvFbixWMfXtoHmOiawJX5BxmWjjYcK6fg9UFFw19zgUTsrfNX4Q2tu4GByma
	 cu4gIEpjGZtsQ==
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
Subject: [PATCH net-next 3/3] selftests: drv-net: bump the timeout to 15min
Date: Mon, 31 Aug 2026 09:37:34 -0700
Message-ID: <20260831163734.1121891-4-kuba@kernel.org>
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

The XDP test takes 9m30s on the slowest NIC with debug kernel.
Let's give ourselves a 50% margin and set the timeout to 15min.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: noren@nvidia.com
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/settings | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/settings b/tools/testing/selftests/drivers/net/settings
index eef533824a3c..e2206265f67c 100644
--- a/tools/testing/selftests/drivers/net/settings
+++ b/tools/testing/selftests/drivers/net/settings
@@ -1 +1 @@
-timeout=360
+timeout=900
-- 
2.55.0

