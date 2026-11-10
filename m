Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794296014;
	b=BUAhuQEZFFlMJAUCSWikg+yh1LgD9fkcTRKUsozpzmkpmy0S1sqfaGKMJKYPO3T6ulNL
	 vcnG4dC/wgxMOIeq5C05Mb1sG4iLReZ8mni4g7/w+Tbs2ow55dfWRL5EWgnok76bsS5hF
	 2rNRJykkiyBgKfxscbBzAqHA6SAdGRbWRrIkaiiXpudpYqetZKmO3fYdxsBePWbQo1yI/
	 XB62d3lfPdEZHa1GytwCqwVdLGvU1k6iVa+UcdvXGy2nCFfyQbrLxA5EgySj7z2S6/ZTT
	 qSZeRetrmxTUJr5iIFLkIVV0x+Zi2Fz0/L2WhMNr5CPNi55wWjZXuyBcI1oKBsoqhdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296014;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=F2cDWQeo2hYOftlSd7JqLUieWgdzm16G7rZRf8+BxXQ=;
	b=BD7s2QBWLH850sYpxB+7OxVKxksj7QsEkfCwT9GTF37oYx+uYZqlwt1l4cvZvxwV8pXC
	 WG3Arop8OH2HyXwKB/9R/73OnhsgVLWidcUkZgj1VzEHoC9vXq3dYqZxgBP5Jrfvn/fq7
	 dLzIMdEcn5T9c707IbH1LAxLx3NbNMTgK2R8Kwhg74Y5uv+OqEHMY7xX36z/9GhyT5xFN
	 lY7tRLRxO0JBaKg1PDRRWxbyKIUakMUnzsqB1JWuaI+jZghxSUrT/UYixcnzwiqk4e3st
	 /sOyZ7Xamdl0wmzWVDsw+vmaucF73MsVpI4twbdgOr/QFUYXen+I+j4u34WbDYtTdgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Xfd/A3Ra";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.7
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D15606A31C;
	Tue, 10 Nov 2026 07:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xfd/A3Ra
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gViLu/nAhgYwCoFpoMRWYJKRCf+ljxasofLBRDqA5ezAksN27o2qX+mDyv9OSkNqOnqmAPDgpQbBrZkUjksJakZ6ke4ndc78P3Iadr3R5p8KdVI1hHzdB2F40SeX6LVVvgKTHeMVZ3ch8pPfkOTdaFTWwBYCBqY86yGWFv67EoL7LXC/oo8I6UupiaQVWdcd7FZxS+5N/uYuKFcQ8T3T85qFVBcNqjcs+2QLRF6AQMV0+l3XJJTjAtTQeV5ErhdY59NN7YSOiHJ3LBbSGiCxAKEjB7eq4o46uhUcfj4I3JfU49n+jnZmjJkTL+urWfEtl4jsHBY1TutMdQQndt3X8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2cDWQeo2hYOftlSd7JqLUieWgdzm16G7rZRf8+BxXQ=;
 b=AeVnMuD0JS/6jokRa8UBgnEKCysF6mT4UpLhDs4Uqb3bGhEQCruV43y20UlwCpZYJGW/yferPifMkUbGGdwPhmsYMn1gZYkjgg1tCUuDswhmD/yXrAkGoRZOYCk+Ll3J6IzvuGvrNRrVlNs0tunlDAYiN9agX7F8AyWjumfMLQkbVH7njGMxJO17LRJKYUdRXdem2CpPkI5nUGbbbo/rIBzyANtjRm6B0cqE7Cv8PcJYyTxd2QmcImGmCAkgO18IgQYioYGEIta/O8ASV4cakSAHrOFA+kTvEEYUojikx6FLV1X8FBof2iVIwmV1wgZtrNcQfzGlUYv3/ii5LR4Hog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2cDWQeo2hYOftlSd7JqLUieWgdzm16G7rZRf8+BxXQ=;
 b=Xfd/A3RadMcZCIqZ9L6wBMnkEsozGk/be9+UBEEAlVJ16w1MDuWdRASlvf+InjQLfnvEx5aeShQmbFYMVRXCKNfrEOdlVQlXaqoBDooCEFnjLvRjy8fM7cJ2cTDBu9dItnIImiUC4TphgAJ5mN6aSsujz6uU4jkwG9/bgYWDc17ar1m17gFQsvuOsdYc1Cl3L3NdTTUr3SHaJ2lpm7VPSYdX9kX8q1bpAbCWcjNOjoogMZj+HRqn+BjSfLtpXvFnk7NoDbJn0QRTyOmDrg5kdhK+puJsnmXm99/qCsa8tL14+8BOf4xxFnf+WG/7qP+na+lCnxaRWn06Fh71sckdBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 07:33:30 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 07:33:29 +0000
