Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792927244;
	b=vr/mYKCt2mQqfOR+QjOTre/+mONai2fEj4VZLp6I4o6U+kC0hMgtORY5wlZMREAg1BUI
	 IBQZMb1wZKbbJQ4kkrsjwJ1CucNcWV51vN7c7udqImwExXAwpu8oXA5tQPBEakKs3gD6Q
	 GMwmypqDKR/eQxlAmWWX0Ddsa85btIJi6oHI116nJ8AhA1B8frTsxkDYLFEosWhrUd+Ik
	 x4LB/ycoteuRLtD/vUSlBlQlDl8m4cfz28XpParOYX7z5KZvA3I6ZTEi5U6lmVGo632vI
	 gIVdf6fe05xWmpr1c67h/PwFcWg79qcAS8U66qhMHX5r6IuA6ItPtmwNQmkL5j6/T4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792927244;
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
	bh=rRTmRJR4ayysXzjoNAAdOZ6AWxQWsjJL1/RwmeItpQQ=;
	b=Zu8JETVkKL6ppwEcCIwvrMrC17YjiHLPxu7jN+ADekgFLOxBCtvbw1Q7qRT70oSUk61U
	 eGg9vsbInAIDTwUUgomT93qE6GT3T0w7bfbVKdIgqmV4S4RG/2FRzbdGa0GLGDC0vk0I2
	 VL9a+AWUY3yZwmF9wZpYmMPVHXLdUUCPferQjTeQYQV1ErScuHlsuENJ6KVZG3EhktfoC
	 y5JFCzPZe7ZyTEDPy5f0KouyleOFMZfHAgenvZo79Hts6mghjefuWDXDqj/z/T7/Ubuet
	 w6nVWmpQkhg4rspBjkH5XLW6iDYiPlJDYpwxUtDERprYPF6DJ82ULnRyQg4nY1Bh4Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AjA835ss;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.19
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100AA606A31A;
	Sun, 25 Oct 2026 11:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 100AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AjA835ss
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seFK9ozXsEicq95aGiZOtCR/Degd5Z0ml1FuCS3YOG5fHV2V1teGkDC0XOSKtLYaPqdPXaPmMdeacNph6Xs5R4qyK6nvKZZnxIgpdTtb/ef/P/Op54qam0sdJg0PEqcGaRJVo3hof+hL0OciQNaWzJpxiTTpUtI0ipE1A8Ze41hJYweuJxVPHpExc1P9xIhicyzUhVJFIq+gwI6KXWZvqdwiPATFBims8ba6wPASwcKfNo1SsvTVyvJDRByK6ovCsLKqN6j8KkRbmstjzrWYEgE5RstZ22a1NIZbsM1GD37akU/9vk3DqgMYAtX6RespL4mwEevFid5Hza9e34w+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRTmRJR4ayysXzjoNAAdOZ6AWxQWsjJL1/RwmeItpQQ=;
 b=kFGvP3cjtYzAKF2tZ6qRJTTXb1b/V6UXKLmTTLvC/n415EnynKD9vUFSq7ihtqeinv56phfcIzF4n8tUpLHHM4DU0MDLHsa1J3B9EjZue3Gt6+T0Xsg3YAVmVBmD54Ijhns/Z2yg47JCZw/QMHqmwUeRQeDxZoq4slQNHGoD4fbvIOfxufs+t6MVNsxmlCL55z2Hv4LfeUFZa5KWkeFKsCRnYZgQoZTGPVOXDfFpoeQOXoLaZrCPn/rXUTTs06BvdX42yjn8lcR35NylQl3cC/B8G8tr0OKvuJhO/WuU6BBphQN/J/SIhNktN8SoLTtCWM+a9ZZ0caimbnpWyAAd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRTmRJR4ayysXzjoNAAdOZ6AWxQWsjJL1/RwmeItpQQ=;
 b=AjA835ssyr05YPY2PRJOdwJ762Iv6nTpoGkul5yfCDmrnOwvO+3eO1Mos2Li+xyqNummNkfTXO6jTyCywGqWDZrGKnO9TXzgPSgtXFj+7lcR2DKE7vyVYCaP5z2XcBA3De2rgtxJuuWL4KVm3gjMWbhWiBn2H63jZUv36r7WhGEOMnLLw4FDn/IUu6U7nJ+/Tc6UpZuDn+KW+iVsng1CCtxfMCMmU+4kYrLrcugrUwyG0la4xBDVTDxIummGVwfBYy1lWNJWnIKqltAM7UAXuYPbSwhvjHhXBE3aI0IN0cAHgHqMQWf9hnLP7R99hoAhZTTrt/5xcUXncyYebXfGNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Sun, 25 Oct
 2026 11:20:39 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0546.021; Sun, 25 Oct 2026
 11:20:39 +0000
