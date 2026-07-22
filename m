Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010007.outbound.protection.outlook.com [40.93.198.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018033937E;
	Wed, 22 Jul 2026 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720795; cv=fail; b=DL36+7UflM8qzpMPaCADX/eOX3AODaICBMAVILtG22GNiyQcDwugHAgT6RcGBb3AwBCk2LBiE4EJyvm0149lRWgHu9o2NCYveIN+bX//a6uYXwpSIFU+dGKgJUz3p91jTTE6HVLlytaEEFNshmaKB9vVkiW2IVYaIZ5hYnoOX6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720795; c=relaxed/simple;
	bh=qb8k/Ueq266HCHSXS+W7VaAVtTufO2Zqe0yLx9a97nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jj6UXGrnO8ttyVFZKkB+rn+Fy+aC9Bl7O1Y6JG20un3LMYWf2bvH5M7xcmZ/Szi7t7wusa/xEgyKgOuavlOX7DwFwBdtRJRRJF7MtJwIO9po/eotFaSjluvcLmgCY15FRJPJqcGvODwluOB9GTEzhuBMFY8Mgwe+tn3mxjCGGPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fnskFJj8; arc=fail smtp.client-ip=40.93.198.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fnskFJj8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uD0aRfdlJGUvNlSiXLORytfcQTiBofIBEBdMPHwWx/SYjagcIT+6suTkh2vl+vtPSbyRWg8YiUvZf8A5M7JEAXkUB/XqRnOPbJBjJIDqhxyDUcztp9Awmmct1oOI2izpKTwtincQEP05znjQn8wZTP5VQPLi1eJ/Vk8SORoLoyIJgSXtT4oYHs4kEKuS+qEXffOjwHhiYeb3JfRjltFYeNF/MZ26u63xEUSh19SByZuxOA4TncNZKHBmGRbk34xt6O7dukrqRlkOTSYRlpRDGg9N80wdnvDDa5g+xoi8174YiMyQsPM4C/W8urYZFMVPlcYQPtpUSBErwIsgsRQUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FliGQJA3WbglW6EuN8kh9fw88tZj1hBilJE9EoL/22Q=;
 b=mSjyW0eVQ/LzSrUTrWxVtyFPnKqlPpYbquVKkV87i4tXbjE8Y3ktpf25s1bwySHYHnJ9KgTpbTCoOOLyxv+q1xebyUbWsrFW51bjw9eCZNien6Su3YiKLht/yrB3aiA24wnp7p+bmAQawBluf4aBq2rc+Bsci7xJ31o85wGohPUOt/A5zfnIgKB/Gi3oB97JnNWaTwrKNamOveDz8gQ7w0XuIvpbt2/W7EaR1XHIvgoFqTcWogVPb1Dz7W6Ifxy/ZhV4IyU23GQie+XImD5qJ6Su/KBaBoPgMLkTw8ixnVxAaTLMn6fTltcxSARdT3bjaeMtJjCv8Rnw12QUNTBg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FliGQJA3WbglW6EuN8kh9fw88tZj1hBilJE9EoL/22Q=;
 b=fnskFJj8HV81Srs5jXV1KwbCKhdw7kMl90nz5jkScupZnkILKq1eahr08/pjHD+7jvD9NtC2LrxnRAhjeQbJlTfDirzT0Z4gYTAru3WfA5YHf67+2t7DcemCxkN3mzm+YqbM/edLsyzKvYUVJclsKdfMVStSTWvmyUMO0OJdl3Ks/5B2rWFHWmBU734egaojJXcBlWOAxVoNeflYyeqVvE5LYSlri5wQw/zpdjSffehs4TuLG7cdlexQdESDInRtYrikI6BwdDLz4B6SSgxv4WXEkSXRnZrRG/d7IAKEETDyQ+YMdG+2YVnEzawyvZoEuD9BjrzLpDB1YChaeFq8Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by DS7PR12MB8276.namprd12.prod.outlook.com (2603:10b6:8:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:46:30 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 11:46:30 +0000
Date: Wed, 22 Jul 2026 14:46:21 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>, dsahern@kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] net: nexthop: add NHA_FDB_PORT for fdb
 nexthops
Message-ID: <20260722114621.GA2928696@shredder>
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
 <20260721-b4-vxlan-fdb-port-v3-1-9aa0a543a78a@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-b4-vxlan-fdb-port-v3-1-9aa0a543a78a@gmail.com>
X-ClientProxiedBy: FR4P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::18) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|DS7PR12MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: d0093373-96a9-4e8c-5516-08dee7e6ded7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sJGjqNFR4GAXqxe0s29YltHJhm1WYHJFORcH1SRLYHmcfHwITaTak4W4tRQcZ4al1UO6aEUekMxJM4YQ5yrAGued5ws2HVCXYCjZb3qBoUxoL+UejLPsjoIiTSpTdijZ4GXeZh31wb2HCVyhQEZs9jbMeztBJGr3wo3lAmVcloYcxsxdwRb/uGdIjq0muU3Kw76r/nsYwtoTWHwIQMOTdWPkvTyntzwkZHowOt5zIy0dswWiywkg8seuRetTcVt/+Fs62VHIhGH1jF9hCB5ntDKynGE5jeNB1qvo+rHo66dBfNA8UjwwDVOJRg8IE60Q0yqfkgz/S+08YQccPnnVdHx+OOvMwgyExfhRJv2KCSfDrGLuHn8UhUBm6N5FDF3ecEsRA18vExfVqA1ecFM86izAhYttSvBJ40L2qfd70m9H/HDVPk3mnzDRGbtXzopd5VTP+CmYWRUN6WGxHiQp7tkS0fDgQT+p+zXG2IP1v4at8iF4Va6Ccf9ErwY/rfF8TObx3WIvp8gg2Qqusjl6pFkWgdzL88ds95SsASlga+sT/AF4XVSP4xGjYuSAOPmXTKPmKBXIYe9aUaP7MmapT4t9YP5pULOOQxtWtnnaJa/AJPm3rb4wFwjatjBYd1uC7X0p+yy1uBHYCG0+/H0+8PnAQfVKue9LVvESspj0NFs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P1Q6ibyIrQgkKqHIKBK3hG+4fUlMu0JyBkSZr1YFMza38ilHxbcJC2dWah42?=
 =?us-ascii?Q?EdRzw3P5ms2ilgKgs6cCMSCh9PYNzsG9JoN9rh5EO2DVHLfuRM5Z6/HTozWn?=
 =?us-ascii?Q?k/GIvZSfKYAdBXAnmKYPr6h3yjxNItmY4yyEIOJwJm0tWX8kI7nFkEDZ3ezp?=
 =?us-ascii?Q?v7RWlYNFWv0a36DyVMl4bhpjoggqITUREafqIE8DjLKe/uLfNpCjygmHKzKP?=
 =?us-ascii?Q?o3L8+pU1mPXwDFCfyId+NfRhpYp5L9NxGdY/eICqfmAEfrMw67FYWSqkBZDj?=
 =?us-ascii?Q?hEqTYaaePRnnzKyW8Bk/TO6S+hswNm/bCd1WIOiRqTi6/G+opaPnOvZRZYVZ?=
 =?us-ascii?Q?ajq3c/cRbVyTTCObDvn7/uoLNE9qudao/FYBY98zLsA45YtLj8cTZdBYHcJ3?=
 =?us-ascii?Q?IISSMu41GLNPU2KbvzjnWfKC+4IV1UJoKwN1wzXgVLdxLXKmrZa8LruZTI+i?=
 =?us-ascii?Q?SL1z0xwGe4N99C4qt8zXYecHfdPMYX3zruksbkO+pmCHbUlq28FykmqbGQ2C?=
 =?us-ascii?Q?UDnb6SoEFIrJCOkaZEFWPjJ4C7U4s/5Cl/0003Jxsfyn8GCnSSaSj+Xm6iBY?=
 =?us-ascii?Q?fhrPv0ditkBhWWvpvhBsQk+P8bnM9M/1FmNy5aljbJsDTcOlDiVjtXou3bwt?=
 =?us-ascii?Q?9vA3c3qMZf+ZkB9Gi1Cq9AuDMe8K4yCu0+4OuWZm2F/XYlM13/qjQmUnSYOK?=
 =?us-ascii?Q?9mVlpUpFucFCD8geg8MiDbMswB7wnpOry8LN1SUSg/UULDuGXmkRmImNNHof?=
 =?us-ascii?Q?dIOUkmucWjQ6hFsdgaPaF6Tt1LAj45dExW+4mufv0aWt9snYCtTXvpToJ0Qu?=
 =?us-ascii?Q?XmgfjwRBnjeUHRA0dwuzK5hrFy30VUK+Pw7FUej/i6qeO567csuLOCTCPGFb?=
 =?us-ascii?Q?UkJ/Zxx2qmb/j/VDe3FnHtR77FYJFXehtNK4tUCslmaZ/hRL9m1qypWQEYLN?=
 =?us-ascii?Q?YX03BN3tY/GhqTiQijma9Vj/dAp0iOig+dEs06hrs5gGPtrQSAe6g6TlOC79?=
 =?us-ascii?Q?3DMO19qMVAg94YX3m4OmuseQ0tvsFVs56VdsvIGY7UoM4Y4Qlc9s3fmsHYwa?=
 =?us-ascii?Q?PI9zavpSF/1XpeJluPHqLIi7vjoM9jNFBy9sNNVFnLrCdBcP/rNWHupvEsNy?=
 =?us-ascii?Q?Tc11AuFZ7ukdOKaFI73xhxLbSfvbkNgJ8eCtTUQGdJ6UvCca5w7MQX0i9RXT?=
 =?us-ascii?Q?j7xKqTBu5QpamSgvFdb+MzTw/I/rC6ABbLj+01hIn9mANrICv0D3aSuiZfGm?=
 =?us-ascii?Q?PhaiXqT05JMkSDgm0B0yzUwVfjD3Deg8tJ5fxR8B5P9d1BEsHQnE7Oi3YC7f?=
 =?us-ascii?Q?EsrCTRXCassSxub8W1Rk621oDGUwQ8FLnAPKUBIt1ZKN2gurFW5Yg7m4nuMg?=
 =?us-ascii?Q?EzlGYTeVSQIQ9KxgAu6WsQ0AS1KV99XKb30A3KYxJpoKUGqczXXO212ewvWD?=
 =?us-ascii?Q?LVGWD+FHnrzzu7Iqd0ZnTbO+0NcUO5N1AE/Vlgi29B883XIRUAq+vd1Tjiar?=
 =?us-ascii?Q?en2pu05mv597j+QfNiS+SO3gWFVHZKqSDbNPPoREF6GTeOHq70MnwSulpr7+?=
 =?us-ascii?Q?Ym6n923zobPxytEK/Nf1g+NAVeUcpuaw1k44V8okofP1S+AzaeviMk3HDRAr?=
 =?us-ascii?Q?3ukPw473QfrvxmTBR6YajZ2l8fIbDlUoJczU5NJ7TnhLj8RwgEgfuIp9pa9i?=
 =?us-ascii?Q?+IiKN8kryD7htCDe6/JMHIZ+3LbFrImgWIBYGVp29CWQHuo8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0093373-96a9-4e8c-5516-08dee7e6ded7
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:46:30.2644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jp5YJMGXEQoZOny//RLEUKAWAGkVt0tUwTAMCrpFBZqhNU1jJBiM5yY7AqcPi4CjZm3mChaEyUQ0/OWmxnuCUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8276

