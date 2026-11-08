Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794147983;
	b=Kj0ngIMcVOPuJ2LgZb0r9R4i3xseM1kGYWYmyTOMSec5zDANMnsrdlndy+AqqjAqtUSU
	 mmsiRXqlGuUSgPS+KdxPZ/KoJshLqzpGn8sYVYjoQ4s1jRc2FKTjcqBaADmXIwZJLRMDt
	 k8qj5WMWDq9HaUcM9hnZCRnHefhDnvPR4tdjFIeNgQPVDD5dnKnAh2zQBL7P51Vajl0yj
	 mVn8jH6LzbiUXOStrB1UiSIn5OxHgiArlJ2sGqUWIcWbLZgtXtzvLxM1vIO4DaYt4Me7D
	 ZdtD3AttsinB84KLa2ut2YrOwX8jcZ9ZRv+wQADM87OOuwUJ0QB//bvMVd8N4PckTEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147983;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hjhsNncsjgKW87hQ+9pO09miYo1AKAJ+Ny2ApylajPw=;
	b=5Pblz4bcBzg08GhXS/XlmHNtps1ooirRdh4jQXe85mBKtIvpQJHvpaHpjA0LaGwDWP4p
	 yYxL2QuBa6HpG9kYbieS7hR1Xx0Cf8ZOqEhQho8rMuMEhA3uqUIzCx1nDd0kubMlGGCeK
	 UkxknTMvnMcps7ClqxZJQB7/yGA6pxt8Fzbb+/py0rO9tdoQkfCZKVoxifDd6er4FXaqE
	 mjjEKJzzP6cOJkA0r8fepw/pbxL5v+lcwp/E0WDrDaOefvPiYHtohjUNrhSyC5gFkDams
	 AVe5gDRhWFyK9vC6az6rAFDHvyibPst3/SP6f5GdFYfjCVjZ/n452Yjf6lgcqAw/skQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YmEcQCo4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.46
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E09606A31C;
	Sun,  8 Nov 2026 14:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E09606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YmEcQCo4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLqYSmCsKPNYAwS8vSZzaAv51k6R5Apcy4blNJ+NOutqGy6qR4SQ/iek9TEma+a8OYowfWXVSzDGpClH7Du2CX4FsOLG2KBrsZykHP1L6cutt34skd8ZLZSdCOKDow7UlT8k1G6ZQhHS++IVBhIKnc6GESnuBhJ0SSBIEdxDF5UFrsQno/kCUhYfcQlOUPqYWlE1baia5E7N/hNhhoPS1UouoKHXzNZxeKJz3S6k2ja317lHcz3KM8XKCBvfoFViqKyE75+DCnxy34mkwVXNYamLjaQ4HEuAWobeWVh+YZvqzqltrCfxoD62JZT+g+NZZEWq+m982N2baHQ3H6nZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjhsNncsjgKW87hQ+9pO09miYo1AKAJ+Ny2ApylajPw=;
 b=QH30DI+QVTCiKPiH+iiHrEmM1iGc3KGRQr3iQph2Ewl7/+I2FXDcWl8SrC+6KpMe2ai1Upy2GnG4HHrAiXXXBNR2ni/u65Z5U7YiYb3fJJ/f52GYElYM4WU67yEGW+ezjMT+cdJGBWpeK2jBWEfPa6P/PJ2OkB1v4SEfOdqQZOJfqEBK1dDL2iGzfjcYdxz5ZB/I7PqCfWpEBWQ77ixBgYjx2KBeSPha9hCH3Ly9M1p991SM1OsfTHivhUVbxCOChURvdoU9RO2aIdZtNj+CRNoSXBEN1fQPsQIDkfUyQyPs/rA6qPRMDaqkJG+bCy4WsD0R+7A5ZISvUcKx6oDWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjhsNncsjgKW87hQ+9pO09miYo1AKAJ+Ny2ApylajPw=;
 b=YmEcQCo4uTXe5qqyg9kWANIZml6N7NVqpO+CCp8w3qVqDYOMAKF35M5BNiBb9G5h0nWUeDzsVOi1/6C9DMtBXHHjbNpq0KM01Ix2BbAjZM2D4OdOhbirF1jrCiDzibTXxa2lbWOqMMNlINn1kQik1BEurmPB3KaCJfD1TUqHtZFNQFP4V3/nRsT52vRSLXH2d+IWPJ/IjKj5HsyNcNuJMR9T/1UoukRkzLapII8YalL/4h0Gul6y/IlIgb/ueE0Pt+RbsMjWgfA5ku6nH+TOaB0Qp1VHb9STbqq84UfDCl9uD8BKwupd6XjHnfyMs6NodoheAknqQZFb3Ewj2wAtTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 14:26:20 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0592.010; Sun, 8 Nov 2026
 14:26:20 +0000
