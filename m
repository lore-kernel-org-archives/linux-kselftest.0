Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022122.outbound.protection.outlook.com [52.101.66.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAF387585;
	Mon, 23 Mar 2026 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259352; cv=fail; b=gQjKt1fC/IV0oQljbgpO43BC2DI1l41+IKXB/y07ULKeFP0PZB1wmtsUCTqQN0dvzlmgiWXOrLVDJC+HS5vvFcAjEewNJtwPRKyvTojSv5leB/RqWncGqlTvlhAM44YqbBRocr3dNt3AIj/wwYe6CZFT7En94+0iQQDB51KTPMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259352; c=relaxed/simple;
	bh=anQbNvHpwyAgC0H/KkkK/2144rs3m26+WhoFwAcEbDE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lOoePMWamMo/In10ejn6mFF/K5l6EQRUQgKm+GpxgTioIkuv8yub2BR7j8rT33IGhE/xnAsnvvS+IX1kEikH1kJDQcnd4iOWtzmz5Tq8BsX3nE4Hn0bZ9jrCsck86yGxniUVQ2A4NazEqoODMzhPKwtpAYApUBsuNBPTGZiyNHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=svDVrV9X; arc=fail smtp.client-ip=52.101.66.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="svDVrV9X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBvRSqF+S9FstxFTzkT7S9m7blpwz07km6b8uIuk4I8udRcp8wVtLdaV6w0fm3+xsKgl+neAoMtpOs1H8+kah/t2ixOaICd9LZcLq8xPNb9IsOAwsB7CktTidHGAc4xmWKls4xtj7ahR1HY1utTcL3e+DzU3H3/NKVsay1OT8N3Qoi7K4dpaPPp8j+ZHZM6T0l6Uop8mTtYFuNhdMDigs3hb5qxRCloZANo+5HWSL9APIkdjneAUT42ZQzdR0yAo4mqxKgxfNPDqtUtYDB19wfTR6uSJyQPJVnhw62YCktIADfJllqSCfS00OtGzhJVoqo/N28q9aTB2YAzPrnuy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfKe0xMAkQIPYyK1AQ7tGnsl1nU5mQRjmzEe/ckJfRs=;
 b=jdO1Wg4l/Hun6UDZWcarJi/LNqBhB2QRfL6N69Z0W+TYbIRanlhh+giAuJ5s241YDPkIWSfx+SKkNDuLMpeIOgsWjrpuwPcEb3Fn1SL+Cuhzcfe3OYnWIcRlN+M6WUgiHQGTPytrpI2Dz16neFavmtLBckoYpN43m10Cj5GcnTMvT7nRpFz+6Ddotal20il6v0SxHPRbEz+gy3x3fEYvAIVenxOyBixgIEW1duxJLGnA/Yy5iUnvCI7iKIvZVHPkkWQUnPkbDyTC2Jc47OWSFYjBnmUnr9XRRQwfeyryKnj+fAtB15KL7k+A0e9lMi7eRfHBd3TAbQ2VLY/NBOKjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfKe0xMAkQIPYyK1AQ7tGnsl1nU5mQRjmzEe/ckJfRs=;
 b=svDVrV9XaTcO6chVkH7iClGhJEYkZnBw9/LWBJC3/Fk6SKjQiPcVxjpNPYFpnWNOQhzvbRUSBa56v4kytelCX4zKS12KulAC7TvSBJikmc6No4D8NC8b3nbjWujTJf1u6wwRIIbA2UgOhHs0tQ06fMEQ2lsGlVqj9hh74EAWItdsRuGB8+K02B3XsZ7uhuExcDqEpf29pUmJYPPKBGCjt4PpIszoTCzLOG1LjEnJGeW3qc/JRbSdgCqDNYIyO3HglZwINMkJf8Qe0Jz4mMO1PHHu1fOYWTPvA4XyVKUh9Yw4/dNn3eRvn1GIKXnrC/tOOnwa/QUpubT6FQ13pQdU8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by VI1PR08MB9960.eurprd08.prod.outlook.com (2603:10a6:800:1c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 09:49:04 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9723.028; Mon, 23 Mar 2026
 09:49:04 +0000
Message-ID: <c1c8b30a-ae46-458a-a896-ecb9f25e2df0@virtuozzo.com>
Date: Mon, 23 Mar 2026 10:49:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: x86: test_shadow_stack: return KSFT_SKIP
 when test is skipped
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Shuah Khan <shuah@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Edgecombe@dev004.aci.vzint.dev,
 Rick P <rick.p.edgecombe@intel.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260322233938.190526-1-aleksey.oladko@virtuozzo.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <20260322233938.190526-1-aleksey.oladko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::14) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|VI1PR08MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e1414a-f6d6-49b2-19b3-08de88c16b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6MXibbK1sfn29Dh/85jb8wLIZFM3z4bs+yfgP0K7EESroCdQcs5lVIUutRaevp2+1UhxumAbB2+sp7K3f80Wpn4L4XTg6LbdOtjnd7P83P+uEInlJPmOuO87IV+StWiFKVbaFT1BijV9LgVF3GILj4a9TJAqHrVmc6pds8ALPqxxl4VV8E6EWQ5g2g9T9Gk2DAjx9UzgPovxUT413d8ggCKRxKwPQyNgJH3X4RkBR07R/VLmK7HGtUIhc8UqTDFAKRoXwnN1G1hzK8htFUvIJhMgVOH28ttVM1uxclzsTPQVlrz/CiC4OijdeuJo09RebCEPfBoxPUYrobmvrLr2Mds0hL5Mk6lwRElpfy9zgRBEX70sSDChpssdzRE8EsxxQzC8OAtMMKVtePLJUMfppm4hvVXGPpQ6s3mt1yTkdWC06pAgXzoSpBwcDl3AE9OyWkQeTGCtdVpAvtQV69GLDk41XlY/vJMO0CIJ3PZTLprL6E0H/C6nxzDUJ1Shwc1IymBcE9MAM+/AN6M0q6m2f3fI3L5k+Gfs+kTb3jgIgrgtO/lCLh2eWXVGdlP60jxj2hxHYWIba8tqSGQLuo0B6lM83xr3hTskMMopOd9ECBUubgRiJxfSFIl9VDZM2pDAwO2FwwfU4dccpSvKihHMTf+NjSqDpD402g6shcoWParEiZGpt/vSQR4aXMVQPaTDM38TM3IJU5nrVldGGUAZc6Fc6QDz0x5/Ft85unnJ8H8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STBMTjd2TjFKMU11TEpDVm5GVmdPRHRqTlh4MmxXN3RKenFRZGUvSTVQa2dt?=
 =?utf-8?B?VGFqS2NYdy80UlBMWWRTMytybWcxcGtrQjVTeWMvRjkxZWV2OTdVSkhqMFB2?=
 =?utf-8?B?d3paY2J6dFhvcTI4b1lnL1Z4R1h2K3RybGdsekphRGFHajdlYWhFbXNTTGJQ?=
 =?utf-8?B?T0lzUkEwNmx1N2ZCVjRDTlhFSlllSG1jS3hQaFp4VWxvUHdVVWwrc3JVRnIw?=
 =?utf-8?B?VFZrN3hCeXB1MmpQck9CS2pkSGVjZTBZbXhYNHV6Si8xQU53bEJHWVIyM3Bu?=
 =?utf-8?B?U0V1emN0aXFVOEx2RCtzMk5lZnVHYzJoUm85YTk0WXRRWlcrdHNLUjY2QTlh?=
 =?utf-8?B?TkFGZzBjYXRJOHVUUmhDQW5nUFZ4dFEwOVNmNy91dld2dnc0S21pQk01ZEh6?=
 =?utf-8?B?K3JhZitDeHpyYUx5dXdNby9DU0I3d2o0ZnVaUnJIRGlmUzdRSkNseWVDOWY2?=
 =?utf-8?B?ekRwZXhLOWFuL1Y2S24yZmxyLzNvMUJmS2MzWlpmMzdDenpuMFJjTlVESEVO?=
 =?utf-8?B?REYrRlhRVkIveS9FOUdtRFErbDd6ZU13VFhhcWthQ0o2V2JObkp3OVQrTHRK?=
 =?utf-8?B?YnFkUytVTVByaWQ0Qk5talVIZytJdWkwWVpKbGVFbzdaR0hna2VVMkM0TGNv?=
 =?utf-8?B?STIxTU9OMHFZUUpVNFhadHJvQUJJeGVzUVVXbTVGTUtXSkcxZGJUdGVPUUtW?=
 =?utf-8?B?SGEwWmxLRzR4OFhtaWtKbUVkU3JMbTc4WXhNRHNuaTYwMzhaOGJ5MitmZnJW?=
 =?utf-8?B?eXZBV2RXcU9LZlpFOFVodGE1QU1FMmJDODNHekpneTZnVW5wd29rZXIvcFpL?=
 =?utf-8?B?VGdFN0VDSkI1M3psTXNGNG5GNW9TYUsyM3JmN2Y5enlOMGFBU0xuRldPdkx3?=
 =?utf-8?B?MmlNNy85Mkd0OFdHNzcxNlM4cW1jcDIrL3BVaDBpRXU0TE14enFxTXVKSUxp?=
 =?utf-8?B?cXZHVzBuZDdEQm1KMDQ4RzJxeVRJUkk4T3J5M1RNQkE4Znk4NEg4V0lTVGZz?=
 =?utf-8?B?ZkhTOEgveG5QSVdrb3pEcTNhNCtMMDlPd2xXVGdLdkRUOC9GRnhqQmhOa2Vs?=
 =?utf-8?B?RzRlbGFwaHVpUmdXNW1LcG4yV01QVDNIYnRNSnhkckRZYXRSWHlROG8wMHZv?=
 =?utf-8?B?Y2R1K0dPSUZwMTBZMWJPdUVZVThadzFHMHFSeUpsMjJ4TTJ0alAwRzVCdy8z?=
 =?utf-8?B?K0hwSVYrd1RvbU9yakVCOUZ3RzBKSDFQVzNhUEhuNEV4anJmR1pzcXRoMWxZ?=
 =?utf-8?B?UVBvNytPbVFMYXIxbmM2ZDVTYlMxWnZoQ2E5RmljMVAreWRIMmcxQktUZndC?=
 =?utf-8?B?OUJ4MzNaK1lIYWNvVzNYcEFvZkU1RWxBL3dyYmhKWnJPdmFVUytsWVY2bEQ2?=
 =?utf-8?B?eFB3OXlQYjZ1amtCK1JvL2NnR0RTMzhvS0Z3TFhkK2lPTjV0N1V4L2poMUgv?=
 =?utf-8?B?OXI1R2lLb0JXd0dzNmNyNElCMUhQcFpKeVlTajNEQ3VnTGZUejZnREljMlVF?=
 =?utf-8?B?ZlRoR3E1YlJTY0tLV0VYelJ3NEVldWN4YVNOQnJMNjJZdjdTOW5aTzdTUFVH?=
 =?utf-8?B?RHZ5V2tMRTBMMTBIa3o3UCtxOUUyaXFDcThBMGlkMlZoSVd5V1g4elVIRGVC?=
 =?utf-8?B?TFlJV0ttaytTWDNvemM3dkhGeTNLVEZlQktMc0FLeHRnRS9zZXI4QjlkVlg2?=
 =?utf-8?B?QUVBZjh0QklvTnl3OWZqc25pVVVCMllwbTM0VzR4RzkyMWszMVpDSnRuZkpu?=
 =?utf-8?B?U3J3b1FVRTVDZmhZWHErS3dxVlphR1k3S2tQdnNCUFE0cVJjOUhzaFpzKyto?=
 =?utf-8?B?QXl3Y044M1gyVG5lZUp2b0p5RVljekZOVDJ2VUFORDVhUU1TVy9hUGUyeXpY?=
 =?utf-8?B?S21TbjZFMEtrbjNiM1lqRGQrRHFzQ0M0ZGdYb09hVWtLdXZIamp2R28wNmtE?=
 =?utf-8?B?TWc5SkMrTnpFZVNKWGZkeEZGYlBCblArR3I2RnpGcytacXF3eUNtM3NXZVRv?=
 =?utf-8?B?MUFYQk8yNFQxSWlEaFJjbWJWVEJ4QWQzSTFteDk2UU9yUVVVS0x3Q2RQRmxQ?=
 =?utf-8?B?aDUzNDc4WmxmNldSNjdUZlM4UUxWY0xRMDBxeERJQ0Y0ZmhocXVSQzJlVjlh?=
 =?utf-8?B?bFdCWlNJMC8wTXpRTTh3WWk0eDJEVjhRUklYYU1mTlBZV1VDeUpNRXA0aTRm?=
 =?utf-8?B?VzcveHhWVllFYzgydE1heURMaE5KQ0tweng0RDZtUHRNa0p5d25EOVc3RGta?=
 =?utf-8?B?b3BFanBMRHhPNTJmdUxtcTJ6M1hzeVlXSElTaVZUeW5ML3A2S3BLbEx6S04v?=
 =?utf-8?B?TXVycURqSkIwSFNvY0V0WUNGTGZBaDV6bEJmNEU2b3FJZzZnSUZ1MHJHQ2Jn?=
 =?utf-8?Q?aOFg5ml/bY/8zof/07601+p+DdBBerupdnvjEPBRSNEDB?=
X-MS-Exchange-AntiSpam-MessageData-1: cwaUhQpT4T8m1dA8gsBpegaGpPlY18lL/iQ=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e1414a-f6d6-49b2-19b3-08de88c16b42
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:49:04.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6monvcjH2iYr6sPhEEeLqHUIuAndrFeG/dj6HMroDFwoUXSqUwQEpBCwf7i+bZN7KXnZZLGWeXx5BjB/V7V03KbD8a3vRLxuwaEkPgF0WQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9960

Please don't forget to CC me on the next version.

On 3/23/26 00:39, Aleksei Oladko wrote:
> test_shadow_stack prints a message indicating that the test is
> skipped in some cases, but still returns 1. This causes the test
> to be reported as failed instead of skipped.
> 
> Return KSFT_SKIP in the skip path so the result is reported
> correctly.
> 
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> 
> ---
> v2:
> - return SKIP only for "Could not enable Shadow stack" case
> - Changed message from SKIP to FAIL for remaining cases
> ---
>  .../testing/selftests/x86/test_shadow_stack.c | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
> index 21af54d5f4ea..4c5437846d26 100644
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
> @@ -64,7 +65,7 @@
>  int main(int argc, char *argv[])
>  {
>  	printf("[SKIP]\tCompiler does not support CET.\n");
> -	return 0;
> +	return KSFT_SKIP;
>  }
>  #else
>  void write_shstk(unsigned long *addr, unsigned long val)
> @@ -496,7 +497,7 @@ int test_userfaultfd(void)
>  	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
>  	if (uffd < 0) {
>  		printf("[SKIP]\tUserfaultfd unavailable.\n");
> -		return 0;
> +		return KSFT_SKIP;

This is incorrect and will lead to fail instead of skip.

>  	}
>  
>  	reset_test_shstk(0);
> @@ -820,9 +821,11 @@ static int test_uretprobe(void)
>  
>  	type = determine_uprobe_perf_type();
>  	if (type < 0) {
> -		if (type == -ENOENT)
> +		if (type == -ENOENT) {
>  			printf("[SKIP]\tUretprobe test, uprobes are not available\n");
> -		return 0;
> +			return KSFT_SKIP;

same here.

Can you please stick to https://lore.kernel.org/all/3205f6e7-bf02-4fb4-ab03-278447c17f70@virtuozzo.com/ more closely.

> +		}
> +		return 1;
>  	}
>  
>  	offset = get_uprobe_offset(uretprobe_trigger);
> @@ -981,21 +984,21 @@ int main(int argc, char *argv[])
>  
>  	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
>  		printf("[SKIP]\tCould not enable Shadow stack\n");
> -		return 1;
> +		return KSFT_SKIP;
>  	}
>  
>  	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
> -		ret = 1;
>  		printf("[FAIL]\tDisabling shadow stack failed\n");
> +		return 1;
>  	}
>  
>  	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
> -		printf("[SKIP]\tCould not re-enable Shadow stack\n");
> +		printf("[FAIL]\tCould not re-enable Shadow stack\n");
>  		return 1;
>  	}
>  
>  	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
> -		printf("[SKIP]\tCould not enable WRSS\n");
> +		printf("[FAIL]\tCould not enable WRSS\n");
>  		ret = 1;
>  		goto out;
>  	}
> @@ -1057,6 +1060,7 @@ int main(int argc, char *argv[])
>  	if (test_ptrace()) {
>  		ret = 1;
>  		printf("[FAIL]\tptrace test\n");
> +		goto out;
>  	}
>  
>  	if (test_32bit()) {

-- 
Best regards, Pavel Tikhomirov
Senior Software Developer, Virtuozzo.

