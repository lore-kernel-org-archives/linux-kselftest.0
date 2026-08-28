Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021134.outbound.protection.outlook.com [52.101.65.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305036C581;
	Fri, 28 Aug 2026 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932465; cv=fail; b=sBOXW4PFOBC40mI7S5BEBr/eBgNHBWTdnoKpMwnsLWD32SfgsjwM/KuckKuDNH3eAIhrRXi223B3rDY1DVuNJ4Uc4mcRRjxWo+2QtOV/9btkpvvcSbNpgFqtLzE4GwCXxS/A7DC0LyAqDY9cvICQ59+sohaDqHxxLFRcPgNE6GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932465; c=relaxed/simple;
	bh=iqIVEAKOo7VIt9skJ+X5ethuxWMBv8HwEhS5rg+Hhxk=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=NYi5s8UdNn7IubQjnHnQ5JdMI6ZQ9eNa0sTt74W/27k69vfqjq9uatjBVecsGkXqvopX4b2abOaP8zz0DFURUOaoup8intOvfMep4ozcUxBPrDb2wukoiY3Oh+jNSc+filEjDoRRL6t8ZIgltIqMm0jcIwjSc6YG95Fi8JcaV3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=erFuN+ff; arc=fail smtp.client-ip=52.101.65.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="erFuN+ff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT0Y0pTz0btT05FMKQn1QQQlpQOCMvvltgiKze9eHHylVKG0E1yIhlDsIXcSZTPLAMH0Fg2996htMbRH7agWMp2JNgYCAMZOQwu1P7e4WFgmuWREPRvrAIFAJ+VQMhnmghPRO4J39XiLsunKuGKUQkAB5ZmquCn+UBYkF4/syi8ogEq2i36K0qAS39YGfC/Mo1c+oPzO7ehrZnQzp97zvb2QpFMMaVNz864CtFc77D3FZxjvDjSlfBj02vJ+KRXOnn+5R1rafOBZZ/DfSj/4W3tGslDkY04j379YginRMbbq3mynd6IFst5ZAUZIOJOzDhi2xa5D+NwhGUVZP3SVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUC1LLlN7WV5eCYb/WDUPNAcPV8CyJWqPB+zC4uPv0U=;
 b=p9t4vmjd0Hs1P8O+cnByjp5zuxdNVKUZTqocf59Y2NntY7mkYASg+qsdlLCuRe/F9u7IXozg/RJmrx+xG6mqunECHJoqEB8qADyDDdCqHHu/kQVpquehWsQB3H6BgK344WdgezGnYfD6V/gxmTQ73/DYHzDNE1GhUDtBmLvGi2H5scvX3EZcTGu6tXUcGf6aUfuD9YWnKpzd90vOWl7ElCtTizVv0YdN3clw7f+PXkr3gBdmUtBrDDrUWqiP0hQd0s43sCf7Gtjw9LTOQHwgLKY8ZQz3IuivFHxKiRb1DgB2IzS+/ptCA1d/GQNAU8rtVMKD1mbS9bIQEHwfITtFjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUC1LLlN7WV5eCYb/WDUPNAcPV8CyJWqPB+zC4uPv0U=;
 b=erFuN+ffc7iVdJvCLGKFm29BbjSVFzB5F1XnMAJOImRb9GggIJa6kke7zTD2zBE1CYYUtp9RFZvEBHGfPoiveUS4Lq6hHBUYUizXmvY3/PbWTjECWjGqc6ihqdeORIjD3cWp4tTpjgt++PpwqsAARu0TXC8vQ3N7sk9XLPwZC1uEOflMB8XDoS+HxhS8Nu4e5ks8KmcbMe3RvymHrjf45UT0q4IFVRNieFDCp7bKieCBPdcfseSxmpAwoPhkRmSKS0pPmI/v/L62PUTcbqxtknIVWYUfb5kRcw0zplAegkgx6tRuKFa9IrPGYIX0qczUE/whLnmPdURlCOtabJvDaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by PR3P192MB0909.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 15:54:20 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%3]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:54:20 +0000
From: Florian Schmaus <florian.schmaus@codasip.com>
Date: Fri, 28 Aug 2026 17:54:07 +0200
Subject: [PATCH v2] selftests/epoll: Fix race condition in multi-waiter
 wakeup tests
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-selftest-epoll-fix-race-v2-1-953ab57fd60a@codasip.com>
X-B4-Tracking: v=1; b=H4sIAB6vkWoC/4WNSw6CMBCGr0Jm7Zi2Rh6uvIdhAWUqY5CSTiUaw
 t0teACXX/7Ht4BQYBK4ZAsEmlnYjwnMIQPbN+OdkLvEYJTJVWlKFBpcJIlIkx8GdPzG0FjC3J1
 dSydrDBWQ1lOglO3Pt/rH8mofZON2tzV6lujDZ1fPeuv9t8waNVZFoXRJlKuqulrfNcLT0fon1
 Ou6fgEDynhK0gAAAA==
