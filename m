Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022093.outbound.protection.outlook.com [52.101.66.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6BB2E8E09;
	Mon, 23 Mar 2026 11:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264514; cv=fail; b=tXkbyn4rST2LYli8pkW0SQeQXa/+2aesxEGw0Rr6GmU3tx2R0T9zPVPTvPNe1eWwaUJpEW9xc3CvdykBOGcjYkR5PI72ZlgLamA6qLHLXd5PwHEqa5XZ7mzIJrUxmcgVjCjdKJTb9Hjmz7P6NWEywoYjMbYJpYb4aD9znVGRdTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264514; c=relaxed/simple;
	bh=EqImOyYxlTo54DMHvq6sgJJIXAiJQb9BWQYDkBGn704=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FfRtQ3xWPbDbqcKrhwDNnfJxJCFgUxO/u8vh1opHzuJ6JNNTrElNO4KnZCehNlHVJ47nXL+byhdw43nF8U6gWlgzCY2ghvnkkWqD42dyRpXidUlPODkqnakZwhZmSC1H32rohVD0OPS2Ir0sf6f1fMf4MTzjxRXA6B+DrDVr3Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=ldnIUkcM; arc=fail smtp.client-ip=52.101.66.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="ldnIUkcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpcBmwaOZ/luSdB7NJGKK1Rns4ez4Xgy2wufcaPplpgNo0Uy/juEOXJEORXr4fjvPFtE6RvyVHtxeMx693mMlOBIGSsBNcFPg+MGJiPztF0HoCPyoKSifWpNSF1qMlkvmxGI24tySIpo/boITusNobub3AKqTDk+kSyOUvoLRcyo/3U888eJBcSwwmkymDHQPjkU9ZF298Kw9NNuZ/JXPBVmYRs46Iuogp00l/p5qtFd/ywSaSqGTAlivPKlEF14L277VFTEBpU7r7ku8kj29xBK23MOwrlVp0mgiXM5uagWzIUxW/8EWgL+xEVJ2lQ1QitvbmGL+9KVr6uXEltQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qN13Fy7RSuy3oxpYBHOiZ6u7OP8P5igd4jIjX9e0X0U=;
 b=ixQqLlB3sKsLMMI+AGPDpeMDm1KbHi6wqcV5o7oXo7lm/pbOsrflQllR0KxH8ltp9tLSGfcbJmTBKTwBy99DlNDkB97hK93gvWj7yFLx0O3HW02pMiUvqzI8P9Wl57QnXVnrU3uPCWVqlGtlq+sb0/HMWuSWViJuzNLTbBDNaXmgIxzqtzZu3vSZu50wBs6c2+Ok3rcALmAKjqq9Fs8ziGTcvLBTKfQKbe1EH/ec1IM9+vAJeZV36Ix+VgpYBybnfoAJkkLAxaoSjpFoRM1SRf8d5u9Fa5Cw1VeMMMqQw+Bf2JrG9XdGQLGNMOrBAnBpP3RB/RpGwGUbfkTy4NGlag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN13Fy7RSuy3oxpYBHOiZ6u7OP8P5igd4jIjX9e0X0U=;
 b=ldnIUkcMnS7N2bvbrg9f/S6/OOnq6NUU6Dux9M73WZTsi8EOuhx0RPayUc+mJhg2ZAaLU9VZ/Mv2rftxw33vYj7TifRiP7ZN0f9m9SY+QYEQChyxO3yDwyzOOJaP7XrK5mfU7vxKxTx2qyhuzfUBfwtB3xZSXO7nGMtNudXzuBgpCKoPY+aQ+rhBzfOtS1qLUi6eLFwNwhckBLvJZ8UT1e09aHiFfb3Q9Jfm5YLxUoK85FRD4oZ1RvUtDxwwpHkri6DmpLt2ZJghrvoL/ZwaXljnCk3RI0XpvlF3ThJOtazFZztEfDQ2RtckcAdg4oV5zAOYaSW+tsWlXfVx8awVNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by GV1PR08MB10732.eurprd08.prod.outlook.com (2603:10a6:150:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 11:15:06 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9723.028; Mon, 23 Mar 2026
 11:15:06 +0000
Message-ID: <75496499-9ceb-449c-8a73-30d9ea1cc452@virtuozzo.com>
Date: Mon, 23 Mar 2026 12:15:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] selftests: x86: test_shadow_stack: return KSFT_SKIP
 when test is skipped
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Shuah Khan <shuah@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Edgecombe@dev004.aci.vzint.dev,
 Rick P <rick.p.edgecombe@intel.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323104536.198738-1-aleksey.oladko@virtuozzo.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <20260323104536.198738-1-aleksey.oladko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::29) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|GV1PR08MB10732:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc7e2cf-691a-4e9b-566e-08de88cd6fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|13003099007|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UHcpgK1WKiMcHES0kQAuAkBd95zeTuTcIu91CH2zCVUkCKRBNlRX18/dTvw60BJ+3bcpapoV7YxGE8EcWF72jBfS5qzvordv7LZf2NSOjF5m5K38mn5IqFE02lRZaxVQXdVshGfSWkYUCO4y71wuYvYxyISxIOMsJBQmPjwA6Ke70uvQr+SCubX6yFqH6ZIFeHDDDyW5vqUFq2mjU3z0FjPUwGRiLs0jwqwM57lD1X5iKEl9xklrCnK006LtOhh0QbP29yifvAGoIFKXxMvBZ4OyNWFqA8MfZbY5zwGitc21xH/eG7AtEh85rJ62AofdC+IsQIfk2557bCm07PDuO9DB82GVQsA3WmP6+kW1izC0c0u0qFLwRqwtYj5Salts8fGG3Tuh4+rtCa5ytjmUNFzb9swOw1pG2vBYqqvuW4B8VCzmWxlcPaPXKXngjSMlo3uvZQPlEXkcY9rtcL5/+I5jRt7+ISZegwnFWskI59Ag9aPBVMHVdp+YVIMOaCU00tplVRI9YeKgCMgF6VRCKp98iv0G1mv01EEXv1t8cNN/j1KCEIC1xi/dLJIqWNX4DzcLEFTOFxxEPzlakSYyMKK1mWCzE0IBxpY4SBHdV/HLd7pV2qbLThoK1EnAkAcRcotvwBS+MGikl/chOIPkcSb8ZfNpHTR3mtLGPD1pyLsjJFtTIWVptSB+nePrMGKT9fmYlX3wU3rjRCInw5NqWhpvZUirjlQdNHI0187CjqWez19wjWQedyNvMMi9Zz0c2Y5OmcAuwzP/UWO7K/gdpNS/s2hs7m3G2DkfkhF+z3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(13003099007)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE0ycWN4UXpFdzJTZmlsR0ZyYlRyY2RWT3REamFtam5hTVY0TktTV2Nuajls?=
 =?utf-8?B?TklVNmU0dTVad3pDbFZ6VFJtVWdjT1FZcVp0Y2hlMnRCT0hvTmNxa1d1ZEdT?=
 =?utf-8?B?SWJVT2Rnd1Juc2tUcE1KOGVWR2d5OFk1b04xTHN6VC9iaE15TFQ0ZmdZcTVh?=
 =?utf-8?B?cko1d3VHZ29WTjkxZHYrQTVlSW9QWk0rbFV1QTZxRlRMeWNGQjQvZ2lkQWp3?=
 =?utf-8?B?RGRhTXNXcnJUU2c0RURVbzB1MGo4OVRab2NtTlFhRko1UVdnb2o3R3pad281?=
 =?utf-8?B?VWRuZ2FoTE1GZ1pXOEVqZUl0VlI0M1FjOFo2N2J3c3llUjdvSEh2ZUIvN3Rv?=
 =?utf-8?B?WTFNdVg2Q3lVVnREbFkzYmJaSE5VR3ZicG5raWRWR2U4bFNjWXhYd0EwK3M1?=
 =?utf-8?B?c3QyNFhiSHNlb1V3a25JUUJDV0xjMWxsS2kwdnNKL0VsVkRNVXdOL2cvbGlJ?=
 =?utf-8?B?WE9Td1hmNDNheWYzamY3STl1bkpGZ3BqcGNCNE5mT2RjU0d6MlpGV0lCOEZ2?=
 =?utf-8?B?djV5MWlLdHNObkJLTTJja0tNRzhoakFCM04zeER6WHQwbmUzOHNTQlNnKzRP?=
 =?utf-8?B?V1l5YnMwYlp5dmNyMXdKYUpTZDZlb0xBS091dmxWZGE2RGxOTCsremY0RkV1?=
 =?utf-8?B?alB5Rk44ZXZ5NlV1b205ZEovZHV5ZTRZR1U1aVRHZkEvNjJHQ1lTS2ZKcEhR?=
 =?utf-8?B?MkhhWjhpK1I2Y2RCS0RZc3l4Si9EN3B3V1Zqb0ZXcDVTUVZ1RmV6ZVNJVUlQ?=
 =?utf-8?B?ckVGMGcrdXVJTTFoT2RvejdyemxVWDBlQ1JweU9ZQmMvWGlMY0tKajQ5dTdx?=
 =?utf-8?B?RkRpYU1nUWhsTEJzem80aVZWbGZYWm43L3ZSZ2svK3BvT3RvL3pGNlNsZi9H?=
 =?utf-8?B?S2FuR2JKZ0VXY0RoOUZtTy90a0VvYjRSbU8zTWNGdXFZVUNJMjN2c0ZXeWUx?=
 =?utf-8?B?SWgyYitDZ2IvcFZ1UU92dDd4Q0xENWlyemhiSkYvV0tFL0JTSkN3VGRDWWZq?=
 =?utf-8?B?VFFIUWxDOU5VWW8yeFNNcHRhVDI5ZnZxZDExZEZNaS9ISnV6WDFDTFJqbndn?=
 =?utf-8?B?alpkbWw4Q1UrNmQyb2xTYnI4U3R0UXZKTkkvNVM4djJoemVUUm1OQ1h2NXZZ?=
 =?utf-8?B?OXJJVVU5VnVYVE1DVW1ObVFuTzhFQzBnN0s3ckY0aXZwUjVqYlNjVFZNS0FN?=
 =?utf-8?B?am1PVmZYOXBOUk1kdWxJbjVsbVFXVFMrenJIMGxXazlGSTJsMHhOcTRQaHVZ?=
 =?utf-8?B?c3FSNGFEeStDNDMyUWJwZFlLQXN5N01KbDl1Q3VCSThFUmE0ZmttWndDbVNa?=
 =?utf-8?B?MXE1elZQeUNMRGRnQ2tOL0p5RVovZzFNUUtlaHdCMGIzVmFVeERhc1FscHUr?=
 =?utf-8?B?NzFPb1J0bDFab1FNeGQ0dE1wK0EyVlhVS041bjc4ejJsTUlScERXaXowZTNU?=
 =?utf-8?B?dmdWdXc1cUtXTFNuM0hBTjBXTFErMDZFZmliOHREMU9xQlVSZ09qZ1I3OTBV?=
 =?utf-8?B?RDJDNko2b2N1ay9ia1ozeUxVdmxYWTZwTEFJaFVmd0x4TVoxYW8wbGdDbmU5?=
 =?utf-8?B?eUdYeEdNTml3dkwzSk5pQUZCdjMwV01kOHFGbDNWKzZYUnJMeGY0M21iWEhV?=
 =?utf-8?B?Q2lsSElwdk1JaTZSbXBFN0Rnbzd4TTJyMlVPVDNzZ3Y1UFcrZXJHSElacGI5?=
 =?utf-8?B?UFlxNWZzazIxSGlCQ2dZc2lxZXBaSEVucTZtNjl5cjZTOFR2N3kwZnEzWGZp?=
 =?utf-8?B?UWV5LzIyR25EM2M5dWQ3Rjl1emcrZ2NWSUdrcnd4WkxucHRSdWthQ05uMTVE?=
 =?utf-8?B?OVh5NEUwOVlpMVg2eTkvNFBjV1RuK0I0V2xZVGszQlhtemx0akt0LzhUS3Nu?=
 =?utf-8?B?U1g5MSs0SjZmMGlhVThuTGpVRWVDTHZQOFEvT2NUUzR4WE1YeWFPWFRBZSta?=
 =?utf-8?B?Z01DVG8yODJKQ3VGTEpGak16SlE1NjJqMXJ0SXF2MkFVazNoNXloQVVrWTNJ?=
 =?utf-8?B?cHYyQXAvY0FsV0gwYjNJU3hPVDhHWC9VMVg1bFZ2NWZBSVljaFFnZ29VUlUz?=
 =?utf-8?B?a2thU0lIMlltSVJaclpLZU9rZVE4eXc1Z01lWHdtcHRWWlhLL08wM0t1NlFa?=
 =?utf-8?B?T3p3eXhzMFdHeDhJemszZzdTVmtvbFpjMjloSFIyTTM5TmdwV2tmM1RuMmRK?=
 =?utf-8?B?dnltQllZbmlZSmlLRS9zM3hyM0hPSGJGNmlrV1AzcjdqaFVFb2VQUzhpQnRp?=
 =?utf-8?B?Sk93RmRrSFRXQjlURHRNTWxBU3JuRDFkeEZZQXJmS2xtVWFIYnhZYTZ2Skda?=
 =?utf-8?B?NjJwWUw5WEdnSThxYXNqbkVGdWVod29LcmVBbk9DUUNleWNWSGx5UkVaYWhX?=
 =?utf-8?Q?NMMjwm5Wm9rhahdfeqKvUYk6B+ieL3O5KwTewNUrsKJOz?=
