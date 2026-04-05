Received: from outbound.st.icloud.com (p-east2-cluster5-host12-snip4-8.eps.apple.com [57.103.79.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCB2318BB5
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775408057; cv=none; b=FDgFRuk+a0084GKMIPhqqJ51REyslLs6Z6PR9nwwDq6RV9qv2K5QguYtdyRYAr2cXKHklmIAs4V5yHQYf7ukeE6M4tmNZ8PJ1jBFr53xYCnefX8TDSh4oNqWmImh1eWFKg28rmHOQdNlsrYY61CasU6X/853xa0dtI6Wp3glsrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775408057; c=relaxed/simple;
	bh=ikcCdo+WZM8RB3y5OCDr/km8u7w7Iz8WrIeo2sLnU+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+Lo7B9Al52LM/H7QCLvr7fliA88RwaYdeDzUEXeSYbk6HVN8Caqzfjhqaz2Q1Rcrk/YmLAJAvwJrin6ZGH6xGHAKLysu4JRLxpzcGdtDvKONc49/yQA+4x5fkssri6r2wFA9iBS2Kjo06N36NX1BeMjC6C+JjJx3B/qkSox3PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=CcHyp63S reason="key not found in DNS"; arc=none smtp.client-ip=57.103.79.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="CcHyp63S"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPS id A3C841800D11;
	Sun, 05 Apr 2026 16:54:10 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1775408052; x=1778000052; bh=Uw0z3wNlqUHZIJxWz0zqHyrheKABI/b7SXnMNZgabtk=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=CcHyp63Sn33A99RCrJkvqUekpg3bmuB7d21MDpLcU6QhOimpf4Ek0WfuOytxrDxggBHvZzt4mZTYwwn/C2bhzqeTXTEDlFrXXwObrWnmcKYvwdIHHYpdjzV2XE7QCpaSPJ0YgZNIShdN6Ifh0Cooifm0mJ+VXPwK6Vm2rNxUgguogcfy/Vudq7q4JBA2FhQgj9RWuyeg9eFZ/OZfcM/oQkmUmCvQvZ+CG9HBALiVGoPHfp93+1TpeglJnTKcGMIWmjcFIDVxYP7nG2KXJ5XBBsxvHX/RiQCr6bhDqXqD24eyXXGhNdGMu4iy6Xb4EXMXuE1b6L8Vjg23uz90NCpk7g==
mail-alias-created-date: 1719758601013
Received: from desktop.y-koj.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPSA id 5DA1D18000AC;
	Sun, 05 Apr 2026 16:52:32 +0000 (UTC)
From: Yohei Kojima <yk@y-koj.net>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Yohei Kojima <yk@y-koj.net>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] selftests/namespace: test spurious ENOENT bug in listns pagination
Date: Mon,  6 Apr 2026 01:50:40 +0900
Message-ID: <de6a63cf0135e29c2e114dc85ac3e46f1fabb32f.1775404451.git.yk@y-koj.net>
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
X-Proofpoint-ORIG-GUID: n4sppodIblwyg0Rj-85evoiZ1nyOrXa2
X-Proofpoint-GUID: n4sppodIblwyg0Rj-85evoiZ1nyOrXa2
X-Authority-Info-Out: v=2.4 cv=BLG+bVQG c=1 sm=1 tr=0 ts=69d293b3
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jnl5ZKOAAAAA:8 a=GaRdEwhpBMmz7FhzV_AA:9 a=RNrZ5ZR47oNZP8zBN2PD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE3NiBTYWx0ZWRfX009bN9fbaOZN
 dBR6t0oD/Xcbafua9qomnkyjL7yozM2A1Ye2a0Zpxw+GO57J8DcRSZHZEFiLsrUubTNMxujwfHB
 OBJuGde7hcUD2rRJOdXRAimubQgoQep+5Ny/ySFtB3oS+VmKSQEKYm4W/JAS60GdoReFo7xxNS8
 M4W137tzmEMxHfT5H/JXeJIbmsHqBkVdOO23xwgaXIilIhpIcghCZy0KG8Fieh2bN8pwKlnKVGd
 HArqMJqDDF5FHefTzUbCTB3xylx8Y975g2X8DYm4OKy3SD8jhQgoJuAwPORFAdXTIWUnh+PtJkx
 ZO2CAtZrH2+Rh83j4MTvFKg48XE+zYC0NOvo6L1fBLUAwdygEkkf+GTCtym/Pk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1030 mlxlogscore=896 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2604050176

Test spurious ENOENT which occurs when it tried to start pagination from
an inactivated or destroyed namespace. The new test is almost identical
to pagination_with_type_filter, except that it calls run_noisy_children()
which creates and lists namespaces to disturb nstree.

As far as the author tested, this bug only reproduced on a baremetal
environment, probably because the test relies on the RCU behavior and
the kernel behaves differently on VM.

Signed-off-by: Yohei Kojima <yk@y-koj.net>
---
 .../namespaces/listns_pagination_bug.c        | 200 ++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/tools/testing/selftests/namespaces/listns_pagination_bug.c b/tools/testing/selftests/namespaces/listns_pagination_bug.c
index da7d33f96397..f71d8f4d64bb 100644
--- a/tools/testing/selftests/namespaces/listns_pagination_bug.c
+++ b/tools/testing/selftests/namespaces/listns_pagination_bug.c
@@ -135,4 +135,204 @@ TEST(pagination_with_type_filter)
 	}
 }
 
