Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5A2727EB;
	Thu, 23 Jul 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792974; cv=fail; b=gQjuOq++LSVaSVi2ezqyGedn/DENwF4IBZCETVUhXeT/YVm+bZ6aweBBlMx6gXFHKn1C+JtZ0K+KcDa1QnL3rIXBLtx6Q1fwcJsuEZWKewyUwvtH9+2R5EwHdlfwFk2O4lZg8OTqojguYWH//tU52ceCCEV/31I5T8lK+iWnuPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792974; c=relaxed/simple;
	bh=8sMH6XtPX7o17Q9XleNgzhg429kYavHLdh6Y9+vt2ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FBydBjUGCIb+wl/lfV+wtKATTViaa6StDh0rQy54KLqCVI0NS4J7mFveEiBtUEZ6coYVPOb8xeS5wzqP6hCQ34pzQ7PkrmuGIzslEMmTKF5ScXtMBNd6TGmC/7OvqVeQ0kYh2GtiJtfHHfDwlaqqYxymyeb9n1XcMZT0yFiU5IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=owhgZerc; arc=fail smtp.client-ip=40.107.209.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="owhgZerc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5SdP6Fbv7DXoi22pqHcWNZY//ywhmi2LG2vWvBZ+HK+rb0CDKRcm9LPjCGaodFH5MiJejgVgkGBOhx58bV1hgrbrbGz139V1zUldwBiI4C8kvdRyq64mDy/Ij1C63DK88Mg/FD9dNF+MDMvura2FKx9i1lJoLsZQEL29WP1j0Leco9dzIzrhgTz1obPJsXl7RGpw399/WePUHmcqw6EnvQ4lhfEM/1bbMflHsVeEO5Uj6wU72I2bCFPTSBYwtClfFFf1vXtsyCZ9zi3JI+LyFjZadISFQjS0jefftLcr1pfvtEeXzTPJF00TwVXqcQ1iSrjYiV/4+d4cO1h2msWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPVk0wkRzHkLdzkZW+zL5VpojFENLbUWAg2J7qFgX2U=;
 b=q+z8JwUr9sDJdufUCNrq47xHaUucRO8+t4qFW61XhK9x89TILdg8DcVSIinZK6fzsB4R8vP5MXNrW2QEmwbFW0WkMdq950TjlF+0YsrK5DlYLxnSUmnQqeIQOigIy7aMdGShjqtbLhEU9sxB59MKZoHRD7Dq3XqvKF0Gxv7kOQlbddj3yvywPw5ntPCtT3Vq+51qO8BG3nT/mMep2LDGiTQxmCiodImJTx2VWdsfe43AKdXo9fngY5K0UXs6QSMHbBGAHqeCuD+tF+17QtTgZF0kN3vrqSuISOkHXSNIFesIq+uW1kLnR4j7aJCADPdx2FRIZJ+DTg3DxC0qhMr14Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPVk0wkRzHkLdzkZW+zL5VpojFENLbUWAg2J7qFgX2U=;
 b=owhgZercBqP4yQ0DSml5+loBKuAayq9O5kMUP/rMCV15RRSkhAcWDH84/5BEnSJdi8Xc/DUQm7FPnmZ/scGZkrj6WwRgrwqGZj2gq3yZBiUa0gBzvcSqZBihpE8Twz4E8cL528fbRBZitXwaXmw4Kjem2dHBYlMp0ekyzdY2OqhfCMWNg+/AINqjjCV0GteU3L3IrFQLHZj50bO/kP4A5ELU+YrICoL73mClOx/GbPMogwu1DRpVaMmFH4St+I/qK3ATx6y1CowzT4pRz8wmPpZyK6Msy12aJWuB+luIiuaLOJJE9mYvJJHXjhsNPVh6LjrFvA0kXn8AiVw1d9po8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 07:49:25 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:49:25 +0000
Date: Thu, 23 Jul 2026 10:49:16 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 3/3] selftests: net: add coverage for fdb
 nexthop dst_port
Message-ID: <20260723074916.GC3189375@shredder>
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
 <20260723-b4-vxlan-fdb-port-v4-3-46e3a2dd88a3@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-3-46e3a2dd88a3@gmail.com>
