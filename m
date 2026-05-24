Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021119.outbound.protection.outlook.com [52.101.65.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E322741A0;
	Sun, 24 May 2026 19:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651475; cv=fail; b=WqHTe35vbqO7/QGE+ifSkko9wkXyKvUmgrTROnau+hMx+scBjL0NWS4dfgqKNEM8EJDkINTTSgEfcxfwzLHYuwcVPzL0RtuiuZ3qYsmAyh8qutEHC9ine4B/IiPpUXchDHLh06HkGk5usitLTdIynb/RjUi8u6HcRAJzDtZ61j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651475; c=relaxed/simple;
	bh=7Bf0tMkWGs1gPUmvbfNTJQZcX4ddANQUedsngGbnza8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fcmjNOBF3MDXJj4MiImqmTj9x/frvFA6zdkRkcyVzmKfQe60r3wL3KIF26YY+3eXM+z1SCr6TMXT8/BdcbJAtmrRwhm7NEzp0ejvWIpnq9HYClxIClprIvImK1ydOkJoZuS0+QNAYsh9BP5fD5Nw+o/TBMednaVXzuvaWdU6toU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=K6tsD4qk; arc=fail smtp.client-ip=52.101.65.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="K6tsD4qk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSu8cwjx8lG/AwuuTz+z+l/cKB8y2i2WgI9OgQdst4wD5/6IY8xXqgXpJOHpYzrCsnqN7YvNbCQBmdLMeoXXYpNp5UoKPoCrT9u65g9/uETr/5Hc5oNI4KuHQnCeJv4qKbgp9wnV1c8C5KbgLheOIatNe7lVa0Y/pBVhJeArWEmGAjmoQGAbm5YBCh74NPX1HtnwxBRpdjWhsedat28Spw/mQ7kZPGdPHxdKyyLPumg/puHCkU0DOKPMJ4+Y2D+SkG/PtE2sKlrnYexEJk2VI2cu/4qXWqPo4xKfML+8gUZyedDTpdM5JjONYHsWYIqP8j1I94Mz+4T0TjkvHStQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgHYAB8GmOjujVBHVPkj6GNcrHk1+L/D0EoP+1GSt0Q=;
 b=E94Kik7zFly1bKdlqyykeTxy0a44+bY8P6ligdDCVzYGkQ88LLmvuUSQxYKY+7jUuOO32Brgak+JbNVNciv/SaibOFccoE8IdxYRftIuOgjro4F14k222ShbSL+yRl9jGn/KOobVQ53tdrCut918n9nEN4hE2rj6ZOA6LeYZHCSafxjuDkiVqJyzLkgF7czQIjnpEARRmEq+204AIiBeSPk+4vAQKPdYrRZTnmM27ureYUMaWHQBGPGXXDuMmY+P3czqivjE10BlCS3Ss3R7msIDGjdrZdO/5ZOsaY48GtCzmJnf2Xv54QsmCqQ0JomfZ7eNEJTVuXa8ueYuWp5wlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgHYAB8GmOjujVBHVPkj6GNcrHk1+L/D0EoP+1GSt0Q=;
 b=K6tsD4qkjCWw4FS9LJ7O+K/IUjoCGIAHYqPY7sx+vUIGpUsXhvBae7bvD0NBGeiyUhe2Xev4lOvnMUdjqucNdyN9TbdHpRY5LgDJLK8+EhJiNscm73T+VB7a3GFydl0xsGBcV9G0pWO4KzRSKtKqpKyAc3qMhdU8PTwYlPT1IRtjW8S02E2Kyb+WdiTn5UrKBsXvHinoPbou56cv4illGQbLI41C7e4BoqmfU+/EYE3xW8XVLtv95p1C1wCM39Qf1OmJtehpSXEMod5RZTqj9/caLnMktefuS4h2XnPDKsv1xohCMVmZxuupO3tNmDulRc5iNzFVr1TRsHZyEH88GQ==
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
 19:37:50 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aris@redhat.com,
	akpm@linux-foundation.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 0/2] selftests/memfd: fix compilation warnings
