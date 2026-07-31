Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021087.outbound.protection.outlook.com [52.101.70.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C6489869;
	Fri, 31 Jul 2026 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493977; cv=fail; b=aD2504LpetT+abr1mRRhKUWe9it+UGXRlthT/iVek4D9p2Xdv3IMYAu7YCxiRvzgWDJtVyp7ZMYd2vcNjBGOj3EN25Odcp369oyGQSW1bZRh0LnelkmOvXDljeIL8bKT7GjIbO0pQGCrd4Fw3uDX1wx0GP1hnrCb7rKxkpCh8YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493977; c=relaxed/simple;
	bh=zhgNhyjZF21dEvUJPoWUjla9xEVy7kJ4hBe7cAbrkEg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G/QxWsByO6KwfJbpstJUPN7X+aX8VnRDBtsKh4rPg9iXxs2JFh37gj7YV4Jo16HUFghIQ9oj5cGHlZE4TElvJQCcMF+RXn0QCFqIUhKvciqclkz9WUHjemWeiza9t5JpFmmrDI60lqWRiV7zaJzcURKdrCpu0bClXyK4VdTIJfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=264kXBlM; arc=fail smtp.client-ip=52.101.70.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="264kXBlM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcXE7Ucn2vEXS1/IKGUbNNSN9NKJL+BBaB/otj88KzOUr1aM4IQUxgPX7D4MMajI5AnHiA/LHfbRoxhpuh56kryN9qcADd1/ZT5EU6fTcgxNbmO2Xjgkx8cbtimIOlGlJuXN7cJJor+vQ8ed81kEL1+cZd2VBRVRv2E31EQkmesKyjYANrUv2lXHOkMCX3O6zIDCoZDGoVBXyidk6lJH6yoE62M3JdCoLW3zTmo/n6zIYNmkwZdbuUkabN/nBaJgsjCWLd3FpZegLhL/p4r1bOoHcyXEeRtzyzwb8NTh/8upc7bNIm6EVSLcVtNlP+lHHkDEN8t7uIr7+Go4p3WJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5CdnS90GJoapfCr/cIwysRozdqU/hq4C6YfWvbEYIo=;
 b=dGZ2kDKPFv0lTL0X0RKu932D4YQuIuoEJzoCzDUiDKOgTuOHvdTTojM/iFGiSSIrvHU5bfmgvOe/JgRlm0yCpf2SREJY3jrE/j3zklSBFu69uHreTpLZkTu4WvYVOIzLtefBwOVF0eOPAuyYSanRt8yb1yJsWoDsNWKV9cgGmhWCHmXEl1f8Z2EdreURVkcr0Cx9Ik6U1BO3IVJoTNjbTG1Ziyb1MFA2Zb1jhee2FdkI7rCP2MYx+GDsgbCHyEQHQbGM0rUVSlD17Ioy22tTbp9g5Gv823Ag3APSmc1+bLbDf88gdaN5YaKQltfEIgDojemUoPfFnhmB258B9dFB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5CdnS90GJoapfCr/cIwysRozdqU/hq4C6YfWvbEYIo=;
 b=264kXBlMfHDOhUZaulCUHTwYYxS2c9RwVzI3taK9iyqwusP3yHLhRAGscMsxzUl8ms+59YphFSaMwAzFn7aL4e+32qliMnRpGsjJ7XJQCOhnRPeWCVCeU+RJbHnYy79aoxTH2ny3fVAj88AhLlcDPgajiQbsQZ1QupYScAUBk923zWKV4qfyy9YmGrYbcyvAAzYhzb3Na7f6cvMXnX5LUjJeJmXddRbU1OqzLF3D7IwsptXP/fOT8k/LkQdSOwBvQL79pyQ61g7sTzoRteinkOJBP33t/xK22EjrouYv8CASBANx8AarM0mZWdx7ciDNMgwDQljJrcuWx/zYcd3Crw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by GVXP192MB3042.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:285::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 10:32:31 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 10:32:31 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH] selftests/unprivileged-remount: Strip ST_VALID before flag sanity check
