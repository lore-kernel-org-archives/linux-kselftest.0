Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010013.outbound.protection.outlook.com [52.101.193.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBD3E7BCC;
	Thu, 23 Jul 2026 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792943; cv=fail; b=PYu16x6TVgXjzFFmVHR3qu6U4xRFuAf9PPNRtvDr2dgBkv5w/4WBmlerHGKxfor6NfH/0ofTQsdesT37m5zWy6fXPiIKTZYNwRBlsqwL9PcwrHYu8vGAzVfhKJuSc81V9ryHVatx+e2pE1nqkgEzFLfkaDLeL+jlfh/q/6tW9Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792943; c=relaxed/simple;
	bh=fiS5vr9AooMn1/mq/TZvi7PMrsfF8HwQv23DrO4qhKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GLdYoE/mNGD/zirigylhcyI7wn7smpqDSsOSdPqtIGNvtvsFgA9wuBBR/GTenkhPw6bO41ryZtLFUNn0mdRRSJqjQ3FppdcHnLg4Te23UPQhpb4e/zlKLRd+m0YVkQGQCajgIvzcYm5oSeyyWN2t/CTYeOazkCIB58QsUvYM5lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FBALiJ9x; arc=fail smtp.client-ip=52.101.193.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FBALiJ9x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvVMEUKJfZ4+stkUGiUGeFgYkdPAsUVn/8QRUtfVDWnZXdvOX/WevGBm3s+muDsHkjNvwy+6NNYmPhiuNzvPJPkCGeRBcWAOulfnOWYeBrXRJxY9LnL+K+Dk1vxQHPuwGanwwwl3uhBm6ZZUG1rZGklggcJY4ijxvFnADjFybaz2Bmn5xHHPlKnPvHEbd5TDuPdYhvsqH0pvh2RjuVg2AnOd5MOuXgX/clyjLfYO8n0HNvb9QCT7qczAOaFb4AR/zUsghXKJOb9/Bsmn7u/GcTI4FoMDlaAv3gPI1hI+/PFDJGweyEiNDkLOZak5Mb5vWNR9rj02Vh+f244zQILfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TpWrtlYpMlAQU16aRBKWvQ+m9w2c9Jl4xQXWEFb8ec=;
 b=LPFwVckUkI5bxqlBwVbHeTiTMsb57zkgWzHzBS/VNWZ3V46r2wuuQVJ9TTpCEah9Se3uJ4Cp0St2NxTKgLtAa22DR83bV99s/gUzOirEy743wZIl8V3cW05R3FuiqqKM0dMdUMSbUbrIfxI4h584aV2TjY+tBtZECSsBe2N8Vwnintuw69/4zI4F4kkCSC8kkgSrdv+FHpmvboKFf5lnz7AIkItotVqWILut1wehz2m1rHn08S1UhpBCljkSgqaJcq8SetqicqpDoNUjVhrPc2iKcn7hOUSdrQi8WIZR0yjh5fAwTyKnKZZ0VvASi22EtlOeEPi5eBpGBJpkak5D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TpWrtlYpMlAQU16aRBKWvQ+m9w2c9Jl4xQXWEFb8ec=;
 b=FBALiJ9x1lokUrW+R4sl/r/lOUs8Og/8OLw+T1T/6zs/RU7VxIA9n3KsMk3dQFKRqGZpvHZadxOcKjVEKnJHuJOBnxdqn6bA3sCo8AwhRpL4sPYy0adTrXIqxYlH58FSb7m7H/BgZHi/Guyh9MfITh44TOWMcRIPv4dbgJ5/i3mBIedT9Sk5MT9o2DKa3hCzmjpSt0BJwH8fv0hTBoRUZ3pDcQ0TtmG2y+O+RaaIT8vGjOA29EwF4XYbz0vPBXF/YWJTRYjvnKYuXwAPQ4iP7G0ilhtOln9I+23+W375YOuSmCPGvTEzA/l+q10aO3SvDHBDi/YMKVHTgTjlSrM+TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 07:48:59 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:48:59 +0000
Date: Thu, 23 Jul 2026 10:48:49 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/3] vxlan: honor per-nexthop fdb destination
 port
