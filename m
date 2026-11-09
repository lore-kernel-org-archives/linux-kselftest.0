Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238403;
	b=5AUTEnQG0/1W1WH6lUWPK8mVWSouD9z3QaOQ1zpfCz8wsIbUXitJLM5jhmYb2O/+Skpa
	 25Zfq7xbnrTUeHARSbI/9ZtjN3pUt1KDxrAQvkTeB2cjO3x3/u2PTxCtesWnBegcpXDbE
	 0oS+rAzPQ0hF3urvUfRaUQt0fRrhHTohNQq18J+Ps+wMjR1eJOXlfNscxkKJ/jOP8HCs5
	 Hae9kBNuSyUH2L3Wmgd9VVpPIU2pOzU4uItu/+2sAqJ8uIwfLUVrgfoogu99vFIomh9oT
	 mX0V9/iSP6eMGmJb9S4vfFblWPO35fBPGqiNwWaKsMuiRdFoDezFdo9Fue0ga/6YJXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238403;
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
	bh=7+sGbb7wLmzpPKj3UrfbvuHnaatzahMOgWaW76iNjwk=;
	b=31n4gAvvexIxqDAHT+A8mjYxelwhLc31lgTPF34trqWrxzP0v2nmMh9l+lmzdC4Jp+lv
	 h2msod89kdZMI0VIhCNQkJrOjh3xtuO/ReBo19DIw44ll1ClI+dBhii0yw8OHDi7Jhecs
	 B6LVGItOU54ymp48ernmyH043Dn1zIUciJTWWFTN10Gx5251l3SPZj8zGqIWFEogwqzCN
	 iDD8CCW4BKc3PMNcd24eDAwPGhXBJMx0r5KAe5+zF3hkAziLwXwjcMJboLnxx6LedJmVr
	 9tJfILZrMALnxd7NjURIsxgjY/Lj0Qs+qvt8WNSuoyQqtdthm3MPvRAZo0KNs8c/idA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZtSbGHh0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.11
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC24606A321;
	Mon,  9 Nov 2026 15:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC24606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZtSbGHh0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YV98Skh2Je/u34GdKJSOqYf+eVVXIMGMm59MI4WpRsLCdmzt8tFp9SmqBjMJK3tD5rKGs9mT9hU3BnWu3Hmwyh+cMHOc+g5vK9HgQ5xtZHv+x1aPX9pySktb6eCoR25ksapY7mM+0n2jpnfMiBRkCcDuKJHwnK8uPQ8LiWrnX/W1jhlWvY8c3RT9hBaAJ6GzzNoa3uPeiQnaVfxbquJZp1JmU31U5cdNXxSWTaZjYec3Cemdg1lWFa9jhOnnboVUhaIIP4xa/ClPvKPqy587CwggPxhqakkkETBuHAKqaWytMC0IvUgO9w0eHYjAIGZ1tzBRr0mPujEN31Ok4N6OAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+sGbb7wLmzpPKj3UrfbvuHnaatzahMOgWaW76iNjwk=;
 b=VzTnyC41oRaaNHRJNnsRi+8QJuW8qyKkgfcPerwMozWt10kAx6MLC53jdn3gEyd22cubNHQptvhw1DQg9yE1dQ9RoFZaaY144P0EJzAkePdqVk4mHRln7rff+IP9adPd+e6/fsNLDPIgmBdSyLYKVJ7e6FOH3tMLRGVoYdc0Ql0smfiZoh/GbIbLW6QmPvJT1VuVU5RiRjCQS651FHhkNdtqQ7n82xYicQ+ZcOIRL7hNp5keYXylYVKNhZQSBKmXy8Dvut1k6A8QsQ7QuQltSYQLgOsL/fyEmfVP3Dmp7sfwPuXQBEAjut8GGwTkJl6z77VHKIgJKwQHY6ZbcGWZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+sGbb7wLmzpPKj3UrfbvuHnaatzahMOgWaW76iNjwk=;
 b=ZtSbGHh0VKFplvh3RRnfdSd2hagVUV/OxPvYUNGG0Qq2NvCO83ZukgySyZcAse0BfXEiUjKM922yTB6j0mpaQ1yxCtKyPsRmzQxYFmqhy4ElK4zICt1vM1Ycyyi9wF9Fa0pTRRA0SXRXs38Yl1ZgWqX5r5LGzLxzNWwfKcD53qw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 15:33:14 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 15:33:13 +0000
