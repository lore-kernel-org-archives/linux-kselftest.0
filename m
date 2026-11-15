Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794731602;
	b=W9qzCzOAxZS8BlZT5K9JjctKJ/FHKApWGvMSTzBdWQRLUNJ4ucUO6f0La8qu2x/POK3p
	 Wr+hsmD9ExWZGDRaVIRh7JNIQYJt5U45HSxkHyUG5vPfP8aply3CkpyigSpDr67wr27Yy
	 iA9iim6mQyf9SpQFh3JMEp1vaSFAgjwxRxti3EAcquRnZNDmR3eLdZugbPPiL+QF+Xrn5
	 GHbm4cK9yrFJ4UdkxCW3dNL1okcysneOOUGfbi+90kaC/NkFRxePKulUgzmpHlekQShGH
	 kD+1F98aZcoLhwCyofzTDEe90eVm9C0qeNjY3kBtF//91wkXCn1GeZAH3dX6gouW5vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731602;
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
	bh=zu43hJx0hq7gcuF8ZxdT6jk7+0CtV5Uh114U6Bac3NM=;
	b=o9aHlxJk+lrLSSL7gzZgVYidZ0PIKyJnLnzQ6z3Vp13IkNSyb040+cznDw/JrHg+jBKY
	 l8wGlzKNdy4985a83ynxTY45rgjBF0wGG6InAhfLMMS545yIoNFzAFz4gtowE0a/ZTtr0
	 IM7oypjX1wVwRE+XFw+dCudF6BlgpU8DRAXj8MnzKlx7wRd7sxsn1OXTmTnvmJNSO7qQD
	 ykoNtOFIG1r3yDPUjoiP2S7bTAfN1sWubKiFkgfioL9xEk+0eJqLOrMWU7u4LjYQ+U4Cy
	 vDNgmK9ezNSvIqm7y+xm2Durn2FmFTLmluCmutOhllwRdTTOzBepqoR+b4dsz0fOBJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OmEPcjk+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.56
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B49606A31A;
	Sun, 15 Nov 2026 08:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50B49606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OmEPcjk+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhB2Ykjt3pc97seJ+aU5T5aCFtXyKz8l9MUbMX2kdn8sptAA96PA+vK0B+cNtxFBAh5/4cKr+I13Ya0/jEPevkpUsKaqODA3wcp3bKHxTRjHzK9HtVum6r28eNNmkF0IDbi1S5t3+BxTrxj9PgKbMRiD+Da29r8/6VG7SZ/hZRZBSFNVaggP+6PzSTdwPAfPBWxdQHlDfE8MuvMIqMfUen1+SYo2y+0lnrmfbyNqpO7PNiuXulrMwsG9DE7mfxuOwRM+f+QhdJuXFLEC0qzZncoThdScvSCZfd3XcKsDV4nHCOmn2CW5uA3FmKYEHjwgS19PdsaI8NJCm5m8N3IPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zu43hJx0hq7gcuF8ZxdT6jk7+0CtV5Uh114U6Bac3NM=;
 b=cEnVOl/m7lNQsyhbFOrxkFyxIfj25mqQk1QO0S4V5xlKXU7fvk21fvV2XizEhzAlEqPhPvueFt93O0vtV83KrV1pBBZA//8Y7pykxt3cZGyECtodx9PHltuRdhS1YI7vSWcWgI4o4NbYpIDTP4RvPi4DhdlhkqKJRDwRynIN+QNHH/4vYjXzuUPFvycxweRbXKf/RNnDHyg1tee6hSTlL7Ucim3WrTaS192ZupokgHrbHono0QZaxb5AoJ8/KuPt64VZTr6XjC1t1CZbwI148D+rmzoJYDc0qMFFCaON0QBc6mNULSkAQAWDzJrvSzDkejsB87itN4wZugyg+aTyfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu43hJx0hq7gcuF8ZxdT6jk7+0CtV5Uh114U6Bac3NM=;
 b=OmEPcjk+YHfyi2B2LKy2YSrGgeTwIs3QjPkxnqzn7I/y9SEtnMy1mZ+vRc7M4NnzcWaXkUH35dx3p4Q0FfEFAlKV6uG/z+o9t9wE4RTxAh+tODh/VLfDo2apdIgCNGJcrhQv20iCLMIXd7xosSXAjGvsG9rEbQTBQUpUizR8iYoW3T3nS8Z6SorM1XW4KVumwhoesle5ugCq8o6PmsPg+q8d4um9HNbockjiVlPedTn4uzChfYjP6fcJ4hzXE8d55qfVcE0CdZxVszDlyUya6FZwtyNdEIg5CyXV5v2iWH7egue8Mhe7HV1b1fiU0yQ/Cy7VTPgmoRH8kY9IS8uXdA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sun, 15 Nov
 2026 08:30:16 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 08:30:16 +0000
