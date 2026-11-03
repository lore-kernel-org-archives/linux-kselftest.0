Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686406;
	b=Y7mGkTWNQGMJhcf2QlHnKPiACkA9vLdnHyfJ+2JXIRC3MQtPch1OHn3M3OoXN8Hj2/D6
	 6R6anZjFandATF/4qj2WD0GNi/yHKts0nWDsIKIwf007bE2FUcde/JVDKds3iU9bRC4NY
	 5FUEDvqeUQQBVKgfZWH1goC1uNMNL6Wo6Ai9I6KU9HQm9GBSD5DZF2iGps0cEa7k6T1H6
	 CoSYIe+58AbrGvXNWUnpZFfyEyUGNRQUWxmJlL3+lx4kvQpSOQw/SD6aaBHABFvp+D0LP
	 xBA5kew6ANsN4hG+cHFWRTcHl+b+vz22ckTF9Xua+AYrtPS0XoFAVv9lfOMlzVZdjJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686406;
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
	bh=WvskakTBQsLBAm5iU7jJ4NP1410t7zRbvnFMJZb7TLo=;
	b=gQKYXZycar7aPr5dgE/OTE2pXJwopANDOSfcULK+AYJRuXVddn8T6jhyHNfCgKSTOODX
	 Zg+pfGvMoxFwo35SHSFMlcAdCmVO7JobvKFoptCv0kcMP7pQ2cVQl00bf8nFZFaHT+B9O
	 1Wy5iEBUPB93Sd2gOnLr1GV0OS5E4l0+Y2QsCcoMR1cZXmAlJCgqiKFrPuR4vkSMWCJbX
	 PynvkglGqUpXALmU8vrLCVc5pYiZXdOk/9QhB+pvfOb+6iEPQKbt3v0B1rkNflGH3NoW9
	 /rEoxFHUZE/rv9lxPN2+MIxakNjzsHasZs6khzAMedwAVp2UiFPBt98Q83fo/Z1oQCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="RfRbx/45";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.30
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B8606A32C;
	Tue,  3 Nov 2026 06:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6B8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RfRbx/45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEt8r62gdM4sASd2V52dgpJjO4RNx8wsML/L/6OnmgnlxKQzgmQqAcXf94oqrtfpnBXBCvuKThicOlgZRwRJXerwkKDsht1ENaAuOu3rD1twZq3/mtVyjw4SOG9mceXuFcPDvxXNuerIR8sRWvG4OTepLV4qwoA47XjnApa5J3EezJFUwcTBYMPPNcFhXu/6aMe0kdaKEVLmMXp4wa0I63qsLwg5ctnqnxCMj11MvFnw++8kDkLIgjkOQ1MMEgjx7soikDv3fHUyAiYqKUOBBB1kCsygVCLEETcm96gnCq6QKocGWy1eF9iWpy95bpSQhJpqymz4hXwc/l2h1MEQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvskakTBQsLBAm5iU7jJ4NP1410t7zRbvnFMJZb7TLo=;
 b=X8wmuzgODfVCgp/5L0PoVi+OZ5JfBt/l7qVZNew1aqQax4JblN6dfaHYU77n3BgK7FYBoANDqUmVYTmXfHLBLfHH+lxUQOWFyjPAnKD8GrL0TT4qTfPPTpnM2Hnp7R7gfT8HC3lKOiluQuyB6KN/4p+JWXqB5VpB0C/5yFvlmG9A252yczPYvKaZYQP/5H5fyiU2eKhPmbY8cUAve83UuHSpaTnGAoTPX4wtd3ex37pmb6kiRi9LAasV61ait9C+75DqWZ4unpNcT8PQdSRLnu7EZx8A8HxEJE29OZ0r/RpBf8PUBxJFM1daYZl7dpio6giIEIluH7ImxPeirHM9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvskakTBQsLBAm5iU7jJ4NP1410t7zRbvnFMJZb7TLo=;
 b=RfRbx/45Su/E33jm9Utb2jqyh6FK0VtM/6CZ9DelfEp2Hj/kB/M/ssF6dPWix+TdWzULcmF53bJmxoB8zWOkDsMslqrjW9CrWxYMRLAcSVcL0RYcB7xeDhPnss2afoHw8t611iLWDb+gC/sGw8nhxqrlJtoUSvmZL2recHEHSXw=
