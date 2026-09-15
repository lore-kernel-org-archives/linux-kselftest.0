Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0CE3911D5;
	Tue, 15 Sep 2026 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438508; cv=fail; b=UXqE/1m9Cciq9vnNxQTTGNvib+IhPjOzdWETqin2IiCrsQwbk2ir2bg0hE4JArhA5JObbbBLodapH1mLLRJIaZa+NUHadBbGloo5rxUIwwnu+tML2gd2eMPD/IZGVUtn4ylioo18hd5kyht126YEPqBdORbDf3NNDF4CaPSYl8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438508; c=relaxed/simple;
	bh=v/ywUjatwTXLL+lhkYKFe8WKwvC2BcO2E7XnBh865ec=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=SeuCsaopMT63Uiq/F/rWzuCM1Wq4s41V4wcPrHKwRVOVyaBcW8u6wju3kqGBBsgEWZftAcbjogARB+Ttx9NSMaWt5h3eHuqROpsB9MZaVI8Je4P8hU/bhPzAPwrbkADlzORIjE1N7MeGz1b3+nT9eQJfkuo0ThbwvtAXhDmOWVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MwAaIcOf; arc=fail smtp.client-ip=52.101.57.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MwAaIcOf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pveHjbjCiBofkCd5uJeHf7+0W8ggicpoHkz3Z6xhqPPEOKVP1sMBnh5GxJ0priciH/OFv1N+RYVIn0q7X8JBN0MCqjvq+edOxpQ1AMQEE1mq0uNSxkY/OEnAvW9mkAr9mMI+jQ9mXoMy8YPFBYBGH39YSlA/e2QVEW/ku6wQvTZG76kqXmFxggQCTFuyJTZByQvUrYWx1dCpKc5mMEem/j6RGezfUu/IFS7hz/E02h+1sEujr9SC2rSVthW1v0rFjBinDWZXYgDSAPTTIlGxMKq6o7SxjL8unZllz9I7OLIg7FdZ0DyPikunK2I0cPMCqp3ITLLFe2B/9Wwn4bG8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCjcZDdD6HSr8djuQ8yAgJ1wNehe+NztBUrNlJcBifE=;
 b=OSXjoQfm5LzVJTIvcnFrNgu6EHB7KJah5THsaVtRb3qHgQnGqDjIv3Z85McHW9jfbzJTvgMywC44ZxAoNrI7Licx8rfcH2RjM4VGzNxNcVK5BeokZ/rsSUmwSxHC2CskXvBFbz8uPYRu4Dy12w3DBGygKqoNL/n15PDsZNzHq3Dpj2rYXZOzmhiPf2n3OwRfI3VHuqOShzBQOlEhaUYRv1cftdIIjNpxwbV+zqGEUdv7jvwNmd+Cb0DrDYZbYDDt2so2dWpvHQGnYgkn4H4+ZzffyEsWy4qAd+OfU21PAXWjGXdQ2ZBDmIbizwhWlfk59vSvrlCM+gii897lLMsUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCjcZDdD6HSr8djuQ8yAgJ1wNehe+NztBUrNlJcBifE=;
 b=MwAaIcOf7AidOpwRUWvb0URntt7rWheFaz/kHyBTV2FmnlOOvBGRbDuP62DYGX2T0fJX8pgksm1n/UA3F36Qn1DzogkfmNFZ3DYD+F8WiAWrXObF67FsN8Hm0AoCQLVjO7iCC0yiba+P2W0NOykwh4PDqu41rkwVo2pXGMcM+1PrZWcgNAcQmnDzDgb1mWUvTVYSZwWBeWm+6TAOUCKYI7ZrwPPat+GaN3bQnGczQN8rIc095UotDloxqhVkqKp0ftQPfDjv2raGdz2mAtkJHrUcDRDYDrdKMGKJvcbXgerWwuCmWcAxUt8mX7zFAk1lPP0Rxsb9b/2KwFTKaZHoJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS5PPF5E0E7945E.namprd12.prod.outlook.com (2603:10b6:f:fc00::650) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 02:15:00 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:15:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 22:14:59 -0400
