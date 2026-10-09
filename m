Received: from va-2-56.ptr.blmpb.com (va-2-56.ptr.blmpb.com [209.127.231.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BFF49BD7C
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542501; cv=none; b=g89h2MqXzEAZRt2faWp2jEH5txsKZKnPGPH5hDHavY/o66mRsZOB6i1N2OrCXL2IilqGe16m7y3HP7xsbkqg7HlGs7QrOQVK3SaTEOB7/o2RQK/5QV9BEArsDP6kHkRkxB7g0o+0keLdWjIdHBT9NjqcgUcJyhNOC3Yoq6lE1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542501; c=relaxed/simple;
	bh=EMVL+vtprNX6/nb1cKg8CTGnpBwi4mL9PY0tVfV+wHw=;
	h=Cc:From:Subject:Mime-Version:To:Message-Id:Date:Content-Type; b=loLYPBovBv8eA3y0avDbxU+OzaGULF7ECI4vzvKG/EKB1schl47XPUtSczZKq1K2I+04c0AyjunxiIwgaI/mmFNC1zYXL4fDaQuH58IHod55u4zfJYUzMWKJwjUVgViLzSYKASBbFXDrUwysh8j1ozG/b8TxIJcR78CkvHZZ6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=bTxFwom7; arc=none smtp.client-ip=209.127.231.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="bTxFwom7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1791542492;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=CEJbbbhuXHgrYs6t3WPjEtu9JKVxoeLA7pFn71Sz5a4=;
 b=bTxFwom7nw/ai03UEjIoUvLYMzReOVEaIvlywfP8G6LrIHLfnPDq/iUGImplw+9DZ7tF4y
 tzpGx2IIWEYKFUsLPDczL8RXVeleH3TwWWl05qByhuudXkxAyb9fax/9+ldp7mcClNCH6q
 GygogY/+iZe8ioIP4HCA/bziup4CsFmLJGZgMy09kWZ/FZ9jpY/YLDX+w6cOR8fZbxMcc6
 WvQw29xR8Zr4oq2nmnfIgT+vRldSn4YjyEVyNWVMvakTN5oXXPUVy5+8ohVvKGBs/8AAwK
 fQAg+6szagJEXTUC52GI3mbU+weoZy8fsqDMOyaIq05VYxfvfTHopGkib3aK8Q==
X-Mailer: git-send-email 2.53.0
X-Original-From: Jin Li <jinli@lanxincomputing.com>
Cc: "David S . Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, 
	"Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, 
	<netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Jin Li" <jinli@lanxincomputing.com>
From: "Jin Li" <jinli@lanxincomputing.com>
Subject: [PATCH] selftests: net: forwarding: bridge_vlan_mcast: Allow default startup query interval to vary by HZ
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from ubuntu ([123.120.5.129]) by smtp.feishu.cn with ESMTPS; Fri, 09 Oct 2026 18:41:29 +0800
To: "Shuah Khan" <shuah@kernel.org>, "David Ahern" <dsahern@kernel.org>, 
	"Ido Schimmel" <idosch@nvidia.com>
Message-Id: <20261009104109.754133-1-jinli@lanxincomputing.com>
X-Lms-Return-Path: <lba+26ac8c4da+802424+vger.kernel.org+jinli@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
Date: Fri,  9 Oct 2026 10:41:09 +0000
Content-Type: text/plain; charset=UTF-8

The mcast_startup_query_interval default value is calculated as
125 * HZ / 4. With CONFIG_HZ=250, this results in 3124 instead of
3125 due to integer truncation. The test currently hardcodes 3125,
which fails on kernels built with CONFIG_HZ=250.

Allow a +/- 1 tolerance for the default value check to account for
this rounding, while still catching genuine regressions in the
default value.

Signed-off-by: Jin Li <jinli@lanxincomputing.com>
---
 tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
index c4cd2078a8db..e72680869721 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
@@ -383,7 +383,7 @@ vlmc_startup_query_test()
 
 	echo -n $goutput |
 		jq -e ".[].vlans[] | select(.vlan == 10 and \
-					    .mcast_startup_query_interval == 3125) " &>/dev/null
+                                           .mcast_startup_query_interval >= 3124 and .mcast_startup_query_interval <= 3126) " &>/dev/null
 	check_err $? "Wrong default mcast_startup_query_interval global vlan option value"
 	log_test "Vlan mcast_startup_query_interval global option default value"
 
-- 
2.53.0
