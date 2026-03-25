Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A13DCD9E;
	Wed, 25 Mar 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451231; cv=fail; b=hlD4nIndhXR/wKH6+RNocCM9d52+fjEdXzc+I+2plELriAyNGDbmhSqQ9E3zFbU3oik1BPk/7eXO1mz567ZZM45lJf9a+1R811gqIRvxlXM1nHSuQw0OYLXDHVI9tOpX0S5yJRGKWABDWxM9cjO5s3/+nXtWtS2/nISbJpfosDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451231; c=relaxed/simple;
	bh=k8sXvDQKemPjOJfdFP5pz/+Y/cDIoEkyFY1pgl8+4wk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=on0b02Rs/6kragOZ1sg0zNQoQiMK9RlvZjOdekCvITxeyzUNaZNg6u7+lLPfdAHe/B0LCqjEyC9Mi2IBH1ZbA3y6ShrrMDMIB4YzMY9Kqf48RDMQHu5UQ8dR0QrDjEnM5XFS0k8jp/kHN0PbyqGAsrpt7NqUb7WQoLUZNlDnygg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UOUjpM58; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UOUjpM58"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7A3tgwMvJv2qP5d0MY60Le+wCuMU/0YX1cZQ7uTmcjAsSXqhqmaqxF0hF10RZVoa5lLYz0weWuqvfRS4YRpA4JucMmuPN8M0bwJHfWhhtxQmXSJHHJb3ijAv5IFnlur4LxFrwBpWY+gpDVRxAazXis53iZteoVvK24fzO7t7RRgJ8nXZY2+ATyfFw9WTumhD2Kdf5mWGrSpsXQaTApxXFRKXPoD97UoTKB+gmiJ1f+p6bEZsa4d8MYbIW3UPhdQWj1ejaF+zMVgq4/zyKYQjxMabQ6BLOxjqbdTQDviBx4ecx82H+Lcs9OOqEKUpSpsyv6EXTuZks1zYDWOT3UxsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrLDxCz9mf7ZCQ5AvtGyzpclUBF7lkTLVhb3qbEQwlk=;
 b=PNRL6fsbAAedPB5VrwHOhLdqJQ8pcV1T5LeXXl6OfPnMlII/fT55Sx6BxY6X8MCGnnQ6QAhWMGC45F1d3jO9+cHwNApzX1OfOCX60Pxf7BGwtRl9UEamWeEMO7fjxTQavyQIDbO53MZw8WvHfErfY6VClYdy0VHTsQRojp/84xM7qFK99VUUk2VWq0qhd2FE8E4EX8YAEkqIn+/Iy2rhD0YcUwu7k86JfptjN7lDg70zqzz6V6s/N5NozdxKws7s89gR+qwz3NJxvXz6krlgpsYRMtQQ1ySaQOx8IXjBTIrgOff6eT9GNd5wdneBtTSgixQ7GEvkjDxu6EjMQTl41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrLDxCz9mf7ZCQ5AvtGyzpclUBF7lkTLVhb3qbEQwlk=;
 b=UOUjpM58y62wvz9OH5jVn68vGJJ9BlWFMyyWElM3GFn8eu7Lvun7aY5kc7kHfczlhqX6oqF6NEy9WJSVac3k0xJfiD2wN07eWafSYBnbLfavjF81ArjgdGSKPOk4/ILVGVMIag/uZ4BbIGj3o1ptrfmKfLF8bofTvnviK5Lw5YQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SJ1PR12MB6340.namprd12.prod.outlook.com (2603:10b6:a03:453::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Wed, 25 Mar
 2026 15:07:04 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9769.006; Wed, 25 Mar 2026
 15:07:04 +0000
Message-ID: <b750f712-7504-4862-b099-aca70550f10c@amd.com>
Date: Wed, 25 Mar 2026 10:07:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing
 tool for driver metrics and features
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <20260301131124.1370565-7-Shyam-sundar.S-k@amd.com>
 <91a389ee-2020-373a-20fa-9183d70f8684@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <91a389ee-2020-373a-20fa-9183d70f8684@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:610:e5::13) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SJ1PR12MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 048ee438-49ae-4eb0-c755-08de8a802c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A9JRySBTvIdo7nvzhzeCth3tFUVIFx7mi3JAPsAMvqN88xvpgsychvDr7AE/v/mugfhAq9lWyhtk0OypyxQUcO3wDu9ErnTp6GD/Olg9F97ssovKbbBH0/UIkKSr1RNWKa8KsC473vk6F7aVj4npknfXLVtqB5f5H7PenjyRUMv1KGso140ZLb2cywKD5RndWn22q33JPvnMU9z60aZJnbn98TTWnUqvIHr8Hml37dJ0Vpwgp94xlF2kdqEG05hSKcLjwsPkeQLnh8Aurf8sbtstzYvP3LXcT1SdCn4PiNtBTC5OV4f3Ii29V7FnIUH10XjC0c1cDoiXFpT0gosQr/SNTRa/V5UToTEBS+BDChmak0tW832nO5+mUucxuEohCHx5pIOc+X8eS6t3IDLCuE7bdl5bUv8Lb5Ne4uIpLxKaR9fbU5vUE37KLGtgatiYP12A1YMa6QlS8btA4B/mo8rYQgX8MIjKS5K0lyU5ANG0PE8xflFhmnYBp+a0knik45m9TDiOk1m/860YsgbkZ9ypL6Vynpe6+bRmX4m7ZZvGemVshYP+Q0jUg+7uDX2B+bDMmGecZhukrmF2j3LJQ83aK7b006c1pFlYM5PQqNV3Me7CVEd3caoYTkB3alK0RJBrwrfgBACsEjqY9za6up+1Hw/BF7e2Kfk3fCcm8J/wdd+ofLBPPBCU4mDPeOiS0jKj7zaWVaj2UKeXkKAMAGQ1jJAjx6j1SblYZZ3oAII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUxZZGJsemxRcFYwSEFtQ256aEN0VWdYbWNLVThCK3BGYjVNcFFFZnFpRFI5?=
 =?utf-8?B?WVBWRkNXR2JkTXJtSFgyTmpuZ0hCeFhmMHFuMGUwS01FbnFuaEwvNTlJQmw2?=
 =?utf-8?B?dXVYRGxhVDZ6a2s0emhxcnJlUFVPeks1c2FCR0dNVWdZSzk4VllNaVNrTkpW?=
 =?utf-8?B?QVlLaUhlZTJpMUZuQjhiZG8xaVFNRTNlbW1EY3huRURDUVplcVN2T2FUMkhl?=
 =?utf-8?B?SDJ6dHlTZ1hDbjdUMk04T0c3dnR0ZXlZUVZsYW5mRFdiVnRjWFhTWTluUGNU?=
 =?utf-8?B?dU1NSnRCWDVaSTBNcmgrYkpLajZ3aWdGOW9WYU5MdWFQdGxkaHU1Qzc4czI1?=
 =?utf-8?B?T0pjcFJMdHJUWk5RbkJobUpqVlVwNWFEMTMxSmh6SlVJNGdkUitIa0lKR3Fx?=
 =?utf-8?B?WUc3OWxKUzU5NFdrOVpZRm5GZVdSWHpXV1l4dklMcUljT0xLUU1oTVNWbGRt?=
 =?utf-8?B?b0hqendnUzRCRW9CcTJoSUFMclQ1REI1ZDA0MTdiYVpKc2p4K1BhVVpkeFRl?=
 =?utf-8?B?S1JRd1lWZFJNT3QySzFpc2k1S2w0bjlIaWNrK2ZrdVhOYUx3KzdZamE5S1Jz?=
 =?utf-8?B?ek1Ic2tIcHd4N0EyMGlGU0hsV2YxUmVBdzJxbkVJL3FPRkhPMWVESTZ0Lzh0?=
 =?utf-8?B?c0xBUTgzTzZobjE2czg3QXMzSXVWMmdlM3h3a0xja3BhNU5VSm9sTjVXbDZk?=
 =?utf-8?B?b3RGK0N4a2k0Q05PNXBEeCtvMXJlWGpFZkJ5UG1ua3NYUnR2b3ozOVl3WUx2?=
 =?utf-8?B?Qy9rUC81dzBRenc3TllwdmkzekxpbFNSeXJtN3d6ODM3Y0FrMW02NFk0YXdt?=
 =?utf-8?B?MVI1d0lOVGxMRnhuZXBUOEdkTmV0cG5CMW82cGVLZlZHUFdtNGhiU3J4VG5O?=
 =?utf-8?B?VWw3YXRKL241RGlPemdUQVN4VWdrSkdIVmtlS0NZblNka1hJMXRiSlJsbmt2?=
 =?utf-8?B?eEI1M2pqQzlITUlhZ3VYVFBMYmNwK1VmMDkwVHl6Q3NnRUM3Mlc3dHBRNmRY?=
 =?utf-8?B?ZmlRUXhxZGxJMFBlaTU1ZnBpSEgrUUd5Ny9ac0I4aERUdFZoUG5oVjUzdzdX?=
 =?utf-8?B?ZURPclhPZ3hJb2NONi9lYzlNSGRyUlJXb3FQeFEzajBiWDVWK3FZYTVQY3I0?=
 =?utf-8?B?Qzk3ZmpwejR0ZURLK1dtaTIyanhlQys4eDFuU1VPRThqZnJjWHJmclhsMEVv?=
 =?utf-8?B?K1BxeVk3VUNVSWRXUzFLakg3M21VSHFKaS9yTm12Y2EzUUVjMDBVaXI1YXow?=
 =?utf-8?B?VjUyNy9aTTFrUXpKd0RML3pIeFJLME80eW9GNTk1RmUxa3ByZEhsMjVWZ2k5?=
 =?utf-8?B?R1hMSUZKOWt3YWN6UkdaRUMwR3N1NjNmanZiVkM3UmYvdzhPakZuRit3NXdE?=
 =?utf-8?B?ZGtkR1hQYmVnS3ljcTlOQm5YNjY1TnkzSE1lZVZIaU8wZjdNcGV1eDVUb3Vw?=
 =?utf-8?B?SElkakZOUDY2YjJETGhCWFdVdjVrTXkxMGo0cm55ejFNRXF6WFljZG1pZFhy?=
 =?utf-8?B?TWxhU2lJcmora1VRenI4V1VKVnZIZTFBQ0szMTl3RG9zZWN2UEFjMXFlVm8z?=
 =?utf-8?B?T0xvS2haNWdMYS9QN01sVG1ocS9CUjAwZlM4YjBoU2VsZWh3T1E3UjdHSjN1?=
 =?utf-8?B?dWo1ZHR2VW5MY2JRQlFERmxsR1FUbTdTQVpCQ3IrN1hDeUZsWkc4STFrUXRT?=
 =?utf-8?B?ZGFNY3FCWXlDcWFINzN1aHJUY2lzaU1rMXhCRFVhNEYrc1JzMTEvd2FwZm1H?=
 =?utf-8?B?QzJGdEF2L0cyb2NxR2NDZ2toV1Q4RWVKekRhd2NLVXJkWWs3ZnZxTmRoaVIz?=
 =?utf-8?B?bENCUElkMW5JZ1JrYjhFRnRuL3p2WDBHTFpPQjc5bDJyYVJpSVVIMG9aUUJS?=
 =?utf-8?B?a2pnL3VrRVhSdDlUd2VOV0ZNcmhyR2ExcTFyL0FVTUZ2d01VcHEzNlZ2UUZX?=
 =?utf-8?B?dTNweHpJUkU5NklsbHUzdTZya1QyVTB3L2d0NVNjUzJvZ3U5WWhyN2toYVRK?=
 =?utf-8?B?RlNBeFZJVHB3QTBIcXB3cEpBYkJMNUhFT3FoNEJKbnBEeUhtN2NxaFFObSsx?=
 =?utf-8?B?QjRCaitCMWFUVVZOUXBRM2hwM0ZSNGpuQlFxU3lJcThZZ0JmUWVIMGJUVUxN?=
 =?utf-8?B?NVFuekxLbXVKUjlxME94cVRHSllCT3BLWHRtS3IybVhhSDcyVFgxQkY2WmJJ?=
 =?utf-8?B?Rml1dmV5M3UzUkIxOG5Mc2ZBQUhsUmVjOTFOQmo4WVNmL3NFbmZ6cmdZSFFV?=
 =?utf-8?B?aUxoNXQ2RjZtME5xNFRManRsa0tINUh1T2F2TUxlK3RuakthRTVJSGxybm9p?=
 =?utf-8?B?N09JU1Rra09BY2ZidnQyRjhDbXRpV240d05LMWxseThQT09sdllIdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048ee438-49ae-4eb0-c755-08de8a802c80
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:07:04.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTEwURlUcP7to1PNnG2LMGN/IJeCpk5XDYiLwPFXvy0Mpkwl+CPx1fl5dQyNjD5od32Ojlv1lOahi3lopervXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6340



