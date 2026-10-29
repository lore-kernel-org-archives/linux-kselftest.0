Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793303916;
	b=GK6Z6XV3a3oKsAFueMW8TkwdTxXygSCS6Mb1g69wIdU4lChhnTd94Lhw2UG3IYd0D7Rt
	 OOyHGgxwcYL7+bGW3ZcMXauLZEhdXCFIgxgTpbik78pxr2YNw9BKP6DpeA0z+9tLwib2f
	 MjouWzju8gbOBng5QvIIQaTq4xhBdUZplS0ZeIdBGI6WXi4w3FfajTjzQgg/mv1vfW5Qr
	 K0OGNXTU3HUGPOrR2YvGgPDzYN2C9qegOUee//dkbX8lwo84d8e+cD+fMoU4GCe8pdsgd
	 FzLaDXcZ6FkIOw1XuNZ7yWsi13f/fa0X5CqyKGPR8NZH3urpPYrTnmKRho9MXT4lvzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793303916;
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
	bh=vDJ2FVYaqxHwwArOZk/W4aNPt1yA6kwi3wOxMwyKZJ8=;
	b=S0DQcHZ6MEvkVfkEGfS/cSuwS7ZsEHFWXhlYvhy4TUyOrGq6OAjd+Vz3W068v48+SLKs
	 V1P6mVy0di1HKn4+s/0ATu8z39OBxFAN1NvEjQDeAlN4d/1m9u/Co3cCuWv4rujMtHscB
	 KDOpGHgW5MDHb+477+GCA3SGxYWcxXajFqFlQuw8xq9MV8GiIWhDwjfn4k4ckgHFAXAh2
	 g+kpfbBmKy3r0ppe4HKskhcqzzufD3358TMTP0mitSwu0oXWLiNjTUc45NZbfMbCy/7ZN
	 yRIEZl3qYTaAGzx4kktPaT0ghRngXSLAKb6jhAFIBhlxIfK2mIVMs/9oVxmDjXP3haw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tGr0not1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.27
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D32606A31A;
	Thu, 29 Oct 2026 19:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tGr0not1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKDmVxwGzSm7pB6H5p1F6SsY3ByM9P1yPto0jBP13e3ZXAW6gvjzouMcU3pWC7Z7YkH7/DEP1Z/odBBdoeHMt1b3BZ1xSkseQLDQR3yMRGTicfcOson1gbbdSd02HlqGu97rlICI53JU5R6lJljS3le66A6fSypd2V052MMdvqviEC4niXgcgAlzMDqCDAh9jrQVscUBzsCwfoxK1fGYjkVvATtL3lYztTICyZAWMgDPv6hAE5AmbUuRdvMBns0wD877obAON32pcd08s/73J2JcDcOE6LZZjENiZMmx5+ViesaXL6WY6bV1zizc3WgCkyJqW0GpJLGwHwsE3af9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDJ2FVYaqxHwwArOZk/W4aNPt1yA6kwi3wOxMwyKZJ8=;
 b=BA3SIMvofiX5YVEpD2ZiiL11btliiNQpoj8hYlsa0OiF3OIxgBuM/1VKxrea1WBXIKgD7cA48D9GZPGFI2T9audy36lAmHHrUVPJWTUrSM+iO0hxFGHCm0sxPP0WNYu6c+Tw4guwZYrHwvKroahflbQJ3+AJf5iLPM6u2KczxUaKJ1DIqHZ/6JsP+KrNeg3oO1L+fNptQjH4MsZFLbGppoBT1mBCXoAvaqr4TndbVCGsODdbwxjKdvQCNTc0XfVXmC4hJR0WDxeTKeRnSRGTS2bc95hgf8KuaY4WNmcfjpkJPql+wO1jiu9fA7xMBT+yGXeRFSiEMVe0StpbRL3a6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDJ2FVYaqxHwwArOZk/W4aNPt1yA6kwi3wOxMwyKZJ8=;
 b=tGr0not1j4y9ivIZgJBsbTqQ8spZ/hEWQR8m1Khz7TRIpX94N8nNiMAwgONkkToDeQc/QtDjQ+owSbSh7g/KPUzEN3qcK8/iTFULIysusKGZY5FdxLU+My9C4yr61f9lER18ajEy+nbG+93E1SUfFkL3cYKKonJ1BrgH2EvYeVEcNPSKhOdiXF8BrUYSorzWoleFHf7O2IIiBhOaeDRHMAcfQ3iIn7qCzm82BjkUxTcrPLYlur2dD7VdnP1WRBEfIJpI1ACzUFDOvIjSzseuN8gTIhNfot9h0OhvsbrIT6RX9emBGcqSlq97Pf26ExOnphGcQ056Us2UIZkdvdnG/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 19:58:31 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 19:58:31 +0000
