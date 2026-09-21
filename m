Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302B46EF75;
	Mon, 21 Sep 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983782; cv=fail; b=ldUJAK0cbx/u38crksE986Z3FaohoK7DV1/m0Xwow/bgo+qn5JSuVh3PLXgzVIXmyWLdpRFQkh8PMrBA4ta0hR03tTGN3UUE7pAbyVb08SwEIT+ee31PZs3ymiV66p9HSlAhFeIUnl80NdHGHhIbHchmDScsRfdeUw5NX18ePAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983782; c=relaxed/simple;
	bh=SHIIZIaxbxffiPRh9YHTS2IoR6vbgvShVuwkakjg3nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KhJh1H8+/H9wNrtwkpvqqHpd2Vjkc7Ut5IMQLTtGZLAJD560B+bS+VabtN5RM9nW4m2Gnk6houWtr+gQqxbPpHSPUvTXQj1FPA1QnX3EINSuFIZ7QtYkmTBvXXgJm9Y6Gxdfkv2+z8qmWgQ13TFjERlJhgovqPzC0TLI3netDRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NU4DlasR; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NU4DlasR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omJHQjpZPe3VIGqbjMTA7WrokK8nwW0sI9ltsgEo0yNeg2aWRVn40F/alSwT1y7hAqzKCmLwcRwTu10uBR3MWkjPmKxeRuaEJn7TOijV41Vekmc/YuArZE7iT9E5I7S4pcEfsNJtIrpcjPUh9xCDHahVpCaHiJaL5ssQQPpUGyaO9Kxsg8oa4S1R0cG6NFDK95htOFyh5/TTNOr/5bfu+7dgp+Sdsx5cRldHzGItkdRBF/9Tgs16dC9MOLwlu1/XtIDyZFw2G11Xe2hAY1bq1ONQeHOHu7BkHoy9dPeOS5e+T7o726d8wVbHUB4X2htoLcFeL9vXpOwhp7hnrYhUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bP4dyaFq/MBjFyeK1+sF4xLpS8TtuO2apA2hhInUEE=;
 b=TLgcIBblq5ydNgnIU5Kq77DbHtTYLcXq6jskjrrM3gGKDNYmC0CxVV/xz6roRXXsiL5jipsYZT8ANEXlRb9zRhGoLbNWKLgWqbHOqZ9kDsAnLvBvO7DhSohABfXVJYIbdkZeIMbqSXPYQ7E0DOnvITcO9fpfJI7zMERUVRAFx7XW689YNkTavteTTqFWhSTngKDRusMvuwz+920fGiid0rZNG5wsgfAnbDNq4tvJCmdtlGGU0eA+aedndcmFPEccqlDABckeFs70gIP53W+ezjQafiEDQrzf00GKc2obbXXCJQYSZAd7yQwU9OqpQWMTyw/kqONOSJGtK+zOTh5Rjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bP4dyaFq/MBjFyeK1+sF4xLpS8TtuO2apA2hhInUEE=;
 b=NU4DlasRDOuJvrOKutMPXhNXfWLhVH7aQ5rNbLj85pVaPqepZoLiZQFe88LCSIc0p5kEZeE/KYxFIX2O2n8+NozZ+9vN7+UvkMjh2ZTYjgkes2/F72hDywZ9MNYIsQX5By/kQWobI7FMvI0Czc6/PhwG9fMR2IwrSfxhFNDbcm/CIxiwXwuzEm0+FjrGDKkvLBV/GeCyvWWWyCkXAPuNwrYC6f8xU4pwxuxh+k+75wqMabKKDz6pIa8xJsYTq57LtxoqTvdty1+cEtLwH0kklnknBoTgvHQ6xPEAMsWEIeArZRN5zTSFFh8V0GITpI97EXJt3fPTvv8ntTQD8vgL7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA5PPF8DEAB7A29.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 09:42:58 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%7]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 09:42:58 +0000
From: Richard Cheng <icheng@nvidia.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	kobak@nvidia.com,
	kaihengf@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [RFC PATCH 1/2] mm/gup_test: Track long-term pins per open file
