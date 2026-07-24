Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F936F428;
	Fri, 24 Jul 2026 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917008; cv=fail; b=oFtQG6lHmFKHSdw0iSqFI74E1qFWEs6TNQAIuhsf/5ZnUbQ816p+Z02jGAz8thFHK5z/m0J0VEeDaAq+GImoQdfLR4FxHr24mYZ7jaO9+WaUZVLgs0+pwXvuAUg3JoO3+NEaa1AEs0kv2FbOgIXb+mlExCu0pIH0rb1Nx5QtSm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917008; c=relaxed/simple;
	bh=XyipHKtgg/37XH/r0WsBeTxr/56owT0wrHV+3dXdx20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rhZkSITEwIlRWd+Tt2l0016jYN2ZdI9Svll/1XuFP0utE0sATRTexL0s8fKWwUxosgbLMi/A39Uo66yZGT9BNf0KeDaMu6/IUQyUlvRc5eohcr6QWa4SND7g1vtiT1a7jxRmWsEBv6KW/unqa16mXsvnejbwwEGH0ROhYKmDYWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=N/aNM+O2; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N/aNM+O2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bo5gngEnsJdLJt5rTlT4yIpG+bJBhkO+yw4sniH0P+JQIpNENasXqWiiTcJzrjc0vRS4uOaWXn66azLNvoww7WiL0A64BAHhAAs3sdi+YagDq3F6n905TH4J/YK8te26J/2vLleIISW9xWH9zkXDjHTuaANlUaveMRWoYMyt9O7evJdtQE/deFnOObQWSm9l3CMwfRegvRLYO1srS1vSlQQHYIxwMVX02WFkbWmO4+1S+1GzSiC72+Y5Nqo7E7IFmttmYSCuGjjOMUuhi5vEumhMJbvjzGsMF5dXVpw+FdUI3vym7uP+U/gsAVcQGr0j39CYIU756aX9xRXzaB0SUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kJCeYzirdtq3lSIZwldWhjJj14NUyMZM/AW7lN+3T8=;
 b=Iw3qooccDcAYq6Bt+89mwzv6mJH9GT5Tz6Qd+ObIPI1M7NuTcLPgthyGI7SdC3w4aOTF76fQmhIuxOOjofJttUdgy4vA6Vqdh+8cAfCwjNqAR/ITCvDHKRedBDhKAP4hC/rrBEcBtuMQp7S0PkZlVeN3JhncdQiJy3wcb6iqrBoNBPVuIbtAoEwVAf6TqXkKQBdiRu41uJbMwCVIj20+SX7Ke/lojhxaYqK+5pzuMz0IGQ8Fj3K+tvlYrGuuWlj7zV42Y3q9nx3nAjMjjSLdWZZa1v4aGZS7BLIJH4HUCfd7KpcSkYFNZBNtllUOMYQQIz3LMWFTKIvDF+lkw2bxaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kJCeYzirdtq3lSIZwldWhjJj14NUyMZM/AW7lN+3T8=;
 b=N/aNM+O2OdnUj+qCC6NkEqyxkLTqMeukdfZJh7MxG9Geqot8qMBzIrZNzPhdkAFTEMVBsRMCYbrYRjgIREQRFcUQHDP71cEgChe9mcspXysDOHU4i2ZmMFHofm4OyXkd2vDb4kBVVwlzfTRIF8uupEcrmdZDgm0r7e8wcvNxJ2FrkzKJvP/t/FhwlrTq6CMLfBgSv2yap6KL7dGiPmkXp5c0QBkFQHfV6T9ttZiUb4Mt1sW13oDDUcMu6LGRrEYQ9H/Dn0Ben6rNHibEeIfS+uwGwEgC9vGC1P8MPVyehTWeAI3Ieb0PsweE2gJIt5yhNOWgWQdQ+Sln9P33MOQuIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8162.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 18:16:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:16:43 +0000
