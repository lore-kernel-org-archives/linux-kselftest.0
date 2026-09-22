Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75471522EE3
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067335; cv=none; b=Ji2jsWdoi1f6gipJ7kaSwJhx0UVijT6KaqjyME0xCWruFGukbVaeXUrZn+Upx58X2psft56RSM5xl4h8zAlWTYkqGja27bHZ8Ng1I38oImDqPdXWgLwPV1opqfG+86FIGEplZIzJ5oN5YGKRh3nZxW5SNRv6bM7X83f8kXEC8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067335; c=relaxed/simple;
	bh=RVa+QN9BbYwwQIvQ58JLG7DM/SEnz2K6A3lncWeiB2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIJGGJy5lrGR8Bz6RcTPb02chuWNspMJqgd2ZFfHhZKEj0zGAcm1CYdUqS/pQ+PHGk7LXrhW2vhXdZcT2ddNQ6nnyeCl+8VxxFyHYRWEsT4IR31ChCGrasWrerNpy+Sg+P479sYftBJf0L6g6skqCJanOwuysLPFaSHq8Y4z1I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dFe0/2/C; arc=none smtp.client-ip=91.218.175.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dFe0/2/C"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RVa+QN9BbYwwQIvQ58JLG7DM/SEnz2K6A3lncWeiB2g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790067331; v=1; x=1790672131;
 b=dFe0/2/CFH0yXlkfaeh/FVz3DRc6CN9Dq/+VE+isNzW/EeJH53C2jrCqc7kVtgt4qLxCOOeT
 oXuITShSM23JcsxKTWDHL4425F3USCJ221ykV2AOBkQi1Lupiq0Miqb96UY66LSG6d35j+DbgWt
 J3jNasQMEde8s9fAO7RktNFw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 96a8b57497de07d5;
	Tue, 22 Sep 2026 08:55:14 +0000
X-Mizu-Trace-ID: 96a8b57497de07d5
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 22 Sep 2026 16:54:46 +0800
Subject: [PATCH net-next 4/5] selftest: seg6: add explicit cleanup for SRv6
 End PSP test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-srv6_flavors_endx-v1-4-4d01c05c47b7@kylinos.cn>
References: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
In-Reply-To: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
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

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 70 ++++++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 56a1c5f865a7..52731983b4cc 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -564,10 +564,6 @@ __setup_rt_policy()
 		add "${IPv6_HS_NETWORK}::${dst}" \
 		encap seg6 mode inline segs "${policy}" \
 		dev "${DUMMY_DEVNAME}"
-
-	ip -netns "${in_nsname}" -6 neigh \
-		add proxy "${IPv6_HS_NETWORK}::${dst}" \
-		dev "${RT2HS_DEVNAME}"
 }
 
 # see __setup_rt_policy
@@ -576,6 +572,56 @@ setup_rt_policy_ipv6()
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
+		if ip -netns "${rt_nsname}" -6 route get "${fullsid}" &>/dev/null; then
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
@@ -645,6 +691,14 @@ setup()
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
@@ -669,6 +723,12 @@ setup_end_flv_psp()
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
@@ -771,6 +831,8 @@ host_srv6_end_flv_psp_tests()
 
 	check_and_log_hs_connectivity 1 2
 	check_and_log_hs_connectivity 2 1
+
+	cleanup_end_flv_psp
 }
 
 test_iproute2_supp_or_ksft_skip()

-- 
2.55.0

