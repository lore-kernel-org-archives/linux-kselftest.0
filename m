Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BABA3C6A2B;
	Mon, 30 Mar 2026 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870988; cv=fail; b=odBWPCVWMWzce8RmX5wsAdw3owN7RUzBluJ9o16gXm3PhrCK/1sTByFaLiPO4ZzlCtNNxETCMB1MxNOYSErhQ7edGdthLMDy1kLx8hBW1LABas2oQaAKep+EgnH5l9KO8CvJxOruAbmDes1BYg1wi7q/CS3lWyqkSqnhN8chLbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870988; c=relaxed/simple;
	bh=oRx9Dm7i9XA4k+lE3snlvrs/SC1sZyWluHH5W80sq7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IeJWF/K2ZIeSonpt7WhdRcTBlWQnSGekycr3dz24TPuCGvLoMXOjgOou3lxWIc33/CBc64RII0+oYFDo3sKrNGO5FCVXWsVO41uWzjbdn+QJmhwiZSOU31E2nbGgL0vGGlid3FS3xstluXz6mbnWsLlIOAkPnQjS6UDeuN8Dno0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DdHvqBY3; arc=fail smtp.client-ip=52.101.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DdHvqBY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0ZAldp7Sw7sv9LMY4dPLebMSI2sg7Mv4lUm8pmCIcKvG2FhKvjR5vH/yGBw/McKrI7fqMsC4pe9wvzbhZp9keqQgQ07LTm/etQ2THOudFt21LpCcM6KsrZb3JEW60fPWhHcx9vRUlp3rTEYFn3TTyd7JS0QoWHKW41y4nJBowzYsgsQX4wdzasDwLoM+7j4oq5IhXN7NzyHHBQMHZ5GWJx4CXxOHetzAgkwXJFun2gQNjAaRmWwBG94N7zwdwWDCSwg49OtxVjnHqzBc2BgQbSdbYWaxXbgj9FISp9kufin6lBf0oIDf2Ds+4xdI1DNIGDMf5zni7hz8+YjQed9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c97FVAzVF8dbhMtjZgCI12ZXQyNzNzhYH5bTQCrzGz4=;
 b=WkuajOU0E2QjtQgUIpTCP5J7vFax2Cf2P3RXSChi0Fp7e6yZ+nqsHWN1PWabM4UpRBIm0TcNMtKnXJDSXUXH2iR2kZ67Zw/SJassShyqIERutAPmyWOfKmUbNGcFPFeTFGpZwUin8fxLVDy8WVRUjZzhWEDhcZ5Go3Y+eEXUnwV6cqXYw0/2ekdu+iwkPFa7y1zoDIHwzQpNERgZYd/kaEKA+VK4vLhGokvodlLb0kkGJlcJBhNksWCsSEIGat+pQQxEoulRk5YkNHsdBms7xw2aKnqM6wIgM5r7kUMKIXZC+I5aivUTnDM9jBleVUolFXYxwhpTTPnVJvXG9yoNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c97FVAzVF8dbhMtjZgCI12ZXQyNzNzhYH5bTQCrzGz4=;
 b=DdHvqBY3Ux4C8c7MVFBto85+GfIVk4vi0GIaZZ/7xiiLaE7csuuFfF9Xv/zPsg3b794slkzX+vKHcdigKlMJMQmK5JshqemuMYNE0f6ljrr/9BhHC/5Ih6+T2ChLZYMszBBBhLJZVYyY9i4WFe9SnnIyeLSor6h/NTukYHEMjY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 11:43:03 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%3]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 11:43:03 +0000
