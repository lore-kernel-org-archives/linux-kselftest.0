Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D7288C96;
	Thu, 12 Mar 2026 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323938; cv=fail; b=apZCm7uoK8miExjLPtaclFYSSxP3VS4l3wAJNYFrGGggLi+0lY2w/0ZxxYStdL5I/N1HaP4Q5oJIxAkoPQkySrXVX4nsBvmDWp4iVn5cn0AOBZzCKL9HqnJsdkc1WSZYeGGyTZUcQKaOA8bwOnRmVy671dSuIPFXnuRTNQZ/wgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323938; c=relaxed/simple;
	bh=4AOmvw0HBUCufVVV7TwB4jcYLVs6pQEjq/OEORmwK38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ady6UNMorkboONqZRTDcVJGXEAI5B6ZtHkLOs2p2280qqeRMDuidrpqFaah3qNH1/I33qfCPAO7S5bq+9NIIzphF/k+dflmst6Y5hzHAuG7ze+ItHo0GbAE/yj7DkH+dT5k+dTJ4Kk3SzDCeVfeQrLh/C7sEPENXQBBEuQY0DRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O1YLsZ4e; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O1YLsZ4e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwUKZ2XgfdlmNlCeVgcjPkreGFRjTrN7a8hXUdWNKeY45nKcbWr+ZtQltRvsSIIep85fP7sG/XN4wZHVnmLLwo56PgE0kmEYVY07WRmXpG1Nnrw0yW+4QQG4FjhR8fcfMTJmE2emNIbT1pv96gPecuLPgTIB//NCOfcdoATgr/RJAqVNLboDu9m8PAOsZ8NS3Ir8TCmgmHS/nN0Cz0Q2gg0g1pNIIh7OfAOOjcgDnLe2qRLVQPXIa03TNBwjdjQSrxrwtV3QA1hGdZh8YXIdWSCKQ0wG/6JzoH87yfMl83g7I4DUNZaD/cMiBRTDYj1sMInnRTrsvBCMUGXtILUrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p1WDLhW6nkyHlFuiYNPxpYJwcZ7iADwb2A1l8LnhhU=;
 b=lDU4QTbWFWxXT3nIj7XrweWbVpJxX3TnI3n1hI+tAD/agDJjmvJjzDeic5XKpn8GqHOC14NAlR4CW1daDV/bE8VXWLccwIo33tR5DdThkujVsPHZTpeuX99LusU78AJydviUIms5UE6UvJbecaM9Rnty8zVjrNzW0vn0Xz/Gt+nJNT6s3SK/+U59C1lJrbTkOWTN36UQn4axDH1AkmYC9AL9NElFoSrQOSy+iBP8bgD5PTaumUM+Nrl3dKCKfze6DcXeYesZ1cXj9PF+xBQLEEmsfnoXz3wMtJc6cFfQRpbXL7EN4Z4DuLSwHbQyXhUFLGx2kPU5Zbo5Ebx+xjJqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p1WDLhW6nkyHlFuiYNPxpYJwcZ7iADwb2A1l8LnhhU=;
 b=O1YLsZ4e31kTmfyi0EPaxcL0xZsWj0cCKB3dCivGfn63SdvN7SvR8vUokbPTKw57+T0ibGBE+lUSaDWBD03+mPaDkkJLhf7fG8Fmc60S3sI/PMVww3/a2fKCjXqlq3EyU/+w0w28HLo4uvX4VYj9DXuJL6yJa7Cz04IaNOx1T5wAhJF30aieagrGn9kHUKBnHFDfLsSOKkYhZNRQpS6+VoJnOgIUO1ii5iWlyGH2kZoLZCfS/PMtWlQB2ER8SClZKpNV4VuT5xWliM/sFEeIWi0oWvmupSsdR1VkTs2uZJiY9Q+wQXpP85AhvUAA6tFndH/LJIBNVU2bzVUq8ZVoPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 13:58:50 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 13:58:50 +0000
From: Zi Yan <ziy@nvidia.com>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 1/4] selftests/mm/guard-regions: skip collapse test
 when thp not enabled
