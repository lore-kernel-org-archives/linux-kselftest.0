Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10464B7A4B;
	Mon, 21 Sep 2026 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004730; cv=fail; b=Grw0aSPzCiGR/LoFOn7qjPUtERJVHmcuf5mRC+wYor3x9Uv74d+Woeoj+D8Y3fxq5Qawc/Hvs0W1jX8jfkfyr1nFY1qJEZ8B2H1QlgDaID2/rymiVuiAC1L3MbDNGoCsZAYSTQhOCsmOYDU4CYBAq2q7ZktLrZysTo2dT4m7azk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004730; c=relaxed/simple;
	bh=++WFbHrfYPSKZWb6+Jmfl/uu9BquAYo39FygkzkAuQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VvVvydl4YGNNBMUTYQghxTB305qsRPRw2RErPhx7GFZMP7ABYJ/vPMQJcCGXlk04lAdHBoTz4n3fB/9+rd9IaiVp8ONoUU5+NDrQ45i1hEWMu8xb3dfLj72duzwhzKxG0E/yPO8rzzBS61tZ9qvAZwtCBOqrkMy/L3ZRuHGjPXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g6vpwVn/; arc=fail smtp.client-ip=52.101.52.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g6vpwVn/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT6eL3eHekUNo2dUtwCPh43YouTqjrkflsHvibXPC643Myb6x4214AvnjTw/2/Hu+uVK3/SyhZ9BypMeL62ysGWQzEWvDlEoUMq0z8KzyWUrI76XVasSDWlqo2P0OnSnQdZVmojI8gA4exCEPU/LMi67V5Zb9tmZasb1gTU+8KCxMuST2ol43wMtMSdbQxnlk4O/3AVczhEILcthgCqt4OTtypL6AUNpQYZ0rYUKQdgEfmaYujeLX+gRyZRTqIKz6NT25rEgwwCDVnie4mK0EKobDnzCWfhavq3HFy+meXo9DLkcV6i7FgWTT+p75VSEEpH62gzXfo1zzwT3hqGT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZjEKgc3Yu8PIEmMN0Z1cauU2nv9v9VMk97Vtp/i5W0=;
 b=mUKgWFvRGNohNaLCVkZE5EuixRzceG5bXt364oMeXncEjfyBpHWjFB4qZbIOH+U2M45WvjytXJQ7wZsm6R2upx3TUL8Yc9/gkGDRbrCyFZeKLA4GawtvYb8JIwEuhDxJh5ig45Gu45Dwxkhh4jqkmK7HDCNTLZAY1mOZSLVj9eAxNPNgYLheNL0dgPlnJe/oA3eRzg/kzUo29qB0i30X0YZdeFxtRF9rEJ05iRniGiKTU2DCMlCrQ3dJKrxUIX5kB6JxPWO7HoYZ+HVZGgdGSaKwkO1eS+9DNTUxnFIRj7YansfNPxHodlK8PFr0QeCYlrcgDh8koN0shRkHUY8cdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZjEKgc3Yu8PIEmMN0Z1cauU2nv9v9VMk97Vtp/i5W0=;
 b=g6vpwVn/BCbqHrCpVZJhnWOH6wh/prjNUk/Lgo6Dd+ThPT40ly5gXH5k+lCXzRxaMyLRslKb5JLoDqhXhAZgXIs4mxr/5B+3HXC+w77CwEUPhNy6j7dDThkHwyCvAE82VkTSjsQatS0STn65HQRAzB0+K2A3289ASW2vEaOdE6eSYXZWMp72D+98OieAEi+EUwFioLwsSfS4HuHMeyznvGEgNEsa2KaRHTuhB08BFDhf/wIfvd1VcNDJNv+JghHMA1CZzs4N8So+AZ9VhvMO2Xuy6GQ7+MIMwO86tGlMaQs6YQSwqcVEoF3L8QwxuWbJ/1pY9WTKl6h2y80skf6ZEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH9PR12MB995114.namprd12.prod.outlook.com (2603:10b6:510:426::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 15:32:05 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 15:32:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v4 3/3] kselftest: mm: introduce size_to_shift() helper
