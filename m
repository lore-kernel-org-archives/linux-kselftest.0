Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6AC3559F5;
	Mon, 23 Mar 2026 19:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293477; cv=fail; b=ep0OmfPsBqt9JpuU0EAjQ7/9h4b1BSOYinNfdu9itmmHSRLbDT9tftARjAVdgSUUmcPrz1urX4qujDnY2iBaH03WIr5ioFlpzFQRgzjfegUdXutw+EDCNUutkSen5dGVlyiOzBzA2jKnnpKEsy0n6VkdAOoddxCVvsM5ldRCGxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293477; c=relaxed/simple;
	bh=jGT+VATD3DrCrxArz586dYWGh5vb2tgWRYPmnBrheXg=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IweUqFsDLuVX2d/WgPkc55WDxqv/Ebe20623OMBAhNVLQ2B3XpLBj+rdFmQR0DcvYqsHqKjfpck+YDxWWztQFHIR0RlwEfTsBIXeF8boBrawW8F8Zb1HD/VaqC0F9WuAIpWy3oyaQl05WxvW+9ZXrSNKXrNyt30xMtj+7HhKXXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=BIdues8n; arc=fail smtp.client-ip=40.107.208.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="BIdues8n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYj7UFVgMWQV4xmd+EzN+KVrNXE96AVZOYoL1rGCZjxiKd9Ze4uPFHMITY6XmBRgfN9YdtrS6iq+b9Oc7WDT7kWFDBKFV+oKdQMoW7Fw3OasUCTJdW2b1jjHvnS2P4w22HL7dXHsHwfaEoq9/h23vgpwV9aZVrpI2ni3AbYjL5c2EB0960yQHLAGNMl93aNcnx7WoiUSbwOC9EEwA+LnexNCxa8VmQAWLonmx87QRanEZ/0TQ4dnxSHQmIOMgLjXB8uG3gCbK4vi8P/0yNYjh4RG7glQQbk/zr4lLgftdmDURxX+Ghcti7L9UVaMyiuUc8T2b7r0qd0cy7GoAnfxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNzuj/bIKxEbiaAEz+X/djawtaroubd71ue9lOmlGwo=;
 b=drRF9X8IzZk1cOLNn4/wg/vIlSKN7C065yVKthEJVwsGy4xgUIXkrJOr2q0mqQGrWzZjIpG9j8X1AWbrVoPHxWD6bAnk/czwGm96AbXbRfr2Svu+iv7udlfekZL8O2Wcu1+DSLl3XGimlfutCwNx24k90bux4/qpRb/+SAAMhmJRhG3PMapXWGmPD/SvdyFC5aGcZN2kyzZt0fu5pk81C8Ep8GucP3qmqJJiiIukh8MIyXzpNOXRIcTZt1tF5udgC85upUVIbbeVM12D0CGVY87sppy4/VHU4gS86Pd3ZwhPEy8RTqi7RfAiF+AY4wt9BDSsCNTim/Ikn8K1KziEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNzuj/bIKxEbiaAEz+X/djawtaroubd71ue9lOmlGwo=;
 b=BIdues8nHYYV4fshbijbXo3Eud12JEdQsobLFR1/a4GVV5Q0ECX0lpL8hUhEWfO9BnL5JJ/9hX16ut8ggJYYOf6b6Ze3OCKjSAAvLDnjuPqJjT75heyWhIM+8pSDPlvwvyQD0EhSdEeJd8G9sqVgCm4wUT4KDR+qhD5XaNTooKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5510.namprd03.prod.outlook.com (2603:10b6:5:2ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 19:17:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 19:17:45 +0000
Message-ID: <c2979413-62f4-4a35-ad64-be2b8f55ea04@citrix.com>
Date: Mon, 23 Mar 2026 19:17:48 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dave Hansen <dave.hansen@intel.com>, yi1.lai@intel.com, bp@alien8.de,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
 shuah@kernel.org, tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
To: "H. Peter Anvin" <hpa@zytor.com>, "Lai, Yi" <yi1.lai@linux.intel.com>,
 Xin Li <xin@zytor.com>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>
 <acDYXtVgSKbbAuGs@ly-workstation>
 <ce764071-6670-41a2-923a-88f1cd04b238@zytor.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ce764071-6670-41a2-923a-88f1cd04b238@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0112.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5510:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d118a58-6a7b-4883-c9f6-08de8910dcce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EBtByXb/X+hnbVB2zhQosJemhYhU64SYcMPbnRkGDWEepkEVa5GcBc5kHnng7kTiVRSkByoGU+9Id3Be2pruyB5isyB1AoqN2FLQp7j6QFnL3ah/kK65nH6GakS9Z0/5wMnRF8HSR9UU8Gc/KQMWf8nNwRBLEdAJqGPuvwXvmaZgEGH6lvsRSAKlYc3L44+SAI7r2YVabjKyVIrdvwFsuXB8jjaKccdMVCxPm/p5dv5zst5NC/o6mb3hRTGiqpejYMC+ehZVLBbYaWx5ZLtYktBCMo7PcZ9rC/dUf4gaQvzFt2qml1QQdz8va7gZKAkHP7B0Fu0VNycRyfBj7CSxSBGhRPCRpFOyJ0fSknCSx2j9Bk6c8WQFfitmBqQr/9HTnu6/eOLSp4TVUH3KhrikEby1MgY3azEhlNqSSkQlxdNo6+8J4ytJA13BgLStTAAF40gsENk+6k0UB5KTzg30ufsSp95CDwG5hpHRE8wd080+mSMxVBThqRoWehR45ozEc4NEheCrkdfC5ZjqoU48hqMThwb/HMHgIbOedbB+zB+txe/ciph8Yqn/2zIaOlON/BdJOVseFduRrQfwXEQygcOg6oFjgYl7Ea+nGU8v7fu2gwJRZHei+qbfz/b5xyXGp0SeMlHEoNhKFAlYue4WBNTk0p+clFzubeFjhwbvJW4J1z/rc+NAnS4vkBW9p9u4v8RcY83EQ0kd4CadR2v0tAvdGwatYnZliq+VUsHbjws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlc2MGltL21xYWV6K2lQNE5jUDlTc3VMaGZwdk5IbzhhMGNjWTJEZUdGK3k1?=
 =?utf-8?B?V2p2Z01nckNvQW1rNEY1NnZVMVkxZkNUQ3E0TVN0RXZ4aHZpZ3FPU0xZWUt1?=
 =?utf-8?B?T1pKbGsvVjduUmlubkVJcHlkNUZwY2NoZUUvS1BCRU9zR0NyY3dRSkJFTWFI?=
 =?utf-8?B?b0ZkQXlwUUF1YTR0RWhDMUlCeDVvVCt0TmU2Z1JIVVJPR1EwWVpCZi82MmNK?=
 =?utf-8?B?bWVFVG1tMXlDVkV0bkl3NHQveFFlWXRqUSs0dXNRYUNWUVhVWHg1SG1qcXhm?=
 =?utf-8?B?bExJVkNsU3AwWlNBL0Fvb3FyNGZQU25KbjRKczhVc1ErVmVDQmxtL3hnS3p1?=
 =?utf-8?B?VWNKRytXZjhtYmk1THBOUnB5UjZEd29QbXRWZnNHYWtlRHRCd0lPQldTeEd2?=
 =?utf-8?B?QTZodGtERzJRcGo0YlRsb2pGaFRtTE9UMVVLNFNab3ovZDdrcUl3alJxTkFo?=
 =?utf-8?B?WjJoQXJUYVVIaFQ4RFRCYlFpdE5BdnZWVWZZYzJiQWRxVmNKRWhRaVE0TmFM?=
 =?utf-8?B?NExGVHhmazR2VmVDL3R0bUhJeXpYLy90dHFjZmg2dFNRTEhGVmlKZ25nS0k0?=
 =?utf-8?B?OTdMb093dVFsWU1WOVRNU0ltMmdvOUsyaGlUVFRVRzFpQmZYeklmdi9ZV2s4?=
 =?utf-8?B?NC8veDI0K29LRGxZNVFsSFV3Q0RhNCtRSkJIMVNsTGhKZkdzUGpLaXVBZ3A4?=
 =?utf-8?B?dkd6TEtCT0ZaU081OVlkMnU2MTgvd2FZOGl4dnphS25TUGIrNnV4cXZqTDF4?=
 =?utf-8?B?UXZOejArYkltVDFvbWJtREtDT1lCMFNxd3lrVkdqb2RsV0wvdnhUdDJFQjl5?=
 =?utf-8?B?eXBZVEQvZGlzc3dqUmtvQ0JBenlsN29FVS91UnlNTkdYQ3hhVEVQaFpYMHlk?=
 =?utf-8?B?WE44S0czZkJoWkp3L3pHYTdXcDlUdzk2RUMrSitOcndFbVFhNVFXZ1ZTSTRP?=
 =?utf-8?B?bS9PbGVzbWovbjljamdXcmJwZm5qYWt5WlhwM3pXRG95Ulc0VkpTWlQwZTkr?=
 =?utf-8?B?T0grUnJZdHFnalh5WCt5T1Q2WVllemI3Q3B1M0lhWEVhOFFhZG53cExqcWN2?=
 =?utf-8?B?TTAxM2tlTjRwa3Z5bHlKMG9jamdKL1pUT1Y0UlBsODB0ZnVWUkZaQ2NnUk82?=
 =?utf-8?B?aHFhbG41aHJyeGJ4d05wR002R1BYcVBZRGs4eUFGdE1IemdxZG02NjNnNFJ3?=
 =?utf-8?B?SmxTZUdqSG9vWDJBUlhGN0dvcHQxQkFobkg3K3ZmdEhOMHg1NTJSSVZwd0pp?=
 =?utf-8?B?VTdONU10UGkwZmljNzFJeHVUdVVkdDQ2d1djaVBTc2FnWm1IUlRhZkxtYjdL?=
 =?utf-8?B?cHM4QlcxS0xTK0xyMGlncjBmYzdVZTdwL1pvemZ6bUtGUWhTQ1VES2paNitt?=
 =?utf-8?B?WFdhSlFPdHJ5N0p1ejdzZDY2TWlTKzQvNXlGWHU1Zlg3cnY1bHBUd3FES2Q2?=
 =?utf-8?B?clFpY0Vsd1QxN2VZdzc0Sk0vUXZMbUl6eVZMTi9FcGE4MWJscTRUcGtxVUVr?=
 =?utf-8?B?ZFNLMXFDWDlZOEZ2U3pJeUNXQTNqODI0NWJBMHpFdnM0T1FkUzBCZWNwOXY0?=
 =?utf-8?B?TjBoMWg1Z1k5dU9jdURsdXFjSnh1ZmdiRjAvT0ZSMnBINDZMdmZ2b2gwNEtx?=
 =?utf-8?B?elRuVVk1dGlPUVgycEZHR25wY2ErSDgrTDI3a2pnOHB5Y2xXSWdqZmVlWWJ4?=
 =?utf-8?B?aHBITko4VkNmZktOTFpZOVZHRGt2N3FrNVFnNC94Z2FTMmJNR1FPVEk4TjN5?=
 =?utf-8?B?NDI3UXJFekZucWxBb0s1ZHFEdTNGZHB0UExPVmM2eVBQS0djQXhscFJ1UVJE?=
 =?utf-8?B?M2c1Skc5ZXZOdC9UY21KTTRYcmFQcTVvOHpOUENVWEg5TkVQR1NORGxYRHhz?=
 =?utf-8?B?cjVKQnVpQWxKaUJDT3hIREIvTTBOaERVN25nM2wwQUdlZXA3Q2F6aUtPY1ZU?=
 =?utf-8?B?RkZLOHUyQ20wOEI4T1ZTQnlpbDJJbGMxSDF2MVgxWWIzVUhjUW1zYnJITWt0?=
 =?utf-8?B?VUxrVjVYV3liSm9KMms4NjNKWCtNR0VZcXA0bmhoY283cFYwcm0rdG01Q3JJ?=
 =?utf-8?B?bkRRTjJGcUJ4bDJ2cnlFb1dCNHR4NmpISXF1a0FIVkN0QU5BbFVIVkJRWWJ2?=
 =?utf-8?B?ODc0SlZNUERRZmR4NHlkRzFXQ0JkMUJwcm1mTjlYWFFvTE41ek1LSFdIcndR?=
 =?utf-8?B?SlMrMGRyRlV1TERaeTBXaFlkSjBDTG9UMzYyZjM0WWVKZ1pXY0lFTU91cjln?=
 =?utf-8?B?QjQ3UnBlQ05wT1p2dGtPNnFYaVRFY3k2YkJ4MU5ydFZDUUpSaGh4UzRBLzNw?=
 =?utf-8?B?dnNZS0orbkZJSVpmK1BnUDVuUGNPb2Q4WDhrVU9yTkR4SGRWQ0hWaUN6L2Nn?=
 =?utf-8?Q?lJfNaz+z/HsflE9A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d118a58-6a7b-4883-c9f6-08de8910dcce
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:17:45.2927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yCCiu9OneixVZXmzKnatHz2x8yogkADCbLU1fgvxj54X/7FOW21t0OSui52XI4tv1vDyxObEr9UwDtxpXE+SgylXh7hOavLDz2jQPbioXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5510

On 23/03/2026 7:11 pm, H. Peter Anvin wrote:
> On 2026-03-22 23:06, Lai, Yi wrote:
>> Thanks for the context and links, Xin.
>>
>> My patch is a simple, focused fix to unblock current regression in
>> 'sysret_rip'. The goal is just to ensure it doesn't falsely fail on FRED
>> systems by skipping the IDT assertion (R11==RFLAGS). 
>>
>> Checking Ammar's patch series, it indeed looks like a more comprehensive
>> solution that not only handles the difference but also adds specific
>> test coverage for consistency. Is there a specific reason it didn't
>> land in the mainline kernel? If you think that is the preferred
>> direction, I would be happy to contribute to that effort
>> collaboratively.
>>
> So for what it's worth, I have used this sequence to probe for FRED, but it is
> basically probing for the effect you are truing to test for here:
>
> #include <inttypes.h>
> #include <stdbool.h>
> #include <linux/unistd.h>
>
> bool fred_is_on(void)
> {
> 	const uint64_t sentinel1 = 0xfeedfacedeadbeef;
> 	const uint64_t sentinel2 = 0xbeeffeeb1ef00d1e;
>
> 	register uint64_t rax asm("rax") = __NR_getppid;
> 	register uint64_t rcx asm("rcx") = sentinel1;
> 	register uint64_t r11 asm("r11") = sentinel2;
>
> 	asm volatile("syscall" : "+r" (rax), "+r" (rcx), "+r" (r11));
>
> 	return !((rcx ^ sentinel1) | (r11 ^ sentinel2));
> }
>
> 	-hpa

This doesn't really test whether FRED is active.  It tests whether the
OS is not providing strict backwards compatibility, and I think will
malfunction when there's a hypervisor above Linux providing strict
backwards compatibility.

~Andrew
