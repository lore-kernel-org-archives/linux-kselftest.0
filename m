Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795721062;
	b=N4NLr9/NvO26FEwMj7sLG+eQL4ztU6t8DqXPFGxt+cyJzHDeMczRBRMV34x6Ac17nEz6
	 gDz3MUPmaxC0kSeZ6I8h+X74n4Oe/qUrKiJC3eSWncJcYBMR5QfwHR+FIU3jt0xw52FE1
	 rjPVsVoW731JchvF1Cp+K/v7u7s/1gCt0IAdzaTlri7sX0/sjSOXo8IwW7STz0uvR8Zed
	 0wH14MPzCQPC4iinrJ/CHT5DHkfOw21VwBUqDnE3lOByPByhdCDTYseGhgtSyC6VydkUd
	 /DO9cVonaR8Ss/9N4IzDD0LnjIJDIykblQZaIFrIe3NBbhsQ8F3Q9YI/AdZLWUvPQwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721062;
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
	bh=2zT+yAmhvE7wj4OvqmtPVc/NxcpzCQ+2i5Rw6/CHKNY=;
	b=v0AXdZJE0gOsSA4P9X3UMUuHwJ2aXhmFpSuLbMfYhttVeURO4fxypkjBySdPFs9q5RCk
	 VfONTmxzvmiPCgtAx+1YL/CzaOEm+9ZFQKxq1pgGnR+aveN0wMs66q263cN3s/NGoAMqy
	 vCjcGx257odeYC++l/ktWHzfWwaCv/uWR1tXCrnq6W4702pmCEWBSrJwIRCAvXelglqb/
	 HsYVRysOFBFaTBN6Dt0fqadW6k/z5oJlRCKj5RXMXV0jhe0naVC2w5XM+Cfqm5aZdRzBc
	 4vFELq4bOnw49JBFLi5/rFM8qolfjVRSRhZhiG0p/bMpHTFWB1naBxrNvobGv4QmmHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BKny7DKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.56
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A278E606A31C;
	Thu, 26 Nov 2026 19:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A278E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BKny7DKs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lc6k3fkRYHvKF5s6SMQCesdU4EwS1+upSkFWj+EzZV5Q+bTY3tfg260ygbugEPZ5Z/ofon19WrydEevIsHwDLoIkXj7ZOJPyMsmNxxvqzT08UXTaRzLtNqnN/JD0sJzmpCTLcaVYnvAtSUdAOEflHYOMIgJuZbqv8eaZLAC4veb8rE5wl08Xt1510U9t0HiNMbsRxpYrLhSA2QTxiBLCnMgirFw+Vvm0OQZGtaZIjCh3UU4Fl8wOSz2qEzl95rgCGlJMVyA/VgjmkmHNdQVwHulMbCsZKDGPb82KvDxCwCtUu6ATlHlGNN7A99bT8G0aVxcmIGv6STei7ICDGgSnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zT+yAmhvE7wj4OvqmtPVc/NxcpzCQ+2i5Rw6/CHKNY=;
 b=vS0SX1Pu6iNPJoitCZsNLL/HgjgzhpA7cNurh74JjjkxVBBunjjVSGGbLTCSn8jksZmXsYQFR8I9Ki9B0BFdKi3QEnLC7IALQ9Orz3+7nBlFr94U/dnq8mtn5uJkNSoS6dYKjYPrN+t/T4Rxq2Nvqs/BX0JR8PEZsyyECJrzhRwBTXfUOrxReeU16GsJMnTZrCVuUT/F7HsCOk/sWHTol9K9twseBAmrCXSUiDQmkrZ099PiM88am53jG6wiehKCeuVtTUCRGJcWxyqVqofF8xkqmgWuFEZBixD6LdQKJ8hTvs10ySjKZYR9T1DbVBU00yf41FtiWOXnZrHIlFWirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zT+yAmhvE7wj4OvqmtPVc/NxcpzCQ+2i5Rw6/CHKNY=;
 b=BKny7DKsKf/yYhLSAO4aRAs5l3OvUthjl4ZJ6AMvT1tNsbNI1NrZhea7w2T24d0RnqI0R/6Cp45s3M0z/w+/0Valvj81LDWYFTL1dyDLwf0vpsIafeuQ7OGZ/00Jom7L9oKJpawt8VSpaHAuogGsHXmO56IYb8OeVZvutHa8Lph4wAc2vpXCybgQAFv3LDH0p+V0Rl/Pm90qiFruDifq8riYQTS1+wD3O+zWtzhzRkzilxUsWdpMtN3QoLX4Wsco8S+jJecnkbDENYqkas6MyodLAsfZoli9tv6HxMPYchUYB/ehKv2BN7W1vZLw2vZ9+nZeRoq9wgR2gY2TpFb5iw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by CY8PR12MB7244.namprd12.prod.outlook.com (2603:10b6:930:57::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 26 Nov
 2026 19:24:16 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 19:24:16 +0000
Date: Thu, 26 Nov 2026 21:24:07 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Yifei Sun <yifei.sun@inria.fr>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	willemb@google.com, horms@kernel.org, razor@blackwall.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] ipv4: keep scanning the leaf when a nexthop
 object is unusable
