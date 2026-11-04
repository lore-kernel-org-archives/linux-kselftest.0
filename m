Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793774620;
	b=I+loy0uHsBq40pmhNqgO/jp3pjcWrG9o8t1QtUD/cPf39kuJI+zCuyc7HF0Qhxp8+6w6
	 kuIxfqUsbvK4fXrQ91mrICRLS1YzOnQT6laRsfBa3K/f1VhiRENtvymp4aoS0HdZtbDqN
	 S1zmzD1LSeYSzp/cvlRgFCmTlWXD+9DMFEXYb78KFWY3nEEn1zeDKXi2/MckKfYr8/U8V
	 u+e84ycOAnK/ocaV+TexNohlOM5Krf2KFKd6ocG5FQdszhPCJksX+uVZpNXpgNe6LzPVA
	 gLMCrz5n19eIXM9fqZxqNSzXiPUQNK7jfCWtZzRfmP+s8ShhA9fnSwiL0I/3lVSbT4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774620;
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
	bh=gk/R5tmFv7vgYLjTuAhZDjXsqJ45dnNcQGG9EMaymaE=;
	b=CRiHyx/I66hpuHHamzF9MwEu60tvU41+C3w/k4HQg+Ik4Uv4xBByA1p0Xwr/Oy1GmvFx
	 Uwx+UhjSq7R9WZz6y4VMWSBv2J07opEinSm02HuNaVpu2M1kMbfFS0Zx6sRb4+BO1M8jr
	 hAxa/Au1pvTn40dN/Y3uRsstnhAroxPnX4h0iz0sN40koF8xBaeja3OBcV0Yg0nBsE57O
	 wMadFzJLbapZf0XTJF45y4skg3TC4Vrw2CURxh8kcfqwaHoS2jFhcM/rDGt1RZBZ4WUXq
	 XYAgmJoxEPUmKSPlPfCaR/O6PSeZFaIqInkWKg6Nr6Piyjx4APxoyKqMZnSujWP+xxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BW4plhnb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.2
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2705606A31B;
	Wed,  4 Nov 2026 06:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2705606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BW4plhnb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NivHNl4Fvdcpgf0YQ4AB+lT+EOcOdiNkVSXWngy9zvdUQ0wGJDem3VdCZ5OAMfSvZ421/v485QeiO32gEuvKe3pFtBZOpGSYAAxlCXDsyQwmi21Jx18wBCHjQH6t+HYEjmfnLB6k5jiw+3dm4X2izd1XB5N6MWxa9/+/v4VfifXJYRXKFnlViALHVFhp1bKzpkf+9Z7ehakaaPP0xQt3mhtmrPwks2wZN6nE80KS8Rpfj+xmG6xPtHZGpeZKfnQD6Bt699KLIYIvwfv72UOV0sn/UVLYR2Ut248Repjy4TNP2BJ6zkMfIxFrOYaE2CiF2FeQpSkhuM6lNWfxO5Rr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gk/R5tmFv7vgYLjTuAhZDjXsqJ45dnNcQGG9EMaymaE=;
 b=GjnbO6gwkaAuw+ksa9CQC/vae6bj7nES0k4uh8f277bxrSECr+nji68Igugo1l1n5VuZ+lVhLmCBzDA+bqEv6xA3XZ+cfsMS58mDXWealDX0QPhx3NUAORSRlCijjhCB4bGepnWlTcuaCrsQCi4CAzBa9wfP9hdJvH+uxNHzHHTNW9VJf2buRWx+bOV0PFXWjw+VbYse+Nb0KTmnQhLQn7SD6uBmgsytdxKduXid8KLVsuo5TXWKNIyKNUBo5SaEoLUxo+3DZOHz5GfnUM5mx/1qfoAjSbEbyM03Gx2tXboP2PfjFtn6vYWTNbu5qdoqPfVURiFCnbVsfn7+ppBr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gk/R5tmFv7vgYLjTuAhZDjXsqJ45dnNcQGG9EMaymaE=;
 b=BW4plhnbKPoVZxzejTxVR1INNKKKhneHiRvSB1VrqfXgbX8bBR4UcBKEmvlTJtht70GzVFdQVhJQLbOMr8sc8GXRi+xZ7r0XZkF6bgi89CnNxv0Y0LuRsntvWqMX4gmVgtfMhXnN4DIVYF9u/UabZJfox8ku5Fw/wq4lTlQihXvRMxFQzSbLXj9E3Zbjiq+9HzCM45MxIG2oey75Ab3rMgoAcv9PfsX4aAmByexX7KDOOn9+r201qoXg7S/Zpuw1Fl9BHDy6/jQsl7ObFvPE6yDQKm59pSCsXo+HCkkG4HZd9p4db02gtN8aWpRm+bUaBKiPzZ+hCvd+nEEmYiNLJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 06:43:37 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 06:43:37 +0000
