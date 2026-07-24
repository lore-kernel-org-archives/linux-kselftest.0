Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D037B011;
	Fri, 24 Jul 2026 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784916899; cv=fail; b=IQow19+LAhvZK/xI3soa+JhZ9xcPlsrpI/yyPkiLc3RShbXXmLS9BIGLIaL/uiKqrviDsDErpM1UbKJAL/mTgBkQjljGqcz12+/jQehgpnhUa+sOtvzLg5xVjdlbcQcdY81j+IRGJjY7fNOHItrfQNBK/4U2mV3K2thCn1TuyKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784916899; c=relaxed/simple;
	bh=oAx0EZ/ZWiAacCO2dqLtV67ChuCR14glA8CoWLyh9Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uw27N+tUfuHgOb5WxLUAjRIT3WMxiKm8jfBF2eTLozuHx/yOJ4Nkd6T0YQS7BFQsQTwIP8LHnvtI4qkydNLZA61NFSgWgF+F13A9erjGAm+go5V+COxpqtL2X9aQfv5RLMz36PBwyUttBQKCg1X+F2aZ+r0ktq3s9UKA38mqMBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gcWk6y7X reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gcWk6y7X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXhPhcIwPPpV+Bazein1QL6ksVGbhXbdbvLvKPfdRb2WlcQo8V2olXgTfOfAOfj29dgJfilc+G+fH3+ZCXcygP/O9sR176CSIKERpuCsK4SbcylM9j1DNnOU1srye0FQMeMn6lmK/QPMTwYsYxTYuK9I5MO7Yr1U35eoAZ0YaHyZM+D8RYWtmrLuRFWB9AQlEcpH7pYQK2suY2jd7ez0odmcSXy4SfzywlT1iROSE17GmD3/5s7zr52Qbr8F62IneUf+bPcOT1PXHN2OReLaqwNQ61fBR3EZjPcxFiuNZ5aLETzLiIrnQrHvcAOQNpd+PUKmjM2ZLD8rCsiry1nGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNBYQepuVvJnW51JbWASnXJ0Kn9EXTqWmqEH4lwZwAA=;
 b=BtAv71LuiXFFO0t5Lq2Y2EG/+++PQfQ1CcTtAmbD6k1enzk0T5cRxvX65XMVvF59CfVKGO8jn9KcfOASykljk3XBWPiLd6WaRtDfOdwpe8+m1iEDmvedxJFFWT1ddTCXcUStwgGRQaHZAKIGwA9Y+VK/UD6JDuV9ayQZuSm4gSy7IC/INLTsye9nJ6c0yL+KzzBNNKcl3s0YcDvFEFNjoX/KTcuN/qz8SkAb4gOme64kObExVQMJkHxrVQ6rQR5x/0aTJpYsGxo2LoU0uWilrdtnIKRJpDhm069Yyov4bleH6I5ZV7qaFU/BI4h0+D7ZWG+ZRJeP+gy/RAvJM99ACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNBYQepuVvJnW51JbWASnXJ0Kn9EXTqWmqEH4lwZwAA=;
 b=gcWk6y7XiBVrZ74NYtAhxjBCssLSo1w04NiQx11hXlTTnKScFxOhN9nQCoy4xWxbNp+Xl6DGrDmsu/gKVjnQIl1Oh9vGrJqJjha3aUS4THxmGZxWG4JHHcoKQOdEY0mwYE2Vn7iL05jaHCqh8blqJCRUkKIi8Eop8yueYWpc3aud/Aq+Bga+LuE1RSTDpYo+HRc7Ae27E866SQsq43FRwsEoy7ud6QV+kiSN1OyFR3HEozZC4bVrnjkx7fWLQ9ST8mrywVn3pxlbpLRTi0TDoJ0l/JgxEMYY2ElDi4OauJL7gf0iEOlH9Lr2k3oo54R9COSaZ6PEFcPUt5ZjY7xx8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB12003.eurprd04.prod.outlook.com (2603:10a6:20b:741::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 18:14:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:14:55 +0000
Date: Fri, 24 Jul 2026 14:14:47 -0400
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
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Introduce nexus nodes
Message-ID: <amOrl_Rp7-P7hAti@lizhi-Precision-Tower-5810>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-1-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-1-751547e160e5@bootlin.com>
X-ClientProxiedBy: SA9PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:806:21::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB12003:EE_
X-MS-Office365-Filtering-Correlation-Id: 94911162-afc1-490e-542c-08dee9af7671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|3023799007|10067099003|56012099006|4143699003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W7iivG9/FG1vIHFaiw7XIPeTOo7u48OwEyfSYwiArbWZvtuHKATXTxqd1P9/j0XxyCb0LOvziOfRtEp9bs38FbkkFLtUU+zwGOOeLcBTY+WWWcytrisgpokF6nUn+NiNoSiX9YniLdH5Ne0qczCUNeTNgiEfEMJl3WTXglq81zOgKs/N+mQ0bfze3ud+QF3rz/Ntk/r+yAF8R2Zjwi6l834/LYpAR9g5oSq/z7MYaaG2mXNBXg1fFNmlI8QRV+DOvL2Q6gmveqxs3tFEW3Ob1TJQPfoGhfeEyKneySH4T00u7YGw0Gg+I/tsDCmsj/Qu9bEtrNm3LjzuBVk2DC7NZ+zxXnhXHF3bSIZQErIeRL3cdjz+KWS6la+UnyX0d1+pDPbz6lK24N0KxgWonHayvsEj+5qQfC4oaJ3NkHYVYf6NZ02slZMuZQkY5XxiE0WtkFwGU4qQDzR/2PBUesx6NA8jQYOD+8/qP+uxkJ0KliB0tNme3H4gPUqhGzZ9Mg6yZ33l2mrBEiHRvT7sUtUPkOndzmV+aDheTHw/GSoL/ieIzbgMRNvjMdo+qw+qsRlybioErwtvA0NQdU2SeX1K6Nj0/MwA011XGbhUKmDXvVgDw7R1pD1aRtS0DWxmC1A2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(3023799007)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?J/944iyUZOH9/9biCBqR7VYRHw/i7LeuHKmlDa/r9hiw+pGmzF/X3hBuYd?=
 =?iso-8859-1?Q?BHuBb3FN2BLogmGBKSj+WDm/+YRBZx6BoKzwrknAqL414NCaoKpT/lcy6b?=
 =?iso-8859-1?Q?rESP+mEyGxnGFTfmT0maFYn1Z8r+NhIVappJzPvPzR+XjUXFhH+ZIWBhSe?=
 =?iso-8859-1?Q?nTO6StR3IYOTqhHa3f44gGSPxYHtjV6LN5G8zeQdPv+dO3GsstMNEljxDL?=
 =?iso-8859-1?Q?7G9lkutmEhHWSEbqJZaglVR21IxqYUNqujWjGJnnFWyR3+HUn/GD1Tac6t?=
 =?iso-8859-1?Q?NZvrYUD3BFVOBvXgjFUSCXUX7tEGJVWEM7G6AYn3CKRwbmhK2XwXL0ueT2?=
 =?iso-8859-1?Q?BIKQ/XJBhBZxjg74nZODAgxw3txDFYllDBgAodRebrTBnP9VhHL8e9ycnF?=
 =?iso-8859-1?Q?wvr5sYhIwJSMZfCbzt76m/5B6ByLLHMqMgf2FyeABfGT3fm25TbIezq/+H?=
 =?iso-8859-1?Q?9TRzGxfh9Nn10tv3TEsWct5yhf1Q3UOrJxOUd7aQADyuSazb/AdCMK3/Pt?=
 =?iso-8859-1?Q?VopAL/gLJN17VLZCxfGkywPl8nYOs1pKvD78N1TOsG4ZOLM56WLKGG0CAB?=
 =?iso-8859-1?Q?YZfd521E8B77HsB0uggPdWLw5yzxqHUkzx4vTBIl6lnpedNmfYwfoKriWC?=
 =?iso-8859-1?Q?VkprS0jvWt6/ADG+Ec57tqlRTcM2KjXwyFLeMSLQEoMczREAd/pkF9hZye?=
 =?iso-8859-1?Q?fHF04w6Ar37cNVwAj5pmcnQRwP286U0kB8KNwtKnSa7ldIC222ZmkNylDQ?=
 =?iso-8859-1?Q?gZq4ggu5BBoQLs2Xqmo3dIO0GZt0rr8xEppTJpNCtE0ovIrmpiCTgAt1je?=
 =?iso-8859-1?Q?7N1/zqdp4R6uTTmqA9yVnNmphqqVTP6VAiGfPfOn21BNWfUfvftfuWB7tH?=
 =?iso-8859-1?Q?bo8r7ix/A1vUHcc9G7PXHY1aFCqts39c5EOKEbcFAHZ9kAok0zq9GztXL/?=
 =?iso-8859-1?Q?qWURHrbUJs2klLhNvT6q8QRcyFj+0itW6F2kjkrFAoNFXpmlm/oSeSY1Rq?=
 =?iso-8859-1?Q?tPQ/udkr0M7cx6Qwgn7S7VH7vX4kUv4zmT0lvMMM7E9XWZsmkzV2pBPNrM?=
 =?iso-8859-1?Q?Pwj8b8STxlAoU6KOFFLb3gF8rgKgmHR5TUweXzNVYuTpgjK+n+IWA4JtMD?=
 =?iso-8859-1?Q?trxoQBkiRM8WCvl6xpEaJYReP8qc4TdFzTT2+sYjD90sVg8cr3l302EXJz?=
 =?iso-8859-1?Q?wr8wlm0qkdImRsvxUprojE/28bSjLe8pmGfsP8HyxWTiPHoonnEzDtjH5p?=
 =?iso-8859-1?Q?YNr3AlswVWXYiF9c3QtpL1BDLR/mxIAdIV4lntkO+FZKKvxNyEzwJJX8/Q?=
 =?iso-8859-1?Q?XLZ3FN3ho0aHEBGtsBrhlzEH/ouchRtZiQBvZ3DQ1eM/ObiiKIPTPp/p1G?=
 =?iso-8859-1?Q?QE0NADAxxXWGFXl6v5bLKESnrNw7HcN8JMqM+NISfiPlrYM50bqt7r2pL9?=
 =?iso-8859-1?Q?217gNIx0EgqGAjgdYvmgE0h5i1wArvO6F/aGuekGA2xQU5r3Ke2HPQvSmk?=
 =?iso-8859-1?Q?c9PirzJzT2fyMWHAurjbwTUU/STyBe2MVQYLWeDiGLYGSYYLJvpKBpcSa1?=
 =?iso-8859-1?Q?TSt5f94/QB5rvScxmthICE+vppUAXysHQgjJq2gKs/wmxnnrv/Qf9Q5S8l?=
 =?iso-8859-1?Q?DM/uiwR2Ae+Tb1E0YruCFGo0e0EHb0RSbPZSx+h8xQRzVBLU3YPUadLoPe?=
 =?iso-8859-1?Q?1mj7qvlzvykXOVq+TFGCoM515b8GK3N01pDvuQlk0YnnaOTNa+jZk6SZgm?=
 =?iso-8859-1?Q?szoFd6o2Jaf4k8i2FpL3xOB6qXCWeH8tiffVSFRe9MwUF0GAOYNgxosf98?=
 =?iso-8859-1?Q?Tsc/XxeA3avfa4+778N7Ol8OIcnf5ljdTYEYwf4ZjL6Q7N/eXnvo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94911162-afc1-490e-542c-08dee9af7671
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:14:55.1180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muIvrFtwJXy5nDgof4mkOIZ2BvhzrZhq4BgyENm2P/EjRpFQ6+yfr0129gN7IPgBuFsXo4DPdvqWAGW3SDneH4d6zsUDdw4zaqueLUoXKjAIl+LZXd7pfFdxQxM1tPO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12003

On Fri, Jul 17, 2026 at 05:59:17PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Hardware containers can just decouple external resources like clock
> without any more control. Nexus nodes already exist for PWM and GPIOs,
> add a binding to allow them for clocks as well.
>
> No examples are given, the file is litteraly a copy-paste from Hervé
> Codina's work on PWM Nexus nodes, hence we just point to the examples
> there which already illustrate very clearly the concept of the various
> properties.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/clock/clock-nexus-node.yaml           | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> new file mode 100644
> index 000000000000..ff3283bd5fb1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/clock-nexus-node.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock Nexus
> +
> +description: >
> +  A nexus node allows to remap a clock specifier list in a consumer node
> +  through a container or a connector node in a generic way. With this
> +  remapping, the consumer node needs to know only about the nexus
> +  node. Resources behind the nexus node are decoupled by the nexus node
> +  itself.
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +select: true
> +
> +properties:
> +  clock-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +
> +dependentRequired:
> +  clock-map: ['#clock-cells']
> +
> +additionalProperties: true
> +
> +# See the original pwm-nexus-node.yaml description for examples
>
> --
> 2.54.0
>
