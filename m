Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9CC230BEC;
	Sat, 25 Apr 2026 03:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777088599; cv=none; b=MbByy5P1tTbwFc3qM2OO3mtxEwoqd3S9nl608OO8P2bJ9XXu/md+8F63EmybnIJC2/mVLYLBcyceMb8ru/y+vPuqtNWPtAI3grkstPnFzYeMyedQaY7a0RTwEvd1DGpRJh+onRyblKzD1TNBCrTa7Hae/XEzOx0fZ+qoK8gJuwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777088599; c=relaxed/simple;
	bh=fsIicR7YSjJl20yZsB4hJRQWtE//Ro0LJQLfIdIU9CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPYYxiuHM+v+Fsnivhgzk9oWS1tbdZh/Zu17ub6zD6SDNkMt9/6NF8Zwumw/Kp4wui8GM0miaV8IX37xDajBi+yaawLgsiRg349Il7tqMX5o/Om7eXNiyvnOpHuRKdBkixoM3SfUUabmEGFUVgVxuPYzxXlaI54CMMb+qjVZzW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=AO5DeYTv; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=NKosyZCh; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="AO5DeYTv";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="NKosyZCh"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777088596;
	bh=fsIicR7YSjJl20yZsB4hJRQWtE//Ro0LJQLfIdIU9CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AO5DeYTvwLSR4SXBZkXj/Y8POgFm0Jcc6kzuKu2u0KkrPhRINW4P1C4VHSwSOs86F
	 ZnIhazH2N72aaItCezmXRYC5E7oean4HTzEVM3PmoYsscuOK3I5Qz/W5xwrs8Jxtnf
	 4K4W3+5bZrnV3iJN5TwNUslG5/S38+bzuw+dEkfbIwBngqciWlouPnQV5Rk5CnEwgP
	 vNV2Ap/d9oaiMcFQJ1xwRf/ioHbjwsJVH8DG7E5vS2S66O5ex8/Nq908+ZxULBjIDg
	 xlvIgHco0K6UsoNDBaP/B6PrC8InpPR8E9I5rM8s3kVYLfitMcO01CLzQ1UwDonW3l
	 1WQYf2s61OOFeFAaV7jKVmqHvBU/cxTjdtxjPTjudBQJ66YmN6F7aa3/fm9az44RkN
	 qrQut1l3R9rAmNif4mhGqzV97OutF0mBQn/4x4dCoAwTWiT/M0tkLJKO69y8Tk2asZ
	 Ncpd9WtrFq5sWAbTYsf+dxLJBrYmFw4w6gU3rVNZuNwTEn2iliVUbmIEcpLtefjI1b
	 3YiLA6yNnIj7HbAHvN9yjPzl0/o5uxbvVqXEIa8GyDzsKzZwT+fppdOU11Dp12TTRO
	 t+gzJh0q6F6AtiH12V2rkASumqJOgFLbuO15En8RXgPTtM0PHgo7UgtPqW4r5dW9Np
	 J2oCYxo+7GPDczfYChHNZACo=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id AAF391E8F13; Sat, 25 Apr 2026 11:43:16 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777088537;
	bh=fsIicR7YSjJl20yZsB4hJRQWtE//Ro0LJQLfIdIU9CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NKosyZChvSpnjsasPsHyBnwYgw/Qh5TO5CwBIpNVMuzWeX7RSvQUCg9oha3Wq+Fef
	 hJ4jt8d9WHyYDDyYXqMuExrr/NFt0jtnbqYwqK6AE1tcnxrlWTsge3s82ZDXcxLXqq
	 koJe9d/C2sUy1Jp/4T50JOf3wyiEYB8XghWvuZeAnaGJPhRnK3585oKKenRbp5/n5u
	 mLivXFI3UnWLxhidkzYNdKHciihX62Z0gpkMhWEpzHaGUFKa8OzOmsih9CX15X+TRk
	 Cp0CFrp8FgLeoeGX+9o9WdhU8Cs2pOgpvfSdazH8H30YrlQPvyFYhY5nv/l9KciJRO
	 DGCEsxUrZ9Kvs7rm/RWsjOaAt/SWpfC3jf2NkGwnpwRV+xqaSo8SMT1+jEhU/TI0gv
	 cmmyMk0BlWJ8mK3aOn1CiI4r30mNBOx5Ch8V8hCkug58wBQrMC/D0KAhJHJCcb+HOS
	 TyJQFEnt4NJLhzVc/WueTDGlE5veapVNEMr0nQoRScPn4kLkUHLZbIdXeGNEs8cYli
	 c6FarI37L8qdZZaHUIsfCRcAROZwAwyrZJoStXMJ+R3sUJWVR9fWnFtWHN5BDKwTG8
	 Bme2S3vti7tZazwoIqRDJ6yYEjFIw7Q0Ti04ALlz1I85O4XYjqcVbMI4N6EggPw9Ou
	 fycSgGGaxlYvgd7CgQGYBaPI=
Received: from localhost (pa49-196-90-201.pa.vic.optusnet.com.au [49.196.90.201])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 48F6D1E8F11;
	Sat, 25 Apr 2026 11:42:16 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <david@davidgow.net>,
	Alan Maguire <alan.maguire@oracle.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kunit: config: KUNIT_DEBUGFS should depend on DEBUG_FS
Date: Sat, 25 Apr 2026 11:41:54 +0800
Message-ID: <20260425034155.53913-2-david@davidgow.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425034155.53913-1-david@davidgow.net>
References: <20260425034155.53913-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_KUNIT_DEBUGFS is totally useless without debugfs, so it should
depend on CONFIG_DEBUG_FS.

Fixes: e2219db280e3 ("kunit: add debugfs /sys/kernel/debug/kunit/<suite>/results display")
Signed-off-by: David Gow <david@davidgow.net>
---
 lib/kunit/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index f80ca3aeedb0..94ff8e4089bf 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -17,6 +17,7 @@ if KUNIT
 
 config KUNIT_DEBUGFS
 	bool "KUnit - Enable /sys/kernel/debug/kunit debugfs representation"
+	depends on DEBUG_FS
 	default y
 	help
 	  Enable debugfs representation for kunit.  Currently this consists
-- 
2.53.0

