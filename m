Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE130E83A;
	Mon, 19 Oct 2026 06:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390038; cv=fail; b=MBbKt8OhxUdTEK/ya9fPRaoHvZPemx637/EpdftolnI+3QT3Mk3fcrkYTXu42vFT6lckg8kGE9BZg5GtDNOb7zW1ZjXlUTvUrRgvklI4mi8uh380fPnL59UND1VknTkLvsDv0Ct9TW+VsjJrmEMGdcgpsbNspT9BePOwvvGDXQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390038; c=relaxed/simple;
	bh=OVn1IScRBz5p1M2H2N56vWnFFppdfSx2O1P6S38/TQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RVwgwmKgObN7FAGc+w3xG5g66u80ckEvH6qpERS2u2nZLWMGVrvWId9WnT07esoiMAecZXKy195vsTQ35QsflqK3Pe9EXUZUukuSaztKVGx1JQYzXkVh2m3kTM7saGa+o4itKVjSoP+kprLadsAQJ7LDbVt8jDPXmnHg+9lgQfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nijr5WD9; arc=fail smtp.client-ip=52.101.48.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nijr5WD9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vywtLGmFiEcWmN4xgEBD0WlPzsjk/pugjMn6CqDNI+l9IdVzgulyfFpmi7ng4yq944HQKMd0sBtA9Au2KhQ0KR93PJsLpiFwJygiGvpOYvufEIJYvxDycHGEtfw562tkPnObQWxNyVO4dFj3jwta6QplTTNAYvnifIHrePt2ScT+Yjmfj/N1V9s4X/zSi067jAlbmupLj5elO6l92QjY37LM9EFwPU2KcrNStvh0aMFzKMJwqF5vX4W+b/GHV+dVshAIMETTcEtEk4lqTqEFZOiFHwWqfBCdko8Q/tnKPpl0+4ZMOZIa1wnUvPB9pg3SRCVbG7tWFWtU+aaksI7HjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLMjWA1A01sit83cJIM5X2qDDBKh/8BiWF7CViuEDV0=;
 b=D/It19/7Ds372XUwLEfDdfjiZ3Uio/EL2ChKs7x3xrQAFRScgJ+wqMP1C4wBWFCqYYedN32tgxWNmF/kysAyzpYM7XrFyDZhVq+jeuDZFJ6OjfC9vq3q9JXYx3S5mnNRlrxtqj9NRhtE74imzKngfjeze2HBnGQamhM7eUyQCk0mbr8JP+jPEjhKGJysooZWxuQDT6h4iURPKQBIIUUEQBaTOND2Ym1f42MuvVRdDGM6bqxi0w2gvVaSPXat1B6uuxhbpJwcOP4XnUvy2XbUurx0hiedG8a1OXG94g7SUQQhRB6KC6DWxdYTbw00tpX6hHXnnaOsb4PPX+Kz/z7LzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLMjWA1A01sit83cJIM5X2qDDBKh/8BiWF7CViuEDV0=;
 b=nijr5WD93vNl07XTNfXuUGsszUXR5LW6ZAeDK87mR/iBPH7DNbNxOOFvNgFdACdt50FLUeX9S38aMoCE6MyGbUtO4xJLn7Mreui+YWk+akEkrzhdHGbNHJEtBybXrT8ACYBX8gXSLvbyNRz7umgVjgUW03d53r2FUNrw922C068BcTzoqVi793DPMsYBGpXpCB832MxiUf1Jve56Bu0LjAquS9FX7t4/zmp8q+7YdZmetqZe8uZOMwe5oITWXDrLNU42JTspcSCDuhtdRAc2qH592/zD4M8jcLDOKPn33VqpLTWqYs94/kd4I2E1ye72fx0v5VsUAldLtuUipsE5CQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 06:07:14 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 06:07:14 +0000
