Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AADA3770B;
	Thu, 29 Jan 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696922; cv=fail; b=hj9UC3j++k8Vkn65CrYpbI4EHeeSMfTZwf/C8NXI50w04xf3vKK0Pzrrz9pt0EyAKtK//8zp4B/BbYrAwuf2OL+YAoKroyboMYsEeDVrWIS6QWs+ZDg52J7c8+DsEgM04FtTcBkwV/IP4WVrW9Worer9znntPo1+ZgeoI22w1xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696922; c=relaxed/simple;
	bh=kP9+d/+VsHfQcHPKUWhfk+GeG4dozuS0foO2p47Bbro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fHs+fF9ZpBUA3sNW/mqRLkIZWTwZbccaKaaYGikkIlo8+GTR8fYFW7bIgGBdlyusgJq5O/nXEWn2mXNlfBF5e3nbyJWXV41OC+2TX6NB5XclI/M0kxsULpi6xibCMh0J7548rvYcdxK2AuGcpuvBQbaOkFPW6e679MgP/qSHcYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nvUA73/l; arc=fail smtp.client-ip=52.101.56.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nvUA73/l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS7nG0QO/p9TdnLl6VI3WG3fubyyazx8YnYOBXl05/Dii2uRVj5XE+Ji/T89FmobAqxETtLtpkgGtBUToqulwCwtU4iYCUF/sdJDOZJqmYsQyA69gkqpI/ezb8FrpwLcr/Sg58S+1JeI/RIJLLzk5Q5hoMV0iH+I0X88UUmTdhulU4BlQAid2jxvdMfKN1n+O0/HU/Ld82AjPeROIaykNmZ+k5oNbeSxeoBHJG2MPWkHs2DHamDNIrVtLPg/0dz0bg50DJkQ5EyAZAPDDzPoNyVshpMIvkW8EpIdo7Hfl3A9WL3hUEgyeNaGOtfN0qivZdFcYajk851LSPUbcEyN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TDzEbgpRQly+gF71FJgGCcM9EHyxDMvWJNqZqv3gwA=;
 b=daV2gYRR7LxuB/PH2l5g+w/nyl77ANBJ/p+yUXE5O/CTjKRx5/FOvKgq4ofWx2cvRoIYXES3ij5EXYaOZFRVxHg4KC2jzPNAxWueu+vXA653APNQiruEoksJ31ZvDsSwjbn2DmvgbPJzuxxZhsv3cORLLbdeR7M+rjPTiEQYUQCFqNxMe1vdg6JvBp+u8IMYnOtRsi2DFzpLcvpqwM88h7ebFjJEDhEAZIDOeQ/L+jTbIWModYKo2/WfnKQiqEFlqPQ42biMIwly/i1RZ7USgSmIvUcJBfSU/fzi2IQ7yHK6FtEcbW/XzQ7eN15oIqVsMNhfHXF8VidA5lj/goFTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TDzEbgpRQly+gF71FJgGCcM9EHyxDMvWJNqZqv3gwA=;
 b=nvUA73/lkotf9mGZqOI+irkMo0mCuWkBE54S9xgOlLAe7VXo3YCzAvHuBWVqULBkEq3G9DwB/BtkIaZeacPkXugeQN4zQ5hXVHkP22J+WqAuIdqhjasVnyBNg2GHwoWQWhLclVjb6AhecVfX9Ozttiytq//5sgAk4vhhiAt8vI+o53mi4ASmLUE/HDGavQMcXH/bazrSY8qmH6hxOOU4LbEhJB834tb+i5AKOsnI3qoxnwaW4t0I/g6wbtvf+T7wz1cOmcge5An1XlNlQYoA2z9vcMApT/4VApT6n1bmhOxjWfmGgtZPCluzjZUtsHKD3JMAbMsE7AIkVywsWtx4HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 14:28:37 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 14:28:36 +0000
Date: Thu, 29 Jan 2026 10:28:36 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260129142836.GF2223369@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <aXovtrAM1r1UyWxA@hovoldconsulting.com>
 <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
 <20260129105634.GC3317328@killaraus>
 <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>
