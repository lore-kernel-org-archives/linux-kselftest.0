Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794731604;
	b=NWzpMXxqEq5FosZCTN/Pz7TaKX9wp8k15jlY1Cfn0VQ0wmLYFVGiHU9k4PY1sgrktab9
	 znDn1wTeA+Yq3z0qkyzPesoxnHHw1tplPJi3gn8iIPUAC0lm08GfZhdy1ky8M3wCW+C0p
	 YXxOCATPczjQ/0A0A9CYMr4NkCzePwXU9AG6TzchhNJv0+zkOVwd05i7GvlVrIeFlfLIg
	 K2hqAMoQUp3Wp7B3rlZ88+2vL/AdDrE62P3ECazJOzYmOUkApUS3FkbQ7bnpvWi+Zxrtl
	 fsdtxV7+d395m6jtVZ/DrlsEcPFApiEn0dRJgQ8QTTSQ6DfzqlgO1SvB5BiVXmSWxCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731604;
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
	bh=2jvBnxsclEbA3GAimqX0wh4fnkM2JBq3M22m5fWUCU4=;
	b=pgldbh/kQr8u97teAVrEqUbqBOBx8LwemGR27UbWyc5QMj7ehbhZyB8LElGz9NYZ3Cmg
	 5HY2uAhwbS4SuZNMaZGTb2qOxztdgF1Fdj/C69bHQkyZks8ldJimblj/bqW6LJyizauNN
	 ZdpcbRxOf0UZqLkVi5J8KOjRjutDVDDowkh4F14DTxquUntv8x+lRzBKcXgbtNeNSOlmD
	 vMsr1hA72cNoNwGr5Nz/ZvOn07hsreG49R7HGvIi7MtEdDOXhiPkzKzXVajVudxtKQTda
	 eutKZ0/AbMFIYUoKRP+HVibY0W0iJ1a1nlEAw/HNeKNOoWKvmo06KRG8RLuYJER7pew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qQ2C2Uvs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.56
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92E606A335;
	Sun, 15 Nov 2026 08:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB92E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qQ2C2Uvs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQX9Ou9WZWW//pKWz+HCRlo90eAduR4rYjoRcObzQY70ahi2igcJbkw1K9VHR7L1HZsmgxnLGxum9fg866SVWiby0ghbgwzlFSMD0sDP/+XkmzXbyjUQ9xdCeh8AqNVUCXC+A+0R7J1I72T+dLicqO5ecglCM2RMcYEf00ub6pQRZCuXJx0tT4eHq+z8fIAuC1+8r80VWW25xJyCQHhvl/zYcYV4UiXZaU19BODOXkGB+dLmMgKnlVJ5mfS3G9W2g158Fz9MjUnbzzeNDJX4TcJxg5d+Nl4TYP5lK3yUCiMgNXHqzG3VvDU5JkTtTcDuDfj883evCnXb3XNQXOr+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jvBnxsclEbA3GAimqX0wh4fnkM2JBq3M22m5fWUCU4=;
 b=B7r1w5J/eVdnOnFJ6aJ33FUqlAd5baHYrDUFqwnA1cD4hB6PbeHuJpn1H+RO+mIU1Ys3edejqlMikcCWfHDeMiz1QWygLit03b8popmkYa+XvJevl145lGyI/V10XtACk+c+Zz1kopgbfjYRaJXYDvdDgKQf6UWgpUyXABVz1y4kwRV51NtHKaRR9aqQ+AvUCc4c/FrT5TLGbX9fVfId+BTLyhbir5kfXhV0caY9RVDiGJkwT4KCzS8n921p5BGsw2oAyeSblmVVZnoE+2mD9i3jgXp41KZX6PbjTWB8+04FisvDMMjGbRKColY6bRksY57z/z59+Y5UdfA9LgirMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jvBnxsclEbA3GAimqX0wh4fnkM2JBq3M22m5fWUCU4=;
 b=qQ2C2UvsQF7DX1t9bMGQwW151LRskUw3fo6aBBFH2Fw804HHXzX4nSSmrlYjkexN+G9rjF6r/1ClWTcpzW6TkQX9M+EnHn8gOIhEeVLWzhfLPukuvfQ5DguaZWLHJ9e09eZLd7jE/H0LCWjNZBVaayDLwpXUUteaybfYjLrZ30Qwjlcir5Ne6lcyETGYcNla57ilwjkoyRyoZL0v/UKngoXN8bdPdqhAZgev3LXhD9eiqJ1bUp0nIRmQ0tHQGDzD1/uWyovLho0i5Zpoa/p1Gr8Q7mOEAOhwOOG3vADmHB1yaYWbPxFeszBtYecnP+vMWzBW89JhjB8Oi4P+INQM3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sun, 15 Nov
 2026 08:31:08 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 08:31:08 +0000
