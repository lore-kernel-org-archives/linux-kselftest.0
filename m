Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C21624D5;
	Mon, 12 Oct 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806189; cv=fail; b=PF5lV2Z4O7MfZ92iQSLTouGsClzGFIeiIlab8phUbOEEOmX/DvyDBfdqEgnbXEcm1Xo0O72Nexg3d9XsyPGQ6aKKI9IJg//xgZvKJWy55hD8jVtFvQc5ISyq2Iqqa46dOwLqNA/YwfGNqs6gQaHbf06xUtorZ8Skd//dZFXidWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806189; c=relaxed/simple;
	bh=WFJ+DcA+bpJfAuX+6+qqnb2gGFxW4+JNKH+LMYyXElg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NedgOLgo8ZXJaqLt0TMFo6zf2oInOAR1x4GfFjzsiZRSZEQ0CGALOTDhGmu07cdkj+ivYN1fTQ9GiCBw2GHSwzYzQr1O8vRcr4z19ySfMt3UoUJykWKDpIKgTd9TEcAv1P9nzndLw/yd0U17ju8+52SrNAvH2SBzfZr8p3L6A34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W7tcphOl; arc=fail smtp.client-ip=40.93.196.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W7tcphOl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVlk2KKY4WCQLYCfn7Kg8c/oSnAI9aNmp70m1y43l0nHzufTJPKhdNDx0gVG6uE6+IkEUJGXXS9K9+NifNHob7uFNS0Nyg6OGLRgWWdsTbuNCKZyWG7WgQE6maOUFaehtx4nOiB1S6RrxZ6pcfceGL71HBojRskNpQh8Ssu0IUU4iXepwPzSiCNxV+825QOb9ONyUgq8hPg9sbka5FJX8N0OwVwEM517SdupYprYOyKY8t7Wy37p0FMX2l7+DfZ2yTvksVyGPFbNSQpjnrX22N1B/QlqjpHUlv8QZ2b3U2ZKeTgoC7YWeg2gZOtZ65dbUZsl+GCleJlfYd7EnSA6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn0Xwmi9PxoUHkYMKD3g8nNEqFiSxFFWakzv1Prf15U=;
 b=Ojcn97Goe+zbiZYNv2vVWkuVSswDYWfaYqfBqHLR0ybM1oMmjdxK8zbbeKSxf4HHvvi1aaCDxcMsVv05sTVvOE78lFgb9o1zjafr+3L+a66HUk5Y28mm/1jqECPsDM5xgnKNkAU0raBtoFhPkqX8sG0iMdBOxx1RVxyp8LQxbg2AakSYbeFpE3zO3iMDDBv/GhLh85XsG0mbYlK6Yew47g7RA0FE175er9yknZXRVlgcXIKs41ZMEjCadMpj+zOrpIy9bmPhJNLiwUnPhSbBI7Cv7h139iSS08WnjYz0wP3Uc9Pxf/3KkqHRBTMpGqulaa1LdenPfP2E5hgo58+pjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qn0Xwmi9PxoUHkYMKD3g8nNEqFiSxFFWakzv1Prf15U=;
 b=W7tcphOllfm+tx3Y0KnXUgFABuVNXHOkqncf6PSjNLRo1xcFX9+TqLs5xiufLCtWH7593Fnuk0F+BXbRKUyWiAsLh5VGn+wG1Sw09LSmv+Mv3JIiHl3DUkuxnTChh8c8OwWT54M9IRthIzhd5pY5pF96idAKiQEvXEL5i1/U7iaG/JNA6IYsm+3wKi4syYeV3CaA3682rxSNst+sVs35DmqabPcXQryNqEJk8FyDxNHwYtWAxnbfAPmXx8D0YAdrlLHA4eo7fRKf5Y/jSpLti/CJ32RfWbHDV8B2/yMShPqYqeZjDPYNv2rQ5GlNjTEgpRPeBYxuWybbHXf4vCEbow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by LV1PR12MB583771.namprd12.prod.outlook.com (2603:10b6:408:508::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 11:54:23 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 11:54:23 +0000
Date: Mon, 12 Oct 2026 14:54:14 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jin Li <jinli@lanxincomputing.com>
Cc: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: forwarding: bridge_vlan_mcast: Allow
 default startup query interval to vary by HZ
Message-ID: <20261012115414.GA704996@shredder>
References: <20261009104109.754133-1-jinli@lanxincomputing.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009104109.754133-1-jinli@lanxincomputing.com>
X-ClientProxiedBy: TLZP290CA0005.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::12) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|LV1PR12MB583771:EE_
X-MS-Office365-Filtering-Correlation-Id: 15bf61cf-4047-41f2-8ce1-08df28578ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	w350lbsfE3xCh4OqvQosDPS1PLe8S1OvDgNKemF7Ntvyd9U5DXrLXwuIvHly9XkaLZfdaqbm9NBupA3H6f7i02tmkyixyKqcMARJUFGHmlfqmZEDe3yD6u+b5vURQCibGiV1+soiRwaqZvCtKG/SedNU2+jkWvp8CkGnLmu85vgcA6WUQIin9cvaNv5TWPrPTKiAn1pwZs2cPkG2RMEbtC7uGll8WtUJ2/USog7sSLZirCRWFR7QOTbDJRnDVFDcGU2r0nDJ1IyyNfLlFzcBEoZ1LtwkLFNtjkeC1xmV+TlakG2KJnrUF4+z6K4jJ21jlF3Uj36raIhS+5FJe628LyMxvcST6Pz4m804IWa68imgxYyz9YcgAWLknM/d6QuUOevhAuQ74hSAhPY8f8RS+cyI1FPzjFy4D8MU3cL4DQ9pXKbfyoGwx1eD0IunDNBhP1Zu5gdnkEBb4SVFTKGBlO5BacDPrEH7e2CK/o7dCks8mb0MvJju7q/8+mbScJxvsS+NmUR9qGyktL46cEjPGMq0tKJQ/7CX4XKkwzX+JK5bPBnfRuLEfhhgd9bDnPfRFn7uZ55yEao9TzZH61G5rb3Olu4VztBBsiQ3IFeZRtxIyZpN8DrR9YM/TVqTYYCwI5Z1UZs2Fvp1Gw/rFn90GvBVb29Pg5JEMlObqPvt1eo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L36vRW0VMHnB1XHCbe8T67yZ/d1VR39JCO9NVUxtMRuS7cEhRi824gL10zgI?=
 =?us-ascii?Q?q6/rnG0HUJ7BCyzE20/Su4+WSph+q0PdZVtO1wArqEfAIBKYWFsMhMPPiBtj?=
 =?us-ascii?Q?toGzDi7s45A2TsA6QipvQyE+spoh5tWbKWIrlhbos6lxODAIMUB8qCVlJY0/?=
 =?us-ascii?Q?8OoTqQITT1lVCq4sfmLVgo00sXollE4aGQPu9L8O8QGa4TgZES1Gv4FKaH+n?=
 =?us-ascii?Q?fYUzrsNdSEnnXyokd8Da1S7o1OVJNmm47LSJjCjqIYskP7EE6+IgozK4vygf?=
 =?us-ascii?Q?/rjwA9C+2xWWdFqs2fuFuJxNrym2FJiIuCXS5212WWiTYqq9+twFbwxar9fb?=
 =?us-ascii?Q?LtpQ3JCIIkbjlSSoRxtyq5IIXrHoaVKOmvre9d4uHCECpwEzvu0LMwNmlP3g?=
 =?us-ascii?Q?nusBZKxaRqvaOxRPU6EbzDp1EoAoouHjXkA1oBsNYsbm9jw3XdZPklLZCs0C?=
 =?us-ascii?Q?D7lANaqVZlrV5ZqHtXFIpLhcE1dz5f1l33tIwJktUVKvPXHkRe3z8zYF8r5M?=
 =?us-ascii?Q?LVpSOWUFLw5Z9SUZylEvBP9rRkTLDJwojO50tNslaknZilBtbvFN9spzTA8k?=
 =?us-ascii?Q?D42o5e/7VE/pADGlTNJnf8VMxvdT+3xU3i8OLW4x6z+CFtBXyQlG5Za9YGU+?=
 =?us-ascii?Q?9gQDJ6cugIESGAEjYZMcOEMAwlyZ/95r7RlYn3UDGrcRDCxGKJL1td471/Uu?=
 =?us-ascii?Q?27XtOYAfdLJNZpOAvWEEUq9qDNPTG57yodASrxvbaIifQ8NYqesbmJKAlBCo?=
 =?us-ascii?Q?LDRd5aD4zK9ixJhZNLFPV7TWIyTuZ2nRUZJRtDY8A396A8Dka7d62+eXpWxl?=
 =?us-ascii?Q?KAX16K8NfhbVw6r/s46dlyfs8d+f7YC+ZZhbhAcd5NtFpcAVTByqTzrtvt8X?=
 =?us-ascii?Q?O1PX/0jaWjJyaG7av/AdXEpVifxant7hZPYCI0HdX4yLJhS8FrZmFSQXgg4F?=
 =?us-ascii?Q?AtItd/luAPtuQQINp2lrP8vPLu/94/hatyVd0KX1bE7kOsdw873O7NVbtDhD?=
 =?us-ascii?Q?mNOb+7+FP4eu7fRwHcHBGNpoQ8atdiOyr/VHqHCCJ2Y2CAN48bz+mf5UNo9O?=
 =?us-ascii?Q?kyAvsrFPmksde7DCtEw7n1i5UN5OsbBn66I6tIIEMBH59wtwKzUukAz/ziju?=
 =?us-ascii?Q?1PjY+da890be37VOVmYzLXjncXvYq0jSluUj+yLSYRQbJ9VLqj0xKkUW/8Cp?=
 =?us-ascii?Q?cy1QYG04OL8okA598VpRnEIYdEiyr0yTlG2TNdSWm5k9a3jYJ1FXOwrqvLyy?=
 =?us-ascii?Q?9nRmWhz9hdXlbuLKSQEX+CyMcxBHbLkk4kP1ssM8Pq6jeBGlRCgCkr2qNuPQ?=
 =?us-ascii?Q?fAQ3oMpTI5wpiagserd/nEsSCmpGRhQxaGifapsMmvfX26PqfSNHDh0hr5Ue?=
 =?us-ascii?Q?Sod/rXL7+JUYSES7D3ufCdHRYaSkds16v35XLepnHmzcjHgrTbSACpXAzGyI?=
 =?us-ascii?Q?rOXhuiqTOajN0yd4RPJun+tnu1NdBZrt6eUqN3cqBckRyhjrUfu/cQcWzDZw?=
 =?us-ascii?Q?BCohRcgKFCDQXqE/8C7tCrtrvAuBl1oL839vXh4WUrJzBbQ3qHoKkIPKLy2v?=
 =?us-ascii?Q?rJJscHPdX2F91SaS/50OVaC9arIDXxPml5B5c5PAWLo9KCPzemqgZoKPVm+M?=
 =?us-ascii?Q?11V+UWkUGKkYIZusinBt0rOGR1o9VVyIh2wiOm9khcY77EgQbrzP4RcrE+fH?=
 =?us-ascii?Q?BS4ij0g+gB5WyqRsZYY/sOtEIAz1WIrJ9Su9eyzbjytIucp4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bf61cf-4047-41f2-8ce1-08df28578ea4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:54:23.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+C6Sj/uOZ683saj26pZ3uMR3Xg+MVFnAC5QiQk6hTNzK5rKz60eUlQLXVGUz2aQlyd15IfYpDp+pY4RPZdGxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB583771

