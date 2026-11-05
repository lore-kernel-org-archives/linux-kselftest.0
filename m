Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793852202;
	b=Aik4jXjXSn+WIOfmcqhz5huNQ+be+QG8FX/nGBC5YGIYV/puKVO99XNvPZCJeP8mL+9J
	 8oUVRoJ+GoCKidAXVbOAxem4b+rIAchuVtR0O4Ps71iIAzBLBYq279xN8Ni67Ug5AxLoX
	 bdcwpEyjqh8+19sG03K3cpaMLGUJ7tFQZ5JC5/1m+a0pWwuMAsNlDvOHUV4UVZMAcNbwe
	 L+17Rs/YbECu5ka1bCwJFKr2NIXesnGmRUVd76Lp93A6+S7KZzB6bTiZpVRdjcSLw0wvh
	 x0zty6RXeoMY7iyq5DDiHwj54M6RgeGRvQxKzuJxwaeELA+7Hj95Rqj3g+gopJVRQJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852202;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=a2MJ882NJrgXDH1A/UsxhBtZXLGJ5csF024h60rejrw=;
	b=RRzsjHXAewxQ42QAiQeyyrKwbU/g/lNDKE3U1Rz/gnwqZGbvHMcKadbUyUnF5l4/1n3o
	 stdTJJb9vuIqY+TW+qcj8IixbY5sVBeZM2zW+V/k5267esxYJkrkyL3Kn+wx4tp3hXy3I
	 tUAb5ux5dsh7mik1YIDIRpL+M5My9f7nu3eJxFdV3kzQwsoye5TEq//TUE1KgqI7jgBAq
	 IV6fbA8o3VOGCOb3vwi217fzoNvrKrz4G1KyqLCzRMbeV86VdMztU8YOHFzO3PgBcHckJ
	 HDWTGNZfRTiXIB9sRDvCrJfGhAx1srB5obCosrGANofgpFW/I0HkEMOixI/yl6BJJPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vRhEost4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.10
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87247606A31B;
	Thu,  5 Nov 2026 04:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87247606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vRhEost4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R56+LopMTjxB33Lyh1LvbuNYBdMUiAdB1UCYp2mTPdUIZpw5WgXKMq4EajSdqAIIRYr9JQcicomBSeOFmxC4Cmo+/8mmyKAJ7l2VuFirNYsfXMbUKud3Sr/kVQHyKekrMAheBHUOd1J/5hJlSITEfp6nkUpVNdmkNOSXHkahVfy3VW4VnUVaIfcrgkF10YeY2JJGeEeBpEf7uQUEuIRkFwnt5+BP5uVZGDJ6wl0KjGLW80RYXrmtL/xh9ONpvNNq+z0NJLNrqwoxkk6ECmLrHkAjXhiyukFe6SFnMe/Yn0KvsTGS5S58QKDL2HNHF49Mwnfj3vHrjy2tczHLgiMM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2MJ882NJrgXDH1A/UsxhBtZXLGJ5csF024h60rejrw=;
 b=gm57vT0a+NWgdK9p15wYtYi3b6ykL1XKji9ykAFliyZCgIrigjcwY953U6Gi/llr5vpI7dMs37lwhzRIrl12rcWHprw/tNjm/shha+2hnzFwQuyluQlqV5mI5kzNFLgRW7DLFHRtkHOz+EIUB+v+7YjDb1XO6z07k58OYqffFw4lpxdonfpJVB2o3dLcaP5nBzqVMwU/xOHJz9a1EA13nd6hVg1BJyQJ5PD/izS8x0slkIfkr1gafLhjjVhfh/94C37+in9JfdbR7915MRyRXtWTSzQWvykgB8XK5mfCn5e2vBuhQIdt9IdGPXGXM8KAk/iP4zjNx9n1ta54g8L3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2MJ882NJrgXDH1A/UsxhBtZXLGJ5csF024h60rejrw=;
 b=vRhEost4vgNk3voSc9N/8p0x14Su4lEcQ6MMb2XV1r0dOqp6wZfzUCY4piACaEuYwEVfAxjdTpb/ng9k52OikJbe5JPvAQ8wPSpyIUjFV5htjk8zt6Ecezgh6hVVKWlJ7cfeWy9q8ijKJbaSA/1b8X0wqzeP2Co9e6JPSUyumOE=
