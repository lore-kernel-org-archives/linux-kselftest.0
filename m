Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023141.outbound.protection.outlook.com [40.107.162.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B941CAA7D;
	Fri, 20 Mar 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000348; cv=fail; b=Hpk12wuDCdcX49kV5BiA6jwC9dskTcJSxrguhX+hulB0E/QUzC8QjGWBSuBEC5uW/dbPdLW+bPbw5tJLYttoZeSreZ7wmxNqEI0tR6aIi/kOHsHdsSIpuIqO2tZ2O3I6RjtNU4wK73AVoH6XfjFmXrHHAW7tQH8yDacesZymmnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000348; c=relaxed/simple;
	bh=Z27rs9yBUpTlFDeWPi5gqCPKbdMUxJir0M08NtEwonY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D89bglUoFC7qlnW+vUJFE7N5t4abC/At9p5yyOnm4Zg1VlXR90ATFXtiaj/xYMfqUV7fy2eay05K46zprsomaJVCM+9Bm89x7R6Vccui7/Oa9dBVsdcdWVqX+6h1V5WOqqZ87gP7ZASXzNAXtjSMUZu55WbVVWX1KOk0w0Bxh8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=CBZJhfE9; arc=fail smtp.client-ip=40.107.162.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="CBZJhfE9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEluFw2SzKjgXwl3GY2U9tyZZX5nkm6Ws8Z/5fNQV/fIt8SkEWqPkvz3b+yv3qXKDiogRX0ZuICPQeCXQC3Joa5mEPkxJXhf2oEU65WuNYPnkuQaneYPa+Er/XDNLRzmBBrr9UQiD3eJ4gDIWjWPN0qk/+ftQfHf2J5Yt6o7X4Yf1C7J6sT/7wMGL+4dMSIseo1w5pcDBiWJE7253Icq/MBd7pL09+oh5Xf1MpfGt6ddl7Jm/mMBg90dRhRerVAxoVPBFU+UhIZsjIcOuPJr5EjeM6/k02GO08PxtsNRbmLZZn2RtaawkV33MGSLr4mhDQ3NpblEVX/ZlK/MdtLgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68jrDnGgv9oCZrGUYU7g7oK991a9Uk52gbo97V9cWd4=;
 b=EtRWuV11saZFikDdy6viFDS2MgwiosNA0eyJ+s9Txzdd/NyVcqvzkYRSfJidRHTY6gK8WQpG59Vive8bw3Q3+3QjN2A7KlJhkx5W5cdV1YYkxp/CqH69YbiCYAWtgm3AZ0o+EM9oTG3Z6Dck696duTtfB/hrbSDY4FcZj1a8KhdgsIdMRv5si8a64VNKrbu6qljo+o+3EnZQDOuSPTRm9l/d6nsRv1b73FO21CIs64Hg6YZQecqSsEgvLFQ3gaaWEPBhBGp6/jLN2+SmH1qbNLQpO9A89hteZJU3rozIIwGRQZW5bcpwzMAe2Xud201jYBV3qWOWWC+q4jIMt+FDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68jrDnGgv9oCZrGUYU7g7oK991a9Uk52gbo97V9cWd4=;
 b=CBZJhfE9AxHISPpD9wM9BvH4TxXOJ2AWedX8xFmE3QP9tzIDW1e3EdqE+6A/kwWqY5JvSOTkE4996hUwC68LrPfTBlf0yIHRYK83B+hp2t0Mcepu1qraN+ZZq+Xn5rbc24lkVS0w4J7/D8G8nH0BTzg24ko4Lnq0ke69jn8iWve/r/h9y+SiQ6p5z9CNNOAzdt7bt6TWRZ8P1dczZRYdYtpIKAQN0ORzJjdDXmYmoZxPqw2HE9IsRJWonbMpq2S0O8OKfZIzajJQwV/XkooBrs9OJpuy1tftVFgYeIsKlAmuRlrPxlK3OqH8bdF4GgBYlmiSqUqQgIr1/gRShEpoOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by AS8PR08MB7885.eurprd08.prod.outlook.com (2603:10a6:20b:508::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 09:52:21 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 09:52:21 +0000
Message-ID: <3205f6e7-bf02-4fb4-ab03-278447c17f70@virtuozzo.com>
Date: Fri, 20 Mar 2026 10:52:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: x86: test_shadow_stack: return KSFT_SKIP when
 test is skipped
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "aleksey.oladko@virtuozzo.com" <aleksey.oladko@virtuozzo.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
References: <20260301014733.454260-1-aleksey.oladko@virtuozzo.com>
 <d3932934-3dd0-4296-8ac1-f06b818624f7@virtuozzo.com>
 <5a977040caae42e41e3fab53efdfdb9201b67e3f.camel@intel.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <5a977040caae42e41e3fab53efdfdb9201b67e3f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0277.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::18) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|AS8PR08MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: b48e1fc9-8df0-4d62-0566-08de8666614a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	h/JRjEDmMHYmQK2h9UKE3py+5ewdnE1BgTCrIdihbzmEa6S/HuMYypLkO4t+1U3dhjXGer8F0TqcFwCEdsygol+IHYl0Sq/LtJwdswxUlq+vfTAIp4necrsNThlkhgpPnJu/pVFwVfaB8VpU6GO3+2bJi65yIVhGuOuWo17cXL6jZp7KX04NrNdL4zC/kb6fy7uuYUDkpwYJjoEeWc74FqIxAHhA3Fit1RCvmbQdUP4nUQqSvdATaY3I0XyWPfDM7VxAOtw71otLPYzzr8UPROotrX1+hyt7gB+TM0e0GKOyzR2o0SzwfjztgjSKK4AAttsSNSR47Efes/DKiU6HtLJ56XkdtKqmeMc04pYeH/i42dzKo00bkJdHT99eDgRvAGyHiZ4Rwq56QZcUFcI6c1ZhGiBw4fppz7lIWmgPcdmeKma4LIXGcKrGykn8+7hnHorSlQrqYFec3/dZmQK8P+fXPez/V0N21Q4paeDl47WzkzC26Vn5v5hCFl+Q2Fr+lxIxpCP78GM3BKsHwTd6qKkQF9n1+kT5sre7WeANvyTqya4UE0p+475QXtbw/rXTyWqqMMpL4fpjmPthZX1D2Tr0e3ICBwTWwUANZyBcLQRZ3mdn+/KT2fkVzbhPE1ftOwsr/1XuxAunmjLC7OPBwnst8ZzPsfXHXGy8+Xu3kZ49nqwOV+EnKDxOAbgUU+afM4q626fbimI6egw1aJaJeF/eR2xFzLTjXl2+GCep0Hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCtZcjBGakkyRzhZeTh5UjZqZFN1TERhc0NmTU5pdTVhMzhkZmJKaU1uc0dv?=
 =?utf-8?B?QkMwbTMyamZEYWhJSUJodE5VTmNVVEw4bnc3cU1XOVJWNnc4VDdPZUN4NFVJ?=
 =?utf-8?B?VjBhbkxiOHNDZ0JQbHRkdDhSVlppeG1XYXhrNVNySmNvQ1E5QmxlQ1VnMVhF?=
 =?utf-8?B?NjBhYkpGM3RPMm4wcHR2cjFoZTVnQXV1d0JUQkRqQllBZTFWTlkrNElrMWk2?=
 =?utf-8?B?eFpDNHBZSm1FeG5yODhVLzVCSVEzd096djN4K3FnSjJHbG5wemVSWURHYlBz?=
 =?utf-8?B?KzZ3K3F2R0ZiRURnWEd6TWdOMHA4UGpORmtWTVFkL1k4TEZITDZjRWJCdTE2?=
 =?utf-8?B?NlRFc3hnOXllUFNKNnpZSHBZSnBWenJyeU1jQjRURjN1RENzeXVoZW1GemJn?=
 =?utf-8?B?TDFLeE8zY0ZQM25NZFg0VVEvWmQ1bHdZclk1OVlXQXdMNVFxb0RLbXlPZkJm?=
 =?utf-8?B?SDhjSGsrZW43RE1sOTR6WkFpUlhuZUVJdU8zME1yay9uY0lBRzh0NW92akJB?=
 =?utf-8?B?U3l5T1JRNnZWM0N2cTFWT3dKMzg5MTBDNWI4NWJnei9iUWQwa3NRaU83RG0y?=
 =?utf-8?B?R0dQSFhBZi9mYzZqNC9ESllkNnkxRGI1Z2d1RDNSQ1FmOU5PVjFLbkR3d1BM?=
 =?utf-8?B?VTExdWhGMW14blU0WlcxYitOSm92c29ZZTh5NTVZLzdydlFlT0ZrbGFOb0w0?=
 =?utf-8?B?OEtsQUtsSXdFK2ZmdTE3MnY3V0VuU2hxVmxOcGJpWitjc2hGcnRxZXd0VEVE?=
 =?utf-8?B?cks3RitFb2RPZHpPQWZ3RldzMTQwcEVOTlZIek1kZnV0R25nNGM0SkRWVE1L?=
 =?utf-8?B?M2V5SWQ2VWo3dHNGUTZZMmswVDV2dWVWaEpvdFpxaVFuOHlFMDlPOWx5NmVP?=
 =?utf-8?B?bzlwTUxOOU5HanhucDVJa1pVL3lNdmtIL05Hdy9WQWpFNWVWejVuK3JNYTNF?=
 =?utf-8?B?L0Rjb1NnUjMxaUx0NUR3cmZXNTJwY2R0QSs4YmRxbVhWMUN5LzFvK3A5ZnVE?=
 =?utf-8?B?NWxpcWZxUGN6ZGo2Z3hjY1JPR0NLdEJtV080aDZzeEpOZWU4QVZsaE44TURF?=
 =?utf-8?B?NTgrTTVTanlQbm90aTdGekRzdURHMXozZmpwM3JsUHQvUjVyZklsS3pkLzdt?=
 =?utf-8?B?MVZKdjVLdzUrdmJwZmRPWTMyemI0WmE3dCthR2xNcXhIQWZ4QmFQTHhsaE1T?=
 =?utf-8?B?OFczTDFCcFFoMXpvNzFjNFVCV2JFdEtFRlR3WTQ1VC8rYW53WUhubnlXN3FL?=
 =?utf-8?B?NGJpTnpKcVlxcDlhQVhORm9CRlRheHN1VEY0cGlxY1ZNR3YyT1hkWWJXcUoz?=
 =?utf-8?B?YVJPeCtlVlFxR0RhUWJmMTBwR1dKZDUyaEFmem0vR2tLaE0yUGpweXFGbE94?=
 =?utf-8?B?eEtrUHVPNXNEUzJEdmgwRzVDQkJ3eFYvZkRJa3pTZTBpeEppMHR6dTliWXNp?=
 =?utf-8?B?aldXdEs5UHlvZGRadSs0QWZpWFBJbVJlNnZ5Zm8vRi80TzNYZWRFcXU2Y1JS?=
 =?utf-8?B?RHVjTTgvYUhEZnZZaGhOTFhTODVRNlpDNy9uSHF4eSsyTU5zL01ldEZtK0tG?=
 =?utf-8?B?OSsyYkdGeXN3aU1wbXBoRkl6NWZ2a3ZIWkdNY0JKWVpQalNIb3I3T21QYnd5?=
 =?utf-8?B?bHYxQk5ER0x1S0hyUDlMT1NYTmxRR1lnY0F4YWJrMkNlcEh2R2FkeG51bXVW?=
 =?utf-8?B?Um9sak5ORTNIM1hySGczMjVTUXczN0hTQ1FuTmZiMnBNZ05FY0RDOG54aTZS?=
 =?utf-8?B?eEtkVERoUUh0LzdRVTdlU2w0UUV4VE1qdUVTZkUycFVIcHVUQkFYZmtBSVBp?=
 =?utf-8?B?eFRVT01lTjhSY2xTMVFVNXFUdlhibXMvSFAxMEFBMHl4S0dHSHB4b2REUWxI?=
 =?utf-8?B?bzhZV2tXZlNBYytBUEtPb3Q4aWw5WWllUVFudGZSS0l0RzlDY1pidUNpTEc2?=
 =?utf-8?B?SHJlZ1VwQzFxZTZOZzI5ck91Y1ROMUoxQms1VDFBZnkrc05hWU5zVU5IalQz?=
 =?utf-8?B?M3FYT1h0a09SNWk2UC9MTmxuT1BXMXVhcGp3U3RrOVpRMEttRmhjUDFiWk82?=
 =?utf-8?B?WnJQUElpbmwxZFVwZWdLeCs3RWdZUFIwc0RRbG5WZXgyd0FrMXliQ2xLOHU2?=
 =?utf-8?B?T2VFNk9MOHRBc2VONXVjcHJ2YUxaQkRXLzRxTFgrTGFRUFZMdzJCWDFpTmNh?=
 =?utf-8?B?NnZTZEJlS01GNTNTNjZJV01pQjVjL0V4NjJkZmlpazBwaGZ6S2UxVHdVUGlE?=
 =?utf-8?B?YVVnYjVldU5UQVUrSjQwUFNvQ0FVRU1Ua003RkYrelNMaDNQZ2lybENDazlM?=
 =?utf-8?B?aGNMajlWUGpJYVZhdU45M3VXa0MzYWxjbDduU2dPTzVNSW9CeXBIN0N6S1Qv?=
 =?utf-8?Q?/M+9dAzKvvjL0guMXpUEBmtSxW5oNkDvvwaWIiBPMaVw3?=
X-MS-Exchange-AntiSpam-MessageData-1: tFfOf3KgynxYRthYEatd8tjWGU0GR+GPTkI=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48e1fc9-8df0-4d62-0566-08de8666614a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:52:21.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7ovvq1KVpl3IKUzq22sDlWL8XyjN14Ao3a1yHIzum07+sy8+AYagDV3dlw+svW1I90BDYz/6AEvZeElarnR92aUfs+Mp26zxH/1EHWUnaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7885

On 3/19/26 18:42, Edgecombe, Rick P wrote:
> On Thu, 2026-03-19 at 17:38 +0100, Pavel Tikhomirov wrote:
>> Adding original author to CC: Rick Edgecombe <rick.p.edgecombe@intel.com>.
>>
>> Maybe he has some insight on why we have this SKIP / return 1 inconsistency.
>>
>> On 3/1/26 02:47, Aleksei Oladko wrote:
>>> test_shadow_stack prints a message indicating that the test is
>>> skipped in some cases, but still returns 1. This causes the test
>>> to be reported as failed instead of skipped.
>>>
>>> Return KSFT_SKIP in the skip path so the result is reported
>>> correctly.
>>
>> Should we also return KSFT_SKIP in other 3 SKIP paths, which currently return 0?
>> I guess that means that those skips are currently reported as success, right?
> 
> Oh, yea I think the first skip, "Could not enable Shadow stack", should return
> 0, but the rest of them should succeed if shadow stack gets enabled, so they are
> more indicative of kernel issues. The "[SKIP]" message is wrong for those. If
> you want to leave the error code as 1 for them, I can send a patch to correct
> the message. But please feel welcome to fix the message part up too.
> 
> Also, "Could not re-enable Shadow stack" is a prelude to a crash. The test can't
> return from main if shadow stack is enabled because the shadow stack won't
> match. Functionally it makes no difference because it will crash, but it is a
> sign that there is something wrong with the kernel. So having 1 there will have
> the code make more sense.
> 

I think it should be something like below then. Aleksey - feel free to incorporate the below change in your patch if that is OK.

Note: I also added earlier exits after failures in ARCH_SHSTK_DISABLE and test_ptrace. Plus made test_uretprobe only skip when we print SKIP message, else fail.

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 21af54d5f4ea..3a0019bf65df 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -36,6 +36,8 @@
 #include <linux/elf.h>
 #include <linux/perf_event.h>
 
+#include "kselftest.h"
+
 /*
  * Define the ABI defines if needed, so people can run the tests
  * without building the headers.
@@ -64,7 +66,7 @@
 int main(int argc, char *argv[])
 {
        printf("[SKIP]\tCompiler does not support CET.\n");
-       return 0;
+       return KSFT_SKIP;
 }
 #else
 void write_shstk(unsigned long *addr, unsigned long val)
@@ -820,9 +822,11 @@ static int test_uretprobe(void)
 
        type = determine_uprobe_perf_type();
        if (type < 0) {
-               if (type == -ENOENT)
+               if (type == -ENOENT) {
                        printf("[SKIP]\tUretprobe test, uprobes are not available\n");
-               return 0;
+                       return 0;
+               }
+               return 1;
        }
 
        offset = get_uprobe_offset(uretprobe_trigger);
@@ -981,21 +985,21 @@ int main(int argc, char *argv[])
 
        if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
                printf("[SKIP]\tCould not enable Shadow stack\n");
-               return 1;
+               return KSFT_SKIP;
        }
 
        if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
-               ret = 1;
                printf("[FAIL]\tDisabling shadow stack failed\n");
+               return 1;
        }
 
        if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
-               printf("[SKIP]\tCould not re-enable Shadow stack\n");
+               printf("[FAIL]\tCould not re-enable Shadow stack\n");
                return 1;
        }
 
        if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
-               printf("[SKIP]\tCould not enable WRSS\n");
+               printf("[FAIL]\tCould not enable WRSS\n");
                ret = 1;
                goto out;
        }
@@ -1057,6 +1061,7 @@ int main(int argc, char *argv[])
        if (test_ptrace()) {
                ret = 1;
                printf("[FAIL]\tptrace test\n");
+               goto out;
        }
 
        if (test_32bit()) {

