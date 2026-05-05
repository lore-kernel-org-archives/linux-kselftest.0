Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2B31354F;
	Tue,  5 May 2026 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980902; cv=fail; b=dag0/NdSitcFAKcr5ntYE2+/LviVYAyIvvV8LuZElRVWTXO16UClCA+yGzGsNStqGxTdCRMvmLg7cFPI+Z4Y0dG536SmEyZ1Pqoz1WMjMIOaSoR2/2aUV0Q5z91m2ZfNU27N//+T5nYaXF8XZTOYRxRnr+IEHRx4hsxUZNOW2AU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980902; c=relaxed/simple;
	bh=F0L4VRKPU80ly9LIAMeN3OQv6Q+Im7DzsIzV05WkGFw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iE7XH09gc6FnH0uZJMtPuKfOaJp8Eh0VtqaEllSONmBEn4NGEwEm9T4yybz6FE/SlGfc+AdK6PXqphaHH2k23j6DO73b1XPXB6i+7kPaWUIUrSBu8QM2jv2TseqNcbbEwBbz/u9fj4cnyP3o3myJ4/X8lX3FVdXxKsv47MgfExU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rfjH5E93; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rfjH5E93; arc=fail smtp.client-ip=52.101.70.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rfjH5E93";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rfjH5E93"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fuYnVCfE5iOXJk/5r3cjZnexyJtNSjfsMDNLKa4cJXXvYg8T3lwT6+LUuQzh1KNO+3duR1LbPpyQIy7YqBJVgXlfUnnTEWPWr0jCGxV4oOUK+C95zEE68aNnUU96NBuTzcSWD/h0f8DxSZlNFwrukH1bULYFeDt6fXeBsjtOn9MDrg9Ouc0HbazCIr0dXrEE+46ibzU3fitjq1ATm1A06QDKuSIIVcxDjxGkjwoAQM0Ph6/IJ0qnl/BxEmyngOrJRJR7gJUA8oyFUKX6RbC04v4Kb4Ut9XUoo5R6Mt3jHPCyJYbBK/gD4KHq3CQfPC/U26KvIDkRYLu7upThRiyroA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wq11h+RzUklL37MOPq+t8ftFQz+OxieClaq9V+8oQNY=;
 b=ZiyY82ZnAikioj21/aylWwOBXcO0ECDl7ziuJqxdxJlmlV0426HuXI8ESLRgAagbUs4JSL0LRev651UwhDY0bW2NI7i47RfWb+mtz/g5UzyTGsN1qrR1ovxVXaDpCCxIpExSYcpMSOvHMnoM6QA1Ixr0yn3UNcKahyPYnPL+UBUVrOmdL0stBRWFYY9yVQKUGpFMYn3aIW8ZQj+eEW3FplOpyyc0NZ4i0iPk+uSttDnKbVDuVSgfyIZCc1/uBDLjjZpVLHCbaNtW4l+yfr0Pq8gKjF90kw/odvW68zIU0MnAOr0SbBLTRiMQDrhuOFP3Z9sZit8C11zzorbx7900WA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq11h+RzUklL37MOPq+t8ftFQz+OxieClaq9V+8oQNY=;
 b=rfjH5E936AWj+QcvyYYCKOwhZBrLS4G1Wendvxe/varB5Dydjsd710IKKWU1/GX40ONmhv9R8nsv1AvnX45djPPJ6ElHHhDT5VHN7iGG6gk9OZcfMXGXZmj1JiAffFuXDfFvbEr7ab4161M0vlCzni10KS+OvROhQJLmI/XHhNg=
