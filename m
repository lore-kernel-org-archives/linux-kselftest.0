Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020134.outbound.protection.outlook.com [52.101.84.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945C44A3FA;
	Tue,  1 Sep 2026 19:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292692; cv=fail; b=Y2KzIS85Yqbk+lnKbKWqxAia2/pG5IxrwQpiEI+T/3nBUfBbkVp3pRBi8hsO+SUUJUy/OqaGhmJfgg32VugU2CLGSawVbVNEBiUkc6t3e8PtdO2fntMLsSwWZJVl2mfgC+v4gpKmU6q38rJRHTrF4QO6XrH2/+ycDRZ0dJuUstY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292692; c=relaxed/simple;
	bh=Qpwpo/M/nI401WnFDQIAAQueWPjTEmI/v1IL2cQ8F1s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oti6+k0MZ4eSrhXGYi+HOkh1icXzQNsx7kKE/rhAD18uZYr3CrMNtKMbuBXZ/VXhe8on++mqa34rr9kJEoTkCa+/e7R1ONvrGNgmLokscBAh2JQ5jos4gLjjf8k1oTAaJGtVeKgT/y7w8ytMqpnPjDObIFhfuIRAFoAP2Z02J6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=b6X1BY06; arc=fail smtp.client-ip=52.101.84.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="b6X1BY06"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qb5S/eB9didNVzLUAw6Goxkt80VgvWlnHw880NlOX6eUrHn6Ry+cwjDYCGyZnZJW6wQ+tckrvs49XKXNtncMRJr8OBFNs6/zXLGbfLa6bPXmZEoD9wZlAN18NQ7RBQYVhxzH7QpRItBZRcZTHdwmRJQ4IAedKWXHd4oaoCBB5zjFsZXocidUTv0iTw8fNP7+t1LTAY8dq3u50JVjs+JI1cpWqjZXzZ+8GEzV8x1+yIvc2B5sxYamcq8UPXpH6e/tbnSPs0dJk8lYQ5nfGiwlN/ioLLUvNyq59yiSdcCeQiL7EGJkb1OsdNYa1OnQvsd79vI9KFH8hND37wmcT5JiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syYDpEtN7EAO6lblmvzHeMqrKwUyzQ5H18oxIziJShA=;
 b=xFyYHbiHwI+DEqJe+gsv6q0UNWNgc5AivxU9jm/Y+MFPYBrrnoueasTejTS38AwKnLCx6Stit8CSgqK83Hbi/7VXip0ggznSQasxxjRFkTVBQRI5gb6XKB4lD8YgtzS28TL2a7xmNW6LLVrdV+2ZtJCH14jaL5X8KAk1ZH7hwN+OGQ0UDV/U9e0j/soxbPWtU/J2q0bUh4FrFyHNYFMITyXA5WcUs5dIX4H2S09UtS6R1edaw3WyztjnxcI062/z/oKxzj+kyLpAenUlGezrLRA6ZzTLM5b4Hh9dAvergSLnau0w431wBX12/rOZSGxwosqvzuAnal8jk27LmYysHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syYDpEtN7EAO6lblmvzHeMqrKwUyzQ5H18oxIziJShA=;
 b=b6X1BY063M1XvqOx/tkBaSrLvVhCX5gH6d7uS4I6/S4Hcxvj+LYiuzi2q9DUDPboNT2t1qIJtOjabPANyyIdPtTGToTTpVfoMoaqJ8napjFnIjiujwwbh0wMrQvhhdNeF4mPNmdiDCGPQYHJ3l9kervt2NqKwML7CRHRCBrGojIiJpk3YqTGEwjCOr6u3xnJheHmetMi2NHORTMpYm84psgAvmJ73VAyDnA3fKXpW058K37bh0Tw7Hpa9rDHFGrmnza6DprFStR97OjVzu/E6SQLV2cK+rkH7i5tQLLFVKN01CQLloxpWM2mr/Jbjk9XLd/FQdRh7/6RHZdojGftRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PA6PR08MB10708.eurprd08.prod.outlook.com
 (2603:10a6:102:3c7::20) by DB8PR08MB5308.eurprd08.prod.outlook.com
 (2603:10a6:10:f9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 19:58:07 +0000
Received: from PA6PR08MB10708.eurprd08.prod.outlook.com
 ([fe80::1999:c6db:dc55:494a]) by PA6PR08MB10708.eurprd08.prod.outlook.com
 ([fe80::1999:c6db:dc55:494a%4]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 19:58:06 +0000
Message-ID: <136d2036-2bd9-4ee3-9b7a-2001147be09a@virtuozzo.com>
Date: Tue, 1 Sep 2026 21:58:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/core: fix unshare_test with large fs.nr_open
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eva Kurchatova <eva.kurchatova@virtuozzo.com>
References: <20260814165709.513263-1-khorenko@virtuozzo.com>
 <20260829182622.401275404893ef640e8c81e1@linux-foundation.org>
Content-Language: en-US, ru, sr
From: Konstantin Khorenko <khorenko@virtuozzo.com>
In-Reply-To: <20260829182622.401275404893ef640e8c81e1@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:803:64::29) To PA6PR08MB10708.eurprd08.prod.outlook.com
 (2603:10a6:102:3c7::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR08MB10708:EE_|DB8PR08MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6d198a-d838-496f-bd62-08df08635726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|10067099003|5023799004|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Wwhr2stkKR1xq+ARXTmK4FieWSqrgocV91QtKbY4rdMlDnA7WqxI0OZwFaPzb0Ai4Ju0KXQ7cfgzXkwJAgDOXtwwF8vBsBumueKC0e4fsS2cG1H9hX6pLhpvjBM85i4x4F0PXL/00tyvs6eyCWFTC/jtvwgLqERBN6904uyZXKZNeXOtQ0cEQS+40nNtNu0Y9HRJJ/p8+H35ut74kpIKtcJIXlYRBJztD5A+FJQWLqGw8YsOtqyl3bAZRZuTWjLhDsf/triIri+433mQSI+MU0g+6WFTVM6Qop2hyN/VOtyETKwbUMHqfiOtCV71bv9cbtzgrP0fqovs0Okf8He1ty1SDvTO8CXleIt0i0RGoOgAL5wfGaoOI1jjhFSojTAPxrfrmDgp4+QiRTviguzC9/2y8+9vDiVD3rX7kJrDVQCFoqnQ7tLvU6RjsHg70XzvhggIMTeim3vZGvTxqLo7bBnaej4H+WNFFkbKl9jkP9j+ZirQZurfLzbw/GN1P3tuNUHg8kEYFz02nIkBoXvQSlTlMfPjfd79zxgKlK5sXK2E4qxMaOouDSTiPslOuffFEfphzNhbpb8a04V1ljfvPPr7wEOwMGHJdgkSbXnAIzBQKCo2KKFjt3NiH2Dsmi8Y0gKTfTaVoOCgP2Hu5VdvV96126WfhMmpcu9ZfUp7T9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR08MB10708.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(5023799004)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEZER0Z2NEpPaXlTRmNkUmNCME10bzJDZThYcWREcWlNUW1MajRzTm03TFNy?=
 =?utf-8?B?VkZKQWdQY0tCWUFVMjBsYmtPRlFWYnlWazNlamlSRmg0ak5CK0lFdWhSTFpq?=
 =?utf-8?B?OGdaYjU5VldmVlMzb0xZWkRWVEVkL1dXa3pITGtOUXZ3Q05iTWxVd09DTnhn?=
 =?utf-8?B?amJUdmZiZ2FzbGFsVnRBTnZZWDE5TTYvZGxEbzlsbzRwdWpXQkFFc05mdjZ4?=
 =?utf-8?B?MGVjTXlqWHI2Yy9PWTEvVUZudXVUcVdzM21vVVRRR0xKVWdTMlpRbFh2cnY3?=
 =?utf-8?B?cXVWQ1AvakRqZkJrbXc0dnNCbGVvbWQ1WnAzbmsxQWdtTTMwZkFPUmtIRnFI?=
 =?utf-8?B?ZERoMjBDV0dwVXkzakFtTUJ5bGtrR1hYejRuQ3VxZWpjNzRRL0svYmtrV2RR?=
 =?utf-8?B?VkhkNDhyZEY5cEZQd2ZPMWM3aTVHMWJONy9RSTdrVVFhelZsL1djSUh6Q2tQ?=
 =?utf-8?B?UWxuQVQ4SzEyU1N2LytGbm5nVTJjWUQ0NlZ3bEdITmR6R1NOZkdhdmFIZzAz?=
 =?utf-8?B?QVFjSElPU1VhbDlySG5OazdlMkx2aTBtbldNd25SRG8rNjA0Um5ERnRleG9j?=
 =?utf-8?B?amprWHZ3VGdEeDFBbWIxWHJ0T1ROVTNORHJMSExDc2dCaVJpMUdYL2lSSnhj?=
 =?utf-8?B?dTl4SVJ0Y3RVczNRMy9FNVhRRVp1aUhjNHdSZklHMUYzMzU0Ymw4c0kzL1VB?=
 =?utf-8?B?b3BhRXBSN2pKd1NuRHhKa2I2VjJsWjRaRGI4aEszeW81eXlSVEpqOFN5QkhN?=
 =?utf-8?B?eUlabDU3M3lNTkxYOWpMdmZndUFkODRLU1dQdko4aHUvWTJUM1ZkYkF3MUVO?=
 =?utf-8?B?NEpVek02TGIwSkg4bUhnaHR6YS8xWG90MGwyd3JQSzB4OEFYNkVZdjdBUFJj?=
 =?utf-8?B?VHRYengzeVQ0NUM0Z1BFU3gyMU1zK0RGOS9yOHc1bVdKRUNHeXR0eDh2U2tD?=
 =?utf-8?B?aUl4cXVPZjcxWVpwenJ4am1uaFVVZzBiWE54WFNKbnlyTFdlMGlURDRwcmNq?=
 =?utf-8?B?YmRmWklaaEViRnNxejh5c0ovWmpVcHh1SlZqa2dsK1dpYTRid2MzbDk3U3kx?=
 =?utf-8?B?RFNXN3AzNUR6S0J3TGlGVnA2RG9WY2hBRGJEbDg2c0Zyd2UzTHpLTEFzb1pJ?=
 =?utf-8?B?cjdpckRsTmx3a09tRFJCSGNYSU5OR3c2VWlQbk1XK25FbEJHQTdDY3dYcXJo?=
 =?utf-8?B?aGl2aTU3V2pDeVlJemp6dWlCRU1pY00rUnNUMlFNYm1tbHFNUTVzT0FhczFw?=
 =?utf-8?B?QlNSRmEwUEhQQXFoRWt1bjhOUHdBcHFLS0ttMlBLTWREbUFXQ3BsdmNEOXEz?=
 =?utf-8?B?Zzk0d01tMjdnSWRHaWdxVGdXN2I0UTlORVZmb1IrZ25PTjVmeDlJZTVWQzFw?=
 =?utf-8?B?V2dYWVNRbm11TlQyQXFHaHo1Ykl0R1RNY0o4dDN6M3lFbGxWSjR2Mmt1cnA3?=
 =?utf-8?B?WEljbE9PNnFXVlJYOW9pbnREYnJEWWNHU2crNlZpZ29iVGRnUmR5dmhPRUJU?=
 =?utf-8?B?L1hqVDRwb0FWMjdEUUFCc0c5R2k0WmUwVS9zYVFjN0t5RGRveERZaDAwUXJw?=
 =?utf-8?B?WDI2Y2N3bWhRTXo3VERnSmxwbUdGWUhTZDlONjZIYXNlRmxtMTN2MXBwSnd1?=
 =?utf-8?B?Z2h1WFdKSUhERGhha21iaURXRUdoVmZZU2t0bEE3SHNxV05lZ0N0VDMyRXFS?=
 =?utf-8?B?b3Y2TU9ua003Z1hlKzZsOGxOTXdtejhaR1NiWnpKM0hINHR4bitaL3BOUksy?=
 =?utf-8?B?a3VGcHBEZ201TTZ6QlpZanpPbmVYeHdjRGZjSGFxTjlOR1pDb0xzdExrKzht?=
 =?utf-8?B?ckJwTjBvMnhJcVNwRFVIMmxiU1dGZkhHeHhYcXV1K1FNWXdST1NDRVJ5RFpY?=
 =?utf-8?B?VjhhdWhKNm9GQTJZeTZUbU9EVTNHYjdyR1ZpWk5oRjlLaUFvZldrZlRGa01C?=
 =?utf-8?B?MW9FK2ZPQUcwZFdRRlRiSzNBeWhyQnZuZzBMOGMrWU5FSzVGNXpJNkVxU2FJ?=
 =?utf-8?B?cWtvKy9BWGhBbTlyRmtZM0pVRTdKVDMwSTZiRUFIVEFxT1RDbk91aVF5Uzlm?=
 =?utf-8?B?WGlBQmpicGhtaXJJMzVVYVpZbFp6QzBRdjhVNTFsTVhBMkV1TXV6RFZ3RGZ6?=
 =?utf-8?B?NDZmQUo0SEF4YWo1UVVheWFhY3UyZVJSZFFtemxEbzVYNUJkUnVXbDlLRXdr?=
 =?utf-8?B?OHNjOENsbW0xMFJUK1poVUdvWjlyM0E3YUVyNmdPRTZZV2RmbTZBOEd2NFFT?=
 =?utf-8?B?ZHVsS0RvMmk2bzVUU0xOK0tNdFF4V2ZxU3M0bVhvU3hydzNBVi9iTW5FTzZu?=
 =?utf-8?B?WUZHUC9mTGk1Z1NWMkdoejg4OWNGM1VqZWRZZU02MkQzeUZnYWRsdz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6d198a-d838-496f-bd62-08df08635726
X-MS-Exchange-CrossTenant-AuthSource: PA6PR08MB10708.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 19:58:06.8707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IaKBLg4jd7QRCoTwJaeOJ9lj6RBqOifiVvZVRa5bF+2Lr5JTBhnXeM8D1YdarDGfkRQItg9gsS3Al8Pj33Z9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5308

On 8/30/26 03:26, Andrew Morton wrote:
> On Fri, 14 Aug 2026 18:57:09 +0200 Konstantin Khorenko <khorenko@virtuozzo.com> wrote:
> 
>> The test assumes fs.nr_open is close to the default 1048576, but some
>> systems set it much higher (e.g. 1073741816). This is systemd's doing:
>> since systemd v240 (2018), PID 1 bumps fs.nr_open and fs.file-max to
>> their largest possible values on boot, as file descriptors are already
>> accounted for by memcg [1].
>>
>> In that case, dup2() to nr_open + 64 requires the kernel to allocate a
>> file descriptor table with ~1 billion entries, which fails with ENOMEM.
> 
> 2018.  Can you suggest why we (or I) haven't heard about this?

The 2018 date only says when systemd started doing this, not when it began
to matter. Laid out as a timeline:

  Oct 2018   systemd a8b627aaed409 ("main: bump fs.nr_open + fs.max-file
             to their largest possible values"), released in v240. From
             here on PID 1 raises fs.nr_open to 1073741816 on boot.
             Harmless in itself: nothing was asking for an fd table
             anywhere near that size.

  Aug 2024   611fbeb44a777 ("selftests:core: test coverage for dup_fd()
             failure handling in unshare_fd()"), v6.12-rc1. The test is
             added, and it is the first thing in tree to deliberately
             dup2() to a descriptor just past fs.nr_open. This is the
             point where the two meet, so the exposure window is about
             two years, not eight.

  Jun 2025   04a2c4b4511d1 ("fs: Prevent file descriptor table
             allocations exceeding INT_MAX"), v6.17-rc1, cc:stable.
             Somebody did hit it and did fix it - but on the kernel
             side. Its changelog explicitly names
             tools/testing/selftests/core/unshare_test.c as a way to
             reach the WARNING.

So the report exists and the kernel half is fixed; what nobody did was go
back and fix the test that provoked it, which is what this patch is for.

As for why it is not seen more widely, distributions differ on whether the
bump happens at all. The systemd option is 'bump-proc-sys-fs-nr-open',
declared as a boolean with no explicit value in meson_options.txt, so it
defaults to true.
i know for sure Ubuntu passes -Dbump-proc-sys-fs-nr-open=false in rules,
so on Ubuntu nr_open stays at the kernel default of 1048576 and the test
passes.

On the other hand i tried Almalinux 10 (fs.nr_open = 1073741816) + latest
mainstream kernel and the testcase still fails there.

One correction to my own changelog while we are here: on a kernel that
already carries 04a2c4b4511d1, dup2() no longer fails with ENOMEM. The
allocation is now rejected up front and the caller gets EMFILE instead,
without the WARNING, but the test still fails.


>> Cap the nr_open value used for the test's own arithmetic to a known
>> reasonable base value (1048576) and restore the true original value
>> once the test has completed.
>>
>> [1] https://github.com/systemd/systemd/commit/a8b627aaed409a15260c25988970c795bf963812
>>     ("main: bump fs.nr_open + fs.max-file to their largest possible values")
> 
> Well, we do want selftests to run well on the kernel with which they
> are shipped, so I'm thinking we should backport this into -stable
> kernels.  We can probably skip the Fixes:, but a cc:stable should be
> added to capture this.
> 
> Thoughts?
