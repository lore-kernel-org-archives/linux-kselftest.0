Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BDE357CEC;
	Thu,  6 Aug 2026 02:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785981865; cv=fail; b=mkWD/uB9lAr/OQM8sEL23cZlyRpGM+FNJQeyG5J6J43Jeqd0imqlAAjiVx58hQOCikD5/18++wVHRrQlZf5oro4KxyfBRwN6cYQ00mhqacBE1EplleJ+40wZB15+iutEWl8AUVdXTOBFyaVcXQsNSOjmA+b289Qj2r9GOXSVR5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785981865; c=relaxed/simple;
	bh=al/Qa1qp0o7CJntWxz4LuxrjV8CMfChLCYfBI4Iw6Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kr63Xpjc1901MxtEolsGY0EdLPd4oZghMYzMi9JwOAH94uij/0drNR2/1TCw7ZLT2R7Xp3hn9MqVA2nynenZKJXXskXLSJTfD2CC81PZQhRxTFeB/w3fusxI9ZZK4ZjhDA8v4BTdks66GxVqQOXqU+uUjbuFk1O1WMo5wZVvjLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cmQEuzDB; arc=fail smtp.client-ip=52.101.46.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cmQEuzDB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUuenWQahm944xkALSh28n+w+DBlL6AEfPCr+UkJQ4A98pBC9SRnXt31S+KooE2QqOE0imPNuVeotB7fb+OWs370nr11lxaNtuaSthsR6A5VlEiCjRjdKKgjopHaGu1TosdSQ/0A0YZTmKQuFh342CrcEEqw7uZmvfE4ucIUYUi/3+T0va1hVK5wXK6K/vTdg3QMYoB/4G4X0BwdzTPElIl+w6A/RqHquij0CKnW972mF8OFQh9Q2U9AbEEHe4n7B3dBog9vhEI6MFyhdzjsrXccWJ5LwgZk4hIQ2w+QPf+J/wi9wO7WlfUXNXoTIFcQEQOyXZXLNEXlLwlb4TsL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHQ765wXK6OEkQbe+f3Z4nRhH1J0GYkighgQKpYro2g=;
 b=PaOE8D+uuwW4koi2EcDL9cRQPlXB7k32adQt41CfjCAKJno3iB121gxqxmwczoxC4wTiGL8ef9DpV00EovYruBeX5TK3nowU04qCzQWQiEO8WYTcIUP214y+h+6TL13cjIOXCxvOzGCB/+1hPEGpzASPjKw8lHdpbyWsBfKbBeF83SbhU59kpHJV5qzLVJkmSoSl85LtY1tnD6QLbDGkVVkX7OSJ4UuC53HzyV0qNORHX6rmFxcYm38n5geII60xw96WNDKqSB5SmJWj0CuXucv1tK0IdsUYUGkzkn39xsxKXsPJ2WgWjsKi1AysUKk4S9uIyDR7x+kfi2VdUnUpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHQ765wXK6OEkQbe+f3Z4nRhH1J0GYkighgQKpYro2g=;
 b=cmQEuzDBJH7F7FtWDY+83x7YxN1em6xyhnNQaSwk8ZwmVI3WxCif4vXD923I3kLiy5xCyO7IkdyKI3hDCBhpxCnIepIVTaertn88dqW0RaIUHL0HFPvY9BDYosoC+UKF+tUku0HpDaSAuaj5np6Uk8GaKzPIk1OHB7Wap9+3aRKDbhB8t2XzxwAFXfJ4r+7NZcR4j5U8Cg0bfvpu5aaNzSpwwcNAydEXsRt0ZR36XfoyyvZd6LcGPXsJ6rnnAcbhoLd9bHPc7akeU5D93Gw6ziWm/IHHp0zRjcRZypSYz6itaN6UNWKdtKkEUMJAN3felGpdnwrfuOCXYUkAImstUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB7595.namprd12.prod.outlook.com (2603:10b6:610:14c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 02:04:18 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 02:04:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] selftests: mm: add mTHP collapse test cases
