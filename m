Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E14385D98;
	Fri,  7 Aug 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119751; cv=fail; b=WXqZl+bKzbICiRgjOQ+OCmWXxyozzbBmRQAsud3zigFXGVtVctgiHfMFZJ/YntnSC/9NZ7F3nI8F9yrgy60wt+k4im8q5CfGj30LnC9AKFz7ahrazC8vCqaqv1F3YrEP382rTUDSCCpfgLvBgH7Grw7BiOFU4OmvNAGZUfND6VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119751; c=relaxed/simple;
	bh=jUe7w44IINHYYLQ7wS50ShVsQMEQfDvf3iaCEr9BjQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s94xQUtK7IoGDaOpZriwNQiwxVwLr3ykkshkzmfpivxyFZd005Cv1eqwEJHkeEJsW0fl4jxp8JOC2i8Q6w5Y6Z6xhAy4H37HFNWdIPAg7WqM++MCg7rT9GqwjS4Ndqt56N3Sx4IEfkRzqjbiLuVfJnEe8DsYUWaROAu6FNIfRAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZBYmsxKD; arc=fail smtp.client-ip=40.93.196.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZBYmsxKD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rh5o3L9+AL/voQ8pXlIPDY7dCQ+bs8Q71YaO/9ifwbyLevKV82ZUHio7o74HiG5diXPVICjnTtGwktpeMwEa+znKjJZTGHOVXMRFPDzaaeNilWAnnPJ1cCPFORuRLShLgb0O4V6OUt7IdPSKTYdGoHIu26ye781aK5DNB5GBwzQuvJRorTRZR1oAmTZz4ALkIzmA9bJ12U4f0qk/95Ge/xvXVftSjImKF5G4gh/Ig/8YMup3bg3Yk9ZXyM78Vv/OTvtuWZkwsU41IEyRo4QcnV+Ss17xb56vLS1OrjI79p6oK/MBDC1E8HCt/9MK/7TtzqZK/EdIjW6BaRYLLWMTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLZ7njFNO4tDiaKVardgmTXrg9XHL6OJHBAvvIDxJbc=;
 b=BdHKamfKqKwU9A9FUBQ4YJug7/JL6ZFBBFo1Jv8jNEoVYgHHs/AbAQ0GMcyvHU43s8AEtylQm4gKvrosfwAdksX4z9Vs7XZGoOoVLDhH9Q/VRZS7ihGx5Ni2HTapWwmIb2JPvixfpgbI9B+2vtjTXtQ/9c+06D5qX3SCmX5NnzSMOZ7V7L1H5SK7LYUXc6E5j3SI41szvzLTvGjO6M0ZR5rVfU85so74GxlobzbrSiWBoOlUDHd7442qKDPwcInqYCpzhajdh9CDSlai5pEvUm7tO7jkhV7VKi17WD0G/ATt9toyOc5mQsjdjNN4Sp9Tc4oYnRJIieGbB2LD2le2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLZ7njFNO4tDiaKVardgmTXrg9XHL6OJHBAvvIDxJbc=;
 b=ZBYmsxKDZxNF14/vNWYQwWwsYCGqsZl/4JV+DzsNILH8Upfc1gawsB0SFjewuOO0fNPWKENiwgjTXEVGlONy+1SsSPeH5K3LxBRVVeq4xzil1+GkY1x3c2SIik6PgxmVZ6BvfCWyUL3L2XsxfRPmLZQ0885Hv1gWIWIthEfN2r/gHhpvpfeF1ziNpbXapzEkkdtDZKogA5B0lx+zRUsJlDjP2rgnKRPoVhYAhncw2NhOvuXIR19l8ZvWeoyFBfi5OI+y2JcTop1MAwvC4KDAkojrEx9rAkwo7dooht/4yqjy2eBLpCg3vtm98C/Aclp8KZ5rc8dCHBRj7nD8o2SA6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.23; Fri, 7 Aug 2026 16:22:25 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 16:22:25 +0000
