Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851525;
	b=KScdKsFYT6kC3Q+NNceWslcH06i5zRehwelljFTtTdEq/u/jhiL65/VFImUMuriE770K
	 c/Go8TKqutSI9khOKYvvaEb/s13cvP+SnAvaw7VwqUthfxx79pm4wgVSk4sMzWwBzacqE
	 BFYbFUusjchwrlCMhZNCTN0/nmvQQxuNSZWsyL/Tx7qybZuPtzoijUc5K3fGSgWUEktoW
	 c1iTINv9g+9P5fr1E9vxetscFAnzf00sDxr4lkWs25BHPpdP8UKUYHH0D/1tybYn/FlHy
	 qpYe/iOWZxTrEimXmyTn+lVS99rLTwYheSkjK+zZBBjjsbz20wmjkBulZmgmP5DaOnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851525;
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
	bh=KxYYy6jy3W2C0StXUTJ1E+PgnnR+LnQNWoLDmw0iICM=;
	b=t2/yhUd06pjcUSlHr4fCs6nb8sUtGRedslDNK05weXjzTGfM2vKxJBJRhjaYeLsULklL
	 1u+lz8xYshrURfnFpOeZd4/Y4mGJ3C/JcLr4OqXjddQPEdw+6M3DcycgWTXRjinqPgozg
	 53zXAf1I2GQtDZpWvptEw7GIIeImpJc7mxns+ouh44PuDu9xVD7qdauq7eiWqII4s113z
	 kUi9fkJE/pKGSSoZaICf1tKKeTduCIe/zb80HXv50KXJc+Hvra3i5KqzYD9+Flhcidi2Z
	 Y6N6fGzPdD1C6mb6H75T3+H7UwNulSWnUFFOkw4/bRGAl3d/vMIXR/Q/IdFzU7tOvsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kdaIugq6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.6
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1AA606A31B;
	Thu,  5 Nov 2026 04:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1AA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kdaIugq6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrsMNvDnoeJcGSOUuSpz/Sh6y1sfmS/HSqkDxfCxCiLXCAmbdZVeQemsbRt8hH8bYDQiN7CM50JUFUGHdd4F+Sko/rXZPksNus1+mmoZEjZDjAP7xh3gy4PUsj2IcWcuYbtdVgxD1VspkQ8WE33DyVvn9YGMLwdRodpbwBNO9FY94htlATmLduC/0CE3WrTkTV93xEWA4xX3BvsCXw8SQXv6j8z9XHWaKvj12wLkx3her/ruXLMhq/PUPkL7ngdBypjq3eZw9M9tq6u9ZeqoIG1/yJvzxF1ZaDYk4cf2aPMv4FPhr02SZvTfQCLkV+nsJBC3N53IioKaHqY/hfC/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxYYy6jy3W2C0StXUTJ1E+PgnnR+LnQNWoLDmw0iICM=;
 b=ln212tCur7zPy1TatSbFtaydtGWbeUyK3Em86E9w4IszJ8ItFG0etrYMKu0BKM1T5WCYDhOuT5ffLpWOMxrRYtj2Lgl10mKZWWyWRs1sR1BpoZ7soRWQB5o/MwQe3AOayBvgEk0Bo7vsF+tJiSmzWhQVMeE1nKzBzjVKiT3WK+2buNiQqgyuNQq1k2q41yskNZurylDHaEcOKph/8KW1LelOXVXOqLwo/qJTV7wfD1d7xQLDEFTxRv690S39m8WRujGhKSfZHtCwSWBM3iLPs1xgOtsoyUa9oRPEL36TIWvQTQPLFea7BG8HG27QNhanGt1BD6QAJ8mZ+qwhreOwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxYYy6jy3W2C0StXUTJ1E+PgnnR+LnQNWoLDmw0iICM=;
 b=kdaIugq6qxRsdjGo+PpH9MON1tNyQsDJUdMWJQI9/ixwzaNSEfUFVj/xt+27YntvdqB8iincjGQJGYhoLtX961xUJuLLVLNfra5+WXn+lt0sCLcjmtUa+I5cpDIedXkVtTGYkdXiQsrm0j8HiXEE85q6SXD1yEgcEsTbXux2ZmQ=
