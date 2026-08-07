Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BC5473C7D;
	Fri,  7 Aug 2026 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120017; cv=fail; b=C2H/q59hgpHBfZaS9f+6ZZfFHtkNh82fWWuErk1VQ64rR4yMgefC4/e2PYrbe49JkotThw3LgJkzKT2C2f6/Yjm5dLWMKIAqwMBFWzRgjWTBJOw+lcmOHO5O/i+p54q6G9xv6yQcgGYWKgLdsZiXGI0KK/DJRxoZTK3/XqVcbXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120017; c=relaxed/simple;
	bh=QKB2iUcUdRBx+jftA0npjvEyXeBg/Pz7+MNsNOOD4fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mKV4MjQOcZ86G+wF/NnBGsELyEsnyFeBXja+0jU+U4WBzCbJ7tqFgk9/rVLrpPgDBavZvrl/ihRpcMbaK0vcMQEP0C8TFsL11qRyiVKXoW8okjR0+7Xio/MLvIEqvjRHn0aTJt0Z912TembGaxkM9zQyJ9gwf/2Gx12VrkmHf5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W+W9HqFV; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W+W9HqFV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHQ7HxJxwIZOhMLxUt7b/vq+DPK1XTJljroFBU8GuqijZerl+QTdJ11oKjauE8+be/EenBhEIcMJCM/T6bEyqaR3OO5v5VnPt97ZzPmC0vVPprnymT+mJ7EGdbpXz3rpG9M2dwttlb6I5Ky7DfeW3qOHrxtDN40vM7y2/oELnS+NMmIBgYmbsF/8luaVNJ712q3yqgg84EcqujEMzC2qLn3LuKNfcHXMYAzwTyXCkCeGU4y312H7XTDtln3NcsBDB4KEEcv3hREqs+zJoBZFQJBt+PD/kIR0NBETlMvzpa2cde/CeXJiukOUc5+r2PXj0y3+Gvq6uAPziSdoYm+6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j614ZXIB7+sX+CO8fuWH650jGSzZIz0uk9H9OhmY38U=;
 b=xCYCYHjMr7u0RavAW6BK34d0+NKJJtActSDWomYrkqF4FRF+FIofO0wvrBQvn2cy24jmb+Nx4m8OehH3DxwgMjXpm6FgwM+uasCn80Hr8QBxcgF3tbAWMJlYJdlStve/0/62baTiAcBw7nKCh/ALgHihCiBWO4oIjkjKd4/hq6Fb+bTVWosz53NEavhX7re5hM6ExF7MNkhYF+uk33wmbjAmmgP8X0v4ct/nyTOQA5nJELcR5O3BOTzAKC+PYEq8HBDAhw9mXAtVPqLTkY9REXP+K8w/7weeTGJ7F4VswEhjh1SvSiysYnAIVb2xydH0C8vnFdYiBcmp0FaG2X8GHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j614ZXIB7+sX+CO8fuWH650jGSzZIz0uk9H9OhmY38U=;
 b=W+W9HqFVQtkJi9/J1NYjmt4f40qnyuHVyzerByoprJb71RgFnOxNbUq7Fa81bI0i1TCaSFnssxb2anpYh+bMBAQdIsPU477tkRcpNG7JncGbgR4p5/1FAyJOrFhiM36FDRx+wojwZOdjknJePpPkCfVxH2MHkzAXyA8H/mQHguhx6wly1MaYHMyCgAS/ky0rgg51gAFFLDyjz5O6ISsnrb5fWNLEbBwR2DwMsMkzRZ2aF7vkywO+4EBhuEnuPO5f118cGxuWxfWN7uaA1prta8EwnMvvbCmFfknJ33G+JGJILxx3ufoxzXDGXj2Bk9UZ96LYPGBeP34r0VscTqGVFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9874.eurprd04.prod.outlook.com (2603:10a6:20b:673::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 16:26:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 16:26:52 +0000
Date: Fri, 7 Aug 2026 11:26:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v5 5/7] clk: Use the generic OF phandle parsing in only
 one place
Message-ID: <anYHQWEExCgBHtbo@SMW015318>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
 <20260807-schneider-v7-2-rc1-eip201-upstream-v5-5-8785f9531cf0@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-5-8785f9531cf0@bootlin.com>
