Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021099.outbound.protection.outlook.com [52.101.65.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891B5446855;
	Fri,  4 Sep 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515964; cv=fail; b=rFl/eNdJfWFB9xVApD36gGmfrmP6BriReqKlY0qy8IvAOCmgMHW3VGEn7PPEG6AoOaD61bZZKkLxWdzimRHLGjyzfIlUbcmoc1Jby9lJDjkV1hCDe9jeA/LPlKoqC0DRLPnp+tWENrhKp/FAuMGMDnrFfVj0O/UjZCYs4yY/fYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515964; c=relaxed/simple;
	bh=bG100bq7GjLlw6Idoca9HACEOF11PjNK/4/mYPvGf4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ggsHfU5xo9IqSD5stEk2VXaiKYNNQmiVb6mCisDibS8pFXVDzJFeFjjGxXnIXZwmfhJnvnfDtgJPR21hP+7ColYshX91Gf+NaTQfoLi2UW18GmRshi/Nq1ZzrJM1O61Tge7omemeUzv63bxkGpljLIkVmDJxXcIHVJSFWI3SDxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=PaShLn0k; arc=fail smtp.client-ip=52.101.65.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="PaShLn0k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mq9l7QWyHWuo5WXEllBkK25t1eDIk6TR+Hiu/EmRkYoHOB8jjlfNneZOWrvR9jBAFwSNE96CPn1xT/oM3DQkws0zF2BPlsqmpVXSnBcaEAa6rjLalUazAaer3k7n5p6d8Qhi45LW2bbh3j21B0PU7p5oNN7re6HPS5p9bauWmOoK68efbUj6edumKnxU2pjq1/9dBIofbZzbEQHv09Z0JThzhG5p8hU6nyHIPWPj+/yj77vTcue4jwyNrLvyZuGmD52OuoIP2ApcN9tJdGgnbS7M0eGxj9VmC7CMW3dnrDTeXwwylflmGGMXGQk7UoVMq2d//TNMsSyRhBu3Pw0dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSp37uDJfMvU4UybZ8zP56BIy+C0TtsbAWR/ZKj/TvA=;
 b=FNWyIjb9OFiBD8msurDMd45Wj2MJoE52bGNZgI43FGShdo85kyhRpKSms8yeczsBu7ltnjBjCSdlXYfdSoOJWM38OKBuSaVqoNOzSQwD17KYEa9ahBGPwIOzRixr3i+OhXsPdKWCAN3u84nl9XK+RQCKhMwrJHMM2oX5ErAudHGwlOpJJzxY2sufgkIIoiP+YvHdmyIRXV/+efzJWwRPpu+DqcNZ/OU3UWCPp2KuMGHumkR3WrNc/NNnVuQVS1uvjntYXz5ssf4uZ0fpobDn6nkMN1lAb0fOrGdlr4zaJMNiYSD1OYsUNg0H5fBmraluD4pr5Xgy6Ae7gXbKu9S+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSp37uDJfMvU4UybZ8zP56BIy+C0TtsbAWR/ZKj/TvA=;
 b=PaShLn0kCuaOT5sRPxPbYz1bXUdog6aPGGsGMeQLygcdKrtYLYDz4UEdqvGxogScLXM0TpRVbXdmdE+O0WR4mfMd/LNVrjdleBCMwbkKBwKDsvYIg5LYic9Az9dyFdcyaDjLv7qDyTXIit5KFjB8seoOykfCii68JKQ4qUi4pi5hJeZEydDbrdWiljEVHOd4d8L6z0jCN2P5I4idLcXAkjwRUjnWw3U+jKduSUyXyHW6MgoWJr9kRPcNPGDhIFVCXt5EEXxXl4ecWyBriiNzzM7X/JlPifPj88KIj/e6yT0edaKfvQIWaqNsqKPVjEsORF/zL62oqruEXEAw7RtY2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by DU0P192MB2122.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:59:18 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:59:18 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: david@ixit.cz,
	bongsu.jeon@samsung.com,
	shuah@kernel.org,
	kuba@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH] selftests/nci: Fix out-of-bounds store on thread join