Message-Id: <DLFJ09XIT4Q6.KVEN4QKS1717@nvidia.com>
Subject: Re: [PATCH v3 1/3] kselftest: mm: rename read_pmd_pagesize() to
 pmd_psize()
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Shuah Khan" <shuah@kernel.org>, "Jason Gunthorpe"
 <jgg@ziepe.ca>, "Leon Romanovsky" <leon@kernel.org>, "Sarthak Sharma"
 <sarthak.sharma@arm.com>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Nico Pache"
 <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain"
 <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang"
 <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Kiryl
 Shutsemau" <kas@kernel.org>, "Peter Xu" <peterx@redhat.com>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
 <20260914-fix_hpage_macro-v3-1-c9a305a01d39@arm.com>
In-Reply-To: <20260914-fix_hpage_macro-v3-1-c9a305a01d39@arm.com>
X-ClientProxiedBy: BLAP220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::8) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS5PPF5E0E7945E:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eaaeb8f-00b6-44b9-28be-08df12cf2532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|23010399003|376014|1800799024|921020|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	BwIwB+EnwtPx1FrmuQ47NK4s8RTzBppfIWTJSW72wYSD+xzvAuHcSaVRCtsjuerDB655hBfCkzT3QQsmU6Z2MjFQ10WC2Q3s5aYXRrjTflkU+dntXaprwOrGhhSoIn77szuiK7jcGopKMU7vXR7FVNchjaR7TXgbu1cCp754zo4zL66cs03R1siVig3a9I/ba0t+tgfAeLIStPYWF+4iUtCha8a3usSCDPIOS61EQyV9MAWgUjcVz4G7laW9pbOrV43DlSAHAiF4j5JUQNSTG73wxMUbB2QjssYPJ91PYehjfjxRT95SY6zJ6gn/2E3T6efqFv/1Aaa3L88rra/VBJhj+iMXoX40ITcfJtKYQw8Yzh7mj9OhrRA431PdgDg+3nUPYaKeRGHqA5l5H8FcvPkD45wPAYhbZAltcVFkya8gIPuIqQUHtDPUv9LK13bDlgxdQU7R02+iPeDHb4Dc1jwZTMyjl3KCxjNdQCEo537J64tIMp9CPL4FvU/O722NJbAh4YjGJwjOC/NeXYtBUEgPTguQFcSz0iRTtOUe00LUVMmU+2gKzvqql9t1dHBPUZ/1HTFq0Qeu/NuUDk5dsjP6Q4AXRyuiGrJj0R1c4nCJj5R2fUdFsnxy7Q0Oi1TABZNsEw11mx9pb/DYYubDtj7EuD8/2RsioRwbO/eK70na1HVC4A4OX5kzKoqoZ+qJasS6RnyfvO+iXbnn2+dHIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(23010399003)(376014)(1800799024)(921020)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmI1RUt2VFhtQUtXaFZ2SFpFU1JKVTUxTWZIMlU4dk9Zck0xRmhRUXd0K21r?=
 =?utf-8?B?cG9DdjlaYkxZT0tObUo0djNnWUwwalRVMml4SUR6Q3BvdnZHUExPV1VkTDJr?=
 =?utf-8?B?ZHRQdER3TnZZekM3R2FLTFlmclNCMDlpYUt5L3FVYzB3eGJiVzR4MHdHcXR0?=
 =?utf-8?B?MkFQN1BpVUgvaWo0SUdOajVyejlrc1NXUVMxUkNWeU1RV0VnQXpydDQvTWFP?=
 =?utf-8?B?czNOU3FhRlZqUmxHVTdBWEFCdFJWQ0YrbllxYlZpaU03RG9WZG50NkpOOElL?=
 =?utf-8?B?dmRtWTVneGhGYW80U0lnTDgzdWljUSswYURrRURLUE5hYkptM0wxV2g3aUNV?=
 =?utf-8?B?QXlWUlRhK1dlNnV0NkJ0QXlCdnZlUTN3aU1xdS9RcnNoMzU4YjNGeEhIVStr?=
 =?utf-8?B?dndCRjJHMW5nUmw2SnRZZWluQ0JGaVh0TE5BYU5sY081eXpWVHU4dy9UYks4?=
 =?utf-8?B?RmkyMkVkTndocmxzSzdoMkx6TCtMS3NKYzhldWxVUGNHdE5USStyWFQwSC9C?=
 =?utf-8?B?T2lwM3dGRkRhd0FDUkNlSG96WFdBSUVYMmVYY2RHOCt3TkZVeW5jN1ZCakNk?=
 =?utf-8?B?cm5JdXJuQnJGcDFZQmdNSTY1U3VkRGF3ZHVod3RMV1piZFNQdkc4T21IMGVC?=
 =?utf-8?B?TXRndU14TzBEQmJhUGRFSnN0SDA5RTZQa2ZvUndQYzRXdEZ0aVB1aHJRVnNw?=
 =?utf-8?B?S1FHT3ByQ0RIckJZaHhCZlJaQkZ2bDNqN1pQdUV0M3RmWTBUTmdBbG5aZzJn?=
 =?utf-8?B?bm1pVmZVWDZWYTZjTEZuMjBMV1VBN21rWFc5U0lhcFFRR2txdTVHazFsYXRj?=
 =?utf-8?B?Vlo1eGEwUGVDOWNmVzBwdWVnRzVSb3J2NlRrU3FFczQ0V2c5WnNvbHZZY0tW?=
 =?utf-8?B?S3Z0dkJVR0grNUxCZ2VpL3JOWkJOY0YzbUxhenhDZEk5RVBGMlM2Rit3SWFX?=
 =?utf-8?B?WHFlamxzMUdNSDQ2Y3FtSWpmTUQwZHkzRG5sWGJsSS82bjdlYzZXWjZmQ0F0?=
 =?utf-8?B?dzRhcjVSK0VFVlFXdlZVU0JhMERDZzRQVDZReWRuMXN0MFc5WEhxb1duS01L?=
 =?utf-8?B?Z1l1LzVtUWRMK01CaEVnWkNzOWNFZldFOWhGYVFzUTY4OHRzT3hseEozL3Rh?=
 =?utf-8?B?S1NYNDUxOGV1bFM2MW9RNTAzalQwOXFlaTJRY1hNb3ZwWHkrOXV6VUFtUXF4?=
 =?utf-8?B?dDN0UEtIWDVZKzJndFlMb0ZlcG52Z0l1MEdhVU1yeUZiQmdqWkd2OVVjRzJB?=
 =?utf-8?B?T0tzZ0t4bGpVRWRLVnpPVW52RkpMRHFINmVPdnNQUmZTVnYzRVdsaUpKUURY?=
 =?utf-8?B?S1pxZHZkWkVtc0J5REtUeXN6T2VPR0JmdWJWbmhIeTB4RVFlQzhvTFVEVVVn?=
 =?utf-8?B?ZEhyUU1aSDdobDBVTWQ2NkVwRW9MaFBCY0piT3c1R2dQVjVCR2R2QzBWaUMw?=
 =?utf-8?B?R1c1eExYRUNnek9WUlA2YXZQa2pUZllBT01HYWFSbThjSjZaRFpZU2RSSTdH?=
 =?utf-8?B?UUNmRTlseThhTkMrMFFyQVJsVzNZM3g4TlM0d0w0R2RiSUREQ1BsSTlxVnJI?=
 =?utf-8?B?SGlHenhlLzZFNGd3YVhYRWg0cFpwWmVET3hMUVl1ZlFuQW8xRXdTN201Wm9u?=
 =?utf-8?B?VFk3U2l2MnRtazl6azlveHpmWkhPU1ZaWlY2UEtxRmo1UkljaS9sYXV6T1RY?=
 =?utf-8?B?MndoUVp4dkp0RkFvUDIrMUZnRWpqMjhDSWxMRTlhTzVDTURTSlVWWEdBa253?=
 =?utf-8?B?bitsaWlaTjM1bitaeUxZWklTWmxjWGE3RGVYby9HaVlqbWNQNXhCKzJkMHZm?=
 =?utf-8?B?a1J5YktsNERRM1NiYzllZjhtKzh6TVJPTlpkbUFNYng4amQvTnJOUkJYMTBV?=
 =?utf-8?B?azVjbnhFaHVoVW1oTHdkZ3FOSTFwdzdtV3VhN09Fd0p5anJVOXpualJTTXJG?=
 =?utf-8?B?Vit3WWc1MWkrS3l0VnlJOWgwNVhEMlBDU0xiY1hRdndubGE0YmNBbmptaytr?=
 =?utf-8?B?aEQrV2dzYnY2VHV2Y0NEWlN2c0RGaFdLT0ZCU2ZTZG54dGV1NWhicll5blpo?=
 =?utf-8?B?Z2crVUsyMzhmdURzYndyM1lsMVlPRjZlMzJXdEZYWFI5WXNMM0lzRjRrRkhD?=
 =?utf-8?B?Rzc4NWNXZFZVOUxBQjZPVFl2NE1la1hoRC9XQ0JMRC82T3NoZ29SOHU1UFZ2?=
 =?utf-8?B?cXN5Ty9RRExhWlp5bU5oR3Vva0pXR2pXMnZPTXlnY2QrYVFnZkhOUHJOMk9w?=
 =?utf-8?B?SG1uclNUUGcvZWk0VWFPbmM1ZDM2akt6dVVWZ1RIdHdzYWFmR1RXQmU5K0k3?=
 =?utf-8?Q?bygemEXMlBA9DlG02l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eaaeb8f-00b6-44b9-28be-08df12cf2532
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:15:00.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5dp18rLjvhebEZw/xIex+Z9bICu/0PF06kI9REa3ygBFVTV7/vopSO3akAL4iO2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5E0E7945E

