Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE5842882B;
	Fri,  7 Aug 2026 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119840; cv=fail; b=OgDlCsQdOekbvjcS5juOh8TYBXc37AZDEuWgLfLt2RVksBGLe4GsiGoFI0OSvxLrCeK6Jc1U51EIwk2YFEqx9okfbHbmgmFliZRz/VlH7A4Eug+QsrnhhivqIEO2BlG6qa6Nk+NEBCdPGD/HmiHLSeL6jxxn2ttrkorsVy7bdFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119840; c=relaxed/simple;
	bh=DxdFpdvsJ58Ks0XykMguB+ICb4vcJ4w+xooO4m8XbIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BGPqDA5gFYoTFPRyFs8GIRzJtdIElfNgpg3kjARfl5mJZ2yH6GlQilvTfb6bgOXzV1LA4DgFjR/Xwo7qwt5FjSqVKZdL4KXD5rNVHQvgOM101/p4s/6TOfywERANR+qgEb7D+yRW41ZM7Mq6RNJ91ItaJz48jkIjylHwZxU8tlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X+cQ1Ewv; arc=fail smtp.client-ip=40.107.130.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X+cQ1Ewv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piBYzYY4r6r0puctCXt+VUR6BMKpE4obtZ4HChG+ZYvreGViUKiuGzEdk7FzEkj5hxPwytntyzmmiGGaJT/Kkt5I6vMKpPYaKNDQJdeRdJLtDm+pYoNptLCJnj3JkP0wXNxGd+pArBdjWGvsI+v+BRlHyM7iPwR4PG6lcEvOtUREBVyCxSvEqJNM9UItOwHvcq/3pGQAQGMY1iyX2x3TGxP2Ew/AmRtOLBtBWQKTKVKIsY+ydlZk/poxHfFok2+uQ1kNKkQHBMdLaLg8nWMwsH/1NQazJtU/IAgRG5403EdtzfTbbzFXHJDR7DoxTJH3XDnX/WuBAw5HHIWSIqxDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgkojS5UxZQMrx78frFPOQCePO1vletpZ7ezviDziF0=;
 b=MxYLiX72louOBoNn0knKAlZlj8yEdQ+HXDFFBbrc2DXYRcF4MyLayNTp+AvEA0eNX8Q/dhv0z37nfFWRrAMvgbjwl+mhKYToOgBykV5o7VKYXeA0fVsW6ov/TN1s433Q03la6YXGZF9EjBc7JNsQE7Jihi+4xw0OMk2n/P4PmS8FYlTletyVTGMWgpdzyC8iCW0XV9r1Vi0PT/KJgEQ0OSo6b7Z9SQTirgMf2ibJvrSiglFcLxklG+zFnXbdSYxWowrUGPvzR6Z2HoR1IhvVdU37fG6T313eZ+R5QWZGSAcOfkXdvXQ39sGCZ13xR5Qib3u0I9DjsLtGJ12lAh1vKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgkojS5UxZQMrx78frFPOQCePO1vletpZ7ezviDziF0=;
 b=X+cQ1Ewv7WakwBewpfpY6Nptt14PJJ2L5Vw033sORfMcAtnBJw8aqiI55aOi/FomMJ45wlN61TmHQmeDgUZYRgiicVsMHE3hk/2YADoSrsivFVR1NcHmOaSgn2UjlXqms+yNxy/7z8PO0edmPClVRgh8GpEkQl1YrEr5kSFed2TwEyMdYskpCfFdPI+YtdCrdS0RH/1n4ayzJVAzHj/MiWAPx7ql/YDt00LQFNkSN5VouJPcyYObIYnQL17EksGf3Yjb7phTf1R1x1g0hlT/qEAs6FUuDVvcz5O4ryRQ0mrj8b4mQBS2/tsM7OGQtQ0+E07BIpQzwjAUbOz03yZxMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9068.eurprd04.prod.outlook.com (2603:10a6:10:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 16:23:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 16:23:53 +0000
Date: Fri, 7 Aug 2026 11:23:43 -0500
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
Subject: Re: [PATCH v5 4/7] clk: Improve a couple of comments
Message-ID: <anYGjwh_nRiQAsxO@SMW015318>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
 <20260807-schneider-v7-2-rc1-eip201-upstream-v5-4-8785f9531cf0@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-4-8785f9531cf0@bootlin.com>
X-ClientProxiedBy: SA0PR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:806:d2::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 520e6a73-0031-4e94-e82e-08def4a045ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|23010399003|56012099006|18002099003|22082099003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	s5EDj7eEHqSpzo9fSJ5xbLJ/WhFuY/tdJxPgswTp+nlxBvBf8CsGD4VqWwx+V+TUuNWIDtEMCOtALAioeQejSeqRWOCBjCLjmpreJ77JCInY94y1GQfd2Er37bCbSM+kU52IcpGaUOoNb9EN7y+ryUWJvfX9yHUH7gleZDjFGLmKZUO1/KuP0A1bgkVXm6xrvXrVjn6T2JQhYM2SaDxXcOWuNhOoD9lu3K+w71/ZMhpTrti78zmcYrVkvtxirHaGIyPIuxIw+68M8x7HTO/MZNQIYIipuA+Fe6b9ztMpF9fAVMMgmimESn3zCnHPAjtWme5emLbcxCSmglbmSf0n6upMVdy1Yff8/23nVFyMz/EdYd5YinwBP+B/13GvNU94tYkNpp+t5l/v2sctUmoQC+bOKTclXHyTL4n8AFYBgTniZoImwRP2FLXoxUbIl1wa6LjFiT4ysj32dLQKafq8HwV5aCaNHEmOPqisGuWzWL8lNNHpYq4aVepujDMbK++EgexQipTEfOXUYtzjCWqKCUfS016J2xNiOkJF6nFrORD4KQOTx8P++BBRxyHWBSToVEgt54FAoL+9PF5Gk4QkGsqAbsObzLJ2ovu3orz+V1exshzRysTf5tgJZVwTVXOm8u+KvqIMVPA6VTf5zm/itn3/OqV26kJ6PlkbXq6GV5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(23010399003)(56012099006)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qkTYcpUUdt/g9n9hpMtlp92G+RSIUj25X+8qIKd3kLWakv+mmAJTZtICr1l9?=
 =?us-ascii?Q?OLx5OdEgkP481cNrI7j+OzNzSqZ1agwjtt+zFdDFfHYQ4M06V2znhQOx1C2Z?=
 =?us-ascii?Q?kBfNo+qkOoJoTYzfyqppBCCIFe5LSELtYRxb5ivX/pvSFTJctG2knBdjNKs1?=
 =?us-ascii?Q?sDrxngxMxFDVakbhsTkSbLKa5BuHV0gXlUNqdnyJSQzyfzKaWZ5+8QVZTwon?=
 =?us-ascii?Q?CMFsfPR9MQGrE7pziGyXdprrBHdD7JpBe8dbQsUUGYoOZEkcrGJ2/CEjr1zx?=
 =?us-ascii?Q?TMVKpYHmYoQ8GEYe8e2FDGj/pmd7SjNJUeFgTEFuzlcX8jQ2YXjisozUR9wI?=
 =?us-ascii?Q?oPBnYVvwEyALpBHHfw2Gjl9K66ijMO3EpcKT6WWDuF7RyMQGQuLQzKhrzW0/?=
 =?us-ascii?Q?GMTBpF7CBiCGmfLj3YceTi/hP5IngVyBtjbcodqxYz4Xdvx6hXWi8oSV+xGt?=
 =?us-ascii?Q?wXNy2roTFNtCkpMfLptFH/NI45f+O70a7RG294u380DH/GVGbJOczxMV0AA6?=
 =?us-ascii?Q?6Llq/RmSMz7GEJyrsunU80YHjMNRAOJhbVgGwnj24LYAvBZUHXxkMhUyREmH?=
 =?us-ascii?Q?hePiO7rJJykAyDUvgcxf8humMum14ErdPLPKvkyiIiDg+eMW8+TeYIGpm6VQ?=
 =?us-ascii?Q?vPcDEIzAES88M3qxFx7hEt1vJ+c7yySHGlU8Jy6lSwTYFdhUusSDjnKlPEw0?=
 =?us-ascii?Q?aDB82aUoxngVkM6LwvJuOtGVfDFugyqJnxvmMOEzXxIhsaj8fsOcWIR1BYug?=
 =?us-ascii?Q?eWWCTtsuh3sGVj5VMJY+NMzpwXnTPbFkZFOg1QKlh/rulwEwqJVn5G3mNgWz?=
 =?us-ascii?Q?L0qBxVcM3UIpDekOYrU5Ne80NXGpvDY/aailK4Q0CApvRBCACYy9yRVUyp61?=
 =?us-ascii?Q?CVqFvb6u9Vn/OJD0TrpvuFHedoHjakh4sqZDa6iBHdsJ19CMoxsuUL9Ob9ss?=
 =?us-ascii?Q?Hl1/u6kejhBumlFa/n/rV4lE7MPuXfJebcdLy9rbU16pfqyVNaQ36nlK2hGZ?=
 =?us-ascii?Q?fYbUdyF/ENxIR1MKLWrlvaQWwhOvy2I8OV6HIJifjkjePJB/5p6tDFi7azkI?=
 =?us-ascii?Q?mYrf3m/4l58EYG2JmpyteMrd+0Z+0weHUHXvtIqjbSifAU852NKRQx8izfC/?=
 =?us-ascii?Q?nxP0lOvjCVHXM5jCxgYy2O4d+hk3zbS3bT4vGscyDD6Symf32Q1aADlccDqY?=
 =?us-ascii?Q?b7GcHkN3S/WWfn5G5kIps2nP/veTr1oEXEHU8IKfYU6M7cqVu27IXiuRa+3+?=
 =?us-ascii?Q?DgtR/3eSo0kAmiq3iLnfoRZribmDpzSADVCNMjknIXxulp0UC1Gqp1IIsCDG?=
 =?us-ascii?Q?ZuWlz4Uph8uGY2J/DI4yNKKY5kR8BAKDPebxBOSNj/AgEIgF0ZOhcw6XLnVL?=
 =?us-ascii?Q?ubE+mHuYKFirxGP7viZpFIFavfZ7vwJ/B+nQhWhd/OAl55jNUxLa/y9bR4a2?=
 =?us-ascii?Q?Mplws52e/JPfK1xoWosl4Kj0QYlK25hQiUe1npaUQOR28jrvCQ+ypyCj75ZK?=
 =?us-ascii?Q?2uZn88jAAQMOcF6+Gs4+OTddIRQv5UmNRQwzApmZ+A8gGJlsJFzsHI14psFr?=
 =?us-ascii?Q?+4E9YGTlwjBDJsYkfU353ORUCRq+xBnmezin+IDKqRxg/e2flHozqkZCEV66?=
 =?us-ascii?Q?WyrraDxj+Ty85QdBVB7Dzvy38ui0tNWILRIdhCn2O6lJbzPsYZDaHcdjqrhr?=
 =?us-ascii?Q?Ha/iV7gZwz+rDqGhD3GqVXg7cuI7LDFsLSFl+NYvJaP5CJphMWVR11ngqvXK?=
 =?us-ascii?Q?cvbwUjUxgHbgaRXvTK3P1a6q0U329aM0o07Rue9Qp7LUKjJ39aep?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520e6a73-0031-4e94-e82e-08def4a045ac
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:23:53.8846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnicHshFZ7MOIJJ2RDPyPwX0plhVkRN4XgfmPkng95GMXJmSZyV5BgWEns3vXqLKGXpjJQNRyT0UKxRyHgrlAKW2JceCAiEZdjr74ww5boRTzstEuAWL8dFRS9W+Unkw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9068

On Fri, Aug 07, 2026 at 05:24:05PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Avoid mentioning the function names directly in the comments, it makes
> them easily out of sync with the rest of the code. Use a more generic
> wording.
>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/clk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 08874cf9b561..7d63d81ebc09 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5202,7 +5202,7 @@ static int of_parse_clkspec(const struct device_node *np, int index,
>  		/*
>  		 * For named clocks, first look up the name in the
>  		 * "clock-names" property.  If it cannot be found, then index
> -		 * will be an error code and of_parse_phandle_with_args() will
> +		 * will be an error code and the OF phandle parser will
>  		 * return -EINVAL.
>  		 */
>  		if (name)
> @@ -5275,7 +5275,7 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
>   *
>   * This function looks up a struct clk from the registered list of clock
>   * providers, an input is a clock specifier data structure as returned
> - * from the of_parse_phandle_with_args() function call.
> + * from the OF phandle parser.
>   */
>  struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
>  {
>
> --
> 2.54.0
>