Date: Fri,  4 Sep 2026 11:59:15 +0200
Message-ID: <20260904095915.3372241-1-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::14) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|DU0P192MB2122:EE_
X-MS-Office365-Filtering-Correlation-Id: 6104cd0f-6281-4c89-36de-08df0a6b2f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|18002099003|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Uhz0qbcqD4or56ZM1b3NmIUgEL7+hUSSbFyYdn7g0wDvrVaxZwDOWTr5ONM7VpdZUuEygNbr6W6KumwFp2hm0pWiiGBn5dPQfcsH8417ZubZk/2vZ6H5OWDY7EB2f5TDK6un3fNLty9/J36aW3QzhUwCodGZWU2Trf3xnCIDEAG6G7hWIvIMHx08weGIYofaGQOz+CNZ40gyncc9eTV4RcPHQmdS/GrfNfCkWp3qeCER+zoEQ/lLI+C2t876vX9JYQdIgkvLRfo1VPHoizaYnrypmljwctoBbkATlYjiW5M+gdhD/9ZgR6kXMWSb3CzGZgcvTZZj1bFFao+J6ULx5aRiCkLQcfVaBToXvBsXSUL0GAsz0eCsVMicNOJH+5nmCdbRSMdT/Lw2Bz49cJPtxS/kz7qDZL3B516ALiwvxwIP7Hp9AlL/vv/0arMlPcE52A9zd2HeeuNJYZA9EED4nMbzegCkDXInNnqc3RRgBaFthn4QEzJQxktNK2en0/CSuZQRRsAIjoOXr7JkYiBSc7YFBB6xdEd0t4qsPXKeyz9I8lfPdf8f8lql8Gt+OFbiEfc2n25UBvR1FxaMzotYwlCJb1Xe8Z7OxQvnqJCtG+ItsLKxWWjDRbPijnPxuJlCDyKf7a8ey4sGLdafoK/uK90DPT3fsNR+992Pe2cM1Kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(18002099003)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2wXfN0jGYgqzEkeIdj6q1tAQw+NWjw9einUYyL/oBE7L6iNBY0bKraLGSXKL?=
 =?us-ascii?Q?PaNbcafTCWFPgq8VVF0iEHEL6VdO+ujpTn/37ElyjrFX/m3sYrpZYa0PrsF8?=
 =?us-ascii?Q?mEG0NQbquHDdoJOmOD+PIiSLThcUpmfpEXkdRNR8V0rTncOM6dQpzqas5B1J?=
 =?us-ascii?Q?q48/BF4zJJIV07Cl0GjO/ulJc9GUbQkGyMFIifM3Ny/B15pC2U24mzDvEXos?=
 =?us-ascii?Q?Vr/KTtk4yvJokWCRdtTn+nUeqJRErAhJ7nFBkEB+DrTw9Zyll93x/PGFERWO?=
 =?us-ascii?Q?1+SbKdjWIlvxsQowbWh28pC8IbBt28qinfIxWo1SPAbheM1hPB4sazH+YVQ8?=
 =?us-ascii?Q?n416M+HrKjtVMV7mqD8t3HQrkmToG1hFciH12VXGQGP+BpZBeJpSgC/UHDEP?=
 =?us-ascii?Q?a8SaCTrw28DbOVs+EAJSi17cPXTmohNibUu0wBGwA7FnQdfVPsog6VlhpovA?=
 =?us-ascii?Q?8sLZy+WiESM27weskBJzPudKfEP8S1+7WbbmGfB2R0kqBAeMxra5xjAXZHBU?=
 =?us-ascii?Q?EOavjfZAvC6OV4sOCjuPVk0ZrqHnPCsqo+1/3uIHaaA1lNlEy0gZvLe7tIzT?=
 =?us-ascii?Q?Wyf0TzMHCzeRyQKo766EkcVKymgnhCOhzcWrVAVPGzTKl6kvkm9aTlR4I+Hx?=
 =?us-ascii?Q?4abcKP4IRWjhBrU4woigUziK9PHSR3JBaPv7CVFEkalO+4v0Iw8+pKN1JGvA?=
 =?us-ascii?Q?tFXHY/7sVv1DCip9Lj2bQwqU2FfxBi8hZFth4jG5bTDmjLzt67cO4LEEXo+f?=
 =?us-ascii?Q?9eFDXv7GKlrq5AutvfXtVAgbMZeTtglhItNfz+4BuWkD0rLMM1otE4rTJEku?=
 =?us-ascii?Q?eMZx8LgsNFN++b/VNcCvZMQyL1fJjkrS2emBy8gBIj8GI/h37ZDiCslsVRXf?=
 =?us-ascii?Q?+UHZx7idOkqalX76+YWt5om2Y8vcgc6Rv8q6odIJysLQY/covk3rDvRYafwm?=
 =?us-ascii?Q?xEcE8l4OCEDoQxemyCLc3OXQKxygsTc63BqbHprGxiCRicBO3bz8rxTIXY/o?=
 =?us-ascii?Q?jEaj8gEQTvYkYy4eSi9l2/rmbZDimCA6yspXuRF6082oDyYxLFFKDiY9cTZG?=
 =?us-ascii?Q?KOpNqc3QxBwchEb0PXBVdQu9JpBUVDrExKwXttw+/x8YfEFS+SQgfSQUOcuU?=
 =?us-ascii?Q?zF7318/9m1PGQvrDHhVIRkIjiEyCPG+bPa7lFIBIc2tvnzmGoZWZjVYDrVov?=
 =?us-ascii?Q?w5fA5SasNgI0QafX6/KZltrRysNEVdG+D5upEB37GliX5x/J/MjNEsH1XxFW?=
 =?us-ascii?Q?FKdGPWqvFDIL/UiuTOm+JhyuZ6o1lEeKJaBOrBQy7I07EEtjCKpW0pr71V3Y?=
 =?us-ascii?Q?SpXRMvkpB3RwpJO5rwJVcTOWozrGTfa2mdrt4hRlxBhrvmHV+UK0WF5fpA9+?=
 =?us-ascii?Q?KpS7OHUExQAhRlGGEOrva3Ru8BKEoicRenZrGb5krErPPnEbkgP/L8gMlJMP?=
 =?us-ascii?Q?1OEpk9sqFTf3lDqqJMMCq+q9rY9cWexardugsMNbXp7fgHFDN/FwLlSAygZF?=
 =?us-ascii?Q?Ul6crtObnc0sCOWvprkanysZZZmjivXJ+ELsLu7rDavk/NyFQnsZiQQBRqod?=
 =?us-ascii?Q?YPeeAH+hvQpDHZrDciaZApbdusUu8L9Q57OpL1IzrJXDqS9fo8hygpf1HVU/?=
 =?us-ascii?Q?QkGU9NROjWgOzpCR4pbOVc1gWyI3ao9p+d2kGm9HgS+cJTVtWS1csc7Y9H7K?=
 =?us-ascii?Q?Pt0Qg5/+7WuNF/TQ0tWre1wU98qUvTKhzeOzeFJR/ba1L4cBg60SvKPOK4uY?=
 =?us-ascii?Q?9kVlP/63A1+IUKw6SGtDl0ABwqPP9E7CAMBV6MQpkhNTvzYHkhmmwXp9xMIt?=
