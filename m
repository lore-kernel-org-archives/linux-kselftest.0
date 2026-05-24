Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021119.outbound.protection.outlook.com [52.101.65.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6503314D0D;
	Sun, 24 May 2026 19:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651479; cv=fail; b=YpUzO8UKy/fk8sjXpR38SDWVARPsNXFliVkDie/mJZznPtg8FM12RI0HrSSxipf0LjdDRYBnWrH0d15gxsHKKNPpt18sQIiMiSMtdc6bMIPxmrcVITxiKHcu7KP+lnH6ZFBWD06H9dyXCN5wuHnnUHHJucIV8VCW77/gQ9xbjTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651479; c=relaxed/simple;
	bh=JKx2idQPPOCzHwQpXe3A/+/fLSr/YTG4dFQFcYj6OrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dLB2aUkW8VP2tPmuWPE73r2szgUzmj4poDQd+KULHxldfB9eT/6/aCe6Q1ELkfAKgib9OwkgbA4oiF5mDo3nAHB3SEtKGBnODVORgaloYTa9Hf/Msyp4S7jK004MVDG3G6KdBw2aGo58Sfl8PgZjz+nlfBTkA8hJBXHa25A/iN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=QS51rVyz; arc=fail smtp.client-ip=52.101.65.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="QS51rVyz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HI0Wf2KFXmWQPZcD7j25HdHYSaB3m8uy9avkOP+LDreP3CNDdgwX7wOE9x6z5/JNB4XCCZa4HS2ln4W6OjGKCdfI2btQCHYIZLo3lUzy7nfHCy8mPwI+8kpWNIDm5A2Y+873HUnk5D0J3Dnz5nwgu9rHfli+2z4OcO3ldeFkQjTG37Dx3lSesXHHJwSCeyOBxj2nH1hs23VKs/u0ea8N2FsNz6j/ickx5iRTkV3ikhExjPQCZmGeZEaMrh0DUU6hk3kS5/IxoRFe9q6lXRWVGC2i6bVCAiNBDF0bi/jqopVaUiLHFcdF+IMBDxD1QdoeAM2J21WN0uIi+J5fVQhTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwHt1f9Oj4DjNRG+tNhvwRVUMhE6VWQds7Fm0DD2s8s=;
 b=bqjuAbYT2gBsVzm7N/x1Jv07YLCOpntmD1bF2lvrmOGQYwA5TEmcisBCcvmpWub89wDYemED/iamu0z1KSjTKDKD9UVZAM0rVRJFMevJw92ZTf3Wi2Sn+eKIEgJ7bUzLyWjC07R7wtFmf9xaeSkCT9CZpX2MKdPn/yEZwziquCGeGTdmi1kZUizBP+70l8T2Wo4yYWf3LsFbbwUGjvWY1JxUdhJQDeCZf3MD7mEgseRVIbWAVj6x/Ice4nBBYESbua6X2v6yR1wfhy+f/qN3UubAu3YVcN8Dx7OA2A1uhSlIS05mX+654KSHJ5cfCwNnY4F5QnrAM5Am4QME1N0f+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwHt1f9Oj4DjNRG+tNhvwRVUMhE6VWQds7Fm0DD2s8s=;
 b=QS51rVyzeOBoaE5K0jvIfcoCdxxqksaplyqw2E7+6RII7j5Af7EuVz2npDxqmp4zsfltH41C/AsywqFg+lzEDSsfEJOhFgeNxPNRSlfdPD/gppSF32+srR1s9Q4l/CsBsag8YjgyfvNkSXTj/6P1kXl9w9w2ZT7RW5oK6ONuYEzFIQyfib7oSt6OWJmvks4DoRK4Ez0Ovw7TsOKNbmqxT14z7pvxo1z9Nd03ossXCFFqHMOUfUlGCWv1ymLqtKqyXNK3Rh1Uw182kgoZ8L6NpF94vKaqsjFPs5aGsMX5TEQw0BvkqTOJ6UOGQ/U6OdJbpihIFF6AbT0TvGo+1lF76A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by PA4PR08MB7596.eurprd08.prod.outlook.com (2603:10a6:102:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 19:37:52 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 19:37:52 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aris@redhat.com,
	akpm@linux-foundation.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 2/2] selftests/memfd: remove unused variable 'sig' in fuse_test
Date: Sun, 24 May 2026 22:35:57 +0300
Message-ID: <20260524193732.48853-3-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: ff183e71-d3a2-49f9-d90d-08deb9cbf1cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	T2+2mNutDwh5vYTdyuQB9acrrwZgVFDs4EJ0Z24dVAxg8g2S5TrT67Yy54gSEFMO/Or2rmCas4jMvuqUJPmzKDezrhngUdTPaEAr0NKHVq8VeYjwU7tniOGbdHpTX72Kz6hWL/qSVS1xxqHBoDVNqD8LaUXyDiOfAXOE9nrwQ0UlKk2VGITFD8lSLuE/G9Wjgjnr/HwYClkTicORjQeydmIfJrrsitTilWFFlymaTU+ukvMywf/aJZq4eLNO3DZx81rp2F0kGgAenQxc6EnifEXVUjY5pYg6nbmZBTsvgG9LVO3soop5PnMgmwZ9tfy8jkLT8/DkmFMWhUqsIRB3Th4FDrWpUy/1C6rHabjMZgrQ3qVvBRTcTCd19c60qCoxvQgCVu+hmPcet9RoxFtrxTqp7WLausm8dEasLC2f0GQbSrqfqAz7Fs93TqxzU9ZLrSnzH6uwqZ60rVL0o5u98vkvSGXojUbxm8DCP9PsT6DHNPq07j5zG23MDhLcT4A1eGsGho+M2YRRwUzCOUWhNJb+0pPe2pgI6gViBMjuATXlq1xbKGHjzDqIBZEb3N2+pbDIfCKzxNCE2ImDlbnJ2PkOiKRniu8TRQWtpzPyFk6L3YNA+2lJQAQtI/ZEVv8o+YV3VZisN5BKM1dNLt7B0/4OpvLZXauHwFbbdUx6BwduaYAMDy143xoueu6SIpnS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PBsXm/8S9ZHVJ/MxjYDSCWadXweAdflppzEOBtWB+mxa0Ju6cbMxQquNEYv5?=
 =?us-ascii?Q?t3KBXRYXo937g5XeGqCtHmpVOWhbZqW4AldbVIv+yk6jQh02AFn7S+LJthZu?=
 =?us-ascii?Q?vbzEZQI3wqyKkIuWexg50531tnNMyYn2IdAO1e76unx+bu12HqyuSQcNkVXD?=
 =?us-ascii?Q?aoltADfZ87v/t7HBzlpZaXWBpJxr7eQAwA2DcAbmA8+YbQqa7q8GUru/Tt+0?=
 =?us-ascii?Q?B0Ktt35LEtkIUL95YRXSMHQGBlSRrmDurMRvSvrImM2SjRw5sVkiDCW9DJPs?=
 =?us-ascii?Q?G9FckIA2gG39JLzYbXm+EH4PR7qiYiGVHZW3HG1ES2Tm+v3JO/war1GuKN1q?=
 =?us-ascii?Q?rT4FWydOaKA7P4esX6reXpE6xZfbmGFw/d2Tr//ZvthOTHfGAvA7k2qpHxJs?=
 =?us-ascii?Q?7OmIyfHzgAZOeY32cvlCUoi1V6sXeaABQ2XhZ2I6EhXkmt0/DoSsdxCqHBXA?=
 =?us-ascii?Q?bDzTZrtsaIF1WSeAtdfOzkCOPzHwforbK6cuCFGlsc4BHyYE0OUIT9aeMQH6?=
 =?us-ascii?Q?rtN9wpY+9r8U19qhZshUD//xlCQCCMSoRcQ70x8tA9Zg6WBTH3i8xI8j54D+?=
 =?us-ascii?Q?dgBq1H+UQLHYxeSuKmc6LCzrn3ZScrbJDps6/310i7vFM0ROPTyUOptgSMDw?=
 =?us-ascii?Q?XlsTemNFoIW+obvOrydbMgN7QWCVOi//Scuzf/20u5peKduZ3QAD4Uks/Smf?=
 =?us-ascii?Q?IdQoW2kzXGIHmOd+NXC7DZxJDWnGXKmwh1V7litdUJNN6+VGzb1bE/XML8BM?=
 =?us-ascii?Q?YpXj7Ld39li+YWqC/kGAT6uhmcO4kN51jH1zw91FAYMRlzE+HgqjAA0XYIvl?=
 =?us-ascii?Q?XDIBtQFKwl9u6wt3M2JXvVfVLiLSsjLSFfZ12+uZ8mDefJuq28omHIcRvJO2?=
 =?us-ascii?Q?k1cH0c7QErRvKULBSYfjE9TkzDL7amMS6kHlNtBoO8Wgd7EoAGVB9gfSDRGP?=
 =?us-ascii?Q?5fhDuMnTwEGDx2+UJzIp7amQPWOYfUnTapr3I1zJjbaBbN37hITVN2tMB2gk?=
 =?us-ascii?Q?c2E3c5rYs1UxCdxzRaXAzCCZPQjW0e18kh/ptJdDCfDkVbAPbxhpQmODAgrd?=
 =?us-ascii?Q?gKi85Nkede6VNkd4h2pS4V3th9yZZPjo5KEDNf5gKdtKXa0YrJvWpMKQ8lcG?=
 =?us-ascii?Q?AJF+QBBVZG1pPlWxgt2kDFqpo5/BGF9iZJmeg6pGCFqmwezydzhYG2rwDnI1?=
 =?us-ascii?Q?1OC7w8KH7MSGHrFzaXuAyRfMkIo8ABrHE0UJvLNFYfNYcocnIWo7bLiqsjfW?=
 =?us-ascii?Q?mbr/f2XwG+oZX+9gOhbgAV5cKl7nph79XzCsQEeDQ/wMu+yFrT/6Lq3F4Ln5?=
 =?us-ascii?Q?GpLbfWLKIomGysvWgbaHsaU5JT3j6mO7hV9G6DbHJTT3iKz+nVyLXQIQm9tl?=
 =?us-ascii?Q?569DpVYVoFG1Ke/z8RleYgsOHWiQLtjZxoYScFfQmx0Qnz/cMvziAb9lRAEF?=
 =?us-ascii?Q?TNDYSLh4RZQ/Roc4L9Z55epCWXxTTrjTO5XEiFLZskm67++50jD8No8AI3fl?=
 =?us-ascii?Q?r9xkM+AlfSQ5IZy7xumJNErwyI6tS4DSJ25BG24pfGSA6ZYoITnU2YcJht3p?=
 =?us-ascii?Q?C3eT5X0FzX+OvzH+iA6pNTgIO/khU/yFElxuka6rklSV9ZRPKsilXLbh8Xq9?=
 =?us-ascii?Q?gO5va83jCfLOTTaG43PTngjeJkL1SIWmY9+y5EbbiUmpCkjcYoq9C+vtA/N/?=
 =?us-ascii?Q?y86AXmfbc50dltSqKT7MNoLkIYOZum4B2nOnBrbHHWKZCBU2YFoZhyaXcdu8?=
 =?us-ascii?Q?wBgMTGxOqV7+bhqJ+3sA6Jte/eXOVvA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff183e71-d3a2-49f9-d90d-08deb9cbf1cd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 19:37:52.0913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDz0JxEJfyvVgBGC2I1aQ8VUHwUqjGJQg0rD6iKx8kq8nlRmLtL9CxTvoHMxn1p9Ka9WCqdYjZ4Wbnmj4CWM4USR1baHHDT20SS3oCSD5Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7596

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  fuse_test.c: In function 'sealing_thread_fn':
  fuse_test.c:165:13: warning: unused variable 'sig' [-Wunused-variable]
    165 |         int sig, r;
        |             ^~~

Remove unused 'sig' to fix -Wunused-variable warning.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/memfd/fuse_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memfd/fuse_test.c b/tools/testing/selftests/memfd/fuse_test.c
index dbc171a3806d..510056c1b0d0 100644
--- a/tools/testing/selftests/memfd/fuse_test.c
+++ b/tools/testing/selftests/memfd/fuse_test.c
@@ -162,7 +162,7 @@ static void *global_p = NULL;
 
 static int sealing_thread_fn(void *arg)
 {
-	int sig, r;
+	int r;
 
 	/*
 	 * This thread first waits 200ms so any pending operation in the parent
-- 
2.54.0

