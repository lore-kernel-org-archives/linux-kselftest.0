Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021123.outbound.protection.outlook.com [40.107.130.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B3E4908DF;
	Thu,  3 Sep 2026 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432656; cv=fail; b=BlLAndAUGPuHEEDhu/J3Sm/4GUGM6CMmpYaKCVPhozAa2+QL/qKa+OPhP6nBmoGjotSJBFudqmy7h2DThO0HwUYn9BVRUB8Vk1ygpStR/EXoZFNn7XHUpekr4/qaGSxTC4llkuP0qx4zBkCfrTvRbOP2x0FQetoHetOh+u51t7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432656; c=relaxed/simple;
	bh=05Whidb6UNtgDCALnHXBX1Hmge2EcRoHDPgQUmn/AA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u2LO0q2D1IJa1l0uUgG8HWvFfNKsgIdeeqcaLn58iIm0kn5PAlypwqzjzG4qAIBmJ5nhF/t0kgkczjmhvi2Gq0ziCzHqjoP5icoYZSaiPJTLvTi26wgsXX4QJLIk1MrGgDbQncNuCu43k/ccA0/oR6MhdKHZCjYtlCXC8ozWCe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=WU/DSg96; arc=fail smtp.client-ip=40.107.130.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="WU/DSg96"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUPjF76JzAlSroDTXlK/PKxipGBiimgSbU1gDaoG5yCDfrfbS1zWPGkw/BuBbXFsV2QcPqjMpXu2oyWtIGuMxrsLn4qVlqBLwvWEjrXJAraHrPzw47t6B0BxMew7py9fOzLWvRO0gcCpZNIIE0Kpzs4GUnkqyZn7fP5qZL/Ab1YHvYcz+UaJTyoBitkP9K0jskuCaUzPsxSyBnvYe6lZR7/jkF+eO7ee4o1WtkHzNJpgqm9lujRzNinHMRX6nrmWi4HkVDlVfYROb5HI1FTHF+Qvtgi5HgEKKYjzRjmSNYAjSJ7Ts+3uKcZx6k5KpiCcuxOURl80Ik2UhbO5oQc4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9H4EN49xXcuNhVeLiBMsW91ojB6Uhbl/Usy40QZLBk=;
 b=qaF/1GLKh4M5gCdMCXyLk8GOX614HiEkivXKMu0+tdDLjpAu2D76w9n92zguTlbRiO36yi/ij1fj9Qd4WRwQ/SuwWNuDr4Fael65JmoBvSRnZLH7ktciGIM+kjhTLU+iwOc7b35b/j6Xl432mnyRVGj0sZyw6U0wjNT5KjomlVshO8KdqWXBr+irYcLLVKlTd0mqKdb2LvCFPQhMjmuJv8peaKsiwDkmsmBt8RHD1jtvtAQKSyTOMreIDahSGpTi9zEvr1sCTSgbJ5L6f9gaQBKMfILgv2GdGWq8uxsCx/HI4vt1h3f9/p5A91oGMKTQaPduuyrEP7KSuJAndopn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9H4EN49xXcuNhVeLiBMsW91ojB6Uhbl/Usy40QZLBk=;
 b=WU/DSg96H6F00wzDpOp6UanPI/tqYOB5XtOC2jtk0F3GxST3vQIQAw8ydrVPVjPrLT2jh9ozknX8PQFU2gnIJoLVzAYsSnGve9zUzilA2sNX2NdHR0jjHoewDHUzUhcLtBV9oVoqJk2q4o16GZFLpRps3V+lOkfhCjPOiKFia3dZWyAmwdJk3ZWcVJaiI8AmWLNWiidJKkH4zBLb05TK7iGIQrK5hK+chayzWM8DigwpL07E+ZXUxMKtBbCP/PXCNLlXwViGCnCV3YeNug4dpw09W1u65BxA5qAWHlhc7Ofw3KabshbrlWcOk7E2lHcRTZDShV5GC6KvHqKRGCo4pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by AMBP192MB3404.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:759::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:50:50 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 10:50:49 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: reddybalavignesh9979@gmail.com,
	richard.weiyang@gmail.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH 1/2] selftests/dma-buf: Convert off64_t to off_t for portability
