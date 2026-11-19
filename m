Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079038;
	b=yNI18ARAX5XA2qzGnv0FxqNEq6csvHEMJLb931ulcqLNLRz0dDWmhFtAfXxmIWRfJ+lz
	 bi1TJg2JGB8TA+3bqgcLiNhhhEpPp7e2eQpm9zdJhTo/9iYmsG5zDj++mQDmaZBi+n383
	 Bg3e/sRfnLGmc34wXH3euHTM2QIP/0akNtFPhbTr7OTKXbduZhvOY26gn/YqN38xM7/GP
	 3SAtpUXFmW0dIx8k1lcm30XrSe4TcFoyEFfXyrwMraDghwpjB/yL2cUr5EC6ljqQ1uuqs
	 3uQiQydBYaWH4QVEHEuuyegoAkExvCMZDKJrqbEEzPsuChZQgev/x5Hx0Od1/gUc3pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079038;
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
	bh=B948eI3Uxjg4xuNec84POjHHQqqo8l7ua7kqJOA5b7s=;
	b=eBPprhBUH7xioHuZZ96QCKwvVNEDkJ7bMm+ZwVZejtHHhgDTqKpdIwkrUqUq1/V1mQ8T
	 TfXqSK9KftcOynZ60CgX+BGOP1vi96P00mQW+46wE0X0i8xh+IvgVTC+lAy7I9TyQ8v4c
	 PdWhnrK/e5obxTXCpTKLiCBaVXIoihUQ/Ov3Uqn5dq18+Gv+GOoV/4+YAMlBy5FLare6m
	 QpKk+MneDf831JI5MMO2ktuTx9JgjnrFN4jgKvOdlb1SqB1W+eIf4We3FvBraOjTj1/z4
	 nGLOJY3m1hi6tJGQVNSTzJ/bhy3NYUHHMAw1CZqWME/3VvYPHJYIcbRP2xSIRLIb5RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WMHwoDV0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.43
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010043.outbound.protection.outlook.com [52.101.56.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993360A2602;
	Thu, 19 Nov 2026 09:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D993360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WMHwoDV0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7kaKPXX5BBXR58ADvtrrwaZf7yc8pNRSstpNkGYvM8NhNHKiM9L/rXNMjqWQJMPnKhuyFXfl3xbUEmlKg3CATyL7hONC0Nbo9PiEaJ/UsiR7/6QiQvEWzYchbqwncw0XYrNIlqs+oat/ozntOjwp8f8bGfif95RZHN1jOrx9dRJmJGSEphPe2ecUo2gExnTdr/9i9u3gmsT9lhcuLI6QB5jmxA0tcf8eNgiQI7vTy2DGEQzXRye710Sn3nmvVWH0tZ9bfls2dN8H2Av2419NBq8lER2PGSVnqMQ0MJTLiCxjOTyL9x693opBPs1pGwkPq20Ey89PZOjSqJxozg9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B948eI3Uxjg4xuNec84POjHHQqqo8l7ua7kqJOA5b7s=;
 b=dn7/GWbVbbY3jBEEXzN1Bi5LzZPrk31td6wsqljLIyI/Q8HIVLyUY6C2I6QiceziJgdiCX/1kgV3BBGJvyw8vlQe1oyAzdui5cbfS1CssRxqzhRepFvmIRPgX5dI5fjHZGXd+pcMRFl/W8vv4jgDFY8IH5qY0wCVCLha/e4F/zQOLh1VeFYdpiUfnqBp0/PIBL4kQkiKvFkWHijx9GURn4OqBB6Y1S7anvgVRuO8jBpn+Kjj9xfhAPROu2ytqU0wvIrFA3PdiuP8LuNSDdk7uXxVJskuzJ6l9W3JkK25BYYUG5Q6vQcn2a3Omt/HTd0KckX1B4wp1k7Omdq32GiPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B948eI3Uxjg4xuNec84POjHHQqqo8l7ua7kqJOA5b7s=;
 b=WMHwoDV0URmx++DqKAPbXIanb/jOolZ/phuQhy8A1l5DVrc4lrYkIo66EicuDXmejzrAlRki3fPifuUB+Bb5+lQxOZJF94RykjXMe9nM8PUZJa6UmAX66w372CscDVpDtGdwanVaPWM1izepCwYt7gKwQ+dw6RVjfja3oExJo8OmTdeN/4IolMg5oLpFsRnszpfXO5ox3WE+7ECs24Q6ZMlK6yEY3b07B9x8EjlkG3S75Nzk0+wISvhM/p1ntgPDkvOSjI5ipTcaWpM2C05sb+JEPQPLL2vcKuiT0w4rNrZyTBsWR+eRdxBFfhmFPAQSaY03izb7mzASvpIhLEk7Mw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS4PR12MB9705.namprd12.prod.outlook.com (2603:10b6:8:277::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 09:03:51 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:03:51 +0000
Date: Thu, 19 Nov 2026 11:03:40 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Jay Vosburgh <jv@jvosburgh.net>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, andrew+netdev@lunn.ch,
	petrm@nvidia.com, sridhar.samudrala@intel.com, jiri@resnulli.us,
	horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
	razor@blackwall.org
Subject: Re: [PATCH net-next 2/6] bonding: 3ad: Notify Rx state changes
Message-ID: <20261119090340.GA1730641@shredder>
References: <20261118083442.1061289-1-idosch@nvidia.com>
 <20261118083442.1061289-3-idosch@nvidia.com>
 <528757.1795032015@famine>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <528757.1795032015@famine>
X-ClientProxiedBy: TL0P290CA0010.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::14) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DS4PR12MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: f107b443-ee30-4264-deb3-08df461c075d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|261026121527099003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cC7vsRczrUaIxErz8OedVZgyme60G0gU/UA/IBHo0quW+qCq2eFDXVUhZJ7JhO0kmGz7fgust4M8/ZfEe5xBTQmvZJNc18ZP50U3mSyb8ONkPJJ09BNjZT25iDurgZArTS7A7GNYPdt2kOkPSWj8liMdmw850oBQOoI9s+pwY0F/NBudsH6PERaCDh5f0E9MFoGrfXPgltP03ZYHLt3bGMo0qJ6qR39sQJWFe7ySIRBo4tQWxRJIOHCQRoMWr9S4W54V8ZU2drFa+pDV0AwgMJIVz19KG17gfRIzuwlEFUpVK4lvO2OEVW8Bo0KiOCnUFB/Lxy8J+7RWJ+RsdwSDO36mI/Cq0QqIhCWt6v4NZENeGmfEkrX0/zWre9r7XlECOTTjHYLK1+9+MqHptB6JsDc3ZEpigdUt3zU/i3Tv/+r9ke/3X8JC/IBdU1y95H9Nf//Ny+tnf6bZLh754thEc9jGICOGJFJNVo71ADC2XAlPgQEb8rMDzLy0hFWxJzrZKLDNUpoSGg2WtKXQ1JjLLLKqVyTHmWWMsYwOyQE8D143xnro2Liku5MEbYG3NQdXIwJ86PT5vcnT2GpH7+KuuVd5w3UWga+0XUHpGPf51XIJPLe4aCuSsoXX+fqo6KmHslvVupW8UgXt+dxJuQcdZO6k4V2C5rIEkpFzA0UDits=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(261026121527099003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nMcoREkPdgq8DHc712YvtKrFzcCLpeaoIGoHcwHfcpIi4Ujod+GR43jI7fJf?=
 =?us-ascii?Q?VCK+hqEvCBqNfFBHrXkbJeQFq2iMbWGs0glkb5lxq/obqBnm2W6kbohoa+Ug?=
 =?us-ascii?Q?LXLYquKQasTy1qs7LJFs41vUEc27hzcPzRGjavHDic5fmSmzP2JJv0TJs2L0?=
 =?us-ascii?Q?lK9PW5iBU2ybuVgW3bcbmYgJXL5dNrJPhtcrmr64JYNrTO4HpSN+Po7pfxJy?=
 =?us-ascii?Q?YIpY+GsSR7h4uMkXDeTs6OlhcoEL2w6b5dxj7acYaAd2pRRJZRSGhknlQbQ+?=
 =?us-ascii?Q?0uPDOE/7o9Q7MnjMQqZRsH5/HU5/hVq0NJEasTkMQudTrCfZE9vg+m3T2m5q?=
 =?us-ascii?Q?WWTkVzblYCdm+45VXM1UQzh7Am20azs0V472pKp3fxNfZvgYyVr7UGfwdUeQ?=
 =?us-ascii?Q?HHYMPzG5G0buvpz2CSI+IiP+NWIGHRaXgKqXImqug3shJL5aSR2TygJ8Bg6m?=
 =?us-ascii?Q?RQlDy769msWk/ipRFBtEehOcuZsMEH0215xz+qckJjpCyuxL8B6CKyfxNmZ2?=
 =?us-ascii?Q?a1pCbc/tf6in0PJM9uzAHIg71JKUlN/zU+3fFr88PcRx3p26xy5v2Q/kgsC2?=
 =?us-ascii?Q?U2M5OdmmYd9ihg3OFV83Tq9JvN3lQx937FKa6/S8e8+fZhFTxeoFrRk1GPW/?=
 =?us-ascii?Q?WxPvhf8fEjc2B8rvKL4IIP5H/eOuaIDbMwArCq1EaFmBxeHDKnMf8uhMnSBx?=
 =?us-ascii?Q?vaNi4ITuhc6JVzItFAL8/u6JmD96EH1iUq0yvK4xMmMmvYYDy3fFUNo/Goq5?=
 =?us-ascii?Q?HYRogJis+rhBpRcCWwEmitpdRm8KTaTMiqbWtijY1D2f0KTzZeP+TJduyK6k?=
 =?us-ascii?Q?CGMqoI80qqM6f1h68V4bMkZmJ2hoAEEHIrDH5gGrdlFbQNkjCzXxPStyW2rE?=
 =?us-ascii?Q?77HKFx0iMJzjW80EKKZaqJLWuCBLeAe/5oYYInr+a3ARjyIudH3Gc3KjqHmx?=
 =?us-ascii?Q?cAh+jnFZU2t/28eRkCVjSbvwIU9mkIviYYenm6UwdZt0URZP9PA2wqLHQBp0?=
 =?us-ascii?Q?olmSNs15+rEatRJiNg6uXURFVyr0bHapeNAwwiKor+iHvXTspqsx8puAO6w1?=
 =?us-ascii?Q?rfdt6EAmijBjvMQQZLEWXU9EDa3mJeqgp6IOVgaQDMi9Bv9DPhia3qJdqf7K?=
 =?us-ascii?Q?+rCfbqqGBN1yV1uj4O7hijhF3hrNQaN21fSltLTqx+2N5PNsWVIqDV+O5TXO?=
 =?us-ascii?Q?pt1L3Yn//xZaGeMeCrIsQ5dnB/hluOZhtuiVlw4CDQlveOIBi1QYlwjM89Vn?=
 =?us-ascii?Q?l/MPMhh8BWa9QjTQr4c+DgG/bWFCCmj40EBg9yrbN3/U7Dv7gu3l3yS+qU2Q?=
 =?us-ascii?Q?OjbgvTWMl2UXyR62lLbFhV0Co540Yqz1GOTbPnEYi2V1cHAy8hbQ1Hm1F+I5?=
 =?us-ascii?Q?Si+xBeuR+/b5pVOU9cdJiPYYCr8bVMXXL7RJVe4Bk+ZMHR4Q2kYbYr2UO9CZ?=
 =?us-ascii?Q?co+o62Mn4nKYg5Z6GB6V20wInrK1B8sZpfqIMfMGX0PABX2SkCyQieTUKpZ+?=
 =?us-ascii?Q?yYLGXM3Nx8rV5+wYKAvEH9rsofDJtEMSMVNwAfPAsAKWWN0Qek4LY2U/LZwD?=
 =?us-ascii?Q?x6sXAhG8r5pA/AaCtKy1oxADZng4XZBJtvXzJjRiXg1IC3DoQxX03sC8q7O1?=
 =?us-ascii?Q?5gCbYN0BjuhCQg1DKAgI11234t1L7STV0O+nsJR+sCD9XPXvwDkCayJ2YkBC?=
 =?us-ascii?Q?mNsJskWH/1Ecvw70XOlIok4Kh8YhllifykG2YMljke5brufZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f107b443-ee30-4264-deb3-08df461c075d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:03:50.8898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/OrKkbauUcnh8umRInvr3G7oX9Cq9X0w981zv6kT1P36T/Z8APUFuPKAVP2hc+2El+aVIiErwIl2qPfihzDhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9705

On Wed, Nov 18, 2026 at 12:00:15PM -0800, Jay Vosburgh wrote:
> Ido Schimmel <idosch@nvidia.com> wrote:
> 
> >When coupled control is disabled, a port in COLLECTING state is enabled
> >for collection, but not for distribution. However, drivers that offload
> >LAG are not notified when a port enters or leaves this state since the
> >bond only notifies them when the port's 'backup' flag changes.
> >
> >Fix by setting 'rx_enabled' in the LAG lower state information according
> >to the slave's 'rx_disabled' flag in 802.3ad mode and by notifying when
> >this flag changes. Track pending notifications using a separate bit
> >since 'should_notify' is toggled when the 'backup' flag changes.
> >
> >Reviewed-by: Petr Machata <petrm@nvidia.com>
> >Signed-off-by: Ido Schimmel <idosch@nvidia.com>
> >---
> >
> >Notes:
> >    Known issues that this patch does not address:
> >    
> >    1. The new 'should_notify_rx' bit shares a bitfield with other slave
> >       flags. The 802.3ad state machine writes them under the mode lock, while
> >       a few other paths (e.g., the 'all_slaves_active' handler) write them
> >       under RTNL only. This is not new.
> >    
> >    2. When a port is disabled with BOND_SLAVE_NOTIFY_NOW, two notifications
> >       are sent: one after the Tx state change and one after the Rx state
> >       change. This is harmless.
> 
> 	How do we know this is harmless?  Isn't this a change of
> behavior that's visible to user space?

The change in behavior is one additional RTM_NEWLINK notification that
is identical to the previous one in a path that already generates
multiple such notifications. I don't see how it can be harmful.