X-ClientProxiedBy: PH0PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:510:5::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9874:EE_
X-MS-Office365-Filtering-Correlation-Id: 286b4339-0355-4c27-df97-08def4a0b02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Yfale73Km7fDO9DjhU0rXstMtoS8FvwVLE/5j+OJVvt3fAs4UmDBf+oLpUEWoqWZN+Si7tulYw5b4GVlp+6Hu5mvr/5UM2qrD/VLKVMXZbfBR/nOZ8uQ7EK/t2HVEvRdmVAY2R1hZwyd01+ac2qzMPugycW1tgH3sRsmGwHnHg+CBR8MeYYSkRhyL9ly8GqxE1tYScUzBt71sOI5stpnuSC3xn4npSxuyEKQHe0CE0XyyMqwEj5YCRKzaGFPzwP3mbcWiaWRTTAlQipS8INt4yaCKz03DWjueSQ52EFZkOSm4lIXXAfO/73XzDpYU+AFbr3PeWjfx1Dj1cuLPsE9+Qc9szbJuGRAwb1pRgogctg5ZgPt+zvybj01VlNOafwbIkaU5z86TzD7L2DEcYQdMp8XRBtg2YlJyPT5viJfZ3B0nFhbWiOxXsWkRAF30GdxHDWxG16zI3uUWhYQL/YmHD/D32t1HYZryxDnPPr5mVtLp1WdycdnSVZY1su418d3rr/icbREnfotGeemENu479MS+7qk2vdOy+AL9XRwjT9+joM3xj3xqqHAfRaAatMbismmLAd9p91hSP3qPQS7FpM8tMFF8gW1d4Te1muaC9aQ8skSFLyd0oNfAX+8Ili/pAHCrAK5HrwXlqWCphXJT0AGQBM8xVeXv8AqW0oUtWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gMY5zaKpFzznAGalckmbpQPM3inJxwheS4x0mYgr+CBXVvwdU8JqsDS/sN+E?=
 =?us-ascii?Q?YAjX+9Erb85s08b0+mp4YFzeXxJdbQ2a2qGOWkdpPaJ+oUVnuPo7voxK8+w4?=
 =?us-ascii?Q?a4hKnlstdmClU3QZFARtUPqI2k8Fk2OFuuYNynyO5n5zj2qOURkx6B8dJ2vF?=
 =?us-ascii?Q?C15jqrM+3xlNmDHBAc0d+qaohRVFzvv5H4itU0M0iXDJbA6iElOGpq5nLUgF?=
 =?us-ascii?Q?DE9my0y40UjJHDo6ex6G3JrqjaFn+LH/IzEg2YxMMtCXTDLvyRP4+yM7rdHe?=
 =?us-ascii?Q?hqtdl63olQT/1XM45qOCNjsmy5NO7+JuVIvl3dpMpw1Kfz4M1mz3iTaKpImY?=
 =?us-ascii?Q?FF/jyx+NlBjc1WumLyyKlEyUE//pRUZYdFNVHvA6rWRRzfroRs/CLMmfUN8a?=
 =?us-ascii?Q?GkJdL1gyYBHQtWuk/AJuzQQPxNxfSAqm6UksgmW2kDhLGzDG0SzPZYov8Eo8?=
 =?us-ascii?Q?nC9c8TFiEe2YZWZCyKLfCCIuX1MBSgmmTIRp1WyrSIvh/J3/ieM9Ge92I7Rs?=
 =?us-ascii?Q?6FES6VLldrIap8ha/S0oU2S6p+AmChwMoP2NxCu+eAX/yRyuW+7wkOkawY8T?=
 =?us-ascii?Q?QV4fJPFc9hdzS07XiQvAXEZwMVFc+ojp3kTpC6lh87gw5KZJHgSHZ3zAgCuF?=
 =?us-ascii?Q?hE7PVEqevs9L0oKNcaIstMwpl6jvg8/4cQiFQG+d1M3siSOauVlAAeJ7ry9N?=
 =?us-ascii?Q?7P0WG1ZWTm8J6DNB+R9Yt6yPpHirZbTIZl3s79u+Tg6qZ8bMVxJlYyVUnfMs?=
 =?us-ascii?Q?XnyZVxU88RYHB5ZLwRG8uyzvGLBQ/sFROSMrQ2vzm0DrvDJiLf3BYh7CeGIP?=
 =?us-ascii?Q?fLDnAaBxrh9taijhmBLDhFdaJobkbhrx/0qT3Hs3N7YcN/Ha14n0I7YZqkeO?=
 =?us-ascii?Q?hJsl+mGVZHNp9Arvax5tClFe5xRk4/hJMBM3QBxXLm/zD5BcATEHEcR4qMCw?=
 =?us-ascii?Q?uJVk83bmwyyGXOA8jQanKYBX5tNIVjyH7GUJQIFLp1JVb2UmAYGF4PYyBegj?=
 =?us-ascii?Q?teMzVpFuXlV1Q7rZ6lGInK+rvEqmcZYNeQ02iq5o6eqNoQ9JxX9T/wGDgTsR?=
 =?us-ascii?Q?UK1ukFkR3aiLT2wUSUt3ZamXV5VtUpqgqyWgIJlg+d4G0V+sX8yvNSEAoFJy?=
 =?us-ascii?Q?AmZ9g0m4Rfd3S+VAeZnrljtGierwMI/3dbgmF5IpXNj4lqR4qhoFd7jpP3R1?=
 =?us-ascii?Q?XkMOGur43qn3/8eBqW9sOun0MLSxVU6GFbQhnejbqs/KLlraVdepw9eNjwW/?=
 =?us-ascii?Q?UjcH0Nm1r4IelyN2QN7n10D3rXUS1v6p5r8sjTymk98NYEu12tvOKJ05fjZR?=
 =?us-ascii?Q?HVAasEuPxze6+kCZvZjpDpkCqj9gGCVAlyKPdkUDbfQZ9lMFji+Z2QkE9mHn?=
 =?us-ascii?Q?NI62bU4y+bDft97ztWSloWeXyKbd6Zs5HvqgmLTcExM79rb/T8aI4q65ZJD9?=
 =?us-ascii?Q?mLA17cbDgF5c5UYw1qzzaG0FLZgyuIawTZTu8paG08ob1PWR/BzZihTxeKZ8?=
 =?us-ascii?Q?2wVEG+7pZ3aSM/YSMK9k9uspkTSSXlmWNlFXwZfB/V+W5MED85gaT7Fl76zA?=
 =?us-ascii?Q?NKNFqRbHor4slXGhJWWlEGB9m1R/qBKc+n3oWkuMu7ie2gX7JQ34PjjF98I7?=
 =?us-ascii?Q?SgauI1BtD7n7q9HYJX2z4nRS4FLQzlRzy//WSyVkNzgIfMgbBAHEBceTnBsB?=
 =?us-ascii?Q?sGZG38CJ/3IkCJ0WRVBuieHg5Jt3KCz44JkZvyDdWYU0Em/p7HmzVvwphjks?=
 =?us-ascii?Q?upbTbjDKJCKLDrMSDRfdspI/jwDnzJ9As3xeSQhedHzLpHcTZW3p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286b4339-0355-4c27-df97-08def4a0b02c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:26:52.3752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuHveaaYNNXqjJ6qLsXMYnqhpdM3eDbZkpxB2N2lF8yvDYcsNKV+kElOyT0RaMBQAGrVXs6MH4kjKbaBOTwgvaXGDRqdOsXnDs422GXSWX2F+GW8dd4xANMc4WCjpojI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9874