Date: Thu, 29 Oct 2026 21:58:21 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Yingjie Wang <x-professor@outlook.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dsahern@kernel.org" <dsahern@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 1/2] ipv4: devinet: update inheritance state only
 after parsed writes
Message-ID: <20261029195821.GA1467575@shredder>
References: <cover.1793283257.git.x-professor@outlook.com>
 <2b84b193384fd243fb70d9b0750cdcc9d695a158.1793283257.git.x-professor@outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b84b193384fd243fb70d9b0750cdcc9d695a158.1793283257.git.x-professor@outlook.com>
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d44916-730e-4206-741f-08df35f701b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|261028144727099003|4143699003|11063799006|56012099006|261009223027099003|261026121527099003|261021121427099003|261022105027099003|261026140227099003|261022075727099003|10067099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FMhnQyFCAHPsvEK+iApjTF2stzT0WyOx+Q7PUnICvb5BYr/WoZcGTBc7xS3OOPKaLlEIEtWAsETc4YPMwoCBiwUcxN74oquWAWSe9Ku4ks5qSxdw7g4oGqsoZD5ypX+EGgQg43WFGlNwPts8golgoInFR5pdqh8dUbCEQJ55Eh3cE07iGYlRPOa8s4RFtRCBNhxTnQpCZHWj0Z3akgHFjMfX4PjKH4UpFV+cH0djvZruhy+y9AZ6LM4Fl+5PFmPxnjjhxv++u07J1Qx57VTH+JpxsGXHdV06knC371QMcMD7LgTWTn/Z6o9Z11UetIpA31og8YQqVPJtnDFJH673vscEVT3gL/qVqB70gTH3k1nYQvyHpbxOx3JwkJBw9mTizeaaIHfzaOV2KUiL7FJcx1WWPwmc4VNGixSyy+6IRO7RYEFcHICPSXiBCZr3CPhHsChGfofWMeeXCSaklbvCyr7RiqNJ5BwcMECdYP8XUIwbQ6w4zdQs+f1Aggky9Y//LyXjcWUKm7GxbUG7wB7iKqx7aeLYcBvDQRyDJaDr/D3PZZvUZLfWhY2iSAQSv6FFedeF1ATa3Cm6qIGqPBiq6VbbTN1T6IRQscCfar2jq3YwYHxyymuwnMv7EcAQi0Iz+tiphM5+fmaP08pB+MPDZgNOBUjVktDrDGBndhjHLfs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(261028144727099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(261022105027099003)(261026140227099003)(261022075727099003)(10067099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L9aeOxLtzw4B4N5fsYov9jy5Y8Oz3MmXjZOl6q79XXx4qHNoGlfb+MZm4WpC?=
 =?us-ascii?Q?/gBk7ZxUirGOAU0Mp4v/y/1EV/BjUb4W8elTTQ+3Y9h4S+S2mK7DpxVV5slF?=
 =?us-ascii?Q?dnT4yg4jh28cG3IgT0njwCxGJ4gNtZ3yP8e7SUlU0hBCrGUWwQVf/saIz12Q?=
 =?us-ascii?Q?F1Yz/EdKgovmMVI3bW5a4/Gw4Ka3y99Uh+rRK8R/obbNC56xXBUvsIYCpm0E?=
 =?us-ascii?Q?Jwz/vIeFUuX1LYX7tSfcaGY/wgJ8wrlBBxNbVZi40HP4Cqb/hv6YxAI+vVxj?=
 =?us-ascii?Q?uQ4yzOydZhW5gcZ41kd8RzTptGyqCVG2feKh20ccJOQzgnj+o8fODyZQBm21?=
 =?us-ascii?Q?aafmCF+uUL0WigZ3DNGTqsOsJfmgSWCR5MNVkzSR45x033TELDJPHb8XBzVi?=
 =?us-ascii?Q?efa97cNo8zMjSNHuSp3ndIUgMxU8ciMmgyC4D40U1UyY3bpigoX09X/Mslhv?=
 =?us-ascii?Q?nLDiivLWR7BuktBU2tHfJ7E3AWZEe3usmctU7B8EDGOKMOhiASAwBVDJq593?=
 =?us-ascii?Q?aIera3/xPjY5s9who9UJNL4hdZ0v5BbYoEMLdevBFgbs7hDuy112w0yGyX6s?=
 =?us-ascii?Q?bf1xvLx0uRTaYOb5hJonYe2hjTSIti09R+3WxzSppx8j8Xhl4tW5n4zkvATb?=
 =?us-ascii?Q?QSPXvNwNMevEfklWXr2jthcMQaY4/wTbRBaigy4Taqrp8CoY7vgIUjyxp6AV?=
 =?us-ascii?Q?TKb26nSP9DYt9/zonb2DCtairc8anmtPhp3c6CqbNVAeNVSusrzHwcI75ZTu?=
 =?us-ascii?Q?qHv/dZH3xWTxSCz8odugN/7KHyRONXKcazdPycUKWhGtGJ6qoSFkiSdcqRYg?=
 =?us-ascii?Q?T6fBDfTFfh/yR7BuKd2aAbynXROHVfKaiFabVFBazXeXP6+4mvKzuU7v1gPG?=
 =?us-ascii?Q?8PYvO7WyxTBCU/NG6MKd1mum7ZrLedFjDSszamtdpMlUeUpiG12OhYsYnhPO?=
 =?us-ascii?Q?/56k5uAMz/14UawHEIEKJ/yNgboxwOp+yw9iy3ODSZ6fHWO19Mdg0MPbCws+?=
 =?us-ascii?Q?+eVT7Z+Q/yanHb0WeffgnhUjEovZpjbir2+9fFPkI0slqNiWE08wzvCkc6nk?=
 =?us-ascii?Q?lB8uVA8Z5vJbCI84fV8XbWXRpafZ4Pg/bld35GoAVGS2pKwjc6zKBSMnlVYn?=
 =?us-ascii?Q?ZScWf9GUrm8S64ViUzfu2u38o0GUknzQSpkOM4LwzzQFdyDUQKj9gIaBegn2?=
 =?us-ascii?Q?tG4gyfDEfQOy/64onHMhrnSX4OU4acoJTGykPEwRUBY2KdLXar+xDjHFmwSG?=
 =?us-ascii?Q?KIwY9Y25qX+K4DHQDBVAf0f5jQLQbB+iBUZ7H8ALq/4pz5KnZfaXTZ61YFeG?=
 =?us-ascii?Q?1lxr+ZOw0FQKablfzxMNk8gVCKzgqOqyvf80UN5uVcORWH3Rz+8qClDzYo7e?=
 =?us-ascii?Q?s5+vbM6VnP5ieg2cRcB+YTZy/r1XjeqMFEEk1igmRD7sNfg67ZzKsTHCbVz7?=
 =?us-ascii?Q?O8+O67CciM7qIJZpdWFHNhAYO2cNhcCDiD5m1oEOQ6jy4yr+VVX+vSD/2j/9?=
 =?us-ascii?Q?EJHL0ih+8qrJqq9l9HQ/XjaFuJ8GuSgh8QuFFejodmawhh9t7NCj2LF/EDB6?=
 =?us-ascii?Q?V1c2d1g8CrQFt0puwzhL+zcigbyMY077ZT/DZrJniFE0FGveppmejUgHBX87?=
 =?us-ascii?Q?sKWHzgBBLmMfWPrIFaAy4R59X0YnGwWF7FcfXuzcbEVNWyaZ7qfMxfatshqg?=
 =?us-ascii?Q?xsMFJKPCU3NS3qhsYP42RDjinBLHJVegBeSaVuctAlsXf2Tf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d44916-730e-4206-741f-08df35f701b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 19:58:31.4553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDhs6AyRkpBFRcwJjlXUW/B89PYjUwRiBpZy4tic1UXo3pfy2H79Oyu7MpAfkOxk53PyBC8YBj6wxgrfYqTabg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243

