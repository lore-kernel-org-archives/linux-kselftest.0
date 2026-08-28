Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021074.outbound.protection.outlook.com [52.101.70.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A753D524E;
	Fri, 28 Aug 2026 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915032; cv=fail; b=SrRyE2CvhNlqGwwTGSs21OwdXIy4xkZKRcPfkus25YjCcGM+/ba3W5pxuEBSs0XEIeLc2wUyIhDMdaHYfVXrI3TaecPkafbbyPiuOiPLGNB93LDH3JiJlHOvpNikQCNJZH8yhR1TPOdiYjHEMqco0tE5Coh/kqa5SzNo2X2N/0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915032; c=relaxed/simple;
	bh=NRCrF/w8NbLAFLsdv2FoIFPzsyPDrkAtxhEs5NjKwyY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=rWXkLIJtj2rmBsZGq8zu6HvKQwOiNuHlv8OUDeO3SweOzxNUvPPWVxnABJV1K2HCjMnbiRK50HsU6/se6b4Oav8c1y9np9y6DGNUIZObkCrnFlLNDUyTjykkt/kcUBoZJHbccfbFVkC/4Etr1iV7v9bLkvBiJ2KTv83o4DdLso4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=oePGDuSJ; arc=fail smtp.client-ip=52.101.70.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="oePGDuSJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR1xkIKyA6UJLIuG5CRkFQcydJ2UQlRw5Eqy/+GKC0MaJOMDwLM8D+Zzg2njQQnggfj9FC4fkVzhWmc0eGCMk0zGVTlG86nFspT/8Wsv/lVd3bIDAY20lSxz93r9UHC1Ig9BJPJQ9AtkPTPt0YsqAgHvQOWq0mkDH/OzFxRoyTSUShtb9rAuF/mgSyMNNhr9O1t3gG7lf57KLlezi5fpwykjnQmrwf8zMB/4oWQ18xFlPA/Tr9iMcxUJeA6hzma7zbMlFt0KO43AamBpZ7ylDYk2Nm/StcwIoIB0vrac7EcsPIgSbi/3M1+MxwV1OhvJnmUUwjUMI3UZpHDzi3BIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EzMVGL1590THBLmFyvDeZKRe/VLtXGDAC/nNb2peFs=;
 b=xKLJZdqB3R2/9OsskJHNi5TClSujBdUSAlbG2nWvrwQkccdksx5ghkffOcby9CdUtTtN0e07HCN++kJya8/dHHgbF1t5z/SLI0Jz/U2PS6kOlEVmDHDYCFdTSmU4pvlOY/8C/uO/nEZD/SXgN/hRwspdvGlD+Z59Sz2tZ2W++vmZBatrxLVx1+G3sX01JlUCjhvB4sBFrDTwY278qU6s2Wdor9u1uFaFBzkn58io6m9k7dM+NQhORkqiHHi4X5+QHWZ24T2mA5X9UQFz3uS0vKl88PDIv3zxk5dXyVCYQIhABoeBUIRsPAIW2hJ+wsK1QsUefbb4SgKUhH84Bl/TSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EzMVGL1590THBLmFyvDeZKRe/VLtXGDAC/nNb2peFs=;
 b=oePGDuSJmsVJIIQmP3Rab6S+iYtpWUmSOWXWcMomiI8v/OLQrxUyimtqhunCSEmzmhA415V2vHwJ6YRI5AfDFmx4M4wYLPSG7n/3pfFjeUz43/yNS5nSLmgudsYpTf2DTJnSTgxF7AhWoW3MSZt+8cRqnY/1dBeN4KYkZA7DgmKaQZcv6ilWmLaX8s1afyEo+IWp2Il5uy73/zSCyB0qKbG8qlqwdsaB084u3Z21YKmFunDbal2CYFJ5HC9je3WvYJCbhqZ2crNNo2Qcko7qmUFjmq+aGW1LkyMdUCIkO4mXHpAdGtXyP5oyR81y3ttyC9ETmLK2SoGktw7WfDQntw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by PR3P192MB0842.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:2a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 11:03:39 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%3]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 11:03:39 +0000
