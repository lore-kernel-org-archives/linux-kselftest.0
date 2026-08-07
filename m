Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410BC42FCA2;
	Fri,  7 Aug 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119821; cv=fail; b=oof6CX8zcrTIp8RrXlDhyWP1yGiU4MeDyWRX+bQ2pdDaR+8A48wlS3gYOcokp6OrG4kQJp0ZJrlMVP+bLv/0FQFNq6095P2e6l05T/mj6YQ4GeHpte/byU2HEYENw89JtyZL4xJUIMK0RCVPhSejgE9XXWGJsTTiZXWfJkx62yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119821; c=relaxed/simple;
	bh=tE0caF2Yd0GhyEV/E2ZjyeADxfZKCJE5xtJo5hhUm4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=byQrCkMUxZUC275BUGZLOluw0oSmsrBFyxsbPwwcodZqUmg1G9lYMOROOKLQKY6hcBv7rXyUzf+7oagkuoC/rInbJVvXNVGDrKNjZvR7/voxZGxkr+5xyXYl12oLnic4YD4SnQKN9zerm4O2t11nByTGZW9CF/UJkhncVl2ezvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rpt2ybWW; arc=fail smtp.client-ip=52.101.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rpt2ybWW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHE9ylkrbOFKZBN0s8QdUb1VhoPuFNOnGJ4Kyis0KOpxoHKDA5adU6mYZCoyaiG5gT10qvXPD5KnX9DJvXe7yUaHuv3rqV+zLR15o3ktj/u4F+s3upgdgt0KdXtyCijwHY3abt98a1MHPdPPFoNVYWFvQTBRFSwzDVjBrOZbBbCo0Ax3x0ymOgrYB55ptCrcaMGB9iZOxZINShayDVIHIZF4On9Dx8OJrgXQLQhn/+WUxORYKJ2iXBB6NXKRAQNbWk06xBqCJw6LMWxLCOUz7/AVxEVNO7qPj2MT0DAVYOCDk2B/284YZ42Y33Ge6RNLP7Wh+ocA1FScJvovYeKhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GudOxH6VW/qQvBED0DSJYSTa2xx8l3eieDHRfvl0TtM=;
 b=THLir6HDQrJfPYqnPO6DNEbm/yiqhX30Y3SPy/2+SodbHV1A8R/tqeY+WG0DEDAsirkeXNW2zAcEGLPqUM7ZEofa+0PBY2Jkc/Fa6feD3RjQoZUPpdtjkPr7D7cYhwv0Q3W3dYBTjf4zeVytlQuyps1I+6fCSPSXtl20h3OZFUMubrKHDciz0WJQ9fVkq8fOuvTZyEn6XFxopAaUQLGooSwAPLx0e2qQD8TMU3yu6FBVIHlaWNcki+BDt3fr2tuS6bYGvgYJCRUKaWVETy722eZcf2JTsFKlAhr+45tL/M+r75uWx+/XeY9aUC/ngB/HRYIj2oF3I1QunoCX4bu/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GudOxH6VW/qQvBED0DSJYSTa2xx8l3eieDHRfvl0TtM=;
 b=Rpt2ybWWOZ5DtUzdhakV4U1hEzG6Igsu7Eq1nmYoob7r3wmAnreLqOnXh9mipunExk6d0gIo5h1HThngxZuT7B8CsoQACedlgBpJb7+/3kgiwrswpiLIlJqPg44qMNiOaXy5o6Qg3Kzm90gtNy9y3Om2y5r+OW2VxmrweBulgkxBF/PDHK6mEhB6Jv4hDKImb+iqySstQf3D9fp/ELI5K06yKizUbMszmz4xnEfux0DkF4z2/wfxJimL87oGVU6+vSZsEOZ9x/qTtMRe+vldkI/BLHYEyradozWzRw07PmnL9A1f0cQAqUzzPahJRIiE08fx9P6M/gm3a6EoaJ3uxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by DS0PR12MB9399.namprd12.prod.outlook.com (2603:10b6:8:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 16:23:35 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 16:23:35 +0000
Date: Fri, 7 Aug 2026 19:23:26 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>, Nimrod Oren <noren@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 06/10] ipv6: add inet6_rt_del_notify()
Message-ID: <20260807162326.GG2186508@shredder>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
 <20260804014714.4362-7-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804014714.4362-7-sigefriedhyy@gmail.com>
