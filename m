Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012034.outbound.protection.outlook.com [52.101.48.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464037649B;
	Thu, 11 Jun 2026 04:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154000; cv=fail; b=erTmT1jTi82EaEgO3kjU/n6P8L9pEqd3epKnteOEI1SwHQH6r3KcjsJKQX2XOkZq/1w38ckJa9yyW9zCyscaI1OAOfjSO8D2Ya+VdMqhq31wGnkRJeaNJWFa8eSKzB/bEWeY1egAVsUnyKYeBiWHqlcokiHipokfHPhwxejxkrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154000; c=relaxed/simple;
	bh=ltxTfMoucS1R2/I3r9p6o+wdTOTosj/2hBJ6pT650zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uRRD0Edg9JyhOQk1rDiSKYPK5NtyvI8UeKE3IWs/zLYUkWtg35Hv0zePVnlXPd+zxC7QCPq6LwYatPdwanl2zJqOsqG+HF8BW/+JsIGf1qHe1zIlekkPSNp6Gydfl2y1ilB8V6XgcKxykvtr2+HDyddHwqeMjqOF53sOggW0vN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YWGPbwx+; arc=fail smtp.client-ip=52.101.48.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YWGPbwx+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeH6UIcu62Ngi3cr4I1zTt+NhMQPmKCWXJsAOCv0ucC88CxvP2vbhaWh4Zg0gvT9EAdzQ4+oGnw+1kn3jZYN67+xYMfPdImq88APwEkAf8vj05Rr98VWDvg2BqSH7U704TnnKdsb5U/rQZTVh2I4nJw22f2Zybj7cE+gJK+9LMf6tCiEwUHIAdX87ytBzZYBACpwC/6qJWSbI9sSjVkpYDYFUnZGp7B798VcnCp0ZqqRx8o107BEMBPGJRg3/wdeA8wnc6lwVUT8YH9IC7FfOanvmdPpWXdO5IVKYc5n3BFV7/hnin7vKcqYV0aDVKHhcANm/esLfzlUhBYBtBNVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUTaT5Xcyl0dbdKKJXF6V2ob1dSLi2voBF7MFs8Pgeo=;
 b=AAf/mXqSsuMqGtYJXwt4BqXQ0BB4k890JrsTYFb1g+jxX4viW2HF1QKfPtyW0jNQdcfSxCfWw97UXmgmIsV4gByzBUb4AJ5JPrAOBrke0s/u0Jv7cykY4SU4fXYXVDDRL8QqIb3PBHsGuNiWmFrGYvHEnajy24V38po8sM8YOy5h+WCHdt52zraLR2nJiya0VcoDniKN/fKLEYRpFFXuM8098KgNBWWNPMVcXeunLeFf/SpDSnGzVrA/qrrd/blFwme2aWDBi5ReaGb5iJ8SQ/lBDJDz1xUDJUBnv8am5ezAWX5NSE2EBRMwtHvKwUjNG8/4HKVYkeqt8SVNbYqR4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUTaT5Xcyl0dbdKKJXF6V2ob1dSLi2voBF7MFs8Pgeo=;
 b=YWGPbwx+wXej0YHlc1VwT7X35Z6onKGIvK2zPJk1OnkJ9qYfVUIUhNhH4uU4kuOYzxxdjc81b5PpLqMnQrdJmYgQzz11FwQnIbunAZIhehrILpy9H5LF3aG2EX05q6xjNTOvhTQJA7EwSBGrIfERat/IG+nzmo23C9idgRPSKMh+nzQMXZsmDZUOgU656NMo1T+pZk5hSV/VxFceF/vTkxND/Asn816fDINWIyEOUQ20qJF7/V+Xr21FtigSazbGj/IjDD1MCxESLw5aGA3iYMpoRIYUld3XYEG4t0U7uBor/QBiuwUWLERzYHBGACT0r5Ea871kYq3vSOLXz4JXKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB5001.namprd12.prod.outlook.com (2603:10b6:610:61::18)
 by PH7PR12MB6907.namprd12.prod.outlook.com (2603:10b6:510:1b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 04:59:39 +0000
Received: from CH2PR12MB5001.namprd12.prod.outlook.com
 ([fe80::89e3:6df0:de90:8dfe]) by CH2PR12MB5001.namprd12.prod.outlook.com
 ([fe80::89e3:6df0:de90:8dfe%5]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 04:59:38 +0000
Date: Thu, 11 Jun 2026 14:59:33 +1000
From: Balbir Singh <balbirs@nvidia.com>
To: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Ralph Campbell <rcampbell@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Alistair Popple <apopple@nvidia.com>, Alex Sierra <alex.sierra@amd.com>, 
	Matthew Wilcox <willy@infradead.org>, Sayali Patil <sayalip@linux.ibm.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] selftests/mm: fix exclusive_cow test fork()
 handling
Message-ID: <aiovwpe5DVT8sXwW@parvat>
References: <20260611034102.1030738-1-aboorvad@linux.ibm.com>
 <20260611034102.1030738-4-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611034102.1030738-4-aboorvad@linux.ibm.com>
X-ClientProxiedBy: ME3PR01CA0008.ausprd01.prod.outlook.com
 (2603:10c6:220:19e::17) To CH2PR12MB5001.namprd12.prod.outlook.com
 (2603:10b6:610:61::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB5001:EE_|PH7PR12MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c862787-371f-49d2-ad50-08dec7763d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	X8o8Gnm7QcEhPgfLfO6eVVZ+ot2edSEK8fdK6cL3F94mFOT4xPDozGDmXlE973f/ZnKpF0F5lrRVNMx0hGl9A0k7u4cJbKFVCcBeo8rl2+RisZ6piZh+Wu2O/kUmnGpr1EIpr01c1Kh8NKjasC+4RhvQa40oiWkPXIg/xgF3p7GXjMKgOw3FlSyPWI11ygDAdUslRoAUtt7Uyy7HBQP0aXrnstZkr549cVCJi8nUz+uGS/W9MVLUpJT6uLlX9L3ZW99W97yo2TTFtmq77w3Kpuhaf6tH4vlGh9B42gU8ZqhVjJMXGqeusapQL7LjbUOLnIExeDINH/IrbHOp7zO80wjZuY9d1vlMM9oUj3DG971Vt0Ez/zACp2yalNUlxV2uklw9M0xiiQDJPIJJDxMiQipTChlpM26OWRhT4DIc+6UZ927NMRti1RRCvVgHodBFXZUcegugBEPMwRpNhp61TncLBjIQNoB/CfWdOH0MmBQ9+No+jtiLlK1suhka4jN8tDB9Pgu4qjjcrhAsVmqJxWT97xSxO+6xSUVQJoUiQLgG6W5o3RS5NyaRYb+lKv0qmbswMV1TtuvPW2w1T0GAqrCiigrdzXmGsEIAoZ6aMIYKkZbqYN4wU2aqxzG3BNFHhxFBvzvUFs4kkFSV2KuTiWDqFNzTCauJm0/7LlTjb4HcUFqbAc5HejwlcSkov5gD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB5001.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lke6wBVHjtFfeX9yzplRVzji87xsk2fo5s41ZzVsVHJrJLZUWGx+f3hCN59f?=
 =?us-ascii?Q?2+B1Ehgi3VLAKJJQrRQaV812S7Z2f95Kn8Iuia0eA/kguCwYW48+BQOqsBp0?=
 =?us-ascii?Q?Hv/DMxsV8gcaF9wgML7M0DrSJqsvH1yfR1xOv0XOuYNw7ldfa+pW8oJ134nS?=
 =?us-ascii?Q?L8SDlnNkKh1gZ0RBAdqoT7tp5FgvtgmwH8+YaW9fwW+ogI+FxS2mxzXyUdq6?=
 =?us-ascii?Q?n4JYaog0SeH5Mst6u2WFJRKeIkqVEglkDlZFv43sJFPxzBvmsmSwsaQB424q?=
 =?us-ascii?Q?5j3M4+aBQ9ymDcSuKr1dofQx93vLGhc4PSO3yltrjlVBAtUDf5jYgRji6Foe?=
 =?us-ascii?Q?TqjZsQR/ERwQdEcE73bR2Osrfv0mqzEkf5AQBFO11vhSXvqytFhhXjVxsRIU?=
 =?us-ascii?Q?r8455vYIOXnEF0sSFvIJXs6Pd18VhQNUmvhLAbdoqLoY7LNn+ZYHJO4sJGOv?=
 =?us-ascii?Q?s309VaipCcTvI9wfb8qj07hR4ofh7R0cZnamaujdIFYnZqxcNqBGiRu97gTJ?=
 =?us-ascii?Q?uQG8fEu8cCjD21uwLDKAGJXIaxt+12IPm+00PhMxZQE/N2/qNtHtwJxncI8v?=
 =?us-ascii?Q?8//x7KKfNU56ilwer3dI1Gv3TZQR104/6QdpJmvw4WZlcEJAqAkjC6ty2nXJ?=
 =?us-ascii?Q?kWgu1opTG54tlwk18dPno9YG5KF/CM+soaGka+p6nyH1n5o2NadSDvMYpU3n?=
 =?us-ascii?Q?l9L90EuCqIxTLJ6R6B3AkLX8VV44M+/Mc0ayMN28w1FxO3hYvRkAfyp84Zuu?=
 =?us-ascii?Q?4TLYFQ8AVeeFOmDq5+oUr88L7WLASgTHSKBvnytMyYAbEu0OAN9xrEkhGqm5?=
 =?us-ascii?Q?2Okt8Tb+mPCXyAS5eJnKjm4IxMg4sBcHLd1poA9QKZOXVA2dLyHtehvssGzV?=
 =?us-ascii?Q?WlyWtTWxa/R4lRacetrp4vsP+GEFE/zhx/k9M+2RkDcpX/nUn0yXqf4R0lz9?=
 =?us-ascii?Q?tiQCGKqTToZvq+dnMJtoIxgZ3fVG8KNp1fxAeGM1aXFr3ubBW1i9EucVEAew?=
 =?us-ascii?Q?FTwYI+PKg9GSIGeoMV2zidqMpcGuS+rl8jf4DgjbL9C5lKkwJV+6aafxgYpp?=
 =?us-ascii?Q?DiNkwak5BILbD+le0qYhaNiOncsCI0po9RdtbMeIgVxzRXY30lLIFbqlSmN4?=
 =?us-ascii?Q?FStua1TmRyOpeR1UZT0mKiSOuGkOCzYGl1v/62zBGDMgptps+toEsENDWsFj?=
 =?us-ascii?Q?Yu829h3kVXVi5TDRrQ8k9e8/fsLIrvUY450Y+jzhQKgs48Gx2YMeSF1EuJkG?=
 =?us-ascii?Q?bz9joY6N+9reiKPK5SCFB991HGWhAg5oE2oAHC3rPrc0CpFct12bIJdzegwB?=
 =?us-ascii?Q?54C7QqoYucp+j8NXEWhW2v/px+nfZ631YdqNvDOaPBAXXykCKhMSGX8oHX5Z?=
 =?us-ascii?Q?fqFj+CGNIpZ9qvZMV0GqPJF4iWwvSgxDTEKavn/iZZxL8B/P25Xab+l+3des?=
 =?us-ascii?Q?tYhX3fND1vkNvGaFoIYWDgeI56uDHYQY4UzVSs4ufHUvZtZ+S08DlVYBP+Tw?=
 =?us-ascii?Q?LZUE+2xnfsOzW7wWmiX3KWXeQzg2syu4CoMKfACaBQXarr1ScVZsu/m3utOG?=
 =?us-ascii?Q?JGKP1KICrNKjJDem9Iz1GLH4fQ1EeYw7Dyo0Oyu2BTc90231IfH5spnkG0yr?=
 =?us-ascii?Q?N1YahhtLNllWabTCFfRPuND5x5H8ulwVEHEOmp55acU58GVqwiiadRtaXOxk?=
 =?us-ascii?Q?2udHZo8MDlX15UUzCvdHBMix4jzAxzExBZxiggEUr86WzicdFUHBF9VxYaFZ?=
 =?us-ascii?Q?oV7LcP41TQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c862787-371f-49d2-ad50-08dec7763d7e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5001.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:59:38.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFQEerVrCl36TXx7GwgxGNPSDDm2dctpGag7UEy5jY0bvRxNyLTIgO9OXhfe/oJOK0Ws5nBkT2MSVqFkNogeKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6907

On Thu, Jun 11, 2026 at 09:11:02AM +0530, Aboorva Devarajan wrote:
> The test ignores the return value of fork(), so both the parent and
> the (newly created) child run the COW verification loops and then
> call hmm_buffer_free() before returning into the kselftest harness,
> which _exit()s each side.  This duplicated teardown sequence has
> been observed to manifest as a SIGSEGV in the test child, e.g.:
> 
>   hmm-tests[360141]: segfault (11) at 0 nip 10006964 lr 1000ac3c code 1
>   in hmm-tests[6964,10000000+30000]
>

Thanks for catching this!

> Fix this by adopting the same fork()-then-wait pattern already used
> by the nearby anon_write_child / anon_write_child_shared tests in
> this file: the child performs the COW verification and then _exit(0)s
> so it does not run the test teardown, while the parent independently
> verifies COW, waits for the child, and only then frees the buffer.
> 
> Fixes: b659baea75469 ("mm: selftests for exclusive device memory")
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> ---
>  tools/testing/selftests/mm/hmm-tests.c | 31 +++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index 8f4f82467043..e4c49699f3f7 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -1884,6 +1884,8 @@ TEST_F(hmm, exclusive_cow)
>  	unsigned long i;
>  	int *ptr;
>  	int ret;
> +	pid_t pid;
> +	int status;
>  
>  	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
>  	ASSERT_NE(npages, 0);
> @@ -1912,14 +1914,37 @@ TEST_F(hmm, exclusive_cow)
>  	ASSERT_EQ(ret, 0);
>  	ASSERT_EQ(buffer->cpages, npages);
>  
> -	fork();
> +	pid = fork();
> +	if (pid == -1)
> +		ASSERT_EQ(pid, 0);
>  
> -	/* Fault pages back to system memory and check them. */
> +	if (pid == 0) {
> +		/*
> +		 * Child verifies COW independently, then _exit(0)s so it does
> +		 * not run the test teardown.  A failed ASSERT_* here makes the
> +		 * harness abort() the child, so the parent sees
> +		 * !WIFEXITED(status) below and fails in turn.
> +		 */
> +		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +			ASSERT_EQ(ptr[i]++, i);
> +
> +		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +			ASSERT_EQ(ptr[i], i + 1);
> +
> +		_exit(0);
> +	}
> +
> +	/* Parent: also increment to verify COW works for both processes. */
>  	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
>  		ASSERT_EQ(ptr[i]++, i);
>  
>  	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> -		ASSERT_EQ(ptr[i], i+1);
> +		ASSERT_EQ(ptr[i], i + 1);
> +
> +	/* Parent: wait for child and then free the buffer. */
> +	ASSERT_EQ(waitpid(pid, &status, 0), pid);
> +	ASSERT_TRUE(WIFEXITED(status));
> +	ASSERT_EQ(WEXITSTATUS(status), 0);
>  
>  	hmm_buffer_free(buffer);
>  }

Acked-by: Balbir Singh <balbirs@nvidia.com>
