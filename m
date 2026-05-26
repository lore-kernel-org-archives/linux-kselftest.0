Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B372192FA;
	Tue, 26 May 2026 02:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763883; cv=fail; b=vAZ1PqV6hNPmbky8HRH5q9ehoehXUDPyZ2NMieJgNPhfzF05KF3J+1O/0gDzN5Mwb5kcRSCfweRWs7YJfXuinDA2OtkGGGYVUxsOvN5rVsu47WJBlDrHS/acd/Z7weumzTfMvRxAuhBQ0p6CDxSFc7GJgo7V9VpY5/KG8UbiMfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763883; c=relaxed/simple;
	bh=oN5OSfQciCHqwZrG/AyGskaw9kjo1ipdbHbZIALQGtg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aUEUPpWz3ZZF50EU/be8tiv9u48WPInEbY4dA+l43aJubOiCJb0ABsTD1jekKPsd58DUba2eGlAO9iG3RY2uJ913hVJ9z+baBrbPLJ9e+/Okn5WHHopgC6ktT7ZTBOWwcp7360SaTFnfTNhStNLMCTMt7bEd3Cacy825NZWOoxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H6DhvnkE; arc=fail smtp.client-ip=40.93.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H6DhvnkE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bu7lDlSwbdnePo4HOzXYcYb3uHa3a34kUWsH/u8Qc4xp0QYVwE5UWMTX+Dwc8qCFNThF6NsU+ZD7ArTqgn1jvhfLM7P6YGC3Ja/PRyaWTQJjI+tlScDfdxKFynBkZH+lwHBslLhqi+zkdC4DWBFxcaZQoIz/c0sHYHch6DSavB7hLTWx3+SHerMs4o0YAYWotqZU1vGS3Gwxc4T44lVoilA/A3TteirO3ga9b898DlJ/YAPkEURgxpsi/5wCt2I5RNZ904hzdG46CwPlprAlSLAHJHtQm8k+ymgWxtqXGAj7tmeKMkEOlRCpRTl8sYF1uZJsDL0d3wOxYjkV3EHa5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POw528WgX3NdmFlIYIRikkfsjFL65EVxe83pd31Hook=;
 b=ks0OOcWXy+0/W3t2+G5FsT1jIe8ZZeShowW6IBnWVB0iJt8t+4Yx58nB3YW686Zdstyhxf6rXibL5NRb602swiKKM/cYQQvzcqcPVY9O/EvIgN3M0lbXsUdwGIlaJSfp+j4lM7n0j8pHcEn6P3sy2QEscE8gSLRxWStSgvcdtai4Hy7JPndvN4X2f5JPeBl65iNX9Ahd5vocKiI1UP4v/JV8GUp1lsLEIKHf0mOQyIqosTdNfmh8MWio87/HP4f269CxeZDdDCNGrPPe/lNSTuKhcaAFthB0FDyLTRaVmynpyRNQV9rPTfSRKkIO0vZzSbKYDDOc+Iyy5DTxrbDLCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POw528WgX3NdmFlIYIRikkfsjFL65EVxe83pd31Hook=;
 b=H6DhvnkE0AzjMsEsXoFLECmtVaOkmE6deNEq/POLVzJ/R1LU4vxdXEHLeGcybPPh5piTpy5/Xwighfe3dHjqmwDSLgMkT997tQWVW2H9oBIGpywxg18ahOzdjCOSFH4i3+cdeF6I1qDWpEmBQ/4DCnSkz9tk4hcbjI+pKnlAzmkClGsddkO0ii75E0ehO5KgimlmEgxG/xi9DcQknTQx0q3VTdlWW/ibTwlb7dI19qNYxZT1pCmQnQv/ZO/yhIFGfgUGn2GFTCyBXrFdtqFnzvSdPvLsoaFu8iDrzGtVgLEog1gB5GTQFeRf5Qle8Ss4Ayo46NWV/kRTvKcKCdBuOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:51:19 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:51:18 +0000
Message-ID: <b1dd5e10-9121-458b-bce9-0955aa658b40@nvidia.com>
Date: Mon, 25 May 2026 19:51:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/resctrl: Add ARM vendor detection and fix
 non-contig CBM check
To: Richard Cheng <icheng@nvidia.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, shuah@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 newtonl@nvidia.com, kristinc@nvidia.com, kaihengf@nvidia.com,
 kobak@nvidia.com