+static void run_noisy_children(int num_workers)
+{
+	struct ns_id_req req = {
+		.size = sizeof(req),
+		.spare = 0,
+		.ns_id = 0,
+		.ns_type = CLONE_NEWUSER,  /* Filter by user namespace */
+		.spare2 = 0,
+		.user_ns_id = 0,
+	};
+	pid_t pids[num_workers];
+	int num_forked = 0;
+	int i;
+
+	/*
+	 * Create worker processes that do concurrent operations;
+	 * most of this part is borrowed from concurrent_namespace_operations
+	 * test in stress_test.c
+	 */
+	for (i = 0; i < num_workers; i++) {
+		pids[i] = fork();
+		if (pids[i] < 0)
+			goto failure;
+		if (pids[i] > 0)
+			num_forked++;
+
+		if (pids[i] == 0) {
+			/* Each worker: create namespaces, list them, repeat */
+			int iterations;
+
+			for (iterations = 0; iterations < 10; iterations++) {
+				int userns_fd;
+				__u64 temp_ns_ids[100];
+				ssize_t ret;
+
+				/* Create a user namespace */
+				userns_fd = get_userns_fd(0, getuid(), 1);
+				if (userns_fd < 0)
+					continue;
+
+				/* List namespaces */
+				ret = sys_listns(&req, temp_ns_ids, ARRAY_SIZE(temp_ns_ids), 0);
+				(void)ret;
+
+				close(userns_fd);
+
+				/* Small delay */
+				usleep(1000);
+			}
+
+			exit(0);
+		}
+	}
+
+	/*
+	 * Return after waiting for children; this is enough for
+	 * reproduction, and help keeping the test code simple.
+	 */
+	for (i = 0; i < num_forked; i++)
+		waitpid(pids[i], NULL, 0);
+
+	return;
+
+failure:
+	for (i = 0; i < num_forked; i++)
+		kill(pids[i], SIGKILL);
+	for (i = 0; i < num_forked; i++)
+		waitpid(pids[i], NULL, 0);
+}
+
+/*
+ * A test case to reproduce spurious ENOENT in listns pagination
+ *
+ * The bug occurs when the ns id to start pagination is inactivated or
+ * destroyed before listns is called (or during listns is processed).
+ *
+ * This test is almost identical to pagination_with_type_filter test
+ * except that this calls run_noisy_children().
+ */
+TEST(pagination_during_grace_period)
+{
+	struct ns_id_req req = {
+		.size = sizeof(req),
+		.spare = 0,
+		.ns_id = 0,
+		.ns_type = CLONE_NEWUSER,  /* Filter by user namespace */
+		.spare2 = 0,
+		.user_ns_id = 0,
+	};
+	pid_t pids[10];
+	int num_children = 10;
+	const int num_noisy_children = 10;
+	int i;
+	int sv[2];
+	__u64 first_batch[3];
+	ssize_t ret;
+
+	ASSERT_EQ(socketpair(AF_UNIX, SOCK_STREAM, 0, sv), 0);
+
+	run_noisy_children(num_noisy_children);
+
+	/* Create children with user namespaces */
+	for (i = 0; i < num_children; i++) {
+		pids[i] = fork();
+		ASSERT_GE(pids[i], 0);
+
+		if (pids[i] == 0) {
+			char c;
+
+			close(sv[0]);
+
+			if (setup_userns() < 0) {
+				close(sv[1]);
+				exit(1);
+			}
+
+			/* Signal parent we're ready */
+			if (write(sv[1], &c, 1) != 1) {
+				close(sv[1]);
+				exit(1);
+			}
+
+			/* Wait for parent signal to exit */
+			if (read(sv[1], &c, 1) != 1) {
+				close(sv[1]);
+				exit(1);
+			}
+
+			close(sv[1]);
+			exit(0);
+		}
+	}
+
+	close(sv[1]);
+
+	/* Wait for all children to signal ready */
+	for (i = 0; i < num_children; i++) {
+		char c;
+
+		if (read(sv[0], &c, 1) != 1) {
+			close(sv[0]);
+			for (int j = 0; j < num_children; j++)
+				kill(pids[j], SIGKILL);
+			for (int j = 0; j < num_children; j++)
+				waitpid(pids[j], NULL, 0);
+			ASSERT_TRUE(false);
+		}
+	}
+
+	/* First batch - this should work */
+	ret = sys_listns(&req, first_batch, 3, 0);
+	if (ret < 0) {
+		if (errno == ENOSYS) {
+			close(sv[0]);
+			for (i = 0; i < num_children; i++)
+				kill(pids[i], SIGKILL);
+			for (i = 0; i < num_children; i++)
+				waitpid(pids[i], NULL, 0);
+			SKIP(return, "listns() not supported");
+		}
+		ASSERT_GE(ret, 0);
+	}
+
+	TH_LOG("First batch returned %zd entries", ret);
+
+	if (ret == 3) {
+		__u64 second_batch[3];
+
+		/* Second batch - pagination triggers the bug */
+		req.ns_id = first_batch[2];  /* Continue from last ID */
+		ret = sys_listns(&req, second_batch, 3, 0);
+
+		TH_LOG("Second batch returned %zd entries", ret);
+		ASSERT_GE(ret, 0);
+	}
+
+	/* Signal all children to exit */
+	for (i = 0; i < num_children; i++) {
+		char c = 'X';
+
+		if (write(sv[0], &c, 1) != 1) {
+			close(sv[0]);
+			for (int j = i; j < num_children; j++)
+				kill(pids[j], SIGKILL);
+			for (int j = 0; j < num_children; j++)
+				waitpid(pids[j], NULL, 0);
+			ASSERT_TRUE(false);
+		}
+	}
+
+	close(sv[0]);
+
+	/* Cleanup */
+	for (i = 0; i < num_children; i++) {
+		int status;
+
+		waitpid(pids[i], &status, 0);
+	}
+}
+
 TEST_HARNESS_MAIN
-- 
2.52.0

