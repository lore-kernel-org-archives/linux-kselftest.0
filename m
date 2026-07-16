Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A731341A543;
	Thu, 16 Jul 2026 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201619; cv=fail; b=Dg38ErRehW0B22tvvH81URVFAyQWvZdpSI0xIWlvGcNS/elwyWa9NYuX8PMmJhAywkf2dQ5EzyLxhAQzh/k4pHxjpoOaSJTLtDvDJQvSLRaknvhwelNNGLSA1hJlTzS6IVpXo3nd0f8tyN7RAJMRItaHUiOl0jWCe5dcCCSv41Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201619; c=relaxed/simple;
	bh=AWqXQVQasdCLni1JN1Z4DCcqQruGZYIhUv3G3bBaEVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KXI9tnilUN5ZvMba4FR/PlHvuWsVwaQGpo/IHBDi/vMp55zoRumCYDI0kr0QBJLTYOEuO2G2Uek+yeFv0gkHW2FmA7tfoYyvGE5cH9BTvgGrVWLCJSQqjvrFjrzqANIRPgOVllyVtaPAlqOrlmKj3oW9OHS5iKzvDMLA2Wgw7Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fp8Yfts0; arc=fail smtp.client-ip=40.107.200.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fp8Yfts0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrEvfBEeBokHPBQbuKbUxe2+AioVJi4BdXLurHI8rZbKHdgmjzhjhTvw9HWRM2HTjn/CeQ0GvCqVjSsHr28wpFmkvzpcfKZ7Nwq6MNYEBkDyyU7Qm/F+aeDQUzmlEJoBTyorhkX8ojaJCEDffTzAwA0Q81jNf4wmn+65xBydp2I9bCiAGQv0bCZHoe8HMxs6DQMKzvhmV5fNxMDePj3nemsw7bDndTZYCzNCE+OlwpERWXwe892P8Od9QZlWpX5OBJts1a6Utr84aztj4d3gr126+VAi3Pt4cg8ynPdUkR0tnadgA3lFC/Ox7QWlMmnIuVEpuGRm12F5hkbMi5TeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rezlWuU9HbxgyRYMlSRsG/nRO/cvjXnBmiezbtUY0RA=;
 b=QUTE4MSl0MGvcL+vkJi8f0sOvVJrBsNLrNU7MEUHykAAj31BXQfoiVVK2q3Mfdh5Pfh0RN3VtOimquU6N6RGk5cmeu/Y7gxSe6ckcSwgDyFFOuhuZleVchwHrONnrxJsoreHV1LPx7qxqYw7PTXkOgUUB97dTakBhjSmYNlKKF1Z5Jm3uNUlLSM30SmSX0I61xlcQLFgnE2K6s/OIzIy+7apW9fSmA32EOaQOxjXe4Ee89D9Y6mLEdjJer1+Lpep3v2YKkH1smUWwwKDKM7RTGVFFMMHtGuDZCmX6SnQ6X8cuCeP6NFTQaTrjJnV8hwkbyv70u+pSsmTWmpZkTIP9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rezlWuU9HbxgyRYMlSRsG/nRO/cvjXnBmiezbtUY0RA=;
 b=fp8Yfts0e8qqs3xbgBLeZheMlPNddAfRHv0ha2/J9T2x9PVLVoKw/PPoSFd++V3hrhzbL2V04Fc7bPuEwgzoPJM3ojTCBBywRNCTaqFJa5eTx4DCRusW5YNFqfZwqTLiwuYqQkZ7KmKFKkYUnib/oyL0ef50wjjblkatI4hFoS31uRAUbOGzsTdWgU6Wutnnoe53ORSQr6qCzXRoIpLWx9VmHkQN7hP1o8itOn9ychgnlDsAkc75pS/BRFu2I6/Xqf414rbbDfciO4Dlhdrb5lURjMXxsN5Lx5b8+o+WKRG+qQHtmF3LMZbiJg2O5s5CxCx6FTQ9P6lrYqxWOY3b4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 11:33:33 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0202.014; Thu, 16 Jul 2026
 11:33:33 +0000
