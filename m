Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A2472790;
	Wed,  2 Sep 2026 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349175; cv=fail; b=rvjMMqWwQG71iyF3tYjTXx7bMhBdTdyKF8ddI2C/INJXvCW3gidZtqXR1kCgRADda7L/xT689Te7ZD3XBojmcoKiQPjv/XQ2b78UJQZLg9IPWA+0V0tUGjfq8G3/fUv6+ZS+IC2MwS67rGRe4zfmWr/7oXNSnDJVbuBBk+7R5lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349175; c=relaxed/simple;
	bh=0amiMDvM7MtkyKYX4TDn5ZgYNylEkOm7jP+zTpqcO70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dv5W80nj4d1uA2FB17Az+QtlhBnjYDBxmq++fQt4CoRPiwSutd3QA5lRt+cNfTgzYCNdoeg8DHu8zp3uIDPNKx7XTpK88tQ6zvq2cIMjPa4lZF+k3huaWq3b4Es0NpfUmfDeyUHNIr919U2+LRfF/9+lgEdyy6QtzyyzbQ3qGlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sgsdRa40; arc=fail smtp.client-ip=52.101.62.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sgsdRa40"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2/nsDf96a1qP1rE/DX/rqHFLDGFHYHq3eyJtDY4miVaSJeLrBOPSEa8O1HA3W4P5WZWAC/ftApa/ZBkQKTeK3CbknbHnz1qraZrd8frBH/L/07sUoNOdXa2v85c3eiUk4Sio1WQD0wGzOhTk26lWB8dAjtpuUBufSrzC8HSDLlBgo2jh12t+Z7k1UAAl5ytEiKmK2hcjqD74yLhiSydYPIs/DdA4PO45hbKAUIZgxxBf5dl//XZf26GJHJpvulZRjVm1wBiKs86Ab6vkhkn2oA3TsOcZkZTq27ZXE2rD74EkCF6Ny9auM0+3SUcwLUrBdcqsh7APC73mmqslX4v+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0amiMDvM7MtkyKYX4TDn5ZgYNylEkOm7jP+zTpqcO70=;
 b=AbXIshWlkrndyCcekAazkiRzt7FFzTBQ6Q2FNbG7xmM80cZNBVrzONt6NWR00QUmrm1lly7laj8MYmSazQUgFZmue7ay4yjPrxawTM8Zz11NOf2B1DETHx00dEsSS2rZF1v/HjuBFt8rCHQZz7dWRTBI03zEQrr8kbdVCSP0oDA73uuSux+e2NBylOERMfsPzzJcWhupVXRM0nnmDnGHxZip3aRzcY8UZ7FXcm10e8j400kD6eCOzgvifVg6Cld4YrmdZ2pVEGegh/QwXPf4lot+Mxlz+l3L5Y4hEV5B/PgiTLaI+wmpndQna2k5jPWoWt+p3F/HSZ6v4uPtJyFu1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0amiMDvM7MtkyKYX4TDn5ZgYNylEkOm7jP+zTpqcO70=;
 b=sgsdRa40fTntW8mjyCag5ncX1//ZbvDCYQRZYCbU3OEeM4AqwEGKoOtY2Uo1C2FDvvNjjl7i/cOmTe5jFpunFXlvsi2iLdDs1loCWDqBo/39l0Ic5utBnF2ZNngjLJW1ZcQT0TCVY9FO9dTTwuUY5rZAhsRPuz5GXq9c1TKm/PQuwsitya0wIx+udc/rUuxyOzw2bGvSA/7LRCdzW40Y6V+ULB2b4DpoohfR1cVrXE22A8Krlxl2u3TTwJa1Ch4G9eWvrNeBlEsRLvjzqCiRDylGMBiPqO/wtSfk1+rtsLWBSjDNMj4BmgmTG4Zn4TGAnL4DBD17YJz0i3n4JSZpzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:39:29 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:39:29 +0000
Date: Wed, 2 Sep 2026 14:39:18 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Cc: Laika Price <laikabcprice@gmail.com>, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Stefano Brivio <sbrivio@redhat.com>,
	Guillaume Nault <gnault@redhat.com>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Aaron Conole <aconole@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3] ip_tunnel: drop stale dst from generated PMTU
 ICMP replies
