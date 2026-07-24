Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113703845B0;
	Fri, 24 Jul 2026 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918156; cv=fail; b=fyup5MXXMbDYsweVJZ9AdVyznWW5QUVoF51sg7vuRlg3HLbz29dsT4TUBo/aaYdERWv8S2sUDHJPRDQDJw3tCO0Z7BMo3RgNBUrrCL35t2YtgusCpidJK3rIehIQ8jXxOvLGngJZ1cSisQdsZOUap3O8hszS8MeSK36L9iaXTBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918156; c=relaxed/simple;
	bh=Rmn5GhKEX9D0HZ3ZV77u2NPmO5ufb1Cf2g3cFF8F+fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mCpaGh7TzKKSrz6yOMPkBtneQHEoopuOjIHy9Qtx+bmc8JMYOFiRIWGV8be1U10a6UsDqEaknCWpUqQyLCkVwHHwT9+WGY5EUZGSBk8zmCF+IXAX6g8cR0krzYE/liUM02C8PKObeZvzG4Ge5P9/qfQneFywI2oHsZ1NzqRhMFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G8XPgWVx; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G8XPgWVx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYQSnc8Ep/L0i8mxm/42kYOUan18eu0wt3xj4IwC3BPaMDfrEOhBrYvLj1MI6Gb9NQdwdwXTkdI1979NarcTuFdNex3+xEc4YE8wnZLDScSeLzPd8m4cm8kAxodslkR3w0BNT7kayuKuzypmoL2MHIjOMtcfWiJM/Zo5XjVLc8Ppo9RSTjIhTU1ZAOg8KS8oeqV6IAJYd2KewfNuvACkycCue8MwIbFxJCdigyEXBC95n9EqQEMx/8kyZlvp8TUBJKDEb+Nm4h29vkZo/LGdVgh9ShxEEwjJf/mXPa1EMRbXwP3iRmN/5m5D0VO+0FVoksrH5JIVzE5xgsfCspoYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV8ZZreBylLf0Pezp4ZexP+w5yJZR7DRw79pnLhbMQw=;
 b=oFPByd9Gpk1nL/wQKNg2rmfjs+wYLQgVq3rOsTMyDGH1hYrB3BTieFhK/AN6boYUwYVTVDiZGdnrniLHAw1XvECNVdrHGL1H+Z1JR+kV9n5Rq0N4bUDTtpO9/ffl+iwXKRYIqPV3x9hSYCg0KUnUpsS9nmTrBwh+WZe66imgGNKomZ/N9NztJJsdzKXiohH4XeGmARNqUxxb8Z3ydWljpQqEHXhX2MGjmPd6kZtwoEQKhbgN6xZozxOE3DbSwKjbVvrFmyoqduDkM4WzbgVpLwQSHYrMm4xeLEm6Lth9p3D0hmrrgcvtDBvAXKCG8Wk7KYXxko7PRO+m5z3NXNFgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV8ZZreBylLf0Pezp4ZexP+w5yJZR7DRw79pnLhbMQw=;
 b=G8XPgWVxbSBSz8+bKgE9IDLr9D3w57X3ctMx3N0ig9cQjBmvcS0v//6JkvmnSNCIQEBXDCPVw9IFwvqBiwcx5rfupW294SoWtK4efHt95gI7aRoI2kqrXCennkMqqbx+9WM61C93ISMWzWERNmSigGy0T9Nk5iCz1emM2BGRdE8lMCcvFDuy7bUwpXQvbRqzKlujF9WufyLt30x/jph/U6F8vVQ0pSXyStlWXyjaxcX02Y6kqwsdZqnPVJ3WD5cStvS12bQ5XQ3VcgZBTuw9u5gVmZDlPYfA/y0/BMAE/YW6upfCpbF5oRSm/LuH45UdAwSn4njUUPSe7qncfJFI1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10325.eurprd04.prod.outlook.com (2603:10a6:150:1e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 18:35:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:35:50 +0000
Date: Fri, 24 Jul 2026 14:35:39 -0400
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
Subject: Re: [PATCH v4 5/7] clk: Use the generic OF phandle parsing in only
 one place
