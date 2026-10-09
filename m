Received: from mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3FA4A5C44
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539967; cv=none; b=KV8dTNbvEL4kF5+dqGisW9SPALZKoShUqGqFTNuOE7vtbIoRqvnjpuBzfAab+aDMhBVQGDKFf/fTG170M8kac7A4XZW+Th0dxgrN9co+U+dJUyEvZ4yL9fhGmSLpeqbQBG62CrZN30XW5u0LHWoaGxHtlY6qK6pJsqwepH5kXYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539967; c=relaxed/simple;
	bh=OgRBxhHIdZVljLtCxlL7rR5VG5nzroooYpo/aGlA4ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCjukQF675gI95zO9jEwhoiup9yXUx2wZ54VvEGOMtONmC8IErT+MvOD0FfsktF+uHiO3UJd1qcR5Ns8YQK9mkSkoCkYB272pUxe51R/6PkgEbzxzQIwsMA0PY0bWDZ6jinukaQMTyH5XNTIBDj63dyVVMg5NqHRJg1qZhSzBas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VociGdn2; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VociGdn2"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OgRBxhHIdZVljLtCxlL7rR5VG5nzroooYpo/aGlA4ZE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791539963; v=1; x=1792144763;
 b=VociGdn2GH3vcHR5zhjlqakL0HToMYa4qeJDGAQkzQ5Ks/Sqcq3MRUeHsE6m8HB9jXn8zs7v
 LaH8QZa4FOlxdlMJuwScpvxYCCE6tbOPII4gVmxRn1T+VIhCq3MV4iXHOMyTXdGnXNJxWpCJl5N
 RyTHSWMwqB50MIsngCrnHkBA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 212f027742c2f1b0;
	Fri, 09 Oct 2026 09:59:23 +0000
X-Mizu-Trace-ID: 212f027742c2f1b0
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Fri, 09 Oct 2026 17:58:40 +0800
Subject: [PATCH net-next v2 4/5] selftest: seg6: add explicit cleanup for
 SRv6 End PSP test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-srv6_flavors_endx-v2-4-56ac7f838f41@kylinos.cn>
References: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
In-Reply-To: <20261009-srv6_flavors_endx-v2-0-56ac7f838f41@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

The PSP test installs policy and route state, but relies on global
cleanup to tear it down. That can leave flavor-specific state around
when later tests are added to the same script.

Add cleanup_end_flv_psp() and run it at the end of
host_srv6_end_flv_psp_tests().

The host proxies are needed by all PSP testing. So move it to common
setup() and no need to delete.

The `set +e` is not added in the cleanup phase as del cmd usually doesn't
fail. And even it failed, we can catch it on setup phase.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 71 ++++++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 5ebd6a0344d6..a57e92541a04 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -547,10 +547,6 @@ __setup_rt_policy()
 		add "${IPv6_HS_NETWORK}::${dst}" \
 		encap seg6 mode inline segs "${policy}" \
 		dev "${DUMMY_DEVNAME}"
-
-	ip -netns "${in_nsname}" -6 neigh \
-		add proxy "${IPv6_HS_NETWORK}::${dst}" \
-		dev "${RT2HS_DEVNAME}"
 }
 
 # see __setup_rt_policy
@@ -559,6 +555,57 @@ setup_rt_policy_ipv6()
 	__setup_rt_policy "$1" "$2" "$3"
 }
 
+cleanup_rt_policy_ipv6()
+{
+	local dst="$1"
+	local encap_rt="$2"
+	local policy_rts="$3"
+	local in_nsname
+	local rt_nsname
+	local function
+	local fullsid
+	local op_type
+	local node
+	local n
+
+	in_nsname="$(get_rtname "${encap_rt}")"
+
+	for n in ${policy_rts}; do
+		node="$(__get_srv6_rtcfg_id "${n}")"
+		op_type="$(__get_srv6_rtcfg_op "${n}")"
+		rt_nsname="$(get_rtname "${node}")"
+
+		case "${op_type}" in
+		"noflv")
+			function="${END_FUNC}"
+			;;
+
+		"psp")
+			function="${END_PSP_FUNC}"
+			;;
+
+		*)
+			break
+			;;
+		esac
+
+		fullsid="${LOCATOR_SERVICE}:${node}::${function}"
+
+		# Remove SRv6 Endpoint behavior for the selected router
+		# Skip noflv END_FUNC which is added in common setup.
+		if ! echo "${fullsid}" | grep -q "${END_FUNC}"; then
+			ip -netns "${rt_nsname}" -6 route \
+				del "${fullsid}" \
+				table "${LOCALSID_TABLE_ID}" \
+				dev "${DUMMY_DEVNAME}"
+		fi
+	done
+
+	# Remove SRv6 policy for incoming traffic sent by connected hosts
+	ip -netns "${in_nsname}" -6 route \
+		del "${IPv6_HS_NETWORK}::${dst}" dev "${DUMMY_DEVNAME}"
+}
+
 setup_hs()
 {
 	local hs="$1"
@@ -628,6 +675,14 @@ setup()
 	setup_rt_local_sids 3 "1 2 4"
 	setup_rt_local_sids 4 "1 2 3"
 
+	# setup proxy on route entries for hosts
+	ip -netns "$(get_rtname 1)" -6 neigh add \
+		proxy "${IPv6_HS_NETWORK}::2" \
+		dev "${RT2HS_DEVNAME}"
+	ip -netns "$(get_rtname 2)" -6 neigh add \
+		proxy "${IPv6_HS_NETWORK}::1" \
+		dev "${RT2HS_DEVNAME}"
+
 	# testing environment was set up successfully
 	SETUP_ERR=0
 }
@@ -652,6 +707,12 @@ setup_end_flv_psp()
 	setup_rt_policy_ipv6 1 2 "1:psp"
 }
 
+cleanup_end_flv_psp()
+{
+	cleanup_rt_policy_ipv6 2 1 "3:noflv 4:psp 2:psp"
+	cleanup_rt_policy_ipv6 1 2 "1:psp"
+}
+
 check_rt_connectivity()
 {
 	local rtsrc="$1"
@@ -754,6 +815,8 @@ host_srv6_end_flv_psp_tests()
 
 	check_and_log_hs_connectivity 1 2
 	check_and_log_hs_connectivity 2 1
+
+	cleanup_end_flv_psp
 }
 
 test_iproute2_supp_or_ksft_skip()

-- 
2.55.0