Date: Fri, 24 Jul 2026 14:16:33 -0400
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
Subject: Re: [PATCH v4 2/7] clk: tests: Add clk_parse_clkspec() Kunit testing
Message-ID: <amOsAUZN2iP7DYbB@lizhi-Precision-Tower-5810>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-2-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-2-751547e160e5@bootlin.com>
X-ClientProxiedBy: PH0PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:5::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d376ab-9bd7-40f6-9857-08dee9afb6ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fTVFQeezWJrd6kiuFoU04QPoij829s1gn0hv3wabn7KXTyj7DSmWp9tABRX/sTSopQE+49Xx1B3dXDE9kgr18XtmPnE2/N+2lhUJyoYXDECYNu+t3RcHQ7eF63PxZ3XB9cj0T5/PzutB2H7FXE3nSJSOt469wpF31hiwGqkW9n9tXZ4Anw0Q4gbuytQnXL5iKWvKBb5w0uV3UmEb5LQ9UimycVtVyTY/1olQ4HHDORNUJ1DaW7g/rsohXjiiEMJxVw6jv8pvGKrFFGy0u5IsCCUOtKdNPQaL97DIDEyFYjD4zELg0NohGb6c03KnXmwCq8tT1GCfHCt5AM6SrihcF+HbxZiJGWzoywtwOx4+yJO6KjWPk+YQcdC3ENoqz34Ts8FqA8vtmC+YVAiIrdRyDNDzOEZrilP+RXJKX+fIIujr0T89vn0MlmV/h/CRsK37LkSotaL4hvPyHVade+MDvR7LFRcEg/6GjVGm1IOkc2eK2htrwvyqawK4fGqMBOYdkjmH3HWe6yBtJOJ8jQ0JcGpJYq2SYV1pslIwMNzDC/JOyDKf4hb00Fp+qMhkJdlJGr6hwuccbEv4nsYhkdw4dII8t19SCEwaLF+izdR/p5JYViiluiw39tB9BC8BuFP7Mq+EvpvZyZso7UBT1Qz+tUYDkPLEVam4nYYAOPfBgD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NrCNCHom7plU4jyp5kPFY0259nWcjZ3kDRvT52JEuQVej5MjsLAHZH+65O4S?=
 =?us-ascii?Q?0nnUy09D25RlJRWQm5WlRQiZjJuglvf9WL4GUdZRz/lOXy6kqfu2y0XKGmYz?=
 =?us-ascii?Q?m36+ZMdFvdw9BId+X4+aktPYAZzJEgw2autD8WCS5BhSu0i97nFphsacY00L?=
 =?us-ascii?Q?IeBJZaKIkg58DX0kSmzNL4tjRI9uW/QAg3mb/j0T20Lti6Fwo9Ukka4npGc1?=
 =?us-ascii?Q?yzswQuLOJq4ankSlgZS2aL3wdfUaJB0nXYnaT13q2OUTG6k9aDfnApg783Rv?=
 =?us-ascii?Q?ObDlCdo3SLHfH3ihxeLVVgVMcR2exbOV23TZkwFwHjmMb73CrS43LV5QzVHC?=
 =?us-ascii?Q?RtWf2/DWUwTDBe16VxP/9P91LLHRQewmFBNBJ9JwnGL0VghMq1j3DVYYAK8O?=
 =?us-ascii?Q?GWII4BhV7k9JkywAqtIqAQm/VeNhHAo5szqkDvbgJ1Kw+K+H3MFv0/vkS6q/?=
 =?us-ascii?Q?t9YS51J0ShnkoHuIwXY05Hs4k0TIlZ48+jA2xfO4jTCtYQnmzUevRxB22iuV?=
 =?us-ascii?Q?ZGuh4MuLPEmU7OmCDdj0RVjHlhGHmtO5UZe3xookTt7pLeXc8NjBqvOXgqQ/?=
 =?us-ascii?Q?HwrixI5xT83mt2IN3s31U6z8F0XYFWzGs2TWNs293SlCce5ZZUfIXHwRGlnq?=
 =?us-ascii?Q?FKsdnrDg38Np6n1mH4rKoc4T1VppSnlnFOhwHLM23OfP03hMLO/QUzLem+9l?=
 =?us-ascii?Q?6Nc3iaB0eiONI6ebct3AyeJXz6xmY1BN7NwnEcEd9oGWIygz78Bokt0DPWeK?=
 =?us-ascii?Q?Amv/5VYuvSE0/SA3PenceuZGEbceIaahTWnREFI1NSSeFxQ/J+s+TccVcB8j?=
 =?us-ascii?Q?QnQcZzMAayHuqQM05K7j+aW565NKFC303smfEjYw7oIf9M2vBTM6MLx+8Tlb?=
 =?us-ascii?Q?vfEwzk6Wej9mM2oKyF7IKvi1SBopxjWz2c0HKIyidkpZwYCoh5c7p6qnx0rS?=
 =?us-ascii?Q?XjetO8Si5/QqovaIx8HpmA4j7aW0DKKavNOzW2UNLErdTvW9EK/mMULWU3Yx?=
 =?us-ascii?Q?8+wnUhMYTJ2PfRMkhcGJ1ylYP4WjPYMfQdm+io6BGjNhDH/GU87WQ84fxOk3?=
 =?us-ascii?Q?EIYJ1yROsWUKbytAr1ATBOX/zBc8EVTOODYfMFUbtsNQYYKa7TWH2bN5OM0c?=
 =?us-ascii?Q?ZaXZZevZ16S95r0JgFq37gqEXKCmofOIuCHhdcUzhaT8JBwlxtGIBCbyT8CQ?=
 =?us-ascii?Q?a6hzkqubEtxLTYEK3RaDsW1c1qTQcTmQa3rqgVfW+gln2GpByfnwWSrKmcYY?=
 =?us-ascii?Q?i1JBjx5wLEtDuHJtWfdjaSsQ3Kjo5b2417jv6Bc75bNG0yxwGzOdoRtNE+CX?=
 =?us-ascii?Q?cXyAscSXE+ottWDHZqejrWTDEN3xwn1ztA3Kn1sG2LyhVVkC+SGIyOzulz88?=
 =?us-ascii?Q?bwVgsvdbneZnmTuTh59sFvyS2X/tklYWfuZdVbIW4OS6Za4FuGtFDDEEDRYQ?=
 =?us-ascii?Q?EKbe8doHtX4jv2ehrPCBBAlzUQaOfJRjLvIjgEvamo3iLwxBLu/IvuS37P8R?=
 =?us-ascii?Q?oBTsenFsQa0dHBI2+XXQ2y/OJUtKn/7MvzANDGsuDquJ9j/84lHd5ifeSFpr?=
 =?us-ascii?Q?qsnAGPOFUMru5Ogx0S4O5hlE0AFV2MNCROj40fjoAhMZZBqZowSD53V5isyv?=
 =?us-ascii?Q?VLYrbffXXfBLRAg5PNm9JxY/rxA0Ltt8j1D+34otaZSrY1Hr1IZsmNngy/Zs?=
 =?us-ascii?Q?OGhx8jJ3318ZEQc4c6nXicrfe423VUii4UEoKlJOSFLrnWTJIeKz4jfWQgM5?=
 =?us-ascii?Q?+7xUDaH8PlG7QkRPfndjh2YxJNfSMOp9M9lk/QOMNALdqOboJQ4S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d376ab-9bd7-40f6-9857-08dee9afb6ec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:16:43.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Znb08pqb1QncpD8QwF2xToUhI9D4ABeYe+i7I0JojqRGvkLGEt0tZezhnf9lQCsRyM0nahX10AeO+1h1u88zDf44iDCHH73ReBV3KrmIs+59kCnfgKNxeJ+KW6HLnLZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8162

