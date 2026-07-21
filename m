Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641D64DB553;
	Tue, 21 Jul 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647078; cv=fail; b=jYdTuxqcj1xlyNW/HeaiUvRjwZPRPIhxOmibOrYnv6CZsM10vCLCPqAyanB3cI4DPbdfOmgkrJs7IzNc78AI+C+cQi+fa/wEgJYCZamlRuNhO2A9fRmLm5vbwpTshVNMiECmmbkUhsaxKN3kFfjH/SumZjZ2CLvCbON0ObXE/Vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647078; c=relaxed/simple;
	bh=cmN+McrRiDpOiySvP2MU8nay92Of6Uy+qXp9jtT0Avc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nzyd+XDAycoduFXbrrZRsoluOw0up7h026BL6JFVDnPw3ukNfs+9yWlwBKGPhmalebknOR4hiJXPGQDF9PVl6H+b/zYrUC6Ip6pZ+fl2dCWtF25IWb7kuhXwKI/7pRWD79xVI/WN/JU2992F28TDfjOR+cAQRRYeo5/414squoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lZK5NM6s; arc=fail smtp.client-ip=40.93.195.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lZK5NM6s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FELx79X291At2LL1a53pK2EEzNWekuLKCTxauQ5MFiM016EGbZQbF54GgJNkIfjjQX68S7G/oLXnnaFSlOZ/ugPd4JSmxOc7DPMXnJuY2e0BuDEODEP10SxOfe8Vz0DjY2T4ygKDrds4xckx+S7zoIpzK7eS1+40wErgU7qggadS90WIJBRKnmATVO2lSf6l3H6tkmilkCgbCITGU0DcUaiYd0Zz6rXcFSYJufJK3Qvf1XfoExtAhhiuqXbJgk6vEy5OsXXXFtzQ8S3x6djwu+CUcT9oiVW1p3Khaj1CLh+0VXVI0sJ+YW0UrA86nXxrFwIkbMJCrmf9DK36Z0pgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcHjWuUXXs/sIhHKnwyPKafA6ASYNsldinX00ydIIX0=;
 b=OhqUrZGwEAYTvshPcqexxbtFKlvgdkNz1COZ/0VYG5fJd7hjz2bGTWGrBYeXIeTiuQkWpK/uR11wntEwaX5dnjh1DkGHKt2rs6B93BsDfwnRjSeUITY8fFPVy+dBxUIjDqIi6WKsYyUjC/vWWuXMulDsOzTb2Z7pv5wd3jbbCYu4YqmW3WqmNR3fD6U61/7pOGGSoCCBPPCWQSSKH9c2x2mUYtOHjgIp0sOKzaOVfpN1OD9kcEA7r/L9n4IveqE2Psq6nRI2B45/Y3Dkr2hmbA7pexnOUvlRyUWhMEKDEBL0bbRyBW7LNH8YNVwieLzRlsW00QJgVdYzfDgkywly1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcHjWuUXXs/sIhHKnwyPKafA6ASYNsldinX00ydIIX0=;
 b=lZK5NM6st7Nnpfnzi1e59Uem2RIyEY+YSU3SEUNe8JxzsOpexWynZRi/52LIHJDSWOrHE9CHwQSdR7vZTX41TGGke2GfEe54As6S772/NGtRcqgdQjCtYTyL9x89/OgU+4nAwg6G2B/lGSv1Uy33EHRzrJNCC5Bo4cc7iFf2rR4pKRjIbkZU6hql/j5VeD2UobT9Q9wxyULq1VbcPHyHtw/edlRhClFXTVq2deEwms9wv4a9OKrQEDVVTjlIhXysOPSnBGolfYviAcHTa7wu+50pH6fMRCMhIqXiAdjKv5O1gjReMsKy0zjyidClzuc8IeBhcXl0LQFX48dEz4xcRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Tue, 21 Jul
 2026 15:17:52 +0000
