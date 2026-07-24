Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199933BCD10;
	Fri, 24 Jul 2026 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917625; cv=fail; b=WE2G5IBIHoIeF0T31D9GVLrDANht7Yayz1v9tGlIXQQJafBHDJqKHQboJ67SFafIHtW9tl1Ox0mfNsoynFFUk+zW6H7nRGg2A7VImpYsRiWQ8qyQOpAf+dEZCLd1PkfvhWAjCAX6DLP+f0ieqLAsOH+w8HWsZeccwNvlrTP2O6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917625; c=relaxed/simple;
	bh=2RZTND7g/twQjZpDKHrdgf4fkX8pR733f7R6tFFLV/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VgYGLMpuDf1yQIRdenPZDqepuFJCA1+k9D8CEan2j9lJa87SoQvo2IDhVn494kkNgke1e8FOOkBhWBsxVszO0CAwyMhgjRTZXnmd4r5g9GbQctyB9uMcnB5k8HdwZSooHkHc1swUl/icoVtc6/SKSXdzUHXxJGx1kJw5BKJQo70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uFgHFW2k; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uFgHFW2k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKUn/G+LxWz6zvg6IsaXL19Gwd+g884CzeUWRKQkM80/A/jCe/2TiISv6szToG3BGDRvosMg1xEqsvfZ+CDYwymWWu4CF5fInphMdApXoif+LSoDy2muEb8SJ7IucXwpLTpmQHGxtEuP+R5l+LyEYNsOOKNhb489NRCEGmjoK1h45dC9cqxguTFGgkLrSOijUseCh3gXwc3w2RflCIikHNM3d8lBLzuGLBEn5/WRVZexgZ3uVaSuTV2hVflB9/RAk+Ed8NCYwjpWq69IjbIX4M8W//uWxGD81FHmqyHWcPHsNWBSc8m1+RTVh0Zcz5Zo+PT/++k+8v3PIE+XiQlkaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74kFEan0LCmoI8MBHR3rxCvRPXr7TSOJdhQvswzDSFE=;
 b=eA+vUebVJqhbvbfZ5fqubKuZ3rrRjATOWYi2ni7ww5uqjvlSkOknMODl4h/WKF9Hx9ArX2yYN3j+6RnKIzTo93LAo1AZ98CRQTBI28geQnwpimlSwmmYVnee/bwgkKiwMle9eEcf6ONNkAE1Xp7xZLnBP7JWcS/ZfIw3vm8y48722qLDLBXCBCuYPZ5LcfYfoUbppaE4Pe61K8YXISkZDaIpMjjFUzQk4BkCZN9VtxSCds+jDG78dW1vvZsZR1yf2oGzbWr2Xt4u98Kq7MkCVF8qDxyR6AgAC7vwgHJD4HioJaucbKGodowK6NpQAfYDBawrSrv9NfKupdnKuJ9sAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74kFEan0LCmoI8MBHR3rxCvRPXr7TSOJdhQvswzDSFE=;
 b=uFgHFW2koMyPzvFIAFKE2ddvFGTQSNDYxlaZ7m/+RWQdOB3SNSYLX103Gwu7VQ6X0kdf0ptQU/JsyLUgqFMwm2nr8lKupeZsoCbeLwhnCasijw9/59X6WxMu/JG1g5dmfHM8soxnOVk34WjRADChpLCqD2TUxBplY63hPKrdijOOGr9hY/qbZfa4DzaxCK7GmN3kFX1l/0uE5eDHJonEpe3I5wZ4HqiOueEBFZ4Zqyzmk6CJ0mxhrPhse7mWASDbT2+vgm2ib93eXW+uJmwX5e/cbuySdXVf7x6M3XOUnkrdNgFE6NNWSjy3uTLbqXayr84LC1Z9+FGo5OuFZwVeHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7895.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 18:27:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 18:27:00 +0000