On Thu, Oct 29, 2026 at 02:30:35PM +0000, Yingjie Wang wrote:
> devinet_conf_proc() marks tracked per-device IPv4 settings as explicitly
> configured after every write attempt. A rejected integer leaves the value
> unchanged but sets its state bit, so a later update to conf/default skips
> the device.
> 
> Zero-length writes and writes ignored because their file position is
> nonzero in strict sysctl mode have the same effect. proc_dointvec()
> returns success for both without parsing a value.
> 
> Use proc_dointvec_conv() with a converter that records successful integer
> conversion. Update inheritance state and run post-set handling only after
> both parsing and conversion succeed. The converter uses the same integer
> helpers as proc_dointvec(), and valid same-value writes continue to mark a
> setting as explicit.
> 
> The issue was reproduced with ordinary sysctl writes in fresh network
> namespaces, without kernel modification or error injection. On the base
> kernel, lo/arp_ignore remained 0 after default/arp_ignore was set to 1
> following invalid, blank, zero-byte, or strict nonzero-offset writes. With
> this change it inherited 1 in all four cases, while valid same-value and
> changed-value writes retained 0 and 2.
> 
> Fixes: 31be308541e9 ("[IPV4]: Add default config support after inetdev_init")
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>
> ---
>  net/ipv4/devinet.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)

Why is this interesting? Who is even hitting this? Blamed commit is
almost 20 years old.
