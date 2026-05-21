Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEDF3F58CE
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373811; cv=fail; b=jOxq6r3sgIobE7chl2rwNreAICEXq5sQp48mbXgrq0+GdF7r+b4LwGNDGAoVV9eP6N6QWyYT3hnCHqwJ+Jfd240GI2pGC2QUGdpkYKm66OmhMLgDUc3883Rr52vbFu/OTQlLNsbQC02D+laDHMyjDPMqXgb66F9UW5ffeyRt9qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373811; c=relaxed/simple;
	bh=LnBlqJSuJsS53aMinv3Ghsa8qQOicYMP33PA0ZmYt2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tvekawPKn/hhWPg1WJH2nmnBxPSu3tgFW06uLYHJOVSrv6C9LxH4LKm+gqcLZTi5NOXYw0+rL3TB0+GBNWZZiFW9qnGPscdKvBl1aaR2ZP7Kx0z02uNm833y33tRjmO7U7pSKQq0c2BwAREJtXoHeyhgCF3uyt8M144Q/s1GIfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OeNOCVXs; arc=fail smtp.client-ip=52.101.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OeNOCVXs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6s3LcRNL4hNWGG1x1NeVKeerHzhdxbtRHb2Mdi8tk2+EGzdWh8FTXGhg924y72eIfwhamjyziVvbI9WgVO+afi1XnogM8ja9Ctu4vu938sntHGge0VOunqkUDSRV5cfbXexjQ0zbLqdjQaCgA59M3S1FfBDz3+gS83S//vNIK3/1gt5GIWBdydoObfvZlzvFf7BvWHZIdo74/d7dV5VXVAElOBI7GT2Cc6+90b54R4Sr1dq0NoehKUPKb/NYt1/GXAwhoGsH//AoTAqt9G90nxzNolD62ITbIq45SXUQMj/RTG4NZ3QP4QEzZPMo4e5USYJNFPfCLdYVwgvgbSqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bYP18Ifah+N8ZxUj/5MTRs0gjRDyYNosMgp5FrGAoA=;
 b=mP0IOlzzyxvpN+4GhHPauk+DuJcW3XG1buTCOm2zoMibxrTTq9t54jq8BFDtilNtHrA+WJplhJyBty2K/+mgAD4tPehGUDLlY2Dod8paJyFsRRnEGLHXMXaRtYRycoez81JY1Q7nfsisoGHr3zduo/Uyece3Czr+8Vxp/4UdkaXyvx2F2BwccUvUhUn0QiXmp0jQk/4T/4hh+rwRX7iwTohojWSrS290TF5IyuwOiQWC8i6Y7buA3VRZt8BROZr5PRHViEdLwRzYvZZr3m337uEG84QqXVy+MTh28jiHraXo1pLIcqmq7+6QfEoK/thYjYC4A7X3oqeWRzfv2lbdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bYP18Ifah+N8ZxUj/5MTRs0gjRDyYNosMgp5FrGAoA=;
 b=OeNOCVXsMPI9NkFFvOk7SRnTtZYsYQSHa4QXJ3Mxpm/2MTPAGYWFM6xDo+4C6hnUZXrfww1hWHKRtmXE8c/sN0wjtDjsFe7e9zOanBIXg29/49ZiE/apIB0rxwXGYZeKvqq4vxx/e0RwtBAMGfc838ljIFDiVY3ARGv6WDJzUZh0onnEXJM5QhOD/e/9SN73zT/bxUGUf2REL5lx3NdtEzILXH6yGDEHJIZRhIMVP62wA7TH1fJn15R8fdof986a7rOtUTOZn+2+tM1a7e+dkxzTikkGGLShQG9kS8wyFo3eYszwpEE8Nra0udx0q20zvKwFd1czUK1/7Dh6ZUuAUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 14:30:06 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 14:30:06 +0000
