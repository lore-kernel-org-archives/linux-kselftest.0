Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023137.outbound.protection.outlook.com [40.107.162.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040F3DA7DB
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458530; cv=fail; b=ZsK6XSAFUWfNMUQyz9Oz4oHahuDS1VHy3Sh8PXGZtZI608bXXgbHN9uHwj4rWnAqJJZRhuRntN4to42PA9ZVHaxkTB/uzKnUU1jG113I8glCXDAhpt/9XlsSpZdVUrIoe5UUPCyeJq+zSnSdy7qb5Fi/Ohm8CsfwjdE1HszTC1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458530; c=relaxed/simple;
	bh=Q+TChONOEkkgmbtctdpfsxBlUXChgfNchan/XFBvshU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HxXwi95UOVml9t9nlJA5+Uhb1Ziujhy2ysyTCnZ+a0CtIci/t8zRcpG4ZtjUpL7+zwcdBx1ivpqNCrkWM5P/m3ckze03YKmE/TJSaKaCF69quJrXqoND+6r20Q0s329OETtqiwBCSQJ00ISu+pjvK1EEsV9yq7YnX/qzj+Yd2m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=DFSOiEKu; arc=fail smtp.client-ip=40.107.162.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="DFSOiEKu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkbSI5KbIXMDPeOSSgB00TT2e+AXschdc1BYshZoxUZer4FOsJACe3Ui2rDibJ13bjqynnOGchY51lVX2kByD2vqK+nIBf/hQIW4IuBvinYivAncJqxdFzdZhzL6KetihOrp5ObPciWs7EI/AmG54s2afq0MyPtX4JzfhWXmUz7ootQuz8N3EuJwa3jt+6QPdedKkx15x2hbdNF0hHSROtd8lbfjBdswP6mwDso1hH1kCYcFBJsMCXq2MsI/L743XKfpwRp79trWBsQlGyEaqTXmNn/hICxojPDP8fpTJN07DAu8vRWIHsQrlMwlBZGIBKK29opPjz0i4vaefEbW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=750JdK7LpoaeUzwR57Wp0AYA3GJc5czvOYYbXdodHF0=;
 b=b9rQIwIcvlNItkDuECkb3vJdRGHWqRpnUFRiRFc8iONf+3A1LGAxm6OVFwL1MrBnCXLKN7MmDMbb3bjO3HMFV8K8RY/lFPRRHG9kdufUwm5jebkhdeXgAN1HpjpugnE1YjFc/TwPOxLKO+bOWIqCMIaK7PMHT5AB2jE1NXq2qjjZAHNxaC42QGxKoSoTDChwfyTc3aVbn/GUvGxyKUe5f+bM7kzLkl7cj+ZLqG1+YojHI4URFdO7X1FVWcL/TXPqFBwjMZrGovQJXMjb1iUip0gxvfvcO8npxBcfL6IKvd8paI2J1g9UJlXsy2Sb6IV+OPzD1WSbD8ejhSNGSDTmhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=750JdK7LpoaeUzwR57Wp0AYA3GJc5czvOYYbXdodHF0=;
 b=DFSOiEKuIqlOw9itiZ86fAw7dU1o5kNMbkIWE/tbT6g+DNhR8ZMipwSvciBFB/CSbwtbdahVNM/8LNJo8wSgSohrVYHO82MADDo0RyVqZAvzzrX7GMbRk+sLiDB6hbaf0FBi0lllQ12dgbXeh+nXqTNWqLfE+L8lFPYPdq7uukYx5eP9lzylsXlN+qp/ggKbyAAZQa+sDTLGW3id6bd3GgfhKT0mRGxJNzDGNFrnCIH5CSixnMRD5zuPudPvrZNcIqQXMJ/FKnhnYHGVjWybWDYF3pJ9jj/LY4TOCq8AOHN90uxuwOfachVzvsj5//wcXc/5XsH8V6SlhEB3AB/LJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:33 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:33 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 03/15] selftests/netfilter: remove unused variables in conntrack_dump_flush
Date: Wed, 29 Apr 2026 13:27:59 +0300
Message-ID: <20260429102811.47214-4-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
References: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|DU4PR08MB11078:EE_
X-MS-Office365-Filtering-Correlation-Id: f048c209-21d1-4254-a928-08dea5da0ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jNE79l7cFOtTz+dNCBBvz1GAjGIK9nHMzOUhPrhEYE6JioHqMVbGLppM5o5Ovur2rINcerjo3bdwaz1bDQZD/8Z3K4AevmitEn4G7v9KtVLOhd+qOMfxMaGmaN1gK0gH2YQPoQjjLFri7XD6KyA2I9BGaoLlqRCOVSRBoqrgH7hAHNPghf0pvuRg2GKfxRmUDRpK0PKEqp5L2BgJLKPZtn0DeDfjM7dPEAkLVUKghrPwjOVwDkLhXYUWjAKTepKIimLsw1Gf2Pk1Q4AL+SEr/LWcDjGmckxO5nangDJFDsYfm1SDsP+pdag3WSW8haEIfhL8WUCnfV4D+AeFH9vh+gNJO3sk5G1JT+6F4SVsEp85ZrjbtZJBPMiIavNgL+f42n4HqVfpEfOO/3bObo4vbgg2vMypdfpVuYOfCGOd0GqXNomma2u3Hon9HeiAAB87PZZ9ZlloXgnEtgeP3zSJjFI0rviOzLHgHd94f81h6EFvjrlStdlXD312GwDkCKeHWDA0YRU24Px5f4fVKoID+CFsugoGjpJWdMk8xrBGaDrfDcj2mfqnf3TshT/j30/JBEIKM2H2npBrrFgoyueucq6cnlUQj5Gy+UDr51pAouXorA2X7Gz7WtLKpv4Dy4J9+TcjHeMEOc/LVG3kXw8ahiuhaYvij8zOk8jB+46ncx+0kcNnKCjNs3iSl5eYKCm1EpU1HIVITqaJ4SNnvNxpMoEM6seB7NKco0KqcIUX8vc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HKiF1kbuHuWARvSicRfYdVnFScs87KEr0XuhRrlUemF84bFUWqmBD/wi38kU?=
 =?us-ascii?Q?GfNJxyYMGcgXNAxSssTEUkLUMCa0rJCeDPmDTMN95f9Blo/z4GxIhMcztFZv?=
 =?us-ascii?Q?AQfaGzy2qSGXTF2xwLyBFshdAwtUJjBkq5/8oVvcNQtqlNPO4Ioon7aXT8xE?=
 =?us-ascii?Q?rlRh3a3eEttfQoI+fiTpiO6uQYuv3lbVt0886e8CMYQc+G0H1huE9DnU0ZPR?=
 =?us-ascii?Q?PfQnnm9Cx8cTukiSB9zUNQFZo7Vh61h32wXEBFbeRslvk4dDkwgBoVBoG5yC?=
 =?us-ascii?Q?nGotlntr/D8Atp+w19nGAs+R/lwqQOqZd24L9pXbacq51kf3pnCgQPZDgZwQ?=
 =?us-ascii?Q?4zfyTdfx+WEoiccCmOQ1LnAdU/+y/40EVBEU6hI+o2ubw/BDyzRGkyXGBR7k?=
 =?us-ascii?Q?qpP6GM1oPvX/14OnKNHP7gRayaoOfu4o8SE5Y4Me+07qC1nR+oxiBqJ23o7A?=
 =?us-ascii?Q?wgCsyS1QHrdIk8Jzb8bS2byRGtpzeIwZ9deAxOiAENfJPMuNOtBJxEoyrXAO?=
 =?us-ascii?Q?JD6xLeah/KIzG1WHikRHyH8CgXz4iKFNW5Pzxy9dBXW4pVc+soDm99V7Fx0C?=
 =?us-ascii?Q?VG6/xcrrhxcLti8m2XHiYjP9ZEwUnfMHnbDaOYY68DQi6ToKvViZ0naxyJZi?=
 =?us-ascii?Q?cFj2keF3RzBJKr4dx/qg58GkxYolRcM7Gdr8zp0sJadwX/i/bAiS9uyjnWBh?=
 =?us-ascii?Q?1wHp9UuyRSFYWn05GxTKcwE3eW7Xcz2bTDHBTIZkwJ9vu+8bR+hIaTb+kT8l?=
 =?us-ascii?Q?XNgZp8tKbMaV+K56w+zZKwdDtbRr0aeynBO1uNkwKSFexLXVhJvCZ94H6lOd?=
 =?us-ascii?Q?hRe36+x7qLWXvGAoK016RNQt5jVQ40KOBVBtCrc9XXh7o/YmHNm/o32lJxil?=
 =?us-ascii?Q?3/yT+7bSrfBqmAbb99cxyqVYHMPZxQsdDxhb0do6hmbFS/yZsLjNU4ge3d4S?=
 =?us-ascii?Q?sWEGv1J7orpEKQIMIEz4cZIiGbWUW3ni75AMbh3C16AllolVUs9o+rSvvcqO?=
 =?us-ascii?Q?SGWVln+VXy0L1zGMNLPb0sOd6atRxmzIki0Yj7x5nFLEOurPvD4ZdebEyLzN?=
 =?us-ascii?Q?Hf3+zrRCfZJcw2dTh7VOZwssdo8OAJUqeIbvDzC9QIgKBQUjt/cLgN5DkICk?=
 =?us-ascii?Q?q8HaTYYVAiKpZNTe433bprXl6u2K/aoE3D7NMZvAXgUvlPya4M0nrfIfOeXP?=
 =?us-ascii?Q?htAGM06wki/S/zjuQdWRqhpO6lbB8RTRISBNV1KjznrSbnD3Amfwk+qfd1ZJ?=
 =?us-ascii?Q?SD63lSOnZlndcO0k3dE9Dl6AsAKhxOMjKNwzertrBM0Go18ZPtLU2NNBKxm4?=
 =?us-ascii?Q?AeK2oPuVy2ksLCqH/Gk7UVLXXWP723PfKNYLFaIxnWqZzrMXBrkVdMfexU61?=
 =?us-ascii?Q?sBT8DYF0refsk/D+ZlQmGpCSYUvTLWYV47XosVmtGUTXiLRdDT7zJboF55Hf?=
 =?us-ascii?Q?GpQVSNVNimw4NX2ytE2TvgeThNu2hBXras2n8AMzoJjY8xlxizBKX/WbDhsq?=
 =?us-ascii?Q?sY8RpM9o0nX+STyZ5cfeP/bHRnYIrLw9U3TeTQ9NmNOfjHBhsrpEc8ixi8BZ?=
 =?us-ascii?Q?+pUjM+1/YkueR5GjnbOoELKPHCp9QXMfX+XOIUKWqsCsj1uc+el5vDDQQo3s?=
 =?us-ascii?Q?VeRTeqXxqyIQjlXPrmMQGBuuoI/WrxIV7bY3PwkRNfEFStnJBPgaiG8T62gY?=
 =?us-ascii?Q?8J8qxTv07I1b9n5EmmnZzfor6PGt1tz/0/P2eOI17+/UQ508VO5ZSqkZmcmj?=
 =?us-ascii?Q?bySpJvyTXb+I2cApDWQBfQAoymImEvo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f048c209-21d1-4254-a928-08dea5da0ff7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:32.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuKMahkbmM+HMrMGJBQIBrpOoNTBOFHjHiAXcsRvq/4bm9SNmoDmlZEirzQgZr/3/VDIvvyumt9azvN3y/8hMnqtSeNqbuFsvM5eL6LY6Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  conntrack_dump_flush.c: In function 'conntrack_data_insert':
  conntrack_dump_flush.c:105:26: warning: unused variable 'rplnlh'
  [-Wunused-variable]
    105 |         struct nlmsghdr *rplnlh;
        |                          ^~~~~~
  conntrack_dump_flush.c: In function 'conntracK_count_zone':
  conntrack_dump_flush.c:224:24: warning: unused variable 'nest'
  [-Wunused-variable]
    224 |         struct nlattr *nest;
        |                        ^~~~
  conntrack_dump_flush.c:222:32: warning: unused variable 'rplnlh'
  [-Wunused-variable]
    222 |         struct nlmsghdr *nlh, *rplnlh;
        |                                ^~~~~~
  conntrack_dump_flush.c: In function 'conntrack_flush_zone':
  conntrack_dump_flush.c:271:24: warning: unused variable 'nest'
  [-Wunused-variable]
    271 |         struct nlattr *nest;
        |                        ^~~~
  conntrack_dump_flush.c:269:32: warning: unused variable 'rplnlh'
  [-Wunused-variable]
    269 |         struct nlmsghdr *nlh, *rplnlh;
        |                                ^~~~~~

Remove unused 'rplnlh' and 'nest' variables from conntrack_data_insert(),
conntracK_count_zone() and conntrack_flush_zone() to fix -Wunused-variable
warnings.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 .../testing/selftests/net/netfilter/conntrack_dump_flush.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c b/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
index 5cecb8a1bc94..c8e4794ec5cb 100644
--- a/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
+++ b/tools/testing/selftests/net/netfilter/conntrack_dump_flush.c
@@ -102,7 +102,6 @@ static int conntrack_data_insert(struct mnl_socket *sock, struct nlmsghdr *nlh,
 				 uint16_t zone)
 {
 	char buf[MNL_SOCKET_BUFFER_SIZE];
-	struct nlmsghdr *rplnlh;
 	unsigned int portid;
 	int ret;
 
@@ -219,9 +218,8 @@ static int count_entries(const struct nlmsghdr *nlh, void *data)
 static int conntracK_count_zone(struct mnl_socket *sock, uint16_t zone)
 {
 	char buf[MNL_SOCKET_BUFFER_SIZE];
-	struct nlmsghdr *nlh, *rplnlh;
+	struct nlmsghdr *nlh;
 	struct nfgenmsg *nfh;
-	struct nlattr *nest;
 	unsigned int portid;
 	int ret;
 
@@ -266,9 +264,8 @@ static int conntracK_count_zone(struct mnl_socket *sock, uint16_t zone)
 static int conntrack_flush_zone(struct mnl_socket *sock, uint16_t zone)
 {
 	char buf[MNL_SOCKET_BUFFER_SIZE];
-	struct nlmsghdr *nlh, *rplnlh;
+	struct nlmsghdr *nlh;
 	struct nfgenmsg *nfh;
-	struct nlattr *nest;
 	unsigned int portid;
 	int ret;
 
-- 
2.54.0

