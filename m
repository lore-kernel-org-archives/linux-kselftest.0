Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F64AAC64;
	Wed, 16 Sep 2026 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577415; cv=fail; b=ON8kDwX1RE+vEsX/vPdydPQIawVQ5aIbXlYX0lzjhE1w9ZkQYnIMKULeRpWVd8W6yE0wx1y+RI5YDsYOWowlEqbGimN6ljmz+sNgW5JIST6BEHaR4kfZuyICbERT7miznj9/cajzs7qSjUyjclHxYYW8BFu88rJgbNdg7Oq+Lms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577415; c=relaxed/simple;
	bh=jxLDzNu1ryK1IfANBCEQIbAYbD00Y0gIg5D7fBqAHpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GQ04zkPYrqz9ynOJ7A2orhcUb45OoTTCIHKajmFx3zLUCJguGRaSWBY45pFHaHeyqvBBLJCzJDJ4/zTUfVMb844BNLg2vuOQ73Yk/o3cbiSPm1eS1ucJjZeBGVhRju0udHjhDYXYjQSguphLxHiiHvR305x1ElHCuxwaXfcHuoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pWts8jSd; arc=fail smtp.client-ip=52.101.52.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pWts8jSd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbAokEvFV053i3KYQBuCCfry3EmAk6sGM9JPaDinAC5sX80BZ3Xx5oPSzYEt1P6jB8N/FEGV+OBCZ43k9Ysww3DYAgFq8RhNPUYRhQJixo8v3i9uYrModXKbvqGWvinU2bsb6TnV+Kn1cHao07HF/ZqOSIH1fEUV31lm2XvpNTr6vycNTfdbM2bBfYu/qFDdYSAyr+HEGsqixnR/Bad9oVGzHwlTamFnRnVWm0DSLxdD6QE/0oC/1TowH5LlFdlBkk305JeJHLCE/boTF6G2dfWMkeAllv65U5Jbq9OP6jfeJGLVNPlCvhR2estLalmAqOeH6Uxma8qHMQIn56jH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdfzMBHm9XdndGPt7U9QovNQNTzMuaXKJxwt9HSIp94=;
 b=YSCO1paB/UZMC83Satio9yjEa9p5FB3ezcuWj3jFWLcgnPMibxgwiaa5kGDynKhytPIA/XE1Bxk/ukjXdLYEzXSOOotc8QsAcsHnAHZDAgN86YcbW/aNjmcQKFgwqvcHsWuquF7VJk6Edk0dqNKppHveXI/z/0e4YZ90BV/LwFwcwOrIVV9/I3SMeI7WBAkKFHYvogHblJ4J9aalHLahAsFqjUI2+iaU67IicZo+MsTZ+SV4oufMzFghbFf0FUZnV5jzwz6cjKM/rSi8puGSlvRAoeAEBKWo5h+H+87buz58Ua5OBlkKJ9p7owoJhtA99wllFdjEHEMu8ia3+F14Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdfzMBHm9XdndGPt7U9QovNQNTzMuaXKJxwt9HSIp94=;
 b=pWts8jSdtjAdzlCmpuBfgFJu9a2JheqzMy2Q8wZOd2nvNLlYnuPSTZ8ymN1X+WLvmvrTSkPH5g2Gkx4mrSf5QBYeCJgBhjC3l83LZNOCA6k5HVjmVL6CzGgOtBzusBde1He9f/MwJL+j6Od341YQGcUjgi9Bz5NXNBigu3X/iOn8+eHiuBmWp6tXF2O/vpPZ8R2h3mIEPwq7gbXFsGU1hoWGihG/hKbh9ZZ26v0G/ry4zr+QzBVQJMFCxQ3TxjphFNxVI7zY1OuygNf0aVuBaUFe7jIVenxDcn6orAfBWemalYH4rTeIQZRhraGhPeQivHzeQgY6fQqn9YVIMfbmqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by PH8PR12MB6939.namprd12.prod.outlook.com (2603:10b6:510:1be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 16:50:00 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 16:50:00 +0000
Date: Wed, 16 Sep 2026 19:49:50 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Chris J Arges <carges@cloudflare.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net-next v2 1/3] ipv4: hash uncached routes by device
Message-ID: <20260916164950.GA1093496@shredder>
References: <20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a@cloudflare.com>
 <20260914-hash-bucket-route-lists-v2-1-29f6297d8a5a@cloudflare.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-hash-bucket-route-lists-v2-1-29f6297d8a5a@cloudflare.com>
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|PH8PR12MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 76094319-ebb9-43f1-5e89-08df14128bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|10067099003|6133799003|18002099003|22082099003|56012099006|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	zvbUj8Cf/cMUJfn/0glB0Fwz0TTHPrxPnthCsvbufqnFlYWFvRDfLNT9rw33e3mZkM1Uw3RT7uhRlIEZI3JPWBvm9NrsEygbBSgJ9nOCktLX1uAxfTuOlmb5PSVzqSdAo1KnDJ/JCEykY1DfzrP3eD0slFECXjt7euYNvixaxAy+Ea+3IZTAMZYVFlcYL8A1WsS46F0Y9M472OplKZuXnvsrrO+gZaiw9+TYNYhiYnmvX53rLgXwYPT6LCxczfiDbXsUTCATAzvLCM3S4EUfFrA+KgQPVGT87ehQpR088KTVIL2ZSb0a3JmsHMBBNLnC+OgpLsspwm6vzeZn3a6Z+LogbsxeVUF6AWdc22s75Ydi9ZJJtU+hfVJVj4khtM93h2jFqNW0PQer5sn9qdrrXuVZW4dpQSjMGDRdkjrm5sTKymhkQymqA1ygLFftMHG6wOjXvyYrtd2zxavC5GcITFnq/PDU8ho0i9aE3AIDJ919+O2tUXVuR1yShW+HWkvi2/lMHA1bOzalUgMG/vMV5lg0WdEVAklTAVP+sALWhru4lZIzrnos0HAGEdHMoVQpoj/KncZ9A7yzUnLgEOw6J/aOSWPYfz5gMB42OSIYZcPvZCCLmaDEcObcgXYTqzI98C04nwOP16zZAqUDy5znOVCKciE/PECPg6Cvv7z2qDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ANH+IU327lxJkIQ0Ag1mbCYt8fzfiL0cpwnoqy9lteGnicdC4EEQBAiFxcNG?=
 =?us-ascii?Q?sj9/c2+41HsQTDuWRew0fKoknCheZE8eS2T1RUkqXJnGLy766tsCQorWRXpU?=
 =?us-ascii?Q?WH1DsA+SVTucnXoYquUkduvkfwleutozPmStestmtXuJUyHmVzjXGWax0IgB?=
 =?us-ascii?Q?VWWYjeIFvSz5771r+ul6rVRGg7W+TvUvAUZklK7gXBDV3PZtKWqFGUIeAMp0?=
 =?us-ascii?Q?RN4Z6ruQi2rQJGNA2tS5juV54DTPqYUgy9BSRoww8TFDZBGKfYQY+NUYvv5A?=
 =?us-ascii?Q?CYMaf6UP+t480wGSCtkOYAFmULFrCZ1301UeBdIwhYcKp/MxCbprpqnEJlbd?=
 =?us-ascii?Q?3Xrape45m3Hrt/mw4AGpWMGaUUeBR22eDfqH+EDy5jECSXD0oTh5CAggMm8C?=
 =?us-ascii?Q?LrmetdLBaVUOPxF/o9XxFGYBZ0TWDzhccVgbMSkxuwW9TixJgP+mLDOjZeMQ?=
 =?us-ascii?Q?jWH1mCVm/xJrkwLbo/xQr/FdEfoS5yz7Mfam+Tc74zZtBlevZjNDowdtLVbU?=
 =?us-ascii?Q?iCS5lzfe+XruIpdR0NcWxm3NeUCxEoWHLsi1SH7Ume4tNdTP2MW+AoGagdk8?=
 =?us-ascii?Q?r8IjyUPuNpePYNjjLjaUeLhVu9CD74+D0+vOiAZ81kkpKWQxx/GhykxrUTPz?=
 =?us-ascii?Q?J68rKAri4uS7XiU8od+7UdMSy0+BSb8edqh7F4Y8OXeLhV1xFLa8KZFnMh74?=
 =?us-ascii?Q?ExYmTb5LvVcAZh8pX8hqfx4aUJeQrqz9iujQXQNM8QkHoD98AouqxvrhUs8E?=
 =?us-ascii?Q?vn/LGYWYClo/BTa1AUBDmIvGErlLdzTBngcyxXmRIzsQQfiPev1bVJS58LtY?=
 =?us-ascii?Q?vtmuaGjKnzFmEJ5CDBcS10fYKuOCazDxlYUb5YuLHRzKz2PM2vHoJzzQXruv?=
 =?us-ascii?Q?z8kpgJGXPDdUdICNazbdvVPxxxTxytwWr0cwsASnvHl2OaiyffVIeqhCXrhd?=
 =?us-ascii?Q?Vaiov+5/x/Yhdh4I2XqR4W/Viy0jVTJ/0yaNjr5w2TnclagB3EtbyTTpGtLp?=
 =?us-ascii?Q?d5Z095eaBfFsFo15xbnP4Utjp09qf6MXu4YfZXpEcQjBKagF6juijQQ+AotJ?=
 =?us-ascii?Q?34yaYP2Wu7jnus5conyf6j4ye1WBQD75F0lYX2B3JwAfmqbNB9Hio3X2JnmE?=
 =?us-ascii?Q?rTAdXr+uc7cMosyjA3qhiseyo5SN9YLnyjfLu4EqzFHtd/QTy/kpVwMVPZuu?=
 =?us-ascii?Q?HY26nsUUrxc3qPHbTH9Kjo3M/S5sndpYQypLjQaP3qtDDIPnzsL4c2KqWNCF?=
 =?us-ascii?Q?8jL4Kj8ruIR/SDk6yz+JT8Y0Y5dREbnwI40HWiBYxc9V+39tNvdAd3Kzic2b?=
 =?us-ascii?Q?IYbKb1eLrCtVuFG+6OWgJ23RuHYaEFuE+nR8iVIslTf4WwN2XSRHHqEJH+3v?=
 =?us-ascii?Q?WUu4wxf3iS8rgxb01ViWYyavF4Y7HBjoi5V59zGgKeXe7nHjS0yxZAD7Ghpb?=
 =?us-ascii?Q?igRNa4ASHIEWFBI+sMgfUqBfih0kQ76zNF1YZKCUtAndrb7AHqJfPfuCuBCG?=
 =?us-ascii?Q?1c6mrKcypGGacUwfoDGYkoFEDGSetyxswMoK2ZRcU5FCYmYcYikKglAcB3m9?=
 =?us-ascii?Q?9PBz3r/yEm8Wi96xkybiFGWFVxGO4YjMBbbFCwlydK1YzKnLwwGZh06Eeg7/?=
 =?us-ascii?Q?Y+k6lBL9YVPdENOpiYeZJaeb7VGiC344Vi/2vTWo2G20t6caVEJhw2gIa5YU?=
 =?us-ascii?Q?Ioy5W0CXh+mbRkkekfQzon6WRsj9IixrjQ4AnYwrKhGnrDf9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76094319-ebb9-43f1-5e89-08df14128bbe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:49:59.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4Fz62gj/1cluvVEajYaJRyWGNhEYHyQdvRjHjF9Fs6Oun3XvbcSkR3bQ9ANHktgyIozzA2hmRdZIb6QBqXGJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6939

