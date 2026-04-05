Received: from outbound.st.icloud.com (p-east2-cluster5-host9-snip4-4.eps.apple.com [57.103.79.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7A2F6904
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775408047; cv=none; b=pIIvqgw3ynqvw1vygL9B+hPyHzkUSyn2AAz9puIxUEbzxXGichg3wso9Yvgzgvmtio2p6Wg/ctUEAawLUz2tJsp33F3Vi8D8BJ4sJ2eYNPzRttkxQWqfhE+2srog+qmU4uZNfL+mejEg1Uc+fTQwv+JQFoeLOHQBQ/pG5ilieh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775408047; c=relaxed/simple;
	bh=V+f/p6QzvKhmCvnCML+j1mBxAkUk1payovBcQk4Scyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8kZgYIBJEec0YFn70twzQxRf4Btl1/AR7El1VIVGS3aBpqrbuYuR0ioMrPbU7rv06iqUKpwSHiFIC0QARvb2IQTaY7Unj1hM9z4M11oP2ubES9ZLkAYrEvYnAj4sP/9HuUI6KIw7vfhHqc+GxZrTN50ZlhR9B26gGVKRjT8oTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=BAVFrDxP reason="key not found in DNS"; arc=none smtp.client-ip=57.103.79.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="BAVFrDxP"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPS id 947F91800BB1;
	Sun, 05 Apr 2026 16:54:02 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1775408045; x=1778000045; bh=uOPj5kIodIgoKiM9QuSEnFQRR8ZiDFL2f0iafOmBcbY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=BAVFrDxPZ+O77AclS7JjWCExcNYmchUYZp/Yes4pR+s3APt9sdqy2C4qJjT5s8TIJBBWgt+liOu9q6MbG7e6Et+57HP6gAdOm0Ych4MxfFW+KX17CNNCBzRbXVMqHi5YHT7oKTXhFZSTcu5XEiN9MMiNKWMEM8kfcqvbthBOe5NU+cJCaEZixoJko4F5fhacfalP/Fn2ZoYhHRZ7MnvTSlCcOnjE7KuMAt88W/9P/CmmqRncoyl/Fpg7AcSaIDqlG3UxqX/ZNzywcxjQD8UBfihFcUgUeZ53C70TrbSS5FiFhCsRMxUpUo0cLjnnvUX6zm2QgBMTUMDFV1L8D3wG4A==
mail-alias-created-date: 1719758601013
Received: from desktop.y-koj.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPSA id A6AC71800D14;
	Sun, 05 Apr 2026 16:52:14 +0000 (UTC)
From: Yohei Kojima <yk@y-koj.net>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Yohei Kojima <yk@y-koj.net>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] selftests/namespace: fix selftest hang-up caused by zombie processes
Date: Mon,  6 Apr 2026 01:50:37 +0900
Message-ID: <7b2c83e0fe0e17bd11a10135c9d9d169a97d0ea7.1775404451.git.yk@y-koj.net>
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
X-Proofpoint-ORIG-GUID: NdXQLXhoE_vu8isxnIxUyjFSZDUeESPG
X-Proofpoint-GUID: NdXQLXhoE_vu8isxnIxUyjFSZDUeESPG
X-Authority-Info-Out: v=2.4 cv=BLG+bVQG c=1 sm=1 tr=0 ts=69d293ab
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jnl5ZKOAAAAA:8 a=AYMzduBVUvBKa7S8i9gA:9 a=RNrZ5ZR47oNZP8zBN2PD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE3NiBTYWx0ZWRfX8lq0dhgpRtju
 +kn5K10xip19jo2IwHeTQDamkK0l1oeLdQGP9/tmiOoyXWcz6mmD3IwgKGYTL/yZtYFKaiU1J4z
 j1nV0E7lzaJw50DsUGDHwEQn/MqgeBtTTvqJOYoL4fshNgPczGohpTtFBRB+TY1cCdcDEPmqij4
 YY3rNoyD61wPAAOs9C3aMB+AaQsqbFKAx7E4140nV9j/ENltKv+L8Tc1JOgtaSwjqlPVI1yCHwU
 snbbeC3cxe89Snd3VITCdmZZDMnmwQrRbWnNFUG7Sz5IGxD+wdWeR5Xlx8z33GV+ytESMjCoYP/
 qrC0kskI+NxjEpS+51iIDcxpyLTjIT2gdu7pweo+ZAn5XJEpI5Fiw/KoNNfpXg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1030 mlxlogscore=838 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2604050176

Fix zombie grandchild processes spawned by timens_separate and
pidns_separate tests in nsid_test.c. This also prevents kselftest from
hanging up after running these tests.

Signed-off-by: Yohei Kojima <yk@y-koj.net>
---
 tools/testing/selftests/namespaces/nsid_test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/namespaces/nsid_test.c b/tools/testing/selftests/namespaces/nsid_test.c
index b4a14c6693a5..1e2669372b7b 100644
--- a/tools/testing/selftests/namespaces/nsid_test.c
+++ b/tools/testing/selftests/namespaces/nsid_test.c
@@ -25,10 +25,12 @@
 /* Fixture for tests that create child processes */
 FIXTURE(nsid) {
 	pid_t child_pid;
+	pid_t grandchild_pid;
 };
 
 FIXTURE_SETUP(nsid) {
 	self->child_pid = 0;
+	self->grandchild_pid = 0;
 }
 
 FIXTURE_TEARDOWN(nsid) {
@@ -37,6 +39,10 @@ FIXTURE_TEARDOWN(nsid) {
 		kill(self->child_pid, SIGKILL);
 		waitpid(self->child_pid, NULL, 0);
 	}
+	if (self->grandchild_pid > 0) {
+		kill(self->grandchild_pid, SIGKILL);
+		waitpid(self->grandchild_pid, NULL, 0);
+	}
 }
 
 TEST(nsid_mntns_basic)
@@ -677,6 +683,7 @@ TEST_F(nsid, timens_separate)
 	pid_t grandchild_pid;
 	ASSERT_EQ(read(pipefd[0], &grandchild_pid, sizeof(grandchild_pid)), sizeof(grandchild_pid));
 	close(pipefd[0]);
+	self->grandchild_pid = grandchild_pid;
 
 	/* Open grandchild's time namespace */
 	char path[256];
@@ -798,6 +805,7 @@ TEST_F(nsid, pidns_separate)
 	pid_t grandchild_pid;
 	ASSERT_EQ(read(pipefd[0], &grandchild_pid, sizeof(grandchild_pid)), sizeof(grandchild_pid));
 	close(pipefd[0]);
+	self->grandchild_pid = grandchild_pid;
 
 	/* Open grandchild's PID namespace */
 	char path[256];
-- 
2.52.0

