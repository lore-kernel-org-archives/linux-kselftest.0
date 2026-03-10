Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124E2BD00C;
	Tue, 10 Mar 2026 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169723; cv=fail; b=RFrDTKLBRW38pOia2ECKm3zPTw7c1bXxWbXl/qmWgGPz2yz0NPQe3IN6eCzDiJvPwdAE2wFtnGdZMxVMqBFe8+wruPubAPhuUpnB01R29JQwrhCKXZppD5EombYh/pwxs9ZzD6c4mnf/R+4C+2EyPDtoArve7YAp7coVaf/rgQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169723; c=relaxed/simple;
	bh=ZWiqkUWpqNhPvGqejTuee1iqK8T1r+iEbRBOl88y8lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rL51pzxF5wy6VfsfATtyJkX0zuuDqdknsyLCuPwh/YCl3NWW7iAM+tXDIYcLdufcorN9mn/prQSi44UB/h/pi4JhoGe+YoPzFxhCz0I1ZsPyoAhU5sWOJT1faqFcFs/p8ysry412tok2KPjpK65/6ZN6WMJuqjrS4Erm997HADs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AqV/5lXM; arc=fail smtp.client-ip=52.101.43.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AqV/5lXM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebqYd+lv1oAKxMaHIhg6s7e4Utobugk0bHVi/nUprAArlvrLNXcES8rCN8ZPsdANJGMukZ4T5gfWkxXSF7w/1cyA6XvWSOM6k2Yp7PpvhW2JrCA0KjwUy9aGd6jqiYMr7SnYnY67fiSTktxYzKwdG/yjoBAC3+BD8fIeA7p0S+2Q8jrrQDvmOVcy5jyXyDVFzgSUIWOKKdnU/Vp9A5OXwbqo+D1WeVIAD6F13jTjgb+4QcXWmmAGqErDDcG+btBxb4sceC4JKcC7Ur3vTXKJZFyozYzsVPoYbiSgjVbjO2tT8GQ38j5cPR9g/HJK5xw2sXbUu13Zi51qNuKGLmXSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaDBAflTCsD2zeMOR01gTBtR53M4oFh0PF5obk1a/y8=;
 b=NCluEiW5zV7OehvhnxOzeXBhMFebyDBqhaqovCnVrOw8lmIcFk9DyJFFm/XR6Bh49KzJu0UhK2KxQtH8C0Gc7qJbjV2k7yvfmm+Z0jxYmsURoyH+DR9zvTsKJO2Xx5Z4rcZ5Jzoz4S1nHcyprEodVNoFyTuDHmFGaV6+HAkKsi6KlgFKAIwmsQT/ixzQYZJqR3awdLltHoK12cvSygdU1Lh3FLtyaDb7alXAtt7gJTDJGgkRRNRDvSkWh4QtrVVo4bnDUeP396P9a+Y/Xf/qBrcWj30SQMo0RRYotGaSLxK6AWIjZHzS4tXf+xOUxplt17hmagBr62WkaiWzD3eYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaDBAflTCsD2zeMOR01gTBtR53M4oFh0PF5obk1a/y8=;
 b=AqV/5lXMrVh4zC6wojRLSgFHrJzhQdDuj4+5BH+GlxLQAX2FVpxIbLYRfzMVGr0FZfrdLOonvVpTHdvj4kOLkdWaEBn1dUUnDgtrer6L2ViqtyXXWdGf8L0OqJmb8V3wrs+qPNvJ7H78P4BkyD7R7hW3yv0t1Awj/7bYFIwS1dCz56rHobjnVpk4BKDfny76qeo0Rzdr4WtACXMpw3wWulV32BqolSGGQ7yQ8cB+cWYYYNoYoitJ39eGGLNbk4P3w1W7plO4y7Xm9CrHACo1RjcYtIGMdqwsKZ+7hwXBhT4rEKUD1TzU3zvsn1TFxBUnWmDPMXqb+K+fr05DYJgU0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:08:38 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:08:37 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>, Liam.Howlett@oracle.com
Subject: Re: [PATCH 10/13] selftests/mm: skip uffd-stress test when
 nr_pages_per_cpu is zero