Date: Sun, 15 Nov 2026 10:30:07 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: liamsmith827 <liamsmith827@grapheneos.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: Re: [PATCH net-next v3 0/4] ipv4: restrict on-link fallback to
 lookup misses
Message-ID: <20261115083007.GA3764829@shredder>
References: <20261112235932.23836-1-liamsmith827@grapheneos.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112235932.23836-1-liamsmith827@grapheneos.org>
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b0fbaf-5ff1-4ce5-fc06-08df42f2ad1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|56012099006|10067099003|261026121527099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	31lYap/3+pyuAEVxyLiZL485+awuq04ubxZowXlxkPgLObqbiZujlwf6SehAJ1r6ZKINI+lHhjnN8nx0w3leUIBVhadrWxAp6rRJe0c1aHSm8Hjd5g8CM8+CLY2q7FDsBMSLIMTXxBq7YbFV5Yw8W4EKrgR2noKqLglChUSKgJUYjdGYX3G5fWWFMV2JwqnE0gWAEHe9OX2JYbkktaS8fFFRAcydjR03WTBjrVjXlnaiCQnkc+BZfpzZ4CCOYUXR0J4pcW9+Ifjg664I+rnuMFg6xTYX8QT8RTHvxjD/36tTs6OwB8rgFFDdqanifti2TYsvdQw3puWXiNFhgoRkXBEnBOyWvbQzvaqd3jZAYDFKhuub8/nAd1Xk/7OA/9XwhU/Bhn4JgiiA9ZxNnlg3qzlGjCyvD7EVSjzW3LDHcO22ylgx8oZTrsmhyY+4B4DCkkGosrzGNyucSIepVMZkgvieB7QQpAfSi7RWRlLx4BGjhSUwZ2uWWRRkLIiD/4pYOnNegMUuGRGPf3GEmcR+JiEcFaQsN1jYKOcJ3StwPmyBcrWPNlZ1rdhkoMgdNUgX7GBKgr0fH3uoQv7bmhS511Mtbw7UELWlkBdikWIo8UIEvkBMRWLITqZirx9PI696xvRWk7llYmEurnJnT5tV068C+Y+FuVQ4uQWB7i2f/Uc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gj1jTi19AADeNOtRy+eBsumspyGqntJtiUYEIfT6In4+UL0DIHpO2DFlxeAM?=
 =?us-ascii?Q?N8+3N/qBL6U6+sCDwOnyHNOBEDOhCTOuZfK+O3AnuqhO83CMfWe1ZDwy9/ZR?=
 =?us-ascii?Q?qtAiuilhPZBDtAzetbR7dptUzTsKWfQ2ShAWKAIrIp88UpOW4CP0DK0myZth?=
 =?us-ascii?Q?leHSTuZ7H6YtKc93/r1Bj43aPkHM/yDRvAlb7zTdsfkHxbclAdPVRp6jJ8iU?=
 =?us-ascii?Q?QTCFjKaNQX1vvv2JVPLOL5ZH1owLvW675OoHViF2d8FGQGZZi4izXBqzQneL?=
 =?us-ascii?Q?AYM00jM1+HdVCqgxmXHP4wyZSFvQD74sUgRFSIHghlHBZeEvcvTeiY7IHzNw?=
 =?us-ascii?Q?pjyu1bm9MhzlVCMKKTmxp8goHgXUsinrWJHWobjvt0wRB1MUMhHfVNpT83uy?=
 =?us-ascii?Q?7DQlgJjUJzWd0hk8CpRBkeWaZjDRF0BGjDdos8uU6n1pH/Id+nX7C2tr4o6B?=
 =?us-ascii?Q?SFqw7tm4Bl9EN/GPXbCVHX1PUjmLP4XeOtFbBhEfWs+DN516Gfdbal/ax3vO?=
 =?us-ascii?Q?ZGOyqA61Ef/w+wY5SAXmp5C6qadM7Kai6Wi6jcFskY+jahxingkic80/MTPK?=
 =?us-ascii?Q?0yJo59Zs03JHc62gtRdEM7WtetGFl0kLkSXj60ozV8sFTRBYjZymNr0tueDb?=
 =?us-ascii?Q?XleQfwqfAxWOlRWdXhAKxfOt00dZ+PDJhU87k9jfZRiJsKFt8Xu0vgpGw6gl?=
 =?us-ascii?Q?69jUAjUEAKQLgrmWuZfCYIYObnb6vDWrUhvS6ri7BU+bN0/pj2WneAVO5lGn?=
 =?us-ascii?Q?WZxryVCILtlj3ReOFeHhX1sktZlOanQal41WRqqnkOhb1XXxdY/8/7y9dYLu?=
 =?us-ascii?Q?BKL9IN5koXjX3MNwCwIqLfViXazcXb7i8duz6j88s9BLI8YVZmeK5ngKMPZm?=
 =?us-ascii?Q?BHpOuCYnzmJTvg3FYFm0GvEOXkhgK7ituF5ZdTRKupo6eGWzMCLzHkQ8BZNI?=
 =?us-ascii?Q?ytJzQheuQSm+mokGpijOLbKrAJfOkCdQdwTxdeVHrkQYyW2Yx6GqSZFdV0VI?=
 =?us-ascii?Q?GOlGtHmjktU15TbC+rPKqJoxT/+ya8304vJFT5SOIKPWKHoF+mmH9pC078vs?=
 =?us-ascii?Q?gmxZbAEmQ9Mm58CIpCFrVCJFoVmhPTSDaVGtej33qwvlmWKtE6nwYjG2ugDB?=
 =?us-ascii?Q?EQMhZ+dfdOeDUhBXu3DBTTHKhrcM+wsC3cQb8y9K4V4yortcRMH3In5IszKI?=
 =?us-ascii?Q?FOaAIvmdO6eFVcfcJ21YyhDhEijg8HQt7eVufkCYFag+b1rgK0ElROPh7IKE?=
 =?us-ascii?Q?SyAcg/UULKckDK73U092zBGOzFJb6Fecl2HAbiEnZCX6HzevsbDlimCCHxIx?=
 =?us-ascii?Q?54EDMvX96wQ3PYk0sKDUZ6N8dIJrrYa57EoMmHYPx1JSwfe+8h5IhCjeKy2x?=
 =?us-ascii?Q?eiw4NB3YAie7c6zZRF3e0dJfvLOizy5zeRA8ICDJ2foD4zkDppHN8/OI9THW?=
 =?us-ascii?Q?F+/estDYkxzSJ6k+eYorA3hFNhLEdpUUaVHjyl+aRrFp61qgOz6YvyljF3cC?=
 =?us-ascii?Q?r+gnB5pywM8OEJ6utaASZksh537b41fOm7xkBeerAV+zc7vRPHgJrXxyxYif?=
 =?us-ascii?Q?tnrHwSNtCmu872uphmKJXBuWLXZgC2bS89RuxAh696yfVUHXKOSN9BvWD9oM?=
 =?us-ascii?Q?DM6a3UzxSlAC8SXl02cueerBrioL+LdIpRSqlFgqhQVuSTq6t7IOw4tKme9D?=
 =?us-ascii?Q?RjqISPxGhj3s0ph+U9N6thdRSBjIovxvWXef5pcc04S3QwrL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b0fbaf-5ff1-4ce5-fc06-08df42f2ad1d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 08:30:16.6074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoDfNwkWncjhUqNu7SCUSteg8o3rPbpw2+EM/s/Q2A0sSb+CjVkN1FJjip51R5vaBIiZ1XgvfLVKPo6ahrvd2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044

On Thu, Nov 12, 2026 at 11:59:28PM +0000, liamsmith827 wrote:
> The following is unchanged:
> 
> 1. Packets can still be sent via the specified interface when the
> lookup does not match any route, which is the original use case.
> 
> 2. The fallback is still always taken for multicast packets. The
> precedent in ip_route_output_key_hash_rcu() is to not enforce
> restriction rule/routes on oif-bound multicast, so that precedent should
> be followed here too.

Please also mention that omitting the fallback for multicast packets
will break multicast traffic in a VRF, which hits the default
unreachable route by design.