Received: from PH7PR10CA0004.namprd10.prod.outlook.com (2603:10b6:510:23d::22)
 by IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 04:16:37 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:510:23d:cafe::1a) by PH7PR10CA0004.outlook.office365.com
 (2603:10b6:510:23d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 04:16:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 04:16:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 22:16:35 -0600
Received: from [192.168.0.103] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 22:16:29 -0600
Message-ID: <cacc0f81-eb8b-4b76-b341-1ba8f27cf1f5@amd.com>
Date: Thu, 5 Nov 2026 09:46:27 +0530
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
Subject: Re: [PATCH v5 5/5] selftests/resctrl: Enable MBM and MBA tests on AMD
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-6-swapnil.sapkal@amd.com>
 <befefa2c-6898-45ba-ba17-4944c2d47d97@intel.com>
Content-Language: en-GB
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
In-Reply-To: <befefa2c-6898-45ba-ba17-4944c2d47d97@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 467bafd9-2b3c-4cc9-b1a3-08df3af3953e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|36860700016|82310400026|4143699003|56012099006|261009223027099003|11063799006|261026121527099003|261021121427099003|10067099003|18002099003|261102123227099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	btyqtdoU+jpdfvAd3xuTS6bTvt1AA8JptnBPiwHVnxjFCu0Ci5Bd6X2QT9MjR1n+6of6TR2ki4AzCj9tPc8h0PW8PHovQ0QXCMXOfL9hBNls/t+a3WAhmHirgJkautFM4UNKTbDcEAFqARQDklrPfSUSkMuR9BY0H6eH5LEZHu4Ucm4D9eKxHp9/OIUitu3/+dRCbje1c42piaCMYniZ/Ml+R/E7aCNRSlk/6t1RwaDjRBdc3jrNNg/w2IRTd3gedW8BimU1gOQTAxyozyMBxnEMcIZ4cfLghkdgWahnIN7m29huiax/Nzxvypr4nwN7etOhtL1Pq1meCxb7XZ3T3+9vXLAJ8uQPlI4l5Uw7qSL10a2ACphpdJjLZP8nI1gm4gQBJmL7XLe2pVIIqNapfp+7XfZ2GhPc9Y1WBLeOvzGzFMlXgN0giaSqhsKpBQZpgzlj94pUkP5H29dp7m6/AzAPibEMAK4b/2KF+hs5k8T9ml4gr/eD4/cQHg6yl0f/Vxm53+C43omgOqDXv+FfhfK6VZLMmN7OPrecA76DrgZPtTQu9UMdVzLz4XXIlt/syRJIpPNvDYw7USVw0uhsKJdWe8vA5SSWnT+BLlfLCAex7JcYXav1jBEU2eCUDTuxdrMt+GS2pncxdmqpxn7o4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(36860700016)(82310400026)(4143699003)(56012099006)(261009223027099003)(11063799006)(261026121527099003)(261021121427099003)(10067099003)(18002099003)(261102123227099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	awJDUVzqpAdpKxBOrcM2+8hUkShQFOk2aZwBXRyyeYwfAe3TfsbWb3xRO9X3Jb/Iada1OvB92O+2GAN+95pt5oeYv/2eDhLvtCZN5NwuhqKJzdRARTiII0cmPpg+sEIEMsczjIWb9oyJXFeypfPvE0IYDAYzlsqM4qD7fHNX7aIHNx64gaUOFVtMGHfGbd/N1MzTbozHKvl5utQCZB5OkFSAx9lqa61t2fg6/ue9Ra0bemXAFZo90zFEVIcCJ9F3/QvV+1ljTYCBdJYnQT4DmjZNhV703kHLOWnJqErFezAMj88zVjE9n2kwB6xfwH/C912zSFBiN83hZeBgIevetxN+y0KJpe97UECB0IDAC2NNX2dYMbUURAAdG5MhI4A1XLDuGKk9IAPeF6iHRiv1Ln5RYoudBUAYPbg1nOrphpIWkAFH1CZcEsH9//nfnHBO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 04:16:36.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 467bafd9-2b3c-4cc9-b1a3-08df3af3953e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556

Hi Reinette,

On 29-10-2026 00:15, Reinette Chatre wrote:
> Hi Swapnil,
> 
> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
> ...> diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
>> index e24c6237a22f..b2c5fd0ab8e3 100644
>> --- a/tools/testing/selftests/resctrl/mbm_test.c
>> +++ b/tools/testing/selftests/resctrl/mbm_test.c
>> @@ -178,7 +178,7 @@ static bool mbm_feature_check(const struct resctrl_test *test)
>>   struct resctrl_test mbm_test = {
>>   	.name = "MBM",
>>   	.resource = "MB",
>> -	.vendor_specific = ARCH_INTEL,
>> +	.vendor_specific = ARCH_INTEL | ARCH_AMD,
>>   	.feature_check = mbm_feature_check,
>>   	.run_test = mbm_run_test,
>>   	.cleanup = mbm_test_cleanup,
> 
> The issue reported by sahiko looks real to me:
> 	https://sashiko.dev/#/patchset/20261022132517.46805-1-swapnil.sapkal%40amd.com
> 

Yes, the reported issue is real. Currently, mba_test uses the 
unthrottled value of 100 for Intel, which does not hold true for AMD. 
AMD should likewise use the unthrottled value, and I'll update this 
accordingly in the next version.

> Reinette
--
Thanks and Regards,
Swapnil