Date: Mon, 21 Sep 2026 11:32:02 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <7F0BAD51-7A2B-45BE-A773-6C781AB6DCFD@nvidia.com>
In-Reply-To: <20260921-fix_hpage_macro-v4-3-cdea4fc6ce3f@arm.com>
References: <20260921-fix_hpage_macro-v4-0-cdea4fc6ce3f@arm.com>
 <20260921-fix_hpage_macro-v4-3-cdea4fc6ce3f@arm.com>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:408:fe::16) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH9PR12MB995114:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0a0ab0-8836-4ba7-13a5-08df17f57d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|10067099003|6133799003|11063799006|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	XJMs5O/1WLhXbelYktGH4dCyEfCA/p0UGImZU6hS1o30cAnFWvUhHWqtwwc2BopTVkoHwOLx4X2qwR5cda4+9pO5hJtp0uto69YTR5xyqkkXS71ZLVaJ3SIOtE+v900NWZDtlCy2DX2OGPiebY5zU0xvF1msfOZo+Uz8U6qfmNzNfA/AkW5q6u8WR3nScckHE+KJlnxf1G8cDeyEid0xX3Whm9eyvApoDX5qj5sIBECbyMkwXHuXqcTBKZ1Qml/qEBd8UsHbgniwaPx459bGBmkE+e9vvaa2x9XMwN08cffnpAMJ1GFRbycVwbMHlPfLbYqQTIWRyjXnbwcWRmVWENNMPleXecFx2N1lGw7loTd3Khqlm/1UotzVj/tAIz525LfLcctfuxt4q3wK+1zmK3RQG1fkEVmqdscZTMGqafj2Jh7ROCSucsTx2KKleSdtyoLiOX4RSyBwUC0suyKGLKBCTgRokBSHuNJr1+Z/Eh4pa1z5TQ1i3Xl7jw58fKDkcIE6BEeNMvsriwvDKn99Qb6WaNicmXAcStKvDXZozKPBsaCrCiJeZR0cjl8BpqT12mjN79w69DNTWTwqzbK9Vjiq/EuzcqRcwAWJMs3yHuzDTr6ykDWMCP4rbUWeRApH/+naDlykqVraDfNM6JohJ3QdRfk5VZUB4yR7BId/+zk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(10067099003)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dL8ebBXeJdnxGBsBwVQKeIrKxJayt4R+2drMZbBaMmYA3rfkfNFlutKPttSs?=
 =?us-ascii?Q?IwlE4axiIt8/PGui89S0uCNO3hT10ZLgp7ObE3vC2jyYFezgSmYLQ3+jp+jy?=
 =?us-ascii?Q?GvURKisQsI+EbccYXNFSsysfC5PTVSgRLx3WOeNc9sGR0/Me53srTDdaaW+k?=
 =?us-ascii?Q?NuhTrQAV4rrfRRAqWCapJxBxWhzIBOq3jKQmMIp2FZPoM8OPOzAX3E/jA19P?=
 =?us-ascii?Q?s3Pcq8JhU9OUMjaX4RO8UkS76N7xVTOEpbwe1OoUkWGQvq69VuEpCiwWiic+?=
 =?us-ascii?Q?yIUcfW4RP9hPlxZFWrBLLFMQFzPJXcVSqaMLRJ6kyLkUjvI7H5SWcrGRyY/6?=
 =?us-ascii?Q?OjOKrjW1Wv+10yjysJuUCDPL/GA3vAExj3CAPPLp/eFF59S7wtKaSr5aHz1b?=
 =?us-ascii?Q?+MZoHvKF3u5PEpN0S7fsdiB57JQFjGp6efjToCcxGcBsP0mizRr3e71y5jlV?=
 =?us-ascii?Q?RNB0WvORpa9+uDPZXKv7bDfVAB2tfAhfsuR97x3QodryLgPn/nEo0TH0ogAO?=
 =?us-ascii?Q?wQz+t0MA8rXQD+7WTibnfC/XxKbJDdXouVdrqkeMcRAnafgvCbliYAMMmuNR?=
 =?us-ascii?Q?bLhhEhadWS1y60ukraLG+nR2zbsUhmJ56akAXfFbg8bRp1B1/ro/zhsF2IhL?=
 =?us-ascii?Q?VNTWhSfM+mHid5nM2fSncF7SIYQZR33becfpNPmlWqzfbY/Bm8esMnTc7oAI?=
 =?us-ascii?Q?GGFrvvXXTvE4NSi31fpazt0FZ72alwarpOm8vIPovp9pkcAX+SH+prui54Vc?=
 =?us-ascii?Q?JOUSbq5vA4xYFth5V1E1a9ZUkCr1J51GMU09KQ8GULVcxLkZLJ3T7yUbfEmU?=
 =?us-ascii?Q?TZTJFfK0UEO9cgKUDZeeRaRY6WEkOBYjJZbE48Mx21Ld8miC5iD1ftwF08Vq?=
 =?us-ascii?Q?E+0FRvcCCNe78YKnmwq+nY/Cs37SVpQGlwkj0SLnz7xRmaR0Vn8dtlP3vaKm?=
 =?us-ascii?Q?AtMfuEJEHiBKWv9OlzJZnGh4774gdTJJ6ecEXi/wGzy8s9ORkMAfJGsLX25A?=
 =?us-ascii?Q?dk3uGQbnTtLSpJpj7bGxH0H32+HE1ZUjgJ71l1Wd3gNA6UYXir0vUFbu8X1t?=
 =?us-ascii?Q?wMrgI+GwLcHMxQtY3fd0QOc3YicMkkCPoSGk/UzHOybpoRIH+beJ6Zzi9G2o?=
 =?us-ascii?Q?JKRwen8EleVr3Ach0B35k6Gkmg0xK/7ao0hu82zpbScXma1Q3m2vU+sfB4rM?=
 =?us-ascii?Q?x1DVpl269JWM+emJ/RDPBffTqn4bEBT/oDPn42oILzhjEAop6c1T1gK0ZRPM?=
 =?us-ascii?Q?gq/O10b2pq1H6oIYUDAihDOoC0/tOTvbOqqhzMVz+/nHGHsUeRZxU7ZGzwT5?=
 =?us-ascii?Q?JAS93Lf5xBXMhzetCABDlcRvbgXWS7Hoy7sxPJJHieNf4Q6ildmyxUnnVzPy?=
 =?us-ascii?Q?KwfAHBmp/Yt/hhA8LTwAPxinpX5znwVeLkLUtpLMQ5P+h/90RdtlEjNN6VDL?=
 =?us-ascii?Q?cuyYOiT46bsnRj8S/qT5fuZlP/2JIuIrV5jMTLqUKesZRy6TiutFmYFlJHxW?=
 =?us-ascii?Q?3J6ErL0xP2wUGOmaMnjVgHwJN+7zuZVc8oLYeF5kXN2eb/SesTKjEWBkKWwc?=
 =?us-ascii?Q?8ICAwGWAiNgjlNLyUIqYTdqm0v+yoXp6BLbmHuAGJsUvdSkSAluoDebpowQB?=
 =?us-ascii?Q?C7ami5Zk/KKWwMalJobPSzy6Qb0T3Q/kANHehwpneypivO3bc7I73DDAqh1p?=
 =?us-ascii?Q?esqJFNtionLWjRPeWRgxLpHYzKeOLNFLB2DPMjrL0RvN3/3eyoKnm/fUDgW/?=
 =?us-ascii?Q?HMFnZDvjyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0a0ab0-8836-4ba7-13a5-08df17f57d55
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 15:32:04.8496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV0t6xGcIU2EGt07EL+cHT1CJHSlDaGWqphnCKkkjfs2eYAwVx5Ts3hV9w0AbRco
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB995114

On 21 Sep 2026, at 6:36, Yeoreum Yun wrote:

> Introduce size_to_shift() for future users that need to
> obtain shift of a huge-page which is other than pmd_psize().
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/vm_util.c |  2 +-
>  tools/testing/selftests/mm/vm_util.h | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
