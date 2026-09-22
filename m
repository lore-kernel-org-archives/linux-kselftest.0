Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4D43515CB;
	Tue, 22 Sep 2026 01:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040717; cv=fail; b=urLCqobZOma+x9DAgWnWcSGSpHzAd97HcwPXZ+d02CebDZl68r3TViqRRRbLjcz9gXNMS2omvCTRGYHh6RmbTYas0F14s8dULlYEjUeOY0G0bMSLTa2uVWKy7oNljbHZcIkE7Y5TQCu3FB4SZ9oxYOfTRXSFZXrzvswYjPmJrSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040717; c=relaxed/simple;
	bh=VD97Jqw03dZYPlw7uJDU7FK3Lhb5M2A6n38S6EMO9NE=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=M2Q1fM0k38i5azF0knVw29dineqa7ek9TSrgqMAjZWCsO63m2JCztJiTtFrdWbweH4JcOp+g6yst7GhTfsKgheOKD69FXb1UcDN093UJj2NOq0Dt3pFLdNxSLLNRay91qh/7yUcSLOpyj5xtKCW72rECdr5MVNr7SJGUBTf1UwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o+kUUKmp; arc=fail smtp.client-ip=52.101.57.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o+kUUKmp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzH48cpEnV6Ib0M4t1so7tDMFQF9X/BfQu83/xaoEzOquowr264a/LRSRq/pQzgpGgEnGWU55iJHX83lTX1WcTq0q78FKuAnonrIw7aKl5qEUBm8VjV/n5NSBaGbyxskVROylNARpyaCe/G5dRLlB7z1FvQPp464kCZenqC5cuqkOb6M1AsLru/Xa5XWnEMPKT/dv+DXuLTV+Bh4hbBFR240/sx5/BUco8pNqnpzi8nAjGefuMWpjhlJU0O+t0m+HKEcdnvoRswxTlLzZKhNsEPLX21wrNYkzrhwhDrbm9Ahzce6hiDrRz4yv0i6M01v8tVmLvogVLVZ0ULblVTm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYlph9QeQ/YuNvweVwGPcZpIqdapi1MCW77wcBORG50=;
 b=hd2gZ1fAoboXmg53QVowgfrJ/qCZ8LN0/IZZCRhXjHEXw9AcxoihZYMxO7/fJjWZGz3t1PjkEvUj7SNtNq1/Czesbv5Rac3MzT6TpX5uBqgQdpo0YDELnsfZZ2BdrcUzKzrM951fwK7WN0VH9Y0EePi+lQltXHsZVsLd9vtWP/vQtGOB/1DfRkCuO7b8oXelXJ4KcNiaCbShFw6WUwz581B6WvjF6b1XFIis64zoYOMcryg04drlQ8qMC/TuRdOHcEnvrEqtW3j2OtopWoFkMSOWAFW7npLDRrQ/Ow++sNo+mtsUMLq6gf3NEKYX99mNa5MneRUFrmnqN2GxawPSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYlph9QeQ/YuNvweVwGPcZpIqdapi1MCW77wcBORG50=;
 b=o+kUUKmpkA8NbbbPeesMybPXdswI3Od8bHSLqJkfMF9xq8tzDd/qX1lEIqdKfWFqjKGiRgeHrR7T4p5v7srVQv6qOFwis90Z3oOzQ8EO9x0p2tmNOte+e05XPSeYYX9Yobx50Dnpdx+PH8r9U/hfxnZ3cvHbSjX9fen7oERxbn1YyVm0trhhGmFQM0eeZni47tvVqQrR/zS9xUBc5EeRbvDF3aR+0HaBDisT4F+p4/A3OuQdWpnTXYaMwvk++s7KFmbaui2PHUm3kI6KOGVlsMRADhBp5/xB58YCRdb2dl0CWGrQmFIjUvNNBZok0ItO5s+VvDx4Rnr2npU9TvPbsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 01:31:52 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 01:31:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 21:31:50 -0400
Message-Id: <DLLGH1Z3NNZ9.UQWNPS9LB7PO@nvidia.com>
Cc: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Shuah Khan" <shuah@kernel.org>, "Kevin Brodsky" <kevin.brodsky@arm.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v7 3/3] kselftest: mm: remove check_huge_shmem()
X-Mailer: aerc 0.22.0
References: <20260921-fix_split-v7-0-d25ec991159f@arm.com>
 <20260921-fix_split-v7-3-d25ec991159f@arm.com>