Message-ID: <20261126192407.GA1010466@shredder>
References: <20261126162538.2509994-1-yifei.sun@inria.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126162538.2509994-1-yifei.sun@inria.fr>
X-ClientProxiedBy: TL2P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::13) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|CY8PR12MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c377f3-bcb4-4b6d-66b6-08df4bf2dc89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|11063799006|56012099006|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Cz0yR0PZDtEtQ6GnbLfLW5/8nhHPFXzAMgptOQrNYAiRKzA09FRGmjwoDTLn6RqSiBw8lflakRcAE6JShzF4S6TqeklJl+Ei3M8cqWx1if6Dpe5Rn5QC1VysFKD9j4PgSwSP49hZ9cnnqKX9yKEFIjTFDXYNTAlz31fU9zq2ZQSUlXGj93ouE32fnuECYO3TMuVk5vSr7SLls9pu6aF5DsZazbEMT9XSj9Nbaub2vtDnxQ/RcpSFxXaPWRzmIAsqslfpl7W4WcYQeVEHcxU98+7BHEKguxLBAx7wd3ubSsubbVG76QHQuhX7CZfxity3Wl/kq7NTNaVENKSDN2GglvWjr7LyW4NF7dsgQpxzajgh6rhkIhVUeqgRD7Ii5zVJ+om75f5s9IgImE+vMmzwPslWcBu8uCeeOkiph7FW2ZXOrtKoOanqtz/hhp5vH000PmUgRJv7P0RhXbOk1VMAdv9r9O31C8Kd8LBqIcvNhug/VyHcds8CmIkpG/NELcwvn4MQAUs3XebyhqfA1LQPvoqfuFeGUxfTcjMO+U92JM1SRI3FsPsZSpI8z7vqNFcAhqb8DON3ike4WrLHkneEiLpJPoZyprnpiCe4SYI39WuGolamkwQfviVmcb0MG6HQ8SC0PSo6jrbdyxAqZYmup1db8xM0XOvNQ0jyX/vMTu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jeJnERz2HygE3XsEPf+Brh473qirWjE58SxmofQw7KiBGKYFjyvbl+9lBusW?=
 =?us-ascii?Q?OiPsyCCO6FVS2cApkrqTLFmHY8MwlcnEOENV2IyNgB4heEEyo1suStHzuuOY?=
 =?us-ascii?Q?eF9Z0ZfA1aRJRpvmmtnI+VR+rCyIS4Iw+vHP/fo+0YzF6gflbp5HmaETaP2B?=
 =?us-ascii?Q?F4c3d2GHdW3ax3n58s8uh4hVmFy866NnKVwmQn5/n4PppoYb8oq0gS4TLIya?=
 =?us-ascii?Q?7uVQNt9E3r3yRigh6UmE39gbTywFXpYgAUDWrywg22tAUHySB4KhKtjYg97n?=
 =?us-ascii?Q?2iBGOeELbEAy4cHqleCT7/kymnwIksTQNz1SJEPxCfIti67T49HGMWYi15ZL?=
 =?us-ascii?Q?klfnMWojliRIG8umWjR9puXf9iDmZb5ZhKaaLrjz02xl/C8CDsral/urPxWl?=
 =?us-ascii?Q?iAxAZ3WkGjI7vOOeDZ28tbgVSKJ3Xe8FRIGgz/AYIAx+q4cbimaZOIBQVZqo?=
 =?us-ascii?Q?GFKqEVhMfNDX+D0zSO4FKUQ0EQYimapWuAVDalhqwcI+YHNrBUa5Z2IZ8tP5?=
 =?us-ascii?Q?otS/3++G/55qkGsW1xs2c0i4/xnXXbcOsL2j0hUzMyoJd15uvCAt8FiwSM86?=
 =?us-ascii?Q?p9WoCH2qkY+zzXIh/s+G4hHAkCBMY6bAbngCIRY526ZSs1VK4uFB3wdXJ3u4?=
 =?us-ascii?Q?6fq9UEvP1Lx9TkhAOFWK9Pt+9Ab32Yy+Q/eVlsuexzx5dev7acIzSZ4DMebP?=
 =?us-ascii?Q?p+e9u7NgoHlB9fcv55oVjcqWTebC5Wh2zdT5SEb0krW/2SiMmUCRZ92IajJl?=
 =?us-ascii?Q?z/R5TXlRglyq4p+0BkXVJUPK5lspolqW/Ur0RgEBSD7IRrbAa/Jyx2JAVdJy?=
 =?us-ascii?Q?o8igg1bLTExmDVY4yzC+8eWHCACB0UdgquEjHIczrdqC9XtG462yvGquMRi5?=
 =?us-ascii?Q?ChMDEx2CNKZ8Y0+vk4nZ031Xa468l6Gg8jC9T9mPO4muH9EiEBOaJ0JvrZXK?=
 =?us-ascii?Q?7i30YjxUCx12bKdQ/8WEm7vO0xVf7hX2zKJOxCHcwA/Zq8ahQW0/vK4HLLJc?=
 =?us-ascii?Q?GUWHODTH3TqPP/LxRKb7lSyT53FDlJXtUS4+L4z+5JgUkMhzOL3DZKM0ajVR?=
 =?us-ascii?Q?ZyXyWjNRZJIghPjMlN8EPllRJdfKanrbzedQRa3giFze/iRlzveSp6v3/f2a?=
 =?us-ascii?Q?9jmTBUbE6CXhG+UQuNRzqkq7HtcagGEEzbB22+HQ41U2/GK+zXkz/Bm2h0QF?=
 =?us-ascii?Q?GI2+YRZtS/Nl2VmMzDYuk5cqt4hmelfynOIYisdv/sXfLM8c+dOWh6iTm4Kg?=
 =?us-ascii?Q?ZDeWwu5dulGWuxOJkQdc8ohRhcKuingBNQMBKaGbVTYQzOsVGvkzsDTXvN4l?=
 =?us-ascii?Q?6M2vdF3NSVQKImx+lJFzPCkt4joR+BDyEOjGw5u8MqKisUEss6+DHEW6g4AB?=
 =?us-ascii?Q?pELOsc35SRxNUMYRxkGENH4iXX9PkCizLORTNasLCc4w0I5cDgpPsbzBqJPJ?=
 =?us-ascii?Q?atzB8cFvC14BOKyDmHu9rQYGzYOyUmeUPqvZsrjgTAIv9wBNoukSRTKUwosQ?=
 =?us-ascii?Q?JXBfbe9xgF+9dctW+5tGxTB9mv6irTsNy5xE9oulaNWkPOUBrLGJjovIHivY?=
 =?us-ascii?Q?QNuXY/9NkPBPcDOJ6S/8KDtxiNVzbUMdBVtshCMtwKjXi55ojyiZA4m3gcm4?=
 =?us-ascii?Q?K1HEB+xegE+N2MW4UkSuHvdYcMSn2Ql6uv6nABMsotXFiJ+RjLi8w5UJ5YBO?=
 =?us-ascii?Q?Eqnaq4w90ujAIEEJNc2ueeX0Bo7MiTsmXcwU4oZqMCDu6LwF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c377f3-bcb4-4b6d-66b6-08df4bf2dc89
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 19:24:16.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsEL/AupU57sLsSpklz14NSWyJE2CQQMsOgo/H5XGi/VWKDq9aER+MLCN4dW7c1EReYZP0Hlaq2VpXbu3xFFgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7244

On Thu, Nov 26, 2026 at 05:25:37PM +0100, Yifei Sun wrote:
> With veth1 on 172.16.1.0/24 and veth3 on 172.16.2.0/24:
> 
>   # ip nexthop add id 12 via 172.16.1.2 dev veth1
>   # ip route add 10.0.0.0/24 nhid 12
>   # ip route add 10.0.0.0/16 via 172.16.2.2 dev veth3
>   # ip route get fibmatch 10.0.0.1 oif veth3
>   RTNETLINK answers: No route to host
> 
> When the /24's nexthop object has no path on veth3, fib_table_lookup()
> backtracks past the /16 in the same leaf. A socket bound to veth3 then
> ARPs for the destination instead of the gateway. Fix this by trying the
> next alias in the same leaf. The lookup already does this when no
> inline nexthop is usable.
> 
> Fixes: af7888ad9edb ("ipv4: Refactor nhc evaluation in fib_table_lookup")
> Signed-off-by: Yifei Sun <yifei.sun@inria.fr>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