Date: Mon, 21 Sep 2026 17:42:42 +0800
Message-ID: <20260921094243.64698-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921094243.64698-1-icheng@nvidia.com>
References: <20260921094243.64698-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0006.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::6)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA5PPF8DEAB7A29:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d455c18-5d21-4c7f-503b-08df17c4b808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TXjS6Kx834XHkMUBiA6GSfWBjpDyVM5WmDMGoxAzcLZ4327m7mhwGtIhX3ISEWF03F64Ch+CNBsVpuDnRIN9ShTXRFGylGQrmYhZeFve+RVd03SiKaKfSQGe++lXe7mm6FqEscQRINQqbVhlXPsCv5X5yhCTVkRBPvzrz3Z6poH2+NT4X9LYofZeeUv6j7cIt7nPxSdwNApuWg1sUBzkMjaTWSWYrrASxDUAMFi2glDKPiI1fHtHuuK3v1asm6mGs5x+5QDEPoK81AB606d7F8fk3CszPbBGfuhbXbQ+5XHs798TyfpYnYSKHXvTirsiqztwt011pWAlyDlWsvsM36j7NiE0/4oaq/X3nElsA9blztXcCiKn8nAcjFMOo5cEupGQOhoyAI1I+eIYwI/pnW0eKxcUj5+vBSul+nAL8VW4EOvtvDoAAmyPDhR1vOwOgUmpMmlktp65RsUXId7JeXJ78MG6mzb+sGz4eXn6KgJ5bPJPMoJDQeyn2qi4RApm1mk54+8PhxFTMzZaIEDIy2ogPEffR83NbcmhID/JpWfKNTwFttNNXHwBoof0NBNceTo7VvQIkqaAZl/peUdO6GbvOb9HoBxenlikOn+S5SXsEGpBKy1RxmtKgFgwiB5ZhMfO3wSjbRjQiFiFtEPkscaQa4Fv4PnqubG4N51lOu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?69u1okdOX4xtc4N+040HOn+GVbuBYM2SFI8beEKJQvK0HSmn4lCXe5Iis5Rf?=
 =?us-ascii?Q?Bq2ubGda0jNZMr4WQP8G7nSFu2m+4KF8K2L5Dn4QNKc3dp8vyMEzVyEt8557?=
 =?us-ascii?Q?6OSkcLXe7/Jdt8VnYsYFuv9m9THcUFSr3L88mkynufZHaHPhFuwWqVeukK+T?=
 =?us-ascii?Q?KBirr3zvI8ZfpreE7NmNb4izzr/7iWMPLKAmkzGU8vmpoVq/CYpvoUP7/aHl?=
 =?us-ascii?Q?vJaIfWdDsvW5A3shQzsKNR/XlgJHRf5p+J3AP8f+KNjNeTZaarG/uiDGdnea?=
 =?us-ascii?Q?GPkQvTpKLlcYj1c9Zzynhq9SSmwK/JJN9pfYqw32WhEdDSCfNlceo8WIF+qD?=
 =?us-ascii?Q?ljB5yNRnuuhoQcnKpW2jbpk63tGrpHIi22Ikh5dOhSVDHJKzMzo7+RJ/VTDG?=
 =?us-ascii?Q?EGcYc04avQE1BG3l+j6/WyHvbi2WKntQ9gNypAWeD1vh9nTTqoBB7ABXug3L?=
 =?us-ascii?Q?xe8T6JYejHdSiJqGg6Jde9m3KWdcjboN1RUGrPibGHtrWtnIqZqWUKv71jC5?=
 =?us-ascii?Q?NSx6pxf9imeH0gtJh/muCyW2TSu6w4WedpywZRbWtDt70cL9BHoopy6Y7r8s?=
 =?us-ascii?Q?4jcvEL2LAJfjn9nHlKX+UHmRE/ZrUl84HrIA/DRgz7aGcFJba9u2czg5GCOL?=
 =?us-ascii?Q?6DIV1IJfwFzUFJTsLElysdn1HR7TXw/31oDvkP78kh9GgxeCMzm1lwHaR2zM?=
 =?us-ascii?Q?FFVx4dtoV8kdjsfCZCNmE2eSp8XCBQZLR1ACwq/389Xb10BuQPlTRjnjaFIe?=
 =?us-ascii?Q?lCWHUZe9VoSyKt9FZ3bh6ZWtQWtbjNjD/W+aXb3L54hqnv3ORGyhwiOuTTbe?=
 =?us-ascii?Q?Dh1AdZdG5EpxK56myUmoniqrhnq+AztWn8wEptQFsp4+pTZhDHi08GzHhbIV?=
 =?us-ascii?Q?LCWKJFYFli27KAZGqbK8xnyoz9OFRDikVdattU/3w80GL1yVqZlkD/mHwkEq?=
 =?us-ascii?Q?B2krbUVHFEvVamn3GvnEr51pcmCKBiCH+Rfz8BUmW3OhiqIRRoXq/2FwRZi/?=
 =?us-ascii?Q?fBeBhZgQ+fStnRcewun0lAdFmJ/eYKZd6K+P/VVNkyee5n/Pq53bQ1fUroY6?=
 =?us-ascii?Q?7puGYUcVPIPmhON4vszcIXlo3QgS3uUcrnqPaIwaRbX5kLuvg5SJ1daFtmk0?=
 =?us-ascii?Q?VE7QV6e7Oy10WxApwVv5iWqdryvDFmHyZIKOijRXW2UcZk8k9ejI8KN7b0Ax?=
 =?us-ascii?Q?5bcsAuy67/EWfNqIijJ4LlHRYzA/4XnEcGmW8bIThL5blle94Niaso+yIyQb?=
 =?us-ascii?Q?IlCgg0LKy+NTgK28z+pPYrevgKZzQ+G1E04IpxS/kKtIoafVF4pD1LF3YtoV?=
 =?us-ascii?Q?RagbVoLOCHj1qBig2LDnQ9VKFNlXSobRah35+ZTXSLJgPrmnZ1loy2F+k6Pl?=
 =?us-ascii?Q?qrvc9xri3f5QPtfNmJafnW4bGvO9Pnl1w73kMH+EMi4p80m6hyVcSa1QjaF0?=
 =?us-ascii?Q?nYMqLRdw3XEvMbJjZkor7mVH7ez8L5APc0lM6Hff/eBaWxob5ZHxYz4z8Dc2?=
 =?us-ascii?Q?+s3Tv21/+WgZBFnkV6WiM9rUXeTFGzJRCjYNa/CGx7bUxk4CAt7vvOwl4Wvd?=
 =?us-ascii?Q?G6ssuQw90y0n+fVx49wZpHglbV/cKre8Np5xMBp4SHh5UiMCTKRxqV5M6mhh?=
 =?us-ascii?Q?BVVPL1QFvHBa+6VDeuZJNhBc3vnGq1+pRvBurC4xRyjvRPexTCBFAd94jZR6?=
 =?us-ascii?Q?4Vpky8Kvr2R0s78jyFwJSzXP4BJfzJR8VvGh909XOt1yRunQ0yTQgCHz0nlN?=
 =?us-ascii?Q?F4euutiVvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d455c18-5d21-4c7f-503b-08df17c4b808
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:42:58.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFngicvnrwn0+N9oio1xPthXKnEWtBKbq2DnZnRqLnfgfCucoErv5uzz3EYRKy8rWn710rKpfK3R+K/fGH041w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8DEAB7A29