In-Reply-To: <20260921-fix_split-v7-3-d25ec991159f@arm.com>
X-ClientProxiedBy: BL1PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::25) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bfe70b3-365e-4ac6-2008-08df1849474f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|921020|6133799003|10067099003|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5iX5yAlwQkphaTb+SC1J1qe5jElxCTMW19xN71AptBU2FafmVJc1J/KPUXDwQ5kCKQ/3n9QGsf9VyDvv3Td/yIsACAQd0EdAekw3oBMJDu66+ppo3FLmezcfzQGZfDNCen14OC4YVxZONrf7lENaycwWKE6TylITeBtHas0rRX/vz4N3B8vuh1kI1YtYYsrWx937jUXhb9rt5b8Ss+Lgx5Ze6MjrvG+10AFID/Sey2OIdXUHHoTLJbifwuE1EwQn0xei9gEm8Vv0MxD1Z3Ve1kC/hx0vlP9FRmxlmPAsSWk1B+xh8BTvPnWridyxxrJVRdwHHEwxAS/wHXsGy4eWwyxFyY9OoB2m1xDIqW2SfQhpOPPeJkOwkuMOOanZW4vgFNgQ2/m70ITOnjsR5/I4M3eEDWh//zf0Pmhv4GYRGEjFkgPKe0MVk9GQpRza93Ibe0qeQ8/cEHGMJH4zwr9xQOqqurP3Csr0gaLu2ec7y8McPM3lHMouXG3hLsxZZeF0lH6FHy27Wz/fflbtGohT7/TYlqk27XxMze74fDqfQhfwA9T7l2niNhCzGjnH82sQ7uYaWaUIFhmuOz+0gjI5WTmFl8UEjS0g+WJWKDSw83O5X7OluV/D9raN/iJYifvZcrv3WkR0/ylrhVRVkmDXom/Z/WjddJz7HF1V4K6x4KsXDuTNoSv7LZlnNcB7dEHS1Ff7BK5Or1hKYRvjcNB/gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(921020)(6133799003)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUhMZkkyVjB5Z1E4R3g1OU9jcTJLWGNRRXlYSWFUcWVYcnBibm1iSXVNMWZ5?=
 =?utf-8?B?bWJsQllCUFNBL3plK2NtS0kxcnRlOUsremVIQWxGcXZWNW04ZHdhWVR1cnNw?=
 =?utf-8?B?YnE1bTgyQ1dWWmlkUm9OaDYrODJCVEdjNkducS95dkNNd2dNYVdIc2dsRzRo?=
 =?utf-8?B?NVZ4T1VRYzRQRDFBMVZzOHdSWnV1Tk5ObTIzQTh4N0R0NXYyTTM0U0xOT0hn?=
 =?utf-8?B?MW9ROEIvTUxOaTE0MGhZampoRzNUYUJyUmNEbkMrMkdtWldoVmJPVTQreFU2?=
 =?utf-8?B?dEFRL0t6b2pGSkpRL01qM3J0L1ZDaHUwTVozZXE3dHBTcFIxTUlYYjVicGkz?=
 =?utf-8?B?dCtuOE1zNHpGWE9OeXczN0srRDAzd014ZGM3R1ovb0xBZ2Z2eHV5NVV4Q3px?=
 =?utf-8?B?bXdUa1N2NEZ0ZEprNml1aE85MEtvb3JwMUJBU3NHV0hxaUpwbEthVmR6Y2Ey?=
 =?utf-8?B?cGQ0V2hMSjkrRmVuSWtCNkU5SXBpZDJkSXdmcXViZStqZ3lER0h0Q29QeVp6?=
 =?utf-8?B?TVlZMU9VT1ZUOExnWTMwNkFsaEVkeE9aSUowNjFETm91UzlHM0ZmakcvUDFE?=
 =?utf-8?B?b2Q1S2JjbnRmTUVyV2tvbnJqdDhwallIbmc5MWxtbjhZRWkzODJQV2xKb0xB?=
 =?utf-8?B?aDYveHhYZ3hObXM5bUg3QU1DbHUrL1BaM1FRUFloTkJiUW94STBuT0E0bHg4?=
 =?utf-8?B?Nk5JTWNoY0tzbUI2YzZOUzlFZlhWUnRPZTB6dDdUVVpEL1BkdWtYRUk3TGt2?=
 =?utf-8?B?UGdrV3BSU096alJnNGlKOGlrRFRhMXJWVlBXdWtOQS80VHNnM2lKbkVNTm9W?=
 =?utf-8?B?WXllc0cydEduNkJpaUJhS29zbzBEWWY4VGtNZncwNFIvMFYyRVg4a1kwWDU0?=
 =?utf-8?B?S1dYNXpoT2NSM2R1R1FLVEVxbnRhVFBKZU40b1hoSFYrdytHL1lLQWw1dktS?=
 =?utf-8?B?aElOYUs2N1VSdVpkbE5pYXBkR0FhYzRVREwzMFRSb3BvclUyNWhEZmt5Q292?=
 =?utf-8?B?UkozSDkydEJ2bzlRWm5DZlVUVXlzaVJGL2krNmVJci9HSi9nKzZEekhNQ2tR?=
 =?utf-8?B?Z2hnQ2o2UWVuMDcva3lSMmI1K2pHdktrcFk1TEJiWVp2aHRTdlI4YTNWcldT?=
 =?utf-8?B?c0w5eThnMEU3R0RSTnpwS0JHOWVDSDlnOUc3TVE0aFdFbDBUdk9uQnFvNk8y?=
 =?utf-8?B?bnhVamNqS0FwSWhoOVRlLzI2eGllS1p1QjdBMXBnSkhhejVTZ2puaHppK3li?=
 =?utf-8?B?Z1NiZkw3NDYrTFZkdlZXRGNCVHZoQkVWbjBmak1iSjgxSmptdEpNZkptMzR1?=
 =?utf-8?B?Y0xkZ0UvNXlqUnpuSjJISC8zbFNkWjlpVnZzNG1uenVwYmI5S1VheGc5K1hU?=
 =?utf-8?B?WUU2TkFON0c2ZDJFaVRCNGVlVjlTdmc1VXZ4bHZZbTBEK2hGU09QcXpqNEtM?=
 =?utf-8?B?YTdBNmJvakxwOFBpREE0b1Ayay9JaS9HTXl5TDVtZmxoMjdteWh6RVdpd0dY?=
 =?utf-8?B?cU1QOFAraWNSdEpXUFVQdGJVQ2ZPdS9vTERyMndxcW8zK0MvUSs5UE5Yb0JS?=
 =?utf-8?B?anltTnlnbjB2K3hKbTJsb2ZKMG14M3VjL1hOQjFrSnQ1OSthSHJ1Y3czdTg5?=
 =?utf-8?B?cmUrRysxSGU1aWRtUlM2UTFkYTM4ZDRINEFseTVjeVUzbW9NZGE0YUQxSFFH?=
 =?utf-8?B?K3lNS09WY2pJcUJDVWpZaGVpRHJQYi83MndobXJHOWhjRlV3bm9VUWZQZmRw?=
 =?utf-8?B?MjRLOFhTRjh0U2tXOE9ad01mTWRHNmt3RmFEMUIxZkFwMjJGVXQ0OENzZjVy?=
 =?utf-8?B?YnlMYnJjZmQrM3Y1a2J3UytBQncvQ0hwVUhsUFA5ZktURU1zM3NuVDdwcjcz?=
 =?utf-8?B?SFVRZDBMQnFmM21YZWM2dmdYZ0EzU2hwemtWNi9KY2tkYzhLVzhmZml4c2h3?=
 =?utf-8?B?ekNvZVJnL0tSb2Y4SGVkcWtiOUd6TkJXZjlSb3hhaW9rUnAxT1ZDSHdsUnBZ?=
 =?utf-8?B?Nm1nVXNBM1htNCtPNVdlN2EzRDdKeU55MlNXNzhtVS9pcG1nWXg5UFc4N2Vi?=
 =?utf-8?B?MWJTc05NcWpVVnBncVF0RXhRUDRoOFFteDhDNS81bUZya0UraVo2UEY2WGtB?=
 =?utf-8?B?UGllRUY3ejBRUmVBeWVtamxubXZmc0lLeFlrWG5uc3doc1dUaDVUYzgyNGVQ?=
 =?utf-8?B?MDdwcElTUCt4RHVUME1PQWhoNHVQWDFjSEdmdHk0ZHBWckZKdU9YYUg3Mmxv?=
 =?utf-8?B?bmhDNmpWLzhucnh0QVRRQUZPcTV2d21QdlArbDBZUTlDQi9IdVFQTTZ0NFo2?=
 =?utf-8?Q?E1DPo8OayrFsruUXgT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfe70b3-365e-4ac6-2008-08df1849474f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 01:31:51.9144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBiMjUdVvguskyic58faUqdx8wd6DzCPp6PbRoZsjL8N4GPFpJ4Q7zh0WsvEwyge
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340

On Mon Sep 21, 2026 at 6:40 AM EDT, Yeoreum Yun wrote:
> check_huge_shmem() was required to distinguish shmem huge pages because
> /proc/self/smaps reports them using a dedicated =E2=80=9CShmemPmdMapped=
=E2=80=9D entry,
> as opposed to =E2=80=9CFilePmdMapped=E2=80=9D for file-backed huge pages.
>
> Now that /proc/self/smaps is no longer used to detect huge pages and
> /proc/kpageflags is used instead, it is sufficient to distinguish
> between file-backed and anonymous pages since the ShmemPmdMapped is also
> kind of file-backed.
>
> Therefore, remove check_huge_shmem() and use check_huge_file() instead
> and cleanup khugepaged's check_huge operation in mem_ops.
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/folio_split_race_test.c |  2 +-
>  tools/testing/selftests/mm/khugepaged.c            | 38 ++++------------=
------
>  tools/testing/selftests/mm/uffd-common.c           |  4 +--
>  tools/testing/selftests/mm/vm_util.c               |  5 ---
>  tools/testing/selftests/mm/vm_util.h               |  1 -
>  5 files changed, 9 insertions(+), 41 deletions(-)
>
Makes sense.

Acked-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