X-ClientProxiedBy: FR4P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::15) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|SJ0PR12MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7a8eea-5966-405b-4b7a-08dee88eeacf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|6133799003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+JzkWv23Km2i2b72uNhzcAG519rh0JpJhxUD2n09x5i9U6L3k0C7hv01gI3JjMTBKcYqkoCMc/OdHu3jzOVDVd9fvp3Onh5/iJOYG1/XtO8e9u10JKYmgQJzi7NeJ58ZJ6btrM4if6mObiI1AvNzlVnPmnezZmck5XvN0AAuY3njDR6trEhm+36OdG9rgpR1524rccQKU0VExgPmjerQgCu6krneGWR5Z23965d5j441ph9MDG1ql6CIQRZFrXyAie8b3Xg0P/ZQTTCwakHK9o3oyoCF/xd0/SDfNYRjbJ5BFI3FVl1A5ABH40zg348AftOz62Y3qSGvGe3i4FCgISiB/beHc7x1Yc/m39Xc/ekl0tn+ITxeisOqmaHxXMpdFTXVPE2usZajT29zEdFYlyMwViSJC4dvafUeGrVMvm5xKSOXBYXmHa974rIwvGwUR4YWTEmsAjoeKzyuh/VbYbYhUqTGg2liGGsHGpgZrn+F+WoFx9qJJd/C659SEusyiuMoNT6GGwkcxfKMaC75wW4CIL+kh0xcIm4BgzMK8JiskQ2+N8SgNtStGqOmyuO3fGBOsjwpUpHh/PzP9aUO+VFfdeEuyFXXPYl9TteI/PftlSyeO4+zfXDgmfyKA7wtpR3yJF5jap+DX3QfoTEUyFeDEjsbAVHgiWJJL5j0mZc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MyFdyjGIyNi7qDHtMi6jojtknrpIeOl2rzGCEf0jgjz2haPM9JDSI4dStuvc?=
 =?us-ascii?Q?HowUAv71ugnC5X9HV4a1gMNYmScJnTETjxopiVdCcx+tt4aBSooUrpgfVlai?=
 =?us-ascii?Q?rBKH1jr2WmLMZxAAWvGRwwx2s7AC5w/b3Xp/fhyAg2KOAv1ZodZ4f39ZSdUr?=
 =?us-ascii?Q?oq+D94n7cxYShAP3u1pGlVP+FJk1U7jzk+0JIclsZfoRkQ1TD4cEwhbUQTex?=
 =?us-ascii?Q?D4VWO3J0/bFZdUVME/092E5f0eYG2ToKxqKsTUAb7A/gOmlliOOpPegmOY5x?=
 =?us-ascii?Q?gIsm8buJmWqJ2va1pyC8U+LoOHkkbC4IZT5lqbrFGyC4C9i+y5Cg1jfFAmMv?=
 =?us-ascii?Q?1JF05aD4VLSOVupcUhoqIG2Qcb8hi9qH7yakWPsWjUHL8BKXxQu9LPb5F8CS?=
 =?us-ascii?Q?/p0erE8su4HTjT+4605a8bdo69MINme7soH0g8Esi4d7YigaPzZewGKUkLKN?=
 =?us-ascii?Q?OJ5PuulIffRzMmvXRTsxvTt+XgqQ1ky2TtfeezJGpkmmxVAZ3pRaG0Fgv7Co?=
 =?us-ascii?Q?rfvTCiMqk4F8CKJvd5sPbMVlGcqdnLjLq0PL58gT5CIvBtWTAYZPO79WIe6i?=
 =?us-ascii?Q?NYX8EpoGheBQNYv8dkGKnkaNravvg1iOchf92LTg02y1wX26BoyLwBiQG78O?=
 =?us-ascii?Q?vIj74DKRGrU/TR0XNZ+eP2uugTTm84XFqei1zfW4WlNsXmqBXGi2T17HL8Nk?=
 =?us-ascii?Q?EkPsCmmtFWYwS355qNijHTkvxllh+z2WS2D2h1VfO/7qvmBck7NoluN14wt2?=
 =?us-ascii?Q?oVSI9p3LgdDW/m9Qaw6NA35kUILRG+tMn+UaDfnJfGVN5lMEU8PSHb/VDxu0?=
 =?us-ascii?Q?ngMdjLbj84zNnQ+z83WXEOOo8+KTYTCRugpwvllgL2Xmik6wsD8PyZQFHD6s?=
 =?us-ascii?Q?R+DTJDq3uiMPmM88+yss+IIZd2m3/zme871CQQw6PAr9D2mzvPwnwUdqGTZH?=
 =?us-ascii?Q?pUjOnzNW/0HtP4O95T7uyjCc2mc9UsjRtFiB2PnSB9v34xe3EKP7rctiWqLQ?=
 =?us-ascii?Q?Xvycb1tP2RE7BpNSHaUHNPYRdCfdENTIxQmsI+P+NZDI7baMyqZK0aTSPhV8?=
 =?us-ascii?Q?RNw9xgqqdhEUhl5NLqO25gezoN7K7xlmZfn5LiQI2MuGMgEgc7x0YIZCmXR+?=
 =?us-ascii?Q?IhQSy8vebyuaZmixNTSgJRrwdkKGx/io3sXdTvl7IsYFuJ/EfTzTxs6sh0tY?=
 =?us-ascii?Q?8u9iPizKNPb4oSEV4btlC01/iGI6V7HCXTTZU1/s2ZZHt3ZBmUl305Q3RRRz?=
 =?us-ascii?Q?JcEg9PsiWf6pI0OvplH2sF7ULDMMZFJaR8Jb39PhSMhZf6IkaN2tzkWSgWFv?=
 =?us-ascii?Q?THiLuYd866tSkNfYvu9RpQ4IgyOJpMTQXnweFveqYTH0vIm3VqgOIGTXEODJ?=
 =?us-ascii?Q?nrjYljM5wdji8H79hRCyDk4z1Dct3XVL4pyG+XrEf9yzONnNIbSx96ZlqACu?=
 =?us-ascii?Q?sn5YI1tCXlCCpOoDi7q5r4xNOuEcWtSN5mx/TRXrF1mXrQRsrDFJUJM/Qapg?=
 =?us-ascii?Q?UJKR9XY0FQT8QXZj4V+ZTayoh4Ef9Yl954Gg3pHB2BbA7QA0hsIRixEstofT?=
 =?us-ascii?Q?wT4MnhexRWzr0R6/blLBnE62oVlofwYquOqYVvnLpGv1/a/7mXvCVQ89Rn1D?=
 =?us-ascii?Q?bmbzl57Rw0hLN9wNbTUdWJo1MVw1AgBN4YItIe7M/IlCCRQFFPBbre3a2VI9?=
 =?us-ascii?Q?a5bbiVLnZthTDbKfYG8+KRUFSB8IZEU3qSLnH+aJnBKV7gPwV61maKOzsj7y?=
 =?us-ascii?Q?dD/M+cTIiQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7a8eea-5966-405b-4b7a-08dee88eeacf
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:49:25.6906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZ5qrrc23x5CyH3whYZspUzkk3qHTgCt9lJU7aKoGtyxN/Ys2gG4fwBDAY4IRIAAsGD/hI6lmQNNf32ty44J9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8614

On Thu, Jul 23, 2026 at 01:17:55AM +0000, Jack Ma wrote:
> Add coverage for the new per-nexthop VXLAN destination port
> (NHA_DST_PORT).
> 
> In fib_nexthops.sh, new ipv4_fdb_port_fcnal() and ipv6_fdb_port_fcnal()
> tests check that a dst_port is accepted on an fdb nexthop that has a
> gateway and echoed back on dump, that it is rejected without a gateway
> and rejected when zero, that a group may hold legs that differ only in
> UDP port, and that a portless fdb nexthop omits the attribute.  The
> tests SKIP when iproute2 lacks the "dst_port" keyword.
> 
> In test_vxlan_nh.sh, basic_tx_common() gains a second fdb nexthop group
> whose nexthop carries a destination port that differs from the VXLAN
> device default, plus a flower filter keyed on that port, to confirm the
> per-nexthop port is used on the wire.  The test now requires an iproute2
> with dst_port support.
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