Received: from DU7P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::21)
 by FRZPR08MB10968.eurprd08.prod.outlook.com (2603:10a6:d10:13b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:34:55 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::39) by DU7P191CA0021.outlook.office365.com
 (2603:10a6:10:54e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 11:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEdXPD/GJllHPHCoYZB3klvGtvuohhkZNTHGD4ObyvCtxM7ZRiphj2k1PnxtzAym3KqgUmL2Jjv5l4CozM+ZDBuMZBnv3UjE+GxEQ6RbDkN1VbH7dwDQBsQnXjzfLP9w4K/gh38aYKTB6Lu+t0BedINGedF91755TDRVwr5whqniys4eFzfheetMz4MfPAoveWGpXBV8IpIeMrDf6+jt8A6DqSviwWR+a5JpYxFgeRmpTsRMAV1lu9pygGfSkL8dSPafCkm4aN90xyZ57cSAJNKVGmbSgboGQaaCQv3TU7QrGAf2du/SIvYA8W05aW/M/VxdXZvXaBUt+Chuf1tyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wq11h+RzUklL37MOPq+t8ftFQz+OxieClaq9V+8oQNY=;
 b=YOfe3K7FwTpgZMajq8tODO/6uKRh3P/upEWKlLFrXUKyVx05ZRNc6bG0tFA4QWb2tO/8D5EbMJapDn4CX+QD8UV/KbkLOuxVroEAZ72AWTXa4/ikRjZZJGd9DbL0YtXrOXu5bxc2iuCpKc6AURS5Wm+vtzWszVmZSkwSqUhwqcj4qIq/As/kKQAD16qnH9+gS/++e15+3hzu9zNpFHq6Mpe3PYFumYsNCUHheGjeTryngbn/E1m/NRYDjLnOE+MnRM9hVf1S798dILSfDugQfzzqfcmP701tUrOp+TzQ43WbD3mCJJLlLzQ+c95fxB54bExc0GJB1BK1KV2tNHhSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq11h+RzUklL37MOPq+t8ftFQz+OxieClaq9V+8oQNY=;
 b=rfjH5E936AWj+QcvyYYCKOwhZBrLS4G1Wendvxe/varB5Dydjsd710IKKWU1/GX40ONmhv9R8nsv1AvnX45djPPJ6ElHHhDT5VHN7iGG6gk9OZcfMXGXZmj1JiAffFuXDfFvbEr7ab4161M0vlCzni10KS+OvROhQJLmI/XHhNg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DBAPR08MB5621.eurprd08.prod.outlook.com (2603:10a6:10:1a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:33:51 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 11:33:51 +0000
Message-ID: <949ea84c-b1f5-4c1c-9a25-414014de839c@arm.com>
Date: Tue, 5 May 2026 17:03:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 41/54] selftests/mm: hugetlb-shm: add setup of HugeTLB
 pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Luiz Capitulino <luizcap@redhat.com>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-42-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260428204240.1924129-42-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::10) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DBAPR08MB5621:EE_|DU2PEPF00028D06:EE_|FRZPR08MB10968:EE_
X-MS-Office365-Filtering-Correlation-Id: e23f8dc7-04ae-458f-25b1-08deaa9a542c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 Niz1fEZt744c1Kd1goQdkBpyzxAGXu959aBRqMbO/4NHY36UhKNEhtnNPoQQyeO8sYTR9w51XIRcPjeHwIDeo3qJ8rDNUtkSSDYkDQ/NPB6Q3cln18X9rLiHcFvQ5x5yYoipBBTxVC1+MioAwdMHJtZfw/YvE7+q8/hi8/w3q3+vn+iRHsPVyrcGsKGmwth7AfvH5iqITdES5XqmIgJLy1FI85/UqJKxG8lFW8zpVKCUCMbzH0bARbNYKJOoK/ObOHgMZO20Manx6F10CO3dmNMZYieAaIVQkB7vee3Y6uEj2rOic0HtUF5nrB8CJCIJj7Ok6UPZinMfBlBItMGVetwIcPLoZgUjLIlBdwi6KCMd8ap4FyqU2+cpBKOiIvmACy/m9qdLKh77hyt1yxp0kewOu/EnRmncHYq9mZ8gDKQDAkQIW2YKGZssK8jHCORvvmLFJlGSTsPvVXMZxQTqC9xT0K67OU5HXeV/2XFjH00S8vP7NkOGJEvF6vQN4gI4G5PhwLbu/QcDHyH9kjMVKIGq2vImM9y51chXaW1/WCk5bpEj8jBTQaVZqrR1dpDYe1Uyula8duxbJ+5b7J8UMvrHeAiyIFXP6aFaw7IKdmEZ6WCun+HZdMNM6LEIpr67qSuoR1ELwlEXJ2JmaeBzzSaPZCK6VmQw1KO20g+T450JuJ9t7aQMYVjRVDDRzPq+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 iSfBegVGqOmY/oNVtNuCJfTRxvVavvTr5IGcsoRXPON+/JcTpu54ZRoLQfc6wuwmrduQfVYv013LYCRb2eMai+kDcBGTgcfT9XTid0Zwwu/nqz5M/VddtHGk4KSnvrUG0SYr7WbXlgDEhpJp5OXLJRtfJqvyfd2JQWdRXoLRKOELo6n9sflsGsVjmkqFjoPiB1eFbfI6x3DT8dbNUi7/2Z1wyjGooOjsirxKK4N/NQByV65tFXorJlXesluDV5SZ8YmAgN+oGBMtAfwYXLMSgBHJqAJ6YQwqPn5YxUzkddGwuRAzVw8uNqt9f+nHdnrOLOmG7gdtprvM/J43/9o1SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5621
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3c2e308-87af-45d9-6829-08deaa9a2ded
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|35042699022|36860700016|14060799003|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	c6oaEJozh9yXWyJaj4YelPVA17SdXgrTnwc1KLe4d/uxH52NIu/qZEgtd6JhWJvdpDgnL6fc/qpnr3azoiU3qPccq6rqJUoqBs3LZjazKfR7NNTL67jCOiJ9B06V1Ssak0VKqxHBUnQFXDCbc3oqiJWGfwO0AKI+3BZdBs1L66LbDeyrcsvpZPu3VbdUuqR7hHkVW1QLy2sZfMOEWrb+roiLHzZ2O3kpAASlNoQDhdPuk8HuM2IS5moIbcJl4QwK+aknNgOoqiiy+OGf9QnRfjL+QSwQ93vS/byB6YEAZCtmhvs6+zRUFKLxZLd5ae+mOODIv/CptzaNYE+siEY7wZBYtWmP322FODeFNdwzoE39G/7yWGGS70e60j5p23F/CP9IBj7tanJ1ZvfrUbwUsmzrxFxu1Pjb8tk1RXsXX2eJ6ZtzTbdHVjDmJ81ekqKlJlPJw9JAqZIFebmvXZJEbvoPutw/tBCc0pB+1951Og/LyHJ/53kYSTKlFLs92wyEO9jJcaGt+1bpb96kQ2AZl/ESEQjdPf/ZMzWsmtS7SZQSZ6vGkW1D6PwwBcF8JdRE4lPSCDy4Ndr8DPyffM4y6hs8Y2bzzGoFwQfGTE6wbVS++dKsCzl8MGBj2nXP+qZiDrXSwq5FYSFj/VqmerzeIgA8R0WaV2ngLyz2mmXRDmFHs246xKKtdDKxERYW8okuk/Rh5NYMmQxNzsyuwonAFHxKbosR1JuqJlrV/B+pT3g=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(35042699022)(36860700016)(14060799003)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hc+BkiAMxKaRARKQunkDZgtY3PEWEpZEMx9xNeAHiDK1k+nEdIlpa/raDHqQjx5cKpxA89Dw8JwVjmTSuy5quyJPoqcNtQXTxT0a68TCe1807BR6cXXlfqbdi7OUgIOtGM6NAfMycjxgTtXgy1e12fFnB7QL71SWhjNjXn8SBcmwiZE7tKm8IDegGKaSAZ4Aa7b9phkQuSrHUQ3q7mXK/KMCBv3QLZLi/D6cw4lVWQkfd/z5IsYt5z7fnTTGyvo+iqLlc+9Rp2yKDsOJV0QOB2joFH2az9ONG4U1IIHYDxaNuiyp9AK0ObU0MJ17ytUzVLNwIK4+RcTe8qHDvnQE3/M4V1u64Fc3I48a7EWVmjfEwTOjBHVrAE7STGmCsSYVWUwuGpgjlh6CmSJLYARtZ3b8HVbOnPGpmcM/SuJ8Rnw9BiHsmU6vYNqzXk523hJ1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:34:54.6074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e23f8dc7-04ae-458f-25b1-08deaa9a542c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10968

