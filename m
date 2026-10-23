Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754101;
	b=H4FXoCqKYaErLhklDoD0ug/nhMvH4HqG6J+llHDO8zDddUrPHvlwyw3WxBNzdd/iNwqW
	 p4P+/HO2lfL73BTfQPoomp0hjwwvHJuGdcumnDRqiKyO/Jd8wQXJGY6sS7T5Jb6Pt1oco
	 E87g6+oemj+quHLvdIQWirT2kQDA2/35WYuIfgdX8t+oJHzEQBnU4Cznk7r/fCKETiOhg
	 j1dS9GJ8JLv+w5Qd3phn7bob6h6OyfQ9wm+qD8RHTc7DOiqpxog2zZO0TJFSuswT0JTd7
	 yJVweBgETdUAvvyr15aDeOWOU/y7s3suFZAoLgOkIUI6zzghTOz3oUMQKoDJtgbwmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754101;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=fEbTalWWHpL5wfQv8QafMuDznLm146Cwe02W00WG1lQ=;
	b=O8mVPMMdmJ02cxjx9NNkMi1VwdIwDJcTt+CfHQkym4a63ssdXZtPMv6aj7DMEa/g8uEn
	 uTmhEsvhjcflbTxhF5TheVqDt/8PBVQvlwCidte39R3VGE4rraqXtCHS+WN3uBzi3tjqs
	 /oK2YfsNS2LK6b0V4SCOfu7+Wo4WMnfiIkNSkEx+xsToqMtfwY1pfSHULnTwayGqZiL8f
	 Xp5KZWeisV99WZ92s2NtRaQKOZ6VE3C7smQbK78x4qY2ELnb6tzlF68/QRdPJ6Fb88OL8
	 Hxu/bzQFioZ3aA3+cPOk1O0W4+hYfMysmUXBH9Yx0TTQ5wzAUWR/cehw9klGjiEn3/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE078606A31E;
	Fri, 23 Oct 2026 11:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE078606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 0A6C245349;
	Fri, 23 Oct 2026 13:14:58 +0200 (CEST)
From: Hannes Laimer <h.laimer@proxmox.com>
Date: Fri, 23 Oct 2026 13:14:28 +0200
Subject: [PATCH net 2/2] selftests: forwarding: vxlan_reserved: add gbp
 changelink test
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-vxlan-changelink-gbp-v1-2-f0d13951c09b@proxmox.com>
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>, David Ahern <dsahern@kernel.org>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Hannes Laimer <h.laimer@proxmox.com>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=h.laimer@proxmox.com;
 h=from:subject:message-id; bh=+Wja4C4KW6NKwPxy0uuOg9TWw8YkEeIgPXO5U+KJEH8=;
 b=owGbwMvMwCU2e2Iv83RDTSPG02pJDFm3HTd+r2Z2Xz255qY167fSTa9kD4X/23nb+HSYtOBJp
 Tumx0/ZdZSyMIhxMciKKbJctt//dVbv1Dij05u5YOawMoEMYeDiFICJVKcw/M8zr5MVeXLmshVD
 6BXzPDYd6fymDLvwt1v2Tl9ks2GxSDsjwzc+p/V+rIpep7j/OH4Nu5Ejfs//OkuF9OPyX1/nBcz
 WZAYA
X-Developer-Key: i=h.laimer@proxmox.com; a=openpgp;
 fpr=64D04F905C35D23EBE24D079FA418E647F2175D1
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1792754097457

On a device created with gbp, run the reserved bit probes before and
after an unrelated changelink. Check that what the device accepts has
not changed.

Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
---
 tools/testing/selftests/net/forwarding/vxlan_reserved.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
index 709845123727..0ce264cc57f8 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
@@ -40,6 +40,7 @@
 	reserved_31_test
 	reserved_56_test
 	reserved_63_test
+	gbp_changelink_test
     "}
 
 NUM_NETIFS=4
@@ -338,6 +339,20 @@ reserved_63_test()
 	    reserved_test 63
 }
 
+gbp_changelink_test_do()
+{
+	vxlan_device_add gbp
+	__default_test_do 25 "gbp"
+	ip link set dev vx1 type vxlan ageing 300
+	__default_test_do 25 "gbp after changelink"
+}
+
+gbp_changelink_test()
+{
+	in_defer_scope \
+	    gbp_changelink_test_do
+}
+
 trap cleanup EXIT
 
 setup_prepare

-- 
2.47.3