Date: Wed, 05 Aug 2026 22:04:16 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <C9F48004-554F-4264-ACD7-E514360D73AE@nvidia.com>
In-Reply-To: <e17f9ee5-6606-46a4-a756-9d7a5462cd45@linux.alibaba.com>
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <dd8013c1ddada90913876e3bd912c07e613fba8d.1785564857.git.baolin.wang@linux.alibaba.com>
 <DKH5VECNN2LF.M3RGFY0NORWI@nvidia.com>
 <8551bb7d-945c-4be8-b7dc-01ff15fdbc76@linux.alibaba.com>
 <E5080E9F-980C-4445-9C19-9C792270A751@nvidia.com>
 <e17f9ee5-6606-46a4-a756-9d7a5462cd45@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: BL0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:91::28) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d04619-ef12-4842-867f-08def35f05f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|22082099003|18002099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	o9p1s0BsnSwvnQC56GXM3IiPm5m4QN4qYBEma37s7Vg+pTpB/Me2A0Q4efO6RyuTX5621UUFtGCfMxgfwAlqPzSDAebnjOXIpX12VvNbaE3QlNUfEh2IwiI0PzDfQMlsOv0SrkxmxTstL3gINtD5f00BMmQEWV08q+eGYyywccNclmHx1d4pJZ4enKymztaMuN1z1Tz16aPsjIr/rs2DfK95BslrjwEpi+ftkfNz0lyXtPaNP1Y7XuekcBUcErU+enm34+opUip4IQs1KAsG05nWvtjoJIfnDHF9G1S2RFJTySpP6d9Yup3nccU6U+WKNR6465FnWPM+qlDtIMUM3KX/NwzMicdgxYnOtZ3GtarOqK1mN1ZJiZOm5i9MkZsdJz7vw9UEWyVbb1P0Fr7eUZFBPsOPA27gaL9RPds8VBj4W6bUwMQWiJvSVG423dj0OzRpY/Ocsps9tz6EZIxjhl9m1niKTy5Y4j0vuhxNLk4EfguUmYwHJo3lFwuYIG4IvvlFwH+bILHahE2yaXwGdos2Ff4QYGvXttTcRyo+o3ws4deblf16Gbuj8qCAWhY3E9lKh7/2VBJAuC58OH5/e+Fcz/JKAkNZ21w4gUB2FgtlwrGq7Z+1QSLSI8uJQol5JbSKtoqugkHZ3DDQ95VmzpTY5/ZidES9YLOzN8/6tM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVBqT1dLUTI4dUNQNUJYQnhyY2luTmtZYUN4Z3FIUGRINFlCV1pnbFhWV281?=
 =?utf-8?B?YXhzVmRiM1k4dENNbjF6V1N3OXM5aktIaCs2YjBXQzU3eVdnblZHRko1ZDU0?=
 =?utf-8?B?TyttNWJUTTZ2R3hQSXJHcFBURXNGRjN0MGtSSmFQRm5zZjdsRG50Q25NM0x2?=
 =?utf-8?B?T3pNd2crUGs2aWxqRUZxams0akc2RmIzREcxdk5pZjV5d2Q0QWU3MHR2SDhD?=
 =?utf-8?B?QjJETHo1ekhHYnpsWGpMeEhhYy9veVlmVk9PNTFJbjZ0bzM3djJIZEY3RU9W?=
 =?utf-8?B?TTFsdEZCa1NVb2NNV2FwcjBGSjdCL1pGdmxEcmNKVFRqWjJBek0yS2o4Zml1?=
 =?utf-8?B?d2ZoV01Gdk9Ta3JxV2QyQURrQnlrc2s3cmRrVklxVjQ3NnBuZmdReDBhcnYy?=
 =?utf-8?B?RUIzOS9HaUFDRU41dDBPbDQ1OVcvTmNmSURMZXlweGdoZCt2eEVaRmhod3Ru?=
 =?utf-8?B?d1dFZG9SYTdaNml2Q3hQRXpjTCt0SXplbjhJa3JZSHFUbjRKN3JiS01QK2RU?=
 =?utf-8?B?dG5QU1pMcjdQUnppZTZWb29obURhdndzUHhQSFNybmRrREIreVB1SSt4TU5i?=
 =?utf-8?B?MytRaG1OdGV3UlppR2pKN0R1ZmhSY3cyNU92NmhCYWEvdWRsSEFKTlB4bWU0?=
 =?utf-8?B?NEd2UVJIczZFbS93OVRuM3VSdGZRYmN4amJSakdyVlUrbmtWODd3M2pXa25U?=
 =?utf-8?B?U3N0RkJLUVh0TkZveVJ1cWtzR08za1pZVlZqVXpQd0NVM3JneG5SUVBSNjdk?=
 =?utf-8?B?eVdZVE41aHJaUW9zdUFUeFJHNnpWTjJ2UmNPeGNqaE9XblZjWmtic1RvNVlM?=
 =?utf-8?B?OWQ5OHpIaDc0MW9QTmJCUG9Ec2NQTGgraUEwY05WRUJLQ01Sa3Yva0ZmN3JD?=
 =?utf-8?B?amRTdEJyTm9JQzljZFI0VlRlQVo3WWpjVzBHaEhWTW1QcnVFbXZVQkg2M3V6?=
 =?utf-8?B?Y2E2c0JBc2pndmtYN01tQWgrVkVwUTRCSUZQQUV5bTdCYnVCdmdlVCtkSnJl?=
 =?utf-8?B?djltUGQrYUZTd0RoVTN4eG1QR0dKUng5VGVGaTdxeS9vNldTaUhjSGxEZ1VL?=
 =?utf-8?B?VjlhQTEvRm1DOGM3SWIzbWxaTEhzeHduT2JOa3lWQmREMGJkQVRPOC9aOU45?=
 =?utf-8?B?dlJLamdpQndYbFFYbDJkQnh2dmJuUzZRbnl4N0xhWHhJbDEzc2NqVTh0TWt1?=
 =?utf-8?B?WWN2OGpCcGFIR2J3RmNJSWhhMUFWc0ozZHJTT0VscjRlUjVLaWVVS2tIUDZP?=
 =?utf-8?B?OW4ydGIwZXBDMHIvMDVMS2pyb1VxQlU5TUZhc21nVTZlYkVjd3VRS2ptZm5h?=
 =?utf-8?B?NDVLbEU1SWJJdVdqbmsxN3owRUpFd0VEUlNkeDFsQWtIUU94QStXMC9xYmFz?=
 =?utf-8?B?di9XR2RkTUs1VWsvcHBLNDVCeE9MNkI1eHVRcGd4NGVSdk1tdzkzSEtOakEv?=
 =?utf-8?B?cWVVWkVJR0tOK0c4Z0dvQkxTL1NvRG9oei9YVWJqK0ZWQjl2LzZpUUs2elFK?=
 =?utf-8?B?RkVxR2xPSjBCTkhNdUU5NTNaSFduZUJzcG13cUtVYnNza0VMRXNaVEhZVFFp?=
 =?utf-8?B?RkIyY2VPNnZYUzNQeUE3RzhxMVYvSnVPb2hMTGJCSVoxeUJrSVhMODJ1R2Vx?=
 =?utf-8?B?UTBPWmdrNnlpZkJlVFEwR0tkS1NTQW5ranN3WWdKclV6bzB4Ti9rcndwVFlr?=
 =?utf-8?B?SklYOFhBalNaZ21aQjAxSmZRYlNmeGJvSy90S3I2enV6OFZiRUpoSXhwOGpT?=
 =?utf-8?B?dVlaZjNIS0l0c05WVlBKRSt6bTFqcTVSMThtVUk3NzJtQTdqV09jOEZiNTJm?=
 =?utf-8?B?VEdkUG9CcDN5UmVKdFNobnFQcVF4aXRHSnhoOUU5Z0c0N0RObmRoL25IMmhC?=
 =?utf-8?B?UHBxOGlBdGg2QTBnVSszVWRJVmdJb0FQbnh2c3AvQmVXTFphT29xTWhkNk1C?=
 =?utf-8?B?SHB3U25ETVdRaVRSZjcwM2hJMGJJRlJwWXlPTklQb3lUUVFvYWRJVVh2VXMw?=
 =?utf-8?B?ZlZIb083OGpCWmEwUEpDM09sZzFwWlhSc2VRUURDRENhUnBxQnJUTmJnV3d2?=
 =?utf-8?B?VHJmN3A5aU5yUmJYWm9nOWJ4dUlhUnRwM1R6QnlTdW0vR01WZkgwUmtBNUxp?=
 =?utf-8?B?c3UwTldCeVIvY0I3emlJbHRBd0hscjZvVG5nRnpCMVd6UWk1UllKM3VPaHJ5?=
 =?utf-8?B?N1d0Kyt3VG9Oc0FrR0hrc3pLSXc5NDVpbGZZb2gvSXFWUHBuMW1OZW4xZWo5?=
 =?utf-8?B?clJodllhOHVoOElmUVdSZURSTWl1NXd3bHhJZWpNOFRkOUtoRjlCRjhHdlZD?=
 =?utf-8?B?b2NZdUw0SmJMTkhXTWRVODM1N3VkWndxN3pNN2o0aFo1Y2FmNE1zQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d04619-ef12-4842-867f-08def35f05f8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:04:18.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiH6zXd9DlK1xrnaJGHiEocDsY1W4h7S11CRKEzXQgjn31D760iWcQBAYWEro/Sv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7595