Message-ID: <1d0c61e2-650e-4064-af00-23378232596c@amd.com>
Date: Mon, 30 Mar 2026 17:12:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing
 tool for driver metrics and features
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <20260301131124.1370565-7-Shyam-sundar.S-k@amd.com>
 <91a389ee-2020-373a-20fa-9183d70f8684@linux.intel.com>
 <b750f712-7504-4862-b099-aca70550f10c@amd.com>
 <069b8a6b-f166-5d5a-8882-b33c9d2f4e8c@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <069b8a6b-f166-5d5a-8882-b33c9d2f4e8c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f2ebec-c7a0-4f87-a456-08de8e51801d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OWEjb8ZO3jroB50GWruIPI21ZEQA4mnZkwHPBZRIvPGvO+rLhsi3Z8J8kmmJrI2BvoXar/5xipBx6pvdqP8s2OQm9AEuH244+fZqSzWpzgqRmF7rqrbuP9QrCM/GkSUrUCxMl63ipn9c1SuYiJtfWJHx40/aud+QLKS/rK7avHdtj0VjEncBC1wJLniaUmGCSWlQFrPcb2d+0D3dx7nvIo4RM9DET7cDFhO6W5EAZ71ODxel2r8+yt8kwsdGTuditiWL7/7OtMqvuhzHlQmFhD2fZHrnSSW9IR/JSfX8C65pflNAvPPZw8/j/u/wOKAfkkDohHWssFcuf6iAtajud4y518pzdUMZyAS/rTJrX2Y0aVXPkJkgPnIjR82FJeIwJZ1Qh0W/1iInawDkjxARFp9La4S2avm8ks7Zyormf9J9xe8ELudHoFemZ1VouMiIrApYoCTg1Y8grBoa0mtYFfhSApd7hWwtJWgdFBD8N+DrIpmfYC7UShYIN7FpH0eQFMzA+TR4YLLuBKTLWPLugVllrnkvuhV4luiJJEcnYsOFf/jCZJwkpu3J7e3ShxC2cjnYJQYGanuCpE2KuZxa56WLWKugdIjQ9WAe4SYLd5V8KKb9d8+M384dZf5IknmhlYGC07GLHuWaNLqUPSwKBZAYW4LPIYwLuW2io3I4Sq7UYN7X/1J6ypLGG5rIy/UQ8vwyGxjLsOR4l7EGZth653z4keySsIahBXYz4PkX0W4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW5VVVlVVlZDaFBtMW1ybmpSQjVKRGpKT0F1WTQ5MSt1cSs3SlNIc3ZNMVJk?=
 =?utf-8?B?VTZJL1o2emdFa0hlM3ZqU3RCalFKcDJHUWZHTUlYdUNpVkdIVk56eGVRdzVv?=
 =?utf-8?B?T1lCWVFKY241aDBROEJYaE4wTEl1M3RsOWh2Z0hSQnc0TjF2amZhcy9lcEh3?=
 =?utf-8?B?Mkg0SnlvNzBVeDRJSEhSSko3dVcxeHNycllROG1Eb0dUVmc5dnBuMGxkUkx3?=
 =?utf-8?B?bkc0K0IwL0N1N1kyZWh4STBiZ3RFK1lHQVovNWVVdVlIdHgwZWRqSU40S1Jn?=
 =?utf-8?B?M2gxTHpJdVVDR0c1SmQwSXZXbDlieFNZWVdLdDZVMHVaSW52bEpHZ08zd3lH?=
 =?utf-8?B?aG1hZWJWRndWU28zQ0o5Z1JqWDVNRExYMGlaV0ROTW1RNnFybjdzSGt4a3JJ?=
 =?utf-8?B?R2FoTnJoelFKdWZjTnU0dUd3ZDVYdVZXdTZraXZzSEtTK3VFbWk1MDhwZTdE?=
 =?utf-8?B?RXpRdEd1KzRWa0FuTDR6VlJXa0dMZlozOGFxeFNIRjVOUUlneDRJUGdxYjh6?=
 =?utf-8?B?WnlWUVI3RzNCOGZhZjlqVE0rZjBmMlRNMDBWUlhxaHl6dlEvSHRVWVZkYW1x?=
 =?utf-8?B?NUJLeXJXTkhsYWZUV3FDOTJDNTd5RGZDUm1YNUVoQlBZYkFURVF4eFJKaElO?=
 =?utf-8?B?MFd3QmtoZzJGVmI1bVVuS0IvanpEbHZMWXdqVmFZdEVydFhZY2FrZXJ0RzJB?=
 =?utf-8?B?K1M2SHd2VkMvZEduNnFNZHNSTERrcFgvUDdXcEgyVUVpTjZaZFhPY1c5dWRB?=
 =?utf-8?B?N0xBcURhN1pHZ2JPUDdSQjc0QUFyQnpmSE9EZzV4RU0vVG1UZ1pLcFpqQUlB?=
 =?utf-8?B?Yi9FOFpCLyt5ZE01TnJHMUhLWXdvdngzbVNFa0ZMdlBEeHJxdnNobllOeWUv?=
 =?utf-8?B?VzVjQjRlRlYzY0F0YnNRaFNHcVFtalM0UFpkeUZNK3ZzMGtGY3lJcTV6cGsy?=
 =?utf-8?B?RWhSQ3dzbzNIamppcXlSU3B6YVJLUjhlMUtGYVBsZGlBdVBRckJQUkFNWUdn?=
 =?utf-8?B?Z1JXOStMNW5kem5ETHBEcTBDMWpKQkdYV0dQYVJEZGxGVi9xNTdTeXpWU1Ra?=
 =?utf-8?B?VzByb3FyVUlnbytnUlhRY2VDUTRQUEtnd2UvemZnNU9QMi9MQzIxOHNDeTk5?=
 =?utf-8?B?WFgxb3hqM0crUUFRaDlscWx1MlZINVovTmZSRTIxY2hNanJUKzRML0tEK01H?=
 =?utf-8?B?K3dtOTNUVFZ5Sk1VQ28vSkNQczB4UHZZOWZKNHNKdlVqdkY2WnV5Qkh2K1lz?=
 =?utf-8?B?RUlBQTY2aDkvUjFUK1dST2tWZlRpVXRDeDJicG05VVlwWWFTL2tQci9paWVt?=
 =?utf-8?B?R1pvSkxYSWVFQ3VXZFJaREgwYVlMZyszb0V0cWNMVDJ1TlhNSk5MNVRWaUtZ?=
 =?utf-8?B?NE9WUTc1WWJJMW9obUNzeGdPdHFHVWJGQSsrOVcwRElIRjhqRzBXK08yVW1n?=
 =?utf-8?B?MkQycWFJRUQvRlVRV3Y1aHdHWjJvYnQyclN4OUlINXpPL3RZWk42Zy8rWmJp?=
 =?utf-8?B?VTQ0WGVRMExHeFVBdEw1eDBkbktRY0c0a2hNM0dsbEZ1M0YvSUNaQ2dCM29U?=
 =?utf-8?B?SUViOFFnWmI1eTIzbXAxOHBuSWlzbnZrdDNvamVmektKaTJxbjZIM1BOYjZJ?=
 =?utf-8?B?cUIra1hZZkl2MEtlTVJubXNxQUxPUDdKZlBIOUptOGVtUzIyaEU4YkNvMXJt?=
 =?utf-8?B?MmdKTGVpenQvRkRYaXVxUFdzMmhpYlJHS1R4MkxpMlh3RDBuL2gvUW96UEpT?=
 =?utf-8?B?ejd0NEI0cXZ2dlpMTzlyQ1VpYXVEUENyYkovbFJ2U2xqOXFzK2tYbnVIekpV?=
 =?utf-8?B?Ky9XUVBmVTN0L20wRWxlS2VadTJnSDN1Y2NrdDBlVzdXMTlneE5hK3ZrbWJN?=
 =?utf-8?B?cElXNm9xYTBOTWVEb1NrcDl2bTlUdjZMR3graGtKVk1nWUd2SW1wOEo3WUtM?=
 =?utf-8?B?SThTYnB3OG5waU04SU9CTVVwL29iSldaUW9NVVFzcTY1TDAxL0syUXRnN2Jr?=
 =?utf-8?B?aWI1SGRmZVd3YXlqVHlHUExFTlVpK1F0WThGUzd1UmVkaGJYQkpsUWVWM2VN?=
 =?utf-8?B?azd1VjJTVE5nZVgyclZMUnRkRXd4Q3NORURLNldPSnAzczROOHlXbDQwSVUw?=
 =?utf-8?B?K3dSMXVialdVWlI0MUxTQWhDYXpyMVZ3enl2TU1zOHZoNTZYRkFZMmZ2QXNP?=
 =?utf-8?B?WTZ6WkJpOVdlendvWStHdDlpb0R2eDRUdy9CZmpLam85L0xVVUZTL1VsV1Zq?=
 =?utf-8?B?Q01mOCtoU3FRanNmQXVFUFdoVUlJenFheXJ2dStjR2Y5YnlReW4zVExmVENv?=
 =?utf-8?B?Smt1aVNsS3RRaFltTDJCM1ZzS2VXSjdTdDNsL2tONi9PZ05YK2YrUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f2ebec-c7a0-4f87-a456-08de8e51801d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:43:03.0166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiyxD9ZdUTzys0PicAPiarSQBV8vzmtMjHBlJ85rJkrZrULA5BmpM5pLHz0qipvIzCmQ94rZ0rZ7JJ8D2WiQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B



