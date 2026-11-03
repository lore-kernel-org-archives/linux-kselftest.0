Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793668544;
	b=EOVTma2xFjJbfN2/m/FScHBEkB7Shdlj9FC/TdFv6xq8A93yfjCku8mBKRvvPsU1ylEx
	 ZTDuuNdkx1VaFm/i27eYYrJqpa99rycwDk85rnb8TaCDBctXLEkejsv3HMC4jljP2qaQB
	 zcD5JnpJ2qLa2zKitUaaGYrLK9Z2KCG5exMD8nmNrJROCrRy/99UkDHSY1thBlqfOtmNW
	 guiSkFN9cl+puLUdccKI55sfR80fWhzHpIr8eLaoKiiGvy+g4CJb65VusCEDPdjLIlg+x
	 Hrx7cPALDrjahoyZQvVDNT18vyi4AiIVU/fpjPmZXcveyKaDS1XgGhkWWx97jb9n7kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668544;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fHzLsnRXnKmHULq2RRvwpqvZ8jZq1dW14QSMcFkw/3Y=;
	b=Fsr/9bW6b74pv8DAdgYFzPuXoTgKXuuzy6AiOt4kS95Zol1b8qUaumZ6q26Wru9wxuq/
	 T6umVP/xCIZpmL4uyeJFkJNroA8j1+Va+vQjb0Fkjn/a/r49tGeIL4hjy4NNS+L30urBq
	 bwKT7xUrYEaLjRadNc59MD4BaHDkRL4AhaWom1OQ4aYkghS3+JHnveGSKY2prMWjOGPjH
	 AOvbSlqJFpCJsfhv55hvOBBkJe73aKvpBDzG70GRvRwIE1cTQQAmbM+kymio+8tponq7r
	 sS+pH4c0VkAjcFfw8J0aeEU9i09QDhNnNXgSCsRcc3lUk8pzZ/9828WWc5lejdYuvjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qd8PNpbh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.23
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DE606A324;
	Tue,  3 Nov 2026 01:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7DE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qd8PNpbh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8QqMeGUolKoS94Ko/WtcLzO5BAHL1FRcSHO0PXDYePVKCx+sVfwH/ab5p+xAL/JHTWjIIghVVs8a4G8N/SvfVIF10UaStFFtDTJt6xPgu5todWoQYIi4UKfaJtLs6r2Ylacn1/5rlRnIypMupgRr5hK8sxRe6XNKnXxwugZLEIX9MmfAwnP3Z+Xsj0qHRwGNLO+jHeQLF45EqX7wd8TKgfeBZmePYQSLg6e6UmUpqAbtnFCiZPVnQdExwhr+pd6jJFBM/g51CKK3YciHV/t3jpPf85ZwPO/c8MJX+YIhmV0PMdvW1ioNyv7VB+bIKaPz3SYWBju5cLct5ZHB9GGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHzLsnRXnKmHULq2RRvwpqvZ8jZq1dW14QSMcFkw/3Y=;
 b=oJosq6FqlrvyeLBZkNc3NjWqLUi4rJBbCJSC5uHWy3bXhvCEVznygq9vjQSAHTElecjvVKGoUPag2LzZzjQS4SeLXlHmsJSkg/TWHBx1BCpPydTMO1A43ln7ITc3CVGI6A4FGOKvQ4Bc6ImYry1MUEjl9N16GV/srgSmewi16y8zzllRAI+Q+c4i9x2XuVYa/cJJPUppoANX/mhh07RU1Lek0m9LM+hrVsdmGHpujMELZNBXjw7/k2oTawsnFDO0oRGtzg4StDO4PR7TesjJnI21Cc1oiX9P+0nZTV8j5WxvZCDIVxxUs73oCXZ5klStr0mV2GmMLo2e6poJiJdk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHzLsnRXnKmHULq2RRvwpqvZ8jZq1dW14QSMcFkw/3Y=;
 b=qd8PNpbhbQacUbzkEM+Foi3NBxyEyrulmdOkotwW1SIaw+c4LnjWB7eE7tGxizUXazUbS0EcGZFBr8IBIca4Xa6QEmNB/TQvYMWWi+Z8LCwW5yHQKjGp98g0tDHaAd5oj6ltQHit1QQQ2MV1x3wvEjWs+IMjh4viseAP+EK5fL4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CY8PR12MB8065.namprd12.prod.outlook.com (2603:10b6:930:73::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 01:15:38 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 01:15:38 +0000
Message-ID: <13ea712d-116f-42bd-86b7-a1ac6cb40b7f@amd.com>
Date: Mon, 2 Nov 2026 19:15:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] selftests/resctrl: Use bandwidth values for AMD
 MBA schemata