Date: Thu, 16 Jul 2026 14:33:21 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: nexthop: per-nexthop UDP dst port for
 fdb (VXLAN) nexthops
Message-ID: <20260716113321.GA1636541@shredder>
References: <20260712191218.236-1-jack4it@gmail.com>
 <20260713122339.GA548566@shredder>
 <20260714034309.2226-1-jack4it@gmail.com>
 <20260714174201.GA1037700@shredder>
 <20260715074317.2271-1-jack4it@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715074317.2271-1-jack4it@gmail.com>
X-ClientProxiedBy: FR4P281CA0343.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::12) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: 24eccb4d-61c8-4271-4350-08dee32e1184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|4143699003|5023799004|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SYSWXvo7kAuA3kpH2HH/eYakUuMK9+T22GrMh5jJUPKg3wfUdUDpgv1xc7llJ2gwGornOPjfdC9XPRkNgWorOPHqsOkP5Fw8N/fsoY63FaAeHB4f8zf6JmPFiquv5Sn9DnRc/6afGXAJiQUFrQd8XkDW0kpEh/pijdgh5CU0A3/2N+ZEqk6MYGUCZLXAv6r24G2cKl6tifwT84tKy71lXDERQ2M80z2MOGOUbSo0DkqVf8c0mx4MOZ4agIqnkRv8q7aab5xUBfWc/DuVMVRzupUeway7guzNlgesMMwC6ioWgsdagm8tqte6+VsL9zywc50yv++AKd/akHjdaMALRh0GAhnRJz8/STfH1NABObL6mOS4ZZmVkhrQGqamxHYiKo70gz77JlsFr6sTqbIifgFEzpuNLQB3mjvGvjRJ2qO2EtvxnsI9MQXAT1EDJgdzJyN0tZNtWoPDtqX87k3bMAbZjC1YYKncBCK+TVaSiWHrLlJv5+3PWk0mLI2ltRGH9D03tMPku1OMrJAm9OHOGUKueWOerWKSwUjDHUEmxyZ+1M39Ta4Zud5ZdiQkiddttpUVTi4GWZjwdZwvk3dlLVl8FNXGGaTN/ufvLuulTCmo4aycMbeb2RTazamSFAxPBpYw6R008dHl9LK7dlz98lz0Vt1nKVc0DvCtDfDqVgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?peIHPZJaI+Ng4NRfrLx2qsM9FAjd5PjdtP7h+oOheahmYuZS9XLgLsZmI6VB?=
 =?us-ascii?Q?BJLTpRi53RHX0oGW9jKu8MQRAzy+ZCLfEY+qy9HNdJ96I4jReKhr6Gz7fQIW?=
 =?us-ascii?Q?bkUgd9dugRutSxdCi2DAqKob3Gu/xGEC0yI4NSDB1io6aizfPM4wFVgCZyPm?=
 =?us-ascii?Q?fsUV6nUwZsfQa9v+RfLGSjkqSnr4oeSjWSpk4CskFs2P3flH5uDLu/WtMd1V?=
 =?us-ascii?Q?F9AisjvYhXOUoJ2VrXxTH2r4dmZuUhoqCsjggOrSS/oU+DiiIsx2ARd8VnSX?=
 =?us-ascii?Q?ULR4wYf2bvTy8gieQe2cnvxDX5kgiFx3mK4Hrjbi8K02t+KJwQoF30KvV3mQ?=
 =?us-ascii?Q?6MW22k4wDU24kynV6KVL3GvRvUav/Y8cOIjodnRXmSUFHmgpfjd/XcLeJsgc?=
 =?us-ascii?Q?0epkVcfkVrYROHXNit7ENKG6mKxwiGAp0SKA4909+ZuFI3r/WJtQ2dg3cBGI?=
 =?us-ascii?Q?8FAc3OH0Ftrw/FMEen3nXHiUuWMSCcdTeasn+kZwW6ivhpKoqiCcoJE8xVPY?=
 =?us-ascii?Q?j5AgVKwH1jJnZ3+LMlYhnIsVmSNO21+Q48CAproLyM46eFF/JNhbuWyYmDlN?=
 =?us-ascii?Q?j9yUy2jG9bdFdjyBge+lBaXFcqeDnNfU8bhYsnvvxLKsPY6sDOTmgBZCXGpr?=
 =?us-ascii?Q?Cr5y5RGaVJKa1TslO/BWu0R754+v0a45fN75MTCc9gS4YcrIaZQ/WOB3vQGv?=
 =?us-ascii?Q?U31/E7SbDm+370RjBPwiij0YMag9sShgp9K/JCFVBk0v08jcT/bVZj2gEWQD?=
 =?us-ascii?Q?5m/h9jfVmw14dbH1ZGFfCOd7YyZKNKPOwYJ+HVkj+n+1DVTXapgHCol13bM5?=
 =?us-ascii?Q?BepCck80NMsL60LMvnAffDo9g+ZeG/7WxrljcGH4dbXSdZMm2qSFcUQb3tX7?=
 =?us-ascii?Q?MqzYWVqvwZvNyCWoiLbP94HlXiTIUnGGJDnDsWhoaAVViEtKbVa+uycNA3YY?=
 =?us-ascii?Q?RXAeNJ8HkKr04YD3VOdE+9734sexW4txBqXrH4xJ58H7kw702M/9M88uGKIw?=
 =?us-ascii?Q?XaCxzfCec7/ta2aLj8iCEvzqz1WwL6To6EAR3qRDEaUfJg3dLXY7CvcdZRt8?=
 =?us-ascii?Q?OyUgwAYRDT0rRNtYTqqut98jIrZ6WPyBpPeSceHM7dEWuNxp0FC+MepjISpZ?=
 =?us-ascii?Q?Og/W5F/XizmnDrm9TfBs45uHxdKLKpjvOpTWCR1Q1DKLShaXwVqsnucMsY7S?=
 =?us-ascii?Q?6HetXMXdrTx/OhYkUjUuAdwV7pFa0C/p9AuxDiA+/SQulUVT/1F56v3Y28nX?=
 =?us-ascii?Q?gl1gufRQe44NFZ5iDgP4T1lqM2vEnvlRs9Ppvk8A1Z7+Y4z4TjH510qbafug?=
 =?us-ascii?Q?duLXyrYqY7JfQsEfSgqXmsgTILbBANlT0otUBtSufjPYdhm6JKIKTWy1OBTQ?=
 =?us-ascii?Q?fUBwLmzV7UaF1dv9R32D7fGNml4IcPx6Pvp31N7fnvaxV17U9yF/gWNtYAto?=
 =?us-ascii?Q?Dq6seOUsdFZX9wbkE+H0LInu7JtyTXuCLAQxwzyvSFKR4Zn1ELBZmhMRmPdE?=
 =?us-ascii?Q?yxtQ+KpT13zLJLk6Ag0NXyoz5aBPPaz/oQRx4HV7WsQhgCBvJtq4RxsfhMkU?=
 =?us-ascii?Q?USoGYG+3/3lvRUEAQld4J8NyqcIXYuzz3/6Q2YVGeubJiY9KsKb71O1p98Xe?=
 =?us-ascii?Q?Or8aPSuy6LIXP0dNAvhoKQWo3mdm8tOYc7wbpddcw+bi6obxamKyqth5ozlN?=
 =?us-ascii?Q?1fh6gej8nb4lZZNV1R/yMopzMTPAWtT7MZNmMoC0qmlJuvL80p91gMiIBkWT?=
 =?us-ascii?Q?G32W+legcQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24eccb4d-61c8-4271-4350-08dee32e1184
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 11:33:33.6695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDcImDnRZmA9Fr/SgdOOKZGgy4CqzZm0xTKdodJlCq6zrZQcS3Dp3GFtRpFA2q3acLsenvX6p2DIC9AEGCeeOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234

