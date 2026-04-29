Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022098.outbound.protection.outlook.com [52.101.66.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C73DCD94
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458534; cv=fail; b=sTLjLTBBISIZtZPcwgT9SrSAaVQwz7dPkJMIYIiBAG1TqLo4PQrKweYr+4PNtHZu1oSFvHm4PwVfDgJYNuzWuQ0Yv9QecynbMANcURPRqLY7lvWTlWGI29MW/u94UqE6aegddtM6QeQHLAaAAAu/rD3xz84dL6c/jaDMHcET8CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458534; c=relaxed/simple;
	bh=0deOBodnUrYBpASljZneYb2x5e9cpL2HRKM7Jl0jLdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xuna4wv7klr2SsgwaUDsLukqhT83JdsSp6Gcq4u7e5RwjnEsiySh/LNtUUgi2NxdCQvolRiA/U7LEtik/f4zS/bLJBxjAfbMUkAfGCeEll3btwnOkCRj2DApY3XWp2OSPTYwJiEWSRujlQwBP2e++1cK6u3bfSOSJZs9oiwSrnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=NE+AWCHH; arc=fail smtp.client-ip=52.101.66.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="NE+AWCHH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTEYPnyqdXb6yZNelvgDxWqw7TmMzP8xbh6QzwTkcNSO/756WBTJpZ8ShL4DpUdKcUlZeKqvXJpRUn/fDNRladkHIb1055gDulPMAr6+pcayJ9mVJbct7pgl5FIgtTV+zzeNnoJHwmkWzPN4bekmlK0ncfHPoayDe4ETVeoG4iule04fu3y+tYdOPuMlA2kkOkSIVGRqQepcMbswNiBEkRWo7DFuT+X8uqNOhGaeuSNAdYqiZSXdFmfa1NkVz9WTd0zw70KsKhv4TGY0qY1pyXM+TBeXsovWgXUhGkLsORPR2nPBYYDgmKRRIi99lKfA/luq/jcjr3gSgG1+O9KC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dM1ueRnqoYEadBME2LZxm2RrXlaP2y9GLVoAtlvBSCk=;
 b=uXEMA38TYv+wDyRtWuKatdjZOsO6VMlEVqi7ur55zrd68PGVWgFoWyKeaunSRhkaaV7Gau5m52jj5WhBMtanwG2/B0PcSCrRpfWUI6qHcWCFYgIxWn7CQ7YyhNTDOF+vFi4Q959OI3+O8krXnlXMhnr3lT0RS5yaO1MBdRqX6oJBp9a9wbSooKYi+mGv/mi5J6NoQlyL3Z5vsmxBSO/WfDAoeb0zW39ntd6MOWxJybZ+W/hXFhgDO6ZruxepXAvN/yFAlVX6k598nJoiGIEkDjnN0evO1/Oi0PtHTbw2rltgsS+e5m/QY1vBr+WzPAJ4o9dl/Z3HSwa6J2hCnEFtTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dM1ueRnqoYEadBME2LZxm2RrXlaP2y9GLVoAtlvBSCk=;
 b=NE+AWCHHHL/vfCmVtsrBUWjDxKy9CEhFHDtSYDQf/WJWD8Kx1a0JQ8g9gcOc5VXu1rFiAqxT23LYLPH4fTt7lbqs71jL7XyH9DZUKRacwUz2waMwayOP1DPWd6zZ/HJJq7fyUjmnCMR/BGY9QRBrebvWUBcuqRggaaYaGy+6M7NYL86eRkCIuw9mbTK6zd6KDqmBQp6pd/n1eLq+hlGzocqwVKmGaUPS/yPZQj0t9FCx28zPl7GTZJYliFlfGg6Rtgd0IqRePJhAZtUuXh2vjqcH23yZLSFsSH6OHp/jHLnFWtQFl+qhqWUqis4A6W9jobKHzeQCJufHXi0E79pbtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by PAWPR08MB11558.eurprd08.prod.outlook.com (2603:10a6:102:509::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 10:28:43 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:42 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 12/15] selftests/tcp_ao: fix -Wdiscarded-qualifiers under C23
Date: Wed, 29 Apr 2026 13:28:08 +0300
Message-ID: <20260429102811.47214-13-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
References: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|PAWPR08MB11558:EE_
X-MS-Office365-Filtering-Correlation-Id: 769a6154-1546-4acf-9808-08dea5da15e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J4P8mrB7Ncu0+ml+Dqaut6lo5C+Kau2mTwIr71LGbpjLQ1bdivRFCh2ITvQ0pmDpsl+eiWAbgN+UBOBhMuTEH2jQujqUXkZZjGixMyJOd6uCWz7u+nZWjmZyG4qUtwwO59TmgaYWMOgRvqaugrLg1emLFb2yAlEVXoWAb+AHRYzb5XUnk8vzV7WcAyKboSlG8mOOxMZJtohD4Lvn0HfwQqh8LQFt8MAHieTsGoBRXMgrVeeNy07Uggfmd+PZjwQG18p/Uox+ocyeUYDNFRgGU/oOjPxlZqJOhRSu+pmtMS8KUF7eOlLmo45Msv0iOQeZROMffMOSp+9+YUQWQhYokTA35VB9fh8NCDGYujLegLIBMI1xACChUMVT5W5I7mlhecVgLWHvIb27u/p5xjgKXNAtfbtErhHyVLFER9ciX+bbhgz/SstdcUACsmvZ/8ftn8r7uAacvA+3xfSNcQmc+JlBRq63ynZB6gyO3ShskzDlceu7WskDC4YJEaSOwUMKDzdjNuxXhvZdL/SxHq2TFzR3ZAivqnWYiJvXCJwnzOumDKYFnvBCOhG5d0338nA9m0Fdt7ZAtTylqA93dyMmrW8Xz0GkEz4BYfrklGdshvg97iBkXhVUhu03JwllkIpZOyLHQlvEnyL1qhuln5+M3Dyfg2NGAsIWfn+AkUp5B/PI+EiLn+37irovTlgnSPbggLTdrS2KnSUkc98t6bmHeLG0b+BtpckR9c+O/zJ+LsQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEdnWjVGR2tlcjZUYk1KQzkvVHlGRGc5eVFWWlZhUmJDdmFWV2oxbEk2ZTJ3?=
 =?utf-8?B?SWdiQkxJSzByME5Ibml4eGNiK1p2OWpjbjZsWUlVZ1V3UFdwRGdkUnF6U3Bo?=
 =?utf-8?B?MFhpc3U4VUhrOXlsYTlZd0VoSnhwR0dBcjVVRnlGRVpuaXllajJtS0N1cG5C?=
 =?utf-8?B?c1lhMkd0QkpZKzQ0WW92VjJlTkx6NXc4TUE0RFlMZTRBV1hwMjF6Szl1SFM5?=
 =?utf-8?B?VEVTK2hUOEZESTR1dC9YTTRrRVNHa3Vtd0tLbkRLQkN4UkIzblNkZ2tZWjlB?=
 =?utf-8?B?eUVNak93cFgzRmdrTGt0a1B6bi9sR3NQVlV2N25SYXppSnRoSU1LVWE2S2lJ?=
 =?utf-8?B?c0c2L3ZvSTB0TGhTVGQ5bitkQzUvUWtUbWpoc3dSNEVBZFJ4eW90V1J3ZVB5?=
 =?utf-8?B?QjhrdHkxRkJ3WGNMSjJBUDZlREVneWxyMHJkZVV2bjNEMnc1SXYzOC9WV0JU?=
 =?utf-8?B?YWpKU3h6Q0o4SkFueXRaamEzZVdKYmRZdTZDRXArZmdROXo5SWlhcFM5OTZD?=
 =?utf-8?B?MlhabEV4bEZ3WnJQbXQzSWQyR1NFeDdaeVR2dlUyTnFjRFdJSllsRkFGd3dV?=
 =?utf-8?B?aE50WTh2dTdxb3NyeWpuYjdnbWFCQVhLQU9FckFpbStoK2ZzLzJRLzdYWEph?=
 =?utf-8?B?MmkyejFiVHRab216WFJTem1kVWhXK242UXpmdnVPdVI4Vk1lTzdGeHRLQjd2?=
 =?utf-8?B?YTBUa0ExQ1g1cHFSaGRDcEZ2b0NLaXBtUjEyRnlUaUJLSzMvNUFlWTlhNnp3?=
 =?utf-8?B?c3RxUXNQeGdDV21LelhGbEdESnllWDltTFVmOGFiV0RzdlhDMWRFaEFuNVVQ?=
 =?utf-8?B?VHpzYzlKSkhMUDh5Y0hFRGZkdGRXcGNoQ3B6RWZ5RDdRdG5adXI3Mjk5N0pr?=
 =?utf-8?B?WXdWdGR1MWRaM1lqZitVL25xVlRlTWRYaDNjV2VoTUVmZEpCRVQ5NlBSYjlF?=
 =?utf-8?B?TFFQR05wN1BTM2RMSVkzdXY0SkYyK1IrQUplM2FVbkcwSzNEL3Fma3NycXRa?=
 =?utf-8?B?RUVQMC8vOG4xVEgvRStFbWRpdFlRUjlqVUEydzd2cmxUZDdiQmloU1hEU1Zt?=
 =?utf-8?B?bHhFbldFMXJiZlFKWjExang0dkp6a0pEK0h2T3VDN09Pb1I4OEZ3S3pWam9v?=
 =?utf-8?B?OUdQbGp5cjYvVS9WMndjUW4zVWZBeksvZHY4SHg2MFhDRnhBVE0xeEMxc2JG?=
 =?utf-8?B?c2lpZnUwOFZqTXNIeHQwQmNIQUQ5WlIwUjdESnJXTlZBTktZSUJMYWRyelhW?=
 =?utf-8?B?Q25IN1RrdEpkM0hDZFplSGJha28wTXVnZ3FWdkpMZktLNjFSdnpQcVd2T3E4?=
 =?utf-8?B?RW93TXlxWHJ4ZElkZVFqOEkyWFhuMDhmUTFpK24wR2YyQjE1LzBma0dVRkpK?=
 =?utf-8?B?Kzc5cUFYM0pEeTVXRlcyK09hUktXVEg4cjdUUTVHTGVPM1pTc293M2xnQmhG?=
 =?utf-8?B?WlkwUTNXVEppSFBWYUllODY2cVVJKzBXQVVOLzZ4UWpjcEY2MzNWdjlBRGNR?=
 =?utf-8?B?R3kxYXBYVUM5OVhTalVSRG5zMHVjZG96Q2xlREFJcmY4SUx2b1FlYitIWExq?=
 =?utf-8?B?czRBcHc5TG53a293K1VEaVRxK2o0QXNnVGJTdnA0aUZTR29BdnJjNk1kKysv?=
 =?utf-8?B?RkU5S214Mm43SUNkRUQ0dUYrSThRMitJVlNXRytIbGRKUG1DbE5GTlZnYkx5?=
 =?utf-8?B?ZStvSngxTlMrRkUrZnhad09yVXRMQTRkaE0wSUpwTGNxS3JFYXBwQWlqaTFN?=
 =?utf-8?B?aW9jc2hDRlZEbWw3NFZHZlcvM0l0UjdKdEVrTU9rZW5nQ2JYZXQ5dG9Cd2p2?=
 =?utf-8?B?L0huLzU4dDhqSCt1ditmK0N2WUNsUzhmYTREeTJ3S2s3eURFN3NuYVFqYnhO?=
 =?utf-8?B?alJ1ei94MkZwdC9mbHNFRmVGUWhJUWt5Si9kdzdtZkVSRzMrUXRwSlZDNVVL?=
 =?utf-8?B?WkJOUG0yem1SUUFINkoxVG1sRGFzZEI4SThFR2U0Qk11QXBOcDZlNmU5bDhN?=
 =?utf-8?B?QmpKMlpFamFHcGJJc1kreFJoWXU4V28zakNGSG9lSjNEVlNwZ2JPcWxKWFZX?=
 =?utf-8?B?c1Y4ek0yT09tVzRzWjA1ZDh1K0xacXNOaitudExRRzA3alhIdzZUMHNxUjg2?=
 =?utf-8?B?RzJrV0FuOEs3aENKYXlxUkliRjQ2cHBreGwvemgzM3lmQUdKRWNYWDFwRHVI?=
 =?utf-8?B?cExjNWliTGMwZEdGT2VtZmI2cjZwRFBFNEIvbjE1MlJMeU9NUlVBbGw2cnFx?=
 =?utf-8?B?QXJzSmcrVytHYmhzUkNXdlJnSW9VZEhxQ29WZ2RaNllSdXY5MFh5YlNnVU03?=
 =?utf-8?B?ZXNWMnNxQkpXYk9qUURTQ0pVR3NJdjcxV2w3TjY0cEk4RHBZQVMzdzZpcXEz?=
 =?utf-8?Q?zfdQDTdj9WrjfPwo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769a6154-1546-4acf-9808-08dea5da15e6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:42.6820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBJIGg48hkxwwJA8V8BMAj8+XxGtZ2E8lF85eVPGPjMZ92zm2QfStvhOI3BsIS2myTOuTNSBkOHGq/jFLN8uUkHJsKjfV0M3QU+KpbeM5XU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11558

glibc ≥ 2.42 (GCC 15) defaults to -std=gnu23, which promotes
-Wdiscarded-qualifiers to an error.

In C23, strstr() and strchr() return "const char *".

Change variable types to const char * where the pointers are never
modified (column)

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/net/tcp_ao/lib/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tcp_ao/lib/proc.c b/tools/testing/selftests/net/tcp_ao/lib/proc.c
index 8b984fa04286..50062b527a39 100644
--- a/tools/testing/selftests/net/tcp_ao/lib/proc.c
+++ b/tools/testing/selftests/net/tcp_ao/lib/proc.c
@@ -56,7 +56,7 @@ static struct netstat *lookup_get(struct netstat *ns,
 
 static struct netstat *lookup_get_column(struct netstat *ns, const char *line)
 {
-	char *column;
+	const char *column;
 
 	column = strchr(line, ':');
 	if (!column)
-- 
2.54.0

