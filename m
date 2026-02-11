Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8F2E62AC;
	Wed, 11 Feb 2026 02:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775214; cv=none; b=UXyWx0Ny+KeJLX3jK4ukjmHpyHyV3vx0oiwxRQFBEUbnIeKBvcxlkwsCME1tXc9KisuuB0dqN5E6GJoATuMl7ZTLqdM7L4wNPLSjSx5bezcrb1smyjJ1OHzp9GLZBHnFo5BbEP+Sl9hkgiSN/DqJ+AZ9ffGdhn+azjgDXzZHpdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775214; c=relaxed/simple;
	bh=3+d0+A9SYm9BfWYujapbGAM9JXvxM5dKR5JqFFTZlzI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wt5Vkh5uxahF4CULkqZycfR8BtzqT3HkqWvuHM4vxQANiW+3OTN0mje7VIP5iSLj2Dw4D5AXXchX8mn9cIql5vhgpJaBs2JWJwrDIJcZ5DE3rMH4G/DTFjg8IF9ykqE4TBBNX0R56oTlXjOCqkpIgeK0BRLl+leajx5sQw/ba6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6KUAlBXW; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6KUAlBXW"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZZqq8+GdDbSaKyMlWj6dTYFz3jUfvOrHZvzVP/UCqjc=;
	b=6KUAlBXWjliPhu85Hxd5e9/rPI7je4cwWb0UP+A9t7JJy04FcZjeU7ZkMUIgmb2Z1pB9YO3RS
	PgrKxsp7K2M2a0XYSlK4lxE0/0tbAOxyaiZZrg7aZS5Df2f/EQNqaRVF7KCO2UOM3ZE2ovCbis/
	ZCM5+dHZFs8ma0h3IvoOMNE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4f9hMy3JVBzRhWB;
	Wed, 11 Feb 2026 09:55:26 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 151452012A;
	Wed, 11 Feb 2026 10:00:04 +0800 (CST)
Received: from huawei.com (10.50.85.128) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 11 Feb
 2026 10:00:03 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <shuah@kernel.org>,
	<petrm@nvidia.com>, <razor@blackwall.org>
CC: <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <yuehaibing@huawei.com>
Subject: [PATCH net] selftests: net: lib: Fix jq parsing error
Date: Wed, 11 Feb 2026 10:21:46 +0800
Message-ID: <20260211022146.190948-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500002.china.huawei.com (7.185.36.57)

The testcase failed as below:
$./vlan_bridge_binding.sh
...
+ adf_ip_link_set_up d1
+ local name=d1
+ shift
+ ip_link_is_up d1
+ ip_link_has_flag d1 UP
+ local name=d1
+ shift
+ local flag=UP
+ shift
++ ip -j link show d1
++ jq --arg flag UP 'any(.[].flags.[]; . == $flag)'
jq: error: syntax error, unexpected '[', expecting FORMAT or QQSTRING_START
 (Unix shell quoting issues?) at <top-level>, line 1:
any(.[].flags.[]; . == $flag)
jq: 1 compile error

Remove the extra dot (.) after flags array to fix this.

Fixes: 4baa1d3a5080 ("selftests: net: lib: Add ip_link_has_flag()")
Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 tools/testing/selftests/net/lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
index 0ec131b339bc..b40694573f4c 100644
--- a/tools/testing/selftests/net/lib.sh
+++ b/tools/testing/selftests/net/lib.sh
@@ -577,7 +577,7 @@ ip_link_has_flag()
 	local flag=$1; shift
 
 	local state=$(ip -j link show "$name" |
-		      jq --arg flag "$flag" 'any(.[].flags.[]; . == $flag)')
+		      jq --arg flag "$flag" 'any(.[].flags[]; . == $flag)')
 	[[ $state == true ]]
 }
 
-- 
2.39.2

