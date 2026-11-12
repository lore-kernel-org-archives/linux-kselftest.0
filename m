Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475744;
	b=FEjxnPMIKXSFAJa7ePleT82NCMOZBgLSTQIOuC/WdS0wfNfrcWAf4MlaaEcrLSgEONvo
	 xeZO6Mvk9OXaaLEw/MFDoTiyfKEAW+Gh5dimQHsN2uHBqa+WzkQMKwW5y95XS9oq4fQxG
	 HfmekrV85PWqNL55UDzyZGRaaf2SbTl9pkGwebokTzTlyCJiQXpIiJi09KzP8/m3Vg52w
	 U2bGFlhyMxMGPp+/j1dVoV62ka6cthg/Xi+ZpWB3hIwrLnqd+vSpOM2U8eJBSzK1DA4YY
	 St0+lfQeELeulbgIphXwTqRcwZUlzMZkgecKkrCu/TBVsKguUGHmFtovueKuSCnqG4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475744;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=jNXpiUp3oDdDyxeEWlLjs1m4mGHUrIyXQcyGp9qGQuo=;
	b=oRqAc/41qvu6qed6lerN3vOTpLnQ79qUFAbleTslbhgBCliiIBrnL6w9vbQ88T7+3vqC
	 Vvd3fLHT2TWsckcvHhdZMOsECtGyoukNbA/cycGatqUbtsXUknOaZrrQOyF7ld/+58TxL
	 wgV/tJUquvf08kwb8oEFDekLLyS/nU5w1+kfszPk72LSLQ4bSvA10S1GueBKoMg3Fq0Z/
	 mc2qSIXhsHEon1sCzaKdoGfdkRJkevqkNPOyAoXCzH6cv0VOyKTmd55jgY5Ef4xDHJC9Z
	 Kj324p1sovBKIEw6pYMtBWLyp22He2msxHVcOLEuolUIODnhpDBCEy7xxY1R03Du/+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Rd5qOkgG;
	arc=none smtp.remote-ip=95.215.58.183
Received: from mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFD0606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 09:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFD0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Rd5qOkgG
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/+WuwrSksAjzAHCCytpm8Y2IGIJxlPeKxsMgUDhSC6o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794475742; v=1; x=1795080542;
 b=Rd5qOkgGN2Jy58oGC2b5UqSnml46mVBMMf23WeJzKy+NF34DyTrDLdxWMwBz7hnG19WUXX5r
 9TDfz3Fl+n/KjOKQXUNJdGqF+Ox6yclHlS73+kKPIeT4ep+1E/9YwqVXgDiePNK0hMmoGM4ldG+
 yWhWhKAbenlVSYXjBwRydgj8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id b94977e37de25a9a;
	Thu, 12 Nov 2026 09:29:01 +0000
X-Mizu-Trace-ID: b94977e37de25a9a
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 12 Nov 2026 17:27:58 +0800
Subject: [PATCH net-next v3 3/5] selftests: seg6: move SRv6 End PSP setup
 into its own helper
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
Message-Id: <20261112-srv6_flavors_endx-v3-3-c9177bbbd965@kylinos.cn>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
In-Reply-To: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
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

setup() installs both the base topology and the End PSP policies. That
couples general test setup with one specific flavor scenario and makes
it hard to add further flavor cases cleanly.

Extract the End PSP policy setup into setup_end_flv_psp() so flavor
tests can set up and later tear down independently (the matching
cleanup arrives in a following patch).

Run the block under set -e so a setup failure is treated as an error
instead of falling through into the connectivity checks. When deciding
to report the run as skipped, keep any failure already recorded by a
test, so a real failure is not converted into a skip.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 56 +++++++++++++++++-----
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 157baa8ecb0b..0ed5bfe99029 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -488,8 +488,9 @@ cleanup()
 
 	# check whether the setup phase was completed successfully or not. In
 	# case of an error during the setup phase of the testing environment,
-	# the selftest is considered as "skipped".
-	if [ "${SETUP_ERR}" -ne 0 ]; then
+	# the selftest is considered as "skipped", unless a test has already
+	# recorded a failure.
+	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then
 		echo "SKIP: Setting up the testing environment failed"
 		exit "${ksft_skip}"
 	fi
@@ -785,6 +786,27 @@ setup_rt_endpoints()
 	done
 }
 
+# setup proxy on route entries for hosts
+# args:
+#  $1 - ingress router that enforces the SRv6 Policy
+#  $2 - destination host whose addresses are proxied
+#  $3 - suffix of the address on the loopback of the destination host
+#       (i.e. cafe::<host>:<suffix>)
+setup_rt_host_proxy()
+{
+	local rt=$1
+	local hs=$2
+	local func=$3
+
+	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
+		proxy "${IPv6_HS_NETWORK}::${hs}" \
+		dev "${RT2HS_DEVNAME}"
+
+	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
+		proxy "${IPv6_HS_NETWORK}::${hs}:${func}" \
+		dev "${RT2HS_DEVNAME}"
+}
+
 # This helper function builds and installs the SID List (i.e. SRv6 Policy)
 # to be applied on incoming packets at the ingress node. Moreover, it
 # configures the SRv6 nodes specified in the SID List to process the traffic
@@ -860,10 +882,6 @@ __setup_rt_policy()
 		add "${IPv6_HS_NETWORK}::${dst}" \
 		encap seg6 mode inline segs "${policy}" \
 		dev "${DUMMY_DEVNAME}"
-
-	ip -netns "${in_nsname}" -6 neigh \
-		add proxy "${IPv6_HS_NETWORK}::${dst}" \
-		dev "${RT2HS_DEVNAME}"
 }
 
 # see __setup_rt_policy
@@ -962,17 +980,29 @@ setup()
 	setup_hs 1 1
 	setup_hs 2 2
 
-	# set up the loopback addresses of the hosts used by the Policies (i.c)
-	# and (i.d).
-	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
-	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
-
 	# set up default SRv6 Endpoints (i.e. SRv6 End behavior)
 	setup_rt_local_sids 1 "2 3 4"
 	setup_rt_local_sids 2 "1 3 4"
 	setup_rt_local_sids 3 "1 2 4"
 	setup_rt_local_sids 4 "1 2 3"
 
+	# testing environment was set up successfully
+	SETUP_ERR=0
+}
+
+setup_end_flv_psp()
+{
+	SETUP_ERR=1
+
+	# set up the loopback addresses of the hosts used by the Policies (i.c)
+	# and (i.d).
+	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
+	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
+
+	# setup proxy on route entries for hosts
+	setup_rt_host_proxy 1 2 "${END_CSID_PSP_FUNC}"
+	setup_rt_host_proxy 2 1 "${END_CSID_PSP_FUNC}"
+
 	# set up SRv6 policies
 	# create a connection between hosts hs-1 and hs-2.
 	# The path between hs-1 and hs-2 traverses SRv6 aware routers.
@@ -1429,6 +1459,10 @@ set +e
 
 router_tests
 host2gateway_tests
+
+set -e
+setup_end_flv_psp
+set +e
 host_srv6_end_flv_psp_tests
 host_srv6_end_flv_next_csid_psp_tests
 host_srv6_end_flv_consumed_srh_tests

-- 
2.56.0