X-Change-ID: 20260828-selftest-epoll-fix-race-6f5fbe3c22e7
To: Shuah Khan <shuah@kernel.org>, Roman Penyaev <rpenyaev@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Heiher <r@hev.cc>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Florian Schmaus <florian.schmaus@codasip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5919;
 i=florian.schmaus@codasip.com; h=from:subject:message-id;
 bh=iqIVEAKOo7VIt9skJ+X5ethuxWMBv8HwEhS5rg+Hhxk=;
 b=owGbwMvMwMWoZLn8xddWhSDG02pJDFkT16tv/Nia5mwaq314Sa7H2Sod5S8Bt2502G390mwlz
 Tv11FeRTsb1LAyMXAwzxRRZppeyzrdSvPMw+8nvdTCDWJlApkiLNDAAAQsDX25iXqmRjpGeqbah
 niGQoWMUD5HTY9DILC4uTS3STSsocsjLL0ksyczPK9bLL0jNK0gv0EvLTCvJyMgvKk4FGqGXl1p
 iaW5uamBq6WbsaGTo4uxqaObkauLm5OhqZGRs6WjuauFmamFqZGBqxMDFKQBzTV05+z+LhtWl/2
 8l5Ly+z8FzkjND4Y/JtBTdh6eutW7OvOkuKavmuul37eefCwRmrr41X0dqe+evhQcPGrgeszv5h
 rPim2HUlJbFFtkv7a9ucVPbzvqAldd1jr7jx1WiBQEnsqQObojJMWN+/WvbNw3uOUc+8XQ8O7N3
 0b2d3xiZGIsLOUqYWX3ZpA8vWjVpafNVXh356WtE/dvmeJW6C+g0ef097fnlNtcNz91bpYof/rr
 zJNy+9X7fpYqa6XrLmr42pm1PtZt9QnmRa1/AqSdXms4/kBBvU/Xw33xBKUq/kH8Zj+C/bbKTua
 sXaGgl//04uVng1dMJGil//9bv/Lfp4tR7tqsqe075vIx/szQjuZ0HAA==
X-Developer-Key: i=florian.schmaus@codasip.com; a=openpgp;
 fpr=1357B01865B2503C18453D208CAC2A9678548E35