On Mon Sep 14, 2026 at 3:30 AM EDT, Yeoreum Yun wrote:
> For consistency with psize(), rename read_pmd_pagesize() to
> pmd_psize(). There is no functional change.
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/cow.c                   |  2 +-
>  tools/testing/selftests/mm/folio_split_race_test.c |  2 +-
>  tools/testing/selftests/mm/hmm-tests.c             | 22 +++++++++++-----=
------
>  tools/testing/selftests/mm/khugepaged.c            |  2 +-
>  tools/testing/selftests/mm/migration.c             |  4 ++--
>  tools/testing/selftests/mm/mkdirty.c               |  2 +-
>  tools/testing/selftests/mm/pagemap_ioctl.c         |  2 +-
>  tools/testing/selftests/mm/prctl_thp_disable.c     |  4 ++--
>  tools/testing/selftests/mm/process_madv.c          |  2 +-
>  tools/testing/selftests/mm/soft-dirty.c            |  2 +-
>  tools/testing/selftests/mm/split_huge_page_test.c  |  2 +-
>  tools/testing/selftests/mm/uffd-common.c           |  6 +++---
>  tools/testing/selftests/mm/uffd-unit-tests.c       |  8 ++++----
>  tools/testing/selftests/mm/uffd-wp-mremap.c        |  2 +-
>  tools/testing/selftests/mm/vm_util.c               |  8 ++++----
>  tools/testing/selftests/mm/vm_util.h               |  2 +-
>  16 files changed, 36 insertions(+), 36 deletions(-)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

