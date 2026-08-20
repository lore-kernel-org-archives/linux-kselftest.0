Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E7E39CD01;
	Thu, 20 Aug 2026 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269056; cv=fail; b=jBi6hHfAXw9Yzi9OVLDpCNw6SBmULiEMvM/hhiuPTIPQybVdV96PCuHuCZpQFG7Ofqxi0+e6+SZyujVL9qcdTWCKA7312x7/y6t7wqRFaoVNe2miEsEwHniLLaeDRTeVATO6WAeZYtxAv9cDAi4pLoRLj11TKJ7j65oEVVICKfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269056; c=relaxed/simple;
	bh=PkT2g/Cmv5lzz3T57uV9HgHtD4bEOgzIJnFRKhCXZCQ=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=A4E/+9zxR2b1fLa4OdPSCDvaYpAFJ8Qh1INWudVdTKgXgHX7jmaAPIEQDEa53746ZkvNyo1LB3UAHxqrxXfbcq9/URFc8cxcyz2LJIp1kjup5eEFF3jmx6ZHFD1oth8JWZQYzL0VDlCqDGuBVfZIewUo8m737Do3t5KAZvUDvrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mqHaspIe; arc=fail smtp.client-ip=52.101.53.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mqHaspIe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0xunk+ir3UoOgRhJ6kD2wH5EsuIXE0HW+ZmPCBJrdVXOLWTvNHD99Rt0i5NrXIa/s2TOuI+jY3UbXPX6NhoiTalczWa7iqfry4ZumKanm/TJ8uvK1EFXhYJW9wpMrWSHCGb9B11KyHwtKYTc2ydaT3jQ/HK3N6uo6jDQHG7nuRqSGxdhjbod1O2z/O3ozq4Qg/9rqEtWi4w6d6vTEJtctRfNMw+5J02ENAMH28oUsfbdV91tFbTh/XA6+ykHPKZjWq9tFnAHFIru/vnFU6jCxLKc4DRbFb8t/OhiVKVUHEv2Kv59nqZLjqZ+VWHABvc/HYAxV4zlJP5y4QmTRshHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkT2g/Cmv5lzz3T57uV9HgHtD4bEOgzIJnFRKhCXZCQ=;
 b=R/F1i06VDKCAUkRGRZUt+YSltHk5ed1CW3rvELOP+HH5ax3GGMaUVRr+RrqkgwIyvIlDgE4crxietu/W+H3LAbci3jAA/G7XAhGickMMC14XkvqNHyyjv/nFiROk84+3so8MWoYiPqkOB1Xf7JAb03MQjatDpJi8TKI+yNTwKpm/q8HTBVrPfDtGdtnIDxt/v13b1nGq7l9835seIaA5m0YjcngFbbbTbvafoyrRt74xbCOGVycZE/xmDZ18Fq1MkEusSBbk1zaKmekv96jGkF8c2fCb6tZw+BNQL7jdKSjil0r14u5wWBq8bsrTZVjwLAPgG7MfYP35T84XtVxdIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkT2g/Cmv5lzz3T57uV9HgHtD4bEOgzIJnFRKhCXZCQ=;
 b=mqHaspIe7yjSbRKFNmlRzCP+Zs4HZ1caC64O5VU/C8371WSYyNahbA250lvsf0OYPTlsP5DUfd51cnJBRaiJc/IktJ2NNxoyEi/2ZYa2OiPqkK6+W2Hq/wNgjLSTXBEGg3JjtQMkqE6eWe8lI+VBGSjINt6CPgwsjdmNSDwAph+NDDl2ga3Paa7IFm7AufEJtc55v6Wml8Ce/r3ScbmEj27d5ecd0oJEPc2eSpGNGhCV2Gn3EH8fW01hZkJqp/Kt6f3voXLYMi8p5KYVpah3R6IpcPLIDDip3Pi21MRjVXrH8jomCfRZ4yGfE25nDNpsQPHTNNgWeLy3D2XRED1Zwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by BL4PR12MB9480.namprd12.prod.outlook.com (2603:10b6:208:58d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 23:37:31 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 23:37:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 19:37:29 -0400
Message-Id: <DKU60290OED0.12P9UF0Z97DND@nvidia.com>
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
Subject: Re: [PATCH 1/2] kselftest: mm: prevent random failure of huge page
 split for khugepaged
X-Mailer: aerc 0.22.0
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
 <20260820-fix_split-v1-1-ab430c58c7cf@arm.com>
 <DKU173CETFYO.1RJA1CSOC5S99@nvidia.com> <aodwNr_zgOn55z3W@e129823.arm.com>
In-Reply-To: <aodwNr_zgOn55z3W@e129823.arm.com>
X-ClientProxiedBy: YQBPR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::9) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|BL4PR12MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: dc053419-792a-413c-78c3-08deff1400df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kiKLqKXAG6ckcrBK8o+RjGhPcaIZvY2dOtq/Xg+p5TdvWohn9JLqF097s6ySyWrcM9cNvyFdp+kBcc4vJ6ZYL2jTw0M5gHAFvMJ3UqPQj8YnHJbZBvX92ko50v8qUlfzndaYbNfJ/rCJ8Xk361saGn8z/T/qrUgLKySqw78cRdL35Oylgye4p71vvt4y0dtogTHpG0bkzOo03+LrxWTSWtINAHZWn4XzixC71MWuzlg/LoFVa7XC59/0I/Tx9efcDommdMR6px60fNaddmwLHCsUkDMplwL+YzGZ8ZL9KuPN9acpWutomu+TwJXZKEpVjzxiRNHI0U45KKWhYkWzvmRC52GL6vn+ziTvUB9j9E7MVh220OSD2SglmtSshTHGRfqAUi+DEYgljYYwy9qDagBdn5E1k4Qr9Mdw5RHmCs8IriUD9/xjTPDIgvHzWLqT6TKMV9Bsh902MYnLX/7B2Nd7Az1mkYhVBHKINdxqQ1sem4EB+xV/vcK/a20pbyL6Nka8W42vcMaY5rs/1YjYqBgVbHdm5kGuGiwkar9Ugc6kXb7r8BPtwHU5sETonNxNlTApmEGd35478wRb523V8sTmCDi8dOYZqqfDuWh38c78n2p+UK/GSzGdy7hJw9NoZ1TVkCaGzVP9cC++nsRz60LmfDdDIrZrUmzl0SN6b74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzM3NnZCSno5N1czbFNUYTJaMWgzdEU3NkdEU2dwcHFXQ1ZJV3RrZGRxOE5v?=
 =?utf-8?B?aGlrRjVTWHU3aDNOOGQrL2JPSGdKY3VMS1p2UTNRMnIzWDFmcm5rdmVmNlBI?=
 =?utf-8?B?MzBuYVM2ME9yRk1STGJkK0ZGUE85R0JXNWJBeXFNMzlsUnFhVktITStzaUli?=
 =?utf-8?B?VkxtZW9EdXJNbWM2bWNwNjNXZ0s0bFNuS1BkdlEyRmY3UWJzTEJxaE9GS3NB?=
 =?utf-8?B?WHZaZDZZbmRxY2xpMk9WdTVodms0Y2tNK1lORHNQY29VYkp2K3RnOXZldWJI?=
 =?utf-8?B?NmxndnZYeEswY3IrbjIvM3FrbjVCNDJNOUM0NnFHZUJScVgzdzU4UnhDSUNh?=
 =?utf-8?B?RGE0WGlKbmNzWXBOYU1DKzVGNkNBYm0vMEV5WlkrTS9CRnFUdWlxbmI1bmxy?=
 =?utf-8?B?cm9yZW9pU1NpdXRQRzVHekFTNWhkQ05xUnV2dy9jaHVHNVdocE9zY2JBbG5u?=
 =?utf-8?B?bFRtRzB2amYyUVlpbXNyakFqMVArSE5uNnBvSDJueE5uZ3ZzcnIxTXRmSyti?=
 =?utf-8?B?OEM5QnNGVXpjY01KVjNBNlUxL3pzK1lXaCtlZW1va3pBNmsyd1crdFBPZUhk?=
 =?utf-8?B?WUIyZ0l0emVHVWZMOXB2OTNRWlFrL1NzbUlyMWZxUUFTd1RQaUxKdUtDMzk1?=
 =?utf-8?B?aW0vQXdkSy9BT3Q1clJhRTlPYjliQThZK3dEMDRLeXI1S2xqb3VFeE1JZWNm?=
 =?utf-8?B?dmdoOUFFemlaRFJRWUZrMDNhWEgvZlhTNDZxc0YwUVZOK3c0WkVzUjVZZHh5?=
 =?utf-8?B?cnR6U0ljdFBpeGJJandIdkpUUFhHNllVNk56dmFBUXRkWW5VUHJheG1ZVWJm?=
 =?utf-8?B?WG9TVEFlWFVLTERrK081c0M5Nnd3b1IxOGJJNmpIeTRueFBJZWFsdWxHTjYv?=
 =?utf-8?B?WERqOXlvcnR4bDlBTlpRdXpkaWpqcDlGNkVtcHhmRWNXYXNrWTBUdUJBQWJk?=
 =?utf-8?B?QUhSMlZlb21wZUdRN2hiUHM3VFdLTHkrODZoc2xVUzBNZ0JqU1gwTjlLL0dp?=
 =?utf-8?B?cnJ0bVVNVHJocnRMSTRnT1EyQUpIcGMyQ3hKR2xxdkZHWWNBdkhOeGJuOVY2?=
 =?utf-8?B?RU9XVDNJTjFPMlZvVVpCTk44NUVJTmNYVVVQdi90MVhHeW51ZUJ0YTFYcUtm?=
 =?utf-8?B?SFlCZ0g4Q0ZTaER1M2FrOER3YzFmUVVvQkg2bkU1L3VCSWtsczQyUWU4SUNB?=
 =?utf-8?B?bjRRV2MvdWhzam9xVzZGRkdkckNoUnNCK2RYd0lndmRmTHJ1VUxkS1dRcHQr?=
 =?utf-8?B?YklCQ1FEQy8xdUFsdi85NGFSaWlKOGhtbmZaWUEyU0dDUklMbVg0dFBVeUd5?=
 =?utf-8?B?NFhnaG0xZ3g2TjU5VXY1NzM3S0U4U1FNY2JBR204Mk4wYSt1djJRNHhuVjlq?=
 =?utf-8?B?LzdzQUpwM08veWF6a1l2ODBpd2tmU1h6aFFZUk4xbVA4TU5UVzVxUSs2U3BO?=
 =?utf-8?B?WW5sZmtxZWk3MFRSenRLRFdhd0ZTN0tXMTN3a3lmQ0FaMis2ZHJnRm1mYk5n?=
 =?utf-8?B?YTVlbnVLc3I1ZUE1MVJQWG5oVWQwakdBTU5TSWxXNDFlTktBaFREWmlJUEEy?=
 =?utf-8?B?a0JRYW1iaXE2QTJ6L3RJdy91WUE5TTc4ZG5sYVBEczlsdVFha0dlcklLT2Z3?=
 =?utf-8?B?SVNRNVhTbm1SSnA4SU83MjRFbTFvSXowNXFDVWRCT0FheGg1VmppTlpRV1NR?=
 =?utf-8?B?L2FSa0s5c2N5TlluNHRHUkx6TlZJK3VNOS9sTGV0OFc2ajR6b202dklSRzBT?=
 =?utf-8?B?SmxkQjZiTXMyaFZuRHZPQVZGOGZYTDBGSjdtUDhhL3pHaVhSNFpXcVB4SVcx?=
 =?utf-8?B?SVlzRlQwdnZSdlI0cHhudDVjM0JOUzlJSzhYb202ek44L21uaThsUmo0ZE9O?=
 =?utf-8?B?OUg3Y0JhTm12aFdlWDVxNm50aS9icVZIMTFvUjE2YjVWdmcrcVVadkd6S1Zy?=
 =?utf-8?B?NENSTE81VmlNZ0xqeDAyNUpNdXVJY3d2VHg3N243cEpYNEU5VzdNZWZEQkw0?=
 =?utf-8?B?THZFRFdLd0pHdXBsd2kwbGVoZEdPVG9xaFRwRGYwNzVKM1BLVFhmM2FmUTIz?=
 =?utf-8?B?WmZDVlVrNHNtZWJEU0k4UFB4bTBWZG9EQTlsVUVyOEd5SDljTXJWajloWk1K?=
 =?utf-8?B?ZVZvTGp2OUdhVmlKbHI2Qy9JSEVOMjMrcWFuV2lQUWdNVWhPYUN3TCtPb01G?=
 =?utf-8?B?OEJWUlhuNGVzZ1hrb0VsTVRRSUdZaXlkdU1reDAyeXo5MERzZDFLUXpKMWRz?=
 =?utf-8?B?bkxLU0tDNnhJdHlERDJwOTN0eFZMazRHb20zU0ltV2lhMnAwYkZsTEptOTBn?=
 =?utf-8?Q?soZF/QB+noQ9hJDuk2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc053419-792a-413c-78c3-08deff1400df
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 23:37:31.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHO3yc+CCAy+DhLHL7WCwV1JRA6Cb3NGa7aWMb6QVno1ALQrelLNbd6lYz9X7FA/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9480