On Wed, Jul 15, 2026 at 07:43:17AM +0000, Jack Ma wrote:
> On Tue, Jul 14, 2026 at 08:42:01PM +0300, Ido Schimmel wrote:
> > It's unclear to me why you need the UDP port based demux. On a single
> > node, do you have multiple pods that belong to the same tenant and
> > therefore share the same VNI? From the above, my understanding is that
> > the answer is "no".
> 
> Good question, and I think my earlier framing sent you down the wrong
> path, sorry about that. The honest answer is actually "yes". By design
> a node can hold several VTEPs on the same VNI, as long as they belong
> to different HA sets. Anti-affinity only keeps the two replicas within
> one HA set off the same node. Two pods from different HA sets on the
> same VNI are free to co-locate, and that co-location is the case that
> needs a per-pod port.
> 
> > Assuming the answer is "no", instead of having multiple VXLAN sockets
> > in the host netns (each bound to a different port), why not have a
> > single VXLAN socket bound to the standard port (4789) and let the
> > VXLAN driver perform the demux based on the VNI? [...] creating
> > multiple VXLAN devices in the host netns that only differ in their
> > VNI and then move each to the relevant pod netns.
> 
> For different-VNI pods that is a clean fit, and I want to try it out
> regardless. The outer packet still carries the VNI, so a shared socket
> can steer by VNI without decapsulating, and the host never touches the
> tenant frame.
> 
> Where it stops working for me is two same-VNI pods on one node. They
> share the underlay IP, the port (4789), and the VNI, so the outer
> header is the same for both:
> 
>   outer: NodeIP:4789, VNI=X  ->  pod A (HA set 1)
>   outer: NodeIP:4789, VNI=X  ->  pod B (HA set 2)
> 
> There is nothing left in the outer header to steer on, so the host
> would have to look past it and terminate the tunnel itself, which is
> the VTEP role I would rather keep inside the pod. A distinct port per
> pod puts the distinguishing bit back in the outer header, so the host
> can stay a stateless outer-UDP forwarder.
> 
> > Given the anti-affinity constraint, you will only need to load balance
> > between pods on different nodes that use the standard port and that is
> > already supported by the FDB nexthop groups.
> 
> Agreed that the across-node load balancing already works. What the
> VNI-demux version costs is packing density. With one shared underlay
> IP per node, VNI demux allows at most one VTEP per (VNI, node), so N
> same-VNI HA sets of two replicas need 2N nodes. With a per-pod port
> the same sets fit on two nodes (replica 1 on node A, replica 2 on node
> B, each pod on its own port), and anti-affinity still holds. For 5
> sets on one VNI that is 10 nodes versus 2.

