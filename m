Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D7317173;
	Fri, 24 Jul 2026 18:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917182; cv=fail; b=F4uQTSZUnXKJEVie71ccNFDth7qe94Gq6FpIT1X2nljo0XXahZ5kaFj5ppXZ8dm8PVUgHFyG2hHCYZyGyz0yMAE6yrrEB2T8qGZ7dRtOystBRUJnJXx+QEfhVOZCkYiaCzRp7wPhqh6HDLcXW/gZufN78ERKOyF116ydwKGms7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917182; c=relaxed/simple;
	bh=ghkDmzI/k7ZyWHrJVR+HWIjjg5C0Y2jU2YYEnSfGv1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ScRNFgiE5gUlYTfNkDDAAgT5WnnyJBh3eOVRXnv3V8o9GRqwBg67ljiehOUoWhNhGMnutkQHxK5DTVkSFfvoCwbMf982Zv4KhUmqKKKk1FV7FLyL4VjIk8TEayWCyx9iWm55hV/ssU3YV7Pk+fAl4yFIuKh6wlqTbtzzOzzVhp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CfLh+c4C; arc=fail smtp.client-ip=40.107.162.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CfLh+c4C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIKAvmAkdt2Fr/Is7Jhi53Su/1KkPzPiF/qVH2gZb6Ck3cBFUiAFBqBfLtRhwFKwgL1S8YzCNMfnhNOGmhSJoKoAdpL9ixYPqhlsTwg9nLwhp4d4CqxL0kshzdJzomBnkYwmTVmN3bOoOozG8t7rkAsKFybK3VAvjqPMFWaw/kcAtRjnoM/2/ayRA25hhRBnbICBA8y+HOH/pj988Bsjs/Kh4WZG3Q5aiAD6Wv/sJrdCouhKIpruCmFJcxNQY1rb0Yg5ZszllIM0G8lfmbkYUAekMymq6ZS81rsqnVN5MRKSeWQg0sO55JCuEHjs7nsWq/rE2bGS0LETiwEKmzpB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KC0OIXLaMBS5jsfdX/mNEEgB3TgQXWBWAcehFdso3qY=;
 b=slWN+MiOYGuEMhck3x1eGgU7BWqxZOpxqkfl9zhZ5wl61weAG9xWJ+2tA1UJtoYwvVqkEDZ9LR/eCC+0vSQeHqTlVPe0mJ9TOTZ4kWmZ0b16RZ6LFcc/2airhoyyCV3cCLcz/fxvyZRC6Iu5vMMGo56wSa+ZpFrZIW0qvj0s30I9cHu0+V+5DA1pyGJ1zvGNDCQe67vCB9GrxlLHQXuh3ho+ZihLmSiMWytTNyguVIoINrVci6F5rcKiTZUHTlyGIfJiJzzqBbAus8/Ct4XYgTiX45zrcPzED6eI4V8NhHOO5pcUPz8j7Vc1O7DOBDqAr7vsDmwDz4A3H02pDaysHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC0OIXLaMBS5jsfdX/mNEEgB3TgQXWBWAcehFdso3qY=;
 b=CfLh+c4CR2XwvQjKBH5BLfJDdtiVN5de9ZY6PnRjA9TG3pdLUiBNFIKVkPh4Ik3obKELhS9lC7k+FIYAuH8zdrOX/ktlXBVPJyjvs97cDv+7HsGqNI/o6YaM7yrkxOeMfxe+yRPXRtcBRP8Q1rtdAsNxFGz9Zhqs69wZVSSuIyg76c8VEyOq7pCwLab/yfW2+J0oshmJhgOyyMFWxoZ90rVDmBKt5CiVEKdAQSnlgoCXbXWhhmKxMZ6E7W5NIcpXYLI2ZTOj+nJGENQ81JJQLsiuG7kjd3izHlN5Vd1hjqFvVfuEO3Q6rOCH9qGC7JiAfllctv3hKSWKfiuqZqMf0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8162.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 18:19:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:19:38 +0000