On 3/25/26 08:54, Ilpo Järvinen wrote:
> + Selftest people.
> 
> On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
> 
>> This tool leverages amd-pmf ioctls exposed via the util layer, allowing
>> validation of its newly integrated util layer and /dev/amdpmf_interface.
>> It includes a user-space test application, test_pmf, designed to interact
>> with the PMF driver and retrieve relevant metrics for the testing and
>> analysis.
>>
>> It provides definitions for test metrics, feature IDs, and device states,
>> and includes tests for various AMD PMF metrics such as power source, skin
>> temperature, battery state, and custom BIOS inputs/outputs. It also
>> enables the testing of PMF metrics data and feature support reporting.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   tools/testing/selftests/Makefile              |   1 +
>>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 243 ++++++++++++++++++
>>   3 files changed, 252 insertions(+)
>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
> 
> Please Cc also selftest people in the next version submission! Maube you
> should also check why your patch sending process did not capture those
> receipient for you.
> 
> To me it looks this "tool" doesn't really perform a selftest the way I've
> understood "selftests" work. That is, it doesn't have notion of Pass/Fail
> at all AFAICT. I'm not sure if there are other selftests like this but
> hopefully the selftest people know.

For a similar "tool" I have it outside of selftests:

linux/tools/crypto/ccp

