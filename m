Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4621EB5E3;
	Fri, 21 Aug 2026 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321257; cv=fail; b=g5mgoZSocfZm08nqmezOHAH9Bm6U0GoFYbHCAeBzoW9inm/0rLOdK6OkghHX8d2nu9PTQz1fuiwYf/1YrELJ0qYsgF2X/4EDUbC0Hzf9WX3GCvSLgmoiL6/I8+m7wZt8B7dix0Cpe4xXsuktBorB/micKhQLS4+9lVXpKecqV0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321257; c=relaxed/simple;
	bh=rFqxCmN6a2JfPCUCeVmO+GOt6njEaxwOJQyNTxlvRRg=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=NJJ3uE8p9mXYLbZvZ8o5jtFNwMjoDML8WgJBymRMqMAB1GNyiUZQ+JQ3Ed2+keV9mgucYFZkeNZRTaEC98Hdh1ljAoY0ftjOaw+ua0CTXSPyqeYWW0nbFXBsoqSUuyMX7WOCGQNfnGXGMFjnxU/kM4oln8uxL9dX1Vqfeh/y/og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L1f7RP7m; arc=fail smtp.client-ip=52.101.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L1f7RP7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqu+rZsreWdGIDy2QnaOejFfYWgLSOh3ZWPaNIMz8qlnZAv06wkeNgccRlw4W8Lev5opGquEDLN8edu+Z8zCKBndS9ae7QtiTr1/u1VFqFwWYsQlCFNScTd7IYWYdMhgFFpBo3ZjDoztyc1x0iZ4AE0ZZBQoSv4G/J/x0GSev+BVjc6Twy0eVAzm3vdYEZzdpd0wH7NZIVdMk3An2c3HGZpIDX+KJRAyO2V9emrgKAGjICzEyyR5MoKYvly4H+38MMVI/+4nq2ufjvs7tNlC6nV06pv+2fPwV+SuHEmCv+bZ43Crcj/+nGMWcYK0KOCXBbbzfoTpBa2uIWVqjK1qgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFqxCmN6a2JfPCUCeVmO+GOt6njEaxwOJQyNTxlvRRg=;
 b=QHN66RxEd4yePgbSEnHrbadKQfLQj3O29ZB88HE4k11T2sv6CRczo+BPeguD8fAt3wbMd1uYInHmXqJ05NYfhUUMfElGFurMceghH+/V3I4ijGunR21TOirwX6pZ/rILn+xz0qWwyqRZhqUy809xJK4JZjRDtax2cztw2n7YQxPQhPKrKnRemnd7TnBUBbb21rsTghL5k7VrZvJCoHsbeLthv4hR0g4akXFVklK/e0CH2lVFHl08LaVizITsiOM+Kw5itwvRdHicA8UeyUpvYF9PW8GYxc8OFhd0v59QyEhZjYFP9DONrU62VqqffHN8WFvh+NJ7eJJRjotoPPNU1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFqxCmN6a2JfPCUCeVmO+GOt6njEaxwOJQyNTxlvRRg=;
 b=L1f7RP7mASfxt6ZKKNfxgJe8d4TKgfGY4KoWWwT+6FYCftOkvsV8GfPK12P4sM4eH0O2FnpVPPUd7eBWSjAeKOqoDIfgUMARXfZZqtIMQ/iOY5N8gJqO29mdoTeTrYGvQ85m+zICTZiJVtTTV0wuv3d+1q0OHkavSG0ZUwI4g1X2OsBjKtl4FEA9bAr4ycdcf2BwK5C4TeUApnV11o7qirnSOmAx7AwcZkMoFOU4dFFJrJs92BYl570xMrMbJq79EzT4PHnISEz9cgIPpcJl3fHjhoXBO6NHTkxT3UE8YxWSYV95qFHE+UCgMzfveH6EZ8bXgiXo38pL/z2Vb/XHLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 14:07:13 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 14:07:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 10:07:11 -0400
