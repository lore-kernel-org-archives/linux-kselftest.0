Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851750;
	b=NnujP5cMmKAm0otiR/9eB7Lu3lKPdw3BcV4MeVihuCZRcIZVOssqVxFdWIwTYRSGe8TV
	 GYD71U3B/27FRXtgDNlyf16kTCo+aHaEake/Eu+pF1z45HyubcqEK+xoB1Q9GwRdqsdB7
	 fHRj1D+u0NEnWsyvhfL/o6XUq+OhiC3uF0HfCaU/qvVCdS+++BRB3NfyBVzBF6CCuRrEF
	 ny3zRBeJU+4gIqVbrG0/snl7hKNT9+G728a2s/FtBfpY07pfm+1nbJWPlTiNacy6nX/+q
	 3UbejbTCnCSFPV67PKoiYMT/XKyuFwDdfO4tDReG/QPL0bsduQFa2PiBHO05pYvlgCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851750;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4Kt7NP28QAHCzdtXi06iAupmrqCwsGKJfkFBzn9LMh8=;
	b=E7y1/XBq5Rd43gLKhSviQRqSFCYtp/KsYfvaKeUi26p4EaailAwxyLormyOMH05C6ddr
	 ZrYQYCoYJoccQDIGcPpcCX6km61XrtoRKXxrFuPyhNMdwmAMCEy5mrIwBjZ/cWZ5a5Agp
	 NjFa0uJFfd59ppRNDF/iSTc36qTyixzuddJf/jKb8zbGq0vG72mebyqrIIZwfu9US7Gla
	 oMukTPTLqV2QpMTFfCdWoba+RJDQUuinF/nNCY6oLLTiZ1xntTJuYBAdNUAZp81ND/fTv
	 ieW2hJbukep6UtALN8r7f+40OVAfUVLCRCAbHQHa2q68bu9jAFDKzPHr/E6kc9xJpDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kQaZ3mUJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.43
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013043.outbound.protection.outlook.com [40.107.201.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA81606A326;
	Thu,  5 Nov 2026 04:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA81606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kQaZ3mUJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxiIFeCT5qZKrVzT9woOE1zQHwXRefvljqkk4oJizfZ36Quv3W7TuxGGqulYrUzkPCNYgzz5ZSLvzMzM1H0nV5FdAPdv/asbiLiXmnd38In4f3xn+sed+2oM45pXOp06kOwgqW2mJucFyKFSP2Qb6w4ZdbuTtO3meLFbE+FrHTGLEu4kH1lmEnDg65ol/fbP9UeOmlx9SgWXx10wQW1MHI+0FzdAKoB4twHfyV7ZC6M+3kALKxJzRMoQgqTp4evjzcN2PWdsUl8yLEJP6iPQDyZNVHm+7ODwXATunTqN7J9pMNPJx9ErVo+WpeI4pBq1udOOUfkc0KkxW4kmNk9l7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Kt7NP28QAHCzdtXi06iAupmrqCwsGKJfkFBzn9LMh8=;
 b=GsHsFCtzjjIQuqiQwyCVmWMC1pkpGVhugRr4eUXRpwxkuD1fJpfCpo6kKkb2muOMcVy997cKz80R1L+NflDT7xMYG9vKGx0M7bvyNDBjihMZnTkVvLtg7WKtOUDEGt+44lZY2vxJU/3b107S8Y9v3TE4KQ7x2kld4OgUfLZTnsJbD6aax4JKP7yrnwsfDduEHhMPp/T3wMvuI6E6gFnPCHfEatpU7foMCAEYijQxLZzwrFeXsN3fSnHxopp6RbdHfbtqPVYMlaQNXawPlI0q35DmiOyhXyaXO0SGVbcSWu+CwvLTdJk3STAzFYRBfTmS3eCSouT2uQbOcj7QS3pEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Kt7NP28QAHCzdtXi06iAupmrqCwsGKJfkFBzn9LMh8=;
 b=kQaZ3mUJUMSp+amFpPupz8cj/HYA8zhlr1tn0CXbaPl5HCfAzPoh0B0aUTjhDPtKdAoUA6pLOyfuuINIZKnHuK7NFIRtL4PvzcZR1iUwdgu3/vLiOGm3OtXuySdsSmIE3wGCe/B1oQu/X4i8ZPTXXh05OhvFSkONXtC8oMIIiRY=
Received: from SJ0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:33b::17)
 by SA3PR12MB043340.namprd12.prod.outlook.com (2603:10b6:806:517::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 04:09:05 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::36) by SJ0PR05CA0012.outlook.office365.com
 (2603:10b6:a03:33b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 04:09:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 04:09:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 22:09:04 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 22:09:04 -0600
Received: from [192.168.0.103] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 22:09:00 -0600
Message-ID: <14ee8c78-93f8-4881-bea6-403c43082891@amd.com>
Date: Thu, 5 Nov 2026 09:38:59 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] selftests/resctrl: Use bandwidth values for AMD
 MBA schemata