Date: Thu, 12 Mar 2026 09:58:45 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <E105C649-3F37-4AD4-8B3C-2AA06DE8DE5B@nvidia.com>
In-Reply-To: <20260312114027.634559-2-chuhu@redhat.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-2-chuhu@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e0279f-25dd-4d3a-dca2-08de803f7d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	884+MTmTOcYRp6vBfoc250SpWsStF632YuI9vnFRFZyvSPR5MMU+pEpSrx6/y+3loZwdp4aVsEIx82fsrwltStSSBBi0ioG1nxq84V8thF2paQfFsDRUclWgCiBqC7PgWEdtkkhqsuc4klrMBWINh/PxBCZTS9SjXBWZDJGPKyXX2ML0P3L/aXb55/vUc/oXJlrJJWHGMkU2zLxMUA6QEbr8L7TtFdGUgvNztIOB8BeB85GgO+fGnrKa71Utd4eELI66aUEpH56AUavCcfrXjsBvq5ZZ9Vnfa4g4WGra3B+M+DclO3GGSN+vjWewRLPyKnLAgWMRQC5lkV/2Yv6K2AslAnuuxbaQ155rd821rQ6TYZLtKj8M1ajXKO55Qlg6pzdy9+1BpTqqWnagIEppB5UXGg01U9yETrhv5nik8J55rA6MJujW/Xquy+rbFv+LZJ8XcW95Gh3KwYMaMgzUOL0ZhmXnc0N6+EK2jfAZ2h8zeG6X/osoE3yMkbSqbt8IZ8S0YpIkATdnxzZ++eXvbWlTd8Vp5EMMdUArZ5RnYbFuTuDKL8YmfdT55aSE2qekoy13SRtm/9ImK0KCAl7GgijlV73mGaH/c7SrJdErzGWnyY1oSpuzmN8GViT4zxS+JDVmJA2t9r9jYhNc7bQjxHpYAfn4EoMI4XmtI1eZRahzr6YgEagmjBWIjPEbjhzdpPPVsA8YKU8hopG0k2kc2J5dCCcKBwhNE4OnfeBFwBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uAQ6CXTMTEMdAQvTP48u5PV9nIG62lOS92PEDSNeAGyIxLmoh50y9QljHcS+?=
 =?us-ascii?Q?kYvAaGEOLtQYlPSwoUdHj+BhUbzGMZSEG+vUxr3Iq4+fhc2J6LAR5w8ZNRoY?=
 =?us-ascii?Q?gsi5yQ8DBMtl5TXZpSQ49EAYuJCyVVNWF+2XcR9T6chIOhbtTXciSuv08ltb?=
 =?us-ascii?Q?828MkhxODNEXwQvdYr70sDh9jOnODsn8WteBYMTAyPZ52+EzO68YkLCFoDfs?=
 =?us-ascii?Q?guTcM9Tq5LICqKEBGTKO2fcB8QxXxVEySxkDPzJiR7yFaYu+6qDYRQiYlfox?=
 =?us-ascii?Q?d1Av8MYzLn1kS5T4YiraQMqPbyv+mXyhKEHRynfudbPQuD49Ii/PL2BqCr5X?=
 =?us-ascii?Q?x6O892/7yNSmRR3tHQpljnGGvVCke8Q5slImoMX6X8LH6XWOA/LT02TFhPd0?=
 =?us-ascii?Q?U+7DObz+49tK+Z+uMt2ufrycrrl0m45/pBy6nNnvqloCmE4q8cJWLTr1+zMl?=
 =?us-ascii?Q?xK694fVb8BJfB+iWi2DHMx5VAe9EhtXHPQsPncEuHWS/Wa4sXivzJpgSHRan?=
 =?us-ascii?Q?bVdH2MES89IVzduf6ZGjzqQhG5RjBiG1HGFjFS9qhLcNwXs2GxLVmOtR8hgN?=
 =?us-ascii?Q?in7N1+xTnFeN2d+fJtJsOuBdeNicH8oHIw6ztEk0ydbRVWon8Ejles6LuXPv?=
 =?us-ascii?Q?TU5kXIDyr7EmQ6QX9QT+t+wDe8fWCZUAQu/P4h6e0M+Ut4gaI0EJ/nkADyHM?=
 =?us-ascii?Q?agHTnT4wULC1EA8vc8ZVOO9VI1HdL+bMwTDX6WbS7VCX97LM1RKsq7a4A6j2?=
 =?us-ascii?Q?cIE397ImWT2YBwGQiSZ+GJ3HwMaroR7vn872XKW1iGt+MhLdmjg6rxf+6Y/5?=
 =?us-ascii?Q?JXU9TGlbFTCw+q9sR9EBuSh1RENxCKweYSCDwAGqk2xEuatgpwhchXCK3H+R?=
 =?us-ascii?Q?VfWq6stBil7hgdhiie+TiVYg7aFpNjqFS+VknP/e5YxOJ6ZZMgiG8563JH2j?=
 =?us-ascii?Q?XDYIRAr/giH5zs4rynh4b52HpQLha2rAg70JjW2BWhKSs/vlnD+0sldSLUI7?=
 =?us-ascii?Q?+j8pTdHW7r7e/mLjN5wcmP6TAB0Gsi9aFE9BzVY+FyoMCYicJThrAZaZoCov?=
 =?us-ascii?Q?tXGFvj7LiMdWF1yTPaSTUEdm3fx6D7MG+tdIg14aB18ekii6a+bkVWv9gnHx?=
 =?us-ascii?Q?6KBXyTNQCLnWa/wXNLZDJv1ZW/GD0btZFw3joxir5+3ASJtrDS8B6TxUz4o4?=
 =?us-ascii?Q?TiHI9CC3BbN8JB2BBYpGBhfzYFF89shpwMPDoBv1XDS7QSJ1rgqHtMIAjwUW?=
 =?us-ascii?Q?xrTnuMX8/3I4+hgmdfEZ7Nx74LxTZ9nmq7QsNGgtB7KXgGQqrOIFgLIyDm2t?=
 =?us-ascii?Q?5qiMLTGRgo39QTm2yrHvd3tkSqJCwPHpfs6ADljDyN1YEaq0coAs0clYOFr+?=
 =?us-ascii?Q?liaoIXqEhWr2EgaUcs2oc1fgYcG2wHzdRCNskod4DVOwcCGn5c3PODLlyCwM?=
 =?us-ascii?Q?BdgBncwZImU5jYCXNuDIwOLjHskAp7tB0EE3u6C5CdMvC+dMfC/EOXECsvUL?=
 =?us-ascii?Q?eP3HuDHmMEnnlvp9EOpRbtjzPLrsCW1dZS3yWkTlUk/090EeeD/nkQPfoU1I?=
 =?us-ascii?Q?kTF1364ohSBSWCRzHmgJDl3Qj2ZrlIlNSMEo3PgHczDjQo5LXDuCHHe4VHvS?=
 =?us-ascii?Q?Z1UICn6q6pDT2CQ9T3kGHvaVXp0t6O+wtDQiyV6UJKOT9fTywE6PNDPQg3NG?=
 =?us-ascii?Q?LYU5ef+U8vl67vAC6uY93vmOYV6kw/iZmvZ4uUnIB7UW6okwJrYK/ufqgvm4?=
 =?us-ascii?Q?2JhiMCghZw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e0279f-25dd-4d3a-dca2-08de803f7d10
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:58:50.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5I4DkWU7CDCMD48+2SUlNJybXGQ5X+Wkad7n+aOJHeDgecTekH7gBpxH1thBRks
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490