Long-term pin state is currently global, allowing one gup_test file
descriptor to block, stop, or release pins owned by another client.

Allocate the pin state for each open file and store it in
file->private_data. Serialize START, READ, and STOP with the per-open
mutex, and release only the pages owned by that file.

Descriptors duplicated through dup() or fork() continue sharing state
because they reference the same struct file. Keep the ioctl ABI and
same-file duplicate START behavior unchanged.

Reviewed-by: Koba Ko <kobak@nvidia.com>
Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 mm/gup_test.c | 88 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 57 insertions(+), 31 deletions(-)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index eb4c9cda16ed..d0bd84b66624 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -208,23 +208,25 @@ static int __gup_test_ioctl(unsigned int cmd,
 	return ret;
 }
 
-static DEFINE_MUTEX(pin_longterm_test_mutex);
-static struct page **pin_longterm_test_pages;
-static unsigned long pin_longterm_test_nr_pages;
+struct pin_longterm_test_state {
+	struct mutex mutex;
+	struct page **pages;
+	unsigned long nr_pages;
+};
 
-static inline void pin_longterm_test_stop(void)
+static inline void pin_longterm_test_stop(struct pin_longterm_test_state *state)
 {
-	if (pin_longterm_test_pages) {
-		if (pin_longterm_test_nr_pages)
-			unpin_user_pages(pin_longterm_test_pages,
-					 pin_longterm_test_nr_pages);
-		kvfree(pin_longterm_test_pages);
-		pin_longterm_test_pages = NULL;
-		pin_longterm_test_nr_pages = 0;
+	if (state->pages) {
+		if (state->nr_pages)
+			unpin_user_pages(state->pages, state->nr_pages);
+		kvfree(state->pages);
+		state->pages = NULL;
+		state->nr_pages = 0;
 	}
 }
 
-static inline int pin_longterm_test_start(unsigned long arg)
+static inline int pin_longterm_test_start(struct pin_longterm_test_state *state,
+					  unsigned long arg)
 {
 	long nr_pages, cur_pages, addr, remaining_pages;
 	int gup_flags = FOLL_LONGTERM;
@@ -233,7 +235,7 @@ static inline int pin_longterm_test_start(unsigned long arg)
 	int ret = 0;
 	bool fast;
 
-	if (pin_longterm_test_pages)
+	if (state->pages)
 		return -EINVAL;
 
 	if (copy_from_user(&args, (void __user *)arg, sizeof(args)))
@@ -263,12 +265,12 @@ static inline int pin_longterm_test_start(unsigned long arg)
 		return -EINTR;
 	}
 
-	pin_longterm_test_pages = pages;
-	pin_longterm_test_nr_pages = 0;
+	state->pages = pages;
+	state->nr_pages = 0;
 
-	while (nr_pages - pin_longterm_test_nr_pages) {
-		remaining_pages = nr_pages - pin_longterm_test_nr_pages;
-		addr = args.addr + pin_longterm_test_nr_pages * PAGE_SIZE;
+	while (nr_pages - state->nr_pages) {
+		remaining_pages = nr_pages - state->nr_pages;
+		addr = args.addr + state->nr_pages * PAGE_SIZE;
 
 		if (fast)
 			cur_pages = pin_user_pages_fast(addr, remaining_pages,
@@ -277,11 +279,11 @@ static inline int pin_longterm_test_start(unsigned long arg)
 			cur_pages = pin_user_pages(addr, remaining_pages,
 						   gup_flags, pages);
 		if (cur_pages < 0) {
-			pin_longterm_test_stop();
+			pin_longterm_test_stop(state);
 			ret = cur_pages;
 			break;
 		}
-		pin_longterm_test_nr_pages += cur_pages;
+		state->nr_pages += cur_pages;
 		pages += cur_pages;
 	}
 
@@ -290,19 +292,20 @@ static inline int pin_longterm_test_start(unsigned long arg)
 	return ret;
 }
 
-static inline int pin_longterm_test_read(unsigned long arg)
+static inline int pin_longterm_test_read(struct pin_longterm_test_state *state,
+					 unsigned long arg)
 {
 	__u64 user_addr;
 	unsigned long i;
 
-	if (!pin_longterm_test_pages)
+	if (!state->pages)
 		return -EINVAL;
 
 	if (copy_from_user(&user_addr, (void __user *)arg, sizeof(user_addr)))
 		return -EFAULT;
 
-	for (i = 0; i < pin_longterm_test_nr_pages; i++) {
-		void *addr = kmap_local_page(pin_longterm_test_pages[i]);
+	for (i = 0; i < state->nr_pages; i++) {
+		void *addr = kmap_local_page(state->pages[i]);
 		unsigned long ret;
 
 		ret = copy_to_user((void __user *)(unsigned long)user_addr, addr,
@@ -318,25 +321,26 @@ static inline int pin_longterm_test_read(unsigned long arg)
 static long pin_longterm_test_ioctl(struct file *filep, unsigned int cmd,
 				    unsigned long arg)
 {
+	struct pin_longterm_test_state *state = filep->private_data;
 	int ret = -EINVAL;
 
-	if (mutex_lock_killable(&pin_longterm_test_mutex))
+	if (mutex_lock_killable(&state->mutex))
 		return -EINTR;
 
 	switch (cmd) {
 	case PIN_LONGTERM_TEST_START:
-		ret = pin_longterm_test_start(arg);
+		ret = pin_longterm_test_start(state, arg);
 		break;
 	case PIN_LONGTERM_TEST_STOP:
-		pin_longterm_test_stop();
+		pin_longterm_test_stop(state);
 		ret = 0;
 		break;
 	case PIN_LONGTERM_TEST_READ:
-		ret = pin_longterm_test_read(arg);
+		ret = pin_longterm_test_read(state, arg);
 		break;
 	}
 
-	mutex_unlock(&pin_longterm_test_mutex);
+	mutex_unlock(&state->mutex);
 	return ret;
 }
 
@@ -375,15 +379,37 @@ static long gup_test_ioctl(struct file *filep, unsigned int cmd,
 	return 0;
 }
 
+static int gup_test_open(struct inode *inode, struct file *file)
+{
+	struct pin_longterm_test_state *state;
+	int ret;
+
+	ret = nonseekable_open(inode, file);
+	if (ret)
+		return ret;
+
+	state = kzalloc_obj(*state, GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	mutex_init(&state->mutex);
+	file->private_data = state;
+
+	return 0;
+}
+
 static int gup_test_release(struct inode *inode, struct file *file)
 {
-	pin_longterm_test_stop();
+	struct pin_longterm_test_state *state = file->private_data;
+
+	pin_longterm_test_stop(state);
+	kfree(state);
 
 	return 0;
 }
 
 static const struct file_operations gup_test_fops = {
-	.open = nonseekable_open,
+	.open = gup_test_open,
 	.unlocked_ioctl = gup_test_ioctl,
 	.compat_ioctl = compat_ptr_ioctl,
 	.release = gup_test_release,
-- 
2.43.0

