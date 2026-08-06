Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9091FBC8C;
	Thu,  6 Aug 2026 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979526; cv=fail; b=SBU20YTMeOVdcAP5jX0g3paYfujVvoxrxXFfp5vqKjbfN7SFE4AgxRkNjDJd7GCd0oYDHMiME/BzdmvvegOgTryhrhBFFrIyJYifi/NbNXA/I1qYMLdtEdVEw/su4Y3ium4ZF1zUra5ifE1n+HY2TPLdjPjrwl2DoccCG0ENk/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979526; c=relaxed/simple;
	bh=P6OvVM0iTk+oWEbButY7k4ZpOU2hTQ6yqNxcxlNNmMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AVo3bjHpoCBJ2S1XuV+YY4HXeRJB7Qx98KWCN+yhCTi+LhnZ8lfGr6/idTiOx6ugoeOk6FVWjJlMGi/YuW6JdRpS6VcFnT8h/APQi4HfdGyOUTwXnvOLXXXMrpo/zDI4UIpGQsMVOzlehmKB9OdjEisZ0ioWEz/C1FO/FK9GANg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I3Cse5cF; arc=fail smtp.client-ip=52.101.53.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I3Cse5cF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTecWVVGvpPczBGyJbMZ8xcW2ctWHukafE2Leg0rpw2QnAfi887lYl0Lo0nzXz6+Rg8a7cM9o+v5iNUFtt35aO/Rw8a79QQX9147B6GyDV81xhUsj4q6WFIF5hK2SwpuOCS1kO793ub66WAdoFnm3cvz3wUzmN38pyhiQC031vUtKmQFWOI4koNYR8NLKQbvpjNc1mN2lI9f+sru+SphnplJ0f5G+ksqSwrWZ/sbMZuvSB+DNAh0NeD+HMA6Vyp1WpXygmw0+fDqpUCyQazE8ZqSqU3BUtds6q3rWC2+IGCbK9IihyB6PXUmV3XfE0crUWxOTRXmndPUVyBbKDHZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1cc83DrKNu7qiE7IHkf9IeWF4B450rRzmcwj20u1hU=;
 b=jfabchHKq9Dkrgp5NUzd2x0FsSd9HJczapY42qV5vyMXknFy4eeFfjkFOJebUIGUjK4w15ZmMpHgs0AKfoCIXShnhJzZF+YjSEshlfcTrVUrbQhrnvO/jPd1MD1GDQdM1zeOcv41ljdSCGRY6LeNJdj/BkdAIQZ9sKGldCAEdHOPIKUanfloFIHJe3D0edvm/o5NaJrpTVIZgqi3SuwMBGJcU9PlWNcMm4sSTLphCfhw72WAvTNKzJDD2p6CK3aE7HQ7DLWhD3iwJBZ4GxSrtEGt9PgSHfoB5vCcB9myhU/ktRJsY5T9BXjC3Xtw5apLoHNJxfsExyEjFd9vK7XmdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1cc83DrKNu7qiE7IHkf9IeWF4B450rRzmcwj20u1hU=;
 b=I3Cse5cFqVML1T0oS90QlLZWZAvmhDVtfzbZB4Ibbn0VSOkxXmA6QDievsAeGLvrKYkIIdQk/Q7ZMYFT+BcfRcakgDVRo6RH/kFMhGkZ8YA/83/38hV/GxcLFv4PPSwcHNDWJtcN9+ICHo7gKCadO21oQq9yoQZH249o5OGBQbTVtL7l+uT7jl1RQwGmqn/eoh7C1Nc3HK/x7rE8Mbg448lHFwhb8kNFJIIHOO+zZrH37cexAeFcvfQoMSTbQyR1WxLPEGs/iKbtTC7nf5T7c3eZD2VoW6OmWLIyEQM9aDh5F2JSDPgyRxPqrlqX7P5AH1mDq2kzjqukoj0f0tdBIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LV2PR12MB999095.namprd12.prod.outlook.com (2603:10b6:408:353::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 01:25:19 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 01:25:19 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] selftests: mm: add mTHP collapse test cases