Date: Sun, 24 May 2026 22:35:55 +0300
Message-ID: <20260524193732.48853-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-Office365-Filtering-Correlation-Id: 2a95b55f-5ccc-4948-cecc-08deb9cbf107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qCxJSBOKIygd0d70KKjvKNuakCh/UhdU2Cj5HMc+nnxzkRW1XnPyv/u26DRfPDxJ99LyZA4hQQT7SxyzMcC/4+TuDrF6sRASRQvC4mF6VPWXZcFeeBBCpvn76vUvt/q5E3g/XjJ4LOOjWaCB5Q5kbh5b30NdsLEE3QpT3OgcP1wWhHoWBo1DvsMC3bPOYMdzH1RhKQi2MUv9a3W7lu8ZWfboxEedSQW4LAlI43YzXfL2/0kcDPIA+818TsafIAK2YVhwEcDRLFVnqFr1fKlI4WvjjuLyO8YmY9rYbjVwi5fZu+EHDV7Q85aaI/G0KPr2a0MpEeyCA7UZ2B56/BPDOZgA7tRI0O/3jprtm4bTgf9hBelmcmlsUOGGqGTwYwpVF5gfS6KtGdmwpSAx6mZMbvUAUDg52xnmBDqM2bbqeSYKSbm4t2HWf4ZN0XgV1jT2ixlIgpO0NrZ4T1WjJxjMKP6X3pe2ZEItj9Eb8Z6NzbxFMBLp/RZ2T0Wr/GaaXo2fBhF2AnSsTBol9itlLctFIDf6IPM67RMdn360Mv1yPiIz3v3ro5Vyd6vuW/jZ/dGm+XmpMqtrnAINzHS9oUwax3W6ulPjNdgibEM2oGpJnmcDWzdBZTBYctd/KI1Ty8OKsMuJ2rEcBRMcwgcfquYC1xSgbG06VZbmt0z9Rb3t9Rx4GXpJjaGRSmXR+W+73oE3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xeWrnYv07AGCIJad+D8hSMVb++KeHdORhT1FNpqGERiP7qLg2USjPdeQf/01?=
 =?us-ascii?Q?4C5TCENCvETfjhF2S9TFFKF3VPnxRDkrUivi6+RGemTRhZKcxRPRTslVcf9o?=
 =?us-ascii?Q?p6LcLSnwesZYbvmc5Tic1Lf83SImYtV04WL65k2TNRD47UzhpAvUe5HolSdL?=
 =?us-ascii?Q?DWkeYwaERgaOivIDN2dir3Vtwj9XNPzONkBgJKoufLKUxQClP3c6fPSrhFCK?=
 =?us-ascii?Q?NHtFLF5K9uOGVg6DdK6qkVsNmCznurc0y0c44jTvPU2mpPsamcmB601gZNr0?=
 =?us-ascii?Q?2FMWycorjctXZtk20Hk3LfP8Lt5Wyoyg+7JZ8N3eD5UE1poPKZvoFXJa0B+c?=
 =?us-ascii?Q?CQ7p0DCx+82yCT05I/ibx7PMDA1QczbdCqYOHVR08ywiE1f2bjGXiKHk8uJb?=
 =?us-ascii?Q?q2r0AcJ+7wjX+JgG75zhrZAk6Al+v0XG9olUx7Nrs8VbMtCC35q2tyiNM1dv?=
 =?us-ascii?Q?QiWfCfAlu6B/+gDuegkaWg1dcAAPOCoaROw+W4mJ0xNoMGBEWRj1DrW5RRFy?=
 =?us-ascii?Q?XRVWgTkVNZYydgVpaMSgeVlRjBpAoMy+SjpPYxVuw1SFqWW4NW31Rq0a0pqY?=
 =?us-ascii?Q?81TflBZVoaczoxL3dbQjimtSC540PBRiCYtU1e6ZlyxVT0TTwZ9E/WQqNknb?=
 =?us-ascii?Q?Lkiul3roid7oHPT4Vi3x4f19OxgkOe1XcsLDM5gGH2QFkM49Us+/oFQcFOOY?=
 =?us-ascii?Q?j30O8sU2tK6FQEZwc9fkGKm95oZ0YS98Rx9cibDyxJePAzVCVVNsQItANsM0?=
 =?us-ascii?Q?fDJ85I3ffc3eyJsGRAdI4vA9Cw+s8kXwzw+eqrCB6DG7Y7qUT2yoC56s7MxM?=
 =?us-ascii?Q?GudTxQFa5/qHkUkY5X0ZiI5qKrxzx/fOZTISQhozAPo4kdTqYXRPTxHO+2h8?=
 =?us-ascii?Q?AiLQQUTIx2fXka1aE6ZtV/3frsp1AoQ86zRWTHX+yP+yxchFtLhmb/6zeASi?=
 =?us-ascii?Q?YMJZstkIczOjEpXJo/MS9swOsiRouxh5Y7lq2fk6VcUq1tiecbgv5w51A7Nl?=
 =?us-ascii?Q?dGVMKSIXq4Cyhmp/rG5FJFAyRIXJmVwBROjOL34YTxuyjslxVzXzNK22ooI0?=
 =?us-ascii?Q?U/Nh4X7S49MCH1dadAB6XIcwUW31/Mg6Fj5BqQpDAJnQA7PdMTLMTk8L3ppf?=
 =?us-ascii?Q?nNNWsw5CZwGZZzocXakUBgLBsI18JTTyb0jg/BSb4zbQNnAuqr4foh2E4h9i?=
 =?us-ascii?Q?H4L/sPTOvTMlELFAOzcBGIX13HWmlnQ3nkM0c94HWVP1bkpQLCLWDh7j/VmI?=
 =?us-ascii?Q?aWi8XwY0d2JFERzDVXi91ty33BbROTha9JnealzgRvdr6QEmbdsest8vHBUp?=
 =?us-ascii?Q?L7cNd0TZtKJ6eWAED8LL5mw3xINtJJ208IXZwbjtvye2CcLPR6csr72OPQa4?=
 =?us-ascii?Q?Fd9Z3rGfjADKMhlvkPluL8DKmJ32F22ByGi2o/aAaNibXcHHj/EzgAUFG9uh?=
 =?us-ascii?Q?LelvolS38IZchqMzz722MvvxqEcV6LCrT8xVDy4BJpeSPFhbwrhSdWQMk6be?=
 =?us-ascii?Q?ltOCG4dIdHT0LEafp1Bth3niXFpo1aXNCPs2V50YUx93E1TzqR02HNMi/4Yb?=
 =?us-ascii?Q?NsQY5ZXmGKqXhx1PX7nOZ1YvTGIWHPsLalP0jBjITttPATjvH1dmwk/pzq+z?=
 =?us-ascii?Q?Wrq4WMLfGRGjySAlOizIwKYLbnFE+bZ3payQJb8MBrgrEb1eJwGiGHcV8tfi?=
 =?us-ascii?Q?XVUegbU9M4hc8qZaGwdV2C2bHQ4t014cQQix3GxDCYscs7vWds73eOj3n7pe?=
 =?us-ascii?Q?/Lec93usG4rL4zq/40oBSFiX0Gi+d0M=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a95b55f-5ccc-4948-cecc-08deb9cbf107
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 19:37:50.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g5Ejp2eWwxHOAJzCMjD1qasebSwMNTcTLeH+cRyYqXCIRuie1P916bhVe1wvysywFlvw2CYsIQhbpIA7oJoCmWshZ0niShliD6zkioZfzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7596

This patchset fixes warnings about unused but initialized variables,
and unused dummy buffer passed to pwrite() syscall in the tests.

Konstantin Khorenko (2):
  selftests/memfd: fix -Wmaybe-uninitialized warning in memfd_test
  selftests/memfd: remove unused variable 'sig' in fuse_test

 tools/testing/selftests/memfd/fuse_test.c  | 2 +-
 tools/testing/selftests/memfd/memfd_test.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.54.0