On Fri, Jul 17, 2026 at 05:59:18PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Create a new set of kunit tests to make sure clk_parse_clkspec() is
> working as expected. We currently verify if we get a proper device when
> using indexes and names. If we make an out of bounds request we expect
> an error.
>
> For testing purposes, we must ensure of_clk_get_hw()'s symbol is
> exported.
>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/Makefile                     |   1 +
>  drivers/clk/clk.c                        |   2 +
>  drivers/clk/clk_test.c                   | 110 +++++++++++++++++++++++++++++++
>  drivers/clk/kunit_clk_parse_clkspec.dtso |  21 ++++++
>  4 files changed, 134 insertions(+)
>
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..035b984db70d 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -19,6 +19,7 @@ clk-test-y			:= clk_test.o \
>  				   kunit_clk_assigned_rates_zero.dtbo.o \
>  				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
>  				   kunit_clk_hw_get_dev_of_node.dtbo.o \
> +				   kunit_clk_parse_clkspec.dtbo.o \
>  				   kunit_clk_parent_data_test.dtbo.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d..08874cf9b561 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -24,6 +24,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
>  #include <linux/stringhash.h>
> +#include <kunit/visibility.h>
>
>  #include "clk.h"
>
> @@ -5300,6 +5301,7 @@ struct clk_hw *of_clk_get_hw(struct device_node *np, int index,
>
>  	return hw;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(of_clk_get_hw);
>
>  static struct clk *__of_clk_get(struct device_node *np,
>  				int index, const char *dev_id,
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index b1961daac5e2..f47f81b7d72a 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3541,10 +3541,119 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
>  	.test_cases = clk_hw_get_dev_of_node_test_cases,
>  };
>
> +static const struct clk_init_data clk_parse_clkspec_1_init_data = {
> +	.name = "clk_parse_clkspec_1",
> +	.ops = &empty_clk_ops,
> +};
> +
> +static const struct clk_init_data clk_parse_clkspec_2_init_data = {
> +	.name = "clk_parse_clkspec_2",
> +	.ops = &empty_clk_ops,
> +};
> +
> +struct clk_parse_clkspec_ctx {
> +	struct device_node *cons_np;
> +};
> +
> +static int clk_parse_clkspec_init(struct kunit *test)
> +{
> +	struct device_node *prov1_np, *prov2_np;
> +	struct clk_parse_clkspec_ctx *ctx;
> +	struct clk_hw *hw1, *hw2;
> +
> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +	test->priv = ctx;
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_overlay_apply_kunit(test, kunit_clk_parse_clkspec));
> +
> +	/* Register provider 1 */
> +	hw1 = kunit_kzalloc(test, sizeof(*hw1), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw1);
> +	hw1->init = &clk_parse_clkspec_1_init_data;
> +
> +	prov1_np = of_find_compatible_node(NULL, NULL, "test,clock-provider1");
> +	KUNIT_ASSERT_NOT_NULL(test, prov1_np);
> +	of_node_put_kunit(test, prov1_np);
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, prov1_np, hw1));
> +	KUNIT_ASSERT_EQ(test, 0, of_clk_add_hw_provider_kunit(test, prov1_np, of_clk_hw_simple_get, hw1));
> +
> +	/* Register provider 2 */
> +	hw2 = kunit_kzalloc(test, sizeof(*hw2), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw2);
> +	hw2->init = &clk_parse_clkspec_2_init_data;
> +
> +	prov2_np = of_find_compatible_node(NULL, NULL, "test,clock-provider2");
> +	KUNIT_ASSERT_NOT_NULL(test, prov2_np);
> +	of_node_put_kunit(test, prov2_np);
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, prov2_np, hw2));
> +	KUNIT_ASSERT_EQ(test, 0, of_clk_add_hw_provider_kunit(test, prov2_np, of_clk_hw_simple_get, hw2));
> +
> +	ctx->cons_np = of_find_compatible_node(NULL, NULL, "test,clock-consumer");
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->cons_np);
> +	of_node_put_kunit(test, ctx->cons_np);
> +
> +	return 0;
> +}
> +
> +/* Test DT phandle lookups using correct index or name succeed */
> +static void clk_parse_clkspec_with_correct_index_and_name(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx = test->priv;
> +	struct clk_hw *hw1, *hw2, *hw3, *hw4;
> +
> +	/* Get clocks by index */
> +	hw1 = of_clk_get_hw(ctx->cons_np, 0, NULL);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw1);
> +
> +	hw2 = of_clk_get_hw(ctx->cons_np, 1, NULL);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw2);
> +	KUNIT_EXPECT_PTR_NE(test, hw1, hw2);
> +
> +	/* Get clocks by name */
> +	hw3 = of_clk_get_hw(ctx->cons_np, 0, "first_clock");
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw3);
> +	KUNIT_EXPECT_PTR_EQ(test, hw1, hw3);
> +
> +	hw4 = of_clk_get_hw(ctx->cons_np, 0, "second_clock");
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw4);
> +	KUNIT_EXPECT_PTR_EQ(test, hw2, hw4);
> +}
> +
> +/* Test DT phandle lookups using wrong index or name fail */
> +static void clk_parse_clkspec_with_incorrect_index_and_name(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx = test->priv;
> +	struct clk_hw *hw;
> +
> +	/* Get clock by index */
> +	hw = of_clk_get_hw(ctx->cons_np, 2, NULL);
> +	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
> +
> +	/* Get clock by name */
> +	hw = of_clk_get_hw(ctx->cons_np, 0, "third_clock");
> +	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
> +}
> +
> +static struct kunit_case clk_parse_clkspec_test_cases[] = {
> +	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
> +	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
> +	{}
> +};
> +
> +/* Test suite to verify clk_parse_clkspec() */
> +static struct kunit_suite clk_parse_clkspec_test_suite = {
> +	.name = "clk_parse_clkspec",
> +	.init = clk_parse_clkspec_init,
> +	.test_cases = clk_parse_clkspec_test_cases,
> +};
>
>  kunit_test_suites(
>  	&clk_assigned_rates_suite,
>  	&clk_hw_get_dev_of_node_test_suite,
> +	&clk_parse_clkspec_test_suite,
>  	&clk_leaf_mux_set_rate_parent_test_suite,
>  	&clk_test_suite,
>  	&clk_multiple_parents_mux_test_suite,
> @@ -3562,4 +3671,5 @@ kunit_test_suites(
>  	&clk_uncached_test_suite,
>  );
>  MODULE_DESCRIPTION("Kunit tests for clk framework");
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/kunit_clk_parse_clkspec.dtso b/drivers/clk/kunit_clk_parse_clkspec.dtso
> new file mode 100644
> index 000000000000..c93feb93e101
> --- /dev/null
> +++ b/drivers/clk/kunit_clk_parse_clkspec.dtso
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	kunit_clock_provider1: kunit-clock-provider1 {
> +		compatible = "test,clock-provider1";
> +		#clock-cells = <1>;
> +	};
> +
> +	kunit_clock_provider2: kunit-clock-provider2 {
> +		compatible = "test,clock-provider2";
> +		#clock-cells = <1>;
> +	};
> +
> +	kunit-clock-consumer {
> +		compatible = "test,clock-consumer";
> +		clocks = <&kunit_clock_provider1 0>, <&kunit_clock_provider2 0>;
> +		clock-names = "first_clock", "second_clock";
> +	};
> +};
>
> --
> 2.54.0
>