On 3/26/2026 15:50, Ilpo Järvinen wrote:
> On Wed, 25 Mar 2026, Mario Limonciello wrote:
>> On 3/25/26 08:54, Ilpo Järvinen wrote:
>>> + Selftest people.
>>>
>>> On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
>>>
>>>> This tool leverages amd-pmf ioctls exposed via the util layer, allowing
>>>> validation of its newly integrated util layer and /dev/amdpmf_interface.
>>>> It includes a user-space test application, test_pmf, designed to interact
>>>> with the PMF driver and retrieve relevant metrics for the testing and
>>>> analysis.
>>>>
>>>> It provides definitions for test metrics, feature IDs, and device states,
>>>> and includes tests for various AMD PMF metrics such as power source, skin
>>>> temperature, battery state, and custom BIOS inputs/outputs. It also
>>>> enables the testing of PMF metrics data and feature support reporting.
>>>>
>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>   tools/testing/selftests/Makefile              |   1 +
>>>>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>>>>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 243 ++++++++++++++++++
>>>>   3 files changed, 252 insertions(+)
>>>>   create mode 100644
>>>> tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>>>>   create mode 100644
>>>> tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
>>>
>>> Please Cc also selftest people in the next version submission! Maube you
>>> should also check why your patch sending process did not capture those
>>> receipient for you.
>>>
>>> To me it looks this "tool" doesn't really perform a selftest the way I've
>>> understood "selftests" work. That is, it doesn't have notion of Pass/Fail
>>> at all AFAICT. I'm not sure if there are other selftests like this but
>>> hopefully the selftest people know.
>>
>> For a similar "tool" I have it outside of selftests:
>>
>> linux/tools/crypto/ccp
>>
>> Ilpo,
>>
>> Maybe we want a directory structure like this?
>>
>> tools/platform/x86/amd
> 
> At least to me it looks better than placing a non-selftest tool under 
> selftests/.
> 

Even I think this is a good choice. Thanks! I will make this change in
the next version.


Thanks,
Shyam