Date: Sun, 15 Nov 2026 10:30:33 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: liamsmith827 <liamsmith827@grapheneos.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: Re: [PATCH net-next v3 3/4] selftests: net: test restricted on-link
 fallback
Message-ID: <20261115083033.GB3764829@shredder>
References: <20261112235932.23836-1-liamsmith827@grapheneos.org>
 <20261112235932.23836-4-liamsmith827@grapheneos.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112235932.23836-4-liamsmith827@grapheneos.org>
X-ClientProxiedBy: MR1P264CA0189.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::16) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 856f430b-b1ba-41aa-4dd5-08df42f2cbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006|10067099003|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261021135927099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	tD5JeHx43DnKggbcyDtnQ/xaBmNmAl8OSMPjp7sdlm/BiMANOzGH81WXRr/qq2fgtIt5h6fUf99dlJ4NITf0mtjVe45zLtSxiY20m2qjfbczXg6gre0jq9riDlz/fiHkq7rdRQVwK/Z7yQHWUDrLgZ75L/YYShlAMdhgMSFzAsajkjGixqhstzSIY3c+N3qy40av9hv+8IDWzCSrNEatyfvbu328erzash+U76uSoRS/DOI3Up0G8QFukAIlB1CN3+MB7GUqlR4XJk40Q84Ddame7Bjw9xGKpbNQi7YCVGnp8hq5iryiGJIxnbsh+C1yIJ2JUcQ5T77z960Jv3q5sA8jxleN31GLMq1aGXODdjrunhrfKOupDsW+jC/qMpaiRbfE496FhKYZghbz/ooPgDtORLxGVJCDaqAdUv8Jz1Sk/iviiGKRN6N2Y4tOdQaczgFlvcpwlOjkQsqRgYSSCkSe8fkokz7XfC5jhXj4CyPFQUVJVwVvMWnsK85kSMwVcZSCXzT3/5L8RN6AE4Wvekbfk4J6pqB0AiuBT4S+ddD7EP70FgDpqvsQpsBPZJ+GojzZe8EbGPZ21olTJ7Rqgcy7D3Vn4pornxzKkZzu7KyCDVv24sjC8DfWZhIsIqKWfSuOMn/9GQsLrDCPuDgt1FodA8w66KDHhfMX6ot3aPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DjgJRErn5LxWSKKF0F/Jk/PwgDOZA8SONRl7+ZU70SuVVh0Ss44K0Zw+vKI5?=
 =?us-ascii?Q?SYTWqUatbrQU39UeiNgPzzyG8D+uZvU8XKsexhJ8XyPLpfgfQa2KEfkX3dLr?=
 =?us-ascii?Q?nVRDB8syIHfHQJZl/rFF2BPpihv+T+TTyZs1abNWZQmUd9PcZ54nO6iMse/6?=
 =?us-ascii?Q?lIO7KXIzIg1pS6FiwrVuO4K04dumRQs1E5M5JIl/j0CG2TdxhHPTliIhIeJp?=
 =?us-ascii?Q?bhmhpp60pTQHDHb5Z+lw4761pOGKenZXHal1tlaCWjCiI2qDT3fJdIlGB8nS?=
 =?us-ascii?Q?jwJEIMsgq4xBp1S6yn3BWbgiQrzNp0/T3EGbbPFgpWV0n478JJ2iAjZ+ouqT?=
 =?us-ascii?Q?Me25ZPQ7C2asYM/mkPdinj+hUSZvpTUk0t9oFa2dl+t+vBNZ4DCAheHTELu2?=
 =?us-ascii?Q?ubjFb4x9uABkQqZCGzuoGsF2/L8g6phdYAGXoN8okpl2yNZajEoo5+QcvlkA?=
 =?us-ascii?Q?M0b8RmH9VgRe6TNH2q4k02uA23qgWoc5SmsuNnGtPW7fg7vooC/+Kmext+5u?=
 =?us-ascii?Q?JIKHfaw0MHJ9UQSaGN8YE9rcFdqIvwMAlp/x1Tv3RjPmsbZEjMlrhuBfeaPV?=
 =?us-ascii?Q?4BcbVcZ/Om8DgpaegnPuqw5t/ljkPUouKIw6yhMMPxL8QuI+bK5uYrLJrPg3?=
 =?us-ascii?Q?scJ0SvWe7y9s6nNx2e/Vk1ZIvhlscOtHw5q97SebSv7R0GEcL7XEWtUdxbbH?=
 =?us-ascii?Q?dFWgi98/Zv9RIXFklow4Tyk5LzSITaENoVeMircpJzgpUFrmAJG/tO8kUQ1b?=
 =?us-ascii?Q?1AILUQtWgaD/wdgE61MGyHkDxBmSZtxisv/2Jc8P8No+RSKTrUEocAwOUA3l?=
 =?us-ascii?Q?FfPN9J1CVZ+o6ZbdVr1epTFFkqIU/UlbaDh5FSetnIZOQ6CqjXx6MlDZjAW8?=
 =?us-ascii?Q?nUM5kb84lClZTvp2lcFYQL1CVDduLGLMoxjYlgUKGqmID3U3CLRBIntcqnox?=
 =?us-ascii?Q?4gBld69wsyfHLwQiUDYCF3RgD293urfYiA1KAEOeWldf1RPUWqm+5ZHbFtUD?=
 =?us-ascii?Q?VLCYjLB3ILJb4V8z95cJCWyWsI4SBq5XskN/VWjDOpLiNxYjnffxiz/mOO3C?=
 =?us-ascii?Q?vdWUz5boPxkfvv4Pvqd99tHKvB6N9EYJQt1P9FgF1WZruT30ZtJRqUSKTRPu?=
 =?us-ascii?Q?XyuW2QSXB3RJIcBMDFZNJXtSePdY2JNpxWlNbRKcvoGlBGx/eyz8mhNFNH+W?=
 =?us-ascii?Q?TjpBDJQL2PwzsXZBoOdFFevy/aOWRBeI6wgtPuWBNa7+XLEK4MsIbon19zNt?=
 =?us-ascii?Q?90Py/x9Hjfgso6CgX9pLmm6BvjeoiwtMvV+JpK8jEwcmxAEOfMpv45aWaehX?=
 =?us-ascii?Q?BPNiXsYP2LG3eiiq3Qx94B+TYYimPfc0Rxso17iTHARoWYRukX1U7KsmHLyL?=
 =?us-ascii?Q?W4MW9SYhMlmW8468OSW/EdjJJ6n/8P8q5rZh5lWG0xbfIgjX3ZzfxCOvBj7C?=
 =?us-ascii?Q?SUCBraxnBdbONLjyS2pZswMqIR201vH+I/W3hTixFR0JtlZSTA7DBMBGK8Xy?=
 =?us-ascii?Q?+s2jZ0qE0HMxGMKxOxV/GzYWm17CS8IaSMogFYUFfs4rnfYx5lZEuqyRMy0N?=
 =?us-ascii?Q?4I8wiEV98d+5OaJclhnTc45NGhaJYimg1cRjZKFbS6Ad7ocZfNI72LcQ/06M?=
 =?us-ascii?Q?PRQBZSPXLU5Z2vHvSNHc2b4E4yUBWO3adBMg275rqU0PHxYTFVVywFoDKFX9?=
 =?us-ascii?Q?4sBUSNai7A812Il7zkZdsMfUoL1BmB3U+GaUXtIlA65cGwPZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856f430b-b1ba-41aa-4dd5-08df42f2cbe5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 08:31:08.1568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvBePT94k28EdbI8Tsu/kuH17iwQ3DXQNe6dGK80oU4+JNJRQCvjxIeLtqmKqDJU2jOrgYHTqoppTPEzkWHcfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044