Date: Thu,  3 Sep 2026 12:50:17 +0200
Message-ID: <20260903105018.565425-2-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903105018.565425-1-christian.gellermann@codasip.com>
References: <20260903105018.565425-1-christian.gellermann@codasip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::16) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|AMBP192MB3404:EE_
X-MS-Office365-Filtering-Correlation-Id: cc26cb1f-b6a9-49cc-48d2-08df09a937af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oPWb545BCGytie7cpiDmXqmO12Th4Vh55dJcfelIVho4gXPbvzHr2r/ayS7E6muAq/Yk7XZQTjWF3kcR3N3KXIFgPB7PlgsWnf8Lt7IwzkQvD/BRNy8qibeWk6jx7EQQI3oD3zW0wBe7U2nWat4lj+7YwywDtYs40E+NFYjjG7YeiO/a0S79+STfanUcNibZH2hTqZpLOGfbxNPpzsKQfj7SnWA3rpAogEyrOHmI1hX15KE+q+foL8+uiC/Ki13ZPn/kKExqku7gyzp4SBka9p4a/rBMhtGfSjJvni91IRtfgiTi0x1cLxYzhCIlz/V1g03PXNLfi+qNLV2PrcbQ9gMPf4yp7CKlUqLuNrw9ro7AyXjiJ2MGH4VCAIlwucIdj7Z069wtxeUxrVnQoBWi3YAVwJ839h+y1eq+Mua4vyCzrBcTJ10gBwx63xB5RNm7cLOEpc1r1WyRFloZD3UGQHl4LkKB9rE5NwQ7GYzUGHpiML+5jQkESbvv1+YDReMe1/f4vPg/C11SYoSZDf53vz2k3ZEkj8Blg3UCjhNEnCEdt04tFYW2PnkxJPWvLl6SRqYsvygdS75s+P2BbouzkBKbL/3PTb2IOHDO98cQ17zak3hablvuk1Y9H9psA+3bqzpgemfeo7zsVDMIdo5zpgQG+Ah2JOTx0LUpgkmZLAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFYXyBIxMtM0DSSD/UT0XjMUc+6rbBWnLm2edM5KCd0rJtexawnReI1vBV3m?=
 =?us-ascii?Q?HmqWb953rvkrJz6YBctV0Ba660/hoMJ0lGEXtapS9pWGMT8oauo5ilN45vwK?=
 =?us-ascii?Q?X5RR0v8BernIsRuXjPvPIpYjCnqh0qIJJXvSZTCYNniQfVHlu1AO3HDbX20K?=
 =?us-ascii?Q?Umb8BuPImRSiMAkkQVeutqgQLnIXIdPRRUfJvzfw23eyl1f8M8TTd2oQmFII?=
 =?us-ascii?Q?ccC+hwp2QerJcZ8ZwtMeDwA1LW5Hio0Xt7oFYWtfTk0d4PHyQjH8Nrp7kjkL?=
 =?us-ascii?Q?PAXuA73lKMG/MC+4LWzTEXjaQB2b3sBfc+l23kRHD5A2eHS8WSf0FWdkSFdo?=
 =?us-ascii?Q?AUGZEmMQj7zazgYvSChXi40wETy2dv5tpp8g6Dh0qCUJgVsRjA8QVWL+V/l/?=
 =?us-ascii?Q?XVzKCBwEmqor0Bf6RPoLC6g0P6ulVGy8WN3xfQSqWpUt/FLfkaGRZM3054WK?=
 =?us-ascii?Q?hOcV0NmErdDPElLkxsDniWh+Io5ieNWpkneuzzbk8SJ/d74I306kv01l0tl8?=
 =?us-ascii?Q?O6suqeWdJByoubWWQbRR55+MviZIFP91e7pL15BoNt5xgFoPrY4hC27dc2Wg?=
 =?us-ascii?Q?U267p0fahh1VXxk0oVRv66QHoeQAM5lRyVeoMU6wewxu+QGnMsCuMdpFD90b?=
 =?us-ascii?Q?cA2x3p2pdWeBBC7U3K0EB2oo42exvC6Z/zGXCMyao6qNMllFGBmZAopmQQFf?=
 =?us-ascii?Q?SJWLtCbZiOMtVkNH910/Z5cQTZJ4xWIsoL50zSrYALP62kq5kC7Z6ezBSm18?=
 =?us-ascii?Q?m16WqfnC9gmfF1F4GN66BMx6/UPRU3k+vDJVwqBm9z1rciKlAXhcfg44M5od?=
 =?us-ascii?Q?SwHmnCdwTjKaMBiDC5PBZh3ysrJgXAN/ERz3WXjt5hPP9fjGsr56TCOYDRK7?=
 =?us-ascii?Q?3qvLdLUFHBGFmPkqOpINHmpp+N0Vs1oOK6B3QV2NFJWPuJ9pnfHRwlYgvQzl?=
 =?us-ascii?Q?RhvCSgDsPfgvNfSysJFWv8SpkTe0K0VTM+wo6YcjAZESpqZJ89GcFZ2kDAAp?=
 =?us-ascii?Q?9Ummm+8p/tYUyQ/cCy8E6xY3Q+1otn1cogp608IqZasKOnrcyWa5qFW9hY2r?=
 =?us-ascii?Q?ce/FIBIhwmVIEi8w5HDaIQizL3g+oUnsBzNLlzzof1a4oTI1hdLcCjSWVWpc?=
 =?us-ascii?Q?25U4X/reU4KpwhhloW2tw5cLf+wykKj2GM2CDx2mV92uOs4eThxfyvzAp7WG?=
 =?us-ascii?Q?Khu7AdFgZ/BFKDGJXU09tNJY9ROk02vKxNVYgzJ0wd6tUnBFbxzwIyN0mUoY?=
 =?us-ascii?Q?9l/WmSCpEh9Zc2gl4SDpYCLMVaU67U+oF56MwqZn8HGc6Z7M86NX9839jz0x?=
 =?us-ascii?Q?puR4ELVAVSV8lfGiRK77ee+9Xy6+wa+hl2P+stjY9UqSzgUYpGXVQT1VkJhr?=
 =?us-ascii?Q?i45i8nl5M4KvKiZONIiZHe+OKKoHF4aWmTekCmn0YAdBwAVb5XdsbVCL8a07?=
 =?us-ascii?Q?g5/VMOGRPIISlm83anSobq9Em2GXApaY5omnj/12cQZOqB0ICQM/m0fygcO+?=
 =?us-ascii?Q?AsGdpWaAQYfA8AyzyKxWPkR3xK4uwmnjPiOzqRb7/FGDetmP3RQOPF96POz9?=
 =?us-ascii?Q?E5uXnsam+rJlCu9zPbpBc0yftFU5IRGUwT3Xm9tk1bt9744YMdERhN0Tfa/M?=
 =?us-ascii?Q?2vM6yrdCwx3LhgY3L9BoV5jUOQzvruWeh9SVRQhWmkxYfuAHhAoiQBkezCz9?=
 =?us-ascii?Q?4c1xO4jo+ndH6jygwyEalQH8/HU8l9NEBDNc+qkS4Rl8ExqX/Z/ZkVrF372P?=
 =?us-ascii?Q?Dqzmfbv56+9M2a9ynM0XR/3rDNEaXo11XZJq1FPdequ1FyKAq8nS1+CIY3F3?=