Date: Mon, 19 Oct 2026 09:07:05 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next v2] selftests: net: exit with test failure status
Message-ID: <20261019060705.GA2675112@shredder>
References: <20261019-self_ret-v2-1-43d1d11bc9a3@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-self_ret-v2-1-43d1d11bc9a3@kylinos.cn>
X-ClientProxiedBy: FR4P281CA0346.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::10) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: cf86d981-daac-4457-e724-08df2da73890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	RwD390Ivm/yfOYNH0YY7wcLSHb7Stf7ySxxBgPAwf96XEvQJHIy8Q4xgpPc5mJCi+OP/ANYxJwADlAHMGVVwRSIHKdpe6EZYPNqZcIvJoz9vOQkJBxdTgAKWuhU9T8Q3MwdLyUc19xA+xLcmDFrlJ18MrQXAsF6yuCragwgy3LLFYS0A9WDI7bxhXz3Flw35TxnMNA1YyosW3eaIe8bWr8WNdCM4ApwSCXTYXNcFPVlSZOBrC7NDE8Ffwr418oQtINoiq1FC83NJaTJx+TUBd1WAOftm0Rg7a27CFj5J5ero1zzlaoO6CMTk0j58uj8fBVPlZ/jpUcHTVSCMXefZ8SYB3Ru/B7LSUmnLE3l0Ez28bWGXlXk3kXu1w1aNE65C2YqoEOxELECVRdUorVA2u9bDUg/QB5vFEPvWf0zWEGwk4IxDWxLuFDVK1ECtS/TjjuHD26cfrSAi57+L6qRKzhgNKQzzY3uJn8rX9UdVl6QYKQeKNyznyvgdW83xZR7x4PJpzybbjFUuH1eRAVHn+SbLP6TXVLtlADgygq5Tft1ebiQIFglup114DQoN5Bgqguw+iJt5OLiZkkgNc4U2V0VyPJtcSxpBdETP4kVvdtEGrBrqReNGCUiklj9IbUBU7ig1MmX61BctBOHimKPL/X/hV4TqACHBtSgclBQ03tE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rhZMkInR4O5QNNu924Pu5BS4K+Xt7SUN4wEA3dcAnpdCaVKZpT6eKlEgEgS6?=
 =?us-ascii?Q?icRy9guwWS9qv49iCvN4Ctf/xuqgpzsmG2+eWIPW9j8y9TdCqFvTUBvMA23+?=
 =?us-ascii?Q?C1MR2tBN2ogGv0cmNOYpDVhsURbbe9f5cWc2u73V9mIUCqXI+nQQnw0ktJw6?=
 =?us-ascii?Q?TM/4ujX+Pg18CkFWbXkfBbVLNo7ctzc3a37t82lFHG4n3fy6SzODM5z5hPyD?=
 =?us-ascii?Q?PfFtDlr1ObGmEghJ7Ekktfhz+Ci8fkNqen6GipKM8R+V0XCeIBd0N16zi0Zl?=
 =?us-ascii?Q?aV3Gxq9xRcS8/eokjVKeR7A2SnObSQj/x33kh3mvgwcRmlAOYMeumUbPt0Kg?=
 =?us-ascii?Q?2O9qX2O9I8ZoDa0zfpPjvl+RIzxjtAMheS7hgc4yC647gYiIvsELpSl1CL5Z?=
 =?us-ascii?Q?JK2f7PnN11+GG9a+k6941TccjsOYF1+SQ3Ip0PNEVS9qZeS3AQyrrK/kkxAW?=
 =?us-ascii?Q?S+5ks3+PJ9aGPRRdWw4vwRwAVXtj2CQFAoyu48u1ztRYrC5F/5IWkVb7cEes?=
 =?us-ascii?Q?lvGDH/+9docuK14TMrFqllvUrd396vuROkUp0AF45//1gfDYJ7RO/+h+6aSQ?=
 =?us-ascii?Q?/Jw1Bwpm6HgmGixy1/4XGRcMccGDVBamq+P9XwRbvMKURTzRlrNAzGIRdbn/?=
 =?us-ascii?Q?Hd7mevPC8tGCRN7JiVUOUDcXx2tw4rrsjpBsAcp1A+EO5ZFETRRQWeJgANFO?=
 =?us-ascii?Q?RMuWbJz63priv+eLUwyh4/trWIYEa+wlZWvcEw5ApgOJu3jYEJuad6ox1hYQ?=
 =?us-ascii?Q?z3DLVREx+dJX4ssNuRrLB6CJjKTac4/amOTnATnr+TXqa65x1Bh/muE2PPVU?=
 =?us-ascii?Q?nW4Zh+dUCi8WzGvm0oDV2Fj+89XGQZd1RuJZ6JDVEVKzGQRt07wZRtR7XpOe?=
 =?us-ascii?Q?PLT74xAS2WUy2MgwGY7w7vt+mKPxBrKPj8mVNSAZImQnIfirUGkBNKOA2yTg?=
 =?us-ascii?Q?02cnWejRESceM6IBS9LshdK8p1Q4li30CP6ft0L9snP2Y31HFdgq9DS9sTu+?=
 =?us-ascii?Q?QcV7sOdzwK7xks9hrHBqT29fPQhtfKWF+UvwGtkJwInzjfB5TBZAuPVtJdYz?=
 =?us-ascii?Q?0+FNxzlCvlKmoFP3sV7gTfPvyhC0MnqNn5OnH68kBKUcadhiFvBbsG9cAxVP?=
 =?us-ascii?Q?Y+spknmhBJcRKSUtWKNlR+hhjuKl92PVXwc+HTlrOHRwKGirtPdv79xTfY3W?=
 =?us-ascii?Q?DD3hLO/S0u/MDEFiyQWy/X2qoqcYmhLJZcEDuRFpaSZsr6hGVJ0adF+BWbt4?=
 =?us-ascii?Q?P3FXDaoHQTaRIsSkyz30YlRs4MZgUPAN/i8rA0KJPgdYlRHw/i7R/9t3wpR+?=
 =?us-ascii?Q?NEHz59JT8sJB/YwyOT2+Z9lCSUQ+Bmw6WCUMUls9yixCsY71Bz/NB6ihPaLj?=
 =?us-ascii?Q?SI1+vmVazmvd8DEP8cplH2dA7aqwoGZYhlpEW5AMlWqls1BSAWWXT9HBdnY2?=
 =?us-ascii?Q?1fBxAnRBtYzcHer9Pke+qiIxRq64ylDX2f/XpEG3TCm6oODN29uY7l346XZN?=
 =?us-ascii?Q?bkkJE9jApm13kz4ZAkUVa9BwpNhCnSnDJzfRQjDciNsWnJI8yXNicaHzRYuz?=
 =?us-ascii?Q?PIZneTXVuSC7eF69X/19I4n8m5WwI0PsdsJDsjgRz+OVxTDoEKGLuj28iJE/?=
 =?us-ascii?Q?VGUJIjfk5YydVfba2vhV5NtVFUtBTo2/UEJ5cLcl1LNwS3B2JNmVuOQOEYGi?=
 =?us-ascii?Q?Usmm7iQb3mBg4jyFNKJyFlslqrG3PP2nwzknNDDaTuEvmUAi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf86d981-daac-4457-e724-08df2da73890
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 06:07:14.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OB2Xh+w8FjT0/qGwY8YVHzAQCC2woX3IzvjVk+lae2afYL6VivpAt4lf/8t4p2QsAURinRrMIdDEr32C2Ni4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225

On Mon, Oct 19, 2026 at 08:41:03AM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> The changed four tests can print [FAIL] subtests while still exiting with
> status 0. Their log_test(), aka log_test_expected() in lib.sh, helpers
> record a failure in ret, but the scripts never propagate ret to the exit
> code, so a kselftest runner treats the run as a pass.
> 
> Initialize ret and exit with it at the end of each script so failed
> subtests are reflected in the exit status.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