From: Florian Schmaus <florian.schmaus@codasip.com>
Date: Fri, 28 Aug 2026 13:03:37 +0200
Subject: [PATCH] selftests/epoll: Fix race condition in multi-waiter wakeup
 tests
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-selftest-epoll-fix-race-v1-1-977018ee6099@codasip.com>
X-B4-Tracking: v=1; b=H4sIAAhrkWoC/yXMUQqDMBCE4avIPnfBrtRKr1L6oOlEtwSVbBRBv
 Ltp+/gxzL+TISqMHsVOEauaTmPG9VKQG9qxB+s7m6SUumykYUPwCZYY8xQCe904tg5c+5vvUDk
 R3Cm/54i8/crP19+2dB+49M3RcZwLTeNTewAAAA==
X-Change-ID: 20260828-selftest-epoll-fix-race-6f5fbe3c22e7
To: Shuah Khan <shuah@kernel.org>, Roman Penyaev <rpenyaev@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Heiher <r@hev.cc>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Florian Schmaus <florian.schmaus@codasip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5944;
 i=florian.schmaus@codasip.com; h=from:subject:message-id;
 bh=NRCrF/w8NbLAFLsdv2FoIFPzsyPDrkAtxhEs5NjKwyY=;
 b=owGbwMvMwMWoZLn8xddWhSDG02pJDFkTs7kuHeuyTb37ebOn/NyP7+OYrBgrbC4r80Xbnm7TL
 nXP6aztZFzPwsDIxTBTTJFleinrfCvFOw+zn/xeBzOIlQlkirRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 W5uamBqaWbsaORoYuzq6GZk6uJm5Ojq5GRsaWjuauFm6mFqZGBqZGDFycAjDX+C3mYJgvMOmdx6
 cee8tNKk3Le/5sTGFav6Y/aVLbCv4yjmfM9yaF1r1b9SrpZM+npQr3Hh/5/tN1zb6AxOMr2OfzH
 HLfbumWsbykZ0WjtstMdTkZjkOWE+f++FfAb57UU6oz95dvwJQgo7+f29bc1vToVvTbyRM33ah9
 uqGWjKQNv8KRnk8nPEoaJKWmOy4skpthHuNbGm+R9WfKNVaGrouPGurr77b8LF5Y2fpbIOFdbMj
 dUwa5szLco0L3NLreTrX64dLyWMFWuaUwX698is05F5NS/mMBB9i95DffPNIuxrhlC2Pzx3OLOX
 QX34j5mniqe732nyusYZmn1n/QqelUmanU1Kq4p0Ih0fmX4cREAA==
