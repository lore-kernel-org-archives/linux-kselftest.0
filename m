Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096580;
	b=qI/Mops3PiiEpkF6drLQk3DUO8kazr0wfOHv3VaNJDCsDD5F+Jl0Z+MKCikFu7Oo1Pjq
	 0gdWx3I0o0LnTHuE7GjVx44mXDIXX3ru9cRwJU4Idgw8kyE+IZohXZmPAOLVAoTi0yFIt
	 rv8hLtQALs5LtCp+cVK+15itqgJsCzpnmGd3qTcI+ty3fNGMj6VjrG1b+uPZ6xsoqW5fD
	 HmVo+NzglcfO+GkuTaY7XU73ex0V5sHVZa7TPB5DvmAyrBYeNLc6AKDQx28WCGhraPcsx
	 pnsOiFevsB4G1Rh8z5cYHA/ZKRasHvILkrz37YhXfzEYvEPxYbuYGImKl/Y/QGKd6FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096580;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=kL06f/X8F0pCUsRpt4OdaQK/VJzX2vhlrvqULYx75ac=;
	b=dkbfSOUpAkO9qJ7o4seUEd6uiDAsr5x0KJ8RT/qgPq8SgBwormTo+YyXbRRSJgh2ovcQ
	 C/w1JMK4+jW2a0mhnRlj4lRLT7Oikryx6ZI3BTOqKqyd+Jgh5RpRtyp68G4i07/ez7tQZ
	 ZrGRyP+hk6aqTWOAKsomkd9e/DvUVOWRoI4jyFVNlTJimpKddcGLhQ0UYKXlb6zzewAoc
	 CJqOED/ABb+C0zT9WICWvruqeYEOc8H4sT7UrJIKsGVN/0qUvMu0D8RKKb4IKndHDGhCR
	 ohftO3A+JShYHIz/n9VIR2m9cUjshPihokBqExJFc/UL+10Q39m1gygsSIYDFVfn7+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cdM61rUf;
	arc=none smtp.remote-ip=91.218.175.26
Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA4606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32EA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cdM61rUf
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=it30w/qv5FXVyLwZWDrrsl536DanKovgZRDzj670pbM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096578; v=1; x=1795701378;
 b=cdM61rUfgxNt30nCABWg2jPLanVCcy6zcRxSgx09/CzkgCbi938dfep8YrEVPnve5B0B+lxl
 2OjabDBP0uCCm1O8RSHAc6O+OcIDgoxNFWgFFmz44xDoMKgvH9DsGSAiPg59vnq5rOTHIgLPA/D
 fcfD8qorZ8AbRxVKmZNCS/90=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e71a594a63f1d374;
	Thu, 19 Nov 2026 13:56:18 +0000
X-Mizu-Trace-ID: e71a594a63f1d374
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 19 Nov 2026 21:55:20 +0800
Subject: [PATCH net-next v4 4/5] selftests: seg6: explicit cleanup for SRv6
 End PSP test
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
Message-Id: <20261119-srv6_flavors_endx-v4-4-284cdb484eee@kylinos.cn>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
In-Reply-To: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

The End PSP tests install policy and localsid state but rely on the
global namespace teardown to remove it. That leaves flavor-specific
state behind once more tests share this script.

Use the defer helper to remove the configurations installed for the
PSP tests:

  * cafe::1, cafe::1:e9, cafe::2, cafe::2:e9 routes and proxy neighs
    on rt1, rt2, and the cafe::1:e9, cafe::2:e9 addresses on the
    hosts' loopback
  * fcbb:0:x0e9::/48 End next-csid,psp policies on rt 1,2,3,4
  * fcff:x::0ef1 End psp policies on rt 1,2,4

After the change, we can wrap the whole end test with test_end_flv()
and run it separately.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 29 ++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 250de54d8bfa..9d6b7de648da 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -763,6 +763,8 @@ setup_rt_endpoint()
 		add "${sid}" table "${LOCALSID_TABLE_ID}" \
 		encap seg6local action ${behavior_cfg} \
 		dev "${DUMMY_DEVNAME}"
+	defer ip -netns "${nsname}" -6 route \
+		del "${sid}" table "${LOCALSID_TABLE_ID}"
 }
 
 # Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
@@ -865,10 +867,15 @@ __setup_rt_policy()
 		add "${IPv6_HS_NETWORK}::${dst}" \
 		encap seg6 mode inline segs "${policy}" \
 		dev "${DUMMY_DEVNAME}"
+	defer ip -netns "${in_nsname}" -6 route \
+		del "${IPv6_HS_NETWORK}::${dst}"
 
 	ip -netns "${in_nsname}" -6 neigh \
 		add proxy "${IPv6_HS_NETWORK}::${dst}" \
 		dev "${RT2HS_DEVNAME}"
+	defer ip -netns "${in_nsname}" -6 neigh \
+		del proxy "${IPv6_HS_NETWORK}::${dst}" \
+		dev "${RT2HS_DEVNAME}"
 }
 
 # see __setup_rt_policy
@@ -929,10 +936,12 @@ setup_hs_lo_addr()
 	addr="${IPv6_HS_NETWORK}::${hs}:${suffix}"
 
 	ip -netns "${hsname}" addr add "${addr}/128" dev lo nodad
+	defer ip -netns "${hsname}" addr del "${addr}/128" dev lo nodad
 
 	ip -netns "${rtname}" -6 route \
 		add "${addr}" \
 		via "${IPv6_HS_NETWORK}::${hs}" dev "${RT2HS_DEVNAME}"
+	defer ip -netns "${rtname}" -6 route del "${addr}"
 }
 
 setup()
@@ -1412,6 +1421,18 @@ test_dummy_dev_or_ksft_skip()
 	ip netns del "${test_netns}"
 }
 
+test_end_flv()
+{
+	defer_scope_push
+	set -e
+	setup_end_flv_psp
+	set +e
+	host_srv6_end_flv_psp_tests
+	host_srv6_end_flv_next_csid_psp_tests
+	host_srv6_end_flv_consumed_srh_tests
+	defer_scope_pop
+}
+
 if [ "$(id -u)" -ne 0 ]; then
 	echo "SKIP: Need root privileges"
 	exit "${ksft_skip}"
@@ -1443,11 +1464,5 @@ set +e
 router_tests
 host2gateway_tests
 
-set -e
-setup_end_flv_psp
-set +e
-host_srv6_end_flv_psp_tests
-host_srv6_end_flv_next_csid_psp_tests
-host_srv6_end_flv_consumed_srh_tests
-
+test_end_flv
 print_log_test_results

-- 
2.56.0

