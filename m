Received: from outbound.st.icloud.com (p-east2-cluster5-host10-snip4-10.eps.apple.com [57.103.79.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F74311C32
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775408050; cv=none; b=qObRvVdpcT+oT3oHXak5UKMBtswQHax7cbtYkYIkSTEnl2ZWjNEfl6Ermt29xfYiLtcA9YKAVRxsww0Plbcb9Gv4volqzF7m4qMDfjuHhVrt+Z7onzy3EPwBQEgevnGcvdsRfFjNDMrUy/bJetPrqOt7FBQ2EUd24p9Ehew4VZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775408050; c=relaxed/simple;
	bh=qDDMBivbPcAFOPeT6eY3oxNcMchO1/ahOVBlqetBVQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MtPFxips8W+S2T4p/aN9Uk/oxLQzSNOZk5uTCQ34F51/RT0j6ZviUPYXVZks2yOOBHNKGn6i4bX2Ec6EpWdv1I4QXSYXwpLKUtK7stXStrFRh4qLzi5NFyNG/ShgzOnQrYTaFGcXhIovD2RQshFDtuuUG2eumFMYUWS4PD2LJBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=nIwAzNnK reason="key not found in DNS"; arc=none smtp.client-ip=57.103.79.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="nIwAzNnK"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPS id 6FE591800BBD;
	Sun, 05 Apr 2026 16:54:06 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1775408048; x=1778000048; bh=P++qanB99WVd4a1fk5cwJruX1uubGSks4JWteV9qK9E=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=nIwAzNnKbbcBZS2UAzfv04RaJtRMSx+3p6SQpKIMt4XuSNWS8+dBURwF5rSCkcmiriAbLxvwzeoS5nCvfI0aWy+2hly14g57CiqsN/mCGuqH4682uYZqXmxrlIOg0UCEbrkFpZkSxVtqVVFIgMYCHvLAszT2Yq/k0rBxKq4yhT6n9bO8cMDt3wyD03v9LQV9kl4UByFNQn3ZyOGLAUMolfUMSNu7XjydFukw9T6jmXb3uLvBa7XMuwQ6X++EVlPX6u4LWf7Z5jw0CQLpFion2cGw6VseJhKsin9o4RsOuKu1E4kiTFIDUeT30E3kspVfNSMiPEOFOQAGSmLBJJiJMA==
mail-alias-created-date: 1719758601013
Received: from desktop.y-koj.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPSA id 5AAB21800D31;
	Sun, 05 Apr 2026 16:52:24 +0000 (UTC)
From: Yohei Kojima <yk@y-koj.net>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Yohei Kojima <yk@y-koj.net>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] selftests/namespace: fix unintentional skip in ns_active_ref_test.c
Date: Mon,  6 Apr 2026 01:50:38 +0900
Message-ID: <0b2a5dba0b5ce5a4e144237b9f365fe8fa971871.1775404451.git.yk@y-koj.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1775404451.git.yk@y-koj.net>
References: <cover.1775404451.git.yk@y-koj.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TdN8Dc0ZLaoMmPwcZ_X839qEZ-FwmHnC
X-Proofpoint-GUID: TdN8Dc0ZLaoMmPwcZ_X839qEZ-FwmHnC
X-Authority-Info-Out: v=2.4 cv=BLG+bVQG c=1 sm=1 tr=0 ts=69d293ae
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jnl5ZKOAAAAA:8 a=jO6NblF5zQOfC-Z75CIA:9 a=RNrZ5ZR47oNZP8zBN2PD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE3NiBTYWx0ZWRfX1AlbpBI6rXYA
 9lKQ0kg5+ioNd8+4LkFCAJd+y/ZPn2UKt2ouJoxqr63fIj3f/G/BEKqHVrPlQqUvkDBG7a1qFjN
 OcRW9LWBjIqxyW3yWh3CxblKLufr+AIYdYXX265h2oDwVBfowt1LTcoDdMc4EDfydm+0eg57M6Q
 luaSQ1GCyikPV9beUC5mpQZ2zrGRAnADwen1kLs8rr56ZjCiloWaQG1MpB3pjaf55Hh7ugbpuK2
 ToWnR3oF+KeCuLpoF0BMfk/jvxSzqOvzZ1LpzkqmHs6f3n3+gXecG5hCURbQwVfWHX2bk2KIhye
 hK5qMco0WXsBc/EnTH5y/s7tNwftwev/paZU/iYTxnHznAFIfh2u8K6o2EpAKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1030 mlxlogscore=744 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2604050176

Fix ESTALE from open_by_handle_at() in ns_multiple_children_same_parent
when child processes exit before the parent run it.

Signed-off-by: Yohei Kojima <yk@y-koj.net>
---
 tools/testing/selftests/namespaces/ns_active_ref_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/namespaces/ns_active_ref_test.c b/tools/testing/selftests/namespaces/ns_active_ref_test.c
index 093268f0efaa..29d96a6e8100 100644
--- a/tools/testing/selftests/namespaces/ns_active_ref_test.c
+++ b/tools/testing/selftests/namespaces/ns_active_ref_test.c
@@ -1193,6 +1193,10 @@ TEST(ns_multiple_children_same_parent)
 		write(pipefd[1], &c1_id, sizeof(c1_id));
 		write(pipefd[1], &c2_id, sizeof(c2_id));
 		close(pipefd[1]);
+
+		/* give parent a time to run open_by_handle_at() */
+		usleep(10000);
+
 		exit(0);
 	}
 
-- 
2.52.0