Subject prefix should be "[PATCH net-next]" given that this never
worked. See:

https://docs.kernel.org/next/process/maintainer-netdev.html

On Fri, Oct 09, 2026 at 10:41:09AM +0000, Jin Li wrote:
> The mcast_startup_query_interval default value is calculated as
> 125 * HZ / 4. With CONFIG_HZ=250, this results in 3124 instead of
> 3125 due to integer truncation. The test currently hardcodes 3125,
> which fails on kernels built with CONFIG_HZ=250.
> 
> Allow a +/- 1 tolerance for the default value check to account for
> this rounding, while still catching genuine regressions in the
> default value.
> 
> Signed-off-by: Jin Li <jinli@lanxincomputing.com>
> ---
>  tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
> index c4cd2078a8db..e72680869721 100755
> --- a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
> +++ b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
> @@ -383,7 +383,7 @@ vlmc_startup_query_test()
>  
>  	echo -n $goutput |
>  		jq -e ".[].vlans[] | select(.vlan == 10 and \
> -					    .mcast_startup_query_interval == 3125) " &>/dev/null
> +                                           .mcast_startup_query_interval >= 3124 and .mcast_startup_query_interval <= 3126) " &>/dev/null

Maintain the same type of indentation (tabs) as the current line and
fold it:

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
index c4cd2078a8db..c07c2af5df94 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_mcast.sh
@@ -383,7 +383,8 @@ vlmc_startup_query_test()
 
 	echo -n $goutput |
 		jq -e ".[].vlans[] | select(.vlan == 10 and \
-					    .mcast_startup_query_interval == 3125) " &>/dev/null
+					    .mcast_startup_query_interval >= 3124 and \
+					    .mcast_startup_query_interval <= 3126) " &>/dev/null
 	check_err $? "Wrong default mcast_startup_query_interval global vlan option value"
 	log_test "Vlan mcast_startup_query_interval global option default value"
 
