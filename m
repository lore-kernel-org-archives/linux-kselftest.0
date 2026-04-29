Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDE03D5223
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458541; cv=fail; b=qnGmsiVbpxJrcnDyvuTCaOAvLbcd5Gsn7duNTcITe9fyN6+G4g0SeAiX+T/KNwXwRAR8nYBg/i6VEv4tmxR+a2D7gD4duAf6FJyKPpu6G4W/3YuDcbf5uex/UgMvWC6Qn4RfOsrKQ+KSCCJ9/Za6gzrPkhIUr0O7RxvTG8OHcSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458541; c=relaxed/simple;
	bh=5yKi6bpZLGijn/SlXcnq3KsxzKdlFR85OKSA9WxY/Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=If4u7guBTgbWTengZhxomjDAp1EEh4+R3GjVJYYaJEbaXoVqobTKooJJ4J3bp5sUbB9hzdxtDLZ2Ao7AbBEif+XS+zcHC7CweIkjqLhwin4GNUyA/njwyyLa/yOruemo0YKi4Lz+/MtS5P3/v4HVeNFrXjsnlIIvGDqKQs6LKGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=KWOP2uuR; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="KWOP2uuR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9jCDXX+Krf280QwGOGNasuOj4MFzWY5HgsHvfxtacs9FUBLe0Gm2ZJ4XcX9r0fBxi+dbHmfgv811GnfLiyE9+e4/oB2PZnAOiRoDhTVlgOYjS7E4G8qlhgr4xgBMbg2wu1Ubio3pQdmIk+3xJ+hOVRGmP3Ne2Z3ppNrAZwd/w96r4hL2XxDcVVcYcv2ye3WGB4+2xceQzkXmMNb1SF5hzT7R184+mCoARarEGJaHB9AB7ZT6qw7OsMsbwI/IwL6bFK60Hc8+EQ6zZEjiMl0fj/BmjaNPvj6Ewl/qEYh6QaWq21V9hwjn8OiBllbYOJuFImN4+FVIdhMdb7oscvsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPgs6Mk+D5g0THe7q64QKz5HtVRgxEyX/PKic5JC2Kc=;
 b=ESfoom4RYKevOGwApFoeZoY5ZWNEIlgp6WhsHaetlbdGNpjQeENGTivgrfp9fxv6vWDSo9mcSfc7zFtwflcCZMQQOcHKAyX3BNhrGT4odMkQsf8uKfYliAyniHMrKq2jmT5olh/QQu1hvM6X8UbiJTJ/ud/17vW5pf8ntqMsPTajaIYFA2GWQkBFE6MEak3pLmh+jVWaKIoVGXRShiHUm+Fy9jCf1lifsHgMPveUekMCdNS+6Nj9v8QOKI715NnC31soVlciVLr6sn89xdUTYSlHgfIOKBbT+V0mJJrvSzMtMNYbQKkjthrKCw2PX24ZyfEyUgUb9cCrlj05nhkR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPgs6Mk+D5g0THe7q64QKz5HtVRgxEyX/PKic5JC2Kc=;
 b=KWOP2uuRRI7d7piFPTVt2KFxl0UOmMiIyfpL+IgOry3uJwbi3jAfnaK47Us2uXZsTATvudZzXS8qEY7WK6gd49jmXe2LOmuJ3vZ9pkwnRG8qAYEaqUyeFzfUWJRy4K/YyZwWF1G4T05HeT2C+qG5qw3rUo6VewxG9MRyaj/GaE1Ftd1BUSBH+wNthaLbKHpTs4/ixEbCYXdcf3n+nbpgbQBgCcWvYLxd/akslXDDOQX05jF09cdOasXHPsTuw4+Qt0Fvrd2+AMTlOMF4iKDFmfWY/DA3E3oFagLvCKP9/ojDEmV5qVq1viER1Ta7xK0qKZ13blqNot0mWkrmoT2r1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:38 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:37 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 07/15] selftests/memfd: fix -Wmaybe-uninitialized warning in memfd_test