X-ClientProxiedBy: FR4P281CA0449.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::9) To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f4::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|PR3P192MB0909:EE_
X-MS-Office365-Filtering-Correlation-Id: fea12d69-ec95-4a46-6cdd-08df051c9f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|10070799003|366016|6133799003|10067099003|56012099006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	phJTKaMFNJq2GgSBmKW+PDU7oBj9xgRZhD/fR8o5EfGtAYBQXJjp8ETsyI71GoML7rqUd+DmyPzW72RnquwC0hHwKCbHCIIlXN2/BAzJxBIrH0YAuCbszGFMuCncMqNPylDPUULjHWPDsMCVFdU4dvcmcWheTbYjTNDWMeC2F0+DMVyf1q0BaTnsUGqzTNVWiFK8wLln2UAMYPEdwUglKmbu7gYNiHk4ryQxMkX+gVaO9kZv/RY+xZohYdw7AGHN0XTbghJJNKngEZ2u4NxUnRkybAPQ8Iap+YAW5LEe0PaGKXjH6Ny2FwKrarhvcP4VpWN/M9NwFKybn806VSJPjlGm2geLhjyftpgURoLMZjhsDslpUOgtr8EDdzZ341Z68mRHk01AyJGfnGDpwQlL1c/+lY3QFqQ3hkecTtXmGbabtGj+3FCWSzg+rlYqAET5eFAaIFKobMqSlerrloUDJQ7aRw0jzStcsDRou55SGtiMnxYBG3P2DhpSAQrucOmC38il0/qd5pYQJDDxejXq1hkcR3WVRrSqoeKTR1OQfuEnG0yG1SxmpmPK3cGDLJlo5AFrm7qmq41pr+UO+gCg/jfu2dpXLcpltBizvuqPMExWxuw4nbmHMMyAt2zHmigi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(10070799003)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzBuYWh3dE9YZ1oxU0Q1NU03N3ZabXBBU0NYdjFyaVpabW9vYmFyL0tmY0oy?=
 =?utf-8?B?dTNuWTVKbkRZZGJHKzY3TDRaV05ZS3hwRmIrKzIwT05FZjJUYzBoeVNlRXFy?=
 =?utf-8?B?VW9QNTR0KzVsTk1UTHlFWnpEM1R3S3duMVJ1SklkM0RNbXpVbCs0NExIeUFB?=
 =?utf-8?B?RnZxRmdMZ3pBSyt0VnhzdC9TTVVBVTh5eU11cG5zNGs2K3R5QmJvSVlERnhv?=
 =?utf-8?B?TUUvV1NqV29TSVdIbWxlbDFuNTBHbVEwZWxtK0ZXZFcxMHRaVWhHUjF5SURq?=
 =?utf-8?B?c3RaVzR6YWJ5cGJJTFNzcEdVaGMwT2RieC9yWC9ROEo2bWplakJadXY3TjI4?=
 =?utf-8?B?SGozN2FSK0UxMWFNMDZINnlhVVFWTDd1T0cvenBTNkhYVVU5THRXN0laMTJO?=
 =?utf-8?B?cndxL1dWRE9Gd1UxNnZLMnA2c1pobkZpdHFZaDZHMjcxdzllZkowdmtJOHlP?=
 =?utf-8?B?Z09Ua252WlEwbEtTRVFZZlc4MlE5cFZCYVRyMFU3Vmc0RHNnWWR2Z2pmN3FP?=
 =?utf-8?B?SExnbkFpRE51ZUNUb3hLczlHZU9Jc0t4SXJHaDl3bTlmMW0yVkJjUmtJOGFm?=
 =?utf-8?B?LzJUMnpTT1M2RG5tUENERGtpUzEwWExQUitPL1Q2WWp3aE02NDMxVW9TSGpo?=
 =?utf-8?B?NlZLOTNDWnc5RlRoSFFLN1dudWc0dFFSY1luTllGZHRKODVzN2pTVDFnZUIv?=
 =?utf-8?B?ZnlNaG0yMGZlelBtZWdra2hCQXM5QWpaUm1KaHUzRnhYVGJsWk8vcCs5RUpa?=
 =?utf-8?B?L0Q2VWgvYmcxZi9naWQwVnNhMGN3VCtBTWhGODVzTWpWdG1QNC9DaWFQNDhJ?=
 =?utf-8?B?YlYvZUhmZTE2LzhYeXQ5VGN4ZCt2R1VRZlpkQW1ubG54dWhWVndVWlN3RVl5?=
 =?utf-8?B?ZFplSTArd0VLMy80bjN3bUd2RENPbGhYVXpiSUtkSDVLUjh4RmVoeXpqenh3?=
 =?utf-8?B?bFhURWVlTXRRNXlibzE3U0RQYmZ5SllEZjlEcmJlckxiYlJWZWpZenRVampk?=
 =?utf-8?B?ZmU5OGRJZ2FXUkFKdHlVOURKd0VwK2p4U1RJclFMaE11Z0o2Y2NZenFUaEhj?=
 =?utf-8?B?ckVNZWVrNmRaRjhpNmpqUmNPSVg4YXlQekx3RDBLenpRdjZZWEZhUERnZWd5?=
 =?utf-8?B?YWU3R3VITVdQMHZRcEs5MzBhQ0IvRDhHMHFvMStPTkcyTWQ5bUs1aUplMy81?=
 =?utf-8?B?aGNEcTY3NWpHNmtGekQrZjR3bTRBK2s3RXBGTUlxVzNtSDhUWGNyRTlOQjBM?=
 =?utf-8?B?WlVMcklrdmlDeElMN2luLzU0Q1JISXZ6TDB4SGJyci81bjkvcHJPOWVTRklq?=
 =?utf-8?B?TDlWNTJ0RmFvbWpJTjdDNC9RQzdWTmpCOWJ4U2labkphZ05panFlNExVSlR0?=
 =?utf-8?B?dDZ6eFE2SjFiQVRmMDIvdVNuVFMzU2M5OFNnSzlDa09yNitreWt5T3JrK1d6?=
 =?utf-8?B?OUxGeGI4K3dUSmRsakZNcXIraDN5ZklRNEhOV2V1ZDNONll5Sm1mNmpKS25o?=
 =?utf-8?B?ZzhEVXNHSk5rWVZmS2VvWW91Z2ZHY3VGdkpvNFFMTlFPL1R4eG5ZWUVkRkxr?=
 =?utf-8?B?UGFFRndEdFdLNmtPVG9MOGZZcDlneWQwYnpxUHJkN1J6a25GeGNHYXdLd3BP?=
 =?utf-8?B?TnJxdjdEd3BPMnpuQU9CbHBmVkNJVEpsbDlzc0FVQnJQZnNBa0tIZWFTbFB5?=
 =?utf-8?B?NUZGdGdhZW9iYk5WOSsyWFRIWEM1SXNXNG9mQVZFM3JmNi82QVZJOEZyT2Nt?=
 =?utf-8?B?SGlHMEk5Y0NuRzFKVXZYMTF4UzFrLzE4V3BKV0Z2bVo0Zk5XWHluVXZHSGI3?=
 =?utf-8?B?dGRlOFRteWJjZVZTaTU0V1gvS2hwN0RiYWN0K2g3dzh4cXVyUjJ5TS8zb2N0?=
 =?utf-8?B?WXJGdlZLQmp1OE5CRllVQVFoKzVRV3RxelFBc0YvYVU1cStxdktpbGZ4WDBT?=
 =?utf-8?B?ZHVDdEpwVW9uN3VvR2NEbGRQK0xOS2grM1pPVENsRjNaeUJ4RlMyWFVZekRX?=
 =?utf-8?B?WGFnTW04QjNMQ2YxNmI3RnkzNTFwREUrTlF6M1NBTmtvTVdMaDU2djlzM1Y3?=
 =?utf-8?B?VGpwbXdaK2xDNkQxSURlY09XNWJCRWVwNEJLV05HZnRzbi96Y3hZcGVnVXdn?=
 =?utf-8?B?bEh0RTlsVVZzZHpIemRqQnB3YzM5TS9GZDRwWnhucXZQb2FUK2c3NlhCTFRu?=
 =?utf-8?B?ck1VTGo0aTNzb0I2V3YyaDFObzRpdTYyYjAzVHU2TytQdU5DS2dVQjFobSta?=
 =?utf-8?B?WHNKNXAxK081SGtyMUNiRmtqdDVqV3UxaGhJcEJYNjdQTmlsbzRUSlNoWkVJ?=
 =?utf-8?B?bEN2ZU5UMlhWaUhPdnhKNDBPbHYzMjlxUDJNVndoejRzTk9TekQ2emZpKzFJ?=
 =?utf-8?Q?fIHx7nDuSBTLu3CptSN+M1draJ34TOi/arKDIvFgjEL3c?=
