Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416743F23B1;
	Tue, 20 Jan 2026 23:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950560; cv=none; b=pq7ZyZPYp14TRtwvvyFrjXwkFpwe/6z2iWmSMV/3qbctTKaesupl8+zh6NkEwyYvYj94ZJZ2jKKjST7UPpxwZUClG/s9Dr2TQPZrJmF6H4R7lT+oEA27HQLGofp5fzMNB73Qvvg4uex4hm2lWgWXpmz2EMs1etcvahQHA1Vgfrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950560; c=relaxed/simple;
	bh=cl/oxUa1+f+FOuccU1w3GRN+Be5tCRgslnjtCPt8eR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZBzk4GSWBUOfgkd5W6ZSR8Ho3XWIhKxKmkeVkvC3QfPwWOAcUoUuBRlzChpThDcvel9navtpykHyUtGm1IfgvvnXxWA/N1a2qv5M6IN0QesPeLO/XGaGaAfhJ5Tc6WyIcClYWShD7faBZ8/pvttO77qTsoXY/WSV5qcRVq1ceI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=dIzxhh+c; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="dIzxhh+c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=aaLVNWnNg86fLb3+s4CX4s4wzaiYfhjet01jSicqIhg=; b=dIzxhh+cQ21h
	f26WQyzHqVOb5fmtFxnwOpbt8WtO2x49A51Xq+MXjzHUad5MEcaZzBPyxped5w4um4/02/SctS44T
	eivB53z1WUWbqGajqjjpPcI7KL8Yr6fZJHfdm/u6CZn/hhf8RggOF860EKSR5Jk4UGxaztkNWiW5P
	CBQvhbYq9yQgyoRWk2dlBdJ7PevwSNH5rby64iiN4n/ULsZ6lIS6qyWVnXV9OWgCm0xJs3V5hfWA7
	hHCSENEInH35Snhu9uUGQKN6J6vW4oPrYgzQyKPcWzZsDayU7jdZqANWx2eI7OHkWdH4s3RCs+7n5
	8a0wrKkkoKsbCDezzExL+A==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1viKq1-00Fsy0-1g;
	Wed, 21 Jan 2026 00:09:01 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 60KN9ApE328540
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 23:09:10 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 60KN9948328539;
	Tue, 20 Jan 2026 23:09:09 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Petr Machata <petrm@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH] selftests: net: forwarding: cleanup veth peers created via NUM_NETIFS
Date: Tue, 20 Jan 2026 23:09:05 +0000
Message-ID: <20260120230905.328528-1-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some net/forwarding kselftests set NUM_NETIFS, causing lib.sh to create
the requested number of veth peer interfaces.

These interfaces are not removed when the tests finish, leaving stale
veth devices in the system. This can cause subsequent tests to fail,
for example min_max_mtu.sh.

Ensure that veth peers created via NUM_NETIFS are properly removed at
the end of the tests to avoid interference between test runs.

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index a9034f0bb58b..ae7699c0c7e5 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -597,6 +597,10 @@ vrf_cleanup()
 	ip -6 rule del pref 32765
 	ip -4 rule add pref 0 table local
 	ip -4 rule del pref 32765
+
+	for ((i = 1; i <= NUM_NETIFS; i=$i+2)); do
+		ip link delete dev ${NETIFS[p$i]} 2>/dev/null || true
+	done
 }
 
 adf_vrf_prepare()
-- 
2.43.0

