Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D79B417D69;
	Fri, 24 Jul 2026 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917925; cv=fail; b=VeBsLlZTm0GNgtsTxDZp/tppyleGuEdBBoLxJ8gvkhtW0LqWkDF48dswB8a3qKRTftxWWTa9xDZIB5Ty5kdGU5ZJIztx+Q5x/92p8iWGkGox0i0WEY0EJ5FQs4i84uJiInZs9KLUNw/D9cl+KHrGF032NFtbMGih2Uk69HJKb1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917925; c=relaxed/simple;
	bh=ihXbjmcmHQJlfiI0PYaiCkUNbOlL4HfEQavoN2gHNDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I5O3AuwWirkudeAf0xN930Wz81qn2owMdLxMjdlKAtttsM30N4pd2uuqy9zT5QgqZsSnkeeMwofEB7GHMCcUmwgPPVNjZDHO0SeSeFdIAATn6YGA+I5/nVoXIuKugi2RhKPU4EQQEnEy1Ao419OX+8J5gK27+81IYD7jw92lsQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VUujvEuS; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VUujvEuS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehQItgeRhiNA6YchdZhjIB+ApT5U8k5o2bpfOM920T+Sftf4Q7RKodRaxZ5aWaKQBikqHYHu5KCGWcSuY+XLCCKU7wQqQE22wwB1uF1F1gcEaqEz6QZDtlXlzZr/klfmGJiij+DJOUMfqbCgKNMsuqepozwgWuSqxoaVIFe1t6LFtILdt80rHr+hQ982Ug4UvRa0iBw1L0ul894zwGKp6dEi4n7bKEyFDbi0QxVU+Vkror2sEjB0QeJmnDrA5kAjb95aHjHhC26QQNO6mfftnDIu76mmckLd7ccPFim+tctmBm7yueC9C230qCHZ+68FiYSuNK17L+tjYPsia5QLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgaaSX6RJ975O2g40ubr2rkkwg0gCrC/EZEPSkzUxLg=;
 b=nhbLRizIGW8r+7M/d2WhTEGWRjSFTSDH06YImuowwOZmNGJmCimOLVv4lgNjXmm7O9HhahGON/fBAQFyIxD83UGAvkmG68Q3FJkONYp4ZsEjmixqn2WrOOj1HXzzKJulJXFTPPfBcCCg8HVTVfBbZLlQXem4btbjurEq9L9SHGwQNofiSeoHe1AARe/sKsWmaZjDUHjxQOksVjgitAPo7HrdwljtLpylYFR1+rXhir7udOF5lp+MwPuNCMJNqnqb1ZpBwcyeAxkhOZvsS3aW/p0gX5tS/3cJlfy8LdGjNMBTbNyqz0u/30qJN5mplqBlTFjBWQCDGGoX+6aNm5V+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgaaSX6RJ975O2g40ubr2rkkwg0gCrC/EZEPSkzUxLg=;
 b=VUujvEuSVKUO4gXl6ImriPa8dF/69W5AoOoIeFT/OBjQVLudWhIurxaoq7lXh0JhTQhQB7h493vSPkmXmE5oDvzDHfjqorffQeDR0s/Fff/sVHfil4GPi5hQ8xaz25Sv4+PE0/LZqaVy/kVgycWho3aAAckwax8nUK8n2EOZ4TPqClrnXvmcQTRMpnyj/bir+i+F10g/TtkiYJPNX0FFPafhE/1gDFhX54H7CvL+3/POxwFC1rlCmq8jbk6wYB5yOHvpTlvOGT+X49hd0d+m2olO+fzCbsrVulYpKhaz2mwVF7Ea6Q171dy3iYdKTV1cgdrc4gOVLnYO+z/mNd0j7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10325.eurprd04.prod.outlook.com (2603:10a6:150:1e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 18:31:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:31:57 +0000
Date: Fri, 24 Jul 2026 14:31:48 -0400
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
Subject: Re: [PATCH v4 7/7] clk: tests: Add Kunit testing for nexus nodes
Message-ID: <amOvlPlUq_CJ1D1X@lizhi-Precision-Tower-5810>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-7-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-7-751547e160e5@bootlin.com>
X-ClientProxiedBy: SA0PR11CA0110.namprd11.prod.outlook.com
 (2603:10b6:806:d1::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10325:EE_
X-MS-Office365-Filtering-Correlation-Id: 567eee7f-6178-4016-85a4-08dee9b1d78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0JtMbc/U2bV4Ys6e/E5QMgvIstZvWqk57aT3+2QbUw2yYBg3jb0dJVMEssRhZjnjHyCRKPVL9ye/vK1rxxMGQwr2xwszbhtg8EBqeNtpt6lL0qwsI+Rri1LRRiwgcau1rhMFGus4u/a+1y0qh9YLYxcbwTRnQJ739Ajx2MUBi/nWzWtL5KsvvowpEqDLd/oHLRPMsqa5B5ORWO2Qd6R9kiUlrka0kvorUovlz3aM1JrGp2y9hcKSi0quewI4vmsrsbozPV7gHjdsPXiKZw+cZzWPk+Rdk6Atzu2a0aK+0WfdyOAcWRKe7WHDYbI9+UPS1FW8NXQEkTBwAnGAH/wgrC/+T1QI3MhCJ/kfxwjU0xGL7Y8eiv+5yYl3GnI6iRTed2yKgW0V3rfIbuef3o3jPX40Yf5yNuX80ItYh1Jl1xM2/MPsviHlGShIEMd1G3dlq6L8lp7Z5h1ttUw4LxpFpHMsjLHr3Y/a/jJLZPcQSYh9h0Nfic9k3+jP8YjV1UdauAbRJX//SAHc/bM4yF8J/4lrxRte0fOSSK3It8EwCSs/CQOc9l7o1npag6ZM8oix0QYb+s3FAMvsb/jJ09WdjMGJSddA/Gv3QTx4UPvvqyPjOFPQ5fefpzEQ/U8Np+dtr2+yFVwQldVenkrI4HhtcqKO1XOQ8iEJhk20JQ0AW3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PFLP3SIv3ywyz48fOcurpWCHoPNYGq2+8Eap4nZlgeEEgQULPuUDYLLvwJze?=
 =?us-ascii?Q?rlAsWs+y0ZsVgDvNHHXfqNFSVWwiMP4TCgTHArPiBv/ooLZt/SEONrCI1V0E?=
 =?us-ascii?Q?ZkXX/KJMkzs/v73PRQONGMA8agTGHIxC4+ZSJQA/+aZX5Jk9qpUtArsGnixX?=
 =?us-ascii?Q?I5O90zYqJojpdKG5yNVEzva6Rr11fXm0SYvCSmWKf86lNArnYLLo4jCPWGtM?=
 =?us-ascii?Q?7Cy7FA+gG9GfONDHucYYcndsa4Q8NB8u2QxeodoWYP1eUEdZ4epwKvVU2yMY?=
 =?us-ascii?Q?SCxAWUZcxNlpanR/1/rClc7etS+yLX/fKG5p9OD/rKrypb3RvFgPjgoJ4aIk?=
 =?us-ascii?Q?keHuJwV/+vQgL2Xmj1sIlv3rQxocxIKPUlTAH3Xq1s/pCPX/iBL7sA1/86n2?=
 =?us-ascii?Q?jlHrVztW/hfJJyH4gR8+7lS6Hk+49TLFApT3XsmTFcMMi9oUfWAHSuMSK9iv?=
 =?us-ascii?Q?izMBLhp/Bxv7x6n4l4aZAazJu4niAolHtlMWID2G1akXzOrQcTTJGtVR9G0J?=
 =?us-ascii?Q?Tepk8eupTyXX2lXpD/60uHw3gcdSANfsbGaUjpioERNY+jb6Qg+otDKwRCV6?=
 =?us-ascii?Q?LPtLdlcBDw+PAs1b6CkPLLQJR7CBxuB6LhAmvoWWc9e1h1Nobhv4NvglvyLV?=
 =?us-ascii?Q?XBfFj2j2aZm4CXFc+lkApwl3O7WQaAQUn15M7Qzgs9EuyAxkiRkle5Y3sSKP?=
 =?us-ascii?Q?WAlQnUbSVrYu6EUnK7AWyfCO4kh9ipe6vKJ8z3Pr6RNNmM3ju/jQUnF8wmqx?=
 =?us-ascii?Q?z9ybzR3MZvmBxa58Z3nEnWA7EYwVo/Pc9/J04QJwlkyGJXdRavaC+waUKaUL?=
 =?us-ascii?Q?NVQxl1c0o+zjMIMsWJzgJMJ1w1OxQEehY5tjcZl4T4GY79m7UvbgJTpfMHLG?=
 =?us-ascii?Q?zITAQpvWlzHkrylsuApQPNgRQjP33xG7bFKFWgtt8dB/bsTXrQ8tRkh3Xzz+?=
 =?us-ascii?Q?SV68mY7GobnY/dqRg3dADDyip/awwmHpJ+xZAS+wzi/uKRZVtrMD57po3A1e?=
 =?us-ascii?Q?B723PkxXqxcTRKK9VMUJPFpE0xCpgY5gT6cLKbGmZdtScEZil38zh5Zx1zLV?=
 =?us-ascii?Q?tcZxQDFY1/UsoI7OERMmd6vqXndOqZZ31BYkr1N+dQnX8Xog6fM7VbfIOUwS?=
 =?us-ascii?Q?UntVTovST2xPGz0VUYc83YVa3eYNPHoiTuIOXAZXB3diBsRio8taTZCAK0A3?=
 =?us-ascii?Q?yhwuDTbXjdK6yiZ/pg8dcISMgCBRQ+M0fGUGq6D5pQ+jQnWH/C7eJRdAiIeW?=
 =?us-ascii?Q?Rwrs3Sl/xMfCdRaOKwtfXTVFUsSh9zrEqr6KOy5wzCqQ+AwFeq0vOCFuibjy?=
 =?us-ascii?Q?1JDnVX9j8zAhYiR+biI/UtT0gN+vf1TK08lOGWmrMgxPeX7Ls3YbF9vOOc+4?=
 =?us-ascii?Q?3aiKnDcbl/GzJhPOVjVuTqexXgkaKaXFYQswSeR05f2Kv9ri5X02eoTt7ShQ?=
 =?us-ascii?Q?czN9lAtxm3atSCa17aulPLeEfD3VLGJ43vU5CLOibZsulH/wJ9WEEbW4TOSr?=
 =?us-ascii?Q?uga2Qigd4rKgpstVEmPr2S6jWtI6YXiSCshNzlckQOpa2Krw2X4nQMeoUg3e?=
 =?us-ascii?Q?piWiAqItca5js3sqHjEL1KevdHsPMlQRNVGcZ6/BkklMvuXXkwvHcQFlehwg?=
 =?us-ascii?Q?sMEtvTAUAOPOIp3aLJVIhySPzPoGh0bqeuyxXqyfU4G6joKedRs3yrctz2ZI?=
 =?us-ascii?Q?QuVatuQdx+8g7RwWgRkwawAMSh6frBp0YFHsdJ+W0RvN6ckBz8iwfWUkIWGi?=
 =?us-ascii?Q?yLB2ApHf5OR10cYhZyCs+PK3YBbGwCeY02hnmuMJd+pm/boKyTZR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567eee7f-6178-4016-85a4-08dee9b1d78d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:31:56.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zCcJPRykiVuVTyxMDlvUPbKh7LxtCWL1Y30zFmaS9OntMmHJtVMTm4RVfDHyGvfrhVKpH+MiCwgXi/jUUdzZ5qF7bqhPwg2WK5aU2sHsmkefafoqTKsQpiPA42jJB0W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10325

On Fri, Jul 17, 2026 at 05:59:23PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Add a nexus node with a child requesting a mapped clock in the fake DT
> overlay to verify that the parsing is also correctly working.
>
> Create an of_find_node_by_name() like kunit helper to garbage collect the
> node automatically in case of failed assertion.
>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/clk_kunit_helpers.c          | 31 +++++++++++++++++++++++++++++++
>  drivers/clk/clk_test.c                   | 15 +++++++++++++++
>  drivers/clk/kunit_clk_parse_clkspec.dtso | 10 ++++++++++
>  include/kunit/clk.h                      |  2 ++
>  4 files changed, 58 insertions(+)
>
> diff --git a/drivers/clk/clk_kunit_helpers.c b/drivers/clk/clk_kunit_helpers.c
> index 68a28e70bb61..daaf1cf1546c 100644
> --- a/drivers/clk/clk_kunit_helpers.c
> +++ b/drivers/clk/clk_kunit_helpers.c
> @@ -233,5 +233,36 @@ int of_clk_add_hw_provider_kunit(struct kunit *test, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(of_clk_add_hw_provider_kunit);
>
> +KUNIT_DEFINE_ACTION_WRAPPER(of_node_put_wrapper, of_node_put, struct device_node *);
> +
> +/**
> + * of_find_node_by_name_kunit() - Test managed of_find_node_by_name()
> + * @test: The test context
> + * @from: Parent device node to start searching from, or NULL to search from root
> + * @name: The name string to match against
> + *
> + * Just like of_find_node_by_name(), except the device_noded is managed by
> + * the test case and is automatically put after the test case concludes.
> + *
> + * Return: the device_node on success, NULL if not found, or a negative errno value on failure.
> + */
> +struct device_node *of_find_node_by_name_kunit(struct kunit *test, struct device_node *from,
> +					       const char *name)
> +{
> +	struct device_node *np;
> +	int ret;
> +
> +	np = of_find_node_by_name(from, name);
> +	if (!np)
> +		return NULL;
> +
> +	ret = kunit_add_action_or_reset(test, of_node_put_wrapper, np);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return np;
> +}
> +EXPORT_SYMBOL_GPL(of_find_node_by_name_kunit);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("KUnit helpers for clk providers and consumers");
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 4084559e157d..0c2f1efdaa8e 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3650,10 +3650,25 @@ static void of_clk_get_parent_name_gets_parent_name(struct kunit *test)
>  			   of_clk_get_parent_name(ctx->cons_np, 0));
>  }
>
> +static void of_clk_get_hw_maps_thru_nexus(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx = test->priv;
> +	struct clk_hw *expected;
> +	struct device_node *np;
> +
> +	np = of_find_node_by_name_kunit(test, NULL, "kunit-clock-nexus-child");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, np);
> +	expected = of_clk_get_hw(ctx->cons_np, 1, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, expected);
> +
> +	KUNIT_EXPECT_PTR_EQ(test, expected, of_clk_get_hw(np, 0, NULL));
> +}
> +
>  static struct kunit_case clk_parse_clkspec_test_cases[] = {
>  	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
>  	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
>  	KUNIT_CASE(of_clk_get_parent_name_gets_parent_name),
> +	KUNIT_CASE(of_clk_get_hw_maps_thru_nexus),
>  	{}
>  };
>
> diff --git a/drivers/clk/kunit_clk_parse_clkspec.dtso b/drivers/clk/kunit_clk_parse_clkspec.dtso
> index c93feb93e101..a4115216d2aa 100644
> --- a/drivers/clk/kunit_clk_parse_clkspec.dtso
> +++ b/drivers/clk/kunit_clk_parse_clkspec.dtso
> @@ -18,4 +18,14 @@ kunit-clock-consumer {
>  		clocks = <&kunit_clock_provider1 0>, <&kunit_clock_provider2 0>;
>  		clock-names = "first_clock", "second_clock";
>  	};
> +
> +	kunit_clock_nexus: kunit-clock-nexus {
> +		clocks = <&kunit_clock_provider2 0>;
> +		clock-map = <&kunit_clock_provider2 0>;
> +		#clock-cells = <0>;
> +
> +		kunit-clock-nexus-child {
> +			clocks = <&kunit_clock_nexus>;
> +		};
> +	};
>  };
> diff --git a/include/kunit/clk.h b/include/kunit/clk.h
> index f226044cc78d..ab24f7747516 100644
> --- a/include/kunit/clk.h
> +++ b/include/kunit/clk.h
> @@ -29,5 +29,7 @@ int of_clk_hw_register_kunit(struct kunit *test, struct device_node *node,
>  int of_clk_add_hw_provider_kunit(struct kunit *test, struct device_node *np,
>  				 struct clk_hw *(*get)(struct of_phandle_args *clkspec, void *data),
>  				 void *data);
> +struct device_node *of_find_node_by_name_kunit(struct kunit *test, struct device_node *from,
> +					       const char *name);
>
>  #endif
>
> --
> 2.54.0
>
