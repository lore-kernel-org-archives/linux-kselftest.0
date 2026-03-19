Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020094.outbound.protection.outlook.com [52.101.84.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E73DB64A;
	Thu, 19 Mar 2026 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938315; cv=fail; b=Gb3QxUseLW9QAhyGESL0gaCU+Cctgb5+z7mARszpSVpjnaA+mr+SqumSeyrzZOcFGo2PcAC6yVS13p9WetPhGdd2+y6bQQ4Pk4V0n4O722KRszFDcYb/bcrctjuiznXktCW+aGpdgVBx6nRywon+FXMZqk2CP+YKWqGcHscx28M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938315; c=relaxed/simple;
	bh=/K6yAS90zTmw/Qz4OF38/fmuRCw22Zjg0UV35qa/prE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q/bAYe7CyQti9XP4WfKDcHeC5S2RpkaYOHLGtE5KFOIJvM02h5R+bxQ3dj5fNerMMBCs/6TBdtqNnsHBLLLXx8ASx94sms7CI8tWrqKAiWBcdpkTIJo9BjkwkMg3HhQv9fdzIXK57G9G/vVQPtMQXYyEQsvKQ2FV1aRfWLjRpFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=XDsujyj9; arc=fail smtp.client-ip=52.101.84.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="XDsujyj9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYoSSkFyYdpsWtxv4HYPv2bXhoLPjQXoLEsZdcBtaK+eXgXs+0tYfqpg8K8skfucmYYcIQOiH9yp99OJJI3IrSkKEOZm0IDIsoeXXEeTjE61dvNZldDvgg7bLJtv5hjKIXWS1I9tdiEmEo97dsBalk8/qVOwwgkmayslU8zkT7DtyBhhH+sxS++nr9mUOoaSAnJ6E41saOLhCV7Hn6I5WWFS/vHB23pQIW/+ne8fiFZ3x7fmz5Qnbe9CXVcHzZoyD+MuLiKZAURdRxKvs7LwJXJCBVJAllyMD3OrzyQ8IOq7Je3KRwRzCFkJ6EkfduHan++AX8bj8L/4pHkirtIHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uty533LOHA+776CAJNzxcDckK6KIYJYc4jW00NuL0lk=;
 b=YpyBatlUSgDNrEbQJltouqDG6vZ7z6eaoOXgK7H/E+9sGJsvhlN5qKOyxW7QwEkkGPGZ8eTUthOfImWkb2AVcxjzbNfgUB/z0KQgIVh2KD4YminevY3EK17xt2wSkzm35KV4yQET52K5XLpWs9X9YqMrcL5WuxIebtxwEeVZ3rLFQs12BU9sI1vNkNR4JA1o+qJt9NhabUnbqdr3mVZq7SNHjMIWO+p7YzbP+TAP2hK2yIN4YLVX8o9R+ppDQnJD//n8XWhwdUr34+mjOq9Gm98LE2FpLKTpq0Hgn0ZiRQSdMczplT59EmlN2NtWCLinx0dsDLq5GqDN52fDjW9P1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uty533LOHA+776CAJNzxcDckK6KIYJYc4jW00NuL0lk=;
 b=XDsujyj944MnnBSA7fok0j1KeEh1xLBASVYnzz1tKvLNfNE45RLr72Mc5eaVIXF/UTk4XbciBamLATInrxRzpycb0dg5gQSdpfmozNwxLeEY8Iu3HqzZb5OtqTvEZK6FZmxjNXZWx2Qe6+wejcHwgqtE1XxALEpBnwr12yEI9YvQcaJaS5QR/l+3hU+oVHTdSlah2Md8O4ZFxEf3iVIRxx5ploWfuzvXlB5sXcz2BS3p43cFIvuqJ+dghodULHYbSdbXMLykWG6QvgMrJTHOs4/UtEf9i7dxthdIIK+FECTbCgtbPQvuGgahWZ8KtB47OwcP0vXSf9Mog/NIpOWZiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by DB3PR08MB9897.eurprd08.prod.outlook.com (2603:10a6:10:436::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 16:38:20 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 16:38:19 +0000
Message-ID: <d3932934-3dd0-4296-8ac1-f06b818624f7@virtuozzo.com>
Date: Thu, 19 Mar 2026 17:38:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: x86: test_shadow_stack: return KSFT_SKIP when
 test is skipped
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 x86@kernel.org, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20260301014733.454260-1-aleksey.oladko@virtuozzo.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <20260301014733.454260-1-aleksey.oladko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0480.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::7) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|DB3PR08MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: eae13356-ae80-4846-837b-08de85d5edb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U/fcD0QNIMBBLS3gc2sIlkXKyANMgxESZBUUPp2qMnjF+2UBiMBH9V6MSxwy0wJvhgf3icMMQ1iFy9ugXoLWL/QbFa0sL2l6qCIHVqQtFArYxt726hZ5kmVbQh0Yffrj9RLG2PiKDpKk5H4FXixmUdcXvaZvX8TOXAqvkHSzouEBEdrfXV+QNC1KvPocVkSty0QJ5NA+v94XE2G4GUjYFa4a0ROYQ9fBCC753esBQz/D9E9vfvd8vfC7f7tdUFcPpanoLGKC+wCLOlHn0CZKDuUgOo9Iu395/MXMqZsQ+47YU54pc6lNtKemEcuSzJsAfNIiBWiiszstNwACpcKk6mW2Fx1uS75OFH7Xh1qmHoGCRcrFD5BMzu/slEzYZhbn/cqCybWRPJNAnrLWnbQ7s24srp1BGzOJSCwXZLwKBFVxt09Sr/BcdgNZ5DoqFnpSgmIoPSIgv8NCZHT0j4tAl7+1WFrUYjqpnrWLOEx3nSEJemnU5RZKvn/u0th7W7hVJ+rwEiuabbnzsrhZZCXyZnhU29ZOkG+C7tr+QgQUzMbD9s5eM8HNU7oPiam/mPHwuQh7xtmRqPNr79hQhRqXAT7+EI5U/C9soaeXqcxoPKvN3Iy7ErnH8KBnfCHyDo9oUUr60EMe6HFb+1XChmW895LgvUPTqvArefP3Wx09Cd/MU/IJuYR552g9Am9nLsJLlm9OzF6w2WSKEhlP37ztPNr/X2+RQrIvBhpJ/JnNhhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGxxdW9Mc0dNbE1OT2h3Mm9iNUZwUnljenNTTkIwemxvOVV0czhHKzR3d05r?=
 =?utf-8?B?aDU2M1pua01VUGZ5cFpCSkNWU2NEUndYQ3FUWlFXRElndURobGZSUldQcXJ4?=
 =?utf-8?B?dlZzeWF4NnlkS2pBZzNZWUJqK1czVnk5bkVpT2R1bHNHMkp3ZjVuby9ITS93?=
 =?utf-8?B?L3RlNVFLLy8vZHp5cVBFa2xFK2ZuTXBRa2hIYXgzUXgrYnllNDNyZmR5ckNq?=
 =?utf-8?B?cW1KUDZxN3BwekhhU2ZUZkJWTnZYOENhVzFHLzl4V0JJRWRUWTFrSFV4dmRM?=
 =?utf-8?B?WW5zbVVvTmoxSEFhb3pXYVpXak5zQ09HZGc5UXAwMXpGZUd1VHZyczg0N2Fz?=
 =?utf-8?B?SjFvNUxKelpLU0dVN1dIU0dCVy8rbDJGM0I2UEs3ckhCR1M1VC9NTTIwTGcy?=
 =?utf-8?B?bUdlQmMvQjErbGkzOW9XWXB4OTV4MTFBZ3hPMEVVeURnelB6bDhsYUJDRjdN?=
 =?utf-8?B?d2NDenpGVmlDSE1iYXpSYk1zYTVPTDdoTkhlN1ZMd3Z6SC8vYWg5L1RkYjd1?=
 =?utf-8?B?MGZBbGIwR2NHTGNyMHBTdlpiMnVhYVJNMzFtcnNuMGU1OTZRRXpmSDJoM2JW?=
 =?utf-8?B?YUlZeXhUdVlaUGdSSFhFMll0OTlDQ2NhdXRsOFN1ZlQ4SEVOc0pTZVNMK05p?=
 =?utf-8?B?QzZkTHltSDcrdHBKWWtPcDBtSnF3TFFKU20xQnJqNFo2ekJ3QUh2dUt0Wjhv?=
 =?utf-8?B?L2NxTU9hcUZhN1N2bGJ0SkFYSnhrdWFhckF1RnAzZUVoWmlJcGcvWWJjUjRo?=
 =?utf-8?B?T3FjLy9yUWVtMEpKbGpZR00xOWdNTisrazA4bEJHV29QUHA4NWR5Nkg4RjFK?=
 =?utf-8?B?c1hhcVJUWjBFWTh2L2NPUEtuZExOcWhtQ244YVcxWXhFeng0bEFBcXArMVdT?=
 =?utf-8?B?akFBZGFucWJCSGZFWGlxNHRQV01RT3Y4TVlyNDZYZlF3c3pCR2RXWEJlNnRF?=
 =?utf-8?B?NkVrVzMzbnE3VmVlandBNnk0TUlkd2x5b2owdk1ndVU1RU5XYnRlRDc0dUxU?=
 =?utf-8?B?c1ZGS0xGY1ZWUXo2czlQQ1dCODFkT2JmWWJiSjdXdGV1c1ZibU0zQ21PdTcz?=
 =?utf-8?B?aHljbUZCUk9BeWtLT3Ixc0cwSXhqekdSc1BBOGY2R0JEeFhNSGVWdHFEUVpV?=
 =?utf-8?B?bDZOYmZtSDcyN3kza3lLbWhSWTFmc2xqSFIyMnAyN1FEM1ZQa0pJY3NTanJo?=
 =?utf-8?B?OFg0aFNHeG1UL29kVjlHN205WjFXdWc1ZDdEdU1kT2dCUU5RU2VDbHNXazR6?=
 =?utf-8?B?T1E3MmhteUxrR0pmTE0vQmYwY3FCcWlTMnNCNWswSHJERkFla2JWV2xkNnF2?=
 =?utf-8?B?ejBRcHVabnl3andPTE5RNDhBTndLaDE2MjAwVHhVNHFHVjJ6OWY3QlJHZldy?=
 =?utf-8?B?SHlFSjJTZERpTFY3MkhQOSt4N1pOMWg1S3dJTWFyWElRVko1Wkp4SlNMNUNJ?=
 =?utf-8?B?TklXSG9odjhEZVFmM3EwOEtMdTF1V053Q2h5UmQycCtLSTlEYk4rZTJRcm9P?=
 =?utf-8?B?K25tdkFhZVUwYmtUMGJuZ2NyR0h6b3ZMdEc1Yk8raHBhcVEyZ0EwRTZQa0xY?=
 =?utf-8?B?Yi9NWXNtU21nd1kwS0NNWUhFekliTVdua2V0YXJUTnE0RVNTTVVrRmhxVUo5?=
 =?utf-8?B?SEt4cnFBNEdUaEZOYkJTVkxFMEthdEpCMzVKR2wyTVZRTjlNUWJGOFNpR1Yr?=
 =?utf-8?B?TVlEc1dIdXl6QTFDVHFtbzdSM0FTcTlaL1NEb1VObVdWcXNTZEpqbURROUU0?=
 =?utf-8?B?L0xWSlJIc0phdSsyU0tQYW1CUjlmOCtRZTJzLzZwYU8zSWhRUGp0OXc1NkdF?=
 =?utf-8?B?MU52b1RNVEVNblUxRVBheERTeHNRdHNyMjc2Y1Q4QXVwQy9RMFRnWkdGNDFy?=
 =?utf-8?B?dTJpM28xZnFjQnVudm1tRFc5alZnTStrQlpMN2hScUlvWkdxTFV5c1ZIb0RQ?=
 =?utf-8?B?bEpOYXErWDk4dEVwVkR2S3FMS3RqNzFka2pwMWs3L3VJcUQvWXpaRS9VNjBD?=
 =?utf-8?B?NUtwREQ0NllSRHJ5UTlqaWVFcXdTcWtzYzVHd0RIQTdyYWtaNXB6elJqSW1K?=
 =?utf-8?B?eGRiR2tzdlFPWWd4NlUvUXJDaXZVVFAvVUMyVHJzSFluSllDM3NrYnduSGtv?=
 =?utf-8?B?SHZ2Z1FKckp4dytGUWpnQ1hNU1hrODZFbTI0dnY0VG04K0lPc0kxMTd2NmUv?=
 =?utf-8?B?SXg2am5YMzBUcFUwSGw3YnR6V2VLcjlFL1ZHTTFIYjVic09wdVV5RmNwZXRO?=
 =?utf-8?B?R2RNc2cvdTF2WDhOd1J3NDcwT2pFZWloR21rbExFR0FKb1dKWU0rc0g5Q3JO?=
 =?utf-8?B?WEk0cUhibW41WDhNaG5qNmM3R0Y2Y3B4WEZ2QmNxQXo1VnZmR0hmeGNLMXdR?=
 =?utf-8?Q?CfTQO7t+LPKw0E9rRo5/Wyt5zw5X2nbvxKZHBZIyIOxZ1?=
X-MS-Exchange-AntiSpam-MessageData-1: tycWLYIEl6MstRjWT+XsVwujpO/KquT1few=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae13356-ae80-4846-837b-08de85d5edb1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:38:19.7397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9XLh9WA6YzdvVYKcyDZHP64kV29k3SROGKkCRn/DU1Pbm+A7YJ3FAVQDOJ5tX4sE3G5sD5752jwrZAoQGbL4hx11rWBvIwZAB1qbFoN+fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9897

Adding original author to CC: Rick Edgecombe <rick.p.edgecombe@intel.com>.

Maybe he has some insight on why we have this SKIP / return 1 inconsistency.

On 3/1/26 02:47, Aleksei Oladko wrote:
> test_shadow_stack prints a message indicating that the test is
> skipped in some cases, but still returns 1. This causes the test
> to be reported as failed instead of skipped.
> 
> Return KSFT_SKIP in the skip path so the result is reported
> correctly.

Should we also return KSFT_SKIP in other 3 SKIP paths, which currently return 0?
I guess that means that those skips are currently reported as success, right?

> 
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---
>  tools/testing/selftests/x86/test_shadow_stack.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
> index 21af54d5f4ea..1747ea4cb725 100644
> --- a/tools/testing/selftests/x86/test_shadow_stack.c
> +++ b/tools/testing/selftests/x86/test_shadow_stack.c
> @@ -35,6 +35,7 @@
>  #include <sys/signal.h>
>  #include <linux/elf.h>
>  #include <linux/perf_event.h>
> +#include "kselftest.h"
>  
>  /*
>   * Define the ABI defines if needed, so people can run the tests
> @@ -981,7 +982,7 @@ int main(int argc, char *argv[])
>  
>  	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
>  		printf("[SKIP]\tCould not enable Shadow stack\n");
> -		return 1;
> +		return KSFT_SKIP;
>  	}
>  
>  	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
> @@ -991,12 +992,12 @@ int main(int argc, char *argv[])
>  
>  	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
>  		printf("[SKIP]\tCould not re-enable Shadow stack\n");
> -		return 1;
> +		return KSFT_SKIP;
>  	}
>  
>  	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
>  		printf("[SKIP]\tCould not enable WRSS\n");
> -		ret = 1;
> +		ret = KSFT_SKIP;
>  		goto out;
>  	}
>  

-- 
Best regards, Pavel Tikhomirov
Senior Software Developer, Virtuozzo.