X-ClientProxiedBy: TL0P290CA0013.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::20) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|DS0PR12MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf5c0ae-bdd6-47be-00d7-08def4a03acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2brFdBdvwJFx4JdglJgC021Id3IOxQ/sbMoAinB3KQDEjTw7oaAASaIX1+RPYaVoOTfmy1YK39r9S5V7t/uC3TBnnwskP1hxvt2BAmwySIA8azPtVC6YJ1kQEQRz1U0VxtcliEQTz8hmZrjaiabfyGW5S43XhcftNf1Y3/cr/OrVj9TAr4gITodFiIcRbRPjiNf4M2XXPAxTrSMj5FhHoXdjvOBg6jy3iW7rr9i12ub9XtIxcDIQ/64jl7yPyl1n+pkU+z1ADEAXQk1Txas4ZuP8rijW8kMAh9NgihatCei8HgS+DymN5lH/9t44oe0f5QWRnRQzFpZuVR2KvtMovXUhF+w7MNv88egbVHEytw7ZRzFebuZx6+MfMOIvkwgfOq2MtNECg33hyLYZBUCYdkVnaCPMQC77YNhVBqw/FhNEcYnOM2PmtJdk2hGNkp0Y+vYOkNLx7w+sI2ltEqDqDaiIkun+42IlshOF2cqxL/M5AMP/j/ftSd6FF+N2GML9pjukN7D7SlxiUJcDEN5ZfPQWYFzgFy5oRWGyQr2D1+hqewuE12+dEUZMmUlW4ML3beAEioZOq+XKG89N8YiaBT0pANVG6PjgTMvDn9ZDjRGRwFap6PoRK9zTOZDf53PU4fh48nutw3ZnNr/b27774rL8ywNjsev6s2/+BR75/gg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LzcikPhsPDf49n8OCGwpmOfNLdPhpUPN/eHoJRbgfBD5m9uCaWtbmIGvggto?=
 =?us-ascii?Q?7EP/gzWAPBFmeJTRWP7WZPAHC45JN4me119+8yvtyQ1A+GKIAeCaD3QdZ7GJ?=
 =?us-ascii?Q?rXegUgxShh9pQzcD8fxk3rWGOct+IIUtrRR7f62qy4vPDRbxoZrjuUWUTSbT?=
 =?us-ascii?Q?mNPKZ1jY79TV7YqPvdg3iNNtp5CteXtzpcgh/6lwAloix5Rnt8o3tkPcnmG7?=
 =?us-ascii?Q?7kMCNMCr2qCgqUuKeK3basnEfXZW8gdeHNnSGw3PPrWo9cmA7HTDFhKFty3s?=
 =?us-ascii?Q?o2AhxU66B26JXRdNTNEeDqfyrInGj1CBCEl1lNZrKzM7WQ9V8n/5UP6UVnPs?=
 =?us-ascii?Q?G+KUaEN7yKDAyzlpX7caBauGeGuoRl0ccYtmy9dBoLrORagoPB3Uf9ItVBAZ?=
 =?us-ascii?Q?Z1vIAlU98kFaFbWgJjsai4Z6EoGDCcFnzUgat/AvhtRlMzNr5Ugo5b7ebYS0?=
 =?us-ascii?Q?DEE93A7AfoU5Bc0aFpyISdfhiLhN9cHX/Zac+dK10NmHwvCyRadgFmfZEtFz?=
 =?us-ascii?Q?liwtE2yPW/AmFV5roORsSY5UPQQQ86x1+k6m5n45Q2N5ty4kEw+fwA8P0huB?=
 =?us-ascii?Q?ZoTFu4D8tKgdWOR9eovTlQO5jDjPoK/fqJB7fExxc3bKH8V7tZnJUsEWuG+/?=
 =?us-ascii?Q?vZMQi1y6bYkFpPkOb3+rEGGIoB/amdEUs2jwCEFMNhZvT02/k8lHtvqRYw0V?=
 =?us-ascii?Q?xgq4n+Ltji1rpBfIzeb7SwLn0h26J2O45qUGCL7CzPk2WT/HNMZPur8y3QA4?=
 =?us-ascii?Q?fZSKd4E9sUFbU7c898dkCvqHAozBoYIDjw/YrUeaBfUxFNPJs1XhykDgWM5j?=
 =?us-ascii?Q?1vbyn6v53O3DQa9512v5Gwmq2RsL90n8paDbSr4sbOZr9oEMuwFVP75DM8jO?=
 =?us-ascii?Q?7I2mPFT9i2CsmnNhMrQJRq9N6PFj2gms3rZmMClch5W/5m96DiX+qAqgjxVp?=
 =?us-ascii?Q?8opnr82wI3E0lQBJY1XHzyehKHl93TV+dbl4I+feDn0hyjL6SS8/6QmWaL5q?=
 =?us-ascii?Q?T5nNrYCsHPTy17W74BvujRpuJaSTDPID/L5dI7J34fGfJOcmfs+V9sP54xPW?=
 =?us-ascii?Q?LwALP4WjnzT2xraRM0gWTFnFWdy2Qomutmuorc32tBlDwHVBHL+N1RfFmnoj?=
 =?us-ascii?Q?9fSer365Rc3lZDhKuaCp2y3ZP1bLFTv3BF0qF7TEUB42N7rjps4X98I/mnbi?=
 =?us-ascii?Q?oUgZ+Seyyr6DbIGX2qrA6c1jNsrezNTkwGehoGQyRSUb+CChHt/Xv9+st8WD?=
 =?us-ascii?Q?PBe1e0vOycz8Sssg+Qq6kEsqHxyXGpU1Zkm7K7xQKQyOy9K0EdPUQ/9wG2OG?=
 =?us-ascii?Q?uM/mmGZ0IS22XfaqyxAsTcnxFiRZqUIWz8tH75UdTTP0h3iupac4gImmlfiN?=
 =?us-ascii?Q?Fw2NbJwR6RDpKLXCfzaTAsKoMmSHbFCpUKTpRxjLoqydVEkSuR4Nfu4D/T0+?=
 =?us-ascii?Q?jfFimGgLFHERFw05AW0Feq1y/77JzwG0GF1kYdskzxeLi6m3TZR5eUj8dxVy?=
 =?us-ascii?Q?uIIYl9hArKHSYH44xSlQAK+J0O/lC/t3B9PtavEzYqA90Bnv4VZy23Ckipoy?=
 =?us-ascii?Q?OJF8AC13PqUGfc7CiC7OQJiEGQpchqGxYNSMZZh+KfTBMKiLemxHAY8pOxSm?=
 =?us-ascii?Q?i9QbF2qv3SE7pSabHusLBnkjxM2wvTBHQoEFWzpjwZnPcaBibVHTdB1BmQIH?=
 =?us-ascii?Q?Ub6YTfDk3qX16xUqayn4/4cL0xCf3aOyV0kaH577zefyf9RTVtv+XDA2XHnB?=
 =?us-ascii?Q?SAG7j5fjWg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf5c0ae-bdd6-47be-00d7-08def4a03acf
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:23:35.3123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4jjoklNC4aQoiuzMm7KPG1zdoV5/pyKnVAj4lQuIPfo4zMynGu8kZdMm4c1v+Pb4wLtgrPRaMhLqTJBpD1gvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9399

On Tue, Aug 04, 2026 at 10:47:10AM +0900, Yuyang Huang wrote:
> Move the body of inet6_rt_notify() to __inet6_rt_notify() and give it
> the deletion reason. inet6_rt_notify() keeps its prototype, so the
> route addition path does not change.
> 
> Add inet6_rt_del_notify() and call it from fib6_del_route().
> RTA_DEL_REASON now reaches user space on RTM_DELROUTE for routes the
> kernel deleted on its own.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
