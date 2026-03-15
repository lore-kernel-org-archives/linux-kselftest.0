Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023095.outbound.protection.outlook.com [52.101.72.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03908374191;
	Sun, 15 Mar 2026 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773601914; cv=fail; b=QfrUyLOnvKODHfpYfw929GNWZEgXKYUrLEW8SczBJ2xEs6zx+T77jMO5ofDFDgf2pdqkwNCgjf2T942F4YL5OpxpET3+iOvHtyyf2zRpt3Xe5ZV8dx8cl8Xg3ry5YDqtiVNfC65WNskSFEEh/d4lECFUnd0h6nbwK9KQsiofThU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773601914; c=relaxed/simple;
	bh=wqKi1p3MxUfFfY+mRJjzG0gLnPz54XJVCPvelfZayYI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dvD2t/oDkBurxH00tgQg33V9Ju4/3Xr7j/RlXij823y9/BjYTKVwe5hqiAWjEVqcMX6gomwKLN6y6/GGsZ3f28WOJK1lTxtpuDsXvLBRUFLe7mL7bY+ypEBgDveEJO/GicwTbwZ6josZkOnCg6cTsG7gyxdwAMvv9c61oOq+bIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=UiXFF/W+; arc=fail smtp.client-ip=52.101.72.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="UiXFF/W+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biGU8ZgVYceg6BOkR7E+uO2N0gr5Gga9YqtDHZ2fvdIGGNAQhhM0cwW25XPWgo4MgZDKflI40/0tDWb+kTh8hURux0h9r8knVdfsVECendZQOQHHbHfdE1vwWC1g+tGM40d1a9jyBi2tz9NSmWISi4wGJWAIfZnD9ZVKsiVTIy3TIEMVY6aHBc+DFd+tWv1MD6WFdodvIRuseagtTSpagdHEXCRLBiKRvlCBYL/qsX+4TwOPBaR5u4fVBjdLgdzFSsF0wuVBGvELR1OReP9ti8HiD439Dqa+wNvxkfjzPaJhiYAZuI5TocdZRDMxf0S66DGDxQLd+QuMVpNH9Wag+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Fg9GgnOeruS32F1uu5ykzeP7gPT/f7n0ODoWXU38zE=;
 b=cXI7F49R4HtJOlJRcn1CaYrbfGO+E5rf4g49uAeDd5waZtkmkgPfxBtaGDjRZNzXVLBMh9V9EeaFABvATcGr4UrRrtUqcsmuMIhCplgjYXRcAUsepgYsf9oaDXqNZU3//XJo0FVP1YdcfMjCMlD2PZAIL3WmEEwnoA+qDal8n/ImCOEhYy+OaPle1/LiT9CWujHawlk6ABHjNHYFYb72fJsJeBVb5tZIM75ycuBIn2B9xiur0sPLS6IplXQF9EIq4qlCi45RLYnMe7j5Jx9+kMvp2XPO+q4PfFawYRFGt6SVt/hA8wnKjuoEjJZnzTz4t6aAOsgg8JqK7Ho1dDFM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Fg9GgnOeruS32F1uu5ykzeP7gPT/f7n0ODoWXU38zE=;
 b=UiXFF/W+MvsahV/PcW8MynWCygsfLatuKdn/oEMDI05ekZkucD/ErKm5bUb4dvZPMZJHVza+f80vhQey1zz2YgP2i9sfGyAvv5XDkMsX8fRqjD/x+ycOXwhscnce0oU3VaG7HDyRiN4LVWRj+KmkkzeUoeryg2IBKpmNhMBTAb0Kpb9ol6J8XXqvsS65no5C7vsixmZzJoIF8IEYLKCo1EBJNrVfeR3ipBF2lVjJK+ebjE4r2/zV4zxVOL/sgZwDU2jU9fdA3n7JfQ88tAX7sYF82XLT271aJaWGRmOG4LiyLRBM0KvSpe+77I0pT4NoJjJPso+h9hVs3d6lAqxbgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB6355.eurprd08.prod.outlook.com (2603:10a6:20b:363::24)
 by AS2PR08MB9920.eurprd08.prod.outlook.com (2603:10a6:20b:55a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sun, 15 Mar
 2026 19:11:50 +0000
Received: from AM8PR08MB6355.eurprd08.prod.outlook.com
 ([fe80::79bf:15ff:6428:dea9]) by AM8PR08MB6355.eurprd08.prod.outlook.com
 ([fe80::79bf:15ff:6428:dea9%4]) with mapi id 15.20.9700.021; Sun, 15 Mar 2026
 19:11:50 +0000
Message-ID: <efc7e02d-f087-4651-aa11-cb3eda2b6cf1@virtuozzo.com>
Date: Sun, 15 Mar 2026 20:11:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: sched: drop unnecessary rpath from Makefile
To: Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210185112.480000-1-aleksey.oladko@virtuozzo.com>
Content-Language: en-US
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
In-Reply-To: <20260210185112.480000-1-aleksey.oladko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::6) To AM8PR08MB6355.eurprd08.prod.outlook.com
 (2603:10a6:20b:363::24)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB6355:EE_|AS2PR08MB9920:EE_
X-MS-Office365-Filtering-Correlation-Id: bb566799-6280-4c31-bccc-08de82c6b63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+irtGCXTFFOCQsKW3Nlp2cq7hT81OIpDeWCxRej5ez2x9m3HJdqS0J8Xt12dKaTfrPqaLUzzf/oY2jpKDvsYgJE8DGiXxGaNlP+alU7hRhEAZICvp6m05QSVae+EdDto5t/h9gODSN9SpgzGqUhS8ILhPIp/YloIrp8flgZ6rRqb3lfXe9J4UT4aqwsiWYHRP5WeoMe1ZA+6IMHFXCjoxIdihd0M8+ozkOoxQ8Q1Ufk6x+WUsBvReCB0FZxIZLg225h8YmwSPdgJAYB56k1+qZKx+PWaAhGOGV8o6gdkPrKqZ3b1fdgi1P0LBSlqtKLkMVgO7p/wx2toZ5d+bgf7CqTDXYoUzRHs045F9nRLp6NdXBVFGHBy/IwFpVBbJoBwOCc3wASou9q8fUg6bcMGZO5ZDbIHQJLeU8qu1Y6dlipki8uld/pULlFqCDptDGaQljUi+sfSO1xnvHm0dyiQANQZRHZ+ZYtgyHKFXa2N64DBsCy5qPaHbzFzAxAJeOQYjGeOn3PWsncIWV5gafXIvH3TknZ2niZi16hULzq75fkNVoHR6lwCzV0OXFSEXVbrRY3wIIf5gD2M5uKlJQYqYZsp7zJegoeV6saQOsg6DM/Rc9PwXwcUb3Nx3H8EZoDRbRKdrA1VD6XbNrrp4UyA/m3KkWNPS6xUlOzJDJOPWK4R6kmFl4fZDxtTJngEwj56d9sin6GCyzd/F1/KHFp6GUuGhFWXnpagoSAIhVZTSjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6355.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFZ1TjdBVXBOM3V2eUF1dHFUM0p6Y1BtM0xzbTJGaVcwZmNoeXUzS1BKbmdu?=
 =?utf-8?B?bFhYa24vQjNaSW5TenFib3NPTnJKMGIzZkdYOGpubDZHaGRqVEoyR1lqQ1Zi?=
 =?utf-8?B?c1kyWVdoVHhNN3RVSFNnZXZYYnpOaXM3RTkwNERpendGaUNlVWlTWlprcElF?=
 =?utf-8?B?MjAxSlJCQlZZYmJqNEF4RVlzRldTNzN0L28xaktmTXEzTHBsY3B6ZEpvSUg4?=
 =?utf-8?B?Mi82ZDUrNnVFUEwwR2U0S3VHdVZSS0VDdU84akVRTTBESHUzYlQvZjM5bFo5?=
 =?utf-8?B?VVBtWG45ZDFUNHlOcFhwT2tUaVZxOXhJUmJRdSsrSzRXUVJ5akVsUWVxS242?=
 =?utf-8?B?WkNydDhvVDlwTFQrMktxMHI0bU1nb3NLdEtoVmU0TFI3S0hCTEh1L1RkRTZq?=
 =?utf-8?B?RHhjNVorLzFiUXdkUklNUW1WMUc1ZDkvVHVoS2FNdDF1QWVlUWdXZ21GYWtT?=
 =?utf-8?B?cjVaMVRWaGQrYUsrczcxQitZU3pINEFHR0IwRmVMbkhBcFEyanB4MVAwME9M?=
 =?utf-8?B?d1Z5UGF3czVGQ3hLSmh3L0xVS1RIdnlrdFNOTU0vdjl5cWxweHc3andNOFRI?=
 =?utf-8?B?NkRscjVkZCtkSERFZGcvZ2EyNlYzK3ZsMmYvaEZ4Sjk0blc5ZVFwNUp3Ykhk?=
 =?utf-8?B?Y3BEdU8xaEFQdDFGZlRYZVp5NWZxamthUjZjV1N4RktZdFI3MC81bVR1U2Fi?=
 =?utf-8?B?TWpSenlkWUJIdm9NTW1Ka3lXbS9FelRWSmU1VmpJTDJwSE1LLzJET1cwQjNR?=
 =?utf-8?B?NUp4OEh2SktRSS9HeHJDVDUxQVRteTY3ZXM5QUpUbHFSdDVjV2JZTXFIcmxh?=
 =?utf-8?B?R3RaTlBQTVM3a1NqMmNidVduOVBQa2JpQldOdjJnMkhRbTZzYS9SZGE5UENX?=
 =?utf-8?B?TTh0Zy8xWmcrYnVkUUlDQnlkMTZHK2xMUGRKRk1EakJyMlo0RHZ6RjVUbHJE?=
 =?utf-8?B?aHU3YTd6aml6RWRBWE9LVmZhdFpjNjhFd3lkZ2UwZTd1QjRjQUc5V1NUT0Rm?=
 =?utf-8?B?cjhJellNUENmSzZGRmJpdTd5a2EwaGV3ZDFlNStrcElMUENBQk5STFI3dUt0?=
 =?utf-8?B?NWJIN2lQbThwWTlYNFl0d3NQd2RoQkVnL3Ewc2dSTVQxL1pZSTV1a3BWNExR?=
 =?utf-8?B?NDBwU2NIL2F3SlRONzhHMFJ2czhFRmZ2UG9Ic0FtK1JSYTR6ZVJtTjNyMG9l?=
 =?utf-8?B?M2VkcHg3c01SVXBnUFNBczgvTjNCejgrbm1NcUFPM2JXUFZGcnh3Y0VRczhO?=
 =?utf-8?B?YjdyemJxWWxJUVNLOEhNVjJxaXZWODlnM0c4dG5IUnJ0b1hBbFBTeFg0eG8x?=
 =?utf-8?B?bkgyZSs4VFRJWlp6MjBqa29mRVlPMTM3VVFlb2RnY0M4SDJBM1l4eHVVcks5?=
 =?utf-8?B?Y2hiSkpZL2pIdzhOSHErYVAySy9sOXpUaTQzUDA4QXRRZjVNdkpnaVJQMWJD?=
 =?utf-8?B?Y0FRM2Y1bWZDTmxVNTZQVTJqdS9GRmFhZ0I3K3FhREVYNXlYUFJKWXUvZWFw?=
 =?utf-8?B?bCt6citoTk5aZzZOc0NsS2gyck9ySVlMRHhSeWtER3JxdmVEbDNjTXBNdUxW?=
 =?utf-8?B?Q3dWM3dRT3FHdGozV1YrMFM3R3VVQTdVV1YyQlhXR2ViVVFwb3cxd2tOWTJI?=
 =?utf-8?B?MHhUYVNZVzk0RkxJUCttdWljNkJ5K21nYkI4T3FRMTQxNTkzTlJULy85R254?=
 =?utf-8?B?djZ3Ti9lUm80Y3N3WStBaTJ5MEg1RlcxRHhzaUlUUFBVYlU4b2h0ZHMyWHBa?=
 =?utf-8?B?UkltOUxoaUZPSHNnUHVXQXk3c1pEd3d5amc4ekREcFE2K2dUUjZZYkFaU0Y3?=
 =?utf-8?B?WmNnYnRJVEpydGdadVZ0bWVTbkc3U2xOMkVWdGxjcEgwRFVzdzBOdGpocElT?=
 =?utf-8?B?U0dEOHVhVDQwOEVZN3YwQVF2aVdaNzJkd0p0NWp3Ykx2UlBrQjh6YWpjbDU4?=
 =?utf-8?B?M2dKREJHSDlsa2tpUHZpK0wxaUZPaitkT1Q4ZmRDTWUvMUxZRnFJWDIzNitC?=
 =?utf-8?B?R21oRTBNbEdrYkZZVjEvd1VJWjZkMC85MWlNZG50WTVRWFc5SnBmYXV1K1pM?=
 =?utf-8?B?bDByNFR3R2szZHBLdXVuU0dKYk9kcVFMQm85RHR2dzBobjdVU3l1Vi9jSjBw?=
 =?utf-8?B?MkZMRHpRY0x6dVBYTnZIU0FGMzU5QmFNa000TDloNDFDdytha1FwdG9oeGhu?=
 =?utf-8?B?a05ObFdFSXVwN3g0Tlh4ZmdxS0VGTlhmc2FqR1NNZXVOYkxoMVgyMzhZZEps?=
 =?utf-8?B?NVViWTIrek1iRmllVi9mc0JmU1NsTm55UVE0ZUF1cTltN21SMXJUUnMxN2h5?=
 =?utf-8?B?UE9jSitkVEQvbWtZVGgzTkc4UXJnajU5UXYrb1FmSEJKLytNTmhGU1M4OHBl?=
 =?utf-8?Q?z/QpLeh1CtUKTitc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb566799-6280-4c31-bccc-08de82c6b63c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB6355.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 19:11:50.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKuHLEHAHC3BmuFryoXgkFlWN9GL9ZfD4Elgnq5CI+dUV2647oMzKc8aXkVWVhNCthKjI7R2UhDpOTDStcsESdpsXAp1OsoMSd5jPkcQwUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9920

Hi,

I just wanted to gently follow up to see if you had a chance to review 
this patch. Please let me know if there is anything I can clarify or 
improve.

Thanks!

On 2/10/26 7:51 PM, Aleksei Oladko wrote:
> The sched kselftest Makefile adds -Wl,-rpath=./ to the linker flags.
> This rpath is not required, as the test binaries do not rely on shared
> libraries from the build directory.
>
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---
>   tools/testing/selftests/sched/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
> index 099ee9213557..0e4581ded9d6 100644
> --- a/tools/testing/selftests/sched/Makefile
> +++ b/tools/testing/selftests/sched/Makefile
> @@ -4,8 +4,7 @@ ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>   CLANG_FLAGS += -no-integrated-as
>   endif
>   
> -CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
> -	  $(CLANG_FLAGS)
> +CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) $(CLANG_FLAGS)
>   LDLIBS += -lpthread
>   
>   TEST_GEN_FILES := cs_prctl_test
