Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25843368942;
	Tue, 14 Jul 2026 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026526; cv=fail; b=Sra8SVd9E+3uUj2JWT98CWU2ZaGx6exGSlKhS5Ajl7x1bynpzHUiaQiH5t5AugbR6QTmDOH2IzqcIEaPH4JOQBWklhueOUk1bdKheeik/iClDAmFA4XLCk0aR1ebPs+DSW09nmk1E0b0Dk0wxSHOwzZC1m0/sSScoQnoe1TT+WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026526; c=relaxed/simple;
	bh=WIKUccIBKCJ0yPRgC4Z0Sqka4N3N+UuY10MjCcr6bCo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MPvG35SfBQjUyjluB7saeD5Ael9efZcmA0I7m0BQIt0AlbYpdWysBVlPOwagZHIbCnGCoQk0EiuH56kBEz0OAdnV0gNjJgxWwqdtZ6ItyM+c4as3D/V5nTiCM/rtIirC/4/3548iLGwqGi3Vf9t+jyUmqByEhzw4hbEXEjlSzwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JfSV+DrP; arc=fail smtp.client-ip=52.101.61.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JfSV+DrP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMHiE4TOrsp3QAYFP0OsIzK0jda4D3aOFF89lYTJCucFWHywfiBGVlsk36V2OqNskh9VOBwjWUxpM1gtfXq2F4fopXmCPlZaN3ogPbWeRVYBU1etOSH8akpnyvqsWCVdkO1Zj0Hl9S1iPpIK6tpcvh5jJV97NjFlzWmNbGV3D0nPskCMQaJ9GvmTVhJLXXuyfF3rgR3y7e//WFmP2Z7C7otYoMxIsDZOlyPsoxv9t+M05y/od9vgdaOO1BWpXswMFT0xg1Vs3CQ/9wNMWzrXfwwD6YT91DyhxrNZ6bxYaQcH4JoQNkJ91N4jS17eu2qoS6vqpNSBNru/doWHhEz76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=petMP3dZZBCxhrGFFutIz/oh2dMRg5HWFcSh3puFsGU=;
 b=gfoH1dpRNxSQeKmNsDiweFQD5N/3MZExbuXaifQ1rKjxOOP44iyZR2Si9mqrivLxkvLANwehrOlgsqaKGtWczOg5OcguZlktU/qS+5cxtaJLj15vNuB4HtWPMKNHtdXrtW1ZIdDN8GYHd527SFnDHoITmEPPxmWxFEd/LH3flUe95ya8dfoXFySKTVuJTjHlduV5WUgp5tuaT0eKO93lAUP4/EVt1bLP66fav4NeyFnxT/xrOzZ419xj+s66Jrfyy3lJTfWR5pur55YDNVSHk9le8VMhbGLvXBWzPFprmxfwCIlWIURMUaKC+cSijyWWJmLrKyDQDrqr1PYRYlkjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=petMP3dZZBCxhrGFFutIz/oh2dMRg5HWFcSh3puFsGU=;
 b=JfSV+DrPO98kUww+5cCaUXTK/POCpjoK2DJREJR0ltNxs6k2cv47Wm8KAlJuUuEcxeS/fNO4YbhTnkfTDDigLPeSgSYGgYl5we+SKIS55wWwdMrtvt8TSNAPYjJ6/mdGdLksosvXp/Xc1R2+aHD3GmuKESFMIsE4oiFNt167alnrVxU/TdBkE4hkhAvQG9QPSwL0170lA8J0EKlokkFKf23yH81g980sDMoAkCIp53jm/lhbDw+ukdwfgI5OfArc13ezn8Mjy8wvmXHVi6ZF1HKuRDdr5RdoBipec9z11VdPls22D7L0ObVjkLALzUBjLpgyapD+9pjXmu89ZyAm8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB5001.namprd12.prod.outlook.com (2603:10b6:610:61::18)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Tue, 14 Jul
 2026 10:55:20 +0000