Date: Thu, 21 May 2026 11:30:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH rc v1 0/4] iommufd: Fix veventq_depth boundary
Message-ID: <20260521143004.GJ3602937@nvidia.com>
References: <cover.1779070992.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779070992.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:408:f7::29) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: a545390b-e701-4898-3fd8-08deb74573db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jDXQjhtDdQzAgWVTDxiUKS7rx5LKL9e6E8Zpyj2v8II94nmf9N5IU4C/zg4muId2j7OoncxQZ9gfxCRe7VTxVW7wh683MtHAyIKbtWsaCBJToUPJ/Pa2C6l+bkN1gwDWzyIVe3pPLGpvqVY2csK0q7WlL+K5A82CbmEyIBwrThYmlU+1VFD/lQjekQOw84q5snZFveHLykP+M/O0Vf1SuZByY2vYSW+Y/AwXhcG/Jaup1kyJwQmqigGlCb6Ee8QVYbEEMnAFQi/Ecnt7CYyOimN75Jz1rhldCPu4EVPR97+MTBpaYWyRsuujcXIoKULIzQxURe7caPTlycZrIucMZzwqU11r/cos2JOxqZYWIFgTBo30I73oHk3Qtazw3t5gYNcUUKz+RU1lt6BrcB4QV/JwEG+zscPtq9Fp/kEXK6tkMG9fjDwN8g+LqF6h+28CIJllC3jUlLUlmNh4wsOD9hD828LILsTSH2mkkPa9xyjhyDqUN0uyeCXOJi7QPmoE79lExX8yDLA43XDrbgBQlMswBwHeXNnK6BAa/TqSIINrzuueuHzElrStBEbkr51L5k5cjS+T/sHWiMKuFrzvV30d4A1y6mCbWxhotLWK5d9mXGdTSzb3FpNhwao83ejoSag+xsqLN23wBsSy+F04ccj1SEnFWDcHu6BUvsq1/LAz5TAjyYRWMU9l7GgfxIbRSC/DqVyoA1sjPZNFxaPo6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BVfdOIcRqrUhTmZdVGc0dn5sPwsQqYVLnXbR8pz6r3v+q1BJWle5lkRH0O2E?=
 =?us-ascii?Q?OSJ7GFLu+4IH8o/t3G9DfgXeHAYXTuZxE2QYv/TszazYc2vp7IEoikfCXauY?=
 =?us-ascii?Q?kL1bt/apK0Kuegp+dfGk3hYtld61Zh7NBtMKBG35eXELMumeLY3MZgsWnGz7?=
 =?us-ascii?Q?NUt7ybQ1XCEPrvnT5DhHo4bgCkHun0jNSpZwO++Bj2Eu3alHD38ZJ1KbrUlj?=
 =?us-ascii?Q?2Rwdz+yZEXb3BV9svxjs5OV0cS4gFXOvVr81Uxqn3k/+DTvTHAjBPaoNvESe?=
 =?us-ascii?Q?/V2qo/nCUs/w1Dx99eDhRBPzsEqgrS6bSoCK2SPBooLt+DJHWKVjX2TsRbZk?=
 =?us-ascii?Q?7hg5UW0Bwkx2eMcjHs/FjAm2tJ2r8L39yHPY/Jp2aaCZa1vi+4aJO5bg0dvv?=
 =?us-ascii?Q?Q+hK+UYAECk37xGgqldVGhohNJ1sJF6Htsp9yM3/jZgk/xMLH6ajMtJfkw2S?=
 =?us-ascii?Q?KSe/Kwd9lQT4aa3z8bDxxSIuOj+hZE1+gW8jUyf2z4p2DEogpFtgHVEdpM6g?=
 =?us-ascii?Q?mGWqArntuwC3GzrBiCRX0OUkzE3UP/ujA/y4Qd4ottpub5TeJnZsjHQzOSe8?=
 =?us-ascii?Q?Ouy3QOGskpYivItQU8bpqj8K/OihoSNfwwwtJSNjkA3ZeVPMvYHzmx13Tvu/?=
 =?us-ascii?Q?l1sozLhwNlkYdZZuu/Mjhmef8MpQqaRAILt20F4jrm/wweiok/STrrXqhDXC?=
 =?us-ascii?Q?aUqrKTqejLRK8gzPAzK2M04o9YaYU4GPC6NeA+CXYEyHp1lTrKJiJpntaLy3?=
 =?us-ascii?Q?lFerH5QYPC+Azh8cCoMHZ4yWKmefBL1Ra203yRGDgYzmvxySol3yTcs09LIu?=
 =?us-ascii?Q?IoRTQquCXTnRAOW+zojNp1wxb4kMVLsCrfytFLu7xOY8NQTni5ahom9Rj16e?=
 =?us-ascii?Q?ExDPSKbmrGbWHtADTvsKsbAy4K/K2j+hQriuEDGcN+gwAtsXvoAdLnyOnxPm?=
 =?us-ascii?Q?KPC1pZTcH9pDnWWmbyFucv673Ly2O9Zn8CimPVkV33orMucg1yvjivm9Pow9?=
 =?us-ascii?Q?szzTiTou64v7r0g4dphifOv7FYI5ej6ABq0YoPU2wuOJSQgqPOrJTkuFRewZ?=
 =?us-ascii?Q?FE0KVGyPGzJGUN9B4q+DPKwvtBpMuJSDaAac755siiuIx2L/d6qP32ehoVtz?=
 =?us-ascii?Q?EtmbnpiDMSAhFKSbyjxBeJYbRA60NSDRD6DVkebKaxPJf095YB2LHt8wZXiR?=
 =?us-ascii?Q?8Oo652TpP+kpEJ4JW86+dtrJJSqFl8qJZVSxGldxaNYBYmGzwKtJzMVBhhlb?=
 =?us-ascii?Q?PdeiIdyPSFBaTsrFNzOtKReAhL3Xhpl5deVp7VNrq7wyNthY+Es4mdTOXAMp?=
 =?us-ascii?Q?+liIQyxCaO08xAuzSwsYWYLyziYpOY7Lyk5P64oSus3ihVJaOoaMJgdhNIR6?=
 =?us-ascii?Q?M5Lv4mTTNuKmu4Ha84bvDqLRxWQnqleyM2cUWfK6Bf3y6tXV/rAuigZ+CDQI?=
 =?us-ascii?Q?bMR4/dGpw1bfhiv7DrdYVpYvj9MYVSUj2PVA7kzG1P6n+TV2moJ/nqal/tKa?=
 =?us-ascii?Q?dhtzt+i1rNKGU/Ms3UDnR66MppnCbI9TQ2TV3E+lmKqMiQm6sKoQoWnrYMxc?=
 =?us-ascii?Q?J7S5p+QKY62gnA7mcxhTwH6ASaYSCrBmy6WhlasL6N2xGUkfOa0KqmDUnW7q?=
 =?us-ascii?Q?d26Ibpn62Hj4vEN1WecfEAdeEFIJidfQsCHQor5rVsaAAzcCpFkcYjYLtBd/?=
 =?us-ascii?Q?IXqAgjw9oi5MwrDSU59j2+bIBeie9adkYRkn04JbYl5Fi/ra?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a545390b-e701-4898-3fd8-08deb74573db
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:30:05.9531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dErR4+H1YfgMB5a1rzmaGqOmI3j5ihY+SPU7IBkYkiEk2iPDC1IrBUtdTc7nHx+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986

