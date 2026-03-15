Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020081.outbound.protection.outlook.com [52.101.69.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBE423817E;
	Sun, 15 Mar 2026 19:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773601734; cv=fail; b=OsfhI6ftNG1Qwvyl6D8Y9vo+xVtz+1mtTL3vuoW/7EjFuU11/4OXYnOg7KfCwUL/npux+99FGHwEQqrZtTjfAE4xoWhylSv0UtjS96BdKUYDUVhaqCxLFzowEdJmLcaGv53l47IY0RnIvUgGx+aLUane/z/8IfyQUV0eYloRaGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773601734; c=relaxed/simple;
	bh=+aNKPjr4boL0t2HPR+egGrFhRkRAbJ33dZg5hoMiZC8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=al20b2MF9gXFI4tZCidnmct+rJaW8XcgiS5ogFM4lFI17681rMt/2KkIIcxVmX7ABIBbsa+ORZ9w/wNZifUxJPOyyfmn74d3mH6mdeuHUWYxWboKM4oESbc2n8SzRoxmvJ/zg0knLBUXGFBB/6sgNNZHD3En6u+ts0nPfjNU+VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=yqEWGcic; arc=fail smtp.client-ip=52.101.69.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="yqEWGcic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxVvLA1FEfTyKmrUn+WZDFQKLrGc89iuxjc6VNqfd/AOZITgRUsr1rq37kh2tUsL0meCvRnM2g7gvMgFvrKB5ebu0U8tITYW3Awq9JcDabH3Sgfv0aBU11Ve32hKJUvj+XCEAHnB+LQjX7redtouDtH4dPE27g/lgO+Yj4qRAYQJHPv3sYkeCn6J6+t8Ze07IOJkFMGpsfRnlE/jS7dm6gpHK7Wk0P8mmDmvo3ZFWnZlAO+K8uXP7zyK9FbAGR/dlVO373vvmrk5jkbD+RgUeeRfpj8L1Ww+VCAqVbzEJqKeGjI89Oo/vXalpHWalcUuHS+trtcMmbDPnBNettcc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJeWjC5LXKR6EhCjSRcCJKV3iRWPBU3/gSF8fZYVsjI=;
 b=XlZ94aZZKsHGL8ey761IzU6sTNL6AULTdRKN1YMcHnoJow2oUm3stDeXuWj9Pu9e3BZ8C76VpQsuAMDoNzFc9aOy+tGRwHKvEstjkKSG6sT8GO2mqY9D/V1RrFeGsV/az9AuiiYYDpIQ+QnywlL7yTG0FQvevACZjeQRvchLSZnVr5mJ4r6riWLJoUpcZqv+PYUp+LsrwtF8EMLo90wxFIV8bAmIcQsr6u0UDmWzajciCATHRLuSwR+Q7W5tVNsqLPaUybry+qByoyRDlvJPSuglRKTktRbQhCcxyfTbbPTvdvvX3gWUBQSkY1Tp8Aqz3OltBxpJ+CIt7NZLwf6lzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJeWjC5LXKR6EhCjSRcCJKV3iRWPBU3/gSF8fZYVsjI=;
 b=yqEWGcic7C7oLgmsFglI8PJG5A8AReWWTADrQehNITOH2DLG+xlLDhdluf+BVz23d8/WIFOih7LNXSv3L80/liAlRsa7lhGxsdXb1pWaI6nkARIDb9YslxkkHqVaiD48CaststaOGeoaGnrDNNiZbjaeEb3xA0H9RtAfQrxU16g3qc9RJP8db8MDD+RX+8ZlkC7bCQvOJQmf+536cKZw29gCsf50G23GZonbLwuXKq7l8hqffIga86GLiDZBSY2TKWjGaVhz0dAIEqbDiZJDP/8zoCWxpDdPBb6vUoVyMa+woJSfYyR0f3APDjAAATznAnT1ejBdOp3jnafUlcnIcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB6355.eurprd08.prod.outlook.com (2603:10a6:20b:363::24)
 by AS2PR08MB9920.eurprd08.prod.outlook.com (2603:10a6:20b:55a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sun, 15 Mar
 2026 19:08:50 +0000
Received: from AM8PR08MB6355.eurprd08.prod.outlook.com
 ([fe80::79bf:15ff:6428:dea9]) by AM8PR08MB6355.eurprd08.prod.outlook.com
 ([fe80::79bf:15ff:6428:dea9%4]) with mapi id 15.20.9700.021; Sun, 15 Mar 2026
 19:08:50 +0000
Message-ID: <29501b9f-4c69-4687-823d-8df6b13bfb76@virtuozzo.com>
Date: Sun, 15 Mar 2026 20:08:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: x86: test_shadow_stack: return KSFT_SKIP when
 test is skipped
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Shuah Khan <shuah@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260301014733.454260-1-aleksey.oladko@virtuozzo.com>
Content-Language: en-US
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
In-Reply-To: <20260301014733.454260-1-aleksey.oladko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To AM8PR08MB6355.eurprd08.prod.outlook.com
 (2603:10a6:20b:363::24)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB6355:EE_|AS2PR08MB9920:EE_
X-MS-Office365-Filtering-Correlation-Id: a62145cb-1800-4fa6-403f-08de82c64aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vX7y/zq+bP9/TBvXD9WO1H/egk9HzzFCEa2AsP1LkSinsBxULHyj9HRdEIEXONLYr/vZiNkHrc7hsJm/vlFrcNkn7nknlA3dl4yjPgiiD8UxAasCwufAhrlKPIy39X9Lz9ZGaGP+9kW7Q8F7NNrSB39EVhYDvVgwl16b9eAFMhhEbf7CLvf+p3G9NNpmQk4wKfh936YawxuhHeQ5RM0S9pUiCThrtK1kGvKPgyDQgZErfeK3TEEGz2qHQhV9c2nh2B2oqdE+CeGLK9TONIPYsZ2I7QGvLuh7TmlLKlwMJ8sdViaKpIjVi/QAtGvaC49AZ1U5n5+irAtZbiAWHxUB60InaZj7YZTsFenMpoWSwTYXrp6V38JqfLlQrNS+Wz09HpGbq6wyznz0tOTujt30kItlV5+90+Lf8ugbYNiE5h/YN4G0tEaDV64gE1ObX2URDUiO996PZFYQRyLOSNQRmcpsanMMAs+IGkhS5FLBwDR/LEoHgEUxR3U7zYFD9Cc1zKkPsf3764GCW+J+OJf1V9gVDNLCS3P166Iq+XMDExJF/+56HmBhBElX1XusP51A0cga1U1igCbU2rrBwZnD43CryY3MTsV1U6AHKU/LEZ9bucuoh2Ppg2ymeYC3iH5SP8tOUnHpxdvuBDS04aBONBJsOARb0nLaAKjV8fDa1vUS37MyHq2dHDW5kmxySyTYvOzM3CWFvZskyPvcQRaunWyEzoKJrMFqW/01WHHkQLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6355.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk90QmdrelVkYUc1NndSaytwVEZaeGlsVTVrb2NlY2NGTEZlVmMveGYwNDVD?=
 =?utf-8?B?MjZlUTdGM2RnNVBrbGZJRmc2YklZcUg0THVMYkoyZ3V6SFdEQmpJSjV4Y0tu?=
 =?utf-8?B?WVByN1EvT3JYUk5uYVowL2NFZ2dCekRNWUFCT1ExcmdCemVkU0dCZjBNelFi?=
 =?utf-8?B?eUlwaUNESjMzU2ZHWjg2NU0wVHo3L2t4T1A1b1NYZ280ZFAreTVFSGJWUWQr?=
 =?utf-8?B?dHZXYWdUQ25CSGMrMGdBWDZJakg4cmlTb3NTUGpmQ0Y1cHhtSzkybjNxZDJR?=
 =?utf-8?B?bDJlNWdXdDU0K1lablVteE42MzBOTWVTaG1MTEdMcFZiclFsSnlKZEY0VnlM?=
 =?utf-8?B?REN1OEtYai9NelFBSzJ2ei94VGxyd001UDVkYnZmYWRYaURUWHo3cnZ2NlYv?=
 =?utf-8?B?L1hLc01qWXZGcWdkYXNma0diZVBXTG5ZSjdBc3FVdnYwOGJyZlE4M1ovSnFv?=
 =?utf-8?B?KzM1K0VFVWxFbEFTVW53dWdvMU1hbzNCQnl5aWtCTEFQRzNEK1JqZmgweldD?=
 =?utf-8?B?eis0b1FYT0xCVGV0aUY2TTJsaFdqVUwyYWVhQlEwazhiRFlIRm4xWGhDcnE1?=
 =?utf-8?B?VXpYZEpGSjB6NXNBa3ZGNHpkaDBUYkV1L0R0RnJmaXptU0x6a3NRUzdvMzJT?=
 =?utf-8?B?SDFvYUo4ZGFWSHlJRGV0MFRMdlVTTGQ0V08rNWQ3MzZKQ254c0RoV1pJSHRZ?=
 =?utf-8?B?MHJiKzlNZTNockhUSVFYbDRPejVBNkVZRkwyd0xnSHZEbW5MdzBUZ1d5TzRh?=
 =?utf-8?B?L0NObnA2UFQwRDNNVkZGa1JNaTRwSjlRQStQS0pMQ01tWmRESmNscHYvZ09h?=
 =?utf-8?B?c1NoVEVDTXIzZDRiOXV0NVlMcDV0dFFuOVYwWktkUXVHZFMrcVlLcmRJR3hG?=
 =?utf-8?B?OWI0akg0OXBHTXhjUDV1MDNPZUR4STlZeUZTeGpibmxBa1lUTmsrYWM0Z1dQ?=
 =?utf-8?B?UHM0eEZMUFZpaFdOWlNQV1NjREdBeThhMldCWWptSjlxczBheUZnQ1NiUklS?=
 =?utf-8?B?UUlWWDFCMk94UnlLQmg0TUlTUHhHUEpVUWhHSzYwQW51SEJLTnBZN3VvaVlH?=
 =?utf-8?B?U0RvTm1HWG9VN2d6ZVVXY1I1UGJMUlF6Y24xUk1Ld05FTTM4aXFSVmQwRGpL?=
 =?utf-8?B?Q0x0YU55aFB1cU1WMytxdEx3ZHFOeVVXR2ovcW8rWEVYb0RSS0JlNnEvdXRW?=
 =?utf-8?B?Z3g4NmJQQ09xeHNsU3lzYzExQzIwQTFxb3lvaFh6TldKZmlmc05oWi8xMGh0?=
 =?utf-8?B?MWU3R2E2aUsxM0pIYkhmMGlOUVR3Uk8vbFdBNFVjZjJIZHk5L0lrL0tUUDV4?=
 =?utf-8?B?eUpqQURuaDllMkhLVWF6b3BJM2dSb250Z2Q4WUcwOUx6bGIxTFJvamtxeW5j?=
 =?utf-8?B?MXNmQTFMQUNIaFZ2RjVyc01kaHhKTkxNaThYYmsySHpodSs3THpEOVgzREw2?=
 =?utf-8?B?WXRUTHJoSUFpNTZheVR0dnh0aDE3SU5zcTE1d05pNjFnOFRTTzVWcGp5WDRv?=
 =?utf-8?B?TU93TTJSeDhrcDBNZzhSQUFHQUhxaTRQbUIrYjRQK2xTY3hxWTRZNms3dnpU?=
 =?utf-8?B?dEg0UDVaR1V2Z0c3WFVNSVdRelpLZ1RVYzVZbis2MHVFMktvdGN6cXNSRlpi?=
 =?utf-8?B?YmUvcmhaWGxIL0diVis4c3d3ajZ1VFYxNXUyaHQwRERmenlOUXAzZVhHbEtH?=
 =?utf-8?B?Q3FtMktaQ1hFL09XWU50bjE1MmlVUjRPYXZXa2lGK0JPVlJvTFlvdHdoWnp3?=
 =?utf-8?B?by9vOTVPZ2NxQzBHNWhROEtoOXdTVEhpb1JycjBLTFZ0bFZWSFZpVXBMM1Jq?=
 =?utf-8?B?Uk13OGJVME9kaThjQjZpaDg1NUMzTi9EdUFoNmE0bzJrRURZU0g4MUgwcklU?=
 =?utf-8?B?blBTdnBLNVgrNzBLdTlmWXlHWnRQNGY0Tjd1dnNrN0M5eUtGZ3FtR2FrVitX?=
 =?utf-8?B?Wi9PUVpRTS9YdGN6Vk1CSDNUZTNIYk9qaFY0Y0pRM2ppaFF0ZW1OdmNNRDFu?=
 =?utf-8?B?dlNpZFBIblZzdHlvRkdUdWkvM0htUEh1V2xDMHU3RXJ5cFpGQU1Nd0VGUWEr?=
 =?utf-8?B?THVCZVJ3M2tnQ2wvcDNJUWZTTmtJSXlPaENxV001MExMNGUzYjBDbXlxM21X?=
 =?utf-8?B?WnZneVpaRW5yRVUyWmxmQkVKdmVSY3pVYXJoSEpZOS9UZ3RnSVA2RlJ1SUlF?=
 =?utf-8?B?QXhoR1pwZXd4eENaVTJLQ3AvM2paM2NSaEMwZi9ySk5sbFdYVEJENElUM0d1?=
 =?utf-8?B?cGRtb3VSSXdmMUYwMDhvM0htZmd4aER5dzM1cXRlZDJxQVc1NWJwU0hpa2ZS?=
 =?utf-8?B?ZXQrSjlxVDU0a2FSM25VaUx2Qy9acTBySUw1TElFUmQ4a09SZEVoc1BBOWNj?=
 =?utf-8?Q?bOYqmjL+eeOU1GZY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62145cb-1800-4fa6-403f-08de82c64aca
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB6355.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 19:08:50.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PTB/SukfCPRTTAckDE/yQtwaafVy8CuQr+rjGDaC41GFA9IP6Cn1CaGAIaVbgCbyfTBrK3BTsncybIrJOX8F0oURqJbJlD/69cUKcpehOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9920

Hi,

I just wanted to gently follow up to see if you had a chance to review 
this patch. Please let me know if there is anything I can clarify or 
improve.

Thanks!

On 3/1/26 2:47 AM, Aleksei Oladko wrote:
> test_shadow_stack prints a message indicating that the test is
> skipped in some cases, but still returns 1. This causes the test
> to be reported as failed instead of skipped.
>
> Return KSFT_SKIP in the skip path so the result is reported
> correctly.
>
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---
>   tools/testing/selftests/x86/test_shadow_stack.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
> index 21af54d5f4ea..1747ea4cb725 100644
> --- a/tools/testing/selftests/x86/test_shadow_stack.c
> +++ b/tools/testing/selftests/x86/test_shadow_stack.c
> @@ -35,6 +35,7 @@
>   #include <sys/signal.h>
>   #include <linux/elf.h>
>   #include <linux/perf_event.h>
> +#include "kselftest.h"
>   
>   /*
>    * Define the ABI defines if needed, so people can run the tests
> @@ -981,7 +982,7 @@ int main(int argc, char *argv[])
>   
>   	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
>   		printf("[SKIP]\tCould not enable Shadow stack\n");
> -		return 1;
> +		return KSFT_SKIP;
>   	}
>   
>   	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
> @@ -991,12 +992,12 @@ int main(int argc, char *argv[])
>   
>   	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
>   		printf("[SKIP]\tCould not re-enable Shadow stack\n");
> -		return 1;
> +		return KSFT_SKIP;
>   	}
>   
>   	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
>   		printf("[SKIP]\tCould not enable WRSS\n");
> -		ret = 1;
> +		ret = KSFT_SKIP;
>   		goto out;
>   	}
>   