To: Reinette Chatre <reinette.chatre@intel.com>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, tony.luck@intel.com,
 babu.moger@amd.com, fenghua.yu@intel.com, shuah@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, peternewman@google.com,
 eranian@google.com, tan.shaopeng@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, x86@kernel.org
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-5-swapnil.sapkal@amd.com>
 <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P220CA0073.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::7)
 To BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CY8PR12MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: b34f6264-5b3e-431e-88ec-08df3947f80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|261021121427099003|11063799006|4143699003|56012099006|261028144727099003|261022075727099003|261026121527099003|261022105027099003|261026140227099003|261009223027099003|10067099003|18002099003|22082099003|261102123227099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7Tji/f4dYF9WzgJcNY1rsP5mGv+wpKto2BC85yQSiysR3+Yk0RVWgzGg3eoZxaPqa9gtBxQJz5QhSpiK1pfeIJoFUfjzVE4GV7/gpnjapPnN1RSiHZ/Wecvh0Z7kpTiW2Yaa61OtBeUw7lyML0/OKf1sGy/CuwOaN0cnExg5BDeieTPxJVGmEgBYgkPxp/lsMjsyiCNIDypgqb8CNvjAdiy5uJlNnqBMwWHXMdKC8Cqe9Y76ZKmIe3d+2i6fJl9M6VQ3Xm9VMh9u51C+D33l+x2JwoFiP7v5/v5GUxyp8l3AiMske8f+cz/Pc9thCyfdTvaWaQeJdaDIEm1LnSHcO7y7j8zvoYwuqgslPKUNhblUaXeD7olDS3wTyAZ4ApPxnXsEd1b/XdmBLyBzNNV9dEpLnmwkb7RuS+KVHWTn35uXGe0ISSqtgha3z382aTDhRc2TtiwWNyimLg2Xs7BmThwjJowJr1llsr5kYF91R6MnhOFoVNz6wiwxc3B8013qViprU5NHyohPBHEbNgESGgH9oKiDPzljGBoDkxlf5oh/oO6uSRt9/mzsPoEQ07MF75LPE92zg+GF/QbQ58wAFikKT2GtMMnKuKZFXn2k0Xi4F1QVsy1HXpE6hQj+/LG3dpuWE+oHkUgBG+5ENENH/sRmIzC5UXmTnxQms1Li2v0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(261021121427099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022075727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzhQeGNQSUNDVzlNL0NsVlNvdllBTHhFeGxzNlZ6SHcrT0FsNkVMU1lPdGVl?=
 =?utf-8?B?YnpWbHZCRGEwdldHc3dyU1FjSjdIeW9OZVIrWmdINCsrM29QbmZLMWZ1WStn?=
 =?utf-8?B?ZGk2TDVRTkZWZDYwVm1DdlQzNHZNUCt5bnZwdWIyMXY3Qml3ZUZOYnFlVG10?=
 =?utf-8?B?SDZ4eGNiWmNtNlQ5M0xvN0pVOE51aVFKcXNMM1ZLR2tBTmVpNm83L2p5L1k1?=
 =?utf-8?B?YjZrSzUvaFM4WFBpM1VRZzVPUWZ2YldWYlJSWHAyL3JLRWkxVUdhbWxQbi9o?=
 =?utf-8?B?Sk0zZ3N6Y0dPT3F3U0lUNDBydTcwK3FBb1hoaFFRRVJPR0xBOEsyM3FEZTlm?=
 =?utf-8?B?NXdRUzZrQkNlc3Y2OGcvUGFvRkFabnhTOGFtaGszQ3VpYU12T0RZNnJ2d2k4?=
 =?utf-8?B?ZGl1eW9sYnBTSTBDRTBkNVhMNGF3WHpWaFFVZy9vSTA1NnZvc1haai9uYkFC?=
 =?utf-8?B?b200TWRMM1NHMEVKVUlXSXhJUEFURDVPSmZjZVQzb3puRWtKOVR1a1hwWU1C?=
 =?utf-8?B?bnVWdlJCZi83WFhISGtJSDdpUkpIRkVGTXB3SXRaWXBYYWhMU055K1NtWmZ5?=
 =?utf-8?B?VEMvMi9YQlJ3cVhKWDVrT1luazNlcmlPdmo1dUVSaTVNRlA2dk5tdlhHUEZT?=
 =?utf-8?B?VHViR2lnblEzK2dacUh0eFFTaWdkeHlDU1YzcHdvc1IvVFFwWU1rUXVNWDlr?=
 =?utf-8?B?dkVnODFKRWxKYW51QXdKTmRoM0hoUU5EUnlhOVdWNVFWV3pZQmxWb1JYSHBm?=
 =?utf-8?B?T0FXRW1qRGc5T3U2eGl6ckZDK25JYlZ2Q0RWMXVxQncyNUkzUkFPWVlqdFFE?=
 =?utf-8?B?d3lFOVFLaXhWWk0zajlxQWoxdkwwbmxsOFJ2bVhqODJGYXM2cmNCeHJRSFV3?=
 =?utf-8?B?bzAxOW5yQTNTM3hsVlF1R3BocGtRTE9oY0plMUZoNkJkdTduUWUvdnJLbVZJ?=
 =?utf-8?B?VjM2anAwOW9BNW84WjBDei9zdWVyM0lkSFRTWVVPUEovRHFGdy9qQkgzdEFn?=
 =?utf-8?B?NTFCKyt3R3g2RW9NM0ZkdGF2dGZ2ZnJkQnlNREN0Z0Z2aEY4NXZsUGhpaE52?=
 =?utf-8?B?SXFneFczLzZqRTVTTHVMK2FzQjlOVUtvcGg1U2VyUzZEcWFCcW8wcGdiUUFP?=
 =?utf-8?B?Yk52djNkd2s4cS8zdnlKRDIxV3doUVdmcE9WZkhLRVhIL3Q1V25tanNyc3Zo?=
 =?utf-8?B?KzRGelkvTTdTdC9HMnBSbjRZRjRLZXdJWExVSytjSHJRT0k2UndHVmJGZ1ZP?=
 =?utf-8?B?T1Y0SjVoRkN4UWJDc1JodURzaldiZ0l0S29UWGNiNUdEWnhUNWM1bWFseWNV?=
 =?utf-8?B?RGd6Y1A5U3hGNHV0ZlozemU1R0RUTWJTSVl6bmVtNTA1SUlXZVptYVFmY0Jv?=
 =?utf-8?B?dUk0ODZrK2ExMFZYMDZlWmxPZGdoMVFLRWpTQS94THg2L3VUckxvUWZXOEVD?=
 =?utf-8?B?dGhENDRRTllNZDV6d0pEdy9DaEg4RlhIbENOMm1xcEZUaVc5VEZ0RTVJMzR5?=
 =?utf-8?B?elJKOE9BNFRZSEgvOEM5QmRacXRrUnIxNEdiS1FnVHFWdk9KY3dNTGFHcWFn?=
 =?utf-8?B?aDQvcEYwWFQ5Rll5M0daT1pYM1lJanFqQmFIdE1mSG5PNVRvT3g0Y1FXQTQv?=
 =?utf-8?B?T3lLS1RNT2p2ODZoNFE3MWpHS3k0MDB4dlZDcFJLTG5laThkdURvNWhhUGxl?=
 =?utf-8?B?MFN3VnRLRXhhbDFXcStieDQvbStOdGJITWwva0tSMS9YNXhZK3k1RDRpU2Z1?=
 =?utf-8?B?Q01pZ0NkQ0dab2pZK3c1WmVGOVBHUjVOK1hFendqUHZZUXpTTHpPS0FlY0Jt?=
 =?utf-8?B?TTB6ZWhIYVdtbGNKSzI5RlRJYmtsOEIvNEQ2TDhvMURFdjNWUkxIZUhUNUlt?=
 =?utf-8?B?dTZRdk1rMVZPY1BMdWJvUGRVTFlEUndLVVg5VmxiSmNuS1BscGxQaUpMQUsx?=
 =?utf-8?B?RUZSQWJQWm43cjNrNm41akl4aFlpeEc2S3JZem44TmdRbnlrQkZBM2hTcHlP?=
 =?utf-8?B?bWVsUkVSMTMzWmo2bXlpN21sQkN4M2ZibjVxY1J6ZHlhUTlLcDdMRTdoOHhO?=
 =?utf-8?B?VTdLOHRzeUh0aFh2RDJlMmxIYlRJNmtzTjc5VnkzWW9IejgxVFc3YzBWQ0FF?=
 =?utf-8?B?bldxUXB1YkdCK2hVR1VXWjdiWTVjNUdYQzVBazJtMm10YXlicGJPZ2NkdzFR?=
 =?utf-8?B?QW9yN3VTMFV4THgyakRqdUplR01TRDRvWElHZ0NZYUN3OVZ2RGpEbTAvY1dQ?=
 =?utf-8?B?NklocFJKQ0M1Q0VOTkw0K0N3NjNUVk1YOEhkcVVIZ0pHOU9GTUpYZ0VJTUxE?=
 =?utf-8?Q?7HC6kS9JWYQL1/TNbQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34f6264-5b3e-431e-88ec-08df3947f80d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 01:15:37.8258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHSdodL7oiI32DkOpC/+7EPEpCClK40LBCtu/d+t0PsWxpUomaHDKRMLDz5pArty
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8065

Hi Reinette,

On 10/28/2026 1:45 PM, Reinette Chatre wrote:
> Hi Swapnil,
> 
> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
> 
>> diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
>> index 17ae73d3476c..947735e26099 100644
>> --- a/tools/testing/selftests/resctrl/mba_test.c
>> +++ b/tools/testing/selftests/resctrl/mba_test.c
>> @@ -13,10 +13,51 @@
>>   #define RESULT_FILE_NAME	"result_mba"
>>   #define NUM_OF_RUNS		5
>>   #define MAX_DIFF_PERCENT	15
>> +
>> +/* Intel MBA is specified as a percentage: 10%, 20% ... 100%. */
> 
> The percentage based interface is the generic interface and not Intel specific.
> You can drop "Intel" from references to this interface.
> 
>>   #define ALLOCATION_MAX		100
>>   #define ALLOCATION_MIN		10
>>   #define ALLOCATION_STEP		10
>>   
>> +/*
>> + * AMD MBA is not a percentage but an absolute memory bandwidth value. The
>> + * test sweeps the bandwidth from 4 GB/s to 40 GB/s in steps of 4 GB/s,
>> + * which the hardware represents in units of 1/8 GB/s (i.e. 4 GB/s -> 32,
>> + * 8 GB/s -> 64, ... 40 GB/s -> 320).
>> + */
>> +#define AMD_ALLOCATION_MAX	320
> 
> The AMD maximum is enumerated from hardware. How can it be ensured this is
> the appropriate maximum for all AMD systems?

You are right.

The hardware reports a maximum bandwidth of 4096 (512 GB/s), but a 
single-threaded workload may not be able to achieve it. So, we cannot 
use the reported maximum bandwidth.


> 
>> +#define AMD_ALLOCATION_MIN	32
>> +#define AMD_ALLOCATION_STEP	32
>> +
>> +/* Number of MBA schemata allocations to sweep (same for both vendors). */
>> +#define NUM_OF_ALLOCS		(ALLOCATION_MAX / ALLOCATION_STEP)
>> +
>> +/*
>> + * The fixed-size result arrays in check_results() and the aggregation loop in
>> + * show_mba_info() are sized and driven by NUM_OF_ALLOCS, so each vendor's sweep
>> + * must produce exactly NUM_OF_ALLOCS allocations. Enforce this at build time so
>> + * that changing a vendor's min/max/step can never overflow those arrays.
>> + */
>> +_Static_assert((ALLOCATION_MAX - ALLOCATION_MIN) / ALLOCATION_STEP + 1 == NUM_OF_ALLOCS,
>> +	       "Intel MBA sweep must yield NUM_OF_ALLOCS allocations");
> 
> Considering how NUM_ALLOCS is defined, could this ever be encountered?
> Could this instead be
> 	#define NUM_ALLOCS 10
> to ensure the sanity checks is accurate in both scenarios without deriving a
> architecture neutral count from Intel counts?
> 
>> +_Static_assert((AMD_ALLOCATION_MAX - AMD_ALLOCATION_MIN) / AMD_ALLOCATION_STEP + 1 == NUM_OF_ALLOCS,
>> +	       "AMD MBA sweep must yield NUM_OF_ALLOCS allocations");
> 
> Could _Static_assert be the more flexible static_assert() (and include assert.h)?
> 
>> +
>> +static unsigned int mba_alloc_min(void)
>> +{
>> +	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_MIN : ALLOCATION_MIN;
>> +}
>> +
>> +static unsigned int mba_alloc_max(void)
>> +{
>> +	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_MAX : ALLOCATION_MAX;
>> +}
>> +
>> +static unsigned int mba_alloc_step(void)
>> +{
>> +	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_STEP : ALLOCATION_STEP;
>> +}
>> +
>>   static int mba_init(const struct resctrl_test *test,
>>   		    const struct user_params *uparams,
>>   		    const struct resctrl_val_param *param, int domain_id)
>> @@ -33,15 +74,17 @@ static int mba_init(const struct resctrl_test *test,
>>   }
>>   
>>   /*
>> - * Change schemata percentage from 100 to 10%. Write schemata to specified
>> - * con_mon grp, mon_grp in resctrl FS.
>> + * Sweep the MBA schemata from the minimum to the maximum allocation. On
>> + * Intel the allocation is a percentage (10% .. 100%); on AMD it is an
>> + * absolute memory bandwidth value (4 GB/s .. 40 GB/s). Write schemata to
>> + * the specified con_mon grp, mon_grp in resctrl FS.
>>    * For each allocation, run 5 times in order to get average values.
>>    */
>>   static int mba_setup(const struct resctrl_test *test,
>>   		     const struct user_params *uparams,
>>   		     struct resctrl_val_param *p)
>>   {
>> -	static unsigned int allocation = ALLOCATION_MIN;
>> +	static unsigned int allocation;
>>   	static int runs_per_allocation;
>>   	char allocation_str[64];
>>   	int ret;
>> @@ -53,16 +96,20 @@ static int mba_setup(const struct resctrl_test *test,
>>   	if (runs_per_allocation++ != 0)
>>   		return 0;
>>   
>> -	if (allocation > ALLOCATION_MAX)
>> +	/* Set the initial allocation once the vendor is known. */
>> +	if (allocation == 0)
>> +		allocation = mba_alloc_min();
> 
> This does not look right. "once the vendor is known" does not look to be the
> real reason here since vendor is known at this point. This just seems to be
> a workaround to assign a function return to a static? It seems risky though since
> 0 is a valid minimum for AMD and that would cause problems if ever used with this
> implementation.
> 
> show_mba_info() already treats the allocation as an index as opposed to an
> accumulated value. Could this be simplified by using an index while also making
> it consistent with show_mba_info()?
> 
> Consider, for example, something like:
> 
>    	static int runs_per_allocation;
>    	static unsigned int alloc_idx;
>    	char allocation_str[64];
>    	unsigned int allocation;
>    	int ret;
>    ...
>    	if (alloc_idx >= NUM_OF_ALLOCS)
>    		return END_OF_TESTS;
> 
>    	allocation = mba_alloc_min() + mba_alloc_step() * alloc_idx;
>    	alloc_idx++;
> 
>    	sprintf(allocation_str, "%u", allocation);
> 
> I think having everything bounded by NUM_ALLOCS instead of mba_setup()
> bounded on accumulated allocation would make this overall easier to
> understand.
> 
> This would make mba_alloc_max() unnecessary.

This sounds good to me. We don't need to depend on mba_alloc_max().

Start with a minimum bandwidth for AMD (say, 4 GB/s), then increase it 
in 4 GB/s increments and repeat the test for NUM_OF_ALLOCS.

I have not tested this, but it should work.

Thanks,
Babu


