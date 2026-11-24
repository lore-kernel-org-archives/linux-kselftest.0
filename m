Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795534656;
	b=HegttjvNTBkA7jFeXXCoQatk36a5+KR3LLMeRcQTme2D4LtjtoEHH/UxwnPruhxDxW7r
	 LnBDuP1CkKUzXRfYpXtUqNOqqemoimq2OBa2nqveF7ulMLff23g81rsfAqT2u4JuLHbD1
	 RiVKDfKhIM9c6UtwTWN07dMCOFWPp190JLIgjHfDjEeYQa5RVxFTJYlPNbzQVFUSt88Vh
	 5dnzbm6TiIFcPfoddgEJRkuGoXgpiTmCtREqERmqHDmVEIDXfJ93QsFyaiSORIEtmBY5G
	 KEIm4ivL0fbYYe+2qhgzT0cTBAtByDFNWIbqHjogSYoCfImLpo3qis9enJAn7bRkB9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534656;
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
	bh=IsBrotR3j96Rkwb/nV560EebvGBw3c92J6kccQNMbWI=;
	b=TYU7YyuOXLqahJC09dpxl1iVQ+Al1lufG3HF1QOcyFaoYJ9mrQQaiX7+F4UyBBuaHqPu
	 baD1WeolzhOpDwfA/81C3AW94aihfJExj7Mt6aDzYJVnO2lmQxypTnn7sQo0HBZ/CvVNk
	 dVDIgNOqLmyOsyG+YGXc97jUuhTFTd3PC/goFSR1/lPpDxBjIqdv/nBF6bh86aSmlRRv7
	 tUK6Cqz+lkjs9gdS5C06IBlS0mh0ZVBaGcmKwjjlTEuYbHpFAqmt+kVbBidbPYMPWbiY0
	 uP/0Z8QT9IxhVj6H+YGkYnMJCmS5UHojhVLH6tm5v2xrw2YKnjwpQyAM0nrO/asbGqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FImm2RV3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.53
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013053.outbound.protection.outlook.com [40.93.201.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F5E606A31E;
	Tue, 24 Nov 2026 15:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FImm2RV3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PF/+nwD587uqryOE3zQ/kWbHiAJJRPC0ee9HRRrbnv9txdU3B4J4AkeAVtjxqeql18EQXQik0fWZs7K/TVjxIU4e1pGzIvqgyyHfIS0lpz1vvnqZq0ib6kZ62utNCJ1pBmPx+vdqWYRlN50BckteM6K+QtRB+byHZIOUios8QWh77hyURwRnkMYRbIMhzMi55mnHAKj1wyxdmO+/K4CLom7TGs3OH3bYSc/Q1MB8XOZglQBowxtV3ShfvTXnYxOmu2UHMVL5GAF8hi9Huc0CYMitpkf7Mgzi7hApxbxagGtEzzqs1vtWkJke/jw13L9USwEg5LHIOPaHKKeRIpEnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsBrotR3j96Rkwb/nV560EebvGBw3c92J6kccQNMbWI=;
 b=nBz8s3hAJnVHun9amnZf4KWKSj+CAR+DcsX0aLSYrG6ZuQ1k8UpCEumlxQIl1BjjNB6i8SAwysykPtG4tCJ7uqHXDvX0Ytk838z1eHcsP8dxKBaqbiiKr18KPBWu9SClmpszXt13xKz0LOQHn+BXU/N4NlcvuCGNsb72HIfVCUQ3U1+WDlwISj/j9z5/UvXhPuglW2qg5Vo225TR2A12JUNZNXN63QFSMRS6+/Gk3z1fXWVXvAQ9IF0PzMzDlZJ+6K4qEykdtV0LkHs7EZbw7Ub0puIsD+xBLQS6N8GG4WDRza+/DjXcjRzFrMfmCcWECrbT/CxRh89S6oyqsqw7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsBrotR3j96Rkwb/nV560EebvGBw3c92J6kccQNMbWI=;
 b=FImm2RV3hLPhmsS//1gljv7UsFHYSUq2UsyE2XPb20sKLkrfWMoeexOFLfeKqQtVkrO+m3COTk2mCv44qifKGKIbbZMx2CeKnOGPMdwsuE1WzqWukoKQhlOen4er9cLzp+KeaJd9P7sLu3mujrgZwwVdMi8/oYkSge827jAOnz+nXrhjBHZy8PHI8KXXFeC07FzPxwzbLHyQXc78vynMQsFDixQN4avmZuEGp42YS972PJHKycfh5NTSYbCGfTX/jywft2lvwMpaiwFwh/dh3Vpnn+ngK+2Vv+yjFIPR8GLAm2MqzG6VMDnkPETApoaUXZEWczH4bevuqNZM6Eo14w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13)
 by CHBPR12MB319464.namprd12.prod.outlook.com (2603:10b6:610:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 15:37:31 +0000
Received: from CYXPR12MB9385.namprd12.prod.outlook.com
 ([fe80::f8b:8279:83a9:3591]) by CYXPR12MB9385.namprd12.prod.outlook.com
 ([fe80::f8b:8279:83a9:3591%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 15:37:31 +0000
Date: Tue, 24 Nov 2026 17:37:19 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Yifei Sun <yifei.sun@inria.fr>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] ipv4: keep scanning the leaf when a nexthop
 object is unusable
Message-ID: <20261124153719.GA3946712@shredder>
References: <20261121182031.36626-1-yifei.sun@inria.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121182031.36626-1-yifei.sun@inria.fr>
X-ClientProxiedBy: TL2P290CA0025.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::20) To CYXPR12MB9385.namprd12.prod.outlook.com
 (2603:10b6:930:e2::13)
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
X-MS-TrafficTypeDiagnostic: CYXPR12MB9385:EE_|CHBPR12MB319464:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b01e4ce-bbfe-40e2-2ad9-08df4a40da04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|261009223027099003|22082099003|18002099003|3023799007|56012099006|11063799006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MpjU+vaA6cEANZFycE1u2CRyZPbOGW+vQt/kO75oOrK5LlB+b8VLepkpABU3t9JD/oaxGtEvn3ZHvHKXs8CcVMNWDlw5mIySCtHEnaOA7K5357wvyAtCoj+dtInDEwvjvzklmwwM55wyzxnj+O3RZtfMWi4LtfgufbLNdSJxXjn78HwN22yIgqDM7VWhdb7Kh2+AT8D02wSnNtW67QJNcGGLo+Y1e5gaE3dpW1SO58dWgFROMK4fSQn2MZMCEdNeQOwBu5INc8jGTpGcT2enj75KZW/3EPdKJCGr8ntzQVpi0FvBgpTECNiinu+xNppKFj+g/rbXpi1wnrWverp7aaqBj4uP/7CUP65/+EUBr+wp2ir0wQI59BhY32BWju+EMfv+A92mYXkC1tGRVAB9Zr0b2LnxEpoL7FTRA/BjDTLpI0+Erj+RHWxhkZTcdWRHYC4VoB4fUaDV97383J5iiaGjOWOa2+S3aQ2/Jjx0S/PWYSoMN406Ad5tv2LbsCWe4t7DHZm+4QTQjRcEfjuIIdLvzVSwfZKY+IBi4oeTWUCCKckVVQOjsmvvP8lpnjx6XGvTLhJl5vTHffQ44tHUK5cqWIaubUkdeXL8c/2VgKvqqcovu2Sb7S4y0S3fo90JgugUtcjlwaivNtQGeLX+/8GR9PxkYBcpFEDgCx5RjVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9385.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(261009223027099003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6SqiFbASqJ5EIOwa+8Z1RdC0BirQAcPFTbDc89gPiuQGVXcFcQpU+k3QMYNl?=
 =?us-ascii?Q?ZS5gkPQQ9VwWbcuh/p+34RSBL37jVoLNeDhVwyi5JNHhGdufdYzDtXCa+6d7?=
 =?us-ascii?Q?Dipyfz1aP1l0pLyyMQmfkFwxGNp70OkA2ZYmQIgsoeyXLv0dTrAkQbnD+iy3?=
 =?us-ascii?Q?foqVQsbEMqY8Q/kJJaxyVMMR2HqIz/+0GNW2L6Ke273uotUg7Qzq5teMD7TA?=
 =?us-ascii?Q?T338JPHm31vqPtS+EacNtJVGwXCgm2225A0mgTnsTWzEs8Q0FgJfntV82/8j?=
 =?us-ascii?Q?wgpsVb+of0/qmlbr+v6bEFBvpmGmvKig7w9nJz91xaiUtXnLST2waY5uZgec?=
 =?us-ascii?Q?WL1grBaFlot0PDZcZaAQUh834wdZA+bw2rTD8VSx3rFhf1k8VyKhCKC7GDhW?=
 =?us-ascii?Q?Ww0AtP9EA7aRtzgq4h+786R+Vp9DPpNkjD0wR4XqKZZ1CCUWhf04koJscnzn?=
 =?us-ascii?Q?uT9XgJ7+gR2l+TjIiiwacEhfYmyRWugwccLO4uyLx4WzxG6aAtVIArXDIpV8?=
 =?us-ascii?Q?FG9Z8e1ZmgL1FZGcbfmrzTtAZu60NS9u8jZ/2/wNZt3NSrQHPLqLkhiPWMEH?=
 =?us-ascii?Q?crGhCKGSKaKnP4tWGlPBVGxkAXA0Yh5wXQjwewYdqHiV+jEos3gaOYJncfpE?=
 =?us-ascii?Q?J785HMrrVS1GAxbtcZif+2hFOXcOt3aJ+7V72t44WyLaoMBU7QAxVrgg5LN8?=
 =?us-ascii?Q?/e0lR1gUzWQtfH34oA/94NqaqZmfwWboVADI0nOpRsLXlUa4VUF/wIMJWLnz?=
 =?us-ascii?Q?msKohu3EiwrdtxoRdi6kWA1E+tLrBVeRHuUF8wFcIMQ9UVKWNbF+yjFXqoqn?=
 =?us-ascii?Q?U5ke5jDqQBJqMjPvxEhxdnQf6LuzOHsUSZpmr1DB38y5fm68z/a5dR10WI4H?=
 =?us-ascii?Q?bxAQqoymHtWbIO5nqO0OV4RJx307CvGN9TgnKwB1FE+sq9HT/py/50JuWIN7?=
 =?us-ascii?Q?dlenhWjdoN/iqFuG4yJp9REwXp8+tg57pvq6b/BQXxxog62prQbOZLdbdXC8?=
 =?us-ascii?Q?4IcvqrdCVxFQP2H6txyz5loV4eOxw9KtVv2VTgelxD5awYzJyYAs58n2j06i?=
 =?us-ascii?Q?uzkLHzBzWTN8SL8cLPOdjZRI4uU24u/NjCiTcHisb5vDzqGYvfl3Kdx4IhDj?=
 =?us-ascii?Q?X91wib8fB+RRSvqIv1TmAjf4uirNcWoPiRc2P2z2rxhv2KGeRk5XovRA81N3?=
 =?us-ascii?Q?Bo8Dz6aRMzdeJUA+8Xzu+zI13BnsrZXfzoR4lHWETk4B9bPLlDNtXeEyztES?=
 =?us-ascii?Q?oJ5Ptic3YSfBneADIVzt3lC9QBFoXmZ0f3QAMZS80JNw24gVHaDm7aBse023?=
 =?us-ascii?Q?p0081lpSENR5booIWOch1srMi/H5uXy/F6KWRU9Rp5QUr7NazwrmCar/zkVS?=
 =?us-ascii?Q?4CVrNGjeXrw3IxesWoyXa4vXWNl8U8IT8ulOjCfqdbKKVvZLQ/Pax4QWoYoK?=
 =?us-ascii?Q?LDgGsAReixNIBiZtVrGr0+zpy274IZ3/uptp4eYgJ1zvAnjGq/OfyGu/2U65?=
 =?us-ascii?Q?37XCy95J7HxUPTrelVYxaLkJVo4UpRtbiwYFa6MJO6MrNw4VGqpV+OVmeZlX?=
 =?us-ascii?Q?oiKpIQzv67f2FzwxS/oiS81H1vT8+2FPLjOJFepfhyEs8ZciNrgT2Vfrivcc?=
 =?us-ascii?Q?/nOBbuf9NUHT3PM3wvgRbnBNKsXGwVtV2XEdquOVx0cwWjFRCwPLuFf7nJNc?=
 =?us-ascii?Q?+owFqtRe14HqY6muDk3kFoubeKthTehVYvXwqhJARfBR1NP6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b01e4ce-bbfe-40e2-2ad9-08df4a40da04
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9385.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 15:37:31.0527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtndigsNOiJyfKIRO+9OEnMh25eo+EO/V9dHNZ6t1scbJ9X0N0j7+nSjs2kr1loCWzxw5xl84/Rs/ZUzEy3teg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB319464

Diff itself looks correct. A few comments on the commit message below.
Please wait for the AI review (tomorrow) before posting v2.

On Sat, Nov 21, 2026 at 07:20:16PM +0100, Yifei Sun wrote:
> With veth1 on 172.16.1.0/24 and veth3 on 172.16.2.0/24:
> 
> ```console
> $ ip nexthop add id 12 via 172.16.1.2 dev veth1
> $ ip route add 10.0.0.0/24 nhid 12
> $ ip route add 10.0.0.0/16 via 172.16.2.2 dev veth3
> $ ip route get fibmatch 10.0.0.1 oif veth3
> RTNETLINK answers: No route to host
> ```

Strip the markdown formatting:

 # ip nexthop add ..
 # ip route add ...

> 
> When the /24's nexthop object has no path on veth3, fib_table_lookup()
> backtracks past the /16 in the same leaf. A socket bound to veth3 then
> ARPs for the destination instead of the gateway. Try the next alias,
> as for inline nexthops.

s/Try the next/Fix by trying the next/

> 
> Encountered this while work on a unrelated IPv4 SADR patch (not sure if
> this is even needed...)
> 
> In QEMU with lockdep on 5e2976e52671, the selftest and device-bound
> ping and UDP failed before the fix and passed after it.

The last two paragraphs belong under the '---'.

> 
> Fixes: af7888ad9edb ("ipv4: Refactor nhc evaluation in fib_table_lookup")
> Signed-off-by: Yifei Sun <yifei.sun@inria.fr>
> ---
>  net/ipv4/fib_trie.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/net/ipv4/fib_trie.c b/net/ipv4/fib_trie.c
> index 394df1de1281..2a670e9b0417 100644
> --- a/net/ipv4/fib_trie.c
> +++ b/net/ipv4/fib_trie.c
> @@ -1591,7 +1591,7 @@ out_reject:
>  						     &nhsel);
>  			if (nhc)
>  				goto set_result;
> -			goto miss;
> +			continue;
>  		}
>  
>  		for (nhsel = 0; nhsel < fib_info_num_path(fi); nhsel++) {
> @@ -1622,7 +1622,6 @@ set_result:
>  			return err;
>  		}
>  	}
> -miss:
>  #ifdef CONFIG_IP_FIB_TRIE_STATS
>  	this_cpu_inc(stats->semantic_match_miss);
>  #endif
> 
> base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
