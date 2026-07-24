Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013011.outbound.protection.outlook.com [52.101.83.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1A2E738D;
	Fri, 24 Jul 2026 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917840; cv=fail; b=ZCbfIvBjiwRDjbq961L56Pn5V0dcELetYZxo+24DL24UhRUhtQpNpEQwavO4jX74Ad7Z6L00S+tf19lGf88sUCLqQmwRI9XOVwFAveXzkoovEXLYUr3M6i0yRNC8IKm7cIsvA+W2kU7ZGRFUk3vRfE2dJQptlchU+JP48BsJr8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917840; c=relaxed/simple;
	bh=k74+90aRJN8UJlvWzG2NSuIbHqG7BjfKUHd/bt4yFJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EXG6GCbHCx1s249hYa150ZIIC64RuuDphhKxrsSjyYP54gmMjJCBLp95dSrIa3/kHvf6Nsy/Hnkm2FqD3/a2jxwR/dGhed4JO/8CCSXAqh8js/T77D0b1gimW6kzn/DxBwGOQ6aihUmnRe56sSst/JfcXOCwyntws6WOYF9V+Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DpbEOqOE; arc=fail smtp.client-ip=52.101.83.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DpbEOqOE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sul8ES6boe5s1I0TODjKTkDW2QMlRMDaJlCwmsOu1lfWBjVpHgVPq2+ocE2cRZIojsuu7lzG/gcuzNdjHGr4dlLWhDcwwOuDHN2/7wR4vY7BV+6YVnIFPQWjWfDX35c/5KBbQjP3liDMdHfn1yJAJxitfH4kO/kwZvT0gfc2beIko7pdY0IOxePZ5KllxkxLJ91De6O1LJ7GkJ6EXLIJleDlQ0M5Xvh+fbJrvQ39zGKKXK0FmNXtELW+d1nZ4fSdCIkA8ftYmmLkIhuWypPGzk15LAloJ96f/WSSxxTRkvjLV3y8u2gmrrO1Wjslr04LuAlLMvv9rE3fwjSqlitBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TMzfNLuiKJpqnREvEGtvLb7cJKFQR6/qeDugbq/OaE=;
 b=EKp0lK5gmJE3isW9s7mYMLmbK2i6Oj16K7feIpGWNG5zeXN/SfBgZoptF/R8tvYZXzaLo6LkyM9RqNLwnqOuKrQJAgJWmHw/Nc1uK8aKmXJBFIyAl5ZrGZPZebWdzUgoXvSM/gdUCsrSknXrC1c4XcDdBdVBdOXI25sFfORbf68N2EcymQVgYwZ7HvICkjPp2lve2mg2PPbjlRvlVuKxUaqEEDkpX/PHGhbr2tJiBs6/MZLWcX6GRjoxZndRgwYhWCgTTdhmQyKkhT7JDPcA/t84CBfzSNE2+cbCgjdz4bLlWqqtambk1Hhg5W5LiGLEnWZKwV1z4ktVwEaYR2mB7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TMzfNLuiKJpqnREvEGtvLb7cJKFQR6/qeDugbq/OaE=;
 b=DpbEOqOEBJtIO7kvdY/2p9fpSsKc3M4JB3Rc0kGGU03Ifzi2kOmj8TiAPfUJG1EcXz4yjrrz0dvhkQXYsSVleMW2F34CMTihGi/qWQN7j9lY2qRygILsnah4hv3bpvj9DRDN0lteSJKsbHRKGmO3ORgvU0ZAGesV8mvrz322gzAG9A+4Ud8aybB3Hm8tUg/0q0A0YetVOJgtyiEpeey3hbRPOS6QmWgqeri2R5ysLMnv+ZBjD7LfNYIFRVqXYFLwIpTqZL4Ski/Q40ogZdLLk79IPGCK85DH7+o0VkTqHGS6Cl5sxuJs0tu9VwZ0EZ/MMDnBXLnNtnfZfkuPUEyBuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10325.eurprd04.prod.outlook.com (2603:10a6:150:1e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 18:30:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:30:34 +0000
Date: Fri, 24 Jul 2026 14:30:22 -0400
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
	kunit-dev@googlegroups.com, Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 6/7] clk: Add support for clock nexus dt bindings
Message-ID: <amOvPicAZconUwQe@lizhi-Precision-Tower-5810>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-6-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-6-751547e160e5@bootlin.com>
X-ClientProxiedBy: PH2PEPF0000384D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6e) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10325:EE_
X-MS-Office365-Filtering-Correlation-Id: 43dae522-6d0f-43ba-9014-08dee9b1a623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jWr+4H9coZRjUVpl2MvNjSbF6Lck3iwWpdGcJTm1YLKCfOUSNwvZO4qyWquYnNaXetCp3tsEZgyME2bDQN0zQ3uVm2aeYg6ESRWUqRHJtSWOSHxwrYOkeUiC3Txo1yHcFUyke4FZl2NikxKfBR0dV4QqEmJFuYvv9qgN47+qNy42X4Yts7dnb1JwfTVh0DzA7TbcXAUwc8knL8PAkQivdqFbFZ6770Kif0bi7BU6+PDjId8ZKY513+XTI7VLCL2/69G9h2rTlny6aD1EhSQSHMRGZ1dz7SHxAVJw6I5xR71r0FQ/tB7AQBdrRitXNjZXACAsIVHMamc7KLKctZoSRgIUinkokdc+Q0up6pBkEIf8ra07qUiz3IwjBelLHmD5ZuTQbWDGLPhM8e8V+7vonhLYSzIUSLwMBccae69DAX3UPOZ4sjsdhZwnJW+e6RTsa7aKbmC/t4IizUZMsa/NkD0XfurWcTk9TjExx2a+feh3qO4VKrc4wm/GlLIwF6VaRuL2IZEmjJiaX/ZqIw3PfBm9nwJbfw+MWmSkVc5IgYyaaS+/c2MJdUiY16RXXqYJk2gFYsUymlXssqkxpFN+kQtfykxtp3mo/UpeeSreQBuJhcvCLmzqhDGim2swsUQ2Pth8hewweGfxXchLuGL7xcgtrb7wuU/So+6QA4XUsgc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yMJOmWf7NQCktP3vLF3Sk+8m9Osr1mekmRiu2nVKYHxx0zR9l9mDSntv+KcE?=
 =?us-ascii?Q?LSzSWqHC3SIFaWKbcYJrCWp2rKV1DU57RXsVyKQS9pBMRJE1D+8LF6252pW1?=
 =?us-ascii?Q?I5KPcXXEPV4y3ncn9HnTl4JmOg0NnwIZWlhkQEyVYAUHtYg7/tjUWMQgp9Dw?=
 =?us-ascii?Q?atcSCSYG94gz9u2YN34nffSCR4W/mt4AiPvaIl7qT6IkxZw0aJ/8cCiUyouX?=
 =?us-ascii?Q?PsMyLckLWYpodBVBjQ8PRfl8XEiZTXefB/osX4hUBFcYMEgkdrZ+9mKxeo22?=
 =?us-ascii?Q?uuVZkhozrWmsMr6WC1JHvi1LNP0iiWrBnHoWHXjVTIxKtR5t9LfLOcbkNq8U?=
 =?us-ascii?Q?mly4rfIoSMsoiuEMVUOHOLkckFt3vDlpdYSQnplcNhjkciaarSnAZ9W295lp?=
 =?us-ascii?Q?MV9SerT8H1Sf+mWghpivoZRZSmXwaSXwOn4AIkRGEIYycWDf8lcRihnqprgh?=
 =?us-ascii?Q?ODKRgzmg+D0LUs1BNIipc8uzf4DvqkEZFLO9Fdrj506dP+FU2sZ98wqrNrX+?=
 =?us-ascii?Q?87Xl45SrlRh2LoPPoXnggZdwmKmj+asgrD72eom1geUTyk2bJ4Y8F46m+xpg?=
 =?us-ascii?Q?OphYwE0hvST/pXaaY1v7bQghXaWfRgYtW9qMgHxrq4SYidDebRWf7bUu7Giz?=
 =?us-ascii?Q?rXA/hAF/M91l3Z3FqLEnsdi4CfNi0vQVeyQQ7UWuE1vhocWrU1sRVNJa0Kgp?=
 =?us-ascii?Q?YMhUGn7TLHM/aAeOGcQViBiXKyaCBSuomrV3JTcoJ0uKK4fRTsuKlA8R1rl3?=
 =?us-ascii?Q?DqUuVeTIEKfXBEy56C23ZDPMatDVcsuXoGv/vLzaUBhDVJOiLPes6+DYhVyS?=
 =?us-ascii?Q?ywbw8fFSwm1EEKtUgETz+45ydTBitrJDVBI85lK/GGcFdrDd6pXacjHSSS0+?=
 =?us-ascii?Q?WHd89AtL/Osa5atIvyBnPX7/Hl85ZJfI0Iscb1ArJdQxDD9nm6eCyn7RIqw5?=
 =?us-ascii?Q?dUef1ZEWH9UpWnTIz0j+LjjBllnbdQmshfyEozaAjeicCMJ6KFjKGS71asWn?=
 =?us-ascii?Q?GVugVLCNj626ENrGaY9IkshIw6XgVkJKRbCiSlJH+o0ZzjsdXnP+176NAgmX?=
 =?us-ascii?Q?UMQZ7xuandOuZsYDYrGH7uVk+v1ai79k0qt/ulAtf3tObLonQzfvU5vKq2T2?=
 =?us-ascii?Q?v9msR7zNxIeSdFkjghHbP4bIXRfzkmblKKElyLR20lKORpg+J6cfMnKwDxA2?=
 =?us-ascii?Q?VZFjh8B/YUcmLOmVif1BRjtgC+LIatbLuEWTHG/4Z4Ns8VCXCZVZ9Rrjihkp?=
 =?us-ascii?Q?jTSm02erC9f9Qq7Xo8ztFF8t6RLMFzNKiw6RtEKrwGR+HK8VJShwXIiCxQm6?=
 =?us-ascii?Q?CS2q0hL+rbU3rM3Vd8lMcz2tXel4gdvMWqwE7eKnmMP3eyXiXpmWwcpsx/cC?=
 =?us-ascii?Q?MPzhaAxWK4ofhDCT6kpetyAsm0jVrTYl/NsBQ6qLPinz432cABPPvFmSzC2w?=
 =?us-ascii?Q?iX64eiGuS+SgKgp04qKvsuog72foTLJ6LVuYTdVZSqp1OFZ5MyEJb0rhsIP8?=
 =?us-ascii?Q?fkMlsa0gEsiho0U0O+e/xxa9bYPfKW5zUcNJADzDNB7mYnge26slF8dJYPxw?=
 =?us-ascii?Q?PSacTrCAuZgGSNMyK/4OsbKFbW8H6ILyQgvT3swo3dRgf+m1i8FUX1vlitrG?=
 =?us-ascii?Q?ADY9cQBJTaRyusPyVcClCcEHaS1/9/TogoHmQSfGCXR49MZzHVmmz59QkpRO?=
 =?us-ascii?Q?mJ7NdiZRgKfk7OxNCjs8e87xdfcd5WaTr0ttQ4m01EXukUKR11QLDUDur3uS?=
 =?us-ascii?Q?VIYfwVvODFhC3hH88o7A5IITgihhYBOE4FvwSL2KkwAAQUyQcEXb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43dae522-6d0f-43ba-9014-08dee9b1a623
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:30:34.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOOKhoGQ4LAahr+4gckPMyYttcpe4P7p7Q2PaknLb9CxAJrdF5dmk+Fw5jLHZI43lGFgoCq2Pm/oBJvtULoJHtPIkRXyRiOPQH7eZHYssS2eQBhIJdr/pxCbZ1NPW18a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10325