Message-ID: <20260723074849.GB3189375@shredder>
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
 <20260723-b4-vxlan-fdb-port-v4-2-46e3a2dd88a3@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-2-46e3a2dd88a3@gmail.com>
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|SJ0PR12MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 142b5950-19e3-43b6-f2ab-08dee88edb15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GUNh76frchWs/AX/f9AhyKjTD3VywOokrWf9e0u+N746+ubc2eQF/KfV8HDWZf/qwnWMngQtkty41GvprcmdRw/Ln2Dvk3MagnBfVkpvjvkWwpP4byNQHIMT06dxvhctOi7fcmXsGz/AHDR1bRwFr2IUKj11Uhr+0IT2tQXl3NR8AS48JZt2VM5LcDa4JkfFtwg0SKSS3/fQqmGgPuCCYy4yGmpB7ret/UCu+sT3V4qqa/GboD18ztN+DsMVcqVSKRig03V1uszioZyJrD4TCxejLzE1Stga4bd/uSLwM7wc+rRFu3q8ZPpbBOuambCEu0d1v5juk6noVLA/gh5fawShBz4Cn5ZPzZoHvsJBsv3UMlDNf6cIEVTyBJveEkgFf5yUI8bc6GRKdX8Qz0rsXfYNLcf5O+M5YFMGBQyBqXOQKY4fEFogZ6/B2vJHUCFRPUSz8vOAYF980A7A+B2JcgQfHyYTilDDfc6IFPr7wMGdIhhzeOv37+HpDBTYkHDMvmfmYDqdKDPlJ+J4MQAxBqVfxS+NilHgLHygRVvQjKO2m4FNvlclVTNn0VIfc30JEF0wErVi5ActcTmIXGLLhZh5SqH0ggCn2d4WOa6ATxU29zAI0fSLhJvqoNmurcGbNKDkle3semGNGm44JzDdTAK7uVhYLXafheKWVS8M0iY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZeW+cfBbqSekYqW5A6F6yUgBFLNSNmm5ztKzuNiJrZli8ar1X9JDCXZRUeXW?=
 =?us-ascii?Q?5DEGsy8ytpKOWpBCIPi4HDh8xr6WDQG/ioGx/K2vlyeZZj6C6ynXAtU1t2qX?=
 =?us-ascii?Q?v+NOlNrin1hPV2TrYkYSJj19cQtmWuIKpDFQzyZoN/o5OQ9G7V1BCGIZDxfu?=
 =?us-ascii?Q?91LH4BIsePtTritwmmONcRfGa6XmLa7UB7uTCQWuggHW/DMJpwRTp5R+N0ME?=
 =?us-ascii?Q?uagptGYIDMUFJy9p9rNRZ+hAfcNHNJrg+O8l5vEfUznNYvZP/I2GUbe7N2gY?=
 =?us-ascii?Q?s3iamvpgKcnix7U0Ga5ZraEWSwLsDCPYB944/lh6qjfIsolC2Vguj+8exd1R?=
 =?us-ascii?Q?+4rLW6/hnjiqB++s8vnTsjTPX1JQj7LbVUcgiK+PlLJ+mfS7XQ+t/axoCaYA?=
 =?us-ascii?Q?EK1c2UIySferKn+UHtGW/KQP2kd65srZ9KZeMHK6XUNvpln4opGpkgUMWwl0?=
 =?us-ascii?Q?QLWw6T41dR8CNxBsPG/mAg5ZLe4bfueUaxpRpVRDtDnhya8TBuiTmvRDPwmW?=
 =?us-ascii?Q?WamyvlGR8ygzy3EXf9S44TM81IJH2I598xflX73DeR+bue9TjK3xy8HkmmOy?=
 =?us-ascii?Q?+vDnmreRjMWwowRbSl6qguYA9ldKVAXVMy/41ncH6NJqgzatpXvsZ67SrisS?=
 =?us-ascii?Q?qfG4emMtd8rYokY4pOWh12pLMvEuTgHyPYE07brRuyw5FwxisCe12eKSMsOd?=
 =?us-ascii?Q?ruwCODxjP4dy9E/000kgXghRbEo78+vkBOOTWq1pQmJJr6tcYuNRDFa2AkMI?=
 =?us-ascii?Q?fP0z9TUM25uNEymk9q4A9UG9w0AEBNZqyy/UP0sXSR4qP9GKSAU/txvy8l5u?=
 =?us-ascii?Q?dCnzf8r4ztpLemfhGN0jOTUt3sFM4n9QOyUHlRtHgPaJnul0tLu1x3OkVSSw?=
 =?us-ascii?Q?0bNCQuAJlbqpwop5xt2+M35aCplfbXBKSCQHv3uvolugEKsNxIRTQh1Ctv86?=
 =?us-ascii?Q?+wR5RXegQXb10UrvJ42xtWJnwI976+nqI1o1fRc1FpYoIRjy52CA2cYPHWPm?=
 =?us-ascii?Q?GeGDqtyIxxxzU7nfHNn0t220dtSa8INJW93m1PjzdWQ2PcagLWngR1U0eNSM?=
 =?us-ascii?Q?aUwZuG8L5ODxTBKprlwwrWAG1/WAJO0XL3Y0ibMj7gJMsM4P9UdlqkeesJz/?=
 =?us-ascii?Q?X6Gt5jZCmvPW/NA9Re7EqtApMmolFQifF8Hp7qVKJTkU4SO4SNmCb/INamP9?=
 =?us-ascii?Q?i9aa7UeyIXFZxBZF9i5dBGHcyBdJeQFPiBAJZZ5WzZPYNnxnuYPntHfaqqVJ?=
 =?us-ascii?Q?zncb0jqpFMyPAZDIXCOaXHsZRcgG5LCE8npDDpPQnQObDUglwPkm3CPnXLhx?=
 =?us-ascii?Q?E34bIs8A0stzwMGbshMcji5IA2f5zv9trnvrnuKERZXcK66d5xFkjBGOVFNG?=
 =?us-ascii?Q?kJ3ThGwBhQxDcvzvtfRv7iyu6fC/wOx8iEZaix14fLOzNecUuw86BP0Md9vr?=
 =?us-ascii?Q?UrP97jyXpGBXBUT617reHit3czyXKol4+eO3xligUDBMO8UxuDYGymCMtMcO?=
 =?us-ascii?Q?0G6uTGzGceKFz3cjnwsTp0EUYjYNtXqHsxZc17i31iema/VrT6jXVrpEdZ5D?=
 =?us-ascii?Q?1mZE4GXWasPr6nf36gR/wlTu86s2fb9RbC/FcavUhFUTe8u0XHgTIMdq9hnQ?=
 =?us-ascii?Q?0RHgoA+46e2OjGgTQn9Z32muX223LkQa9D32B6C/H56qfWMCFktqM6AU9Oj7?=
 =?us-ascii?Q?6vKumOK8yvjMarhwVjpjPBMn5VXBU4SpLfQ0GJr6uc1289AGsY2uKRF306bw?=
 =?us-ascii?Q?Q5gs3e4c6A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142b5950-19e3-43b6-f2ab-08dee88edb15
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:48:59.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3+lsVIuZVI7fuk87g4FSUH+eh8u4UPQ8aIGf4qBz0/l1WenLKSZ9U9aIagWzFHMggcExW90qqOaBJUUrrAhbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8614

On Thu, Jul 23, 2026 at 01:17:54AM +0000, Jack Ma wrote:
> When an fdb entry points at a nexthop group, vxlan_fdb_nh_path_select()
> resolves the selected leg's remote IP but leaves the UDP destination port
> at the device default (vxlan->cfg.dst_port).
> 
> Extend nexthop_path_fdb_result() to also return the selected nexthop's
> NHA_DST_PORT (0 when unset) and have vxlan_fdb_nh_path_select() store it
> in rdst->remote_port.  vxlan_xmit_one() already prefers rdst->remote_port
> when non-zero and falls back to the device port otherwise, so nexthops
> without a port are unaffected.
> 
> This lets one fdb nexthop group load-balance a flow across legs that
> share an underlay IP but differ in UDP destination port.
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