Received: from SJ0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:2c2::8)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 06:13:20 +0000
Received: from MW1PEPF00018894.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::52) by SJ0PR13CA0033.outlook.office365.com
 (2603:10b6:a03:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 06:13:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF00018894.mail.protection.outlook.com (10.167.249.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 06:13:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 00:13:19 -0600
Received: from [10.136.40.220] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 00:13:15 -0600
Message-ID: <5fbcef9c-4c3f-4386-968a-01a81c67900e@amd.com>
Date: Tue, 3 Nov 2026 11:43:09 +0530
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
Subject: Re: [PATCH v5 1/5] selftests/resctrl: Rename variables and functions
 to generic names
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-2-swapnil.sapkal@amd.com>
 <94608581-10a8-4967-be6b-1842d4146223@intel.com>
Content-Language: en-GB
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
In-Reply-To: <94608581-10a8-4967-be6b-1842d4146223@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018894:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab4e9b7-4b98-4ae3-565e-08df39718ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|56012099006|4143699003|11063799006|261022075727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261022113327099003|261028144727099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Dwzx9uzk2ReCUcK9rEiHn8Ws0BCJRFs5GWYl+NfnuYTXvAVAcQno65tHCpFvS0yr7aUtd5+8RBL+bklEhf6icmJWY+fSA6GVCN6ogY3fxUqGvqGeP9uqCLsKy4MbZOWkpcWKpIAXvroM5+jVUwEkgLn0EO+Pq0jiUH6k2LspLDx1nuRvRMi60YnSaSnSAg2jehGfpUIF0be8U40k/ze3SUpBzP449DeOQrRNDWkDPUec//VWeLWhXEBnrhO6vR4IrDFGLGSHgUwVpW3uFWg9CME5mZt/E5ez0ybcAhnazT/ok8c95de7PObd0AJJqJKxACOEAiY+bcr0ojkCbc3JGbKln+qa+Seh9A4sqFkAAaBr/x5e+SB9GlwvhEkpN9sEf2QZ6JamxUE7igef7FOxla1HeOK4nc+IsyMQj//c1MPK0jE9lOzp84oi3Irj8VNt17epHp9k07Vk+63+Ykzl6aDtvew9BxpiuGH+6fWntui1I6uoVkB4CzfLMB6gSUuzn0FKZgZEcBDiAEM2CS+eZM41E0yG1suXpS+dDo5u+APDNKdjLfhssW6smI/JEgxwTKMQYxbFMrOpy8aKmvaZ5tFJ4fUjX8inHQe7Z5WecNMfRrK+aFY7Y+MbhOH0+VcT1Qalg/ilaTypczrnH2i5qQaI+3ytGoaKEKghf0feloxAALK6yX3k6cZduurKTQ5YRnn8adboP1/qCYh8CJUtsA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022113327099003)(261028144727099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HBMbOq2/xARs4WOwRRcl55Y8ePM/BYDlMUBkv9D20XCspHOsqVVHK7fwnP90aZXYFoALIXNf8ZSp1EaezqFl+EKbu2UWzGe/nUinQ6dxNSHNlErqk6Eq8C6I6ALGrXQt/0QXC3Rw7Rl1Qw8wOkrilH/xU7w5ygfw5RlkAZ0qTrmDDZ6s54yTJEdb/V/TD/kP1zZUpIqUuSm/1FHR/pdQcsvwJriB4usTwDwy4eInfLRJ9Z4sryKOSRefWkKNvsoW+sjTnz2FZQ2eV0cz2aO1SGxTjLSZGDJqRVQvrKnXWBSnCS6AhSO2hPXUBSm4ma8FJTjajrQRTjWF2pv28lnTrYrntkDuIyoK6Ub7TrMbILkefhbyaDNqPkNn5mwvZiwxYNSucwvEemopxs76TFAxqH2Hts7gh0CGWPu81HBzOgFE6JdX1RfXgM8dem/wV+W8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:13:19.7542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab4e9b7-4b98-4ae3-565e-08df39718ebf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00018894.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417

Hi Reinette,

Thanks for the review.

On 29-10-2026 00:08, Reinette Chatre wrote:
> Hi Swapnil,
> 
> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
>> From: Babu Moger <babu.moger@amd.com>
>>
>> For Intel, the memory controller is called Integrated Memory Controller
>> (IMC). For AMD, it is called Unified Memory Controller (UMC).
>>
>> Rename the variables and functions from imc (Integrated Memory
>> Controller) to the generic mc (Memory Controller) in preparation for
>> the support of MBM and MBA tests on AMD.
>>
>> No functional change intended.
>>
>> Assisted-by: Claude:claude-opus-4.8
> 
> There was a decision at LPC that this tag is no longer needed. This was
> formalized with the following recent commit:
> 	1e035297ffda ("docs: remove Assisted-by references")
> 

Thank you for pointing to this.

> Please remove the "Assisted-by:" tag from all patches and instead add
> a statement to the cover letter about how AI was used during creation of
> this series.
> 

Sure, I will remove the tag and update the cover letter.

>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> Co-developed-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
>> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
>> ---
> 
>>   tools/testing/selftests/resctrl/mba_test.c    |  28 +-
>>   tools/testing/selftests/resctrl/mbm_test.c    |  24 +-
>>   tools/testing/selftests/resctrl/resctrl.h     |   6 +-
>>   tools/testing/selftests/resctrl/resctrl_val.c | 256 +++++++++---------
>>   4 files changed, 157 insertions(+), 157 deletions(-)
>>
> 
>> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
>> index 7e7d0f9cc249..c9cac957726b 100644
>> --- a/tools/testing/selftests/resctrl/resctrl_val.c
>> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> 
> ...
> 
>> @@ -83,20 +83,20 @@ static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_con
>>   		if (!token[i])
>>   			break;
>>   		if (strcmp(token[i], "event") == 0)
>> -			imc_counter->event = strtol(token[i + 1], NULL, 16);
>> +			mc_counter->event = strtol(token[i + 1], NULL, 16);
>>   		if (strcmp(token[i], "umask") == 0)
>> -			imc_counter->umask = strtol(token[i + 1], NULL, 16);
>> +			mc_counter->umask = strtol(token[i + 1], NULL, 16);
>>   	}
>>   }
>>   
>> -static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_counter)
>> +static int open_perf_read_event(int cpu_no, struct mc_counter_config *mc_counter)
>>   {
>> -	imc_counter->fd = perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
>> +	mc_counter->fd = perf_event_open(&mc_counter->pe, -1, cpu_no, -1,
>>   					  PERF_FLAG_FD_CLOEXEC);
> 
> nit: please fixup the alignment with open parenthesis
> 
>>   
>> -	if (imc_counter->fd == -1) {
>> +	if (mc_counter->fd == -1) {
>>   		fprintf(stderr, "Error opening leader %llx\n",
>> -			imc_counter->pe.config);
>> +			mc_counter->pe.config);
>>   
>>   		return -1;
>>   	}
> 
> 
> ...
> 
>> @@ -344,54 +344,54 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
>>   	return 0;
>>   
>>   close_fds:
>> -	perf_close_imc_read_mem_bw();
>> +	perf_close_mc_read_mem_bw();
>>   	return -1;
>>   }
>>   
>>   /*
>> - * do_imc_read_mem_bw_test - Perform memory bandwidth test
>> + * do_mc_read_mem_bw_test - Perform memory bandwidth test
>>    *
>>    * Runs memory bandwidth test over one second period. Also, handles starting
>> - * and stopping of the IMC perf counters around the test.
>> + * and stopping of the MC perf counters around the test.
>>    */
>> -static void do_imc_read_mem_bw_test(void)
>> +static void do_mc_read_mem_bw_test(void)
>>   {
>> -	struct imc_counter_config *imc_counter;
>> +	struct mc_counter_config *mc_counter;
>>   
>> -	list_for_each_entry(imc_counter, &imc_counters_list, entry)
>> -		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc_counter);
>> +	list_for_each_entry(mc_counter, &mc_counters_list, entry)
>> +		read_mem_bw_ioctl_perf_event_ioc_reset_enable(mc_counter);
>>   
>>   	sleep(1);
>>   
>>   	/* Stop counters after a second to get results. */
>> -	list_for_each_entry(imc_counter, &imc_counters_list, entry)
>> -		read_mem_bw_ioctl_perf_event_ioc_disable(imc_counter);
>> +	list_for_each_entry(mc_counter, &mc_counters_list, entry)
>> +		read_mem_bw_ioctl_perf_event_ioc_disable(mc_counter);
>>   }
>>   
>>   /*
>> - * get_read_mem_bw_imc - Memory read bandwidth as reported by iMC counters
>> + * get_read_mem_bw_mc - Memory read bandwidth as reported by MC counters
>>    *
>>    * Memory read bandwidth utilized by a process on a socket can be calculated
>> - * using iMC counters' read events. Perf events are used to read these
>> + * using MC counters' read events. Perf events are used to read these
>>    * counters.
> 
> nit: please move this dangling "counters." to the previous line.
> 

Will update.

>>    *
>>    * Return: = 0 on success. < 0 on failure.
>>    */
>> -static int get_read_mem_bw_imc(float *bw_imc)
>> +static int get_read_mem_bw_mc(float *bw_mc)
> | Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> 

Ack.

> Reinette
--
Thanks and Regards,
Swapnil