On Mon, Sep 14, 2026 at 09:03:35PM -0500, Chris J Arges wrote:
> rt_flush_dev() currently walks every per-CPU uncached route list for each
> device being removed. This repeatedly examines unrelated routes and makes
> teardown increasingly expensive as the number of devices grows.
> 
> Replace each per-CPU list with a hash table keyed by the route's netdevice.
> Keep the owning-list pointer in dst_entry so route removal remains
> unchanged, while device teardown only walks the matching bucket on each
> CPU. Hash collisions are filtered by the existing device comparison.
> 
> The table has 2^CONFIG_IP_UNCACHED_ROUTE_HASH_BITS buckets and defaults to
> 64. Larger values shorten each bucket, but every additional bit doubles the
> per-CPU memory used by the table. The default costs approximately 1.5 KiB
> per possible CPU on x86-64.

We have a lot of hash tables, but I only found a few similar knobs under
net/: A few in IPVS (IP_VS_TAB_BITS, IP_VS_SH_TAB_BITS and
IP_VS_MH_TAB_INDEX) and INET_TABLE_PERTURB_ORDER.

The latter is hidden behind EXPERT and was added by commit aeac4ec8f46d
("tcp: configurable source port perturb table size") in order to save
memory on embedded systems (not to tune the hash, as in this case). I
don't think the memory saving argument is relevant here given the last
sentence in the commit message.

Even in the thread that Jakub referenced, DaveM wrote that "It should be
dynamically sized. Compile time configuration knobs generally stick" [1]
and I suspect that this is exactly what is going to happen here.

A "dynamically sized" solution can be a per-CPU uncached list for each
net device, but it's more complex than what you implemented and will
also increase the memory usage per-netdev.

So, I think that a fixed size hash table with 64 buckets is a good
starting point and it can be refined later, if needed.

[1] https://lore.kernel.org/netdev/20110131.140503.179938794.davem@davemloft.net/