Date: Fri, 7 Aug 2026 19:22:16 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>, Nimrod Oren <noren@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 02/10] ipv6: propagate the route deletion
 reason to fib6_del_route()
Message-ID: <20260807162216.GC2186508@shredder>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
 <20260804014714.4362-3-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804014714.4362-3-sigefriedhyy@gmail.com>
X-ClientProxiedBy: TLZP290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::14) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c37ac7-7cf2-467a-bdd3-08def4a010dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hpu5keSiV/myj6e/4CkYV8x5LYNHBa1joGoTbOEpvVzMkD3mJ8kh3PT/91vd7p1ZSDS7hOB5O6El0SEoVbWpzytbN5/7x8AaMXjHVxAkGLPwrZTLO9nN2Y4e15aT/OGpqopCcsozdrXMWPrNoEdECepsrrfahcf+2sdXCHl3lVCu8xjDPotLMavHQW/h6yIuGjPmd+1KNlfHzC2zAF8if+HtwyRVyrpciPndRcisyGTv+5FKr6zeFaqmM7r3P99B32XSNdUWtmevLuMmG+ZYNddl+K2Y3ymReYcO2drfA7UAEVGyfkC47O3q0hBXPKnStniX9104BZ+JAzFoxOi/1L+hHoSE9DkTbBczqmFWN9hLlvPuHYiezeM5ebCvVYjmTz34EJrsKUlI5G0xcIrkKNb6YHeiVPEguBBgvEzUUuZsf6SdmuJ4kti+H8yieXp42GAYVvzfRVY8nkO29aNE+2miEzcfNJT1s3M13tvyVYut6yyMj3hDCM1WBgdti0EqRT8Zrc3JfQT1zfeEV2AMF81vrf8goLhIMiWgW54Oan9FT2LgW2PlsWKqAdrqMbQXXFumKN/L3SJu76cAj1PL45HxO2fDJx1A8ne3JvqpvsT926LK9mK7FCnKhJYgvveUwmfVF0WFdCCgdZAWwgu/BZxiuBmoTsGvf3j9ivqNCmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tHXOfaLDorulTjYFXoJZBSYVmgiEWcVAwr7o/fmqXl6q4VBUQXbWbPLdxlxO?=
 =?us-ascii?Q?HWVzgcht4r2xitprzu9SzAcgdEuoL++rQk9YvR+sEECl+83Rjis5z4tu74Ht?=
 =?us-ascii?Q?RLBDwc+811+qNhpxn3RraonwgQ9Pl2dWn0uqh9DwwRB211m27BSiO2ly3s+A?=
 =?us-ascii?Q?7FrseB3QuD5OpHD/JxxNiNVkdeNwA+rvYx0Radu7q9O1yE9yx+kPory4CjZB?=
 =?us-ascii?Q?ee9ln/7YL0SUlf8wenzBzPYk27oH5QeA43+5Uniq0017q1n7/6LHsxzU5qDK?=
 =?us-ascii?Q?HYsYvz21eKPfoBrSbQq2gF5wCzkD3eQc5fiN9d9rMrmoxoxg8gHA7AlpQLln?=
 =?us-ascii?Q?zgpmZXasyUvGKJs4x9fqWjdoyKhHzcaaiI46Bj9XOlVjJRsC8WkLuod4hB3l?=
 =?us-ascii?Q?6GkqGzWH7LIDwwyX/5NaKrnPsI3biCUIGAfiqB2T/I9izSgW1NoDq39QUZhQ?=
 =?us-ascii?Q?GMmaKYZ7wnXmHt1R+Mf7qlTcT0KvD84ONEz5vfNzvXHvwYIf8DiYcJaUKV3N?=
 =?us-ascii?Q?PrBG+QEvpE+Ou9cJyssnNWBjxHQ4OxPfwOwW+gmBjG943MCwd/htJ1TMreQS?=
 =?us-ascii?Q?Gjbi9BJ7UzOOnCaKqoDO/Z1hnefBf35P60WrkaQ5ql0KaC2eaGksP36aZEs3?=
 =?us-ascii?Q?q+vjyhxDSbNQJnOVsdMkcLzXVieC+Rb5LxSe7gTiMF0AmXOoh0AsJoHseC1L?=
 =?us-ascii?Q?Be1jQXdIIzDhPSP7t9fOO5t5sTu5ALAiuQmyd7Lx6wGknJEvxFL6KOo9pPft?=
 =?us-ascii?Q?rt6cVx2XKQxERB6oxlYj0EV/GyCLhsvijxpJgAeo+Gbskub+wU/AaBZh0X1t?=
 =?us-ascii?Q?y7synY/E+j6WxAEX/B/XP+HPACJqQjq4/WTZkp8UUDt+d8CAevQ1BGiqZ7hv?=
 =?us-ascii?Q?XXRuNssGYg0NXsDmjJR9ff6Zekph+zhlK2nO58Y2NLZhbrcY6amFL9WSdxIt?=
 =?us-ascii?Q?50pFuD7n1MIzjweMJPo/EqOAj3kW8RrFubGDSUNlnoGyX7vBQsdUK3/37Trv?=
 =?us-ascii?Q?i5u1ZR4dKZOa7/uiQhW0McawZWDI7Gnb2oM8JP3xF49QmeBzVPAIIXfpnKgD?=
 =?us-ascii?Q?v2DBW8rZuoQwveeFkvEMcSthgPtNwpFXxS7gPxdT1/fE5D+0RmdFQjLuugiW?=
 =?us-ascii?Q?GJ1j9K+H0h6JX2pcYRnaVWuDUROAXwsq0AQGypu55vL5esZii1aS7L10KS7v?=
 =?us-ascii?Q?pF+nwpbHFfIJndnoiuXU5vL3m//u3aVeJT/qnD/9KGs+RaVLVGXXJ0MVeN8z?=
 =?us-ascii?Q?VKL9CbtOt/vd0IcF9G/qPRf3Ec6h6ravBftuGXJipLL5guumDpS6ruWZXCS9?=
 =?us-ascii?Q?Rl6U6wwpBzh5bNEWRgFJYXNPfxcv/d8j/4qtMiPmRoGJqL0tIt5n43zzgBmK?=
 =?us-ascii?Q?UZgKF/DJ7A/FOdMZewvJVYpGQxskSge8YPtBYROlid3tCgvN4OlqwcistJJR?=
 =?us-ascii?Q?6jzRKUtfr4CDe3xQFe0Jy9R8uekYPssy7SRY46xswhJVRlpl7SGwv2uZt8h/?=
 =?us-ascii?Q?firh6QwFVeeUlSU+qxEQWUXfAt35wfzurDLaXnHrpkFhYq89DG8e8p4HC93Q?=
 =?us-ascii?Q?KVNaer7Mc7A3Mr6TFjsXUTdo31nNUTdKtYuhOTZj3pRjAKB3xdPZoQDTkAQ1?=
 =?us-ascii?Q?lZOgyl5zLXuaxl4WcpkYdJXeLfoZHXHQMnkJuq/V0Fw7uFEZhMhsnG+8PUAI?=
 =?us-ascii?Q?AaqVAEQLLYeYywW6A3CYY0dAI310jhDR8Ja9fPptzVauQ/8A/6uJakiKK+uB?=
 =?us-ascii?Q?wUE9AmvbCA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c37ac7-7cf2-467a-bdd3-08def4a010dc
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:22:24.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JWOnH314ybcyGvd115aXA63glUm8CG5/ZqC+X6Z+cLurCWw6blhNTvIxLXpi0LwsA5cM34SzAPjiDbgu0LVcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936

On Tue, Aug 04, 2026 at 10:47:06AM +0900, Yuyang Huang wrote:
> Pass the deletion reason from ip6_del_rt_reason() down through
> __ip6_del_rt(), fib6_del() and into fib6_del_route(). All existing
> callers pass RT_DEL_REASON_UNSPEC.
> 
> fib6_del_route() ignores the reason until the notification path learns
> to report it.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