X-MS-Exchange-AntiSpam-MessageData-1: mWWa7Ij4RmBIOd6ntoj/hPsbztARYQYjIYY=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc26cb1f-b6a9-49cc-48d2-08df09a937af
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:50:49.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0M9rScrCbjE8Y9MRHnbukmtIpy4konJCu88g0vYeP808nMMO0z36VLs94LqZVp1FSwMO6vdJWkzsJawhPBFiLCwrm6A1wRT/neARhw0aVDTLZ6xKsSrAxHahDOSOq/qD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3404

Use the POSIX type off_t [1] instead of the GNU-specific 64-bit offset type
off64_t. Ensure it is 64 bit wide by compiling with _FILE_OFFSET_BITS
set to 64.

Link: https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/sys_types.h.html [1]
Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 tools/testing/selftests/drivers/dma-buf/Makefile  |  1 +
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/Makefile b/tools/testing/selftests/drivers/dma-buf/Makefile
index 441407bb0e80..1d65676f969e 100644
--- a/tools/testing/selftests/drivers/dma-buf/Makefile
+++ b/tools/testing/selftests/drivers/dma-buf/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+CFLAGS += -D_FILE_OFFSET_BITS=64
 CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := udmabuf
diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index d78aec662586..2def04ed3451 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -25,7 +25,7 @@
 
 static unsigned int page_size;
 
-static int create_memfd_with_seals(off64_t size, bool hpage)
+static int create_memfd_with_seals(off_t size, bool hpage)
 {
 	int memfd, ret;
 	unsigned int flags = MFD_ALLOW_SEALING;
@@ -54,7 +54,7 @@ static int create_memfd_with_seals(off64_t size, bool hpage)
 	return memfd;
 }
 
-static int create_udmabuf_list(int devfd, int memfd, off64_t memfd_size)
+static int create_udmabuf_list(int devfd, int memfd, off_t memfd_size)
 {
 	struct udmabuf_create_list *list;
 	int ubuf_fd, i;
@@ -84,7 +84,7 @@ static int create_udmabuf_list(int devfd, int memfd, off64_t memfd_size)
 	return ubuf_fd;
 }
 
-static void write_to_memfd(void *addr, off64_t size, char chr)
+static void write_to_memfd(void *addr, off_t size, char chr)
 {
 	int i;
 
@@ -93,7 +93,7 @@ static void write_to_memfd(void *addr, off64_t size, char chr)
 	}
 }
 
-static void *mmap_fd(int fd, off64_t size)
+static void *mmap_fd(int fd, off_t size)
 {
 	void *addr;
 
@@ -106,9 +106,9 @@ static void *mmap_fd(int fd, off64_t size)
 	return addr;
 }
 
-static int compare_chunks(void *addr1, void *addr2, off64_t memfd_size)
+static int compare_chunks(void *addr1, void *addr2, off_t memfd_size)
 {
-	off64_t off;
+	off_t off;
 	int i = 0, j, k = 0, ret = 0;
 	char char1, char2;
 
@@ -134,7 +134,7 @@ int main(int argc, char *argv[])
 {
 	struct udmabuf_create create;
 	int devfd, memfd, buf, ret;
-	off64_t size;
+	off_t size;
 	void *addr1, *addr2;
 
 	ksft_print_header();
-- 
2.47.3

