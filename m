Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2263822B1;
	Thu, 23 Jul 2026 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792922; cv=fail; b=lZfpBiD7N4IQvQo7sYiszYVNfgnCukRYG4XMqkr5e24UvffkQc7Q7fZH21WHqTQFR4exanGHI0bxfG/2bihvIr4MOYrDfhnVqSNnumgb9GTceWT1JpuHkIRPhbqThUMGRbjfpbj24gAXocHBQSBDs0iS57oNHDZmUXPKNZJk63k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792922; c=relaxed/simple;
	bh=5gn9tc7EHObcCM0dTfdEi+cxnCWLGaNOzdKnHzkYa5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QvUvFKC05bSSox3oqK8XhD1JWTwSc6u+lnqji8gwt0V2Fi37+UZoHNhce03w3SpBpUwphFzR9fsQ3C3lYH0f8QzwnShaYlPAS339cLVbJBdj24MVsJz2t7K3z6QnlDA2MErAfdCgmuA/7N9kX8SUMeQwrGetdd3SEQNe1Kt/0k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mmu8gvV+; arc=fail smtp.client-ip=52.101.62.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mmu8gvV+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gf35OXbJ2he2BIBVzoxGvCspYdXKEj4ZktqKW+aDxBXYoQExSX55CAAmYkEgxPKNamPYt7h4FH4Gzi3XSQO1ZwzMqiS1glTgai38NAqR0xW+rxCi5aW7Z7Bo/aYby41EWBnRdwtHWQnVHRWE5pL2Y7BJl4GQz2reXhVSuDDwefQ3Qqh4FDGjx+cFyQ3K0R03z7jUlFMGQJCeVBDSYYwgNfwWC3HaBwk0ycaAHrTSe2egW0z0DJb7aNRQaI2+4uu9caFaQpJYFnS9lYb+8VBvCIqp1mLryiK32WAvelRDlaza6r2h8Fy0ED/tzxsHYf2uUHKxka8ob2b/AIn4catNpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nCHDPDbzvaJxV6VyaQVia37FKLfYzdj8W/xICKaRu4=;
 b=rhM+YaA7WbrPuecYeKGdldVSqpFu4gPjbWF+M37PCaPXUlrnrBVRu7A5vL1SollU13LuyzuMfHL5LJK9f1/ETAGHreHPfEgO13z5amN8iygmtVS+ErqL8Lk0n2QJndsqyNgZQR7BDL6c1Fce4zOrpt09OfH5Eu6sMKewwy6CvxLwE0PJA9xRvC7MpjxnoY/e4oR5WH1D32TCzrlR8MMiNDVQzlSXKD2X4FJW1Fiu0Eyzpp+XdJYk49lAYimWW7YQgnpzs2ip4h0KdKCZjy2v8ujt5g8MA58u3pQWA9FPh9dxGx7hozB6GDQ9ayEBFDkL/glLGDrW9R5/DER1I9xSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nCHDPDbzvaJxV6VyaQVia37FKLfYzdj8W/xICKaRu4=;
 b=Mmu8gvV+RMr1YQdT3Jx5/Bw3xkA2LQQIx8ghW661YBO9Z059Zuzp+1rGwt6iz/xR0TdSyiM48QmwHCr9Q/feEQTIZfnOIQaFCXk0WBEhE7f+PfcZjYBMO5MsYiEQ2/60MBx4Dv6rToD4BgcVr/Pp0WfXjppJdzsatW6keQ9+PRH3LUXm33tcHFDgfvKuhQWYSoQVlt8scfrRgAnTb/FT6pGOOKoxY4UOKW8LSIEHcqpCSaVGUXHqxs1CjD9vAEXAb0ZNTrljYH3JHqruiXUEP4G02Hcjs9SaK9B539OROt7zg/XlXMi9MiDVOs6kTLZrQucmH4P0rMoIzNlXW6/94Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 07:48:33 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:48:33 +0000
Date: Thu, 23 Jul 2026 10:48:24 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/3] net: nexthop: add NHA_DST_PORT for fdb
 nexthops