Date: Tue, 10 Nov 2026 15:33:22 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Ben Horgan <ben.horgan@arm.com>, tony.luck@intel.com, x86@kernel.org, 
	shuah@kernel.org, fenghuay@nvidia.com, Dave.Martin@arm.com, james.morse@arm.com, 
	babu.moger@amd.com, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com, kristinc@nvidia.com
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
Message-ID: <avLF-PLcSFCDow5S@MWDK4CY14F>
References: <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com>
 <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com>
 <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
 <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
 <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
 <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
X-ClientProxiedBy: JH0PR01CA0103.apcprd01.prod.exchangelabs.com
 (2603:1096:990:58::7) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM6PR12MB4250:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bccea8b-e8b5-44c4-a3a2-08df3efcea2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|10067099003|11063799006|56012099006|261026121527099003|261028144727099003|261022105027099003|261022115727099003|261022075727099003|261026140227099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	i0bPB8XUSjeL91tfQ7+2QD0OIrB3okM10BhZ6nnOW0RLLaiQ3MYlOqrbCsUYPbgzOwiKRg0RDA2MvwUiZP904S3BkhW/oAlbpYBrd6NnnaTrZa3BnJ5K7FVz7T9tZpItKkOOM+x6jk2wdD2JbShocqq66XrCmA+MbqzyAAui29AA/DsHkLog+gMOMm9zLknmWT5wLk8lPxyqKEB1kKFFjQvdqJHnOhLNaBCWRoj7vo9Y8OAZK3ERcuVH2xobFQFIeV4gDSpcDZG7sQmQxkWW+OvSMe+Wl49xULg1HL3jxkDzHNcgW+KHJN4OrbijW+9yfoKiiIgIX1SLiHgnGi9RXOLp+xz47uwjGUOw/wf0UW4cowIf4bRsF5xqZFb1PhyJttrru4HS5wY8J6bT+9RPzDrcIRYbUPRjL4NzXwrfmEGgpYGBzKcvMqxBEQyVrEbN6mgswBTn6fQaCIA4g8y6WvtH3FSeKEkuk9MIdHlJO6Hsz+ASSvS2rowil3fQ+ZsTjgItmVoZB74viW/R4Of6y569ZgAudwkI8B2wOjNBXUbHWLnBKGEx3xWe3x3CcmSF/aSJrXv4X5HwvnHpcQYHmOzKIGR/cDyhMh2MiskoapIoy6LfL8Zob1WIEGUAcP+scLcxCKxQRzQyxgh08TqPKLNZ4Ikjuj4PaH8sVzOscTw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261028144727099003)(261022105027099003)(261022115727099003)(261022075727099003)(261026140227099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X8TpymcVdaAxVbw2vAWoMst1h0J4hOu5YIb4H9XWIhQ903OS1hAE2BftkATg?=
 =?us-ascii?Q?Dx8WvtxX07JPmdhTq9lxO8CkZs/N1eR/IKu4kKG79S6+Lus+myNVHkwJv4sH?=
 =?us-ascii?Q?XXvDCmp85xsRTMKkiiCnfPopcVhwS9QSLM9cJgorHzZKy1PUSNDUvvKkR6px?=
 =?us-ascii?Q?K3/e5Ekol2TYdFDaHlPxssEW2x0m7ZHIQhre1AAdSAYswaWCmipKJSVC93Yn?=
 =?us-ascii?Q?RzkXBYALHI8/0uiSZ5k7FcJUa1KMF/uR8kMqrHvuCDPfiKBNlh7Uor+o8Sfi?=
 =?us-ascii?Q?1UZSKIktgJPpBmRh7CKZiWQAliW7qjGQTpzjdYeBZ1jk8+w+VeoE7zqXYyon?=
 =?us-ascii?Q?fYsxAAjunj0pZtLjZitbWB/Gfe88olMOFW+XepyE0f1OzZdCHCV9REO0y8Lj?=
 =?us-ascii?Q?tOThNwwiWViw7NqQGqHlYnrcReei3Gw0VCYrUXZmeBnBJiGPlGoQFt4x+E3L?=
 =?us-ascii?Q?Jx5rf9kmzI5gQ9cvjDBooju6qNJjTJUmzacKTNkx59aMIXh3dyQB1YAkCB2n?=
 =?us-ascii?Q?i1fa6Vn2EOujv4KE4uXhmTqgpj3/i45cmAyU3FupIQb4vHNEdtOZKsM9RyTr?=
 =?us-ascii?Q?R+DfwK3ltsVPHiJ6uNFrF9Qiq0itUzlgsYgv4G5kJJ1e+fyW3HMiz/oMcB5P?=
 =?us-ascii?Q?MvFdtQrHp8xDTAL1P38xGd3/xk/lT0B3uF1dank3ZL6k3kq5Dxe9NKyGl6c1?=
 =?us-ascii?Q?l7N0fuvVaZzyfhAfcQerv6cb8SZAaDXaOwCcWtk5YDsgzRDgeFM+U6KAAmtI?=
 =?us-ascii?Q?HklDGbBriv9fgUgzcQeeObGUwd3hv2pD6RymCfw0i+5UpGewZYLpypG7OcdP?=
 =?us-ascii?Q?Ze0kfSUNB3h2p5z4IABr1LZQeutWrFnjQxZggtxFKUxRm3zMm4EzZZOFrCdF?=
 =?us-ascii?Q?JskLS3n2ngoeyHb3tQhFv2f1oq7x93m1tm5GV2uXcrv2sDI53Vd0xYvGcBLN?=
 =?us-ascii?Q?Gv8bOhceBam9FuhC77y6PElxYlaGQzVcdN9j/gGBrrGBR9wtDjsbINxfBjiK?=
 =?us-ascii?Q?lNdBWIYJazuddZe4CBFVXhQBYAoAMC8SEzDvdKhM9FDc4b2OOy5Q2S4P22nG?=
 =?us-ascii?Q?W3pLdUUHffybp392naL65iZ9IVcfLlmiyl3LK/CHdr/3FSjuTp5wCBJ7NsMU?=
 =?us-ascii?Q?UchoTO7A2iNHHAP6KRuS1jI+BVaYdpLtBwxTRpvwdkxPMEj+RG7K+LbE2O0u?=
 =?us-ascii?Q?KMMDdB9a0KaxBgBjFafuUsy0+0NZs23BcOzZTgM0gcPnDmm53UmNu8Igi+tq?=
 =?us-ascii?Q?87t2ehrfTB22G42UPcTDNKczKNUUdgVwiBFsFp8bKWrs3KTWMai/B7rg9YMe?=
 =?us-ascii?Q?0wUXmuoN5joOMOpBFyegaYgNqv6DAC7CFFUiAWoS/KQC91js3+jyPFTudPek?=
 =?us-ascii?Q?IGHz4z1w2nnsRUUIlEL92TRINNbgEVcdbfSKOKYrhXZfF5i1g7Yrgew7HCZi?=
 =?us-ascii?Q?9Ud5Iv+AS9ThaVuP96oCSZV/xPuboov6sTa4F1OkY88et19xhpj3C8ymY0Bt?=
 =?us-ascii?Q?Z6s+1PWAYsslbZbgAOteKPDyEIeWTRR/F4T9vA9WOtZygEdrYZB4TmWmxjCV?=
 =?us-ascii?Q?ip3OkHmSVjLGHivVYLrIvyktmtsxeTl0+2HLRrzBiew68rWL9QX2cNLRry3H?=
 =?us-ascii?Q?3ETlpYu3ExqgtFtc6mAigo6xgwanEzUXO8Vc2XZ5MyvTmwDMQvs4F437akh0?=
 =?us-ascii?Q?p7Rmgzuly4xIlOsc0OO2I863bHcoe64eQS9M1eMzHhAg0bA+spRdIAIiNns2?=
 =?us-ascii?Q?Ux0CALTO/A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bccea8b-e8b5-44c4-a3a2-08df3efcea2a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 07:33:29.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQGhkgdUbPyyO6NAj0BIVnYssxtdEqgMpcnkQfCxoYFSXJ1jgwFAVwW04eQsHbt0ZpsQMHLp8IFzHZn/WGgfgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250

On Mon, Nov 09, 2026 at 09:01:18AM +0800, Reinette Chatre wrote:
> Hi Ben,
> 
> On 11/13/26 7:16 PM, Ben Horgan wrote:
> > On 07/11/2026 00:29, Reinette Chatre wrote:
> 
> ... 
> >>
> >> If you do end up using a benchmark I'd suggest to make the checks as forgiving as
> >> possible. For example, instead of checking something like "LLC occupancy needs to be
> >> X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
> >> is larger than LLC occupancy when only half of bitmap is ones".
> > 
> > Do you think it's too strong to say that a bitmap with n + 1 bits set
> > has higher occupancy than one with n bits set? I think it has slightly
> > more utility in that all bits of the bitmap are plumbed down to a
> > working control but I'm ok with a weaker check if a stronger check will
> > just be problematic and maintenance heavy.
> 
> My comment was motivated by the recent change I needed to make to the CAT test
> that uses cache misses measured via perf instead of cache occupancy. Originally
> this test incremented the bitmap with one at each cycle but incrementing it with
> two proved to be more robust.
> 
> What you are proposing sounds more like an enhancement to the CMT test that
> uses cache occupancy as measurement while following the same methodology as the
> CAT test. At the moment the CMT test just uses a single cycle of a hardcoded
> (unless user provides something else) bitmap with five bits set. Even with this
> I needed add enhancements to make it more robust:
> 
>  commit ca0ea39288c9 ("selftests/resctrl: Reduce interference from L2 occupancy during cache occupancy test")
>  commit 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
> 
> As one enhancement highlights the accuracy can be managed better on a system that
> supports L2 as well as L3 allocation. Not all systems able to run such test will have such
> capability. Also, looks like CMT does not require there to not be interference as the CAT
> test does but with MPAM systems having each cache portion as shareable this may also be
> a big influence on accuracy.
> 
> I am not able to judge if a test that uses LLC occupancy and relies on single bit increments
> will be robust across all platforms of all architectures. Even so, I do see several risks
> for such test to be reliable while I do not see how such fine grained increment provides
> insight into resctrl kernel subsystem health.
> 
> Reinette
> 
>

Hi Ben, Reinette,

I am thinking what about thinking in reserve ?
Maybe narrow the test to detect an ignored or overly permissive allocation
resctriction ?

Imagine a small cache mask 0x001, and check whether occupancy exceed the
capacity represented by that bitmap.
L2 effect or lack of control for L2 thus won't be an issue here.

Ofcourse we still need to think of how to cleanup pre-existing occupancy,
or a whole new workload everytime that the pattern is guaranteed to be
freshly new.

Thoughts ?

Best regards,
Richard Cheng.
 