On Fri, Jul 17, 2026 at 05:59:22PM +0200, Miquel Raynal (Schneider Electric) wrote:
> A nexus node is some kind of parent device abstracting the outer
> connections. They are particularly useful for describing connectors-like
> interfaces but not only. Certain IP blocks will typically include inner
> blocks and distribute resources to them.
>
> In the case of clocks, there is already the concept of clock controller,
> but this usually indicates some kind of control over the said clock,
> ie. gate or rate control. When there is none of this, an existing
> approach is to reference the upper clock, which is wrong from a hardware
> point of view.
>
> Nexus nodes are already part of the device-tree specification and clocks
> are already mentioned:
> https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
>
> Following the introductions of nexus nodes support for interrupts, gpios
> and pwms, here is the same logic applied again to the clk subsystem,
> just by transitioning from of_parse_phandle_with_args() to
> of_parse_phandle_with_args_map():
>
> * Nexus OF support:
> commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
> * GPIO adoption:
> commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
> * PWM adoption:
> commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
>
> Only expected Nexus property:
> - clock-map: maps inner clocks to inlet clocks
> (the other properties have been judged not relevant for clocks)
>
> Here is an example:
>
> Example:
>     soc_clk: clock-controller {
>         #clock-cells = <1>;
>     };
>
>     container: container {
>         #clock-cells = <1>;
>         clock-map = <0 &soc_clk 2>,
>                     <1 &soc_clk 6>;
>
>         child-device {
>             clocks = <&container 1>;
> 	    /* This is equivalent to <&soc_clk 6> */
>         };
>     };
>
> The child device does not need to know about the outer implementation,
> and only knows about what the nexus provides. The nexus acts as a
> pass-through, with no extra control.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/clk-conf.c | 12 ++++++------
>  drivers/clk/clk.c      |  4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54..5380d43b56a4 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -25,8 +25,8 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
>  		       node);
>
>  	for (index = 0; index < num_parents; index++) {
> -		rc = of_parse_phandle_with_args(node, "assigned-clock-parents",
> -					"#clock-cells",	index, &clkspec);
> +		rc = of_parse_phandle_with_args_map(node, "assigned-clock-parents",
> +						    "clock", index, &clkspec);
>  		if (rc < 0) {
>  			/* skip empty (null) phandles */
>  			if (rc == -ENOENT)
> @@ -47,8 +47,8 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
>  			return PTR_ERR(pclk);
>  		}
>
> -		rc = of_parse_phandle_with_args(node, "assigned-clocks",
> -					"#clock-cells", index, &clkspec);
> +		rc = of_parse_phandle_with_args_map(node, "assigned-clocks",
> +						    "clock", index, &clkspec);
>  		if (rc < 0)
>  			goto err;
>  		if (clkspec.np == node && !clk_supplier) {
> @@ -121,8 +121,8 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
>  			rate = rates[index];
>
>  		if (rate) {
> -			rc = of_parse_phandle_with_args(node, "assigned-clocks",
> -					"#clock-cells",	index, &clkspec);
> +			rc = of_parse_phandle_with_args_map(node, "assigned-clocks",
> +							    "clock", index, &clkspec);
>  			if (rc < 0) {
>  				/* skip empty (null) phandles */
>  				if (rc == -ENOENT)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 45f5d7a4ccc1..6acf042673c3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5207,8 +5207,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
>  		 */
>  		if (name)
>  			index = of_property_match_string(np, "clock-names", name);
> -		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> -						 index, out_args);
> +		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
> +						     index, out_args);
>  		if (!ret)
>  			break;
>  		if (name && index >= 0)
>
> --
> 2.54.0
>