Date: Tue, 10 Mar 2026 15:08:33 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <64282EF5-A73C-4D20-94D4-06D2377169E6@nvidia.com>
In-Reply-To: <cca7aee2b9ed290ed1ac231edf2c9451e01ca204.1773134177.git.sayalip@linux.ibm.com>
References: <cover.1773134177.git.sayalip@linux.ibm.com>
 <cca7aee2b9ed290ed1ac231edf2c9451e01ca204.1773134177.git.sayalip@linux.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ddb578b-0f31-4bd8-c24e-08de7ed86f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	/Wc8D2tHWNYla1F54bTaH6NsOx75/kSNKCrlUc/aTPk8lq2zNXoc6G0vCqf4pHuMFIZFeePlSz29uLwH4lexvjhnA8LTeoc/FcjDeW8UqYnjpn+nRpeVfFO+4Q+jHDZTIlf9dYoP2DZJXkkbXSUwEIMj9HqWGE070K7UygqAzmD2w9sDRjP04N+ykjtyp26/THzWOjeqmepKqWIz06nfzq7e38WsEE5D0+G8+lFSnQWen0Bglv4GOnlS0662EwZxWFS2nEuLMEGsySW5snEvtcUJQW1vi+t7nH8yY5zx4kcSNNV90pOZp4NPo4mjVv4394sgFAhYc+Qw0odHYQm2TrjtJAvCs+V3b8IpxWnDLVoqX4jYX9J8bYLZFmuNIJ6Cm7SXbKjRinq95hLTNQHgb8p1/NLEHmsj9UEggEB5RDSVRTLz8uFw7+3B2uiAITdNTsJVf4zN2e6xVloD5NSpL9h6bLaoT6z/4PuXdPFVEt5AoHECmBodYGfl8Idt0wwUmsUY7PSQWIAg6JJfzJWMmx09W9agQfzpz6L4su/kY8OviE94ySXbCJwNLSbxHIdss3vDmGjkSYh+Pb1xxoi5UYciLq0wNjeIo+v4Q+fwusHvYHxxlq2Xblrzt6xahYI9rF2G7O1SU2QW+TxvsdbMVPmS4SaXWRSh1G+QthuSOoB0DVMuoYYlvN1PwfaKWPmSq1ZRGjwrMb5p+Qc6W3NTHMMtOfgQXpe4cn+jZKrqmS8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2XlcQAH1hYj27X+ldfDHBF3HB3QOul9HM0c1NeFZa0a4YFh1qIl9SQ6wkVGO?=
 =?us-ascii?Q?8m0DQhGCNu79Gv4oMO7ot9Td3HwyzLSkF+HpDWtHl4TdMTcaNXlyBn6FuCH5?=
 =?us-ascii?Q?fQ5k+z4RTM9sFP+JN1EKHuXqMQvWw1WGGDdBP6EstVu67m09vROCA3e8hcBx?=
 =?us-ascii?Q?ZYhiXTzr+VdeFoCP4YR6SXrcqLSk1RK0JMl95BqEqiqoJNaiepBstmL8Df0s?=
 =?us-ascii?Q?snvYAn3qdn9CyjrvPwgnH2/MmWKMwRG95c529XQHFVC7vS0jyj3HKQzjxgAb?=
 =?us-ascii?Q?oymCIvIcgVucUHuerZ9ZPxjG9m91Mc/o9JbjAx28hND7uzkK3xFIypASY6+9?=
 =?us-ascii?Q?aUpQTMDUaA/Kt/TPgUGyRoY5Re6Txy9B5j0wyJfJ+IdIQM8LB+aEY6409+Jd?=
 =?us-ascii?Q?MLdmUM1HZGiyA+9UAg83ouUFpPsClnXV3+ZeTeuGFhXUkNhtRdPu45fppOw4?=
 =?us-ascii?Q?BOZDr083YQfevNM3qvVdOn99mDjcrW0sECecY7Cm42hilgcwxv+sVh84J9I5?=
 =?us-ascii?Q?io+9CqYLRzPQE1+UQCVbTbb7dTfm84D5/pJd3PHZ64fI6v6RyWwWI7aE2lv4?=
 =?us-ascii?Q?Uo5kJ7JWSW3aiIoH1csj5U7LjV7rwdE4EnDT7tp9ApgK6TUhZxRToGsODjIC?=
 =?us-ascii?Q?HM3bRNvZ+giG6976gJjEidB/B0BJrrj6e7qoyOr0kkl3hOSjIQACOdiYFS/Q?=
 =?us-ascii?Q?ojL43ovgCvOmXjAHfu2xwNZhihDvCCN3XfkBaCpnB3xjxflvg/cHWZ/cUuxt?=
 =?us-ascii?Q?wHTqxgwlE2dKppFJYJPDbNbASlEjXwErH7y6Ii7G1l4wIRIuIUo7UcDKd04P?=
 =?us-ascii?Q?hIn3RKyjxyJLT3eiz0/GqRhjDizb28dtS7epbk5ILaAdbsZkErYhvxB5+FO/?=
 =?us-ascii?Q?tzk+sL7DTcXsZvTIbRFcV6I9zqdRA0Hro0l8HVJcPtaBGoxvIHSbAxWdNUm2?=
 =?us-ascii?Q?5JE3oCJvKzADVJ92Ex5VnNXfa5dh/c2RtYz92xZxeHkbL2tYhgc+Ru/VFdQI?=
 =?us-ascii?Q?CtYCxBHmQKQHfSqur86+DV9qjt26EOYWx5vjb9GPIV4ZUAZbOxoKdQv7WMoP?=
 =?us-ascii?Q?ICNCvE0YX1SvGdQDoU0u5OieO+B65uO5wbJGXbBHidGgJTPr6j/p9yXB36S1?=
 =?us-ascii?Q?EW6RAZt3X0bQvuNGw2aJwO5Ia2haeOkQ7BiOQRYiPeCCY92oIWBt+lHpS/oW?=
 =?us-ascii?Q?/cnF3DydwuJDgSd7DJffwEhmwfnan1aG6injNMWIKBtQBu9SmxEv8Clf9t5A?=
 =?us-ascii?Q?Srlx9cb/om1t2zLhAVyJx7tEUbq6PMEgOg+E7w+R4qD7bv8mO4BzFmHeL49A?=
 =?us-ascii?Q?mi2a/lcLGDKd56nkPpYGSB/R8oob/bFlPuSIAj3jnn4jnmzWHLKTy4cNarDE?=
 =?us-ascii?Q?k/+lX36f5/PMpqYb4KDIM5nxJw3DNS30SxhYE8Io2wdx0rYy4xCbQ4PJRRS+?=
 =?us-ascii?Q?+yy5E0liiXaU3ydWV5FQQJFrkIpc+11cMhF3zBatO+q3G5PqO6FtdqIo273A?=
 =?us-ascii?Q?NqMj3xmbzCeAkNTopelLD3nG83KpN6R7gES/POIvMpUhdNkjza4EHcdVv2e3?=
 =?us-ascii?Q?u1Skl5GOJl1dF4QbVAh+6rLIbsTIhq6I5z5zptZWVC1U8HNFvkdXHVG3pkC4?=
 =?us-ascii?Q?GMoIHYzVL+j4ipTnq+Ra0kGrcbCvkQiOIqAnpmV85+PAI9xqDGTs6IpAfYHl?=
 =?us-ascii?Q?A0GoH3iRsKnLzBotWFk6YsxEZrnDJ8Jl/n68oZk/hcHTZUvcNo5vxNFkgTNd?=
 =?us-ascii?Q?GkzipIQdxw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddb578b-0f31-4bd8-c24e-08de7ed86f49
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:08:37.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t94cOo/D/sZzjQq4d0xXVXsnHb41T7YyVgIR4avMODAd8Y8Hs4Rb6/aOL/mi45+d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152

On 10 Mar 2026, at 5:49, Sayali Patil wrote:

> uffd-stress currently fails when the computed nr_pages_per_cpu
> evaluates to zero:
>
> nr_pages_per_cpu =3D bytes / page_size / nr_parallel
>
> This can occur on systems with large hugepage sizes (e.g. 1GB) and a
> high number of CPUs, where the total allocated memory is sufficient
> overall but not enough to provide at least one page per cpu.
>
> In such cases, the failure is due to insufficient test resources
> rather than incorrect kernel behaviour. Update the test
> to treat this condition as a test skip instead of reporting an error.
>
> Fixes: db0f1c138f18 ("selftests/mm: print some details when uffd-stress=
 gets bad params")
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>  tools/testing/selftests/mm/uffd-stress.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
Makes sense.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