Ilpo,

Maybe we want a directory structure like this?

tools/platform/x86/amd


> 
>> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
>> index 450f13ba4cca..d850fb09eeb9 100644
>> --- a/tools/testing/selftests/Makefile
>> +++ b/tools/testing/selftests/Makefile
>> @@ -26,6 +26,7 @@ TARGETS += drivers/net/netconsole
>>   TARGETS += drivers/net/team
>>   TARGETS += drivers/net/virtio_net
>>   TARGETS += drivers/platform/x86/intel/ifs
>> +TARGETS += drivers/platform/x86/amd/pmf
>>   TARGETS += dt
>>   TARGETS += efivarfs
>>   TARGETS += exec
>> diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>> new file mode 100644
>> index 000000000000..876424941e83
>> --- /dev/null
>> +++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +CFLAGS += $(KHDR_INCLUDES)
>> +
>> +TEST_GEN_PROGS := test_pmf
>> +
>> +top_srcdir ?=../../../../..
>> +
>> +include ../../../../../lib.mk
>> diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
>> new file mode 100644
>> index 000000000000..a040ef01ba90
>> --- /dev/null
>> +++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
>> @@ -0,0 +1,243 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD Platform Management Framework Test Tool
>> + *
>> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + *	    Sanket Goswami <Sanket.Goswami@amd.com>
>> + */
>> +
>> +#include <errno.h>
>> +#include <fcntl.h>
>> +#include <inttypes.h>
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <sys/ioctl.h>
>> +#include <unistd.h>
>> +#include <linux/amd-pmf.h>
>> +
>> +#include "../../../../../kselftest.h"
>> +
>> +#define DEVICE_NODE		"/dev/amdpmf_interface"
>> +
>> +static int pmf_open_device(void)
>> +{
>> +	int fd;
>> +
>> +	fd = open(DEVICE_NODE, O_RDONLY);
>> +	if (fd < 0)
>> +		fprintf(stderr, "opening PMF Device Node failed: %s\n", strerror(errno));
>> +
>> +	return fd;
>> +}
>> +
>> +/* Helper to run IOCTL_PMF_POPULATE_DATA for one control code and return 0 on success. */
> 
> Reflow this comment to 80 chars.
> 
>> +static int pmf_get_fd(int fd, enum pmf_ioctl_id code, struct amd_pmf_ioctl_info *out)
>> +{
>> +	struct amd_pmf_ioctl_info info = {0};
> 
> = {}; should be enough to initialize to default values.
> 
>> +	int ret;
>> +
>> +	if (!out)
>> +		return -EINVAL;
>> +
>> +	info.control_code = code;
>> +
>> +	ret = ioctl(fd, IOCTL_PMF_POPULATE_DATA, &info);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*out = info;
>> +	return 0;
>> +}
>> +
>> +static int pmf_get_data(enum pmf_ioctl_id code, struct amd_pmf_ioctl_info *out)
>> +{
>> +	int fd, ret;
>> +
>> +	fd = pmf_open_device();
>> +	if (fd < 0)
>> +		return fd;
>> +
>> +	ret = pmf_get_fd(fd, code, out);
>> +
>> +	close(fd);
>> +	return ret;
>> +}
>> +
>> +static int pmf_get_feature_status(unsigned int code)
>> +{
>> +	struct amd_pmf_ioctl_info info = {0};
>> +	int ret;
>> +
>> +	ret = pmf_get_data(code, &info);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (code) {
>> +	case IOCTL_FEATURE_AUTO_MODE:
>> +		printf("Auto Mode: %-24s\n", info.feature_supported ? "Yes" : "No");
>> +		break;
>> +	case IOCTL_FEATURE_STATIC_POWER_SLIDER:
>> +		printf("Static Power Slider: %-24s\n", info.feature_supported ? "Yes" : "No");
>> +		break;
>> +	case IOCTL_FEATURE_POLICY_BUILDER:
>> +		printf("Policy Builder: %s\n", info.feature_supported ? "Yes" : "No");
>> +		break;
>> +	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC:
>> +		printf("Dynamic Power Slider AC: %s\n", info.feature_supported ? "Yes" : "No");
>> +		break;
>> +	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
>> +		printf("Dynamic Power Slider DC: %s\n", info.feature_supported ? "Yes" : "No");
>> +		break;
>> +	default:
>> +		return -1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pmf_get_device_state(unsigned int code)
>> +{
>> +	struct amd_pmf_ioctl_info info = {0};
>> +	int ret;
>> +
>> +	ret = pmf_get_data(code, &info);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (code) {
>> +	case IOCTL_PLATFORM_TYPE:
>> +		printf("Platform Type: %s\n", platform_type_as_str(info.val));
>> +		break;
>> +	case IOCTL_LAPTOP_PLACEMENT:
>> +		printf("Laptop placement: %s\n", laptop_placement_as_str(info.val));
>> +		break;
>> +	case IOCTL_LID_STATE:
>> +		printf("Lid State: %s\n", info.val ? "Close" : "Open");
>> +		break;
>> +	case IOCTL_USER_PRESENCE:
>> +		printf("User Presence: %s\n", info.val ? "Present" : "Away");
>> +		break;
>> +	default:
>> +		return -1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pmf_get_custom_bios_input(unsigned int code)
>> +{
>> +	struct amd_pmf_ioctl_info info = {0};
>> +	int idx, ret;
>> +
>> +	ret = pmf_get_data(code, &info);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (code) {
>> +	case IOCTL_BIOS_INPUT_1 ... IOCTL_BIOS_INPUT_10:
>> +		idx = amd_pmf_get_bios_idx(code);
>> +		printf("Custom BIOS input%u: %lu\n", idx + 1, (int64_t)info.val);
> 
> %lu is for printing unsigned long, not int64_t.
> 
>> +		break;
>> +	default:
>> +		return -1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pmf_get_bios_output(unsigned int code)
>> +{
>> +	struct amd_pmf_ioctl_info info = {0};
>> +	int idx, ret;
>> +
>> +	ret = pmf_get_data(code, &info);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (code) {
>> +	case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
>> +		idx = amd_pmf_get_bios_idx(code);
>> +		printf("BIOS output%u: %lu\n", idx + 1, (int64_t)info.val);
>> +		break;
>> +	default:
>> +		return -1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pmf_get_misc_info(unsigned int code)
>> +{
>> +	struct amd_pmf_ioctl_info info = {0};
>> +	int ret;
>> +
>> +	ret = pmf_get_data(code, &info);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (code) {
>> +	case IOCTL_POWER_SLIDER_POSITION:
>> +		printf("Slider Position: %s\n", ta_slider_as_str(info.val));
>> +		break;
>> +	case IOCTL_SKIN_TEMP:
>> +		printf("Skin Temperature: %lu\n", (int64_t)info.val);
>> +		break;
>> +	case IOCTL_GFX_WORKLOAD:
>> +		printf("GFX Busy: %lu\n", (int64_t)info.val);
>> +		break;
>> +	case IOCTL_AMBIENT_LIGHT:
>> +		printf("Ambient Light: %ld\n", (int64_t)info.val);
>> +		break;
>> +	case IOCTL_AVG_C0_RES:
>> +		printf("Avg C0 Residency: %lu\n", (int64_t)info.val);
>> +		break;
>> +	case IOCTL_MAX_C0_RES:
>> +		printf("Max C0 Residency: %lu\n", (int64_t)info.val);
>> +		break;
>> +	case IOCTL_SOCKET_POWER:
>> +		printf("Socket Power: %lu\n", (int64_t)info.val);
> 
> Please think the printf formatting strings and types through.
> 
>> +		break;
>> +	default:
>> +		return -1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int main(void)
>> +{
>> +	unsigned int idx;
>> +
>> +	printf("Feature Name          Supported\n");
>> +	printf("---------------------------------\n");
>> +	for (idx = IOCTL_FEATURE_AUTO_MODE; idx <= IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC; idx++)
>> +		pmf_get_feature_status(idx);
>> +
>> +	printf("\nDevice State\n---------------\n");
>> +	for (idx = IOCTL_PLATFORM_TYPE; idx <= IOCTL_USER_PRESENCE; idx++)
>> +		pmf_get_device_state(idx);
>> +
>> +	printf("\nCustom BIOS Inputs\n-------------------\n");
>> +	for (idx = IOCTL_BIOS_INPUT_1; idx <= IOCTL_BIOS_INPUT_10; idx++)
>> +		pmf_get_custom_bios_input(idx);
>> +
>> +	printf("\nBIOS Outputs\n--------------\n");
>> +	for (idx = IOCTL_BIOS_OUTPUT_1; idx <= IOCTL_BIOS_OUTPUT_10; idx++)
>> +		pmf_get_bios_output(idx);
>> +
>> +	printf("\nMisc\n------\n");
>> +	pmf_get_misc_info(IOCTL_SKIN_TEMP);
>> +	pmf_get_misc_info(IOCTL_GFX_WORKLOAD);
>> +	pmf_get_misc_info(IOCTL_AMBIENT_LIGHT);
>> +	pmf_get_misc_info(IOCTL_AVG_C0_RES);
>> +	pmf_get_misc_info(IOCTL_MAX_C0_RES);
>> +	pmf_get_misc_info(IOCTL_SOCKET_POWER);
>> +	pmf_get_misc_info(IOCTL_POWER_SLIDER_POSITION);
>> +
>> +	return 0;
>> +}
>>
> 