On Thu, Nov 12, 2026 at 11:59:31PM +0000, liamsmith827 wrote:
> From: Liam Smith <liamsmith827@proton.me>
> 
> Update tests now that the on-link fallback has been restricted to
> routing lookup misses for non-vrf unicast.

The commit message is too terse. Which "tests"? Are they aligned with
IPv6 now? Try:

"
Following the previous patch, the on-link fallback is no longer taken
when the FIB lookup hits an unreachable, blackhole or prohibit route /
rule. Adjust the IPv4 tests accordingly:

1. ipv4_ping_novrf(): Pinging a loopback address while bound to a
device now fails with an error instead of timing out, since the lookup
hits the unreachable default route. Adjust the expected return code.

2. ipv4_ping_novrf(): Add a variant of the above without the
unreachable default route, to make sure that the fallback is still
taken upon a route miss.

3. ipv4_ping_novrf(): Enable the device bind test cases that were
commented out because of the fallback (prohibit rule, unreachable route
and unreachable default route).

4. ipv4_udp_novrf(): Connecting to a loopback address while bound to a
device now fails with an error instead of timing out. Adjust the
expected return code.

With the exception of the route miss test case, which is specific to
IPv4, the IPv4 test cases are now aligned with their IPv6 counterparts.
"

> 
> Signed-off-by: Liam Smith <liamsmith827@proton.me>
> ---
>  tools/testing/selftests/net/fcnal-test.sh | 47 +++++++++++++----------
>  1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
> index a50609535fed..c048d5be139d 100755
> --- a/tools/testing/selftests/net/fcnal-test.sh
> +++ b/tools/testing/selftests/net/fcnal-test.sh
> @@ -619,17 +619,29 @@ ipv4_ping_novrf()
>  	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
>  	log_test_addr ${a} $? 0 "ping local, device bind"
>  
> -	# loopback addresses not reachable from device bind
> -	# fails in a really weird way though because ipv4 special cases
> -	# route lookups with oif set.
> +	# loopback addresses not reachable from device bind, unreachable default route

Avoid going over 80 chars when easily avoided.

>  	for a in ${NSA_LO_IP} 127.0.0.1
>  	do
>  		log_start
>  		show_hint "Fails since address on loopback device is out of device scope"
>  		run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
> -		log_test_addr ${a} $? 1 "ping local, device bind"
> +		log_test_addr ${a} $? 2 "ping local, device bind, unreachable default route"
>  	done
>  
> +	# loopback addresses not reachable from device bind, route miss
> +	log_start
> +	setup_cmd ip route del unreachable default metric 8192
> +
> +	for a in ${NSA_LO_IP} 127.0.0.1
> +	do
> +		log_start
> +		show_hint "Fails since address on loopback device is out of device scope"
> +		run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
> +		log_test_addr ${a} $? 1 "ping local, device bind, route miss"
> +	done

Add an unreachable rule here and test that ping exits with 2. This
verifies that the new FIB_LOOKUP_REPORT_MISS flag works as intended.
Adjust the commit message accordingly.

> +
> +	setup_cmd ip route add unreachable default metric 8192
> +
>  	#
>  	# ip rule blocks reachability to remote address
>  	#
