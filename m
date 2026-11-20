Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167101;
	b=nlelyNCEJYCKn/Q3XWYqkac1lw90q1VABiQ6Yo/NOjv0mSV6r8ou2sucQCiqjMT1kegP
	 9IFtaVXTF5ggDkMhOlejrKAj0y+ByXfcwCZzK1nv0uJMpPQoZ6qZ1S8YM6sPRxhL1M+0Z
	 Bqs9um6XjRYmqvafqdw2jIE/cFnHIVQS2vjhSfnAhHRIvyCwTVCmdv/pci3+8b5dsIm9T
	 fEfWQIkiZMZvnsJDDzlnOGsiVbouXw3emfPWQcRHAJrY8J7ajNNaG421/rbiTR2+Oc4IA
	 lrYiF8GjuBQwk0ww/K3nRyliuuiteTuYRcgJGDBiZeTd6OBucg5bQxUcpj1Vjo2n8Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167101;
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
	bh=6ZGy9F30UWfG+T+Iayt8DWVmsn//bJaBZ3BowH1hOjk=;
	b=qCPzg0pB9+IQBJEe676BIIeStuSIHpXcxPPy51eBcVHZ4DSPvFpRFZI6aQxCIkQ1URk3
	 wFWzTam3G378JT0/BD/wYIqmD4+PxrXNWt9BIofpRs58+gnAQtAqehWpu/wnInqle0QDH
	 +fUfO5BvlIhcmF68yTgtRlxJ9DMFRP5N7+glKe8RJ+0OSFV4VS4Z2Oa42duEhn7Kt7ZkA
	 wfApF7AKDjFZGAX47R9WYTYn8HXWwsNH/B3S+Uz+acsOHEYcnqLuyEg2XxD1RZiX9EQSc
	 5ee/JMRWAayUVt/q+GWPwG+Q5sM6HIGpAZ94WANgqlJDkriIlS2uGGndCFvCSoxFfvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=si4DrF94;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.71
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B6606A320;
	Fri, 20 Nov 2026 09:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9B6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=si4DrF94
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkPTF26AeSoMnsuPDE3CtklW14katQ8vNNX2+5Efw3G8vmB773jGVwocc7Byqul2ItBi+COUqLg62pGJdGlDMM2+o4d/4VwwTSmxio2lS13+/OhH6NWXZYGR1XM+Z5qqFd1b4Caqpj7gmbVSLsKVkJNdNCYCswONDL8ZatZsPcof1DsOYEgkz93jGfU2C0gH3aO2up7w/K5heqyqNPG1gZwuWuBY0zxP3bDxx1pltR9tkldu/WgkSYB1LHO5aa/0vFSPSs3BuDjH9ov/y7H3KXqeqhgBBm4GzdayqlpFZlBsJPgfAdQb6j3ncxJIzzHyzeR77j5uk3TABjeMmCDucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZGy9F30UWfG+T+Iayt8DWVmsn//bJaBZ3BowH1hOjk=;
 b=VOqQRCdmp9ov5A7cqCmQ8LeK1xJc7kPeuCh0QTo8TQkXR8qs5PjSrq3N1coNCDGHxOkxIZGhdRXzD1u1qd3nAgwDXLHaWnp+t3AoXDXkNB0CPQ5aPPgbsQymTvrDDoNxxoBA8RQLZS9WNLGqnceTQDKUusVv7gQo02etPato7o4+J80FIxdOI1ySUNb+c2DIjZ4DLVy5mazwaCN/K0Kz+r0PIjZrjH23/4e77/KN9Ugwx4SdY1HmNTEDozlmr9we3j2Wiaezo1ILOacC/GPxecG5LworhmmLX4gI8exm/7bZNSGYmwFiFokPUSWsu3eDtflxsoRA8v405Qo3DytqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZGy9F30UWfG+T+Iayt8DWVmsn//bJaBZ3BowH1hOjk=;
 b=si4DrF94DeCnYKbkWv08dfQJ70qcfEFQaVQnrZIe7g/IMyWc5EsWjzrf/bjNEXbLVv+YyGH9sRG1g7EUSm55kkyFtcw1l18btYFGtIbbX3SU7WLHj59OqqzXnNOm9cHmuYRCVUQSDOBmBZgEQ2EW7z2J9lK5pW+RLQiGOQ7KwOlFkOHI5BU84K992Zd0QVyapFf0caZX4LfeyN/ZeY08rpnjBT1AaVwGUIKQH696pSoJEjzKPWKBjKlpNXmg4ogI27caA+6N7NjzssYrVDMJSXw4fxqo11znJ7T/L/vAYgLBybtpKi2VEF5qC3lic+XpD4FpZDiVLbtWPZ7pLMgOog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SJ5PPF0529573EF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::987) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 09:31:37 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.009; Fri, 20 Nov 2026
 09:31:37 +0000