On Fri, Aug 07, 2026 at 05:24:06PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Ideally, there should be one single entry in the OF world. This way, the
> DT parsing logic is always identical. At this stage, we call
> of_parse_phandle_with_args() in:
> - of_parse_clkspec()
> - of_clk_get_parent_name()
> which kinds of defeats the above statement. Furthermore, when this call
> is done from of_clk_get_parent_name(), we fail to parse the
> 'clock-ranges' property.
>
> Make sure DT world is entered only once by calling of_parse_clkspec()
> from of_clk_get_parent_name(). Doing so implies that we do not try the
> "clock-ranges" path if we already found a "clocks" property.
>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Fixes: 4472287a3b2f5 ("clk: Introduce of_clk_get_hw_from_clkspec()")
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/clk.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 7d63d81ebc09..45f5d7a4ccc1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5219,6 +5219,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
>  		 * has a "clock-ranges" property, then we can try one of its
>  		 * clocks.
>  		 */
> +		if (of_property_present(np, "clocks"))
> +			break;
>  		np = np->parent;
>  		if (np && !of_property_present(np, "clock-ranges"))
>  			break;
> @@ -5364,8 +5366,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
>  	int count;
>  	struct clk *clk;
>
> -	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
> -					&clkspec);
> +	rc = of_parse_clkspec(np, index, NULL, &clkspec);
>  	if (rc)
>  		return NULL;
>
>
> --
> 2.54.0
>
