Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475757;
	b=YwPKCcZ0KCFY8ke9ZqWug/7H2Mnot2gY9hVP3GSgA0Qenw6jU5RvPVXJsOfUUU3ERaks
	 yzZmltJGlUU8U9tHda6C883Dk3CH0SSOYl0Jf8BmaKcpKsvUqkWY7ia60eF6kCsfQICPo
	 +bAmnYxy57U7gxoSL35KiQjzvnsEwZyklWUcw0TuQCv8i80ykIpbIyucda4SyPD5GhI1X
	 rN4YAyhzv6cocrC0QwUUvWr4TwdUUOVwV/+xcCc+OVUkAVXwx6cXzkCi7ZsyNwY9IoKPR
	 I93lIsbCRm0mM0hWBM9ELvLe0lQeL2+fzFqIuUZqwMtEtqnBawBZaQx75WDTbhOolKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475757;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=VId0h4p/u77ggNkwAFm/J3Zsd5AjX5cfSMD9gYIbFWs=;
	b=GSMpIAfkg3Hg2JEGhQB/zgGw5nCnNbe5JMd1nUw4YpBpEut0v+Yre/PMu2QHuuKpxEVm
	 DHRUnfSP+sqIYS3rsUQVSspePV7aZT4Jls19qRbIt8eWwJ10+O2dj+guTbJEpn7TzZPSZ
	 tY2RLrjPJTDWgU6bqHmUOUA2cHuG8+n0nfYoToTCL3zJgEFnjISN+S+CjX2bm/JB4+ykd
	 xbgQXYEB+1usJpV2RvwPvdFy/zpkys5tUHDdteuClnijY0e1chVPRP09AheiwvIE6JCO9
	 ADg38c7HIptOp7U6Sefi5j8t9ApUSnhcmn74tEyps2eBqdcdiiuHV2bMHuBESzVLB6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pMlOrmfj;
	arc=none smtp.remote-ip=91.218.175.209
Received: from mta0.migadu.com (out-209.mta0.migadu.com [91.218.175.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BE7606A332
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 09:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BE7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pMlOrmfj
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O//EwO8yzWEhB1NbD8MSRBoGsEgVHeqA1DUOjnhAai0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794475755; v=1; x=1795080555;
 b=pMlOrmfjPSLVb6uJqNJcu6hIt2SB4krIriHqO6n6AWAL85Uv4RjgmCyK9hI0FTRPxaBMWoDJ
 /e76Rmbt2aXzwlYaNwmSXB4YH2nN+8zdLruQyuMJUdryZR4NJjemoziZxtjYJ/TvPrsKFkxiGrw
 RVPgRRFuFjPL6u+zdQHIMK28=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 0c2a5ac31d33393e;
	Thu, 12 Nov 2026 09:29:15 +0000
X-Mizu-Trace-ID: 0c2a5ac31d33393e
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 12 Nov 2026 17:27:59 +0800
Subject: [PATCH net-next v3 4/5] selftest: seg6: explicit cleanup for SRv6
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
Message-Id: <20261112-srv6_flavors_endx-v3-4-c9177bbbd965@kylinos.cn>
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

The End PSP tests install policy and localsid state but rely on the
global namespace teardown to remove it. That leaves flavor-specific
state behind once more tests share this script.

Use defer and defer_scopes_cleanup to remove the PSP specified
configurations. i.e.

  * cafe::1, cafe::1:e9, cafe::2, cafe::2:e9 route and proxy on rt1, rt2
  * fcbb:0::x0e9 End next-csid,psp policies on rt 1,2,3,4
  * fcff:x::0ef1 End psp polices on rt 1,2,4

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 tools/testing/selftests/net/srv6_end_flavors_test.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 0ed5bfe99029..374b43661c28 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -759,6 +759,8 @@ setup_rt_endpoint()
 		add "${sid}" table "${LOCALSID_TABLE_ID}" \
 		encap seg6local action ${behavior_cfg} \
 		dev "${DUMMY_DEVNAME}"
+	defer ip -netns "${nsname}" -6 route \
+		del "${sid}" table "${LOCALSID_TABLE_ID}"
 }
 
 # Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
@@ -801,10 +803,16 @@ setup_rt_host_proxy()
 	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
 		proxy "${IPv6_HS_NETWORK}::${hs}" \
 		dev "${RT2HS_DEVNAME}"
+	defer ip -netns "$(get_rtname "${rt}")" -6 neigh del \
+		proxy "${IPv6_HS_NETWORK}::${hs}" \
+		dev "${RT2HS_DEVNAME}"
 
 	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
 		proxy "${IPv6_HS_NETWORK}::${hs}:${func}" \
 		dev "${RT2HS_DEVNAME}"
+	defer ip -netns "$(get_rtname "${rt}")" -6 neigh del \
+		proxy "${IPv6_HS_NETWORK}::${hs}:${func}" \
+		dev "${RT2HS_DEVNAME}"
 }
 
 # This helper function builds and installs the SID List (i.e. SRv6 Policy)
@@ -882,6 +890,8 @@ __setup_rt_policy()
 		add "${IPv6_HS_NETWORK}::${dst}" \
 		encap seg6 mode inline segs "${policy}" \
 		dev "${DUMMY_DEVNAME}"
+	defer ip -netns "${in_nsname}" -6 route \
+		del "${IPv6_HS_NETWORK}::${dst}"
 }
 
 # see __setup_rt_policy
@@ -1460,11 +1470,13 @@ set +e
 router_tests
 host2gateway_tests
 
+defer_scope_push
 set -e
 setup_end_flv_psp
 set +e
 host_srv6_end_flv_psp_tests
 host_srv6_end_flv_next_csid_psp_tests
 host_srv6_end_flv_consumed_srh_tests
+defer_scope_pop
 
 print_log_test_results

-- 
2.56.0