Message-Id: <DKUOHYOG0DVU.HEWABY0ZTEWL@nvidia.com>
Subject: Re: [PATCH 1/2] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Shuah Khan" <shuah@kernel.org>, "Kevin Brodsky" <kevin.brodsky@arm.com>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
 <20260820-fix_split-v1-1-ab430c58c7cf@arm.com>
 <DKU173CETFYO.1RJA1CSOC5S99@nvidia.com> <aodwNr_zgOn55z3W@e129823.arm.com>
 <DKU60290OED0.12P9UF0Z97DND@nvidia.com> <aoeT20fPw57DtpGe@e129823.arm.com>
In-Reply-To: <aoeT20fPw57DtpGe@e129823.arm.com>
X-ClientProxiedBy: MN2PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:208:239::32) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbe94a6-3aee-46d2-ddc4-08deff8d7f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|22082099003|18002099003|11063799006|4143699003|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	yMzzof/KG6t0hqtvK+AvkGy1T6xsl2NH3lmkwcKwme9w3WFbmggeG8Ns8WkFeSeY5Sy6AxUUdv/VYlX2/vR5b1Ly9cxbop+PqAQb9rHj+15LFmxwpystg4bZQyMBnKxgK0PJPu2JGrSNqJoqsrUYUSlt/VdccuXZ0BkUrRLHtWd/+uD4u8nLYTJFx24HsWboRUJxEm4VLH3etFFEKgnOUUMWKRDWNQRTTr6KnwUzrWF6Gzkk1V8J9cL5AjnqCthX8HjWzcpIL2p0tCJQ54dwbu+Ws1ghI2liqqcIpkqVD7+z1nOcNRlnI4Uq8nKFsnWGEmRke2N1PtpwxY8MDqX57ceTf+flDtOe2zBuse7a1DCjUhLqSvLcwlvaJY//Vmrzrx2USg/ePQDgJkRuDrRb+kmgSkzH05MkoFOeFbYrD4GZZDZeQJIIUbczLX8hXCqFw32tW24xCH1q6JHH3gXyiW+fLUW9yatKbHB4zoIKlXTUt8cGZqQe8fyxoCYgUopa22kbeNZR7I0xxxQYAhDf2XLWzttcBfBOcGNPcCSnv6GKFigDyjZ2Dvb31xwC81rxR9bgxrCiyxKSPiPZa9JpghW1meFiB0LWhXeZJmuvkkenoH3uSi4tKRHkObeWvVJvkaGqzhJdLQmu/jdyQb36K/W5YQ4JlfqRkRWCD8C4VOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy8vcE5yYlcySjZEdjFtKy9PZ2lkVys3K0RSczJNYmJ5ZngzNmJrNzdZazlm?=
 =?utf-8?B?cTcwWWV5dzNWelhTMTB1SWZWNkkvTklnVDUyUmY1Wjh0MU5BR1FKZFp5T0sz?=
 =?utf-8?B?VFBpdG80M24xTWhOSjBtcno5djVVUlBTcldrVytJV041a2FBY1FZWm1pZnZB?=
 =?utf-8?B?aUIrUno1OGlQWTJOUUdkVTZYWVB3bFUvOU1kdGQvSmdTOWowZFFRREtIOEFQ?=
 =?utf-8?B?ZXpCOVp2ZDN6ZW1uL2dQazErR3JyRnRZZ1cvUm5KYkQ4d1g0Y0NGdDdaTXJv?=
 =?utf-8?B?ZVltMFZZa0hENDZ3SHlvT3R6Um51TG5QYVVielQ2TFlmS2N5blU4VHpsTENr?=
 =?utf-8?B?MWFXQ2cvR3lvTmVkQ0ZaSVFvemVmN2lTTCtxeE9LNExqYTNrcGFBVFhoTG96?=
 =?utf-8?B?NG90K2hZclBmSVplS0N1OXI0U1Frd3Z1RmpqdFdZT1pGRE5RNjJhSGVOalll?=
 =?utf-8?B?MWZEcTErMHRIdERNbDlWK05MLzhIci9WV0lXRG9WZmdmZ0c3LytaNWQvQmNS?=
 =?utf-8?B?RVgzUTNSYW01aG1Ed3l4bTd3WjlMMlZhVzhKc3dIdGI5SVlGR3ZpdlM5WENK?=
 =?utf-8?B?ZVM5ZkFZZis1U0RydEpDby9zVjZST1ZzVU5ERVJrNWc0N0pwdjJYOHliTGFv?=
 =?utf-8?B?V1ZxcEFqSUNOTnpXQkFYeHBQWjAvN2R6OU95VWlZOUt4LzJZbDJQQ0JCOFRX?=
 =?utf-8?B?YTdWemV6c1AxVEN4ZHJwVlgrZStwNnJwU21vaDB2ODFpUDAvVmpPOWZXbHVm?=
 =?utf-8?B?cnJaeDN5c2xlRHJOUEowQ056a3NGT08wei9QNW9XbUpCUmtVWUlEVExEaWNC?=
 =?utf-8?B?VkFTN0hGcTRWWklnY2NCUHJlY2dhbzdxM1RIRVpweGM4TXRyakt4SjZpM1lu?=
 =?utf-8?B?M1hNV2RXb0hQdTEya1RUZG0zU3dVWFJBakNLNnBzbkM5eFVKdVpOVXdRMUtS?=
 =?utf-8?B?MDBLUHZ6eXNvd2owTjdoTWRRMzRNZmVGQUJsOFJvNUVIUU5iRkpGeWNrZ3o5?=
 =?utf-8?B?ck9RRytEOEFLNS8zL1crNEFCaDl6SU5abDRGUUpCekJxNnc3cDl4aThkdHh2?=
 =?utf-8?B?S0xQa1AyRTlZL0twaVE4c3VkMFZPZEp0SzdWUndvVzgxMWVrQ2dVQ2tTdXVq?=
 =?utf-8?B?bXpMOUFaYUFzKzhuczFtaWVpSGVsT2VCK1dLQjkxcUF4NjFoNmtWSnJ0V1J1?=
 =?utf-8?B?eThjckZSWkxJQ1ZMOW1ZR1NKNWp5SUtrSUpOaEVONWNHMXFjS2hrRGtpdTdw?=
 =?utf-8?B?WjRyamxvTFNlUWVrb0dsZDJoL0NtR3RsK01pbE9hOXZzSmZhaVlCZFU5QXJy?=
 =?utf-8?B?ZlVNWlByUENUeENLTXdvRFhuMURkbERLZy9VMHFnMFRjZDYwZWFVN2sxNWQ4?=
 =?utf-8?B?Rnd3MDZTaUgvMzErVm1wL0RIcElUSTVQblVaLy93WFhaOXQxSWlkMzFMa3l3?=
 =?utf-8?B?dHlnVnhNWk5tb0EvZGY2aEFzV2N6Z3JHOFVhV3IzMHI3R0FySVFVMitZVzhV?=
 =?utf-8?B?eVRCTnpZNE56Q04wQzY0U3RTSFFheXQ0UjZlYjR1b0VIMVRCK082SHB6N3NX?=
 =?utf-8?B?TkZLYStWeDFFVGxlZlhVY0NFVHNZZk1zeFY0OTdnZXBvOVQvRWJ1NFl5bWxx?=
 =?utf-8?B?eUx4ZlcvMGVHRU93VjJuaDF3a3BRN2JjOEVmeXlqZzFLbjg0RCtadmtjSVRV?=
 =?utf-8?B?OXNpZncvYStocWZqdmdQQ1ZCd1JSSmVvaTJ2R1lHcTlzcXMrVWdEaDZubm10?=
 =?utf-8?B?ckxzNC9OMW51dmdNTkNxZ2l3TWdQL0krbHdYSkJoQkp1UUJ1TDMyRGZtZFVm?=
 =?utf-8?B?eWdQdit1bktQR0U4ODF0cTBwdFdkcmJZdGJ1TDVXMEM4UU1HeXc1ODF0dm1B?=
 =?utf-8?B?V3lkUjQxVkU2QWRGOTdCZE84Y0NsY3VmZDFWTi9mbFFDb2xIdjVQTWoxLy9O?=
 =?utf-8?B?a1NIS0syYXVCa0MyUlFSRFVzeEVmdEpSZ0htazlsK1ZXbzFRaVdDbDRCMFhJ?=
 =?utf-8?B?QnJONnhvbkNHS1JuSy9vdVhpandCR1NVOWIwVnhrZm9YVXFER2l3MEMvVmE2?=
 =?utf-8?B?Z2xIcms0VE1XcFJQYWhUZDlsSGNVWDhOWHliU2RkeE01elBZN2s1SEhKeXVF?=
 =?utf-8?B?VEl3NUsvN1VFVHlleVJ1OHpmQUVxdk5BM1U5WFlnbk1wTzhBVitDaHNwR3o5?=
 =?utf-8?B?Vk9zZzg4aDdjT2dFSlBHaWtUOWlsSlZ0Vm1td1VKQUlwZ1RGNGI2eDdyWnZG?=
 =?utf-8?B?a2xuMEhqcFhuSjNwRXJ6OS9rRDlFdDVlN1UwY0RoeEpzQnpCVjdNRmk1VWJw?=
 =?utf-8?Q?mSm5k5VBEK/Ocp6CWA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbe94a6-3aee-46d2-ddc4-08deff8d7f58
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:07:12.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNBepJPnZU+MEnKIlP0eJXKUZoH8/r9E9EpaWO2e/6D37rW/bw4GYZajC+LMVQlg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584