X-MS-Exchange-AntiSpam-MessageData-1:
	W+/tfTvauRYgUkNyKB/gFweF4wsXh50NeTy/dGR3MQSnJAUgn+ZAyqHo
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6104cd0f-6281-4c89-36de-08df0a6b2f8a
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:59:18.6562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +p2mqhXh+MUmwTftNaZKyG7bgc1/o7vPZSH4UR3XbEE0Sq4lKy4u4DA3IXkYZOZBoWy3n4BUJNyOz83343raSfhPaK7+k9K4Z50D9hSyTXtwuU1sUSI+uKo7VXcg/x/D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB2122

The NCI test collects the exit status of its helper threads by passing
the address of an int to pthread_join():

	int status;
	...
	pthread_join(thread_t, (void **) &status);

pthread_join() stores a void pointer to the memory location. On 64-bit
systems, a void pointer is wider than an int, so the store overruns the
4 bytes of space allocated on the stack for the integer and corrupts the
adjacent stack. On our CHERI system, this caused a fault due to a
capability bounds violation.

Fix this by introducing a helper that joins a thread through a void
pointer and converts the result back to an integer, which is what the
helper threads return.

While here, also fix the logic in disconnect_tag() if the helper thread
creation failed. Previously, it would have joined a thread that was
never created when pthread_create() failed.