Date: Fri, 24 Jul 2026 14:19:27 -0400
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
Subject: Re: [PATCH v4 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
Message-ID: <amOsrxO3TGsl9kfF@lizhi-Precision-Tower-5810>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
X-ClientProxiedBy: PH0PR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:510:f::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: bf769213-5698-4ae4-c5e4-08dee9b01f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	uYQHG3Z8PA3NZtIt4i544Wf+o0s4Q0M4XhadMK6gVFhs9awtQe5bvgg2zfeJtb8Kcrc6WaNiHaQ7dvGI4YEv5Bjb+GlRnL6ZxsEwZiaoCe1eJQ5Wqju5/T2LhZBIcWXVbMRHCJKmPeAqOSD/e6VMiL6K1bdlqmyHEyMCWAn6HiHQyOWSx/9FhPOJW2uNaEbvwWsm++TB0AGVOgJgvSrjefCB4xfuSX5PhGd04XmZpJCLNg3wl6wXQ2PQakYrnHrK76wyQqd3PIGXoMv42BOF4eEuowXqpZplulJhxQS3xl5vfMlvx2i8VevQr3e1rqCmIHFP0CgBG6lT3oF1ojLhOk+kKI+owCIUMW8gSye6tq5OLijwzVpMEwGNSq/9vnQVVsAsfCj44CPlA/pPZWZNw34Vo4umHKlOlRHfEpFqLpSCY8bBKbbGGPWbqzkEYPsA+Pv93E8MTQWjYNFei4aToZ11EJ7UYblc3UxF4voEjgzE1NAVvSKs28ojDNTw/HSNyuweHnizQIZnqEYm5OIriiiUZCH0ETyhcFRQBRGYvsjLzSiDTic/3d1EM/JGWTbtxu9JqWtSbsezT699YX1kKPy8SSgdGRP5h2G8I1pTeN5ZldsGcWq4lBVf01UQvfioU56yPtJAYVrJ/w3mfVqsSm/Dmhvydb30F+UXKGv/90A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IUWHdd9W29kdycacrmMg3+upIzHJMq5Jnd5Q5Dv0xjLhvjglbz/LzQ82VcXI?=
 =?us-ascii?Q?d2kmirBH6C7V73Tigzyzj6thIiEMgUx6k0fLbDL6aA4PO52vMTvJ31ggRkxa?=
 =?us-ascii?Q?AjrMhE4USoRKVxHmEKdKWXX4PtzjM2ITA8Tkaf623k6XHQQ3khfES+ikPDQI?=
 =?us-ascii?Q?tGIFwmmn5oHO7RAKoSeh6UHTqR5w3+IEKm5X+7waYayVddOwMbKndV+Rw3QN?=
 =?us-ascii?Q?0FYqc7E1XT8MiEstYVyinaagWWGCvF+fNDWBqL6e8pLMuG4LmmcsM9fIYVWv?=
 =?us-ascii?Q?rdOc9Dm4kSMvps5h32cYnLpFL+py9G2aVREm3ZJaNb/b6Wi8/O9f674jPgVG?=
 =?us-ascii?Q?Gmxvy4l7z2ylCYyQxEvR8hJNOeZ99p1xgbuQJrEi30yp3Bz4aU6+MLnAiqyR?=
 =?us-ascii?Q?gJxmmjUATWihZ0OPypkzY6KH1bE9Qxgv+CvAV9qtZ6KSdSX+uQ+1/Hvr0I/O?=
 =?us-ascii?Q?MwbH9JakeYKJp7Dq8rlMkhHxJoOYVfhmVFUtbId8D1coDzO2g7K40CfKZWfL?=
 =?us-ascii?Q?HJoAiPvvNlALvZWYJ5M0HUm1vQngjs0SxcDb6WO/qloYxksfj4iGvkGhUlF6?=
 =?us-ascii?Q?slRiVB3vm4BF/ZMF/kxIqZCSPUX3337dSqnG9Fih9DQu0MpKYWZ7K7KR3wpN?=
 =?us-ascii?Q?lVt0a6O9PbcXQuLJ14KPkpON9Dkh2NAsL5sTdo2JyrBt1jssO8puvF0UimpV?=
 =?us-ascii?Q?gcweaHIefydp2EpHfE7UQV3Hx4ZNu3DsBmZvbE4mYDDoaN78wFqeDLbev+bJ?=
 =?us-ascii?Q?RcwqeqwYkmM4LNuLYNkyudhupmTOwhYeM1WP10YMzRZEU2JVX9X6BpT8ZAlg?=
 =?us-ascii?Q?eOMpTWtdB15ZgTXQyohCwkoSd4rl5Mdhk3EbRSn7QMTtN3aXsdN74QR68ID0?=
 =?us-ascii?Q?pFchIK507mkLQzj0FdmFStCuHF6/wdl3YL8BA4fqdSoZbS8C0kLXPZRc4yjT?=
 =?us-ascii?Q?omQP8bsIoDwCu9q2ALRfqWaDHlrO4YhxeawoOJsdpNsG1ppv4E5dtcRPDp+p?=
 =?us-ascii?Q?QZgAToMW8Fr6fzadSObRYh0ZV4VfA1HU+CSWw9rk/kK4opJoYADDUameEU+w?=
 =?us-ascii?Q?eWHjty8qzWQkVTXhgBDbSL280EhEIad7fDwclU6DJCVqP0HiRNRBP51ymndR?=
 =?us-ascii?Q?m293kOr31mbX6KTmK+kcS65q0PRjYn59hzRIqE+OUv836qh6E4i1gjY1hu3H?=
 =?us-ascii?Q?flQx3jURwJtSqVyH+P499dj9AtUpiJyst9QvX3SD3SmDPOZ8cpU5NuQJHkLT?=
 =?us-ascii?Q?1zACrsq84WJZPp0NvQScyqHHB2w7GabMRZPByHfRVz8yk8WThG94vxbTW2Y4?=
 =?us-ascii?Q?nv10iDwqCOX3D413FkjRsxk52cHHJZ71u5h4KVQ6zL3QtJZ8yE1lh5WCsAlM?=
 =?us-ascii?Q?TOQeMX8OeYPaKS3nXNn5UdV5zYZKCLLQsJrTGUAOByoh8PdVSgM093cFf/DO?=
 =?us-ascii?Q?UslEBoRCXqHOTu1QKO2f1ycModuuk2nAmZzczg+sCOB56+2pMeLVqXbTqxgC?=
 =?us-ascii?Q?4mBgRC7gdfq1lqK2WZ8p7kn0k6yaNVoq4aY+S/1D+A3e4iHOkJyukv6/LkHi?=
 =?us-ascii?Q?S8o+MlHeia7UGRJ7tkkVhx64/g7dBkspzfUdUUzw9+dSwLUwUbPZlqfdCC0T?=
 =?us-ascii?Q?OX3EMZEykjvcKpmcDGVpKzmUWlGbQ+b+h9DS+Btqq1B/wtWGEB655U1JH9TZ?=
 =?us-ascii?Q?6m9plGcaHTzTF13zJP2FSubKJ6zrPUcRP9OBeL4kpVgFuHokuP0G0b1toMN5?=
 =?us-ascii?Q?zH3PYYD9nbA+4xiRprKH9Z1J9a9Qs7aeX6A+Brhf6EfPyibZCWkZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf769213-5698-4ae4-c5e4-08dee9b01f30
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:19:38.1615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU1Qykqf/CZF4oOtBMzgwpEPkV1ws2RmTr9v7O4AecwkHvZ9zlztmArG7tcKp5LY/3dz498EtK2YgUvhyzfoyjwUyGBBkQS2ThSp3GMI7HiZwXwP/67br1dKHm0x/Pnb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8162

On Fri, Jul 17, 2026 at 05:59:19PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Make sure this helper is never broken, especially since we will soon
> make some changes in it.

Nit: Ensure this helper remains correct before making upcoming changes to it.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/clk_test.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index f47f81b7d72a..4084559e157d 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3637,9 +3637,23 @@ static void clk_parse_clkspec_with_incorrect_index_and_name(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
>  }
>
> +/*
> + * Verify that of_clk_get_parent_name() returns the correct clock name when
> + * looking up by index through the consumer's clocks property.
> + */
> +static void of_clk_get_parent_name_gets_parent_name(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx = test->priv;
> +	const char *expected_name = "clk_parse_clkspec_1";
> +
> +	KUNIT_EXPECT_STREQ(test, expected_name,
> +			   of_clk_get_parent_name(ctx->cons_np, 0));
> +}
> +
>  static struct kunit_case clk_parse_clkspec_test_cases[] = {
>  	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
>  	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
> +	KUNIT_CASE(of_clk_get_parent_name_gets_parent_name),
>  	{}
>  };
>
>
> --
> 2.54.0
>