Message-ID: <94e2852c-e002-44cc-b3e1-ccde8e92ccf3@amd.com>
Date: Mon, 9 Nov 2026 09:33:11 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] selftests/resctrl: Use bandwidth values for AMD
 MBA schemata
To: Reinette Chatre <reinette.chatre@intel.com>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, tony.luck@intel.com,
 fenghua.yu@intel.com, shuah@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, peternewman@google.com,
 eranian@google.com, tan.shaopeng@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, x86@kernel.org
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-5-swapnil.sapkal@amd.com>
 <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
 <e30b8e81-938c-4426-8b4a-2a3a8d5163ad@amd.com>
 <4f656f59-9f2c-4774-9d9b-3a4d7b7b509d@intel.com>
 <39598840-29b1-4524-806f-9ef9dc2a3944@amd.com>
 <857d915f-9439-408b-9109-82143bd96ace@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <857d915f-9439-408b-9109-82143bd96ace@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0010.namprd14.prod.outlook.com
 (2603:10b6:610:60::20) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: b203a16c-ef43-4cae-7669-08df3e76c493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4c60ks5EErL/TOEI7LRA4g8KFmHaUuymRwDJs8pBkfWV7/23unYEKzGegEIkOvJg7yRa+gzssaeITwSBwXCngjJqYbLEkEPlR284/Lxn1rhUORJauIBydAM8P2nMaDnL8/dKXYDtnBHN/YzCQDUSRFRbu0rNEiTW0h6+INcnpi3ko1Yap2TLXzgo8SbTRSqeW0aTSc41WDOufXnxqfs2ARW3NgbIRz9TYR5XdsIdEPR2PbP3A89HXZgjp/k5m8PEarqhARdTNQeNov0XS0m5j1MQoAKALdXJy7bojZyFJrub1wvEQJqIL3epOElG6/HLbLJXJEx+shUZ+n7UtekRB/eG/l4V5qTQqPu9XklOt7AXRITZYWRb7jpGBWqDWlm4POH8mREw9ExImvSDU+82+e+UNI77J8BsNJaHvI0EgtJS56rn6ZwvSXajEJTzberxZZZeLOQ2t7mxLrhZlh128947fmbj9oh60ajhMbWnhkFQTApjiFJqZdyKkOo8CFHk7EO+Tzun4S5i5XMDSDjiWvZH4RYMQpDLlRhqV2tLerHYAxlNNWzoB9II5Cl2RZxRGLiEc1ekwjxX+ysOPy7ErvldRFkvC+KzgEF1Rirodub59aS9IiwFBN8hReHuGQOgIGJRDolgp0pdrpI7n47zWsuSXZPtVEIZzjeHmB78vBs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emZ1VjZoOVptNGlERkxFZjRDdXRJeklnL1E0NmxrazltNjh1d0FyQ1piZlJW?=
 =?utf-8?B?Q2RzUmo1eGl1ZE8vTU5KK3BIcVowMjBnK2VRWUlCVG14ak9lS1EyLzRvUE1j?=
 =?utf-8?B?MWVzaHJvWG9hZFkrcFMzeVZjNExtekpwSGRzeXNSR0tBV3NJS1BCbEFjYnAz?=
 =?utf-8?B?d3ZCSHNVcFBjeXhrSHo2T1NLenJmUW9XTDExdHVvSlVCOWc1ZVBCb3E2YVMy?=
 =?utf-8?B?RGsxblVnMGt1bHozYVNVQjBmazdVcEEzUXVVZmxKQ080bGltZ3BjNGhJQjgy?=
 =?utf-8?B?dnZpUW95MW1pTXVUMGF4L2VMYi9QakFIQXh4T2xKb2VQc0d3QXl0aGVaaWRI?=
 =?utf-8?B?YTdtZmxzUWw1NmJ6QlR3VUJvTUY2eVYzUjRUVnpzNUp5OGNHakxBa2xMWkd1?=
 =?utf-8?B?WWUxQks4MHpWZFBocEJuZjZ1aXlLRGpHNWxCaFRHRXBVSjhndDZCS2FhcTBZ?=
 =?utf-8?B?V2FxY0t6bC8zNG9KQUNiRFJ2NzFmczFuTUFZV3NEclNQejdtOEp1cU9WWmdR?=
 =?utf-8?B?aGJrVUVMdGpJbU9pMy9oY0o3NkhyNlFrZXRSNlpXMC9ET2NnOVhEVGhlOWhG?=
 =?utf-8?B?NklkZUpLU0FtZ3pGQ0JGWjdkbTRNeUNuR1d6ZmVTT1JLNzN0bFhDNEc1QWFY?=
 =?utf-8?B?VThySGpkZnQxOFdidU1XRkFPV1F6cThNMkh3bGo1VVVDOGR6eE42ZzFMSGNE?=
 =?utf-8?B?TVBpaklRK2lSR1VHNDF3SW9IM3hNUWM3Qkx1OFJaWWcwRlBZMkpEdHZJKzdP?=
 =?utf-8?B?M2s5NmRGLzhqMmVIWDgycnp4UGZDSWoyT3BCNzZYaWV5TzB6NjNQTzRVMFFE?=
 =?utf-8?B?MlV2YUo2SDliVytHU3VCbnJBQWZxTThJQnZ4VG1UaUxNd05sRUdWWm5nbUl4?=
 =?utf-8?B?TWlMSFZXWmlZenRLZEJiU0dkMW1IZzREaTU3bEJjMk5IeEtIc0oreXYyR1RD?=
 =?utf-8?B?WTZ6UGRZVldsZlFJWFJLOEdSRS8vVHRHZE9IWC94WEU0S1BvOGRKeGhESklN?=
 =?utf-8?B?Z0kvRGQzb29XbjQ2VktIQ0dua0x2SDRHWWNTTVJKbWtjS0R3eURuVytFWWtC?=
 =?utf-8?B?aHRoaFJ3YjgzVHNFQ1R1cGg1TFRSZFV6cnJxbml6MmkwSW1LWmdGRS9vbnFQ?=
 =?utf-8?B?VmFXMmRaOUZuZmp4NVFmL0NpWHZOb0JKdW5SMnI0VkxZWFJqNWNBZ1l4M1dE?=
 =?utf-8?B?TStZektBb1J5S3B1RlRiRVFjbVpUcXk3TytrQXY4QnlJVXJzN3ZHSVJYb1Nx?=
 =?utf-8?B?bzRLWm5Db0hVZHZiS3hQU09vazRkZFlzS0MrVGpnU0VQWmZobDVWODd4a2xj?=
 =?utf-8?B?YmxBekI2N3FZYW43d05Ga1RTRzl6NmV0dzB4Q2tDQTdUZXVXYUtyQXh6MWM2?=
 =?utf-8?B?cGQ4QVpSanVaRzN6QkNLQlgwbWJyRnVtSS9vVzBNU3hMTllhMjNZTWVJWVhN?=
 =?utf-8?B?MGJxVnU4ZFEwY2tpRC9xRU9LdE53ZGZlb0Z4cUx0THBneVhrc3lwbThIS1g1?=
 =?utf-8?B?NEZ5eUI5c2U3SG5hOXhXdXFiQ1k2eFI1NUpraTdUaGM1NnhqL0xESlEwd2xz?=
 =?utf-8?B?ZGlPZE8yalMyVGtZRUZhTEI0WEYrR3hjbHVka2g1d3orTzFZZ1hnSFRqQUFX?=
 =?utf-8?B?OUt0SGRPeDB3Z3ltdkQyVzhHUHcrbWxiNVdJRUNsY0JPMzdCQVpaWnhkNDlh?=
 =?utf-8?B?c2gwMVpOTEFVclFWSTExL2dQNTl2MWFUVzErQzA5KzQ2SFFDbFRUbSt0Wkp6?=
 =?utf-8?B?VjZEdCthRGlsSnNxSldBQmNPNWZzKzFJVVZKcGV0ZlpyeEhYMk1Ta0htNEVy?=
 =?utf-8?B?VEhzRnIvN0JQV3l3b0docmlKd1BqUVdoRDhwV00vR0k2YnJrWWtXS0xISGhT?=
 =?utf-8?B?SkNIMW9jL29kMzhWS3JuT0xSNk8xSWRJZG1pZ0JxSWh1M050ZFVjMDJPVEc3?=
 =?utf-8?B?RUlWdDQ3WEpKTkM5Z3RLa1BjamFLaXhESklTU1JoQTMzSWJVYWtTNEwwb2ZM?=
 =?utf-8?B?USswRHByK0FYbGxERTAvamt0T3FPL2ZVSEZtbXZ3VURDZ1A3ZlhXUDRaSWJG?=
 =?utf-8?B?RXlWSm5idUhlYmFWdlg4T2FSMnUrck5pSkJIU3ZoVlRDVkNtQ3c5QnhnUUFz?=
 =?utf-8?B?YUV5Vnh1VUFSaG5VNlNHaER0WUJ4WUs2b3dQYTdxL3hrL2trUXFwakhRbkhS?=
 =?utf-8?B?cUVDMW9nNUxKRkFTM0R5YVRkR0V6L25LQWM4WXlKZXNSdWFHKys3Sk56bkda?=
 =?utf-8?B?ODRocE96aFVSdzExczJTWDU0UTRUN0d3NkNHekRKb3drcjlnemozRWsxT2Nl?=
 =?utf-8?Q?Mm42K8qXS//hEx/9Pw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b203a16c-ef43-4cae-7669-08df3e76c493
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:33:13.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecK4h81kbYlxyPL8ektzkuR19YfYe+a3J1X+SouFv1dFFBKxaI/zrPF7dUsl3qX+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