On Sun, May 17, 2026 at 07:28:45PM -0700, Nicolin Chen wrote:
> The upper bound of veventq_depth has been missing for veventq allocation,
> leaving a vulnerability where userspace could exhaust atomic memory pool.
> 
> Fix it properly:
>  - Allocate outside the spinlock to avoid GFP_ATOMIC
>  - Cap the veventq_depth upper bound
>  - Fix event_data byte-count
>  - Add selftest coverage
> 
> Note that QEMU's SMMU has been already allocating veventq using a "HW"
> EVTQ entry number. So, picking 19 as the known use case, for a minimal
> level of ABI consistency.
> 
> This is on github:
> https://github.com/nicolinc/iommufd/commits/fix_veventq_depth-v1
> 
> Nicolin Chen (4):
>   iommufd: Move vevent memory allocation outside spinlock
>   iommufd: Set veventq_depth upper bound
>   iommufd: Fix data_len byte-count vs element-count mismatch
>   iommufd/selftest: Add boundary tests for veventq_depth

Please adjust for the sashiko remarks:

1) Put "iommufd: Fix data_len byte-count vs element-count mismatch"
   first
2) This "Returning -ENOMEM for allocation failures but 0 for queue overflows treats
   the conditions differently, which seems to contradict the stated
   intent." Seems bogus, I think adjust the commit message. We do want
   0 for queue full conditions.
3) Let's fix the "Will this lockless read concurrent with a plain write cause a
   data race?" by removing the optimization, just pre-allocate and
   fail. We don't expect this to be a normal condition worth
   optimizing
4) I'm OK with ENOMEM here, leave it, EAGAIN should mean it is
   pollable and it won't become pollable..
5) The sizeof(hdr) has been fixed in my rc branch. You can rebase on
   top of that and also ensure to send a base-commit trailer to help
   Sashiko apply the patches properly
6) What do you think about the "but done has
   already been incremented by sizeof(*hdr)" ? unrelated issue? If it
   is simple lets add a patch here to fix it

Jason