Hi Mike!

On 4/29/26 2:12 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> hugetlb-shm test fails if there are no free huge pages prepared by a
> wrapper script and shm liimts in proc are too low.
> 
> Add setup of HugeTLB pages and shm limits to the test and make sure that
> the original settings are restored on the test exit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  tools/testing/selftests/mm/hugetlb-shm.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb-shm.c b/tools/testing/selftests/mm/hugetlb-shm.c
> index 0f70b1a50b6b..7b5a5cefe458 100644
> --- a/tools/testing/selftests/mm/hugetlb-shm.c
> +++ b/tools/testing/selftests/mm/hugetlb-shm.c
> @@ -29,9 +29,24 @@
>  #include <sys/mman.h>
>  
>  #include "vm_util.h"
> +#include "hugepage_settings.h"
>  
>  #define LENGTH (256UL*1024*1024)
>  
> +static void prepare(void)
> +{
> +	unsigned long length, hugepage_size, nr;
> +
> +	hugepage_size = default_huge_page_size();
> +	length = (LENGTH + hugepage_size) & ~(hugepage_size - 1);

Same issue here as in hugetlb-mremap.c.

length = (LENGTH + hugepage_size) & ~(hugepage_size - 1)

will add an extra hugepage if LENGTH is already aligned. Should this be
(LENGTH + hugepage_size - 1) & ~(hugepage_size - 1) instead?

> +	nr = length / hugepage_size;
> +
> +	if (!hugetlb_setup_default(nr))
> +		ksft_exit_skip("Not enough free huge pages\n");
> +
> +	shm_limits_prepare(length);
> +}
> +
>  int main(void)
>  {
>  	int shmid;
> @@ -41,6 +56,8 @@ int main(void)
>  	ksft_print_header();
>  	ksft_set_plan(1);
>  
> +	prepare();
> +
>  	shmid = shmget(2, LENGTH, SHM_HUGETLB | IPC_CREAT | SHM_R | SHM_W);
>  	if (shmid < 0)
>  		ksft_exit_fail_perror("shmget");
> @@ -78,3 +95,5 @@ int main(void)
>  	ksft_test_result_pass("hugepage using SysV shmget/shmat\n");
>  	ksft_finished();
>  }
> +
> +SHM_LIMITS_RESTORE()