Date: Sun, 8 Nov 2026 16:26:10 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, weiwan@google.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] ipv6: ignore link state in gateway check
Message-ID: <20261108142610.GA1273791@shredder>
References: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
X-ClientProxiedBy: TLZP290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::9)
 To PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|BY5PR12MB4049:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b28f85f-5487-4e83-6fd7-08df3da441fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|261028144727099003|261026121527099003|261022075727099003|261022105027099003|56012099006|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	L1lTf4xhw8q2P93/xqwbQshk2YtaaFPiiFsU3XGGW+cpNaU4JS8M38+gOE4wpfceUP7Kq+aLP1IL2OxCcWTOdxLN0W/fj7+X/fGF5YhQJc08vWtEf3A7Lz3RVtARZIh7ffT6Jdunt7oHZkSpAFquIGs6JPAb6XpJuvPhkQq9d+hcnigEQLoE6MKHZiYKffM8AwB4criyU8vRQDEklQTo/3l1M+2qgGPgfWSoI9vYKuJuhzsKTua6YJzpGy5T+gJJWgf0SMcv+VOQ73Dg5SoRMCjFMgOUsgopiTjVyWU2Efn7byu8SFv6wAyEP8NecqnX8IuEhuLM5PWjLNGOFx7FQpIN8lG0sqh0Z5klpMKVYCKXNtMDihKOO7/VD585kkpQl4Voiep0t+nD5J5VectGIF9qDbQxUs8QLLSzGXT6eUgdq88qILSCbvdk26Pk2a5y5BSGoimtKNXsoqq45y9Gsoj/rhD0wfMTNZqqVDqyGwgVoioKxzfTEpjoVDPXZhBRMHR0uFvYceNQI+mzH+50Lsa8azCjQhhFC1WCJEm0Zuun4X+qY3hAH4lk7KlgX+f1iIOeTK/7tSmXZ6ZOZM6MaNYLk7LXiMnn+IUCbsHFWQxaHFvQWEaP1n5AiAlzwoZrpjbv1p6j2ez9a9JGZR+PFHxnCuu8/VrzWwttLLMUPy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261028144727099003)(261026121527099003)(261022075727099003)(261022105027099003)(56012099006)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qE2bU3y/GZwWat5kXwPR9tNryDm3acEW8TEdRSWloQFBIAe64XhZ13vOXXsI?=
 =?us-ascii?Q?ZmXZGeZFlDumiQBYsPIrMdaIP6fTFtEwD2UcBIyO+6PxS1zvGY6ZURnHI4Mt?=
 =?us-ascii?Q?/nC5aGiFk7y6UeGlxTUJx6j6D+h73PnnBCFjCi+KCok1SaM3ZFCD7rX+NgsR?=
 =?us-ascii?Q?XyRW/1QfjgXaZ6oAdm2YTnezd4XMwl9YTy6rx5e/PXfXTOQ2XxR7KSk9YBC9?=
 =?us-ascii?Q?KIKqL6tKj94UurEcCA3uIOSQL2hOEs/02cnrqJymVlMbCSH9wsR6CeQR+Kjr?=
 =?us-ascii?Q?SYZ/F4G2VmuBTp36rgo5gSL1lsOiGJ187J8LoKbuX95hhAFpmH2AeWFCbBbj?=
 =?us-ascii?Q?OB4C1MW6HjIVzpKghj3tvSwv3igJcmJ2KoNzWWmy78+pDM+EsIEh/awvKWQF?=
 =?us-ascii?Q?iifeFGERKQlQ4WMBLxrGJ0fxnRDx09F6F5IK5IDjuWWr3EG5XjldbI2Kgk5I?=
 =?us-ascii?Q?j+Y9q7ydO1X+Kl/mUiHP8z5va97eBNSpuEeIrilprZdTzVOl3jvhsOEwT8Of?=
 =?us-ascii?Q?MQ8GIdjDN341crkgtDlVL+9tsSk8rACnfoWQlJOGKcFb83ZEUudJ9QNpqQ75?=
 =?us-ascii?Q?cjE08AzaIoMFR6gSio56U45nLh1cGY8pqDGGiD97kecx5o9h+qnVYQgbf2sM?=
 =?us-ascii?Q?x40j9/SJQE7fXVOHbN0uaUZSPmT1/gt04YMGB8njRG2wzDRkd4NdM/xpvp+k?=
 =?us-ascii?Q?T+G6Igo/MocZFQ3JraK9Jtid2kpH9+7lp97GE3wGCjuNhtksBeaaPMSp3ztO?=
 =?us-ascii?Q?xL3nHKPbqfpPJ4NSoKiExrYMpPaBL9LloJCXMIL5UIiqF8TtMTqiSSURfvCX?=
 =?us-ascii?Q?UhjXRpiSm94Ec4BgCKXZHifqJabYN/FmYyJS7biCQgOn8ynxxSKlbOVgycEy?=
 =?us-ascii?Q?hDXb995byHBVRlIaeabiyouXKly2ChMcobS4EJMRE1KtMjB6tb4xwxDU+0o0?=
 =?us-ascii?Q?AjGbF7kj/jPnn9icjQUzt/N7VPteAB3gbJHTL3U6Oe9ERmPTsVZImilggTpK?=
 =?us-ascii?Q?OLez3e367X6NUHPkbrabZpxBsmcv7WlionHkBimpuHY2Jj14o7hqsowHPOtz?=
 =?us-ascii?Q?T0q9jYCNpAvrcniZAWE7TibGTe7IkGnyeriAF55khd7l9zbpWu6kOUX+Ydkv?=
 =?us-ascii?Q?qZ78dr7WrkLleKT/qsy4tRzH4Qbcx5OjCfEfmBCNHpBA9r5+EnDbHKfi+MH+?=
 =?us-ascii?Q?xLx1VyYsU0i/UnV0BRRI+Ydt6ml7kQLBUBcGk6DAVgw0n+mFKm+3+7MKYrJe?=
 =?us-ascii?Q?9Y3VU+zhHjcQ5+JF9qwx8x4cPbMsR8MlJJfh2/5U24PPhrOilVRLmWtwgIFd?=
 =?us-ascii?Q?F8YxQvDesQuD5Je9eviDEa1OMLk9/8rwoYKL+MYVP+5YIvxoIO71aXm8in8J?=
 =?us-ascii?Q?89dMuMettL+gM9ssPhlmF0T3z1lFYPGX15SxymJqtNWnVNNqqtDn2OwR0ELV?=
 =?us-ascii?Q?3h6RYvcvpkq6jwaua5cCtxfpzbUo6NhZE+hxPcOdNcPrz7+VkD5gyrwkXklY?=
 =?us-ascii?Q?Y7LDtIgYggaA5r5GCIEYURtVLYt9MbSPf2PKx5yrdOlipTxxW2KNI0FDkng3?=
 =?us-ascii?Q?r+oqNIk+1+cxG/8EqfaPwDPlNMmuGI6bkUokCLAV7i7os6Hzk7C9zwcvxSAn?=
 =?us-ascii?Q?P0UVg3uHj5am6o17mI6TUA7POySyRGWOOsocQcSbrQyqd/VTDJ6vm0JBkQxl?=
 =?us-ascii?Q?pF6aIWqqXUYKQiGZDctWwuNo8Ru1+/MUkEWG5hwoHibnZwLs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b28f85f-5487-4e83-6fd7-08df3da441fe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 14:26:20.2007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aG2ZyKnczJKsXXI6fcuLECh76vv37ozG8PJqb7DbTy+MrXSRJVPez050yWBLGpPkXDyuxdpNQN+qybRpeBmenw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049

On Wed, Nov 04, 2026 at 07:56:53PM +0000, Yaroslav Dudkov wrote:
> IPv6 gateway validation can reject routes in non-main tables when
> ignore_routes_with_linkdown is enabled and the nexthop device has
> no carrier, even though these routes should be added.
> 
> Fix this by ignoring link state during gateway validation and add a
> regression selftest covering IPv4 and IPv6 route installation.
> 
> Changes in v2:
> - Fix variable ordering.
> - Add a regression selftest.
> 
> v1: https://lore.kernel.org/netdev/20261028152634.3355852-1-aroslavdudkov622@gmail.com/

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