Date: Wed, 29 Apr 2026 13:28:03 +0300
Message-ID: <20260429102811.47214-8-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: b31ddbd5-cc17-4e7e-3ff6-08dea5da1211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	twtdA31WqaZPLmlK9wl2pRS6FBuyegy4I6MDP3YO+86bVwaIUSHG+tbKVaj6A6gO7CDCxJcUxGT+j/QN6+N59fUktMEHSfV7XzxDTwo19hpRGm1wgeqnugdEcswExLfp9R+WoHCe0HrFHoruszPyxUtSBw1MoNoa9NM7gSmBpqU97ZhziKYImyfQVGUD/gcFSTQheGsZUfNwdu1kKNNVQs9mi8aPbkANvaFOThod0TIu3yvmGJUsk0B5iHRCRZdKZICwBAozwBdqCZe3utcITG+hzra6hhtx9FsYi5wsD7WECpZJX2zPNtRQyt4bXrEDfLFtHro4pQOzKJs8U1eKU/zXxgwNJklTpvGR5m4hzMCq/dhbN9ImawxZo+WI7y65WQBnt1SYzXrKB91PnB7FLQCvV2o/9CiTuA621952D3Fi1+SjKqpFujSsh9GErLshSGvhCRkOGIZtzAn6ok1K0c+7c4Gh8iEsLCz69h5TUYh1QcqK+X2pbp7TFV9XxnrBDDNHI4RCNBJn5r01DAf1/z7MdXgOtfDuZvCfGkU2XMaiqWvgrm0sKcRWgUUF45Fpyg3mtqWkm0MxM4VqOP5+tm01Vv9vlrYBnzT863fhOlMXse0ji11TlaB9/phaZ/t2xQwyzKWlijycGMSjR9CZjsya7LSo741iS1c/GiuAgAXxZ1E8N0vEOP4I6BGoiY8KQJ5V3H/crrwg2tUlmyPv0EbIiMeZeRlLu2KatTOmd2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cdA9potzLCl+Dqdb/FZbMRteFFX52lAAGb2HklDsYhcJUxpUcSlJvSimuthR?=
 =?us-ascii?Q?rJjxAj7isoiSy6WtirVWX7VjBjozvyqYBuw/A4uPmSOC/ElFH+2IRmWe2g16?=
 =?us-ascii?Q?GwMoESOEw/aAEiVyLRB4/1FVdGpMHMv3x58DVHFNafhqLogMAqCO8hqA3d9j?=
 =?us-ascii?Q?naRut3Tcf/RPAfcOKiG2E9XWpbnZq/6km9xIyGtjmBOIg6EZf0k3ReP5oQAM?=
 =?us-ascii?Q?C2qh/0Tnund+QqGW40eOz/2v+/g0BRDTRye3+HFAqOqtOXpEV+PuPhYHVKVd?=
 =?us-ascii?Q?v+IFQVfHOG7KDfZHpc1Fhkus2Q3vEwkNk2f9bHxBqF4GkepHD47OVyNPCyTu?=
 =?us-ascii?Q?+IBPkLoMyRlFf998kI7hVV0kUh3j1abrCt2AeicRS9nyDp/IRaGnva9NGrrq?=
 =?us-ascii?Q?8vC92rTAcE22j93SSvxHLWsInMWVMgrRFrUL8rqFfJ5A48Px+yk6EfYgDP+2?=
 =?us-ascii?Q?neJVm0w9cByLHedLiGjlNUkGv5xIVnv8+SCFO3rkJPGeAHrqyDPwViRsEqZN?=
 =?us-ascii?Q?gFMCXDCB8FVKFeAVmScU7VwnR4fG6OWOcli8gvcyRgb2uI16INTsANsBsLIJ?=
 =?us-ascii?Q?evIJJKbNw/OSdvTkh1SUh2z8AJApDw0OKZe2v/hlr4AyTDXno6dVN3mKdomd?=
 =?us-ascii?Q?W5X3MFhZka8KoASfgZM3gQXT0qcc/OZRXBkpjK+vt1pzpVIESP8INzgF5vTi?=
 =?us-ascii?Q?pqPbPLuK2T42DE8+wlNCsDRDVPJcQlNoqhI46QifKPaPKvrnqPFuiqUmWkdA?=
 =?us-ascii?Q?kZrOALOUqe2HIAbnflkMIMeE2FGJEfT00GyktVmJ3J6vRngI3m5Qp8Txrc+f?=
 =?us-ascii?Q?i8OZZLwJvUCf7iG7xo9jhjUJ3aO6PMSUkl7wPtsM7UKKyuoaf1A089Yrdg3p?=
 =?us-ascii?Q?cItuE4AaeCMwEVTMUCha9C84gkkWrM5AHe6iRI8/zGDZPQ+R0Uf8cgUiBfRH?=
 =?us-ascii?Q?5r4sTp6nQU/qGV6tteYqDne7vxKGp4pkoFAH41g6NZc8dR6YQhO5xVNfejmo?=
 =?us-ascii?Q?fZUN3KCVI9g6DTJsdQKZOclcI0xRgZVatmESzFyviGih5QDkRgNi/Ztax6SY?=
 =?us-ascii?Q?KmNChOEcPmD2eMPSznK+86jhNcZBgqa1FHXvFYKlm6GmEGOMlLFMmeKTPf4r?=
 =?us-ascii?Q?B1Q3HWOAdtbCSTs98XVSUYdTabh7HBvyU7LDXOIryHKjSCqN3S0db9Je0JHd?=
 =?us-ascii?Q?2JbyWe1iwYLOp21vu3BYQeonqGo0yIoIlR+lQlm+tG7Cw7luFQ8zHDs2p5zJ?=
 =?us-ascii?Q?VI3HEm8QIMCQ26MyqlQzmbKGn9mKDIpLYnbjSI5GCkcDBlgogZPY/DvLrlP6?=
 =?us-ascii?Q?+zNWa1bEoLZrFHYZfGUeGx4M2/oZafSDVwMHy7jnsO+6Bk6QTV/PY6Jy0wr8?=
 =?us-ascii?Q?hJwdF6UXZYX26oQ4E1BbfgButiERl7BTQAXSPLjTKY6wq9xLFU/EHx6ixhsD?=
 =?us-ascii?Q?bCdhwnyob0GumZe4XjxYi2i6PMNDowIBPAqHfx4rxfPhA/wkEONXZy7Epf7L?=
 =?us-ascii?Q?B6aQ+gMo70oKg2y/vU0ZALpqepKKnsczuTWNlpHc0ybffZayaZsNExRMZ8A9?=
 =?us-ascii?Q?r0b9evhah0XnYOOlvlmOaE7nGWz9Ml6PLSmlKqjfQ7GRGnpGFYDjoD2IQ48N?=
 =?us-ascii?Q?Sn7xgIv9gJOi65SmeDBAnqVPvtTOaPGZ43/b0oWKQsTC4qjXlOom7zbDbHd2?=
 =?us-ascii?Q?dFYxbrWr5vrbK3ksV+ZOaJZss06VCtFlgHb6v9Q8XBYuDUE0Z4xOT2JGRpBx?=
 =?us-ascii?Q?H7vxtB1f/bIr8KiM0PvuEw3YGAM1Za0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31ddbd5-cc17-4e7e-3ff6-08dea5da1211
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:36.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR20mKUTPk1XIdytxy74hCQ39Ihid8zpq5pGUt+yK8eARIteUYNI2mKLGTfF+O9gTi35ORKqeWMOT9DlxI+cMiUtphRqSbuVF8187gKX2V8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

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