Date: Fri, 31 Jul 2026 12:32:00 +0200
Message-ID: <20260731103200.1015506-1-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0050.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::11) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|GVXP192MB3042:EE_
X-MS-Office365-Filtering-Correlation-Id: 75eff579-cf67-4965-1b29-08deeeef06ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|6133799003|10067099003|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xMKWO/RxYRZpJUK+a8WQgzVEvc/kg26Dr3QWOwvwavtmxvIF+INc4krcw3Q0cBiIFrsa1sbrKwW9aZwdWu09UJTbYUxNoKQYdNkgMDRnMC8VM/O/oglcOTKYOzraSTp3awp6zRNi2tfB10peHL6Vx7V36cHo+GgnjlSXbT2PX2cjnSwur1/pIhEt1KDc0Ys0iAV3RXkAsFhhcpKlqS8T6VUH5THKwCwAy15ZYazqtetqLohU8J21/paIeLX4qiRisKzujIiJluj6dnKiBF2BSkVJnPnLNnh3Nx8LK+GJcMgkoBzj1XaD1vQ9PFqYfFbjfQWu3WZVt7gjofj71FKQd/grvaH5IG8AZfPovdExLCamwbjMgpJMjkkRrpIOpBXWSIvbZ4uH98Fvxjrx5FY7FIP15ycjTGKIUjzFRy9cJnl43WcUgf1HyPY4BUtrOH8+brKuJdQnJQ5lHmw25V2twGfOhzl0Yc7ijjBJ4bg1B+zxwEcWtSQ2WLQXv82eqyBcb1voUp8N547gu8l633mevJu77QDl8GhGn7zCgEMzRU9ZwfZvCtbXWcCIOUuu1v9szHW1AS/v+yoR3xGLzPFavqfk6LtgMzW5WZqeX9d8rGJREH0ttSdiIu9NYRNyalug
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k0q5IKGUQpg7Jhs+kh+C1+5cpdxaKC64YHv7cQr4X1sB/UgSRuFolsP6YCTf?=
 =?us-ascii?Q?t+Jlfb/z8dLixBDJ2knOF1iHzBX8TFS2SoHJVdbOUoD3MnNqKkZLFLZ5gCIB?=
 =?us-ascii?Q?NxQCahc3K4G5C0pxZkvA1hQBcJeWNH2BLSAE3B7Mu2vzOa7W6ZnMG1LqacEI?=
 =?us-ascii?Q?YKufIGmHfggpI1Lp93tXeZurhZJURP/dX1lJa4Ej1us+RcsddQEaihpTRJCc?=
 =?us-ascii?Q?1DF/E9Xw7XWc7VwpGg3MbJb+qi5Uk9jsyFtvBhYCyi8rYyO0cosqiaMrtyaT?=
 =?us-ascii?Q?auewdcdEHNnUXoe4RVFaMOCG5vT/ZAf0pkk3E0hjYR5MTGjZJwz2nn1OkLz0?=
 =?us-ascii?Q?qBe93TFlEhzLd2GeVKEAvW27LFT7B2wHjOMXLd0r4CqCvbP9ZdlbOwx44qJ7?=
 =?us-ascii?Q?GPIH19YY4yRGB0vmOqROZZjD5c6ogzzXx4/9oiBupWhrOhg40eIsV/DxyGSE?=
 =?us-ascii?Q?yRdyoxLDOQmtFtt1ww/pQ4r2PqSU/pbwvkLfaOJsKM0hJlZAvVeYrtrB/VKi?=
 =?us-ascii?Q?osUODAC7CQQZ+p0pNzDThOwWjJdO22EKdBlwApf2l9qCOOGmZThEPifGsVv3?=
 =?us-ascii?Q?G/d0KLDxQysE+6uWSsX89q9Kj9KXiMw60wiuEekP8jvDZf+afJTIVoA/h8ey?=
 =?us-ascii?Q?vrUJCoR87TWoWk9MAlO0Tn5o3xlE+hJMtXNXKJgeCrD4gXNiCS05fMDfUKr+?=
 =?us-ascii?Q?Fbb7aFmGqG+DoylDGES1ZRdzf/8jC2GqMzZAaQ8TE1xqkaxAt7TLx7flgXaD?=
 =?us-ascii?Q?+8ulVYWFITnsupAMataxiQDHhxEPRKWOcuZVLXI91DJqYssN6GkeE3bc3ncT?=
 =?us-ascii?Q?dyLB9YkSxgVmFxe93XnDovNNIB7QMAEF1buUMS4CZTcLmOo3wDvwX4kzII6o?=
 =?us-ascii?Q?rdTubhfpgZI8Vq4O16Ble4/8WMCa+Ghi9BeUV+gagbgrJlI+CnM8vitfkzXe?=
 =?us-ascii?Q?zPG2hR3elyB4tQuWmHzvD9KUXZlxsm4/bdkIreLBcfcwxvymYA7su22CBCgu?=
 =?us-ascii?Q?6cL3cIr+qWr/0PRXyuQcfKJGASQA8ObmBlmiy/+B2EQzXib/4QnnOv1HwRLZ?=
 =?us-ascii?Q?z15dOUAO2vynfUutTeJ/39AnOO4hpiayEYJ4mEJPY86qkRIBWUZe1bK1QTpd?=
 =?us-ascii?Q?ENPpRFx8ljk4vTaN4rGDCxf2fdXtrfsimcjt2kqxrCrUM6Rx5y1DNtrttKxz?=
 =?us-ascii?Q?ncnqtLVt6MRYDR02WtqXMdiAPGZ+UldlpZpOfszA+uUFldh2lcHiHH+C+5kN?=
 =?us-ascii?Q?RnE73pj7B6cx6HRrbS0z5/yk8sTPbDUeVFAGorM5NTSfurnX/K3umQfscCoE?=
 =?us-ascii?Q?zE4Dc4mOUQTO55/dtm4DYFRm1jRt0VyfByqoELdNA045kShGMDea3fsdV8El?=
 =?us-ascii?Q?/hGHO9vLh7Pt0VS/SSstjiA2gpDJHdaW9mGzmWhijqSaVM5mEZA2c9pDtA0K?=
 =?us-ascii?Q?QjJ0ZB1bAnUPC+QsoyxUo6pl6TJItjcEWyF3y8hYIvjDrx3mhSLhc+CE7vMw?=
 =?us-ascii?Q?YAeZ/aW6WYR+Hin69qSMatwUohGud7lMw+nep/2gZar/ovjj4VB5GrwddnVT?=
 =?us-ascii?Q?7yEqMxcutifSthn8Ngw126ba/PLHaQh9MuETopIf0IUiojyXiZSDUO0RQsh3?=
 =?us-ascii?Q?YT3g3h26SgRN349/kboQPZJCx2ezzziWZgrsTm5ttffo4Nh1S/P/SUuO586q?=
 =?us-ascii?Q?/tDfpGN4KteNCiJHN3YucSIKyCHWjCGwXdrIBLy349F6Ap2XEAm7xD5a3ceX?=
 =?us-ascii?Q?zw4IGAmSEdmT/TkBlC0jfxgU3Hd/TN2U1QFurQdKTdBaovFzLP36pzZtKCZz?=