On 12 Mar 2026, at 7:40, Chunyu Hu wrote:

> When thp is not available, just skip the collape tests to avoid the fal=
se
> positive.
>
> Without the change, run with a thp disabled kernel:
>   ./run_vmtests.sh -t madv_guard
>   <snip/>
>   # #  RUN           guard_regions.file.multi_vma ...
>   # #            OK  guard_regions.file.multi_vma
>   # ok 89 guard_regions.file.multi_vma
>   # #  RUN           guard_regions.file.basic ...
>   # #            OK  guard_regions.file.basic
>   # ok 90 guard_regions.file.basic
>   # # FAILED: 87 / 90 tests passed.
>   # # 17 skipped test(s) detected. Consider enabling relevant config op=
tions to improve coverage.
>   # # Totals: pass:70 fail:3 xfail:0 xpass:0 skip:17 error:0
>   # [FAIL]
>   not ok 1 guard-regions # exit=3D1
>   hwpoison_inject
>   # SUMMARY: PASS=3D0 SKIP=3D0 FAIL=3D1
>
> With this change, run with thp disabled kernel:
>   ./run_vmtests.sh -t madv_guard
>   <snip/>
>   # ok 90 guard_regions.file.basic
>   # # PASSED: 90 / 90 tests passed.
>   # # 20 skipped test(s) detected. Consider enabling relevant config op=
tions to improve coverage.
>   # # Totals: pass:70 fail:0 xfail:0 xpass:0 skip:20 error:0
>   # [PASS]
>   ok 1 guard-regions
>   hwpoison_inject
>   # SUMMARY: PASS=3D1 SKIP=3D0 FAIL=3D0
>   1..1
> CC: Li Wang <liwang@redhat.com>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> ---
>  tools/testing/selftests/mm/guard-regions.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