OK, I understand. Each tenant has its own VNI, but it can have multiple
HA sets on the same node and you want to distinguish between them using
the UDP destination port.

> 
> So the port is not strictly required, and your VNI-demux model is a
> real option I will prototype. The tradeoff I am weighing is density
> plus keeping the host out of the tenant datapath, against the uAPI
> cost, which is small: NHA_FDB_PORT is the nexthop analog of the
> per-entry NDA_PORT that already exists, it is control-plane only, and
> a leg with no port behaves exactly as today.

I don't particularly like NHA_FDB_PORT because it's an FDB-specific
encapsulation attribute and these attributes naturally belong under
NHA_ENCAP. That being said, I fail to see a better alternative given
that FDB nexthops don't use NHA_ENCAP / LWT infra and probably
shouldn't. It's a bigger change in the datapath and I expect that we
will not need too many FDB-specific attributes in the future.

If you are going to post v2, please provide a more detailed motivation
in the cover letter.

> 
> Happy to keep digging if it is useful. Thanks again for thinking it
> through with me.

In an earlier reply you wrote "shared inner MAC/IP". The "MAC" part was
intentional because you need to load balance pure L2 traffic? IOW, if
your traffic is only L3, can we do the load balancing using multipath
routes in the overlay instead of using FDB nexthop groups?

Related: What is the use case for NHA_FDB_VNI? In my experience, the VNI
is only translated when routing traffic between tenants. Why do you need
this in an FDB nexthop?