Message-ID: <amOwe6kq9T1Q5FBL@lizhi-Precision-Tower-5810>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-5-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-5-751547e160e5@bootlin.com>
X-ClientProxiedBy: PH2PEPF0000384B.namprd17.prod.outlook.com
 (2603:10b6:518:1::68) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10325:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1d1b7a-41f0-4d33-64d6-08dee9b2628d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yGbD0KpxpPPG4XMKKjqe7Nk8aNSJnGLcQwWITLKCZE/wbSg0UiZlBUPac5ZvXG2FylvUTfMnxYVfP5s+xyA0TEvj4kJMmAdPjokipYtxCJ7EZ9h0NCgr/eK0a6JIWmPoCVBqcmd3rWvP2Qj6GA7rLVvJtGNV+mb1PUYI+fY8F+Bw2xMC3grKSVge0E7cuSU4a9HLzoZr5I58tDSft6Um9OPfRrz5kQA8j33ua7vzbPrTf6lMxGzK190jWBOJbjvxQbTrwHAUs3EWHQsAUcFpBS364dPzkXGpaxktEqxXcNJDf/rFyl0EI5vdJfD3gyJeWrFxCCR9Kh3QVXNv4RP7J91QM+5RuLM1MfaBpL+rF0Y4a++Y1qipt8cClHZ+TW3hxS8prHb3zLb6hUC67LiWlji3g1/VcwBuDp8DaY5stucalCWF54SoRYWn1rWERZ81321b7mGnGj5hTqflj+lHda4zSEfmjNoXinnU6YunaJJQy94Cjwrz+5BdtP5/GmdghyDpZdgi5NnasQOvMSwRFLUNPcvSZvoh8nM1+ku48RDRGdc58O43cdqFBysDj7lflCfwW7uHzr54LwANn6Qo9AHwbOD4GmAPLYYYi+fg3PmQ+v3x0T2UaHjhBe8YCSKc0BFv5tP8Ns3u9GYY66X2QT26wl4OuULpWcwO5rCo7I8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pqNq3Opa88vw2FCa9ldaHFhvxb1djyj3BLeHPUAOc8knwmEjHy1w2DWSgFKM?=
 =?us-ascii?Q?bHmnaL4aRMT/P6EpIO3y7pkVzOkNUGS/0/uWXVHj65fZyMS+sFCaC+a/Zjyh?=
 =?us-ascii?Q?qpiPcQpSHxRB47V761sj9LDKfFYf5sFjf3N4IiRe4lRaXPhmVqOQxajg0huy?=
 =?us-ascii?Q?wCk3Tm2pxYDV+/2zjqrdBBJP4EAnaUHkKy1m+T5uIDLyM/WQ2MBwDaWXZC23?=
 =?us-ascii?Q?qOaoS9aEgTNFD+g7+teVYl+IXABegfnuhCOUkaP43Hcb+6EJ7iTOcLNBKh0J?=
 =?us-ascii?Q?6U13EVaVkNWmvQkl1/kFUPNdzm58WQe2LZ1NvzaEFbbY50k6kwnlwSsf5Jht?=
 =?us-ascii?Q?SpasH0Tec8VbdzJ6v9vLhjJU0PlZ3SYIJl0l+Ww/DnkDTz5mo4o1I3l+McPz?=
 =?us-ascii?Q?ne0JW64M4tSh/QnFGMvqm7YiCc8xAXd3nglP/TPk+X3u7F5Hfpk0Z1Ky8/JQ?=
 =?us-ascii?Q?emMwjFlgl/U/Wz0uclU6RLW8K4RhMYZ/n0en0RtNIp21qt1FlADYDrEb6TuB?=
 =?us-ascii?Q?isZCriDbp6BAwMR43KLRpsuZlzY9WnqCd1syIyD29VMF+FqeMunI7KuiUdpD?=
 =?us-ascii?Q?c9l92FC9jCJhfKrb0kOpsqKxdeeFIabYBiS+C3t5VI9nZ7h398p1/EJtKtdY?=
 =?us-ascii?Q?JZh4EqZBlLKuAZjsOJf0iy6AVp8T6ECR7iOu6mGZ96fwHLKqCwf4IaE3hZZv?=
 =?us-ascii?Q?gNMi2MiB2IHPrcZMg/0iFYKVC6YALsrqR2XUkm8uVVjicoqO2Owr/5KdrbVq?=
 =?us-ascii?Q?cNJjIMmZauNXyhMk9bzR+CVy23yFSdmVY0U6bIi6tEe6xND7ahHa7D1go81w?=
 =?us-ascii?Q?VgMfvSEOgsTFnV1ygYDcIWxKYTgpVhVZungXGlUjJvum3whFqHVpGY/4ve2R?=
 =?us-ascii?Q?579ir7iPDQXz7V5wo9TVlys+o1Gczq7vABCC13os7w3Bw/V3nEa+J3oCP5Yc?=
 =?us-ascii?Q?FmsaODMQrilhHJUiczSdMAqTiIRPqciJrdvIUbpfoQ4tpkdBxG3iiWTPUHo/?=
 =?us-ascii?Q?zFQLELZr7ub2MK64imNUrF/dtgklfDoIMfxTBmq6EnWuqjgXwiVQvr7AaLEa?=
 =?us-ascii?Q?WBHFhMsuzDacyyAh+3mNNelTmX8OXDYuK49Oe27Hr3T9SDKgvD54d0i3ieKy?=
 =?us-ascii?Q?3TRZBSshxW8kMUPQ6wEeUPPbmyW47tmNv/s65apKbTxGaY+1WbeBaWi1KjeJ?=
 =?us-ascii?Q?5qu+pSgueuxuCfKKfYHHjP1vbzxwjY/YjznqYEJD4EX103DeGBMT2PVIkuS3?=
 =?us-ascii?Q?MWze/33OSNyKOoNDYDEfWmVUdXvpuKW/3AptotngR9jdXyAJtThNPSXFDOKF?=
 =?us-ascii?Q?VEupMUARJs3e5Kw0r2u5OFUbPmP+IBTgMV1j+aeS/QNFXJzaCwDjFL65Exr7?=
 =?us-ascii?Q?DL1TAwXec8Kcs1f6TBDdqnzJ/RZa+6MaEvX1TJ8r0XhNe89vBrs/5nksEJXY?=
 =?us-ascii?Q?gSGidWEAkFePT0Ypc+oK5zc89Pp/WVnGdg0XEx3pzxsUb0P4ZqoqE3dL/UZJ?=
 =?us-ascii?Q?DAlu4RjD7EW8oMSPKMGPNzbCv67KtGFKcUl7tx7/Z+LcNqGrp8TQW+e0K1HF?=
 =?us-ascii?Q?P/spgWhxGNu30bK6x2IFgD//PCSvrJZsXvUm1grU21c9zJfl4pzscb1gzfRS?=
 =?us-ascii?Q?J1rXrl5rdiYgHOGLEe8Q+LsIjsuC42G1xhUl00ygGEENqV5BdW1KfkP3+vSF?=
 =?us-ascii?Q?vDdHfmAHjH4LeqAsKjnR5hdpGn/Fp8Lvw7qBuaf+aBVPTZ0dHCyzlcUtOzVh?=
 =?us-ascii?Q?RwVtQm+XTWdSd0oaKBOU2oOUHcJbpV200F3GDOK/gjLan9nxmlLN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1d1b7a-41f0-4d33-64d6-08dee9b2628d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:35:50.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uxafa8gAay+iJV3ozuWiSIeTnNX2/ItVZDHUlv9Drr1pJRcMk6coLq0VZn3nINdsBmmessGOoEMsRICByRytRlzPD2pAZlo74VZqUaD5/BhEEkazbYD29ErnN2ORpiaG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10325

On Fri, Jul 17, 2026 at 05:59:21PM +0200, Miquel Raynal (Schneider Electric) wrote:
> There should be one single entry in the OF world, so that the way we
> parse the DT is always the same. make sure this is the case by avoid
> calling of_parse_phandle_with_args() from of_clk_get_parent_name(). This
> is even more relevant as we currently fail to parse clock-ranges. As a
> result, it seems to be safer to directly call of_parse_clkspec() there,
> but doing so implies that we do not try the "clock-ranges" path if we
> already found a "clocks" property..

Sorry, I can't understand well what commit said.

Replaces the use of of_parse_phandle_with_args() with
of_parse_clkspec() inside of_clk_get_parent_name(). It also modifies
of_parse_clkspec() to stop traversing up the device tree if a "clocks"
property is found.

Is AI's words what you means?

Frank

>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Fixes: 4472287a3b2f5 ("clk: Introduce of_clk_get_hw_from_clkspec()")
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> ---
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