Date: Fri, 24 Jul 2026 14:26:50 -0400
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
Subject: Re: [PATCH v4 0/7] clk: Add support for clock nexus
Message-ID: <amOuamq7CHo6xeCW@lizhi-Precision-Tower-5810>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
X-ClientProxiedBy: PH7PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:510:339::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 72abaa05-cb8c-42ef-85c5-08dee9b126e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|19092799006|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NeJBWUqeZgXmTqEw/rsqThx+E/PhTb2NMqiE5IF1LhDtvwOu15UKF5BBC6MYJqFEUwoE2AONidq/USdTPL2LTOCesFhBRZLNbtdH6Iqb13+jytXZtMGVNWL+z6ztYEBS06TBttmEYC8fR0hWT2kUjHsfDhSiTEMzOnM8ayQ/BOpuD07er7oXgDMXo5+xER2zNpl3QdJ/p5/kn4WzYVnWSMtQ2gAvUMOqQUH+rhzQEWLYRoYyvBChiKJsQ3/5D3qemhLqOjHIrQOaoJjAXr6ZIWoi9B6SRF/TOwYOGtf0zzGYv4O4cbAozv8OP+rFPRpNpkqN8/oW1UH/U1ABmRf91CtXULY2nHTAU8ihnwnpt3BXfLZGJ2xC80AbUtw+r81G5QNJ/OzGpGWS47ek8MgQGgTpf11DYAoiLK4n0qnRO/02bL7tsmFRxW2Ge7UqIjFphYZqbJ35rIlZjD5ud8YJLu4oeKKyibPEkJqnl63Sv4hV6U15Xz9Za0SfIuGDLLEoX+2L62PPX8+QBXjxC9Md5yv0NNv0CTp5dpDsbQnh01li3nBxGVUKk32kvi1de/Se3Ngu4SkMnw2qBQN6RWptWGTIcxvfY3Mq+3io7rXIa6EcHQw4FjWnTItiI1reDeEp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(19092799006)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u3/vgbX91S43UfJ7K/lIP4jkCUw1HEgCSXILhyuf4s0S/mjJIftrO/PjPyH/?=
 =?us-ascii?Q?/6BLZuxf5ZNpVSoYYBUyzrmnCarCZJAHbAvpGMK7BMdIlhfcJJbAqZ0V/3Co?=
 =?us-ascii?Q?knjrat7Uj5+S3ghKv13JplqrpadEutC3uOnG+MsNHGeQ7aw85L/2982tcHvq?=
 =?us-ascii?Q?NZ1vmBPv0VMQ60KweSGjUikWC3Mn5A2yFLJD37xkWm5AaBhKtM0G9AcxhS6G?=
 =?us-ascii?Q?Yrjq6+r3LBR1vsXlbjk8PhzNOln0vJ2urbT9ynojxp8lJN185znL3okU4Qgx?=
 =?us-ascii?Q?cnAmWGkKMnmpCevIrXf0dsk1ZiRbB26PnRpSDEyQri1ZcniiddYmuWLhEBkp?=
 =?us-ascii?Q?Lxt99XqXQvV2Zr/gJBrCiV42pwjmftqO0jHW+WAS2GRlg7T4Ns+loDduc2e+?=
 =?us-ascii?Q?PpMAyFtAKgTrxXVi0iv4dlzqpXR55/bKm7JOyWd1osZVoodTjxfLRINaVz8T?=
 =?us-ascii?Q?AAqrIBZtCeDedPhHyXbG1gE/nMAFtLyIExLQl7KisltfC/CDDot0aJZ2qlI8?=
 =?us-ascii?Q?mtc6NhVpHMDMijS4LKe0oviBS2Wv7ll6JbHpbirhAkOXhN9wQr2vJ8Ii4Ejb?=
 =?us-ascii?Q?ZUYyFAyAB9Y0fcI56zHLbG1Zr4FtPvVFTOdP6Pq2iQoPr0hYagzDJAQrJJpd?=
 =?us-ascii?Q?2T/R5ruwVu5PAUQGjZieByLgK/TqXltQ7nYlF6DHeqAgW2eqhtUHZFqfbXZa?=
 =?us-ascii?Q?bbcSf0CjV8pLITubUwaIjua8s1sUeGzD4cw4ISYWo4BozsoNRS+CO5lXaILl?=
 =?us-ascii?Q?9Fa03R/fs68ZSz83L6cyqHCVZakWGtTjuKojSVeeQ10hVPqu4rAClexZ1OPs?=
 =?us-ascii?Q?oPIjU+A6V3wilkZecchCo3lXOeqsKhA0l01mpcaNaEIUHe/6uTXEz0SR6ag9?=
 =?us-ascii?Q?uke3ulCDQbNrlHF9Gl6qNnoJ5SLscnPFOLl0C5bonRMLhTFAn9vwdQn2uLOY?=
 =?us-ascii?Q?+AQp8mWu57JeH1AV2liWwxq48MeyVQu7imbAgyUBOtJECn3pA5S2WhVlUWXO?=
 =?us-ascii?Q?V16kaBL6coD3qaUN5iIj9RIN5Vrb2KOrhZ+HdhDOn6utjH/nA5d0rP7tOa/O?=
 =?us-ascii?Q?1HESHyCZmaFs/UJQAIkNYUy5HVnQPyqvU4gMXCmUBIde2Pntl5vVrhce86RL?=
 =?us-ascii?Q?e4U7NHcfKC0XFMNw9cZV6rGaUcfK4KK6dvZsqc/8vPyQExw/Cw2iBLWpArzv?=
 =?us-ascii?Q?dipdbbcdp9stc04rvDeLNNE0K6CMysjdcTTW2K8Tsqa1yCUQ0nnSClJavW1D?=
 =?us-ascii?Q?9NnAWXocm0EmxRCAgJIoRWUVekpQvXxZVFN9oQv+J3M6NFJ7cpEPakNv5Qv0?=
 =?us-ascii?Q?x57DFYxrJtbRSPFbPmI2jtFOWOyHnUBxRtJZOVPguW2Xw6wvWiSFk3Rkq323?=
 =?us-ascii?Q?Yen1Nq281mrMGhLjbCs68992gu+KtxdBnSz9fzSvvnAt5A+T/nJnedpWQvly?=
 =?us-ascii?Q?XnTgUsxS5gsjwd92KZfe2H49f4lVEP9oqcKFjk6o89jUccjtpKsO35rkg4WG?=
 =?us-ascii?Q?N9PDoIFY5zDnhPknOqikNMcjC0KRUdV0r8Rog1X5UZirZLaZ1Xuvq58YAEjP?=
 =?us-ascii?Q?/ZSEfrHHwi7EYV7Bbh1IdZIZGm7GzRj6NqkR+MQqsB421YnbQ0D8tkbMgXBm?=
 =?us-ascii?Q?V7tU/eV+grxtlej78DWWocLlkNYt7FQ/QxkJByTb7YUF1P5nTrKv8tTD/fQ0?=
 =?us-ascii?Q?jdmalPVfsy+ushyXFwfQyzQNuF5G9w4B8nFu8yZlHb9Yb03x4esbeack0FJD?=
 =?us-ascii?Q?zOc/D10mY3WBuKmAKbEQShe6eEItcn4P9521rJDpLxyKEeUorScK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72abaa05-cb8c-42ef-85c5-08dee9b126e9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 18:27:00.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhurlw6IluBFnfcTPoWWMqCBF344IGq/1nv38HVAR9WvSjDuMk1BZYXFNwj2ZIh2EwUWi0rtiWNQxLW3aT2ZfVhETf/TbDxQo/4R5/HttfliPR9MLetWWbYIbmNM+LEk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7895

