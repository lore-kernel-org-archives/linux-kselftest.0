Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021B13B8921;
	Thu,  6 Aug 2026 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786028367; cv=fail; b=eylC0B1/x7wraZuCsTdKCONHMqyx7QnYPSHCxrCs7Pzh5GmrMzLNUnxiAVUoh+PxkX3UwLVoU1yUD84YgAq43N68xFXevJZzFHl+YS8SAe2vissLsory5+4ydpfAOljF17pI5MXUAWJ2M7akVIE7i3NTY2yI/LeVmj6bQ0Oua/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786028367; c=relaxed/simple;
	bh=eM8x1PaGkmO2WCl/zGgB0Rqe5mbDdNbHqh//eR3TKBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r5afMrlrsGToC4UrYGV1XueOA9DeTlgHFZwuQJj7JjTeKsclViiiY/rILfKM7j2g7qiYInVoT8VO//VPwUBOdLM+RVzKEBIriGmzrI5AjMw5LKAEnyfWbUizrRRXNmOJcFX3DgRgoh4X6d0c0Xn7hkCUOZcnQXFB+bmeY4L7xO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cS3z07B8; arc=fail smtp.client-ip=52.101.46.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cS3z07B8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8SdX3QLxzqPA2PW/B3BwBjQ/SDVXgOgr+SwcJmjoHDKJ6n4wyDfrfHarj3y4lpotWi56FJPW31RaQ/wLZ5oNvhpAubcsRC2W0+7E5mTqtAa4oQMxrqTkpN5zV3mGj+h+Zr0T8gWvQXgld/DLSurM5aifTqTAdmjouIy+HlR91E7PoNf0PHlvvVL5HyyFuCZ6HEYtQ9VJGfdxR00Qyw14ITsdAkfeqOv3c9Nou6wZF/0BqcQ/oL/51SWW1SEz3V7BWa0hm3ZFYFe5J9doLiOhOo3Ag0YTPtE0CvGdQsY4euoFw29mnjovsOTCwXOkepnhSELByzGHim/iz+qrhSqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyr9pLOyK4zXSkH7Qs7IyKYoKJBS3ZXpjfw7P/mPhjI=;
 b=OOzY8jz8r4aPiv3tjp1U7Zl/aZIkQvqrFVBptk7ATWktwMw/xmCFK1xjZhd/cXzzcahr08WkDsXtcgWc/whCclaqsHRnNAmj9XCUCBm7MkaSEMB2+pNeVrETx6pfKAo2Gc8Y5FllKp4Ds/dmherY/EQeoPPcMDj06X6sW4Dx4iCPsIOsfx0Sw02xPrzdc50ZOwzIozhwHfBn9x6lJnDe33MdU+cFvGhorAhEyjG6J9UQPkpxgUhZHd53ygaPBZ4fprToqtpCoIGwpcfSrIw8xZqtNbOz6pf2OqmJUGZTIeeDehQiEQfNvwTGqGV7rs6+G+7I0WUFqrmJqGJicZGktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyr9pLOyK4zXSkH7Qs7IyKYoKJBS3ZXpjfw7P/mPhjI=;
 b=cS3z07B8hw4TXGf4I5y25Sw8YrhD+CDod1lkJ/87cDqFHKjFuBUPBYFlaqt5XeqhBIfjF4T+uSGTqaDD8oe1KZzfsn7OMXVcyhO5b8xnZmmyfxNMVSjmCkaDc6Z1+1C1cwhvPK1tEtMVtjWFAl1Nh3L7RR0m6QZovRSia9p1ExFhApuNmuqsYfM8SY18Z4mLItYgzBHuKAXHRJm7XF4KjCs+7JoYHsITLULuhpXz6UDKBQ/Ru+RHh4zsWFkziKrYVF6kWvZ6thaK7NHeuHxKBNbnjVP/HpJsCMDaVfzyXk+5Zjipl5tByNTZoonhSDadoNgXqerrBH42CagchUllog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SA1PR12MB999084.namprd12.prod.outlook.com (2603:10b6:806:4a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 14:59:22 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 14:59:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, kas@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] selftests: mm: implement the mTHP-sized hugepage
 check helpers