Message-ID: <20260902113918.GA3864622@shredder>
References: <20260614-master-v3-1-9f5060ba1ed1@gmail.com>
 <20260616110224.GA753154@shredder>
 <20260901081825.287173-1-aroslavdudkov622@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901081825.287173-1-aroslavdudkov622@gmail.com>
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: aad754d4-e199-47b2-2670-08df08e6d966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|10067099003|4143699003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	U56/NgAuoe4fQDSlIe9zrPjPNaVPi7xYut+WOX08US+B4JJVg+w5b9l/uxL6FdD6TaXrHxmX3eR0/uHxp4PzXGZS0ibEtu6WGXht1l2hgFxbC0yP/XkWe/9WwHIcmVsXc6vEagsaM3OTz6ECp37jS0ng30hdyTdpea5JI09N9VCTO0nJvuKyt0aky8DhoruocyffFRSyHDVe+GZpGABJGHySsTPNYve91ZLF4g4JSQ7rDsRckw6Dc1IsqYpb/fqLRlwKwqSNhWYGnFN+9p66XR7nomsb6yrwguuRAGfwnc9t5JlVe+xDy+gnVwWeqNjA8DTJhFkE9IU/02BIOM/wHVMXN0Vpvuy8ElKLTPKj5D2+4x+sIxpnmkACsB9LA+p6+NGiJhOCJwsS5yOgP08qakk9n7sdX0DyRZhblGJaTpTWFYwnthEpEPMOkMglDcgx8GxCvnqCdMIFi3ayRtfgKetutwmc60fFM1m2xTMt8P99dAOvkEJKsTTwU4hkp3njEy9246q86A7oVMoweeqKaXa4FaQ9m1p3kp8oPsFJ2JE6cZ5Z+Cr57enzAjuIf760S5z40ysq5DpOfkpE20A+9nIjhRB1Zgos5YLnQVDUDbC7L1eFXWV5MoyLiGUExFXGAY8/o5NN6m+VSyOIQciwuY6nlZVlM30Pneyrkj6iMtg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lUA0JtljpEsay922W35ZrNt5GT0qiuKJkiml3QBTZPL2e41eiehdHm2v0D39?=
 =?us-ascii?Q?phOTMsC3XlGVNIhjdKcm336PlhyaRecbBLOM7wF23iEwxCcE0RPHubM/enqe?=
 =?us-ascii?Q?K2Ovs6ZMvUPxzn9XW5UTylMofn09cFc4r4uwbnE8C3HFw06FiCs6w4GxPplC?=
 =?us-ascii?Q?zKzjN5a1pqx0CCHfOTc9+mnGUYwlSp+ym293hz0HzGVzEU6ZZOnQmneLSlEc?=
 =?us-ascii?Q?NIVem/IlpW7k40f4YJyfQKbJxKYb+YDa1sOKUw950IGdwd9GIYpvhXBCY0rT?=
 =?us-ascii?Q?wDx+S/W6VYFSqs7af0FaTWeeFCWT6SWBy0UrnGTXLqajmqE7xfzBf+Pinf11?=
 =?us-ascii?Q?iZtwJbCVpIZY0n2GzALWGguNDJ5Rs52fcBY+nfVWkBMIhBZglVG4H+02XZCC?=
 =?us-ascii?Q?rMT6FWsKXsPqaEmy2x1w11UyqK5BjAlcy0teMJCsGDsEu4vUby6rNb6vlsID?=
 =?us-ascii?Q?W3e4NM1HJB+DVu0kBwHc0Ju+sG+un/LoSWFa7giROGTQa02pEfWTV9SmgXWb?=
 =?us-ascii?Q?7CvjhkhxC1QJzFE1am2P5UUacdyOh1+QzGaLMMEnF1nwSCsek3P+F8WX2JnB?=
 =?us-ascii?Q?fvpJeD2XilvRtHYbCTu2xzeGSUcZpZ5fI0UvO1UhvuMgAsB7kjnCBAKUxnCJ?=
 =?us-ascii?Q?hpdUiXJAU/0I2yXAgaFi0XHTNu/QEPaZIUkAIexDzvNFy57BYV03DCmTzuyX?=
 =?us-ascii?Q?qatL/NORJkjrcNyn7w8qPUy8l4+TxI+4dsMt08MhGe4MjJvh0vrdwIvaoPv4?=
 =?us-ascii?Q?WQvL4wBnmtn8n8Lql1tatB0UYxi4EnvpKlvblPb8Xy/Qk0fiVjxJ2LNT+DcR?=
 =?us-ascii?Q?se4WBt7K7vPXfhQenyax7dNcaYK5txooDQBgA8qumqeJOLBtreGAzdwwCiER?=
 =?us-ascii?Q?MHZiH2WKjUnAG215IYPoRlA56sJKlNUhWqMn5A6kgrp/5pOVxNOWdlG/0BdM?=
 =?us-ascii?Q?0RTYf4B8u7TNRr0vyEyMsXyWKN7YdPojVrApUTIoY3chTfhY1+88NwaMnXNZ?=
 =?us-ascii?Q?OSdMvIKc2r2ThvVHpxKlWSBz86hmSXWx6T3RIKs3plTJ+H3mz/TzE+jIpYnf?=
 =?us-ascii?Q?3DoXLSMWcobzRnkz44UREDQnemcA2/LaEiHewN2NPYwFd2JBionVBNcbwMP9?=
 =?us-ascii?Q?xYZ9LByJYyYcunTY2ue+tGSZcmyj95u2wvJ6rURv2oLLwWbX1iMVGXuP1u8B?=
 =?us-ascii?Q?oZhLWY3unUSrsTYDvRn9d8j6nb9860uACFSB2/ayQHyWe+67jIQSt4GQ5WAi?=
 =?us-ascii?Q?2ROVyPl491Koq3haaPYQO+Ey7Xg7En/ryo3JEVt1QKV5V26o4NPrpFeS7Tfn?=
 =?us-ascii?Q?dm3eWwIjGvbMKCubup8Yh5NOT20tfxN55ssef/YCJzeimj1jarULkYgSPZzr?=
 =?us-ascii?Q?OpqQwLTunKOaBbbxANiRoq9AwMR52xV690jD8PsInQ8Hc4lC9t/FiQQxmczC?=
 =?us-ascii?Q?GzUvAIAVqUzJu+f6u7ViLYgkUkn9EX5BdXSNDmdx60FtRuXpU0QTIgNbOZwc?=
 =?us-ascii?Q?GU2LGQL9TA3GAyg8813CV0mIf1NERyy5AjgND1zHn7iz9Hc9TaUVJWHdtqho?=
 =?us-ascii?Q?aeK5LInPmJZ0hC4JJkGqcioMaI701iUK/+xBZIuVAewA8ufXsaEHQg79mt8p?=
 =?us-ascii?Q?UjjoLfGpu87LITD6mM7Hivp57mo6hwaHQNF/NWxrWP6TFRUT62h30iXpbF6m?=
 =?us-ascii?Q?wAEk3JkgfOquL+x+W8XqMgAQHGdojQ6HM0ZonveZUa+ZKrgDUmt2/CeHhWxr?=
 =?us-ascii?Q?y825B9t6EA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad754d4-e199-47b2-2670-08df08e6d966
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:39:29.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzlpxDkfiXMR07977OUSOk96gIVi94SDozv1vtG5bWA/ewVkvSRrBoyGld3hUCXMrK2GErSp3VHoDIItMoXDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227

On Tue, Sep 01, 2026 at 08:17:09AM +0000, Yaroslav Dudkov wrote:
> Since this series hasn't moved since June, and I've been debugging the
> same code path independently, sharing what I found in the hope it
> unblocks things. The kernel fix should of course remain Laika's;
> consider this supporting data.

I will send the kernel fix that I suggested and the selftest adjustment
as a single patch later today. Will add a Reported-by tag with your
name. Feel free to add a Tested-by tag later on.

Thanks