On Thu Aug 20, 2026 at 5:23 PM EDT, Yeoreum Yun wrote:
> On Thu, Aug 20, 2026 at 03:51:34PM -0400, Zi Yan wrote:
>> On Thu Aug 20, 2026 at 3:40 PM EDT, Yeoreum Yun wrote:
>> > There're some random failure for split_huge_page_test when khugepaged
>> > collapses pages into pmd again which had split by the test.
>> >
>> > Prevent the khugepaged's collapses for split page by setting the
>> > mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
>>=20
>> Why not disable khugepaged using APIs from hugepage_setting.h?
>
> Well, this also works with hugepage_save_settings() and write the
> khugepaged/scan_sleep_millisecs with the maximum integer.
>
> I don't have a strong opinion but since it seems more hackish way to
> change scan_sllep_millisecs, I use madvise() with MADV_NOHUGEPATE.
>
> Would it be better to change using APIs in hugepage_setting,h?

No. I did not realize there is no way of stopping khugepaged completely.

BTW, I am curious about your khugepaged config causing this issue.
IIRC, khugepaged scan interval is about minutes and
the time between madvise(MADV_HUGEPAGE) and the second
is_backed_by_folio() should not be that long.

For your patch, maybe you want to check the return value of madvise() to
make sure it succeeds.

Otherwise,

feel free to add

Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks.


--=20
Best Regards,
Yan, Zi