On Fri, Jul 17, 2026 at 05:59:16PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Adding support for clock nexus had some prerequisites requested by
> Stephen, such as adding new selftests, the initial discussions come
> from:

Please add me to CC list at the next version. we are waiting for this patch
set.

Frank

>
> Link: https://lore.kernel.org/linux-clk/20260129201003.288605-1-miquel.raynal@bootlin.com/
>
> Changes in v4:
> - Fixed the kernel doc of of_find_node_by_name_kunit() which was lacking
>   the fact that it could return NULL upon lookup failure. Also improved
>   the commit message by mentioning the addition of that helper.
> - All other Sashiko reports have either been disregarded because they
>   were way too unrelated or just not relevant enough in my opinion.
> - Link to v3: https://lore.kernel.org/r/20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com
>
> Changes in v3:
> - Prevent out-of-bounds clock-ranges fallback in of_parse_clkspec()
> - tests: Check of_clk_add_hw_provider_kunit() return value and fix node
>   ref leaks
> - Link to v2: https://lore.kernel.org/r/20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com
>
> Changes in v2:
> - Collected tags.
> - Rebased on top of v7.2-rc1
> - Exported (test) clock symbols using the _IF_KUNIT() variant, and
>   imported the NS in the test file.
> - Fixed a leaking node reported by Brian in the tests. Also used
>   existing helpers to simplify the test implementation as he wisely
>   suggested.
> - Reworded the nexus node binding description as suggested by Stephen.
> - Dropped redundant and non restraining properties from the Nexus
>   node as suggested by Rob.
> - Assigned clock/clock-rate properties now traverse Nexus nodes.
> - Rename helpers following Stephen proposals.
> - Rework tests following Stephen hints.
> - Link to v1: https://lore.kernel.org/r/20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
> Miquel Raynal (Schneider Electric) (7):
>       dt-bindings: clock: Introduce nexus nodes
>       clk: tests: Add clk_parse_clkspec() Kunit testing
>       clk: tests: Add Kunit testing for of_clk_get_parent_name()
>       clk: Improve a couple of comments
>       clk: Use the generic OF phandle parsing in only one place
>       clk: Add support for clock nexus dt bindings
>       clk: tests: Add Kunit testing for nexus nodes
>
>  .../bindings/clock/clock-nexus-node.yaml           |  30 +++++
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-conf.c                             |  12 +-
>  drivers/clk/clk.c                                  |  15 ++-
>  drivers/clk/clk_kunit_helpers.c                    |  31 +++++
>  drivers/clk/clk_test.c                             | 139 +++++++++++++++++++++
>  drivers/clk/kunit_clk_parse_clkspec.dtso           |  31 +++++
>  include/kunit/clk.h                                |   2 +
>  8 files changed, 249 insertions(+), 12 deletions(-)
> ---
> base-commit: 7f26e010764df304602f33912a0550dcf46e72c2
> change-id: 20260710-schneider-v7-2-rc1-eip201-upstream-a470e5eab92d
>
> Best regards,
> --
> Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
>