On 5 Aug 2026, at 21:30, Baolin Wang wrote:

> On 8/6/26 9:25 AM, Zi Yan wrote:
>> On 5 Aug 2026, at 21:17, Baolin Wang wrote:
>>
>>> On 8/6/26 12:46 AM, Zi Yan wrote:
>>>> On Sat Aug 1, 2026 at 2:26 AM EDT, Baolin Wang wrote:
>>>>> Added a new command 'mthp_khugepaged' for mTHP collapse, along with t=
he '-c'
>>>>> parameter to specify the collapse order. Additionally, added mTHP col=
lapse
>>>>> test cases for 'collapse_full', 'collapse_empty', and 'collapse_singl=
e_mthp'
>>>>> for anonymous folios. All khugepaged test cases passed.
>>>>>
>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>> ---
>>>>>    tools/testing/selftests/mm/khugepaged.c   | 130 ++++++++++++++++++=
----
>>>>>    tools/testing/selftests/mm/run_vmtests.sh |   2 +
>>>>>    2 files changed, 113 insertions(+), 19 deletions(-)
>>>>>
>>>>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/=
selftests/mm/khugepaged.c
>>>>> index f69be6be0ecd..64d6da6aa90d 100644
>>>>> --- a/tools/testing/selftests/mm/khugepaged.c
>>>>> +++ b/tools/testing/selftests/mm/khugepaged.c
>>>>> @@ -26,9 +26,11 @@
>>>>>     #define BASE_ADDR ((void *)(1UL << 30))
>>>>>    static unsigned long hpage_pmd_size;
>>>>> +static int hpage_pmd_order;
>>>>>    static unsigned long page_size;
>>>>>    static int hpage_pmd_nr;
>>>>>    static int anon_order;
>>>>> +static int collapse_order;
>>>>
>>>> <snip>
>>>>
>>>>>   diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/test=
ing/selftests/mm/run_vmtests.sh
>>>>> index 687d115e3bd8..d09f9f6a384e 100755
>>>>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>>>>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>>>>> @@ -410,6 +410,8 @@ CATEGORY=3D"thp" run_test ./khugepaged all:shmem
>>>>>     CATEGORY=3D"thp" run_test ./khugepaged -s 4 all:shmem
>>>>>   +CATEGORY=3D"thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
>>>>
>>>> Why only testing collapse_order =3D=3D 4? It is more useful to test al=
l
>>>> possible mTHP orders. -c can accept common separated order and a range=
.
>>>
>>> This also follows the previous '-s' parameter configuration, which is u=
sed to specify the mTHP order allocation.
>>>
>>> I think specifying a single order size already tests the overall mTHP c=
ollapse
>>
>> Got it. If a single order covers the flow, I am fine with it.
>>
>>> flow, so I'm not sure whether testing all orders is worthwhile. Maybe I=
 can add a few more orders?
>>> ./khugepaged -c 2 mthp_khugepaged:anon
>>> ./khugepaged -c 4 mthp_khugepaged:anon
>>> ./khugepaged -c 8 mthp_khugepaged:anon
>>>
>>>> Why only testing mthp_khugepaged:anon? IIRC, file and shmem are not
>>>> supported, so khugepaged should reject them, right?
>>>
>>> Currently, I have not added test cases for shmem mTHP collapse, so addi=
ng file or shmem would be no-ops and might mislead others. I will add the s=
hmem/file mTHP collapse feature and test cases in a following patchset.
>>
>> Right. I mean when one specifies ./khugepaged mthp_khugepaged:file/shmem=
, the
>> program should show some error like =E2=80=9Cfile/shmem not supported=E2=
=80=9D.
>
> Yes, that works too. I still prefer to add the corresponding test cases a=
fter I add shmem mTHP collapse support:)

Sure. Or update usage() to print =E2=80=9Cmthp_khugepaged only supports ano=
n=E2=80=9D. You
can remove that after you add other support types.

>
> But if you have a strong opinion on this, I can also add a "not supported=
" message first.


Best Regards,
Yan, Zi