Fixes: f595cf1242f3 ("selftests: Add nci suite")
Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 tools/testing/selftests/nci/nci_dev.c | 31 +++++++++++++++++----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 312f84ee0444..1e06d9b92c64 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -8,6 +8,7 @@
 
 #include <stdlib.h>
 #include <errno.h>
+#include <stdint.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <fcntl.h>
@@ -87,6 +88,16 @@ struct msgtemplate {
 	char buf[MAX_MSG_SIZE];
 };
 
+static int join_thread_status(pthread_t thread)
+{
+	void *thread_ret = NULL;
+
+	if (pthread_join(thread, &thread_ret))
+		return -1;
+
+	return (int)(intptr_t)thread_ret;
+}
+
 static int create_nl_socket(void)
 {
 	int fd;
@@ -444,7 +455,7 @@ FIXTURE_SETUP(NCI)
 			       NFC_CMD_DEV_UP, self->dev_idex);
 	EXPECT_EQ(rc, 0);
 
-	pthread_join(thread_t, (void **)&status);
+	status = join_thread_status(thread_t);
 	ASSERT_EQ(status, 0);
 	self->open_state = true;
 }
@@ -514,7 +525,7 @@ FIXTURE_TEARDOWN(NCI)
 				       NFC_CMD_DEV_DOWN, self->dev_idex);
 		EXPECT_EQ(rc, 0);
 
-		pthread_join(thread_t, (void **)&status);
+		status = join_thread_status(thread_t);
 		ASSERT_EQ(status, 0);
 	}
 
@@ -585,7 +596,6 @@ int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid, int p
 	void *nla_start_poll_data[2] = {&dev_idx, &proto};
 	int nla_start_poll_len[2] = {4, 4};
 	pthread_t thread_t;
-	int status;
 	int rc;
 
 	rc = pthread_create(&thread_t, NULL, virtual_poll_start,
@@ -598,14 +608,12 @@ int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid, int p
 	if (rc != 0)
 		return rc;
 
-	pthread_join(thread_t, (void **)&status);
-	return status;
+	return join_thread_status(thread_t);
 }
 
 int stop_polling(int dev_idx, int virtual_fd, int sd, int fid, int pid)
 {
 	pthread_t thread_t;
-	int status;
 	int rc;
 
 	rc = pthread_create(&thread_t, NULL, virtual_poll_stop,
@@ -618,8 +626,7 @@ int stop_polling(int dev_idx, int virtual_fd, int sd, int fid, int pid)
 	if (rc != 0)
 		return rc;
 
-	pthread_join(thread_t, (void **)&status);
-	return status;
+	return join_thread_status(thread_t);
 }
 
 TEST_F(NCI, start_poll)
@@ -832,8 +839,10 @@ int disconnect_tag(int nfc_sock, int virtual_fd)
 				(void *)&virtual_fd);
 
 	close(nfc_sock);
-	pthread_join(thread_t, (void **)&status);
-	return status;
+	if (status)
+		return -1;
+
+	return join_thread_status(thread_t);
 }
 
 TEST_F(NCI, t4t_tag_read)
@@ -880,7 +889,7 @@ TEST_F(NCI, deinit)
 			       NFC_CMD_DEV_DOWN, self->dev_idex);
 	EXPECT_EQ(rc, 0);
 
-	pthread_join(thread_t, (void **)&status);
+	status = join_thread_status(thread_t);
 	self->open_state = 0;
 	ASSERT_EQ(status, 0);
 
-- 
2.47.3