References: <20260526023955.7681-1-icheng@nvidia.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20260526023955.7681-1-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 76de2e46-3788-46f4-897e-08debad1a93e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a49+wpdnkuRL+IvOB14TXTsVqzcF403PtRr+6CE6kLoNhdAJvKnviPHU/mnBqCsOlx+tQ9rGTmhRFD96jcWq2e+H9QgfCjeEn7ek8gkgSpiuII15bC7PXTSTlIvMml59O8QQp4YOto4Wmw6lHQgR3ILH+jY0meIZrlJLnDJryC9fPNBJL6XAifvKC5sZzzqHmOdcqTF2JoCEC2dWIQyJlwEEnxQZ25EBQCHUfTmFChg4z+CxWgfZgfbWJI4XGDOADaGiO2MxY6Kjt3zTIqdbhIKQXgwLmpWulKeLHsYBSKyutnE9TpTLyVzbtyZKjRxgnyqFLSwEYww507gExI89abuVKS3F5SJbmdON/JIy+W5TEbWdlekt31P0DLCR0fU7ch1vNYVf4197yPk8vyWADeBiDeekuchIgRIUqwtC+qkXcuMclCpnao2TGj93jI2zfmShC13mCdAl3JxNatzLdpfPD38fdvzxYrDhPZzBg58wtDqoIllS+iy3go+d0jq90/MVb0j45RHUfYf62ioJvqaLV7/xO8gpLB6mgWrdiCAY4sTVezsHjx6YyFbrVUFQX5wlDBHKWc5qXlf8ErQ00L5bFNw7fvaDFXOCBfOzgGuXBeVxbqGI2p1lI03Gt5TbLAy98sUAyZBL7sFmXaNkwA6HGZ2pqateBSizp+I5sKdzjw7UDbtTWmsRcKDRpEa3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEhjWnJGOHorc3g5Y3UxVmJCdmZ1VUdJdTZMYXdqdWlYeDBzR3BtQURvS3Fp?=
 =?utf-8?B?cFpZYkpQTEVoRVlxTmtPQXpRcFdZTlE2VWVNdytnUUxmY3pnV3o3Si9TSkZO?=
 =?utf-8?B?R3BKT0ZBRWpWejMwenEwWTBrc3hVUFo4T05QZG0xclpySGZyOTYzQXltOFVO?=
 =?utf-8?B?VytTVWVNcThTVm9LbXJuUVVVZi9WTlQwOEJaZVRQSEU0bTFDY2c4TmJlME1q?=
 =?utf-8?B?V1R4eURPVGVnQkREV09SWTJxd081eCtBT2tkb1hQSnhTekZLeTJjWnhIU3I4?=
 =?utf-8?B?RTE2YXFGTlpUcFYwVy9iMmdXaVB4MUtONW9ia2c3NUxaWHVoVjdjL20zVmNW?=
 =?utf-8?B?YjcxLzVQcXpsNkFJM3NhOWFLcHNaZXN0L05temFSZEtvbjllc0ZZTG9NM25j?=
 =?utf-8?B?eXdCd0NSWnltZVJDN1g3dm8vSGttMWphSm9YMUV5Vmd3Y0w1QTBKQlR5Vk52?=
 =?utf-8?B?U3M2VUpkRnhFUDlDazFHU3VXK3Y5YVBSdnZkd2lQZ1lKMEtXY0JKcVdhYTFV?=
 =?utf-8?B?c1ZJWmRFS09GMU9ZanZ1SW01d3htb25pc2t3N2xrbmREdkY2a01iRkorbTlv?=
 =?utf-8?B?bVBTSWo4MGo5cFcyaTlEUmM1V0l4ZllkNEt3SEw1WDFycFpuQWhjQlFpcU5H?=
 =?utf-8?B?Tm1CWWxWUkM2dXZvTHNoWm84WGVzTStiVDJ3SjFqR2laQVpDb2tNZDZFTlFS?=
 =?utf-8?B?cUpXa2JJZlRvQzQvTFgvYXRjUWFuMkN2eWowUzBiOHYzUmpOY05FOFhpTVht?=
 =?utf-8?B?TVRSY2JLejRwZC8ybXV5MWoxb1VFdkhrME5CSW9Fa09laGpXM0lFMmorOW1u?=
 =?utf-8?B?VmJCaFh3cmNLOEhIckRzYWVxUnlmQjcvRFd2bU9NL0dXZ1M3WTNGR0l2MzFh?=
 =?utf-8?B?VEROdWlqSDg1RTRRVGZ3SnQwMTdZS1U4czZkRkVUV1hRSlk5MGk5aUFCYjdr?=
 =?utf-8?B?c3lBdnFGajl6Y2xNTkhlWVIvZEF5cEJpTWg0MlVlSGxMTVVKK1czSjZlQ2Fk?=
 =?utf-8?B?c2haUHJwZmZYbnBhWnlwWUIvaXYyZVRySFYrak1SMFdFc2I5YUhiZVlGbWo5?=
 =?utf-8?B?Qld4cC9wcWhSOUZnYng1eVRrSHJhRDFRR2ZLdDIwS0RQbnRKZW04OE82M2tN?=
 =?utf-8?B?QmJpWWFHK0xnTnpOdHcyWWc0UjMveFpIeVMyUG9uSGxyMTZFNkNDei85ZXNa?=
 =?utf-8?B?dW90Wk9FcEhSUlh5cWYvenVMR0ZGdi9DdklJYzhQYTAwTlpRekM1d3ZQNEh0?=
 =?utf-8?B?TmZmSHQ1V0lwMnBSUkVMU0ZvRWt6WUpXT20xK3FuVDFZNGtqUGFHZkNIQTE4?=
 =?utf-8?B?RDd1cGZ2R0txY1p0M3RpenJHVmhwMEVIV3NpbzRvd0pSajQ3aXRWZVovcS8z?=
 =?utf-8?B?eFZmc2RJQk5taTRSSDN2eGlEYlljKzRUK0xpaVU3ejI2RHlsaDN2ZmVLNTVB?=
 =?utf-8?B?NklZSkdLRWVzb0Y5Yk43cGliWnlMbFJaaVZEZzBqNU1uUTZQZEpaR1N4SWpL?=
 =?utf-8?B?K1hjY21EU3E2NlArQ3RoTkxGdVdzaFFmTUR2OUpNNFdFL20yc1hPNDRxaHhv?=
 =?utf-8?B?S3g4cEZsWlUxb1JsNkEwdnBTV2VjVDlQWkZJazQzL1MxcFJOeG5LSUszYXBs?=
 =?utf-8?B?MklHd3UyZUFpUzROMHZxZ1dqczFodWg3YnZ0SnM0dWlPNm85d1V0M3oxK1kv?=
 =?utf-8?B?WjM1aDBHRS9qdklucjk4cHFrRUVQT29pU0gzTVhoTDBMNHhwTTBXYjdBbE1q?=
 =?utf-8?B?VmlkS0M4VElTbmFWc25Cb0ZFSnNWektuVW9MK3Zzbklad29sc0F2cVFUTTZy?=
 =?utf-8?B?dkNQbmJOV2lFZE1Bc3JZaWtaelhLRkp5cTNqK3VPNlhUL2RuMUxUcGdCME1D?=
 =?utf-8?B?V2t4ZTFxQW9lQkJaOVJ6M0o1dFhrVGRvZVgxZTBuZmZIM1JPTUh2T1lZVHly?=
 =?utf-8?B?TVhIQThTdm1lOEJNK05MaHoxQXZZOVlLQUd2WGZ5OFJmdEMvMS9zWUZnMHk0?=
 =?utf-8?B?L3gyeGFySlorWFdXOUtiQ2NuYzN5aGk3eHUwT0dPdXZMdTNnQUVtOUxIeXVN?=
 =?utf-8?B?TXZsL2FaclNVTWNXZGU0a1BGdFRUVWtvem9iWnozcXN4ZUE2L0NDTTI0Nk4r?=
 =?utf-8?B?MnVHTExPNi9yenF0b1hweGFKUFdYVGl2WjBEYTZTU2NyYmlOU3dYK1o1ZXZN?=
 =?utf-8?B?UGFjSTVZMERJbWlkRjh4NHRiK3ZFckpxV2IxRklSL2NjTllYQlg4ckNBVmpW?=
 =?utf-8?B?Wk52WUMyVDNoUFBHQlRCQkpyMEtiSXQyeS9HTG9pUEtidkd1aG5ORDZIa2lI?=
 =?utf-8?B?L2dKZXdjL3BmUXFvYUNEbS84aGc5VWtnVFlQSnBTU1l1WEVPa3o4dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76de2e46-3788-46f4-897e-08debad1a93e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:51:18.5384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s24m0BAW9BfTo9uhRTu5Bk2ZKNZVc1eVOQ06qOvsQF1uewGLj5OP0Eul8oRkEXU3z9lOn4TxIo3THoFTtjwaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926

Hi, Richard,

On 5/25/26 19:39, Richard Cheng wrote:
> aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
> and arch_supports_noncont_cat() falls through to "return false".
> L3_NONCONT_CAT spuriously fails on every ARM MPAM platform.
> 
> Define ARCH_ARM, short-circuite detect_vendor() to it on aarch64, and
> add it to the AMD/Hygon alwasy-supports early-out in
> arch_support_noncont_cat().
> 
> aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc...) but MPAM
> mandates non-contiguous CPBM uniformly, so per-implementer bits is not
> needed here.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>

I see you have three patches for selftest. Seems they are together. But 
they are not assembled in a series like [PATCH 1/3], [PATCH 2/3], [PATCH 
3/3].

Could you please send them in a series?

Thanks.

-Fenghua