X-Developer-Key: i=florian.schmaus@codasip.com; a=openpgp;
 fpr=1357B01865B2503C18453D208CAC2A9678548E35
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f4::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|PR3P192MB0842:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6cad57-23e2-484e-600d-08df04f403a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|10070799003|366016|6133799003|10067099003|56012099006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	iI9KACAsC+yfu+muL6n5YcdcDJSaoY0319sJ8Nyu/qbF2EM/Q56ASJT52ZznMU0u4uvzV6Dj6xi1z5tB5tnMb+Y0ZLzSuztIreu4Ke57bC2/sIRZFP7kVKxZlEObAQiUIJw6Km+8cIZE6ecwRoPk01dMOzgbsXUVMFnd+g6Uzq9BCbSiSx4WP//TFhks7Hg6tXHEQwPBFMMCyl2ax26RNaCM5zNhLSuD1EY5iq2tqI+Tq8TewfRIO0oTutSb+I31VLGg+io+4ZdgDusnh82UWN5npwsHmBnIuU5b0DpJlbsvGZD2w3ohR/KMyzkBrMcMXtG+NRbo9fipMZJcd1gDrRIyciRNQnf5cKbLvFX6wXGQyrT5KLROxEffx6hqp8YOf/bEkRAyROyeHHt7eHB0gs2LCkWdB26ORaAtkuYdCjndDrppJ/PeMch+KegBj0HEVPD7sJPCElPQtB2pV7KZbJViMug9x7Edich57RWKDkK+NiS/vcFqFiSFzM1oKjij7Lhkx0YHN4q8RGDTh+TbyYWAcHVcRsiW07vEKnVTykaDNB8auhvtthawmB/U5J/m1Q8Rh9bznJNiXxxtghDVPRdn+pvZFcflgnKc6CdD6zEpj+l8JeoaeVT0ML43pO9kRaY62Raun0OwE/6hTL38zR1WwVS2SgCNv0vZ8M6XF+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWlWTzFyOEwwSUUxTWR4czlMRFV0eUt5RDBDY2JPQzhpbkFqbVg4VXRzei91?=
 =?utf-8?B?ZE81OXYrRVVVNmZ2aVl0eHVadUFpQmJzeTA1K0V0ZnRXU0FuYk52RU5lOEdU?=
 =?utf-8?B?ZTZEanpKa1ZsaEo4SGJ5QVJuMS9SOW45YldKMDNJcVRKUjd6ZkxJaHhrMmlT?=
 =?utf-8?B?WG1MRlBET09ycjdmZmpHTGMrRUg1UUgyTXYwYmxSdTJReng3a2U4UXFEbjdT?=
 =?utf-8?B?ajQ1dmhZbmFtc3h3aTdWTHBHODhhWUFrMFBNekkwOE5xOEZwUy9WcW5zQ1RS?=
 =?utf-8?B?RnRkaWRHSGdjcE1jMHZNbkhEVlowTzRZZjc0MUp5dzRSUW9oakdXaFlQQkxF?=
 =?utf-8?B?VmliTnhZQWJzOGRwaEEwNWJvVjBFTmZ1TjFQbFdlbVdMT1ArV2NlMExhblEy?=
 =?utf-8?B?TE5vbldjZlFrQ3ptM01zbjVNdzVnVGNCL3ZpRUlhMUFZU3dpU3Zwb1BrOE8x?=
 =?utf-8?B?N1pXS3Q1L1BzNHhTeHBrZlhSeDNiSGRHazEzaEpTa3MyVVZzOWxZTjhZWC9U?=
 =?utf-8?B?SmJXMTBqNHJoOVBGVUp6dUVWMEphS2VQS29FTHpCa3ZNdFAzWHkxY05Qb21j?=
 =?utf-8?B?MmQyQ2s1eGZuWUdBNHRtbUhjSm5pZ012bWlwdWRHRlllSnRZUWVGWCt2MGg5?=
 =?utf-8?B?d0gyVnYyeFpocEU5U2dJUWQxVUpLdzhJajVaZXp2K1dxYW0xVTJ3NDN2QUsr?=
 =?utf-8?B?eU1VcjdmUXNaZGJ3RU9WMzBaVndDMzllcVliUmlDaDVmRU04cjkwRDJGWVhk?=
 =?utf-8?B?UWhmZE5SbVBETDl2SG9mM1hXSUtRemh3TGV4aEROY1F0dXZrOTRNUnk3b285?=
 =?utf-8?B?aXI0V2k5N2RZaUtaTHI4dTduT0h6dUFHNy9rREFFVE1qTkJPSnE5U0VxLzdG?=
 =?utf-8?B?ZzRycWdoUnhDbHgyVEFTaHlyTWJLcTZ6Y3RWY1ltYm9kUDJsaEZqV0p2Umh5?=
 =?utf-8?B?K3J6dVF0aFNDRWRZek5XZTRWczFVWjdGY0c5c2FYSGVFSzhUbEpxT1RlVTBj?=
 =?utf-8?B?VGtLVk00RllyK0VYSDhDR3VrN2dRNmZaWGMxRHQ1Vm5lRnhpMERKWFR1Rmxo?=
 =?utf-8?B?cHhldmxLOXB6a0R5ZUd2MDBPMnJLbHIwOWxMN3M2Y1pxWnZFcnpEaXVXdytD?=
 =?utf-8?B?bE9PZTRWOHBFVHRqN0RmWEQyWUFua3BFMXRhc0NoNDVVTVpPeVlrZXQ3di9L?=
 =?utf-8?B?NHBkS2lSMU4wbEdKTmM4UXYrWmNueldsdjNlLzMwL2RxMmhGWFVWdkQ5TmlM?=
 =?utf-8?B?elVZcUZTak9kK0l5dCtzNXZMeGNIMXBCb2lVZnNyUWhvUFVNMTg2dHA0UVo2?=
 =?utf-8?B?NkQ4R2swNHB0dWYrRGNMYW5MV05FeUxGQ09CRENpWXk1SlZoOVYwcUdXWjZZ?=
 =?utf-8?B?Q3pPdVVQRlpqTFJnQVJ4aUtPaDVMUUc3TFpMbEM3endoT2ZJcEZ1Y2tHQktz?=
 =?utf-8?B?Y251MUFESTc1RlA2MThRYWZvaW5CTVd6MWg1cnFaeVRCQnYyZHZxUW0wc09B?=
 =?utf-8?B?S0JZZ1RMdWxOaHBNTVdjMzJaYXAzRmF6elB2T0hlNktQN2R2NFZUbmZiblAy?=
 =?utf-8?B?VmtMa0pGMG45T1RkL01xYS9QNFNEbngrNW9VZWNYY3FlRE8ydWN2NXpCdlBV?=
 =?utf-8?B?VlhRUis3c01rVW5XR0JLZ2RIRE1CQTNiK21PYndaVzdXZXFXVVV3TkFWMHhr?=
 =?utf-8?B?bkFUdm5nUWRyR3N0VWVoQ2ZkemVwcVVES05STzlrZmhObGF0TitqOVpyUm9j?=
 =?utf-8?B?djljaWtUaEVIVWxNd2hiUFUwMnVnOXpNR3ZaRzVPQ2Z4SjljU0Q4ZnJ0T1B1?=
 =?utf-8?B?U2docHZ0L1lReVBGK1FVNUwzZXRYclBPSFJXTlFUc0d0ekl0Zkx6ZEV5eWRT?=
 =?utf-8?B?bzNNcVo5RHJVVkFNM1hzT2QvWENpS1ZYUGJGdjhyTU1ueWRER2w3KzE1NWg3?=
 =?utf-8?B?eUVFMlFocGtTTGNCZ2cvK1Z2WnlYWVp2SHIxOXdibEx0b2hEbm5DV080cjFP?=
 =?utf-8?B?REl2RmN6RHRJcVM0Z1ljanIvR3FRZTk0dWk1QnN6YVFUVTVQNDdJTjlydEJF?=
 =?utf-8?B?QXJqaE10OUxpVmJ2cXJYQ3J2Z3hsdnQ5eStjWGlQTWRlRjVQNEpCMXowK2hq?=
 =?utf-8?B?MlEzcHJzc0Q1aEpYVllqejh6VW9qMHJ0bCs5Z1FZMmkraFZSSDdFK3VjTUJi?=
 =?utf-8?B?K0N0Vjl0aU5WelB3RFZUcCtrN2dnUXhGQUNEOE1tbjYwVzJmQkE2QUE2TFR3?=
 =?utf-8?B?b2FZRXZYRXZYRitvdDZhbDdLWnI4UUQ4UW5HUDBRbnZ2b00wN3YyeEpTWHFp?=
 =?utf-8?B?MmhkK0pBQjNYVzE1M1V0MzJCTFFFb3BNK0Q0cXRNd25sSElYUE1KL3VtemQw?=
 =?utf-8?Q?0m45lKL8zS1+CT2CGtESdCjxs4X+ATeilHfnAZPQpXD80?=