Date: Wed, 05 Aug 2026 21:25:17 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <E5080E9F-980C-4445-9C19-9C792270A751@nvidia.com>
In-Reply-To: <8551bb7d-945c-4be8-b7dc-01ff15fdbc76@linux.alibaba.com>
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <dd8013c1ddada90913876e3bd912c07e613fba8d.1785564857.git.baolin.wang@linux.alibaba.com>
 <DKH5VECNN2LF.M3RGFY0NORWI@nvidia.com>
 <8551bb7d-945c-4be8-b7dc-01ff15fdbc76@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR14CA0002.namprd14.prod.outlook.com
 (2603:10b6:208:23e::7) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LV2PR12MB999095:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ba224d-3b1b-4bee-5835-08def35993b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|376014|56012099006|6133799003|18002099003|22082099003|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	qZHd0HUjZ6P+aIwXcjapOb4p2E6woSM7FygS3kETqqGqhrymFxxMClPHo6dtvoeYtM0m5iKUN8NafGdoZpc3HUuIIJf01ynECRuqTYwPBseSerZxECjGdMvzmfldwtUtH3f+4fSQP6DagHFU37WD/Eckp1J5wZ5jnOyjlDqc7G3DQ6S6qj6CyPJmPgm5Of7YvL0tVYDyZ1busX+3d0K7R7zr/UMTAzsN+zs2GHc86YDj+ddG0EJEdbhLh2iqUoLzl1rACMYWMGpEkWjlvUHTjZ2shaZ/p2C5KolgSbsz3gWwyzuxyX++SvnXBWDaJift5QI+22z8Pj1ECKiCKFL9A83uBQnUWxlFqbDDD1HKm63NyajHP2u3/PDCVHlH3l0v4eRfMaRCLYKeL/IGgbHnPBrpZAcOigTi9/J6JpxM7ZR1hq479m4klFM+7TFuP3rgb9DYsUYx6H1jJmOnmwonfsAjdLSQ8/P0xLmRd/b/aD2/4PHm+QzVXCVxudFhtVuYH8w4XtzZ8v89cSUZ4YW3MJR+sK/vVTrqfrQZFanc8zBLeTCMq9G9k8u25od+Nu8e5webfv8paefBsvCYaoIyvLV+XPO4aM3BOIrvDLfgMLMQr1bGewPyOpg9OCjBfAKmwWMiBNuE88CuY6zNDNpbhuDH99TWVMt2TlxpAWNbHng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek1oMU1VV1drN0JQcDFkbVlFdWxDTlFTOEJYbURRUVV3TnVHdkdFdnVhUitQ?=
 =?utf-8?B?b1RkQSs4RnlvZkdSay9VSCtBaHEzbUZ3VXJHWjk1aG9uN2xReDJFTjNVL2tX?=
 =?utf-8?B?SVFOcjBuZlZXWDdERzVhSm03bFVzVFYwVmF4ZEg0YjEzMTAvV2U2RVdoUVR0?=
 =?utf-8?B?OHpMaUhBdjlWSWNYTGtvQ29lRzd5TU0yQzhEYkpST3JJb2xMYXZzVlFDZFNL?=
 =?utf-8?B?VHBBYVBNc05hSlJ2L3N3aDhQbGdlTjV0YUhCY3NPbEsrZXVZMTZJd0lsZUk1?=
 =?utf-8?B?UjdIUTcxMTlhMnM3UjFrckZhVGZ6Y1JmTkZFMkRzRVdFNnBQeGhPTXlnUFR5?=
 =?utf-8?B?enRtOVAzUVhsSDBJdktpZzhPeVVuMXVSMGs1RHJyUmpVWFFzd1hibTR3TzMy?=
 =?utf-8?B?bnpHYTc2Q3FJdW9YMmtHN2NHUEpmeUZoSURzVk1Ed1h0cjVWOXFSWkNrVlpK?=
 =?utf-8?B?TThQQ2xmY2c2Yy9XUlZCZ2t6RDBTeW1iR21hamoxRk5lWlV1cytOWVY2MG1J?=
 =?utf-8?B?UVl5ZE5FTFQrekZHUzNNN0FoTU1CVlEvNVkxc0NJdmlkaFRuT2JhUjBsT3c3?=
 =?utf-8?B?VzZrYUlxMTdBajUzRkkwd2w1cEVXUnp3T1Y3cG45Y01veDdqZWNRcG14MGFu?=
 =?utf-8?B?UzZvdE05MzRVQ0dOTEtWVGd2R3FTRUpXWGFSMEs5ODc0WnkvcTBIbjZ4UVdl?=
 =?utf-8?B?eGwzdzd5a3BIcTcybWE3VnRpYjJSSlY5M3hlZFllWW5uZ3VJZkh6aW9SL1dy?=
 =?utf-8?B?MUpXUi9wUW8zb253eWtOU1JWcEtZc3l3SUVTNGY5YStHTVE3UlpKL0JsUHNJ?=
 =?utf-8?B?UmpzZTNLVmdncWRwcjBERTc3NmxQbkRFSURCWndPUWsvYWFQeWVMZks2Nnhw?=
 =?utf-8?B?c0hoNUlyQytwYUkxS1dOMWtkQnR6U0FhclZqSkVDcnI1VDZENTdlSG9WTVhv?=
 =?utf-8?B?OThsR2dOMGkvN0hJRlRnanlkN0t6czhmMkJNRFAxOGc0cno5Kzg0aHhCb0NQ?=
 =?utf-8?B?NHJaTUFXU0lPbGdJcko5S3EyMjZtL1NxczRBYkROWnJMT2sxaXFreXdYOTlD?=
 =?utf-8?B?a0RNbStlT1o2ZUYyWURDQXUvRm5hSUo4U1g4OVQwanIyVG8xekxhWlVldk9i?=
 =?utf-8?B?cDZTWGRwTlhvT3AvKzhCL1ZkZld1UEJVWjBLeU03amZQd0lOQjA0eUZZQ1FO?=
 =?utf-8?B?VzJJbFZIMDkwNm5ra0hCNE1GWDdoTWNCNEQyM0JnWG1rdHVjMUdBT2NXd2tl?=
 =?utf-8?B?V3RuYzNKck9FUS80R3FHUXErMVQreXJZemk4Zm1pWjk3dkl2b3M1ZlFIUm00?=
 =?utf-8?B?Rm1FVHFrbS9oMEhQT0lHbFAwaFVtMDBLV0FoeDVEUVRBbmxhd01uellyU2px?=
 =?utf-8?B?STVIMGQ1ek9mN28za1l5eUhyV1NLSG9VYUUrQU1keVlnMjJZZ0Z4ZGwxTzJi?=
 =?utf-8?B?dFplN1M2a2JnMzl4ViswOVJzZHk1S3F4RDlLandtOFF4WWxpMDE4VkRweGd0?=
 =?utf-8?B?MXRySW1ZN29hZS9FUHlHTVNNWCtDdGhEOTlyUUN2cFk4SFdBWUxEMHBMU3Y4?=
 =?utf-8?B?dE8yUEJTcUhYcHJkVU1zTmZVK1ZrMVJBU1U3WDlzNVdqTitkS3JRZ01TaHRY?=
 =?utf-8?B?MkhMRFBJS0dBek15K21LODdBaWxvTUNva0JTNFJpZER5WGg1c3g1VUp6bUpU?=
 =?utf-8?B?YkdjV1RadlRNZkJ1RzV0QitaVUpvNnRaa3EySFlYeXdWTEtZR05QSm9nTk4y?=
 =?utf-8?B?UHFoWXpBWWVsZ2dnd3p6WjdzTFBOQ3F1L1dKRktTaUdiK0FzT3NIQzhXUVFE?=
 =?utf-8?B?ZTZMdk9SOHlHUVRhbGd2azdFQlFkQytRYzRGNlVHWGdISnNCZFAwU1JENExK?=
 =?utf-8?B?clZXbDlScjNJWTVGVVM2dE91VjlzYVhmUUxTTUlmaFhkWE1EbWhVWTJFSkdN?=
 =?utf-8?B?MXRPbm5DVW1RMmphSmNLNnUzQU9TMmJpekVrZzUyQzRoSVE4WWlCN2Nra0Ft?=
 =?utf-8?B?dVVvZ25vR1pFQ0ZqQlk1SkFOWDE0MjF3bTllbW0wclB3aW9keVBpRk8zODFr?=
 =?utf-8?B?TjQ2UlZiQjFreFd6dTBDalZpenQ5MWpwK2pvSy8vTUsvYnNnYnRxUUxxUGNo?=
 =?utf-8?B?dVdYQzVGVys3eWdWWk5heVVlSHIxMDFCR25jTFM3YmZ1MHhJNlJJTE9HZTkv?=
 =?utf-8?B?bFFiQitxUmwxSUVHM2o5K3BUcGYyNmQxUnpmZVhJVmlqV3gxSUxjaEhxcThO?=
 =?utf-8?B?T1FVUlZNdWt4aUtXWXJKSVhKWFlJMkxzMWdRRmdkSlFDVXFZZDRhVjd1bUxh?=
 =?utf-8?B?d2VCYjhmU0huMEp2YmJ1T2pOaVkyc2NNcTRtcUthMnFtUHQ4YjhyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ba224d-3b1b-4bee-5835-08def35993b0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 01:25:19.0050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBziaPTzlRqI2t0+LbMr+qCiIfWG3gKCfESFvrnbEnuHwcK71rNvaRGgASCMTLqk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999095