On Thu Aug 20, 2026 at 7:55 PM EDT, Yeoreum Yun wrote:
> On Thu, Aug 20, 2026 at 07:37:29PM -0400, Zi Yan wrote:
>> On Thu Aug 20, 2026 at 5:23 PM EDT, Yeoreum Yun wrote:
>> > On Thu, Aug 20, 2026 at 03:51:34PM -0400, Zi Yan wrote:
>> >> On Thu Aug 20, 2026 at 3:40 PM EDT, Yeoreum Yun wrote:
>> >> > There're some random failure for split_huge_page_test when khugepag=
ed
>> >> > collapses pages into pmd again which had split by the test.
>> >> >
>> >> > Prevent the khugepaged's collapses for split page by setting the
>> >> > mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
>> >>=20
>> >> Why not disable khugepaged using APIs from hugepage_setting.h?
>> >
>> > Well, this also works with hugepage_save_settings() and write the
>> > khugepaged/scan_sleep_millisecs with the maximum integer.
>> >
>> > I don't have a strong opinion but since it seems more hackish way to
>> > change scan_sllep_millisecs, I use madvise() with MADV_NOHUGEPATE.
>> >
>> > Would it be better to change using APIs in hugepage_setting,h?
>>=20
>> No. I did not realize there is no way of stopping khugepaged completely.
>>=20
>> BTW, I am curious about your khugepaged config causing this issue.
>> IIRC, khugepaged scan interval is about minutes and
>> the time between madvise(MADV_HUGEPAGE) and the second
>> is_backed_by_folio() should not be that long.
>
> Yes. it's relly timing sensitive and I've failed to reproduce in the
> real hardware. but in the emulation environment it often failed with=20
> the scan_sllep_millisecs as 10 seconds while the test running.

Oh, it happened in the emulation environment. That makes sense.

>
>>=20
>> For your patch, maybe you want to check the return value of madvise() to
>> make sure it succeeds.
>
> Yeap. but it seems enough just worning message for the madvise() with
> MADV_NOHUGEPAGE.

Yes, since there are huge page checks right after MADV_HUGEPAGE ones.

>
>>=20
>> Otherwise,
>>=20
>> feel free to add
>>=20
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>
> Thanks!




--=20
Best Regards,
Yan, Zi