Received: from CH2PR12MB5001.namprd12.prod.outlook.com
 ([fe80::89e3:6df0:de90:8dfe]) by CH2PR12MB5001.namprd12.prod.outlook.com
 ([fe80::89e3:6df0:de90:8dfe%3]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 10:55:20 +0000
Message-ID: <7f600e7a-e7b6-47a0-af54-05da2bea9cc7@nvidia.com>
Date: Tue, 14 Jul 2026 20:55:09 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: Fix memleak in migration benchmark
To: Hongfu Li <lihongfu@kylinos.cn>, jgg@ziepe.ca, leon@kernel.org,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, hongfu.li@linux.dev, SJ Park <sj@kernel.org>
References: <20260709081843.1451202-1-lihongfu@kylinos.cn>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260709081843.1451202-1-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MEVPR01CA0018.ausprd01.prod.outlook.com
 (2603:10c6:220:205::13) To CH2PR12MB5001.namprd12.prod.outlook.com
 (2603:10b6:610:61::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB5001:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 151d9401-803d-422e-93ae-08dee19664b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|921020|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	baPbrTCGLnhsxQJOajNNCbyJ07vkzSe7dVMoPoGy7h13a9qiMK3Zq9sa2Gr4Ae+f+1Af8bpSfp5jkn1mXQd6hjV6hiCryxLPiYhsh8h+aKZpr0hPiPiKRgepFOXKI3yuGClPebCiaqWMULtTLp57rvF2piHoptnkYVRbMFopNIDhvbyw4SMQngkR1cRPIgVD5jIIAg0M7U292LqT+0+952osY83zA1A4yi7+VX9kTX0uJ31p8UPph4Jn4WDmAqhLb0kQdPW4m34lLNtd7p9dzUs51O6OvhAb3unTr6jZY27Pwj2Zj9TB77EyBUwcVYMRbka59yrepeuPklFGsQ4QnafGe88D+oOPyz4eQ6baih6YR+oFx0L6O2zQYs9wPyEjqmt3W69hFbGyZ7zK7CN/zCqVdjqEl1HPsBK4GRBrDT47M4aP4DaCeUSExLeRSErfKDpoBf6FXrNyd/uHORbJTwF7O3crDg2fg5POncmWmxWVxp5y7orSdgmaW7bL2GnQyb7OqniwHAGnbERVvrGIR0h0RnnMxyeasDTDrZVvpRaHhs4P0yrPG1ffqxJ+EE34q7MRL4wqfCrUMdwOHPdqtQax5avzkB5Egc9CU8vgYvi58Ic9CxrPr94E7Eujz+0TBL4ZwubvybbFUvjEFU79tx7sMAKKSi52X7REqwEsyu3T7StYMzl6gnZOD80Gf7qpHXLoDN723eMSpyidIUCNZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB5001.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(921020)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUE0aER1bXBLQnpTKzQxd083MU9qam9zeU9Qdm5vNzlDUkQvZ0pkSnMzZ1pQ?=
 =?utf-8?B?RGZsa3phK0VEa0NXdnIrdSt4MmtXb2ZjVEdRSlJnbE1XSmdJOEd2SWduRmF0?=
 =?utf-8?B?QmszLy9Pa1FxYkhSV28wbmVpS1RYUDgxZHMyR3pmMXNINWNaTkFUQWRPVyta?=
 =?utf-8?B?dzBSZE1DdzZnL2Z3R3lZWnFJSjA1RVQ2eEZhYUY2YnVtZlJBOWJ0QXBhYzNu?=
 =?utf-8?B?Z2VLN3JIZUxzUXF4VjA5NjI3RG1lZk13eU85dlQwMnhCZGZnaEVxSlR0MFla?=
 =?utf-8?B?OHpnajZJaUhwbW9sU3BhTlRCUHY2UlZ2UEdlYnBRckV3dE1WYW8rNTdXV1Vy?=
 =?utf-8?B?cVJDOVNNMnhvbVQzOGNvWGtlRFRQNmNESHVsWGF4aHhWWUdZNDdPZ1BWN2pp?=
 =?utf-8?B?NjlWTUpTVjdSNTFLcWlHV0F6SDZyMFk4cE1LUWRqdGdWQVFYbmJvQ3VhYUp6?=
 =?utf-8?B?d0ZpVU1XSENKZXJIeUNDRnF4VEM2anhwYURRZXErMXF2VndsMXBzbDJMYUdM?=
 =?utf-8?B?eWN4WU9QZExMMS8za0lFamhYcGhWeEpFRExrSm5rVzhMeXE3NVUrUzZQRk42?=
 =?utf-8?B?eENYUUdwOGZGTFMydU4vZ25VNlorYXR0dTRQMjdDZ2dTV2FVR0l0U3VZSTI5?=
 =?utf-8?B?QkJYQ29TTTlwZHg1aGF3L1RKdU1oMkFuUHVtMkQwMmhZZUpXbEhRaUVOZmtu?=
 =?utf-8?B?ZFBsUllZR0lnWGlHYnB2VFFTUVY1QzM5TFludlVQVUI2TkdLZ1E5Wjh1RVls?=
 =?utf-8?B?Q0YxazluMzFZb1lMQWh5VldTdWRDbS9HWlo0dnVBakwzU0d1UGRQcStWN2pC?=
 =?utf-8?B?VmttRlk0cmNjYlRvcUVoWGRrWXVCVXY3UEdobnJzZzI4OFQ0REY4djJ0L3JW?=
 =?utf-8?B?dmY2K0gvTTZDRGkwNGs2MVMrUDN4YWlZOXlIajFoWUhMUTBTbmkwWmhJMVpx?=
 =?utf-8?B?TE16bk1IQjAxUElheUY3L21KNDhVMWVWNkhIWUxmMUQ3b3grbFhvaGRVTWxI?=
 =?utf-8?B?SDJlT1FFYk0zeHBWVk41VCs4RjVaMm0yVFZ0VlM4WTQ0VGVUZmdRODJVclps?=
 =?utf-8?B?UXBJTkpjMnpTNVNtYlpxZzlaOThPZDRPaUhhQUxVVWlRZDBmR0xoeE9IYTF6?=
 =?utf-8?B?VDN4a24vdk90cS9wTENZanBnMXRSV1JmNnUvY2k0ZTBYRWticWNFZk5EK2h2?=
 =?utf-8?B?bzBSYnRGY1VkeG1wUEVETGZIaHVBMEdNQjRPWnV3YmtUdXFTVWRZeFZvMFJC?=
 =?utf-8?B?ODZ0dno3U0RUMUFxT0JQZTVwZWNPc0FCTUQ5T1VvWWVWNTdselh2Qmw3QjNZ?=
 =?utf-8?B?ZHlYbHBpVU1iblB0bnRrdFdGdXNTek9kZnJPT1VWWXprLzBobjZwNGt5U1hY?=
 =?utf-8?B?NmdpSkFpL0pWVDc2d0lvSERjenRNTHgyU2EvTlJEMitBUkJFNnR3L0xQWGxJ?=
 =?utf-8?B?ZDZPQytPc1RyMU5pb1NaNVRrNzc1UlJWci9lamptd3NpV1BNL2F3U1k5RUpQ?=
 =?utf-8?B?M0taTlNXODdwd2laVlpLcmc5SExvL2pIdGcrbmwrdi8rM1g4OGdSVUR3NE14?=
 =?utf-8?B?bm1Xc1doNktsc3BlREF1MEJ4UW9WRWhvS25WNllOUThFQllLVjNrSWpGbnlx?=
 =?utf-8?B?RjBydFdwOU9xNVV6eXU5S0wzN3czOGdZT0NrTTcySGgxaTY5QW04WGVRaDda?=
 =?utf-8?B?cXg2Mi8rMlJsS3I0am5QbTY2d2pBTWg2Nm8xMlVEbnY1VEpJQnN6MkZNTHZ2?=
 =?utf-8?B?cmdFRGF6MUlmTnU3cVlVQ3J1THc5Tm1JYm9YTnk2VjVRNW1rWVZmSUpUQ2tu?=
 =?utf-8?B?cU1UL1J3K3djL2ZzZ05UUk9NTlhZS2JvQ2dkVGRQbnpMZ2ZMVEJFdWRlb3p5?=
 =?utf-8?B?NXBWZ0g1N25PV2dzU2YyeDhESE55a1RGSTUxREtDUTY2OW9PUDFKVTZBNmNa?=
 =?utf-8?B?MUN2aDFSVnc1ZTkwV1FqdUpNZWZ1Uy80bHoyVkNQbGdwYW9KaUVENm5BMDBR?=
 =?utf-8?B?cjdzekZkZGh0WjJONStVVG5jUVBzMFNkMDBkcVRLNk45UzVxRDdMb2lGWUpQ?=
 =?utf-8?B?MDJxZWpsRHJtOXN6dkVpTHpxM3BHR254TGlnMXFPU0tCdUYvSXliUFZ5OU1T?=
 =?utf-8?B?SFJpbXBSdTQzL1BmZ2RxNGM4Um5DNHVIRms3d3RjOVJpa0xiVXRxRC9mMnBt?=
 =?utf-8?B?MnNqWk1jTzRBSndXOEtMbGhaeVFicnVBck1kbWZacHhGSmFxbW9oYlFxUmJE?=
 =?utf-8?B?OE1rMHdUREJRcmdYODJKTnFUNVV1d1dpaHE1Z0tkZWR0QTZpUHl5SlVXcjdl?=
 =?utf-8?B?QWIyS3I3Q2w3RmY2SU1ZbitsWTllL0dBUi9FakE4L3ltN1poTzVGZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151d9401-803d-422e-93ae-08dee19664b3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5001.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:55:20.1124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uX+Jvzw3pp4MfUwYEOwom25ZIhkljVP2cq4smkPsnIcJUZQmr1O9fNrqGSxn9HoFdes0Zy8wyaeHOgUzJkJpTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520

On 7/9/26 6:18 PM, Hongfu Li wrote:
> Several early return paths in run_migration_benchmark() skip
> hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
> label.
> 
> Fixes: 271a7b2e3c13 ("selftests/mm/hmm-tests: new throughput tests including THP")
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: SJ Park <sj@kernel.org>
> ---
> v2:
>  - Set buffer->ptr to NULL on mmap failure to avoid passing MAP_FAILED
>    to munmap() in hmm_buffer_free()
>  - Drop the redundant "/* Cleanup */" comment
>  - Add Fixes tag for the commit that introduced the leak
>  - Collect Reviewed-by tags from David Hildenbrand and SJ Park
> ---
>  tools/testing/selftests/mm/hmm-tests.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index e4c49699f3f7..402c6f6f5f09 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -2828,8 +2828,11 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  
> -	if (buffer->ptr == MAP_FAILED)
> -		return -1;
> +	if (buffer->ptr == MAP_FAILED) {
> +		buffer->ptr = NULL;
> +		ret = -1;
> +		goto cleanup;
> +	}
>  
>  	/* Apply THP hint if requested */
>  	if (use_thp)
> @@ -2838,7 +2841,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
>  
>  	if (ret)
> -		return ret;
> +		goto cleanup;
>  
>  	/* Initialize memory to make sure pages are allocated */
>  	ptr = (int *)buffer->ptr;
> @@ -2848,11 +2851,11 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	/* Warmup iteration */
>  	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
>  	if (ret)
> -		return ret;
> +		goto cleanup;
>  
>  	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
>  	if (ret)
> -		return ret;
> +		goto cleanup;
>  
>  	/* Benchmark iterations */
>  	for (i = 0; i < iterations; i++) {
> @@ -2861,7 +2864,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  
>  		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>  
>  		end = get_time_ms();
>  		s2d_total += (end - start);
> @@ -2871,7 +2874,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  
>  		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>  
>  		end = get_time_ms();
>  		d2s_total += (end - start);
> @@ -2885,9 +2888,9 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
>  				 (results->dev_to_sys_time / 1000.0);
>  
> -	/* Cleanup */
> +cleanup:
>  	hmm_buffer_free(buffer);
> -	return 0;
> +	return ret;
>  }
>  
>  /*

Thanks!

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