X-MS-Exchange-AntiSpam-MessageData-1:
	b3nOXoJbxL87eyK7ZRU18WdYjAY8OJHSh8jUCFwir8i6EwuwCLr/DBcr
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75eff579-cf67-4965-1b29-08deeeef06ec
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:32:31.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1V+Ke0MUbwgAWAWvaOyBR/zlcpBZyqk03gBK0C/f1+q0SW8PAsX9GBV/6PtsFuY0kufQMIPkVdmXvgAHljiCOGvwmxMywTYe7BwuVUouIMZGyS26drtWcReXFBTTp/r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB3042

Musl (and potentially other non-glibc C libraries) just copies the
statfs flags received from the kernel to the user [1]. This way,
ST_VALID may end up in the f_flags, a Linux-specific flag [2] that is
generally hidden from the user. The unprivileged-remout-test
fails when checking for unknown flags.

If we run on a non-glibc C library, strip ST_VALID before sanity
checking the flags.

Link: https://git.musl-libc.org/cgit/musl/tree/src/stat/statvfs.c#n40
Link: https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/sys_statvfs.h.html
Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 tools/testing/selftests/mount/unprivileged-remount-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
index d2917054fe3a..c7bbed313495 100644
--- a/tools/testing/selftests/mount/unprivileged-remount-test.c
+++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
@@ -45,6 +45,10 @@
 # define MS_STRICTATIME (1 << 24)
 #endif
 
+#ifndef ST_VALID
+# define ST_VALID (0x0020)
+#endif
+
 static void die(char *fmt, ...)
 {
 	va_list ap;
@@ -123,6 +127,9 @@ static int read_mnt_flags(const char *path)
 		die("statvfs of %s failed: %s\n",
 			path, strerror(errno));
 	}
+#ifndef __GLIBC__
+	stat.f_flag &= ~ST_VALID;
+#endif
 	if (stat.f_flag & ~(ST_RDONLY | ST_NOSUID | ST_NODEV | \
 			ST_NOEXEC | ST_NOATIME | ST_NODIRATIME | ST_RELATIME | \
 			ST_SYNCHRONOUS | ST_MANDLOCK)) {
-- 
2.47.3