Received: from BLAPR03CA0082.namprd03.prod.outlook.com (2603:10b6:208:329::27)
 by DS0PR12MB7970.namprd12.prod.outlook.com (2603:10b6:8:149::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 04:05:18 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::71) by BLAPR03CA0082.outlook.office365.com
 (2603:10b6:208:329::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Thu, 5
 Nov 2026 04:05:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 04:05:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 22:05:17 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 22:05:16 -0600
Received: from [192.168.0.103] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 22:05:13 -0600
Message-ID: <e30b8e81-938c-4426-8b4a-2a3a8d5163ad@amd.com>
Date: Thu, 5 Nov 2026 09:35:12 +0530
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
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-5-swapnil.sapkal@amd.com>
 <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
Content-Language: en-GB
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
In-Reply-To: <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|DS0PR12MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8676f0-49e7-4e56-2ac5-08df3af2007c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|261022113327099003|261022075727099003|261028144727099003|11063799006|4143699003|56012099006|261009223027099003|261021121427099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xGprohHxwFavvH5X/s2RMLYuj9aMZWe2PEra4a4pwVEwbiyc0znSw2EkwOV1HG6DEux3GAGRQT1K/O2lfO5oz9SgGsmxvpmoNq1NGMRyUBpkzpGfEte3ZLz6s8JcImB+uTHhF8cODVPRjCwYwKdB/S4gaPjKdh6NwQfUaRu8PORzJ2X6CDKxWmjH7+mNlI4qGcGap7CHmxv2dVlCpsN8fAuVdATet1Ptoyn39FTF63D7QaPWOKmggOrQnWK1u0b6k3uoJj83+68f521zrs+cn7NWEbo/wNElBQtABKsTd8de5aVlCSB6QC2Vm54bMm/vAPzpx/VeZHBaIrtMUZSmbAjyIccMFmoSzKELIKlle2ZhcmLUBW6/IehC8xahe5SZoDWAXaePP7PGnSGHQQBThd3eLiQ6bsCKJcWrsus4+0Ht8RlQ3/O7JdSJ1SfTIL3PSJ3C2jUMn7+mybotbdSHZjLPYwyP76aujNSzPPzKRNBffoN+qgbGx4YdbHnkczanB0wBmbJ91GzpssZ594Ztmu88CaUml0Nr+lt5PAH+B2TKTl3IhvDDkaGPfiCSHtdAJCn2krm7odTvHtBp3qNqSwwPLPFTBPGEKg/igi5MF47dLCAC49h3zDmqaj2ToACq8ZdJRJ0SzkLho66D6cBf99FhtFN72w2DrRpQz2T157F5BPryYK8zidlUmeic9mKBOQLG0YhdHz/pt6cXvqaCkw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(261022113327099003)(261022075727099003)(261028144727099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nMPjd8NY6601dHxyHWLpb0OuLCbmqNYq3/BHgzYyYK68Jz1Ct/KEg3hdH+V/c7rITFtiUiPsMxH57p1mlFiT6ctXfCKp7up+xHHygBZv39Ehy6WqDyZFMCEd7/jv3wosy1rOIWI41WFC+JAxqah16IIKV6HNxB3WJlc2ywFGFF6jkOs32L0L1NCUC6MU4n/NHMHQh8xa1MoedBAgYnyHq4iz48YfMy9ygXgc2+Rn+CF6PzeDs8Pv1U9Ady1MgJAgSOA9dl16clOpLqCfgkB0oC3k9Z7LoHXSQ2IxjiuBWr94AkkDjfH6uC2rYHHZM9blDXC1DCJ3eY8imRdvXoHZ/iMZX2QhxxBn5SPuMydf9LaqTR5tLzd/cXHArZlTIbJPWNl3+GAUv82juGOuBn5cDAMX0g81uSrL9Hr+LnvVs4+HiQmnaYQtuLOkhYPh8/Dr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 04:05:17.4092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8676f0-49e7-4e56-2ac5-08df3af2007c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7970

Hi Reinette,

On 29-10-2026 00:15, Reinette Chatre wrote:
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

Sure, will do.

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
> 

As Babu mentioned, it's difficult for a single-threaded workload to 
reach the hardware-reported value. For that reason, I used these values 
to verify whether throttling takes effect.

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

No, that assertion can't realistically be encountered.

> Could this instead be
> 	#define NUM_ALLOCS 10
> to ensure the sanity checks is accurate in both scenarios without deriving a
> architecture neutral count from Intel counts?
>

Sure, will update this.
>> +_Static_assert((AMD_ALLOCATION_MAX - AMD_ALLOCATION_MIN) / AMD_ALLOCATION_STEP + 1 == NUM_OF_ALLOCS,
>> +	       "AMD MBA sweep must yield NUM_OF_ALLOCS allocations");
> 
> Could _Static_assert be the more flexible static_assert() (and include assert.h)?
> 

Yes, static_assert() is a better choice.

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
> 

Agreed on all points, thank you.

I'll switch mba_setup() to an index bounded by NUM_OF_ALLOCS and compute 
the value as mba_alloc_min() + mba_alloc_step() * alloc_idx, which 
matches how show_mba_info() already walks the sweep. That drops the 
static accumulator and the sentinel, and makes mba_alloc_max() 
unnecessary, so I'll remove it too. Will do in the next version.

>> +
>> +	if (allocation > mba_alloc_max())
>>   		return END_OF_TESTS;
>>   
>> -	sprintf(allocation_str, "%d", allocation);
>> +	sprintf(allocation_str, "%u", allocation);
>>   
>>   	ret = write_schemata(p->ctrlgrp, allocation_str, uparams->cpu, test->resource);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	allocation += ALLOCATION_STEP;
>> +	allocation += mba_alloc_step();
>>   
>>   	return 0;
>>   }
>> @@ -75,14 +122,15 @@ static int mba_measure(const struct user_params *uparams,
>>   
>>   static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
>>   {
>> +	unsigned int alloc_min = mba_alloc_min();
>> +	unsigned int alloc_step = mba_alloc_step();
> 
> Please maintain reverse fir order.
> 
>>   	unsigned int allocation;
>>   	bool ret = false;
>>   	int runs;
>>   
>>   	ksft_print_msg("Results are displayed in (MB)\n");
>> -	/* Memory bandwidth from 100% down to 10% */
>> -	for (allocation = 0; allocation < ALLOCATION_MAX / ALLOCATION_STEP;
>> -	     allocation++) {
>> +	/* Memory bandwidth for each of the swept MBA allocations */
>> +	for (allocation = 0; allocation < NUM_OF_ALLOCS; allocation++) {
> 
> As reference to earlier comment, here allocation is an index limited by NUM_OF_ALLOCS
> 

Agreed. I'll rename the loop variable here to alloc_idx to match the 
index-based mba_setup() from your earlier comment.

>>   		unsigned long sum_bw_mc = 0, sum_bw_resc = 0;
>>   		long avg_bw_mc, avg_bw_resc;
>>   		int avg_diff_per;
>> @@ -99,7 +147,7 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
>>   		if (avg_bw_mc < THROTTLE_THRESHOLD || avg_bw_resc < THROTTLE_THRESHOLD) {
>>   			ksft_print_msg("Bandwidth below threshold (%d MiB). Dropping results from MBA schemata %u.\n",
>>   				       THROTTLE_THRESHOLD,
>> -				       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
>> +				       alloc_min + alloc_step * allocation);
>>   			continue;
>>   		}
>>   
>> @@ -110,7 +158,7 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
>>   			       avg_diff_per > MAX_DIFF_PERCENT ?
>>   			       "Fail:" : "Pass:",
>>   			       MAX_DIFF_PERCENT,
>> -			       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
>> +			       alloc_min + alloc_step * allocation);
>>   
>>   		ksft_print_msg("avg_diff_per: %d%%\n", avg_diff_per);
>>   		ksft_print_msg("avg_bw_mc: %lu\n", avg_bw_mc);
>> @@ -129,8 +177,8 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
>>   
>>   static int check_results(void)
>>   {
>> -	unsigned long bw_resc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
>> -	unsigned long bw_mc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
>> +	unsigned long bw_resc[NUM_OF_RUNS * NUM_OF_ALLOCS];
>> +	unsigned long bw_mc[NUM_OF_RUNS * NUM_OF_ALLOCS];
> 
> Please re-order as part of this change to maintain reverse fir.
> 
>>   	char *token_array[8], output[] = RESULT_FILE_NAME, temp[512];
>>   	int runs;
>>   	FILE *fp;
>> @@ -147,6 +195,11 @@ static int check_results(void)
>>   		char *token = strtok(temp, ":\t");
>>   		int fields = 0;
>>   
>> +		if (runs >= NUM_OF_RUNS * NUM_OF_ALLOCS) {
>> +			ksft_print_msg("Got more results than expected\n");
>> +			break;
> 
> The message is worded as a failure but the test continues. This is potentially
> confusing. If it is a failure then test is expected to stop with an error, if it
> is not then the wording of the message could be adjusted to not imply so.
> 
> Even so, this change does not seem related to enabling support needed by AMD
> systems?
> 

You're right that it's unrelated to AMD enablement. It hardens the 
existing vendor-independent result parsing, so it doesn't belong in this 
patch. I will drop this in next version.

>> +		}
>> +
>>   		while (token) {
>>   			token_array[fields++] = token;
>>   			token = strtok(NULL, ":\t");
> 
> Reinette
--
Thanks and Regards,
Swapnil