Message-ID: <20260723074824.GA3189375@shredder>
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
 <20260723-b4-vxlan-fdb-port-v4-1-46e3a2dd88a3@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-1-46e3a2dd88a3@gmail.com>
X-ClientProxiedBy: FR4P281CA0299.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::10) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|SJ0PR12MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 74969726-d1b6-4e06-d20d-08dee88ecbca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|6133799003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M0Ke7r9/d1HaEehanxE9M9V75OgnDIxlkK41WcraZ2pyudjhaq8CgFyJGyXEmVU/Cx/NFZbvBr95eBMhNt/sCcWnQ65z4G3wUkvvISW1VC1+pNv/OSF0npdGIgxDkvMYW7eCe/WJmHymuyUnyeAHhE/MlKkcpPTBJSD0MnlxRLtKnYAeZ3cCmgExh/5zd7WflLuL5CudVjV8adrUnr+UyLgTRP8WnctGi3Dm35rmhbEv/AH48/pg7Y3oySDduBlMmmTXnHMhBr4CRYGhlk41H1rcqvehm4mNyccA9bQaAMM7nb+X1AjQjrW5SaSsVWIvdeZgCUaTXxAOuRH8WWtOr6E/xKzLhvSj2XRN0UbMns4vtwiYktYHhRQ1YvinD9V0Y5sedYuhkeEACgfGBBD+LLJAIUQWR4H83046BZs4eZ4eJRQmTzNbhKkuwKBXO5ftTTOes6Bm7HmJ6I9g721jLLxoh/oVYbR6fiaeiVT899Vx54KvHJs33efje3KFbGuLejY7fSQTkq0lWk863ZF52xjNPDeqi3bcn+X7pjk8S4/6oX7ogjBgHPPcAPiX1wmzJ7DPHuAGQAVx1jda+TJkUgwQXKYcS+EoCRsPLh19cuhD3vX0ta4tHvj8akhH2zAdkHXwkFCiB6s6OrKhqXz1r80QottolFGAhp9prPbtktk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SVYJvtVDA8FlxvYiYJNNOgxAl9aULQMpWYkA3ggnAtNvY+BzLj6wl4CcRCO1?=
 =?us-ascii?Q?r9tL2k3tdM4QnbHU0TMa7G3VUU5fBE46usdr6Usv3TAS70C5sH7E1y5SvhJu?=
 =?us-ascii?Q?0iUkYu6+mfAlFRzDvWsm+kRGGBLDphiN3CQEvGDcwrt0yzr9bRKedzky3o1j?=
 =?us-ascii?Q?a0h96YJO4wwi51D0bQJ4kmLR2YDBtQCRplS4aZtce9O7JkSRNDQAtEMsah37?=
 =?us-ascii?Q?QemrEaRbtQ7HuqW6EtXUEjw5a4o0LNaa+dkJf51cgytm+5klOZaB041q6QPy?=
 =?us-ascii?Q?K+YtuLbobkhBC7N64zofHyRLuAugQpf2U12PZglSToIWP7+BJT7s8ga/afVp?=
 =?us-ascii?Q?q2E9839Qu3Xjhlepsed+AkZ3K8k4/Y7dELUXit4jftXRvOc/MCFdoI/2T5Z4?=
 =?us-ascii?Q?4gGCCRgb7bO1Q3a7faRVHkXxo+OcihJ4J99KHJx9k5GXNr0VFYpClkZNKZIg?=
 =?us-ascii?Q?OuixV8kgTexE4mV+g28vIuhXnX7UdAF8BZ6J1PLQGwNfGL0hzsx/CbAg4HaH?=
 =?us-ascii?Q?oWckcPjBa/DbLQwtQFh+LQuZEKdUt2KW5nlm1MK4Y399rGfVG+HegdqYahTC?=
 =?us-ascii?Q?WvHU5dwzJ4CIrm3aGXf+mklTjbGf0l+cn9EA10jskMZK+aGPttHioCUpctdY?=
 =?us-ascii?Q?y6UVIMLHL//kc0NaqicIYIqSvBwx5ayQEBKtJZLfTAxM0wNWQzXG1z/lXqd8?=
 =?us-ascii?Q?/+gSlpUNUTSVfoQaloFHmx5HUKsxrAq9dUENk6L3Bt3RJs972LPuajR0nALc?=
 =?us-ascii?Q?Ckc2OIfM0D9HWnX+ssvpYqvM6l0WhUv+IB229Y9pvX9j6yhT/VMWQYBTFqzc?=
 =?us-ascii?Q?vf4y/KnYeNnKRTOtpKVcAg6mSxm6m6i2xH9azOR56bs0plKJplrirJLOQTt+?=
 =?us-ascii?Q?Mi/4YDGkvy93qnXYfMOuFm2e0wmN7OWhNBhp4SCU95zgylgPuiUb7XiiFTXf?=
 =?us-ascii?Q?BB4H5eD/37nbIDnACTZHpEoodZY68Nef7vDDnIfak3gwa13TXYmn+kMXk69q?=
 =?us-ascii?Q?FLoMkJsFVc3roluHUF0H8Y081WFRkVdpKC61Y67qRXgR8qCOUwXegm5MXpiU?=
 =?us-ascii?Q?IaLf/J4NAYYUn4yksB6ofhr5tn16TUWaPUyacYeHjU2U2VVnKyvpKfH+n2aO?=
 =?us-ascii?Q?oyHM6cNy2U/iHOr3AKEYlmtcsWbQG+AFr5dymfC3WmsueCgn5Sb9tR2RVxZh?=
 =?us-ascii?Q?wf1umeGMNbFipTqZBRP/MhD6ANWZPewRGujO3lm12o6LT2qgtxd8a2emocF5?=
 =?us-ascii?Q?4SozHzziyY5wKvA0v08cAUSuuNHnRmEIPNj56eR2X1SHIZW+egOX3Q9JDqIy?=
 =?us-ascii?Q?9CFIBj2DbNZOVWJ7wlJ80FC/MbslOq21tDJpP2IGQqfGmiLKuN977qR+cjeu?=
 =?us-ascii?Q?7zl1dRcZgULff5fQr2VqquX8aWgPV5S5cALWeItXnxrUT0wllvL7lX1BFOlg?=
 =?us-ascii?Q?1KUM+Lz6Jn9WC7lt/JadayZ/VmgATrnPj5DeqCeX3y8Ia6sQ3ZQ6OBKKASGz?=
 =?us-ascii?Q?qzQkGPVQAYk90QbsS3+pLGGbTg5y2OYE0fiOAUfRK7vk8pDpiUFWh6yyC5bl?=
 =?us-ascii?Q?YW2KYdrokSGcXyqNSY1+p6DWHIQubtVrhKfsNHA6/Hl6Bw9Qx1uT88fRKMY6?=
 =?us-ascii?Q?jq5Gp5I+EFffOZbWPvzalmJpjVNgTWUTJoUGaqsSwkhuY2robaANEWOhEHBV?=
 =?us-ascii?Q?iB39ZWdKypRGxEeEx/hak1uHVYSGOMt3TQtRMmNDoYhbc6oi5YfwiDjkFt0i?=
 =?us-ascii?Q?GKefUpIUlg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74969726-d1b6-4e06-d20d-08dee88ecbca
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:48:33.7859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMapklPoBv2di74I7KcGxweQSxaPNdZf1EXagGAO5m5FMkSJfk6WOVmm8Ciy/kDVimcc4vd3hNPV2D0WStxwIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8614

On Thu, Jul 23, 2026 at 01:17:53AM +0000, Jack Ma wrote:
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
> Add a netlink attribute NHA_DST_PORT (__be16, mirroring NDA_PORT) that
> carries an optional UDP destination port on an fdb nexthop.  It is only
> accepted together with NHA_FDB and NHA_GATEWAY; it is stored in struct
> nh_info and echoed back on dump.  The attribute is named generically
> rather than fdb-specific so it can be reused should another nexthop type
> ever need a destination port.  This patch is control-plane plumbing
> only; the VXLAN datapath is wired up in a follow-up patch, so behaviour
> is unchanged for now.
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