Date: Sun, 25 Oct 2026 13:20:30 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Jin Li <jinli@lanxincomputing.com>
Cc: shuah@kernel.org, dsahern@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] selftests: net: forwarding:
 bridge_vlan_mcast: Allow default startup query interval to vary by HZ
Message-ID: <20261025112030.GA136792@shredder>
References: <20261012115414.GA704996@shredder>
 <20261022103023.834927-1-jinli@lanxincomputing.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022103023.834927-1-jinli@lanxincomputing.com>
X-ClientProxiedBy: FR4P281CA0361.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::17) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: ee41107d-99f6-4752-f08b-08df3289ffad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|261009223027099003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	KBMd2PB4U44k05NeEHADMk92EIcl93qrMhSnZEbLDd9c4gke8pbvZEpD79c3fGplsAVKMJFWtrYPgFf1IRb9KX4vXoVdkx1L/N8c9sKF+ngkZ/HF6FDNw3SOrEg9Ba3mTr9dSgTwxGMG0l9li+7tnaZLAPVfSeQEi0ayuhGpmqVIal4zb8tRjE66A/i23ZCfNoh5Z00nfIdY1ZoRp8iKTtPX3O3hUs1YmkhiDgU2nGnipwxJa66M5uQNvRCmHeX6YIvp4jWuLNBv6mdtYsb8EZNXyQTR4ojQlHN3GPMt6FUwytSyx0E9bVbyq8lwIL4l4uhd9djFXiwIJ2groTsj8RHPoT2e7aFXS+hf1noj5weZvZ7lFhuwlKQL2gRWqkR4hLgw6ZhjFqn18IzWKdcZ4MOkGz1tmzwcjiS17SMcqrxS0uaidPBn9m+FsHvIk/cth4AjWw8cC2HEmgNq+X3YtUrNbc5ePFwnBiSa0KzZjxkKROgG1SEHPrkJkBk/sTZyLpLniJUXYHiAUFCVwV7lG5GiYaSJOnFGRztJRYSj/GkXlJVL802Xw69wPl0k+WGLkeXDrRrIfLnH6fhb/g7lvW8zqR732M+DhUmNJe9JqKsvRwIWuiRwMOCGhcN8wunCjTNTyL12LQpKK++7Hf4rlEamdKUiVHCHaDycqDCCCB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(261009223027099003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IrhLG6sq9Q5UMAj7S/XXc2FzQewyAiJlhs/RI1qCIxagGNo54fkEabwVV6sK?=
 =?us-ascii?Q?FIcIEyN0jvaKFAZpKKXGBBA+TASQcV8TZ//arzjpwYHq91Lcdfl41DaqJShs?=
 =?us-ascii?Q?dctbohU8OzgKhhK0nO8+264vyQ/ZWjpcWwnMyKA0feFFa/G7WL+lWCZMaNlp?=
 =?us-ascii?Q?L4KPg2eNRmQbar7rpdtsY9dI+TIGLGFKnBt0I875pSGIimQAci3k0NSgPM9n?=
 =?us-ascii?Q?KaIMsbGWNrxyjyTl+F74gNSQokxviIA958jGVlv0mOD33cUKBceEf8sFO4JB?=
 =?us-ascii?Q?3JaRUrkA0lRivbRfj6Ps0r3yl3hTIXZPWP8krC+pD9LCB9WOKH3sxZSXB31w?=
 =?us-ascii?Q?P9mOCvlca+nzaonBfMlN4KyZMZxX/s0szrJQpay/+9djgvHJHpMMwQr59EY0?=
 =?us-ascii?Q?0a1ImuX+qpjbH9ba2tiRU/CM3DjBj/tRHH9k7lc4BhIaQ7zGW97lRK/Mjm/h?=
 =?us-ascii?Q?WlGFjD6+PG0n3Qs9GACpCK7bQ+WfWfAdbSqKcYrxjXIxbd5xeyBLw0drGA64?=
 =?us-ascii?Q?1WDWzQSZvJCJitY0wR6X3suyb1BMN/sJ+qwo0KXexktMS9PpK2Zn0dZMt7mQ?=
 =?us-ascii?Q?lm/ts5fPCvlnMlM4xHCdsjOW9nhvhI//AmKZbL+c30ZId+6Lrdzz9d81J8Nw?=
 =?us-ascii?Q?voE0KRH2bKLMwrpB87l55PsiMjuAVIu/gi51nLqYsBVDRVgoIWkQxbCctI/l?=
 =?us-ascii?Q?XPkFfH2HvD3vHaOmv6KqLG1aXjniFppUG9UtaOeN4a7lhFOHQQrjro0DQS6d?=
 =?us-ascii?Q?6Es2OJTvFWTli9kUoi67dnvRk8ICB7khVneb1wx/Brqcro+kQ/uVpgUNu1/j?=
 =?us-ascii?Q?Gs2LhVLbOhuK3kfAteqf3qCYVoXMCLYdaD1DEN4oMi6UVcBbyYBi6ze+1L+k?=
 =?us-ascii?Q?LSNuDZAW6/TFQnNhZZEgGjTd7PwKXNPHlYg/jonZBnYZu8QICSDvVabECvA0?=
 =?us-ascii?Q?KwhwDPpH+m4HyvLypbFyXKAJzN/ONqXQZN34crioctEMXwfrTsuSx6xTHtc5?=
 =?us-ascii?Q?UhjtXaCf5pRW1lDs0N5GjiPoqRhBEAtZsZkv1Pp1ISQiSI2fNs4PZD4uhDE1?=
 =?us-ascii?Q?tXbX+fUW3y75OztUopIH5ueWUxpVImnMm9qxwi1GDrPe3vdAqAwx4QymxacA?=
 =?us-ascii?Q?Nv8mAHPaiHzPxtfZRId7JPKQuD0aibgC8O7H8eTMJEyBrYG6J9V27J9rE85m?=
 =?us-ascii?Q?LgPB2lrcBu2Z3h37BlFAxjixRkCFB6W9zHbghEXInKpG21xNMJ99+dy0w9ao?=
 =?us-ascii?Q?+yX1ygzQytA1j5gNozihllR4VqP25Y15wHrNzhNk+S1zXo8K8Lz9VqG9xLAw?=
 =?us-ascii?Q?w9ebzWduhL12RK6Zo7P2p9YCj8ywX11o6xCy0BytHeAXTy+Vwrj0W6ukP2pe?=
 =?us-ascii?Q?RH8TjlUSRDLNv2BXBjwNGXsQWZ4h0g7Ya0erMGk23FRJyFdAnWrm7bIotx8d?=
 =?us-ascii?Q?PiEVUL49KCal1FGrZ/OW8gfhaf5xyDtWvE1Za6ro3WjY5oBMABqrd4Da+7px?=
 =?us-ascii?Q?/9Q1k8h+oab4ik+UUwmKGK/xA5o4uXT/yKMEsgop9k/DISkIVb0DEhPHMZrf?=
 =?us-ascii?Q?q7i1hI4BqAUGSkCiYjDwNhvL2L12QyOO3O7XnbJCk/MOWtKeQTgcJPBEO82J?=
 =?us-ascii?Q?cYXRGXktrj0svvHjZmoI5EagSzHZDrTqxQfWnNMhqaWlxmaKv4Lgh+NFsnDx?=
 =?us-ascii?Q?RNNxfNeMSGr40A8Ry6cm2L9VJYDJD+eXiupZjgsAcb4cgmei?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee41107d-99f6-4752-f08b-08df3289ffad
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2026 11:20:39.2172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYcN/fpI0lxbUhm9TIk7XPQC48qW8eyBcWSkFq6joBmkRepncIEfoHF58YuSz4I4FtEav8NDYtmPfM7GtaFICQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249

On Thu, Oct 22, 2026 at 06:30:22PM +0800, Jin Li wrote:
> The mcast_startup_query_interval default value is calculated as
> 125 * HZ / 4. With CONFIG_HZ=250, this results in 3124 instead of
> 3125 due to integer truncation. The test currently hardcodes 3125,
> which fails on kernels built with CONFIG_HZ=250.
> 
> Allow a +/- 1 tolerance for the default value check to account for
> this rounding, while still catching genuine regressions in the
> default value.
> 
> Signed-off-by: Jin Li <jinli@lanxincomputing.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

net-next is closed:

https://netdev.bots.linux.dev/net-next.html

So you will need to re-post after it re-opens.