X-ClientProxiedBy: MN0P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::22) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e875a5-4169-4d78-c204-08de5f42b07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7noJ1MU9R/lJcYsf0G0Qt1JA3Ph/6e3hS8aC+B03zmPrlOIR20R9FWlHVcql?=
 =?us-ascii?Q?OCNR7cCJqxN8Exoyn1bxreGZe6GyD5XaSVlcQlQwNrEf58370DrnFy20H+t9?=
 =?us-ascii?Q?JKODCi8+W04lcfHU/gi9OtE5mVjFVpCbcFtluu3tMMogS5ddCU1vdun4zs/6?=
 =?us-ascii?Q?6HX/9QrTgnE8lOU5gQInWN8AW3iy5BFWu9x0Y/v8WsroK7cFB4PEO/i/0Wgz?=
 =?us-ascii?Q?PTu9bmlk6GjNoiT3cC6RsFavKom9208WBVdn/MDrkKxgYoR2Zhg0HkiqLhUb?=
 =?us-ascii?Q?xz653agkP9DLAi/OxZUFtxH6COope7B0Am0hCvsOtfbo3vkL2528Chy1pAqp?=
 =?us-ascii?Q?34TE2xdk/tdkCyKZBar4Mo1iGI+zq2Gl9+xwYiYOn4GjHpAz34vDDNlzPZo4?=
 =?us-ascii?Q?vvsoaLjBLUvWBTA+7uzs/36g205whVjYSh4uVFsBYnpoJbF8nFSrdmumGRdF?=
 =?us-ascii?Q?4TGfgdlffwwlY98OeYwWzEj+dDVEgQhHlOt3gGsMOcHiEFUE+pUNP3oMuCpB?=
 =?us-ascii?Q?FP1i2YZbG4m4QncqbK2GRBhk7MjSC/2OzsdA+C/QDzwgpgkaunig3kFv4jzp?=
 =?us-ascii?Q?W9pZ/f84cN1q7C1N8VP4J/OC9HJRdzPhyFGROJ+SNOluLDzWMeIK7JBB0P+N?=
 =?us-ascii?Q?Dy4tCPM8qPLBHla3jt86dv0MtiTUi1/dBipczWkJwA7wT0BUU/vv4TasmU8m?=
 =?us-ascii?Q?Wmz2akSRENJfmtBjLXdd+LdK6KN8gA9sxGsfjkDo13RThQBK71MPdzxxjqKx?=
 =?us-ascii?Q?fRM+XX13rb4qLcauMj6HHi2dS2UZo09FPPGs0yq2D83MBtz1+i9YinLVR8Qi?=
 =?us-ascii?Q?DFaDckyQFLsDV07bl+V5CGegA9jzp9ZYQvkkHAJbTC6nYXonwucBlTts544H?=
 =?us-ascii?Q?J9zUcv86/CZN+iAyUBeZ7fPcvJtNLmGNXbbUXCdBnVHpGJQhXhT87r7Iz2qt?=
 =?us-ascii?Q?trnYmwgza21NVt54ZnTrMwPzDoHc4MUwDApIZy7iA8sqEhOVepsh6JxgiYMt?=
 =?us-ascii?Q?uKuF7jjRQmEg8lG8Ugd2yOCm8DIprqM4FCJc9lVTTsSMauMM+ALktu9/gsU7?=
 =?us-ascii?Q?VgxFVdsfcYXrBD5tgbYMD/PS04cuZs9xPb2OfjFlLGkR68vpSb9IJN8ufW47?=
 =?us-ascii?Q?X2SqpCf9kHfyA1e501u5uNDs3xvXa+XQM0FnTV2jHiwz4KjKdW8Qm5JjxXJ0?=
 =?us-ascii?Q?Up+k4BByvj6/g3HNuY1gN1F0sitDCJlh0qJn7sY0YlHIEd92q73kRZrUR4eX?=
 =?us-ascii?Q?NX5OVC+WHM8PdwfeCUTXTyxVFYqMv3lOPXoY62NBcinTO/I4PB0U0mbOnxDK?=
 =?us-ascii?Q?gfHIG9kwP0GcYAUgpf2H3J2Ax4LmfBkS5ox238TcA8wLQwuB0QV4v37WWYYi?=
 =?us-ascii?Q?WvkDjoWHurGX2cbh1IyepJi1JkvNAP7/uEm4FQn/NCsCvBSlYTDQxFAfMRAu?=
 =?us-ascii?Q?t4bKELx3BD+7u5QG2sDpjows8oTdMw7GuXuTy1DXj30w+lN6b/kRQ3m57PQP?=
 =?us-ascii?Q?jEePNvcby+srbmX/wdtmuzJOVu6u6fbFtgCAWP5Migqg6ETzscCJunh6Dsls?=
 =?us-ascii?Q?tYvppNdxAL8zGrHrjRQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2IpDStJwf0ajvrybTDVsaMB8CMjzmTbyJsqVpR6ZbOySaSmzI4zlzzmK7onM?=
 =?us-ascii?Q?FP6o9G07qltafw5Wsm46nn6Ab9m12vXZe5vjlM8OMZDSmYo5UyQGhjsgq/VX?=
 =?us-ascii?Q?6BXPtkF7AQiPrRzGwgJ31vxNx1yiduDGNqNambCF9Qyux72BhaE9foZjYOxn?=
 =?us-ascii?Q?vh+vLv3eEWsVZ3b+cL67u0U1UmMdpS94OVqdAuY417LslpvMCnCJ62vmT150?=
 =?us-ascii?Q?/BQY3o2CnAXD+qfa3HA5/g48CGkSdd2IA99LGnzxJX7FgVjmDPJsLGSTnp64?=
 =?us-ascii?Q?SD6NrtNe666qnXzQTPCOlhnrfzA8kR65+M2OGhQS3WxSS7WUa7Rnt5W9oogr?=
 =?us-ascii?Q?5HH4KB4L9h6GQuVfLt136xk9eyaOj/3RNmiXPlDx249iK5r5ih+p/8USLQDl?=
 =?us-ascii?Q?4KKuhRS/u78kpj01L8eRN+ceOogk6QC5MFBnF8tCE1yL32b5RQnSSBOmIZsV?=
 =?us-ascii?Q?zOLKjeJPg4epS7dXTa61ttbMrfkHgi6jCHtIxXiVlFNjdk6c32XCNF39o/RU?=
 =?us-ascii?Q?nggN7O1ph1O679EE/af4BR0tg80dxTiV5ms1wfVsBcjOPUGl1TtTSZfz4/e8?=
 =?us-ascii?Q?bxQou3ryu8909o4+1EnWofHst10WQ7xiZKCmQot3wK4KXGTgWpLWf1UqxHbk?=
 =?us-ascii?Q?dCepZdhoexc78x3YHwHXjdQ8a1OqFKWDTFmeD6m7YRDGGeDpwnYLhiOOSkiL?=
 =?us-ascii?Q?CMabzUrK3vatpffBB5e4AALKMgVYFycpjgWVvlKZ4ARTgnfsLYvGJ31EGvhK?=
 =?us-ascii?Q?A7+elknbctfrfHGOhjfuOk7PQChWey/KR5PBBaZjEld+Sssgj1Pefuh7RwVm?=
 =?us-ascii?Q?VqOim+TuCW9fs1xVWolPqFJzb5qoB7S/WbxcZi2gLZmArc6mjW8Si39eQVXC?=
 =?us-ascii?Q?QQxcq3d434e0i9npk/xMBsA+O1873IT5a/v1ZVkngjS1zDA5D6DiBJC2RsFT?=
 =?us-ascii?Q?BqurY/HlG54RkidgfHcAk24QWFt8vJPMp874YQDrius0qcAp0IUiZ7AgJrY4?=
 =?us-ascii?Q?Sv63uRbVZruAUU5kEVgVWSlJrzH7bgL4Q04QutE1Y+OTzJKM0ThqGwgFpX7h?=
 =?us-ascii?Q?o1FJQ9FkuHYzxAmF4m0YbQ1vj0+DuGO8e25N0U4a3Bov7lXP8YmrGku1gC4W?=
 =?us-ascii?Q?QkNK85rgdo6pTWCxoXTCLHy/13WsdTkBAwJiR3vqCeaREYNSzUGsuB3a80dv?=
 =?us-ascii?Q?MHT/v2FyJJI1V2sz8960x6getf81JesRVJHifP7g3V43vWYZdo6cU5fHlsTD?=
 =?us-ascii?Q?8MrCO61WUHSdRTS0TVWugp767ZDTJktDuoM2fAfsKGiSTQsOTFbhGeiHUfkG?=
 =?us-ascii?Q?BfY/S7W/No6gylIU3kKSfbtr4PU+nz+MnMNLkM/UhDqnZX43cbfAPmaDxSyf?=
 =?us-ascii?Q?qanCJ4C03WIcJrDtN84vyZZWQ3Pi4ICf8bMWnVqmF9Db4Sl3m7UM2yqhm6+P?=
 =?us-ascii?Q?5+J/PQXUoHrds2sK2esBnreJmkETkrzB2cF95AyVilsAsKTqrLMSiY8Zta21?=
 =?us-ascii?Q?gzpreKEoTxUa6/RkebCZxHmDK+bQPZktCh/0WnakifgGtDM+SDRCHvBmZyHV?=
 =?us-ascii?Q?Wm3Odze5Lzu6K2NB2rQAmIJmt+vVwfsWHmGYi0sY9Hpa7ObKT1VZHLR95Dlm?=
 =?us-ascii?Q?uRNBdQW6GD+jwT7FxOLmE7EAqaENRNP6R66AqYS7fa//muzCTNhAoIUk1dCB?=
 =?us-ascii?Q?yq+qIwMAoq1hbUZnZHMVTLTKbcw+g5z3Jm8VbE7NWb4flaLISJtMnJLKkr0I?=
 =?us-ascii?Q?TVPBG8pWBg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e875a5-4169-4d78-c204-08de5f42b07f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:28:36.8732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8JXRid1UgijMwxn8UFEMbhck8VZe7bjtZw2AxFsgHXP/tfnoXpKRUkuRJxKkW7G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