X-MS-Exchange-AntiSpam-MessageData-1: 2XmhU4JnST4/qLeV4no1dtQ/gNL/m30LCzk=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6cad57-23e2-484e-600d-08df04f403a8
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:03:39.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qK0h0ExyApmQaAHijcQ0wXPwgkmL0ivGEowhc0JvORakB3CaOffEE11N+zxlez5//+gGKwiKtjfvETbPAXoyWdi4P64N0Ioy2ZsJfywgkvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0842

In tests with multiple concurrent waiters on edge-triggered epoll
instances where an emitter writes to multiple sockets (epoll15,
epoll16, epoll56, epoll58):

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
epoll_wait(..., 0) yielded no events. This ensures the thread waits
for the subsequent write rather than failing immediately. Apply this
helper in epoll15, epoll16, epoll56, and for both waiter threads in
epoll58.

Fixes: f2728fe80cef ("selftests: add epoll selftests")
Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
---
 .../filesystems/epoll/epoll_wakeup_test.c          | 34 +++++++++++++++-------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
index 81a994943e12..d4267730f5ae 100644
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
@@ -760,7 +778,7 @@ TEST(epoll15)
 	ASSERT_EQ(epoll_ctl(ctx.efd[0], EPOLL_CTL_ADD, ctx.sfd[2], events), 0);
 
 	ctx.main = pthread_self();
-	ASSERT_EQ(pthread_create(&ctx.waiter, NULL, waiter_entry2ap, &ctx), 0);
+	ASSERT_EQ(pthread_create(&ctx.waiter, NULL, waiter_entry1ap_loop, &ctx), 0);
 	ASSERT_EQ(pthread_create(&emitter, NULL, emitter_entry2, &ctx), 0);
 
 	if (epoll_wait(ctx.efd[0], events, 2, -1) > 0)
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

