Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021119.outbound.protection.outlook.com [52.101.65.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90162314A79;
	Sun, 24 May 2026 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651482; cv=fail; b=Gx5p5To4dB/DJrQiy0XN5JNjpEXqSXtu4KAkY7Z2zOX4Wyfbv+37QxXg4wMq6XvJl3r/Xr8UTC/BJ6s4SHC1wgKrO/2/9svtCJPI0qemtbkBuv6imxItdu/PLwkoXBgV28ggO/i4Jgqn2Mz47pJufBVNudqr2eM5atZdcaFIytc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651482; c=relaxed/simple;
	bh=5yKi6bpZLGijn/SlXcnq3KsxzKdlFR85OKSA9WxY/Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RNIggOU49umwbabfYqp2ajFrKAPJouhXujdAHIVJ2cA/YAl8RtvVoHavPQDwTRsroET3AT9se4I4kduHjeoHaw9rAFBNSt8UcwGmbnlXmaEelAGJSw+ni/Ov3hay8udiUhn9ZZay5AOxonPN3e8WKk5d6zAmBIT2pXsKJNPgd1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=iWBGsvHK; arc=fail smtp.client-ip=52.101.65.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="iWBGsvHK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4tE1Q0oLBHta4+J4IQayS+rlTyGHG6Xgrf93Id1Z7qzSV60+v1tZtNa/ize9TzKpwjK4xEDRH3PTb3VSectN1n+1YxvZGCE305GBTg1YH0Cb+zMeTZnPIIYE8MtN1F+4PG/kJOeqetS+1iMymJ8OLiDcDLEsmmU0ibl0VmN3RrULU3+Bs9cYdaYdEYOz2rwiATmeUpRuMlHU+4jBIWLDeXuwgOKl+l2OVLs5Mhz8uyE1ajXL6xUhm+kJVgNYzj55MlHGS7oqSh4BvmSUXrtOEqMnAiq78NzM39in1E9f6pmh+P0zf834h0kkptRZldTifHDqHTMwRfRfopoATYQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPgs6Mk+D5g0THe7q64QKz5HtVRgxEyX/PKic5JC2Kc=;
 b=LlwNWcb5HesUMVkNyVsKulh73pSrCvYK+RtqvCR6nZ/CXxFThy8ER8kl7eCd21Fy1ZOL73gKO3d+LN3ykvcw0hFkHGt8VOW0V+6V+Z3PwgA8p5fAuiv7rcQ91cn7NZBP86aF2wD3R8MBsOq9UxY96UmLqi3qLg9FCqnoOQym6f0PPYEE4sxPSMu7+ADTZmh7i4G4S/5wr/KxYJf6cYW2hdfwEo7umugldAgA5dbyRUjp92N2PnREqzJEAmW0FE2ZoHLd2kiJPJ88jmbLPbv6pEGeNS9u4pT0G7GOFoeEWlgOI6iWclYAjvhCjzK9bTC6E9MhT5xK2NRFhcuJpAC/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPgs6Mk+D5g0THe7q64QKz5HtVRgxEyX/PKic5JC2Kc=;
 b=iWBGsvHKHmlJwCMXyiBN5Tq3jArP7OHGMVnsjtGwuw22R/AtD6qTF9SpBkvRMZfrxSjIY4JPP/P0PT9BlKSqy+KzAu/Fv01WqzrLUvCwOtKkSeyb94JjXtlywK3JzAmx7FZ+blAprj+HGjstKlE5leQDWJmR2xCzduPgY8OwMaG0DI+RotzLTFp96Se4PU37yqjdWsSmH7bfgrlyeKZ5uVcXojvRxacyY2O5Vax7D04IusZKxekqbQJ9UmJSysZonuX3oylIqFOF1cNx3OkTAB5XtL7EBEM6DLwYgHp1SrOqmrq6fGrU6sxiEEN3+O2H/3iqMwg2iZujdYkwkxwomA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by PA4PR08MB7596.eurprd08.prod.outlook.com (2603:10a6:102:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 19:37:51 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 19:37:51 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aris@redhat.com,
	akpm@linux-foundation.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 1/2] selftests/memfd: fix -Wmaybe-uninitialized warning in memfd_test
Date: Sun, 24 May 2026 22:35:56 +0300
Message-ID: <20260524193732.48853-2-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524193732.48853-1-eva.kurchatova@virtuozzo.com>
References: <20260524193732.48853-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|PA4PR08MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: eac94464-f9e0-4670-458c-08deb9cbf174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qIIduw4RAKdmq/QODN96J887UGYGHGqUelvYOJEN1xAKDL7LT9qxANwiJ9MFYLq+xTsKnD+3G7dnr9yDndLW8GggQIfWQo2Wqr3njNfZ82ZIVt20uRDYswX0e1l5kMlQ7/EP/dYTwB6wpzzEVYNSam0jr6jEOsvbMCScVh6LwI5vm8zI87vgUI/c6XZpEnau9zlgtzIMokzM3aVyHKmt7INL6QSvDt6a+WJ1LJFgeS8mAWWRsfmE3hRPzUykEevm1trY5g1QhRRvu3sd4zOKeoRV3DHLuK48rWq1kFU0l0qJC5qv/gXPOSHOYqc+wKn1eFje9YxrHjzUX7xt5aMpOlPNFTLpCz9vrcNHoH0k1ijzL+HHk1nrRIrROS+KuU6+kBMiF0tVZKKgg0aGAW1f7WAUjfgpo2KL7ooizfysm6Rt7GlPcmzTXkDJDPjCWpo9g6r6YjXOraiLjXPs+8XmIy+Z72zMtmMFYXfntusqkAIhZElVBINrFO7NSaJe9rn3Ovgy43VQ8dPgaYtEOjYB4xjoUsdXHcEBusCOFp2IEbwZNVpUEut3fFFRiYr9RaHDdDyYN8B4qglUmaaIoQiVW/ioHixP4ddDbN4TYT9TeSzCBYbaH5BpnJLiAJOdkTFdyHKD8ubWTU2c4Ir2rCZ/crkNUXiSwudEFdAxu3kWEKkiF3uGIq6ZWWxi0+MwL+QO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V9f20MpqMvP9T9Vx0jd8ygX3K0mwMxjkKg11FUkah2gyhfjHc8MyXuF9xefo?=
 =?us-ascii?Q?bt2EoykaOPAkiJ15TDIQDn0slL/hFBKySfWzzHAh3I9/9lCkmfe7Lqsw14Zl?=
 =?us-ascii?Q?s54K8ielGdy3TLe0BSZqlHuz5dPzi/AI8npxZQ2T8H2uJOqQpNg4SH4BFL22?=
 =?us-ascii?Q?SLqV67bnVDKhGXcAydkLuH8LEHpYXUOQhXmggfp0sxS8aedTnxwZVPkpsu5F?=
 =?us-ascii?Q?/cXy7ns1ShSYck94cNJFdxnraO9iqR90Jb/19mqznihBxhhkDekIXwR+8ipd?=
 =?us-ascii?Q?rxTIBR4qSnpe1UzWd0PlNI5iFc9iuQkRB9FfcYi1LzHj1eEEByf5iR2BQDYO?=
 =?us-ascii?Q?WzQhFST1QKN+HNWgI3kNKckru8JYTPESEz6Y5kQbNPnZ2rY0fNKdMgMGRzGx?=
 =?us-ascii?Q?DFS7vYcthqdI3650UbUwwPlqhfSeqvo/MhePseGOxu3SPIpwkULUfYdGVV1+?=
 =?us-ascii?Q?5f5JcQt3ZzUDVmKvZsunnqb2b+hNxxCx7MLp/BaKK8aLVQjdnbjWT2XCxos/?=
 =?us-ascii?Q?RG+Q8vfr1KZCWHkFhvJ6edXbnFV9CbQMQYQYA+Za/30ACUs+kFSdGm+D9B4D?=
 =?us-ascii?Q?S8zEcDXhr/Ln8pU3U5auNKntWp6+5/Zijl6R7p1YzwZUkuuIhBNPaUmxBwmw?=
 =?us-ascii?Q?ywiyRJXfvm1Ra4zdo7sbZWN/Uq4msewi5NbRGCa+ArDdyUs7PXGTCQpDwovJ?=
 =?us-ascii?Q?7/XUP63dnPKvE6jV9Ee9tW2lRYEO9R9GisHTy2b3LZdzxxXYtAotuMRGiAQZ?=
 =?us-ascii?Q?GcJ+k/dPuZC2O4+7MFb77MWhVXxOEFKjhdODOiF2/H8HOMqJ3mywROJjHHgp?=
 =?us-ascii?Q?O6YVrDabwihg5nWpmrlLIh+meOCzakwgWu/E5ww/82+vePNoKwnywqzeKmS8?=
 =?us-ascii?Q?d5kY3Zs2w9bu4rd30osLTBhjIOohcoklV1fqgOQArK926h118n7OdgbpOfcC?=
 =?us-ascii?Q?SfM51OIwmPfp0FhvTBfCnpEEsd+bkdpSDLruDkf+3uG+KkbRN5k1yCeN65S1?=
 =?us-ascii?Q?Y09dB+sfP6VJkT2rJcDpsCQeQ2wN1QBsROdGy9Bn1aqbSlKiaIf9H/OSjzwl?=
 =?us-ascii?Q?IeMsoWzs9VuPG0Yf9ODoQLFWky3ITnhmT+vRifbEPSpZMbQNjWHlbAFZPnoP?=
 =?us-ascii?Q?p67jcN97HE70cKuXGPSX2CjOeJ8/OJ1VbSeOxZ0jP5ptH04KL71ltCv5FeII?=
 =?us-ascii?Q?rSkEuRHjG3vTFuI0/73MdkU7eW6Bgbi44+CYfkE1bYCKBZrgzMz0GV+TWl+z?=
 =?us-ascii?Q?lHXRMHE3RhRvbGoyaTWszsMIu3mYTpqZ6dAmlHw3oHqzxdyoOXM7pDRbItJY?=
 =?us-ascii?Q?SrxbhtRTBSl3UNJbAZGzZp56ic7N1cB4rPb0+YWBMVzLTlQ6CTOYRC/EnmQY?=
 =?us-ascii?Q?4yk7DfPp6dC6iaMh75zZGS6Y+aBQwNSZXQj/xRuaSXrRVUWy02P6djggm+mI?=
 =?us-ascii?Q?FCRrqNEEu4+/f3Qr0BlCnB9isY0BFJLqmylDM6vNjHsbTgcpZIuUhTKD20wV?=
 =?us-ascii?Q?geHpq33qvZn+45dqL7Tk4mFUaMer1dyxsI2BVG4yQ0TXp/EB20cuk9/lix7r?=
 =?us-ascii?Q?V4U56KsWaVE4u7UaOUMVOvdJPQXNZqyyuuQBNAoa8MgMDBbVH5HoddPoqTts?=
 =?us-ascii?Q?fL9A6NAhRhnb++GV7YMSh4FqQK6GPoWIKBjkdfbgcXb07JOqCCAQvJ1ouFnr?=
 =?us-ascii?Q?WhV+zpcZ9frgNZtA5rAOxh1ZBe5ELfwMIlKps9gV7+NkAEqP0Y0DsddtlYiq?=
 =?us-ascii?Q?d0XiZK7STmSONS+QnGH41CkGqQEhULg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac94464-f9e0-4670-458c-08deb9cbf174
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 19:37:51.4436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEBHek2rEiqoTEScw9G1isEkVrD6rQWDnKDxbP9H4azNT3iuToRehH+91HTAYsRaCUaEOf3wMz+y6Y/y0EWEoFX06Yg7fS9osAAaudnKZEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7596

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  memfd_test.c: In function 'mfd_fail_grow_write.part.0':
  memfd_test.c:685:13: warning: '<unknown>' may be used uninitialized
  [-Wmaybe-uninitialized]
    685 |         l = pwrite(fd, buf, mfd_def_size * 8, 0);
        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pwrite() is declared with attribute 'access (read_only, 2, 3)', so GCC
knows it reads from the buffer. malloc() returns uninitialized memory,
hence the warning. Use calloc() to zero-initialize the buffer. The
actual contents don't matter here since the test verifies that pwrite()
fails on a sealed memfd.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/memfd/memfd_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index 2ca07ea7202a..cdab3a837624 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -688,9 +688,9 @@ static void mfd_assert_grow_write(int fd)
 	if (hugetlbfs_test)
 		return;
 
-	buf = malloc(mfd_def_size * 8);
+	buf = calloc(1, mfd_def_size * 8);
 	if (!buf) {
-		printf("malloc(%zu) failed: %m\n", mfd_def_size * 8);
+		printf("calloc(1, %zu) failed: %m\n", mfd_def_size * 8);
 		abort();
 	}
 
-- 
2.54.0