X-MS-Exchange-AntiSpam-MessageData-1: lsyYVwklclbeHPTbv4T2k2D2vzZfOoalJ74=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea12d69-ec95-4a46-6cdd-08df051c9f59
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:54:20.2363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHaPGW3PJE/SPK0CFkQG4io74pdd2+BLi2LbeL8xYyzR/YzU1BjsCsSmg5G12ZTreb5nFBr4l+n4zEC5HBo34eRn9aLN7xGvpcrDZ+A8aDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0909

In tests with multiple concurrent waiters on edge-triggered epoll
instances where an emitter writes to multiple sockets (epoll16,
epoll56, epoll58):

When the emitter performs its first write(), ep_poll_callback() fires
and wakes up both waiters because one waiter uses epoll_wait() and the
other one uses poll(). This translates to different wait queues,
ep->wq for epoll and ep->poll_wait for poll/select, which are both
awoken by the kernel because of that single write. Next, both waiter
threads invoke epoll_wait(), but since there is only one event, only
one epoll_wait() will return non-zero because of the edge-triggered
mode being used (in level-triggered mode, the kernel would re-queue
the event because of remaining unread data).

Since the second waiter sees an empty ready list, it does not
increment ctx.count and the test fails spuriously with ctx.count == 1
instead of 2.

  Emitter (CPU 0)      Thread 0 (CPU 1)        Thread 1 (CPU 2)
  ===============      ================        ================
                       epoll_wait(e0, -1)      poll(e0, -1)
                       [on e0->wq]             [on e0->poll_wait]

  write(sfd[1])
       |
       +--(Kernel wakes BOTH e0->wq and e0->poll_wait via callback)--+
       |                                                             |
       |               wakes up                wakes up              |
       |               epoll_wait() reaps e1   poll() returns 1      |
       |               (e1 removed via ET)     (wants event)         |
       |               e0->rdllist is EMPTY          |               |
       |               count++ (count = 1)           v               |
       |                                       epoll_wait(e0, 0)     |
       |                                       sees EMPTY list!      |
       |                                       returns 0!            |
       |                                       thread exits          |
       v                                                             |
  write(sfd[3])                                                      |
  (event arrives too late!)                                          v
                           EXPECT_EQ(count, 2)  <-- SPURIOUS FAILURE!