On Thu, Jan 29, 2026 at 08:50:30AM -0500, Bartosz Golaszewski wrote:

> and the ownership of that data belongs to the driver. There's no way we could
> address it now so the next best thing is to work towards moving the ownership

Think positive!

If this is common:

 struct my_i2c_drv_data *data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);

Then change it into

 struct my_i2c_drv_data *data = devm_i2c_adaptor_alloc(struct my_i2c_drv_data, adap);

With Coccinelle or sed.

Audit all the drivers to catch the stragglers.

Now you have a refcount. Look at how fwctl_alloc_device() works to
understand the pattern.

Kernel community has done far harder transformations than this :)

Sure it is 200 drivers, I would ask Coccinelle team for help.

Here is how I would approach it.

First, grep to find all the candidates:

$ git grep -E '^\s+struct i2c_adapter[^*]*;'

Get a kernel built with all those compiling and get a clangd database
going. Make a list of all possible candidate files with grep.

AI tells me (and AI is never right about Coccinelle sadly) that you
could use this:

// C1: Find any struct that has a member of type "struct i2c_adapter"
@ has_i2c_adapter_struct @
type S;
@@
struct S {
  ...
  struct i2c_adapter;
  ...
};

// C2: Replace sizeof(...) with fixme_sizeof(...)
@ sizeof_i2c_adapter_struct depends on has_i2c_adapter_struct @
type has_i2c_adapter_struct.S;
@@
- sizeof(struct S)
+ fixme_sizeof(struct S)

The idea being the only reason to do sizeof(S) is for an allocation
and we want to find every allocation of a wrapper struct to fix it.

Now you have an index of all lines that need touching.

Look for common patterns, use Coccinelle or sed to make bulk
replacements. Group patches of all similar transformations. Sweep
through with grep to clean anything not caught. Probably there will be
a couple drivers doing something utterly insane, meditate on them and
clean them up by hand (this is what clangd is helpful for)

Betcha you can get through it in a few hours!

Jason