Date: Thu, 06 Aug 2026 10:59:19 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <495B82B6-C2F9-4C9D-84B1-B36DAC0587F7@nvidia.com>
In-Reply-To:
 <56b16691f605426b33b5cf47319233de6127a6b3.1785985999.git.baolin.wang@linux.alibaba.com>
References: <cover.1785985999.git.baolin.wang@linux.alibaba.com>
 <56b16691f605426b33b5cf47319233de6127a6b3.1785985999.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:408:fe::25) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SA1PR12MB999084:EE_
X-MS-Office365-Filtering-Correlation-Id: cd82ea75-820f-4a77-061e-08def3cb4c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FK12yIA5bTJnfGJIWp/vHUXIQ6Krp40RfH4xV2URyV5e/dnSBNdrGSR/d8zByiFzlDlPhI+bhJTC+2cCZ01q1pa9xSyMaelktfBCMvPwHtvzo+jqySjxRER6WWSSwwLPdmFKRMnGhx2kbN7lIcLfQhYzZV8Ov13YyGUFBaFEh+UU/Kh9QLD0dBU+3ml2IWkYvwzc4q/EzBW9l720tQsF/s6ccIu5q2hkKsa67uTfh9zzG3enxgKiFZ6evvpOFLGk1IzJgWAJpGG+ku5DwZUK40VX8xD0PlZJeCMNW5GNP/V+PVBnqj4qV1BN7GWCnoag7YMZnogk1PmPJvbIB8QgC1S9So4ckcX0rHZm38ivt1vUHjzJlQtdRpquI/cVvfmEUEZPlssKIuL8hKhzQP4M+tWLKoWs7Of/xKpslsKudwX9aI+Dwtk+9e82gyIS5Poc4nb7UESs8Nok3CyfPuz/+WjgfIpno6sq7+5FGwvjqFKrT8djJN8+9X0xRaRGinZcWExo/ez+rvz5yORYkQ6t8ECfH2abt31v8UxNQWW1r728mvq4kSw+v/o6w5lh4mHR04W0r9kzAhJv/TqWsJvFqu+wBFtfeAKUwvfHRt+bVt4cOAxylawEsjEGpYZNHsN8w/AvdU7yfhWyQS0FfTfJn7dE2b9uUQJ5NJprPe+kq4k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w3SwiyOC9NR6RLaeVz//Hh6b6HK1pGl+KIRXJeWr6AXDI9zHal0zuY0kL2Dc?=
 =?us-ascii?Q?Lm3Y7xy5CHdBs+nIV/S70DClCC7UrYMfBB0RA+ahxdYZWrVKRyNZTvLmScCk?=
 =?us-ascii?Q?J4/XpfwSvmEbH5tEa/9oD2Nnb2q8xXCSKr0BGu0NkEu25gvmWChsVfdAQ+IZ?=
 =?us-ascii?Q?++3Ee81MEl+VVQ03z4dCrE6vEdYTMBHtA+0IFly6MajN+uYW1wXNC04Srret?=
 =?us-ascii?Q?rmRBkLGWSGPDOAtk8c7TLL+Vs3JL3wVqTHPDpzV2MIgY44ZNgBGho+UAhXfE?=
 =?us-ascii?Q?aGQqMiN+8O21MDcbhUZ7utbYN4dfO8el1Xf2srwH/Z9thIyvg6dsTELQ84DH?=
 =?us-ascii?Q?55ThJi8EaWQHkZdgz88Wl5RVA9UoR97Da83SLyYar2glRuI0Wz6EECz8zq5+?=
 =?us-ascii?Q?eHBWhGZWacEzWtjUdRSZ/l2u1SUcPnkcZecu6z7n53OlYaxaKNJgEneILa53?=
 =?us-ascii?Q?ESZPigHXL2afs4vyQMombskuivxwzHUN3mKTDB/YSNd/lU+2rvccYZLM2TSH?=
 =?us-ascii?Q?udUNENH+o988SGz6IWpm5n4D7NBYCdwixUUy9TwrZ7HQ+FZcfqxVWH32N7tH?=
 =?us-ascii?Q?JHhio9iwKG5/qKj5qk3kN6NKhvghvP9t2FyQ97YQG18Bw0X4i9gtJfAagmEU?=
 =?us-ascii?Q?1fKD9QvCl63RiTfS94oveRTpLuRr4vDR5SCV2VItjwKt3DNeHadM43CcMFI2?=
 =?us-ascii?Q?FJJPfaL7FXHK9p1YfjRdNHotLElR8dLfnm1mUoISA3aBOOesjcl/GG1lj0Ib?=
 =?us-ascii?Q?1dM8EMIxBcNTgLQ8e/bXlaLAKrmtubMeRaLLxTzA5M5XugOkY5UYpOITziJD?=
 =?us-ascii?Q?3N9cYqGpcgue168TzeBLqk/ZGXKMoIyIXPIAxJqLX8ZIJFWdSuL5xhtcXomR?=
 =?us-ascii?Q?sWGrbqsBKAJbQoRD6WUBggQRdJLph0d6NCIESpDU0zWZjNfeCiR62GFlAcKR?=
 =?us-ascii?Q?BGH7SSeyMIzC3tjf9VG801UgTK1o1KF1KmNzfJKwXKm/tmGUswk2zWiqiILI?=
 =?us-ascii?Q?4ULWhScvs6aH3GYntVtR+9ukbzEjC0IbxsCf+gqIBC4ossrdSBhf2KSmfD4h?=
 =?us-ascii?Q?uKperXJv57Zc3rTbYsY+NEkwn3r0NsEuZIROPPPdtPqJOUI6WPqUg0y14LTn?=
 =?us-ascii?Q?M2lHsZSMKezvwssWLJnQfw5dHQOpjgQiRP0gDFmtn/Jkp955IZ1WdAuAKzhZ?=
 =?us-ascii?Q?ndOF3YEDJr6N99t2+S81r1sdFn2a74Le9OFXMhOTsWx/N100Zd50nAvlmYVK?=
 =?us-ascii?Q?1ASfNpo9mAmGBchSpd+93ZqraRqslA2929xMBp0trTPfGLsTKpu3WdY3uxKl?=
 =?us-ascii?Q?obpsvjCGw1suzqFJYv3heo825dwibNLc8IoXbq78/Blr1kAHpSgPAzs5U15S?=
 =?us-ascii?Q?Ughn5MEFLG5V13cuZgn+INPHu9inkt7nV6eiA5mc9SVZNBZ6T9+ocbOUi6VH?=
 =?us-ascii?Q?zuIyIqx78yaguU+wmgbvBiccsdKs3KiJpgDtm5Z6LNojNB1EK6wfGrhXfMvk?=
 =?us-ascii?Q?GB1BA7RZP5J7yEB14VctZz2HzD61FJRgfE9EzLzPD1kJ8fUMFTZjzh4TG1on?=
 =?us-ascii?Q?HMrAmb2Uvlfr79CrbIOYjPwkKN91zOCoMfHjMtE8pnV7srcf3Vw0ibQq+gzT?=
 =?us-ascii?Q?7GaU+l3sHZkrOaXjkXpVXQMLjQWbMW3KpVbL13vO2JklXGiJUAwOd4YSk4Dk?=
 =?us-ascii?Q?fKha+j7B2hF2RXwhkcXDZogQKAEFXGogwGYyYywFwG2z9cgfjInQX9YNMRpP?=
 =?us-ascii?Q?AOblpQsU1w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd82ea75-820f-4a77-061e-08def3cb4c73
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:59:22.0787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTWI0i2R3q/fZJKVFz1LMD0Ahm/zgUNybS8pzyL5h1oZrcV0NHAXW9TIbi0pcX7M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999084

On 5 Aug 2026, at 23:34, Baolin Wang wrote:

> Implement mTHP-sized hugepage checking helpers using gather_folio_orders().
> Also rename the existing PMD-sized huge page check function to
> __check_pmd_huge() for clarity.
>
> Reviewed-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> Tested-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  tools/testing/selftests/mm/vm_util.c | 76 ++++++++++++++++++++++++++--
>  1 file changed, 72 insertions(+), 4 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