Received: from DS0PR12MB7900.namprd12.prod.outlook.com
 ([fe80::3033:67fc:3646:c62f]) by DS0PR12MB7900.namprd12.prod.outlook.com
 ([fe80::3033:67fc:3646:c62f%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 15:17:51 +0000
Date: Tue, 21 Jul 2026 18:17:41 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] net: nexthop: add NHA_FDB_PORT for fdb
 nexthops
Message-ID: <20260721151741.GA2667735@shredder>
References: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com>
 <20260717-b4-vxlan-fdb-port-v2-1-f4862e8fe867@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-vxlan-fdb-port-v2-1-f4862e8fe867@gmail.com>
X-ClientProxiedBy: FR2P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::14) To DS0PR12MB7900.namprd12.prod.outlook.com
 (2603:10b6:8:14e::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7900:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c99d0e3-bdf3-410f-c08e-08dee73b3afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|22082099003|18002099003|6133799003|56012099006|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	detrj9LP6wkLIGQQ+xcSm87iqOOKh9yNVmWlzEcYwHv47fwTMB3azO/X1mpwKYHMC+ZzYGtPdAmsgZ70cCvvGtQ/Y1o314DfNCOcXIUZox12URjQBw82jA/yOEfDfeAvd0reSVOSUoRXeFYsIK+Xc48gV9dtRw47/uE5fKTnKvmyWG8UIYKgQDumDz5X++Mr9fhpAJdGuoTiS1bO4DlqjVHZbGRnP73u/KChUUToOKYVKeCOfS/mIHvZpxMZIYZDdnYVtEC9b9GH42nVD3DQ4kb72boX5whPgHL7OgF99qlNBL8x2OKiS06D+FOzzqhyjFLeTjFz2kav9NlzJ/Vm9Vxhl0s5jlJSbAdwPsXvuqLchNUXG3VVG0KN+vMtl2ZdsTX+WvOFNt/EOq8KA+vREPmDPMHTLTLKmjHlf4/MUoh8FsvM3yfaK4oaOQO8Ov1wCb6mUYtr/6QKTX9L69Q13zBrq+1HEwH+4TaKHakn4HOWKnRt1ZiAkEQekLnm8+IFmz6MNX/ZrWLsuyoa/u3WFBgVHlMZmfE/hVD4qXYOVBEuOf7P9ZqKFV8iqkcGDp5+nJx8ymNH0bac6XGJRq0tJAULUXAE34hZvusuW2zUjkRouG868hAC4dr186rmyAKtItQ8ax9Q0+QZ1lZpPiRlU77MXK6d9izUkdLkIm5D7t4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7900.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N160Eg202ZtWNoXVDpr6iOIoj0svCYszaRQ0Dh2/eNHCYuEIbCDYxAha9fhR?=
 =?us-ascii?Q?YLmiilumYElXm/rbTqqxs+zD2dew+Zc6SLndISWzk0u3EfT0M2U6ceL9xhBr?=
 =?us-ascii?Q?ifdSmN6HBv8pFWN1P3pfQ31qNXQ8W3IGTvTza0dnkPrzv/84bdGQC0eZlM63?=
 =?us-ascii?Q?1KPkP3c2fV+q8M+kYxgPWTaGMCjM7UWg+AZ81Vg1Y1As6bFsku9t57AF4bWE?=
 =?us-ascii?Q?fBhdSkE7qptfdb4A3OzYxTGUmoxZ1QGIf5/YeJV8bFZOdr2rTffsAWja54rt?=
 =?us-ascii?Q?CqpO7Dtk+UOuNVzvOvgTN2vGZChiWVgOyuEMSv7hwlFdDpjksfCtH5382mdA?=
 =?us-ascii?Q?FB08wL876rqd9cZKGDZ6DyxY9dfnMr5pyY+hyFETWl5RmKMdh5S1p4H8rRra?=
 =?us-ascii?Q?ai3vAKgA3iXzBL9Ph5/o/L6X1WbCvlQRBvIR2BXoo/d2ZeVptuDPRWb6DUpP?=
 =?us-ascii?Q?MhLqi4O5cr5/wI5dgiXNmr42ADEG2JRiPkvL7jLW8gG1YNxrWVJMyCF5mhOM?=
 =?us-ascii?Q?FzVmN11TX5cREwSdH1plsqoahM3EaTk0PrMKWPE1cSEedYRCfzyFLQedx3mt?=
 =?us-ascii?Q?KCMcW4sitdTnwS/E+7eKbnQi9+/cQ1r7NrXJBi3gfgzKIsSJce3TtOymFlt1?=
 =?us-ascii?Q?mSrkJOF5WD1BXzA2xOzOIuEn96oiCbtFjdOhGtS8Lng6hpAdsBRZNX/8LxAi?=
 =?us-ascii?Q?0146dqR4fIouP7Mb8DWt/jaO+ilISPl9wP9+IOeCxaZrUxrv3nkgd78u825Y?=
 =?us-ascii?Q?ZeSjh5FhMpe+6ln5WYZVkJ8Ysm0+6pVWGtk9qTCi+LHPNxayFh5uMyDNx7lk?=
 =?us-ascii?Q?+H8/O7ciDjPEf3rFP9lp1N8+6DI3x8Vj0rTNafUVjK5CYZUaYhabkJyAwYD1?=
 =?us-ascii?Q?F/sb2ArIsEgqsTD1285BCPBkt4ACLt+aaXzJSUj6CsXtEEN6VJfciyfugnW0?=
 =?us-ascii?Q?OePuafiIRhkEVSC23ev8r4MdHl2bIRWRJ8ORBr78LHA9NfmqycRQ4OIGzUPr?=
 =?us-ascii?Q?yUNrSWFM0koh3mRolKPQdVRlsdK/AZYFnIQmPsxudAMgjP3HydxW3JMea5ZR?=
 =?us-ascii?Q?IsaIee9x45m15+lqrw5ZP2LiKAP4m9937fRkWhvWyAO/HjeqkN3t0/QBQS0B?=
 =?us-ascii?Q?fHtTUZQpNW2SqID2v/QshKJRkTlZrrUCpCBoWUeg80K6prAUCvI9n35+m+S5?=
 =?us-ascii?Q?6QbDcLxqVprocrxtUMGxdfr8wVt0r+zSbziaGXueBNXk+4azrsqScj3AT9gt?=
 =?us-ascii?Q?n7S1LZwtLlteGO899V6y8Gbrf5s0TVnFuK5+Frl3LfJ+7Z4uN2HPbRscFbsT?=
 =?us-ascii?Q?TF81tlKdksghQc6CwMAONo5cJnvi7krEPtuN0T3bAz2nRiRWzv+7BQl+ol3Q?=
 =?us-ascii?Q?Hy7r5fIdVm5BtJl2Uqw+mVFVJjw2cKCfKZovAFTZ9AOc0RP8me/MXozTSPJI?=
 =?us-ascii?Q?oQTd6uNk+dJxS3agRsxpRrDjdEvPLhEJ+xv+pIwESFGal9ycyGiZ0L1erKD2?=
 =?us-ascii?Q?27mo/laAAv/G5+G/j450WCUdqsVbihBaoFUe/Y/gZxDalRXucNi0xvup7VDG?=
 =?us-ascii?Q?6vmhw3EWWNs55cRTcecIfYmBwHQFv1uP831sEfHiTpiY0EY++Woq9Pkk/qwJ?=
 =?us-ascii?Q?5P9HPVJumeE/xIUx/D1dqvJxs9tOZ5oKxFtBpbqNUPiikMpy9Kaj9tpyq+l9?=
 =?us-ascii?Q?dmS5EA/nVbiOHLsyI5IGWL+L6xyBkbLWwG5LSW2B8WDnXTxDxWUgO34jgXSF?=
 =?us-ascii?Q?zWSjEd3krw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c99d0e3-bdf3-410f-c08e-08dee73b3afe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7900.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 15:17:51.5290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2neIjbfBAmyzjqaIJj5ycMcEkr1ivjReGcmQ49qBxscMuRAxBLKoORTj9GZtiHykCuSqGc2Gqwh46i50875+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447

On Fri, Jul 17, 2026 at 06:45:16AM +0000, Jack Ma wrote:
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
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>
> ---
>  include/net/nexthop.h        |  2 ++
>  include/uapi/linux/nexthop.h |  3 +++
>  net/ipv4/nexthop.c           | 20 +++++++++++++++++++-
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/nexthop.h b/include/net/nexthop.h
> index 572e69cda..9c8227996 100644
> --- a/include/net/nexthop.h
> +++ b/include/net/nexthop.h
> @@ -28,6 +28,7 @@ struct nh_config {
>  	u8		nh_protocol;
>  	u8		nh_blackhole;
>  	u8		nh_fdb;
> +	__be16		nh_fdb_port;
>  	u32		nh_flags;
>  
>  	int		nh_ifindex;
> @@ -63,6 +64,7 @@ struct nh_info {
>  	u8			family;
>  	bool			reject_nh;
>  	bool			fdb_nh;
> +	__be16			fdb_port;
>  
>  	union {
>  		struct fib_nh_common	fib_nhc;
> diff --git a/include/uapi/linux/nexthop.h b/include/uapi/linux/nexthop.h
> index bc49baf4a..e587bbf3b 100644
> --- a/include/uapi/linux/nexthop.h
> +++ b/include/uapi/linux/nexthop.h
> @@ -83,6 +83,9 @@ enum {
>  	/* u32; read-only; whether any driver collects HW stats */
>  	NHA_HW_STATS_USED,
>  
> +	/* be16; UDP destination port for an fdb nexthop (e.g. VXLAN) */
> +	NHA_FDB_PORT,
> +
>  	__NHA_MAX,
>  };
>  
> diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
> index 6205bd57a..5b27cc9a9 100644
> --- a/net/ipv4/nexthop.c
> +++ b/net/ipv4/nexthop.c
> @@ -39,6 +39,7 @@ static const struct nla_policy rtm_nh_policy_new[] = {
>  	[NHA_ENCAP_TYPE]	= { .type = NLA_U16 },
>  	[NHA_ENCAP]		= { .type = NLA_NESTED },
>  	[NHA_FDB]		= { .type = NLA_FLAG },
> +	[NHA_FDB_PORT]		= { .type = NLA_U16 },

Maybe NLA_POLICY_MIN(NLA_BE16, 1) given that it's BE16 and that we don't
dump / use a destination port of 0?

>  	[NHA_RES_GROUP]		= { .type = NLA_NESTED },
>  	[NHA_HW_STATS_ENABLE]	= NLA_POLICY_MAX(NLA_U32, true),
>  };
> @@ -956,6 +957,9 @@ static int nh_fill_node(struct sk_buff *skb, struct nexthop *nh,
>  	} else if (nhi->fdb_nh) {
>  		if (nla_put_flag(skb, NHA_FDB))
>  			goto nla_put_failure;
> +		if (nhi->fdb_port &&
> +		    nla_put_be16(skb, NHA_FDB_PORT, nhi->fdb_port))
> +			goto nla_put_failure;
>  	} else {
>  		const struct net_device *dev;
>  
> @@ -1055,6 +1059,9 @@ static size_t nh_nlmsg_size_single(struct nexthop *nh)
>  		break;
>  	}
>  
> +	if (nhi->fdb_nh)

Why not nhi->fdb_port ?

> +		sz += nla_total_size(2);	/* NHA_FDB_PORT */
> +
>  	if (nhi->fib_nhc.nhc_lwtstate) {
>  		sz += lwtunnel_get_encap_size(nhi->fib_nhc.nhc_lwtstate);
>  		sz += nla_total_size(2);  /* NHA_ENCAP_TYPE */
> @@ -2956,8 +2963,10 @@ static struct nexthop *nexthop_create(struct net *net, struct nh_config *cfg,
>  	nhi->family = cfg->nh_family;
>  	nhi->fib_nhc.nhc_scope = RT_SCOPE_LINK;
>  
> -	if (cfg->nh_fdb)
> +	if (cfg->nh_fdb) {
>  		nhi->fdb_nh = 1;
> +		nhi->fdb_port = cfg->nh_fdb_port;
> +	}
>  
>  	if (cfg->nh_blackhole) {
>  		nhi->reject_nh = 1;
> @@ -3147,6 +3156,15 @@ static int rtm_to_nh_config(struct net *net, struct sk_buff *skb,
>  		cfg->nh_fdb = nla_get_flag(tb[NHA_FDB]);
>  	}
>  
> +	if (tb[NHA_FDB_PORT]) {
> +		if (!tb[NHA_FDB] || !tb[NHA_GATEWAY]) {
> +			NL_SET_ERR_MSG(extack,
> +				       "FDB port can only be set on fdb nexthops that have a gateway");
> +			goto out;
> +		}
> +		cfg->nh_fdb_port = nla_get_be16(tb[NHA_FDB_PORT]);
> +	}
> +
>  	if (tb[NHA_GROUP]) {
>  		if (nhm->nh_family != AF_UNSPEC) {
>  			NL_SET_ERR_MSG(extack, "Invalid family for group");
> 
> -- 
> 2.43.0
> 
