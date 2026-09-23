Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A249E5E8;
	Wed, 23 Sep 2026 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162979; cv=fail; b=aoy7ue0lpIvnSJTfrb1wJ8oc7rl3ZPicIlNhdl+On9Rc3xjcOFDKbSPIcG61lvb38x0q6YId+uyoupXoq3h8i22PxKanzn/U5sbqHsBgJeQXHesbXbOyiCoDKlNZArCspAKLfjcgmR3g4oLqwwr0jU/LwH43XqffWWklsQ0kRtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162979; c=relaxed/simple;
	bh=cQqjB++KvZ87RcNz8CKeZToqs1PgLBz4WFgIV8NDFKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=guv8Gzy5UP6q2SGQ/kNJ91rRGqJrxO3bs0ceMkPv1xvUYplYw8kPvfXb/emIj0eV7rc0ZMBW1VbvTToogHHGiFrlu5rlpXVWrDxNpNtjACGpkJTw8cEglHJSOcxDoy0v7OAPGg1EiLwu8SudPhCg0HSBLDuznVqZJleL3ipB8bI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=baQj8S08; arc=fail smtp.client-ip=40.93.195.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="baQj8S08"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCcdn+Dh4/9DuNYRh8vohSF4thyeZFRcLCVRszRHBa8kgd6o4FosYyoFtnMjtahmaZ5EDWgrZkLZkwsOTJ9F0HKk9wdf8LOUWFsJd5VokeQ5lG2zjCRp+Ov0an4SJXR8neI5jQoyNEUILfivrQBJM4zM51PYzX3KTq7DstoVx8Xqu4DBE0+cLLgytuWf8WiMyjkZBfzqgtf41TOpuot9raNWA43XrD17ZqIlR9GfW07FNOQwbwmH4k6MzPG4cDfa+7sT2R4M9MB61W4qIkUdNtHMXjLMqK9ZB5N8Uo+3IXoNciTRsdq5P2jTzSw6CE5IIe7+ICFvxYGkQtkcMXnYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scEIEwoGxcNhIhU+dQc2DSOMvetZUVcr8y6Vj1NEWig=;
 b=mT5K13GoBNLh1Jn4GmUZvjtig+2VPfEeaDGSpANyFxEk+lSRIThWrKBDJNPZf6n53OrPrxze7cLzk3I7WxrCD+jf4pHR+rWOsDEuCZJD3iIkF7MAvjHUFbZzeBtJfVSMwXL4ozgdj7Htp6qhWdmajA2jBoS2mYgtM/du6a31vp7YXRBHmoJso9P8J7m/J1YFTXH1KUmJrhzUMVR134eZprVs3f6qmL5I6KXt+3xajsj22aRsgMUeUmgaYOGR+4iZqi9DCbC+EmeTuLnDq6RNvy2F3TNvt/6UQ/U6k07tjrKlTP0gxlCeGkRwaqD5gwNwmXtP7tL7mLDoOvVS1XcLlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scEIEwoGxcNhIhU+dQc2DSOMvetZUVcr8y6Vj1NEWig=;
 b=baQj8S08UAvFPozHK9wLKUM7ygWnyeI1R+uwp5jt9FlxNpL28oJ289oZGwogtB9urS9hDozKPMc0cORXXcveWMnnlxHkN2Xh02UDmfQ1JcamqNuJkq+LyeF1VtcG+PfbV5w4qccow1y8+SltuX3ZwQa+URA2Wtx4e7yegY3qc4CCMlCZQkZfV8mVxDpvLXFndXIUSIBu5+es0obDp6SfwygSulyw8aPbDVDVfZyPghVW+IXZv2FW7nxxsX9XLBVA7vD5dYavzaLUIBjcgxlZm+2MhkNJvhq7MGJeF2Cx9g0N6RJZiENWkI2wFgimE1gmOLfrPFEH70D8TIrdusQpug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 11:29:27 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:29:27 +0000
Date: Wed, 23 Sep 2026 14:29:17 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Eyal Birger <eyal.birger@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Xin Long <lucien.xin@gmail.com>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/4] net: lwtunnel: accept encap attributes without
 NLA_F_NESTED