Date: Wed, 4 Nov 2026 14:43:27 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org, 
	shuah@kernel.org, fenghuay@nvidia.com, Dave.Martin@arm.com, james.morse@arm.com, 
	babu.moger@amd.com, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com, kristinc@nvidia.com
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
Message-ID: <aurOz7iGKInyjddW@MWDK4CY14F>
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com>
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|MN2PR12MB4157:EE_
X-MS-Office365-Filtering-Correlation-Id: 58fe8459-b688-4079-89b7-08df3a3ef3f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|7416014|261022075727099003|4143699003|5023799004|11063799006|261021121427099003|261009223027099003|261022105027099003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|10067099003|20046099003|21026099003|18002099003|22082099003|5123799003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mjCPDS1ny80QSnU8XjOpSe96G2/U/zegOs7Ig8iS2BQcvn17YTnr1u+J1xx27PH9ClxlLW/iQVQAYR/UjzTFJEXTtpLZdoBpEqlMdT4WwwuwR/0XCrBjBFr554/ZuSGXewZoRs6Xt3iHLfvztNKq93KNJAJ6m7/PFIWJaA0Xc4xugUE3u2tJ1MulS6CsB+Iialj4vV5OuREbV05eIpfQUoCv4jZowqcYW3pstv/f8si3ls85ZKclVjVRb/I2iwEp3/lhRK+PUk2zNVulg7p6VRj5UdtUaFu1QKMOmxMOz0LZcaS2JyQMMoWv53A4d5vG4KeJdyFa4p5b/UXswNv2VvGkEL3u7Zdou/ASn2yOHh2qfSxhIVZKLm8DWuKYWmaO4CtiWVdPPOs2NoY+qslyZ+c4l/vZSFXZEZDvC7pQ5wS/vHX+ucUEa0vUCaDg+fiF458Jxweu+hYljZlZ9WcdxH7Z9KLSCM3KWOo1HhDVaWss7owZ1ZF8Aox7YIoTZaXN77LoqZzdSu/SCaaP3k7ydvrPk5FwG8WdQ3a3/ooUP+6G7i8EbralZ/gj5w9AxvuHvwclbFjlBYQ3tKeBDunZ2oJmo740oUQDkV1OBKO5hf6Z0BvnIdqQqz0tpET/CBIJFVhGSl9z4F51xDtEZXsZLcBlOiIB8jmkjRvE0ASXRZ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(7416014)(261022075727099003)(4143699003)(5023799004)(11063799006)(261021121427099003)(261009223027099003)(261022105027099003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(20046099003)(21026099003)(18002099003)(22082099003)(5123799003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+x2M48QHPNo3vLUc17jhIiHF78WwblvbTg0/bPtitvcfxxUpua/0YTGBqab?=
 =?us-ascii?Q?Od4QZcmeo4IcuxyQaMnRPeN4/rxSBA7Y8kL+ixOuZYUNDPGBNCJc33gtWmn3?=
 =?us-ascii?Q?UZG3X6JgC5EfzAQZAWQFPTMgQ07LiEUWeFyQqVMGcr14mfxGD1m7oPRfLcNf?=
 =?us-ascii?Q?A4jwd5+yZCUv+EpFKtoplN9rLwiWkufCrMNsd7Grw1ioc0gMvWrp8G1voLI7?=
 =?us-ascii?Q?60yNg51iwAQ0q4/42uK/DySVb37DRXBr0Y0493JxmQ8FMtuq9bfiTfRUZxKO?=
 =?us-ascii?Q?7Gss130sT/8OfQfZzEcHfCZgQnJV1kVg0TeD7kOvzB8RjTirFZSWBbzO9YAK?=
 =?us-ascii?Q?mhchm5FDYxlPgp2GOpgl8Jg/DPLHP20q44+zdu64Ig8/wPLHfXvObScN/wJq?=
 =?us-ascii?Q?Xy58zjixOR8ygy5mBPKdVs8wRsMgtgUP7CW7dP6mNjf/wdgEx1of6lhOwLOY?=
 =?us-ascii?Q?f0axF/XQhwzvoXJ57t0SM8mZ3IiFMZ933WYHRxC1sqMwqw0/Yq1T9wmOALCK?=
 =?us-ascii?Q?SfC984/aItDrCh0avpF2QMusKh4nHBaCyn+qhe1hg7711gS6R9ZQRt0DMcQ1?=
 =?us-ascii?Q?EZ9h7AqBM0WNcyTzMufHFu101qX5di7/G//SYiydKWSUQijAIuH881+cE43/?=
 =?us-ascii?Q?ZgDXl1tpPu8OzsGfTAortsLgvFVSLZAtAgL/rrxNSmeZFGww0WuG42wibECV?=
 =?us-ascii?Q?PcSFsa7tNOJhIjALOWkTLcOP9iAKVq7GhrGmd7gbpTnIo+nWaKuRgOrk50k7?=
 =?us-ascii?Q?FSTa8+jPX/EyIsr5/SwfeK5hn1bE7Xtk6bbw5FJpBIBTuR4bBahWFpJyAKp6?=
 =?us-ascii?Q?L50NeqJlbqoibdTvcYzSU1k6TURWfx1poofV1hRX5reMVT5+FxrRXtH711Fo?=
 =?us-ascii?Q?fd8HVgWCzVVyzS0lZVpSTeTUjtQgMARY9Dohb2MLZ+hRBJsZqgrh7bShzTk6?=
 =?us-ascii?Q?Ql8mvCAPPx6luJ07TgNFxIFEtnkUQIrfxmax2eE8X5Ery1Kq1QaoXRIlYsqv?=
 =?us-ascii?Q?Gx5Fge/TQqfh4WEXe1xDxXEv0cI5yYcE6HDtYxwwcQTDVwOPi/9B2EGGBpG0?=
 =?us-ascii?Q?XBZWMakKkP0ODfleVGF3EnR+RTTnOouPWFKnouzLmhQHQ7SV/vBA59VNbM8U?=
 =?us-ascii?Q?iqb9DBRyW96Fnh8izGH8H7Al16qRuLDI5vLzcBD/Lupex+OpOnQYPWbyw3DL?=
 =?us-ascii?Q?qLgVmwkqTGpszeXJ1G1el57oTcsgo/t+TGqyi34FzmLHrlPKZUULSuFS7wN9?=
 =?us-ascii?Q?0kIZjqirO7+3x7I5dMq/2NomOyu4We8g+QzCsbItPGZyfTjT3+S30dJ4wctK?=
 =?us-ascii?Q?OWZSMtRNTnVijMtSwdGs5lHD00TrcqDZxpZEkLTCMdbdTluK5oKaTdEYlC31?=
 =?us-ascii?Q?59ft7he7JKDfZGE4clyX7vg8Y3a65QVSn/bQ1RPKXDbaojyTghLCj7akftEE?=
 =?us-ascii?Q?gjhY/WfvKc+F+UV1vmkVvEFAvJP80sNqFY6b29X3m/tT0/UFm6gSBHYP9W+p?=
 =?us-ascii?Q?wpRfgz6bZBtjm5wI9iWnFvfYop4Bl4wQ+pT+BetPngwwOZ0cR7CpQ3gNRMml?=
 =?us-ascii?Q?ZPj1KwpGsVttdhchlrrIxGFxe8vQkZ2t92Ovmj9sEci5xTwvCqfePpBbI0nu?=
 =?us-ascii?Q?CQHK5TmjnJs9TE2uyxrAVI2ULbluSVRtxUODqa1mcRxIlpmvdy6iL6fdTKTc?=
 =?us-ascii?Q?UdBbiMpFZHFsYhn7rPtc0+bxOv4GWk8K4ZEKcwZmXcr04poQIPgzrli2/lkn?=
 =?us-ascii?Q?koI59YrtDw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fe8459-b688-4079-89b7-08df3a3ef3f0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 06:43:36.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJCijDGeqN+OjxdHtEVSj7sQvwrHV2obenE+0xB/BY+4wk509AqvAJmcV1nBvB6cM3aUGUuY0pgjSvfjrY/Wzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157

On Wed, Oct 21, 2026 at 10:55:35AM +0800, Ben Horgan wrote:
> Hi Richard,
> 
> On 20/10/2026 17:30, Ben Horgan wrote:
> > Hi Richard,
> > 
> > Thanks for having a look at the arm64 side of the resctrl selftests. That hasn't had much love but
> > it would be good to have them working properly.
> > 
> > On 12/10/2026 08:47, Richard Cheng wrote:
> >> cl_flush() and sb() compile to empty functions on aarch64, making
> >> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
> >> unflushed state.
> >>
> >> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
> >> loads and stores.
> > 
> > I guess this is referring to the synchronization required for the cache maintenance instruction but
> > that's not what you are using in this patch.
> > 
> >>
> >> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
> >> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
> >> platforms. Instead, dirty each cacheline with a store so that
> >> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
> >> pressure.
> >>
> >> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> >> ---
> >>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
> >> index b9fa7968cd6e..eae0262fe265 100644
> >> --- a/tools/testing/selftests/resctrl/fill_buf.c
> >> +++ b/tools/testing/selftests/resctrl/fill_buf.c
> >> @@ -27,6 +27,9 @@ static void sb(void)
> >>  #if defined(__i386) || defined(__x86_64)
> >>  	asm volatile("sfence\n\t"
> >>  		     : : : "memory");
> >> +#elif defined(__aarch64__)
> >> +	asm volatile("dsb sy\n\t"
> >> +		     : : : "memory");
> >>  #endif
> >>  }
> >>  
> >> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
> >>  #if defined(__i386) || defined(__x86_64)
> >>  	asm volatile("clflush (%0)\n\t"
> >>  		     : : "r"(p) : "memory");
> >> +#elif defined(__aarch64__)
> >> +	/*
> >> +	 * Dirty the cache line with a store. As mem_flush() sweeps
> >> +	 * the full test buffer (sized larger than the SLC), cache pressure
> >> +	 * evicts lines from the SLC via LRU replacement.
> >> +	 */
> >> +	asm volatile("strb wzr, [%0]\n\t"
> >> +		     : : "r"(p) : "memory");
> >>  #endif
> 
> One more thing that occurred to me is that if this is intended to evict all existing data in the
> cache then it would require that the cache portions bitmap for the control group (PARTID) in use is
> set to all 1s. E.g. 'L3:0=0xffff'. Otherwise, you may not affect the whole cache. This likely means
> that the cl_flush() function isn't the right abstraction for MPAM and the test needs a bit of
> restructuring to get this to fit in elegantly. Similarly, to the limbo handler in resctrl you could
> then check the llc_occupancy() to check it's under a "low enough" threshold.
> 
> Thanks,
> 
> Ben
>

Hi Ben,

Thanks for the feedback. I checked the code and ran some tests.
You're right, my implementation writes into the benchmark's own buffer using
the same PARRID/PMG, and the buffer isn't always larger than the SLC.

I can't claim that it produces an eviction sweep 100%.

I think what are want to do is to check whether reducing a group's cache
allocation causes more cache misses, thus the data left in cache from the
previous allocation must not affect the next measurement. That is also
why I want to reuse the concept of Intel's test with CLFLUSH before
warming the buffer under the new allocation.

I'm thinking maybe the assumption can't be achieve on ARM, I ran tests to
measure occupancy before and after each preparation method.

I tried this patch's implement, and "DC CIVAC" since I think it can affectively
invalidate cacheline without throwing old data away, which should left
occupancy almost unchanged.
And one more method with a separate large buffer in another group.

The result turns out like the following

Preparation                     Before (MiB)   After (MiB)
DC CIVAC + DSB SY                     51.19         50.47
zero-byte stores + DSB SY          53.12         56.43
Separate-buffer pressure             53.25          7.14


The current method increased the benchmark group's occupancy instead of
reducing it. "DC CIVAC" left occupancy almost unchanged.
The separate buffer method reduced occupancy very much, but still left data
behind.

It makes me think we should reconsider the test method. I think the goal is
to check whether the MPAM allocation limit works, clearing the cache is only
how the Intel RDT test prepares for that check.

How about we set a group's mask before its worker initialize the buffer and
then run sustained cache traffic and measure occupancy after it settles?
Maybe compare full, half and quarter masks to see whether the allocation limits take effect.

Does that sound like a useful direction for MPAM test for you ?

Best regards,
Richard Cheng.


 
> > 
> > Isn't this cl_flush() used without changing the resctrl control and monitor group (PARTID/PMG)?
> > Hence, I expect you are ending up making the cache full of data associated with the identifiers that
> > the benchmark runs with. Is that the case?
> > 
> > I'm also unclear how this the cat_test will detect any performance differences on arm/MPAM as the
> > perf events would need to specific to the system level cache implementation.
> > 
> > Thanks,
> > 
> > Ben
> > 
> > 
> > 
> >>  }
> >>  
> > 
> 