X-MS-Exchange-AntiSpam-MessageData-1: 91RCqlsOv/9uS2lN0v6dPp4ZjuF6Ebo20SI=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc7e2cf-691a-4e9b-566e-08de88cd6fb2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:15:05.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxrTg2cCa3H2FjVJ+PUF5PekMpwxwLViFClbdEjpM+AaI3XBo6Tx8+ghLYNZKSQL/qUmu+wERTwOkhucBrCAZ6PuEj7q28eQUrGRlvJy4Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10732

On 3/23/26 11:45, Aleksei Oladko wrote:
> test_shadow_stack prints a message indicating that the test is
> skipped in some cases, but still returns 1. This causes the test
> to be reported as failed instead of skipped.
> 
> Return KSFT_SKIP in the skip path so the result is reported
> correctly.
> 

Reviewed-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> 
> ---
> Changes in v3:
> - Fixed incorrect return values in test_userfaultfd and test_uretprobe
> - Link to v1: https://lore.kernel.org/linux-kselftest/20260322233938.190526-1-aleksey.oladko@virtuozzo.com/T/
> 
> Changes in v2:
> - return SKIP only for "Could not enable Shadow stack" case
> - Changed message from SKIP to FAIL for remaining cases
> - Link to v1: https://lore.kernel.org/linux-kselftest/20260301014733.454260-1-aleksey.oladko@virtuozzo.com/T/
> 
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---
>  .../testing/selftests/x86/test_shadow_stack.c  | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
> index 21af54d5f4ea..d52c8c2f7800 100644
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
> @@ -820,9 +821,11 @@ static int test_uretprobe(void)
>  
>  	type = determine_uprobe_perf_type();
>  	if (type < 0) {
> -		if (type == -ENOENT)
> +		if (type == -ENOENT) {
>  			printf("[SKIP]\tUretprobe test, uprobes are not available\n");
> -		return 0;
> +			return 0;
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