Message-ID: <20260923112917.GA2749166@shredder>
References: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
X-ClientProxiedBy: FR4P281CA0430.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::20) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: d1be0a19-5689-4c89-49cf-08df1965ece2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	bOANnMEp87sNdLVaikJciAgyoEIZEiNQyeozzkyeCnijjjuoxZws4nJPiDdzmWr25gQzyzQxZ8aA1YRtO1PZsrvkxfDrc2y1JLyv8HYJg/E7ef3wzipumePAgu5vxNE4PzbOoJiXU1oV62Lr2QE2nQ3qJ6xkYTI/lVRXFXpoPiC6E/mmpJ05xGsjGpKPGm1sCrfRCWMhUubuyiOp3wjnO+Za+BRsU3mO5Qfwek0AYp5OgbTNd4hXHiMB3uv53Y6HuZEn46CPmcUTKvQvyZ9LAUbBafXhJlWARTfl0z4MbZEFGIjycgoRI171aX2Ba1MmIDxI6E4G4l2fK/cMqLT/0PahbIAk9pSiuuSqgkxnqQNoXGIoAOCmVsdJyW5DVri+5KisPolQO3LBZJFpU3Gm9Ekk8+XAAp01kzrSGS7cLPp8nkfr2CGGqNO+bD5Js9GIypKu+l2QxhLpUTlJCZL2j+pRHfcCY6gW2AxZHJMEEmMgzrBeoAzf92kPXul1fefrCPIwFeL1o4Eqp3HB4TagSLQKUzd0fhN5UHniz6a+/+/wL68xqoMx9oQZzelR2RZBn3uQp9g7NnamTxIBPoo5vienYI0eHl0g85WMXgqycZCjDDxmbzyHF0+tCv66eWN8ubuKMADEvuK4FlKcPYO0qqg09YlrGp3ZLbH3FY3cEeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?niNBtQemQwDymxusUuw1jX6CmehzXH7yKN6ULLykuUcnvGMRfPFUMRMVvkd6?=
 =?us-ascii?Q?7cpwMcNjjIJ5S2HLMoZ9luuK9iYW0PQ+yCKO95ZpxdQp66oVPUAIjyCV8S0/?=
 =?us-ascii?Q?lOflTD7+d6gthUTcnk5OgaFrOFlVpBpz1aRZhYGvVWtd4jzHtWCsZthsRa4l?=
 =?us-ascii?Q?+QirDFW7U71GmqCk49ooyrLfBEB9jINIxIfcGGsnCrakZqP6kXCBGL3ZSMUg?=
 =?us-ascii?Q?zrDQ8SGT046R3v+paFaTb55gdJ7fc4dRyAL1bPtAbzdDQQq7SLsBFaUOYE9z?=
 =?us-ascii?Q?f84o2LtsvJwbCvpGV5OtyObvUSmRk6ZgTDFMZGfj25QsvFA2Qbe4XEW9N2j9?=
 =?us-ascii?Q?0FsPyPgT/xcu8NaO6KYxpYsHt/qdRwdN0yKbd+H19yufC9sJRBddRC+Q8fyx?=
 =?us-ascii?Q?m8nG8fQz0MnfblZAB0cD9qNVJXIqCVdO0wXcD+ICobwyqhAh1uKsXnvoh1WJ?=
 =?us-ascii?Q?38nXhHmxb55KQAzHZJwxMtB5loD563mZZF35hJjOA7i+6xdTMOsAOBjw3CBM?=
 =?us-ascii?Q?HdrhmtnWAr94QusYdl1w1xE5K4WgxoJJhjdJPMk/L/rYKlnO3GIUdJaK+4RY?=
 =?us-ascii?Q?7BYwdayTPbI9EBCVug9QZy3jn7YUBM4Q0tI3J6uoBIy9mkODtVL6t2UDYjUQ?=
 =?us-ascii?Q?40G9PzTOBi8nXvMF2DwErpZ8vLVKcAPNIcFDXhXbscyV39ECJzj7CxEdI7WA?=
 =?us-ascii?Q?UzPFd8TybfOq6cNnEFwGqlNKr1D/P0O315YU8jDipMiW+KJjrc784I2jm73J?=
 =?us-ascii?Q?A0TETpk8LF3dDgBRPiuQ7QHTHSSERVJPRxz+wgIVjwIjq7EeK42oKI9crejm?=
 =?us-ascii?Q?0Qzqe+O2aUpGuWmFdUVk+TN59KlrgDuJLhh5PcZ5M39R5Z/fP6LfiYkdSMsP?=
 =?us-ascii?Q?MlKE54/L5egqayMNefoRLoQDrT2ATXt4Ul+fXRPSV8ivDJkiskf14x4aYw5y?=
 =?us-ascii?Q?P4zF4+H6kpKlq2CWQHg/EE8HYSn1e2/NX2/kTqOwte6RxVZXCDwLlWp+FSju?=
 =?us-ascii?Q?3520wgp62qhdWTnxsRtPA+EiLrHJAYCeN1QkRz9WuUF73jhDN38DLJOymV/z?=
 =?us-ascii?Q?y5aVGEGEf34TmJCNq0ZOcF57AhEPljSyTUcbfQEkyRUu3Y29JJP3goLynSLJ?=
 =?us-ascii?Q?tuDVFwYI9mm1JXsnMWArjpGRJde/vRHSklZnoNkxboG7laPu3uII+w9ASTfU?=
 =?us-ascii?Q?z1BYvAraUrVg1/osuuKbT7p7UmGZiuumCQ82TtCcYHe9X6xvnYf5pPo9civC?=
 =?us-ascii?Q?RIa9hfFSBvbe73kZGwVTlDvkWPvg7h9CMvce+k8lsCehqGE5jOwksHJdRdjl?=
 =?us-ascii?Q?fulOIW3EKjvKwLQpNLivVV4Stvg4QN+W29zyCrggWI2lunO1Z7HRHQGjoywM?=
 =?us-ascii?Q?RscAwrzjgZHsNr8uYLMHCeBzmRlynxgu6nk9G3B2+4yEXYKrUHBiY6KcnI0K?=
 =?us-ascii?Q?0TY6vcFuQdtQlx8r2eQaJFFcd7OitdwqcSjB76u+xSBsRQ2h4QJ87NPv/sLK?=
 =?us-ascii?Q?Pn6dFLep2qR3u0LdQeJFWDerCLBDU1NpMuNyjRuwFZyby8ezwpaO+4ldg7qa?=
 =?us-ascii?Q?1GhOTOd3xMVZc0BcrY7zJAndtYQMD01gXr38gfW7AF7bB0PhvNvsaJRNikvc?=
 =?us-ascii?Q?2Z/IQoKusQIRPP00nFgXnfcOHX8gYJjYLoZTnQbH0sXL6D8lS80cyrgdZPCY?=
 =?us-ascii?Q?nyq2keVeLWLvU+pU5lhbaHD9YythyNlf3FiXLvt2tPZHdsWD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1be0a19-5689-4c89-49cf-08df1965ece2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:29:26.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+BqLCuqpoT9MqOl+ywTipaabmI4mPXUj7jDrvWrmxCkBnm77ZPIKF5CIaIA84qDwWl51+CHGz2Xqoh3pYMbYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

On Wed, Sep 23, 2026 at 09:36:55AM +0900, Yuya Kusakabe wrote:
> "ip route save" stores a route dump and "ip route restore" sends it
> back to the kernel unchanged.  The kernel dumps RTA_ENCAP, and some of
> the attributes nested in it, without NLA_F_NESTED, but rpl, ioam6,
> xfrm and the geneve, vxlan and erspan options of the ip and ip6 encaps
> require the flag when parsing them.  Restoring such a route fails with
> "NLA_F_NESTED is missing", and none of them has been restorable in any
> release.

If this never worked, then why target these patches at net and blaming
up to 7 years old commits? I try to follow [1] when deciding between net
and net-next.

Also, did you hit this in practice or was this flagged by AI? If nobody
is using save/restore and hitting this in practice, then maybe it's not
worth to loosen the validation performed by the kernel.

Note that nowadays many deployments program routes using nexthop objects
and ip-nexthop completely lacks save/restore functionality.

[1] https://lkml.org/lkml/2018/6/24/113