On 5 Aug 2026, at 21:17, Baolin Wang wrote:

> On 8/6/26 12:46 AM, Zi Yan wrote:
>> On Sat Aug 1, 2026 at 2:26 AM EDT, Baolin Wang wrote:
>>> Added a new command 'mthp_khugepaged' for mTHP collapse, along with the=
 '-c'
>>> parameter to specify the collapse order. Additionally, added mTHP colla=
pse
>>> test cases for 'collapse_full', 'collapse_empty', and 'collapse_single_=
mthp'
>>> for anonymous folios. All khugepaged test cases passed.
>>>
>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> ---
>>>   tools/testing/selftests/mm/khugepaged.c   | 130 ++++++++++++++++++---=
-
>>>   tools/testing/selftests/mm/run_vmtests.sh |   2 +
>>>   2 files changed, 113 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/se=
lftests/mm/khugepaged.c
>>> index f69be6be0ecd..64d6da6aa90d 100644
>>> --- a/tools/testing/selftests/mm/khugepaged.c
>>> +++ b/tools/testing/selftests/mm/khugepaged.c
>>> @@ -26,9 +26,11 @@
>>>    #define BASE_ADDR ((void *)(1UL << 30))
>>>   static unsigned long hpage_pmd_size;
>>> +static int hpage_pmd_order;
>>>   static unsigned long page_size;
>>>   static int hpage_pmd_nr;
>>>   static int anon_order;
>>> +static int collapse_order;
>>
>> <snip>
>>
>>>  diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing=
/selftests/mm/run_vmtests.sh
>>> index 687d115e3bd8..d09f9f6a384e 100755
>>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>>> @@ -410,6 +410,8 @@ CATEGORY=3D"thp" run_test ./khugepaged all:shmem
>>>    CATEGORY=3D"thp" run_test ./khugepaged -s 4 all:shmem
>>>  +CATEGORY=3D"thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
>>
>> Why only testing collapse_order =3D=3D 4? It is more useful to test all
>> possible mTHP orders. -c can accept common separated order and a range.
>
> This also follows the previous '-s' parameter configuration, which is use=
d to specify the mTHP order allocation.
>
> I think specifying a single order size already tests the overall mTHP col=
lapse

Got it. If a single order covers the flow, I am fine with it.

> flow, so I'm not sure whether testing all orders is worthwhile. Maybe I c=
an add a few more orders?
> ./khugepaged -c 2 mthp_khugepaged:anon
> ./khugepaged -c 4 mthp_khugepaged:anon
> ./khugepaged -c 8 mthp_khugepaged:anon
>
>> Why only testing mthp_khugepaged:anon? IIRC, file and shmem are not
>> supported, so khugepaged should reject them, right?
>
> Currently, I have not added test cases for shmem mTHP collapse, so adding=
 file or shmem would be no-ops and might mislead others. I will add the shm=
em/file mTHP collapse feature and test cases in a following patchset.

Right. I mean when one specifies ./khugepaged mthp_khugepaged:file/shmem, t=
he
program should show some error like =E2=80=9Cfile/shmem not supported=E2=80=
=9D.


Best Regards,
Yan, Zi