To: "Moger, Babu" <bmoger@amd.com>, Reinette Chatre
	<reinette.chatre@intel.com>, <tony.luck@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-5-swapnil.sapkal@amd.com>
 <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
 <13ea712d-116f-42bd-86b7-a1ac6cb40b7f@amd.com>
Content-Language: en-GB
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
In-Reply-To: <13ea712d-116f-42bd-86b7-a1ac6cb40b7f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|SA3PR12MB043340:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2e1d98-5b29-4eb1-cdc5-08df3af28805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|261022075727099003|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|261026121527099003|261028144727099003|261102123227099003|261022105027099003|261026140227099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	c4swDyaRfaj8IiSE+Q5RfRCN74eiqCccIekr3SWOHxz/gOuNMpJW1paoHUsXtxmJtfzPlJrW1rLsJddQzoa5GVbmR4biokvd/qfOAevLrwQxdPMUSDp5gsznv+cCNmF8PfAX1W/e7VEudgPGtEumOo2lGoMJ8ag69uA9DMoEVusoHcbmyg0zbwSmEE/e/u51T0y0Bpg2C+Tx9e2WvZICNs282wIqCmwgZo7tvo4nmd3oLv9GD83u9UD38TC6fyOrxkjQNkVvsFuIjyi96/JJFXJFGixU1SaZ+/0fSdJA6m4DnReQBzHZCJgiODVyT/ZF1BTYOWUZxMW/V/GKQQ+X53ARO7tObixmvHoVGsImmwUHzG7+6yhp5qBzPwfOV/LbWdoPs94bT36n0e3e3gQyU3CqEKz9OReevtonlNYZWaiktPYAhNuj2llHTNIv3xV4ghViT02VNebKRlz1gqLxDMStKeuwLX4gpxWX8puF2KeDeS/xuHHu534QEITO+e6+Ct6ne1L821l4FRu+FtdMRASk2EAtcVQWZo9xW9LRINea85fTP7TTyp9VyuNqSAsUplxRE+HDg2CJHLc+ybJwD1U5Sx8Zcc7/wfCbp+APFMmxGDiiqUSFN65zTPIEBbPpuQwWYcOTnbUNR6dFVBn9mEyRnGG3q/EJyY5QFgvoLg1X88vSBxzRxc/ZxwVR2TM92wsJB9IBLWC0OnGl90SCjQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(261022075727099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261026121527099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vaTf2A0r3uvMJ9nx4ZkMCwu5X+JaqLX0JP22l3sxVnV42xQgkrTbC7xiRw8bchldTCHYOMv3smFaNiMGDX9A5Js+6rqsh30oR6ULe2P+Gwm92JlnBpwwgCec9BG+pgcFJmrXvoewjItYW1QygVJeaEuv0Ogl4ady4sw0NBCcRBT8NchC3+8Qj8j6p7sssvlH04jIMW3sPWvsnvECwFadUC8x/ajUV9+SMiXxiTuhsMrT9rHIMtIssX70ao/KWBZIff32q+iD2fkh9jDGL5lhfRxverVZsmAlWwdRHf2wMJioiiucMcJopl3Y24sn2IuKGBmY89efrVzD1dlbL03oRqopXOt21Ca0Qv+EOt9VDAcNHqc1G9D5V9YbTClrHUyN29EehtWaZ9+Y1vcBw7hR9VLXO0iWGXWsq4TNh+5XEX3ZMLdTdI60nzuYrJcWtkz+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 04:09:04.7744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2e1d98-5b29-4eb1-cdc5-08df3af28805
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB043340

Hi Babu,

On 03-11-2026 06:45, Moger, Babu wrote:
> Hi Reinette,
> 
> On 10/28/2026 1:45 PM, Reinette Chatre wrote:
>> Hi Swapnil,
>>
>> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
>>
>>> diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/ 
>>> testing/selftests/resctrl/mba_test.c
>>> index 17ae73d3476c..947735e26099 100644
>>> --- a/tools/testing/selftests/resctrl/mba_test.c
>>> +++ b/tools/testing/selftests/resctrl/mba_test.c
>>> @@ -13,10 +13,51 @@
>>>   #define RESULT_FILE_NAME    "result_mba"
>>>   #define NUM_OF_RUNS        5
>>>   #define MAX_DIFF_PERCENT    15
>>> +
>>> +/* Intel MBA is specified as a percentage: 10%, 20% ... 100%. */
>>
>> The percentage based interface is the generic interface and not Intel 
>> specific.
>> You can drop "Intel" from references to this interface.
>>
>>>   #define ALLOCATION_MAX        100
>>>   #define ALLOCATION_MIN        10
>>>   #define ALLOCATION_STEP        10
>>> +/*
>>> + * AMD MBA is not a percentage but an absolute memory bandwidth 
>>> value. The
>>> + * test sweeps the bandwidth from 4 GB/s to 40 GB/s in steps of 4 GB/s,
>>> + * which the hardware represents in units of 1/8 GB/s (i.e. 4 GB/s - 
>>> > 32,
>>> + * 8 GB/s -> 64, ... 40 GB/s -> 320).
>>> + */
>>> +#define AMD_ALLOCATION_MAX    320
>>
>> The AMD maximum is enumerated from hardware. How can it be ensured 
>> this is
>> the appropriate maximum for all AMD systems?
> 
> You are right.
> 
> The hardware reports a maximum bandwidth of 4096 (512 GB/s), but a 
> single-threaded workload may not be able to achieve it. So, we cannot 
> use the reported maximum bandwidth.
> 

Thank you for the clarification.

> 
>>
>>> +#define AMD_ALLOCATION_MIN    32
>>> +#define AMD_ALLOCATION_STEP    32
>>> +
>>> +/* Number of MBA schemata allocations to sweep (same for both 
>>> vendors). */
>>> +#define NUM_OF_ALLOCS        (ALLOCATION_MAX / ALLOCATION_STEP)
>>> +
>>> +/*
>>> + * The fixed-size result arrays in check_results() and the 
>>> aggregation loop in
>>> + * show_mba_info() are sized and driven by NUM_OF_ALLOCS, so each 
>>> vendor's sweep
>>> + * must produce exactly NUM_OF_ALLOCS allocations. Enforce this at 
>>> build time so
>>> + * that changing a vendor's min/max/step can never overflow those 
>>> arrays.
>>> + */
>>> +_Static_assert((ALLOCATION_MAX - ALLOCATION_MIN) / ALLOCATION_STEP + 
>>> 1 == NUM_OF_ALLOCS,
>>> +           "Intel MBA sweep must yield NUM_OF_ALLOCS allocations");
>>
>> Considering how NUM_ALLOCS is defined, could this ever be encountered?
>> Could this instead be
>>     #define NUM_ALLOCS 10
>> to ensure the sanity checks is accurate in both scenarios without 
>> deriving a
>> architecture neutral count from Intel counts?
>>
>>> +_Static_assert((AMD_ALLOCATION_MAX - AMD_ALLOCATION_MIN) / 
>>> AMD_ALLOCATION_STEP + 1 == NUM_OF_ALLOCS,
>>> +           "AMD MBA sweep must yield NUM_OF_ALLOCS allocations");
>>
>> Could _Static_assert be the more flexible static_assert() (and include 
>> assert.h)?
>>
>>> +
>>> +static unsigned int mba_alloc_min(void)
>>> +{
>>> +    return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_MIN : 
>>> ALLOCATION_MIN;
>>> +}
>>> +
>>> +static unsigned int mba_alloc_max(void)
>>> +{
>>> +    return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_MAX : 
>>> ALLOCATION_MAX;
>>> +}
>>> +
>>> +static unsigned int mba_alloc_step(void)
>>> +{
>>> +    return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_STEP : 
>>> ALLOCATION_STEP;
>>> +}
>>> +
>>>   static int mba_init(const struct resctrl_test *test,
>>>               const struct user_params *uparams,
>>>               const struct resctrl_val_param *param, int domain_id)
>>> @@ -33,15 +74,17 @@ static int mba_init(const struct resctrl_test *test,
>>>   }
>>>   /*
>>> - * Change schemata percentage from 100 to 10%. Write schemata to 
>>> specified
>>> - * con_mon grp, mon_grp in resctrl FS.
>>> + * Sweep the MBA schemata from the minimum to the maximum 
>>> allocation. On
>>> + * Intel the allocation is a percentage (10% .. 100%); on AMD it is an
>>> + * absolute memory bandwidth value (4 GB/s .. 40 GB/s). Write 
>>> schemata to
>>> + * the specified con_mon grp, mon_grp in resctrl FS.
>>>    * For each allocation, run 5 times in order to get average values.
>>>    */
>>>   static int mba_setup(const struct resctrl_test *test,
>>>                const struct user_params *uparams,
>>>                struct resctrl_val_param *p)
>>>   {
>>> -    static unsigned int allocation = ALLOCATION_MIN;
>>> +    static unsigned int allocation;
>>>       static int runs_per_allocation;
>>>       char allocation_str[64];
>>>       int ret;
>>> @@ -53,16 +96,20 @@ static int mba_setup(const struct resctrl_test 
>>> *test,
>>>       if (runs_per_allocation++ != 0)
>>>           return 0;
>>> -    if (allocation > ALLOCATION_MAX)
>>> +    /* Set the initial allocation once the vendor is known. */
>>> +    if (allocation == 0)
>>> +        allocation = mba_alloc_min();
>>
>> This does not look right. "once the vendor is known" does not look to 
>> be the
>> real reason here since vendor is known at this point. This just seems 
>> to be
>> a workaround to assign a function return to a static? It seems risky 
>> though since
>> 0 is a valid minimum for AMD and that would cause problems if ever 
>> used with this
>> implementation.
>>
>> show_mba_info() already treats the allocation as an index as opposed 
>> to an
>> accumulated value. Could this be simplified by using an index while 
>> also making
>> it consistent with show_mba_info()?
>>
>> Consider, for example, something like:
>>
>>        static int runs_per_allocation;
>>        static unsigned int alloc_idx;
>>        char allocation_str[64];
>>        unsigned int allocation;
>>        int ret;
>>    ...
>>        if (alloc_idx >= NUM_OF_ALLOCS)
>>            return END_OF_TESTS;
>>
>>        allocation = mba_alloc_min() + mba_alloc_step() * alloc_idx;
>>        alloc_idx++;
>>
>>        sprintf(allocation_str, "%u", allocation);
>>
>> I think having everything bounded by NUM_ALLOCS instead of mba_setup()
>> bounded on accumulated allocation would make this overall easier to
>> understand.
>>
>> This would make mba_alloc_max() unnecessary.
> 
> This sounds good to me. We don't need to depend on mba_alloc_max().
> 
> Start with a minimum bandwidth for AMD (say, 4 GB/s), then increase it 
> in 4 GB/s increments and repeat the test for NUM_OF_ALLOCS.
> 

Sure, I will update this accordingly in the next version.

> I have not tested this, but it should work.
> 
> Thanks,
> Babu
--
Thanks and Regards,
Swapnil