On Tue, Jul 21, 2026 at 10:29:50PM +0000, Jack Ma wrote:
> Commit 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries") lets a
> single inner MAC be reached through a group of remote VTEPs, with the
> kernel flow-hashing across the group members.  Each member carries its
> own remote IP, but the UDP destination port is always taken from the
> VXLAN device (vxlan->cfg.dst_port) and cannot be set per member.
> 
> Some deployments pack several receivers behind one underlay IP and tell
> them apart by UDP port, so they need a per-nexthop destination port to
> spread flows across (IP, port) tuples rather than IP alone.
> 
> Add a netlink attribute NHA_FDB_PORT (__be16, mirroring NDA_PORT) that
> carries an optional UDP destination port on an fdb nexthop.  It is only
> accepted together with NHA_FDB and NHA_GATEWAY; it is stored in struct
> nh_info and echoed back on dump.  This patch is control-plane plumbing
> only; the VXLAN datapath is wired up in a follow-up patch, so behaviour
> is unchanged for now.

I looked more closely at the test and the iproute2 patch and wanted to
comment that "port" seems too generic given that the attribute is
specific to FDB nexthops and called NHA_FDB_PORT. It made me think that
maybe we should use a more generic attribute name (e.g., NHA_DST_PORT)
and a corresponding "dst_port" keyword in iproute2. We can still limit
this to FDB nexthops during validation, but in the unlikely case that we
will need a destination port for other nexthops, we could just reuse
this attribute. It's not like we have NHA_FDB_GATEWAY.

David, WDYT?

> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>
> ---
>  include/net/nexthop.h        |  2 ++
>  include/uapi/linux/nexthop.h |  3 +++
>  net/ipv4/nexthop.c           | 20 +++++++++++++++++++-
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/nexthop.h b/include/net/nexthop.h
> index 572e69cda476..9c822799634f 100644
> --- a/include/net/nexthop.h
> +++ b/include/net/nexthop.h
> @@ -28,6 +28,7 @@ struct nh_config {
>  	u8		nh_protocol;
>  	u8		nh_blackhole;
>  	u8		nh_fdb;
> +	__be16		nh_fdb_port;

This will be nh_dst_port and similarly in other places throughout the
patchset

>  	u32		nh_flags;
>  
>  	int		nh_ifindex;