Date: Fri, 20 Nov 2026 17:31:30 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, shuah@kernel.org, 
	fenghuay@nvidia.com, x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, 
	babu.moger@amd.com, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com, kristinc@nvidia.com
Subject: Re: [PATCH v6 1/2] selftests/resctrl: Fix CMT test failure when all
 cache bits are tested
Message-ID: <awAS_P8FGFnjkFDL@MWDK4CY14F>
References: <20261114140108.36954-1-icheng@nvidia.com>
 <20261114140108.36954-2-icheng@nvidia.com>
 <6ae02c7b-69a3-43a1-bcd5-639780e2a0f2@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ae02c7b-69a3-43a1-bcd5-639780e2a0f2@arm.com>
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To BL0PR12MB2370.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SJ5PPF0529573EF:EE_
X-MS-Office365-Filtering-Correlation-Id: fbff0692-e495-453f-0093-08df46e91311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|261021123027099003|56012099006|4143699003|261022105027099003|261026140227099003|11063799006|261021121427099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	T9sWiIDxjz7ZjFuqs8JdkjR+7UtnwcJbS30GJ9fqz0/sIYzjbtIoqqAdO/jSnLK38g+9NTLe9tfr+wUEvqqFuiiNPparxPojddLKRUpzguMf3oqZJtZb5A4PA/ZP6rVo5PbAgotY6v/0CC7tTiC2XgZ2ohXu+lzz0QLpheRoiiOk60/ARdwCfauF9tE+U3s/mOFvHCv7XQhVnCul2QRM79w2a/60yLJVPj3wpPJ5f9bIAPJZ/T4ydbukSEdHk+dKRIznPqflc7JMKMjd9cj8viRNZCbHzZwXdY0/mVSPof5qsryO+/pTxHMN+DGV4YEeGMOLl7sQq3I1R4GhKIIcG5tvOWBGO0o6UPlGiS6qiqKlrnhehHIuUrXoc6yQinv2jCeYLYE4DXR/21t1ilVVilEP/B7JMawJsHzGC6fLOl4pP2o8TS5rUkZ0FjUaY4d5FI2LsJC1Xq0SGINv7Uvpd8NRuwpXCZaIifa7iPxqgz+yIG+U6UrAsjlOUjNHTkXH8IS0I0HknbpT/CXJKgOk2/EDR6QB6H7717R/wXOjLzl5bifjmOt5KdqAafTFtFj8/XCtCj6MqDlf7bG1H02n3kN/0JAIbzRV585zFSK4UcgUeQ1FpMjJ7M2Qe2MGmOOMfODdQZR8QpXs9PiDEaygdEBtdHxpwe3dnZR4psloKkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(261021123027099003)(56012099006)(4143699003)(261022105027099003)(261026140227099003)(11063799006)(261021121427099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cAuIcInfpd02YZ7ct3s5Cyiud702OjvvAAHZUBrBPxB2rqwczWNMrpGgXrxl?=
 =?us-ascii?Q?+YRiKcD1x5CS1UNksYHpBwJ9HoZgzDllDdT+H8YExHUB22C252J0UCYx4OPg?=
 =?us-ascii?Q?54iAFepLZEsb2pujoo13u94lzjtk4NaaMFUnF+InbCsnbuD/fDh9igkpsaCZ?=
 =?us-ascii?Q?6btCN0cNhyv9WHTADbX9YscjMCJ9wygfOLF5J2pDSLwu+vfC3ulKqYyrF4Hm?=
 =?us-ascii?Q?Pjm3nvxqApX7Tgg4G7noCcdTsWQamJrxo0pjh4e0js+lJ4s74TH4Gyb3P+nH?=
 =?us-ascii?Q?FDEOEt5GHHlsZF89WHKA5Hc2p0XusO7p837Rw/28VLDf4ehghBiO1PIjZu8s?=
 =?us-ascii?Q?xRjyM3Hju0y0CxBs/70Oib+z69x9XS2fw4W8CE8RgD+Jusu6g7i9Dmxo6yO5?=
 =?us-ascii?Q?GH+oDxBdWQmc30tJwdwIoBqwwDDEZzFzQrRQbtGYQvSJjuX4Q3YiIgnRLY5p?=
 =?us-ascii?Q?0bugIPUq+4afE5wejNUTaL6rYBGn0h7npRRzUNR8xABASaydJjS2iDvYGlYf?=
 =?us-ascii?Q?FUrD6lnlGzTDqKNmwxijvVZecL8d9d7mhsnCtv54hn2wx8dxRQztcSsuaClb?=
 =?us-ascii?Q?DxAxfbsyIX5R6pf4LeECWB+B1aeCzXTH6XtvUrw9kWMXdNEVmhX0exJLMuoR?=
 =?us-ascii?Q?gKVAZ1MrIa+BSc66o8lRjp0DCgmGv8Zod9LoW0hqYNPhBKHF/2JYSH50Bxnb?=
 =?us-ascii?Q?XACdYDo32UUgtHMUSnp41cZntVoOL4WLgz0xbnB4yNAVYmaLMD3MRvjhM2XQ?=
 =?us-ascii?Q?2KxzMf+01TvxgzgQ9LQOIc7nFhDmRTLtpC6XKXQ9D47ylWMpu4gGe07RViRF?=
 =?us-ascii?Q?JWCWMRCbV80peJl2pA1a7bVIzcLHiVfcKjbGY3Tk5fVcO1zKji2oSHmE4wjj?=
 =?us-ascii?Q?Z81Oc2HPII+Y02B2zAxcgyYkzKDf/ybvHuy8SuMaq+Z9zB8rV34V2CSFADUF?=
 =?us-ascii?Q?IuIWIRR7SKaTnVEDf/SuMhHeH8AY/R7PRIEP8SLoKBVLVS5MREXrLieB4goD?=
 =?us-ascii?Q?6bhgmV9z11gWie/J7mbUTS5/v1WDcbeOei9Ol66m9zaN0aO4Xxs/oXKvg1P8?=
 =?us-ascii?Q?yVG+pKLHcwPkkzRrWt9HSesz7/qIWHeSm/18JzbUhoSxE+ZVbtRVPRjBpO4A?=
 =?us-ascii?Q?Cz79f28OiZON9iKPH9ccwdNPRXcQ8SiIyhO1VibjjwuerMzwssPNmUqCffM7?=
 =?us-ascii?Q?RvxM37QXsZ3XfgOXjO287ItFdS6sKReO1qh2J1XPPZbTIxYBO1JuQ/wf8DX5?=
 =?us-ascii?Q?i3x4O4WdPy4umeyuMDxtfwOLtk10g9TOEh5si9wq47rouuH1L4SAAiQtZNWv?=
 =?us-ascii?Q?oNvoxsNRZ22B0skUEIQvB3TAi+V+u7amc9Xa40a+tklp2tcK3VIaiL29BVSi?=
 =?us-ascii?Q?t4jZh1dtCWrayeaCFwGjf8tY86zeYIYAQ8lnYaw65FN+OaO2qWKf8beQDzAW?=
 =?us-ascii?Q?rTnp5YwoaSAhpZTCe4stb7qk8WL3bipkFTYu/r5n4j1MkFbggaKf7dvsMYRi?=
 =?us-ascii?Q?62dg1D3tfaflkrFgMHauiUvAkwE3lZ48qSMAVo8J8P5mIzj4PP/bjCGT4GU6?=
 =?us-ascii?Q?S8sjTmwhlvp5WHQVmR6Xg79fGLQL6J3s9GR1ildcxKXvy5pdfMas3j8lxDjY?=
 =?us-ascii?Q?rYcLJJNGrQ33OQIHUKdGH0ekaPZq3H75tTB8EI+PmyIcqgUYxh51dGnNz0vA?=
 =?us-ascii?Q?uVvq0U0wivHl5VL4UbFd9Db7FKz+F3T5q6VusfNvZC72d3m9OSzZq395Zcxd?=
 =?us-ascii?Q?kQG9RS+jCQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbff0692-e495-453f-0093-08df46e91311
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:31:37.5939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBTHvG/MqkfdwA6u95LXXqA4IZDDYdBk4NUGd0xn+fn5985HK+O9M4usDaXS0ZXuCMbVn2Ew2gb1l41NUMB6yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0529573EF

On Mon, Nov 16, 2026 at 04:30:06PM +0800, Ben Horgan wrote:
> Hi Richard,
> 
> On 14/11/2026 14:01, Richard Cheng wrote:
> > The CMT test accepts any number of bits from 1 to the length of the full
> > cache bit mask via "-n". Since cmt_init() gives the default resource
> > group the inverse of the tested mask to keep other tasks out of the
> > tested cache portion.
> > 
> > When all bits are tested the inverse mask is empty. resctrl rejects an
> > empty mask with "Mask out of range" on systems that require at least one
> > bit to be set, cmt_init() fails and the test fails before taking any
> > measurement.
> > 
> > Only write the schemata of the default resource group when there're bits
> > left for it. When all bits are tested the default resource group keeps
> > its allocation.
> 
> Why did you choose this policy? For instance, why not just set a single bit?
> 
> Thanks,
> 
> Ben
>

Hi Ben,

No strong reason.
I was fixing the failed write and skipping it was the smallest change.

I think your way is better, it can keep the other tasks in one portion
instead of leaving them the whole cache.
I'll write  the smallest mask the platform accepts min_cbm_bits in v7.

Best regards,
Richard Cheng.
 
> > 
> > Fixes: 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
> > Signed-off-by: Richard Cheng <icheng@nvidia.com>
> > ---
> >  tools/testing/selftests/resctrl/cmt_test.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/resctrl/cmt_test.c b/tools/testing/selftests/resctrl/cmt_test.c
> > index ccb6fe881a94..5d0bb27b7817 100644
> > --- a/tools/testing/selftests/resctrl/cmt_test.c
> > +++ b/tools/testing/selftests/resctrl/cmt_test.c
> > @@ -42,10 +42,13 @@ static int cmt_init(const struct resctrl_test *test,
> >  	if (ret)
> >  		return ret;
> >  
> > -	snprintf(schemata, sizeof(schemata), "%lx", ~param->mask & full_mask);
> > -	ret = write_schemata("", schemata, uparams->cpu, test->resource);
> > -	if (ret)
> > -		return ret;
> > +	/* No bits are left for the default group when all bits are tested. */
> > +	if (~param->mask & full_mask) {
> > +		snprintf(schemata, sizeof(schemata), "%lx", ~param->mask & full_mask);
> > +		ret = write_schemata("", schemata, uparams->cpu, test->resource);
> > +		if (ret)
> > +			return ret;
> > +	}
> >  
> >  	snprintf(schemata, sizeof(schemata), "%lx", param->mask);
> >  	ret = write_schemata(param->ctrlgrp, schemata, uparams->cpu, test->resource);
> 