Introduce waiter_entry1ap_loop() to retry poll() if the initial
epoll_wait(..., 0) yielded no events. This ensures the thread waits for
the subsequent write rather than failing immediately. Apply this helper in
epoll16, epoll56, and for both waiter threads in epoll58.

Fixes: f2728fe80cef ("selftests: add epoll selftests")
Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
---
Changes in v2:
- do not modify level-triggered epoll15 as it is not affected by the race 
- Link to v1: https://patch.msgid.link/20260828-selftest-epoll-fix-race-v1-1-977018ee6099@codasip.com

To: Shuah Khan <shuah@kernel.org>
To: Heiher <r@hev.cc>
To: Roman Penyaev <rpenyaev@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../filesystems/epoll/epoll_wakeup_test.c          | 32 +++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
index 81a994943e12..b4dcbcd79773 100644
--- a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
+++ b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
@@ -74,6 +74,24 @@ static void *waiter_entry1ap(void *data)
 	return NULL;
 }
 
+static void *waiter_entry1ap_loop(void *data)
+{
+	struct pollfd pfd;
+	struct epoll_event e;
+	struct epoll_mtcontext *ctx = data;
+
+	pfd.fd = ctx->efd[0];
+	pfd.events = POLLIN;
+	while (poll(&pfd, 1, 2000) > 0) {
+		if (epoll_wait(ctx->efd[0], &e, 1, 0) > 0) {
+			__sync_fetch_and_add(&ctx->count, 1);
+			break;
+		}
+	}
+
+	return NULL;
+}
+
 static void *waiter_entry1o(void *data)
 {
 	struct epoll_event e;
@@ -809,7 +827,7 @@ TEST(epoll16)
 	ASSERT_EQ(epoll_ctl(ctx.efd[0], EPOLL_CTL_ADD, ctx.sfd[2], events), 0);
 
 	ctx.main = pthread_self();
-	ASSERT_EQ(pthread_create(&ctx.waiter, NULL, waiter_entry1ap, &ctx), 0);
+	ASSERT_EQ(pthread_create(&ctx.waiter, NULL, waiter_entry1ap_loop, &ctx), 0);
 	ASSERT_EQ(pthread_create(&emitter, NULL, emitter_entry2, &ctx), 0);
 
 	if (epoll_wait(ctx.efd[0], events, 1, -1) > 0)
@@ -2925,7 +2943,7 @@ TEST(epoll56)
 	ASSERT_EQ(epoll_ctl(ctx.efd[0], EPOLL_CTL_ADD, ctx.efd[2], &e), 0);
 
 	ctx.main = pthread_self();
-	ASSERT_EQ(pthread_create(&ctx.waiter, NULL, waiter_entry1ap, &ctx), 0);
+	ASSERT_EQ(pthread_create(&ctx.waiter, NULL, waiter_entry1ap_loop, &ctx), 0);
 	ASSERT_EQ(pthread_create(&emitter, NULL, emitter_entry2, &ctx), 0);
 
 	if (epoll_wait(ctx.efd[0], &e, 1, -1) > 0)
@@ -3030,7 +3048,6 @@ TEST(epoll57)
 TEST(epoll58)
 {
 	pthread_t emitter;
-	struct pollfd pfd;
 	struct epoll_event e;
 	struct epoll_mtcontext ctx = { 0 };
 
@@ -3061,15 +3078,10 @@ TEST(epoll58)
 	ASSERT_EQ(epoll_ctl(ctx.efd[0], EPOLL_CTL_ADD, ctx.efd[2], &e), 0);
 
 	ctx.main = pthread_self();
-	ASSERT_EQ(pthread_create(&ctx.waiter, NULL, waiter_entry1ap, &ctx), 0);
+	ASSERT_EQ(pthread_create(&ctx.waiter, NULL, waiter_entry1ap_loop, &ctx), 0);
 	ASSERT_EQ(pthread_create(&emitter, NULL, emitter_entry2, &ctx), 0);
 
-	pfd.fd = ctx.efd[0];
-	pfd.events = POLLIN;
-	if (poll(&pfd, 1, -1) > 0) {
-		if (epoll_wait(ctx.efd[0], &e, 1, 0) > 0)
-			__sync_fetch_and_add(&ctx.count, 1);
-	}
+	waiter_entry1ap_loop(&ctx);
 
 	ASSERT_EQ(pthread_join(ctx.waiter, NULL), 0);
 	EXPECT_EQ(ctx.count, 2);

---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260828-selftest-epoll-fix-race-6f5fbe3c22e7

Best regards,
--  
Florian Schmaus <florian.schmaus@codasip.com>