Hi Reinette,

On 11/6/26 17:37, Reinette Chatre wrote:
> Hi Babu,
> 
> On 11/6/26 1:25 PM, Babu Moger wrote:
>> On 11/4/26 22:16, Reinette Chatre wrote:
>>> On 11/4/26 8:05 PM, Swapnil Sapkal wrote:
>>>> On 29-10-2026 00:15, Reinette Chatre wrote:
>>>>> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
>>>>>
>>>>>> diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
>>>>>> index 17ae73d3476c..947735e26099 100644
>>>>>> --- a/tools/testing/selftests/resctrl/mba_test.c
>>>>>> +++ b/tools/testing/selftests/resctrl/mba_test.c
>>>>>> @@ -13,10 +13,51 @@
>>>>>>     #define RESULT_FILE_NAME    "result_mba"
>>>>>>     #define NUM_OF_RUNS        5
>>>>>>     #define MAX_DIFF_PERCENT    15
>>>>>> +
>>>>>> +/* Intel MBA is specified as a percentage: 10%, 20% ... 100%. */
>>>>>
>>>>> The percentage based interface is the generic interface and not Intel specific.
>>>>> You can drop "Intel" from references to this interface.
>>>>>
>>>>
>>>> Sure, will do.
>>>>
>>>>>>     #define ALLOCATION_MAX        100
>>>>>>     #define ALLOCATION_MIN        10
>>>>>>     #define ALLOCATION_STEP        10
>>>>>>     +/*
>>>>>> + * AMD MBA is not a percentage but an absolute memory bandwidth value. The
>>>>>> + * test sweeps the bandwidth from 4 GB/s to 40 GB/s in steps of 4 GB/s,
>>>>>> + * which the hardware represents in units of 1/8 GB/s (i.e. 4 GB/s -> 32,
>>>>>> + * 8 GB/s -> 64, ... 40 GB/s -> 320).
>>>>>> + */
>>>>>> +#define AMD_ALLOCATION_MAX    320
>>>>>
>>>>> The AMD maximum is enumerated from hardware. How can it be ensured this is
>>>>> the appropriate maximum for all AMD systems?
>>>>>
>>>>
>>>> As Babu mentioned, it's difficult for a single-threaded workload to
>>>> reach the hardware-reported value. For that reason, I used these
>>>> values to verify whether throttling takes effect.
>>>
>>> Just to confirm, my question was not about needing this value to be the actual
>>> maximum of a system. Instead, I just wanted to confirm that this "320" value that
>>> is hardcoded here for all AMD systems is a _valid_ value. Since the actual maximum
>>> value is enumerated from  hardware it is not obvious to me that all systems will support
>>> this hardcoded maximum.
>>>
>>
>> The value 320 corresponds to 40 GB/s. I have tested this on several systems and was able to achieve the expected 40 GB/s bandwidth. The tests did not fail.
>>
>> There are some older systems where the test is not expected to run because AMD UMC support is not available.
>>
>> If you are concerned, since we are no longer depending on the maximum value, we can be conservative and start with the following adjusted values:
>>
>> #define AMD_ALLOCATION_MIN    32
>> #define AMD_ALLOCATION_STEP    16
>>
>> This allows the value to reach 32 + 16 × 10(num_allocs) = 192, which corresponds to approximately 24 GB/s.
>>
>> Hope this answers your question.
>>
> I seem to have trouble articulating my question. Let me try to ask a different way.

My bad.
> 
> Consider the scenario where:
> 	#define AMD_ALLOCATION_MAX    320
> 
> If the below (kernel code) snippet is run on all AMD systems on which the
> test could run:
> 	u32 eax, ebx, ecx, edx;
> 	cpuid_count(0x80000020, 1, &eax, &ebx, &ecx, &edx);
> 
> Is it possible for eax to ever contain 8 or less?
> 
No. It has never been below 11 (0xB), so this should be fine.

Thanks
Babu
