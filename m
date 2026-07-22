Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3E37F8BC;
	Wed, 22 Jul 2026 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733850; cv=fail; b=lxVaxuI9jfKfC3UsHdqft47Fe6xlr2Mg2s/QpYrcFaw2SykJiPw0si5e05QsUg1ydnBlOs4t2JC1UJYVEs5uOHfxZmUynAPQI3D+EGhWtLCRFLn0cEhtvzZLl28mNB7EB0oBcUj4/CynemDvsJYaQGqhb0ce9k+K0GCcvvFzqbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733850; c=relaxed/simple;
	bh=14fZJQuvOMcc2aM1CfSWnxJ22rfr++GEnW6WUPBkHGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IXzZLM7xHb/9KH0iINV+7FKFcQ1c8c7Gif54p5YXETLXMdOE+jhHv2jYagb2+orkeLVPeQNFtaSvTw/MclEsLKg3UHEngeFG7YtMn8zM1KjmtrAzXhDiS5IXU3yNlUAKS2Y2G1Xf0UaSRpaxosdtdbRAxSSnBgQn3XCyCeU9Sik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HIOy53RD; arc=fail smtp.client-ip=52.101.48.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HIOy53RD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uin7rR/N7dEvd8MQe6v3aTcDglpQ05TaoOW+0l6sA/rrq6riTApce1KfpoV2OFoJky5H5T+l6hazd+L5V9B5Xnnv+b9vlveTEhzZJGMMrxdU6sty/68Lh1EHfsY6+NMVoM8JRyLFMkRnyboEjhD6eWNODFEKehVBnmlv6Y35Lq5EOIaNd9x2ta8xg7bkq7VeXZuAL3jCdj+PgtqAB4Y1nfsyS/BQl3r9QkHMJ2D5LnycxbtW3sk3aGtS6hDrVxtGlyjopFv6KZ+BXg4WZ6I2aXucO8Jyg+zqvwmru71SvgzKfZuQhSFvliv36/Ww7UKEq39xmkJfFq1nQzDszmStuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qsW8Tv08O1l7aCiLKsEIcSUSbslSRSJolZQC8HfR/8=;
 b=qC9KJYYW/pjp0312gSVeaUDTVUvmdXelDPLxOI4Ml9aYc40PLjUnyrdwKiL2HCLA+23D0X7lG+ryHlKoLaIphhl9Y6R4LhNq2WmuhBxDAKtA6cIetjM8FW/NRRuGLkImCVVU3ZI/Hm+mQc9zlP88nSjHuxtFuZIzbaLrLw9SBqVH51oO/079A9kAr7dLwGEHN6lfd+2kllDH27NdMegHU22MeerxMEogjCwLhpj2OyMN2a2OCMHZ+4YNLkepTWi9QOJeBoIH1S2R8ElRjWB7nZazdFAzPM0rQX/mXJOeNeFIc3v+EEI90lF3dtuqNuJa57YZWwsNYsI22i+8yffaIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qsW8Tv08O1l7aCiLKsEIcSUSbslSRSJolZQC8HfR/8=;
 b=HIOy53RDvl6Db7TJ+V4VbQSvAdABYabv9edRYtpycqaRTumscwXL4CGeUPaz6Dg820i6y9r8oFWqbC7n7FsRb0ETQ8k7b6s9AY66EqfhHQgMSc4HzWZ0QRNUUPDWLsZ9AdBG8QIgqjjCqAPynCc8QQOoTRtHSVhQiBy4PNfe0nU6QBBVH1mFp2daujUYvh4lNzDL2JUd6BiIUN95oQAOWQq1yuvvMoFa0Gs31mOiXR9WK+37w0xgigBYmvsll1/hTj3Setkcs+EMsyKUkfgrVMDtSoffkVLy7U/HfeEBN9HZt2kgappsPv4F2i0Z7Wup+n2l12LLmjYNBquo2okMyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by SA1PR12MB8842.namprd12.prod.outlook.com (2603:10b6:806:378::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 15:23:56 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 15:23:55 +0000
Date: Wed, 22 Jul 2026 18:23:46 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: David Ahern <dsahern@kernel.org>
Cc: Jack Ma <jack4it@gmail.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] net: nexthop: add NHA_FDB_PORT for fdb
 nexthops
Message-ID: <20260722152346.GB3022830@shredder>
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
 <20260721-b4-vxlan-fdb-port-v3-1-9aa0a543a78a@gmail.com>
 <20260722114621.GA2928696@shredder>
 <e48c03d5-8056-4b65-a651-5f57c1a4da9e@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e48c03d5-8056-4b65-a651-5f57c1a4da9e@kernel.org>
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|SA1PR12MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0341e1-633b-4d5f-1751-08dee8053ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	h3cr7pxStiyvZb03ekI4qbG2Se3p5gAa68NZRuy1mGYt8uMOCvqKkIB91o8CM9o6TC0jvhhYREw8XRpEAPCEhH9zaxloR0tmzGON9V1JTbwTKSPMwiVPbSZCursEs7YTs4ES/BgZWZ5INAfIVzWDq1o066/Aj6I+nnCA/49fhhNitHHEhm6KQUCfVq29fgaMTaj2I5pIFoSsWBd0zcsnb5Z6cNUIsofXiglfluJScPoAqOFcbjgexlBJTHnx4HMQ7U6cKo0CFK6bPufRDRJKlcKIABc3A1NCGHTgXfrcOYXd9YBlZKNtS6pfF1obuMssJTZl1sp/B/8jiU27RyvMNYutvuH6tH2lxo4FMLaRfdI+eZVF7nNCpCl9Ge2EQcMtT9z+01EKltKI/sBYE8U6MCpMsrBmkxV2JvhhrMOahMxW23ttcBVByCHS0obFxrkuMBvz5FzDmIlVKi9GlZ4RARyPYO98NXQi+ID+QkSnYG2uXfpV2Onwhk7Id8EStY8AEXKKzvGq1P3h6T/OKEzpb0j0YLmUqA0TBWhIizVxCteImHVSFAqqCaj2EglPFvUvLdZuJmv9vNg8NkWW97jgLL6NFnH5rUMCplWC53nwhiHsF8zDv8C2/1i2bRxlHfSihIZRL5leeKgC3ARyb7QHNaYqEhQgyFK1+CrpvngQBAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N89fWtQj6TmPwRA06EzNJbPMNzB1jOasj/ipZlB8BTuXyHmEQcNECHPJL8Wf?=
 =?us-ascii?Q?S52hRikmRGaRrRndzQ6URIIWUXAPdXItDdk2UJCNY7ATcm1O5RozP2SdFAkx?=
 =?us-ascii?Q?1DtvGbzCsfCxQlaWi6V6aLhDzou1pi6dcpSsdaHtvmIW8ycuM9xNmwdKZa0f?=
 =?us-ascii?Q?dETbXNiZTfAWDBwL8cnlyHwHxngyrqVasaivp0+Wsj0HlSUeDwaNf8P4Bjhs?=
 =?us-ascii?Q?EDm/xRYEqr1GWsFOaCulpTlweKGwZls4LF8XLxLgSXpCkZXpKp/4MHc7r3QQ?=
 =?us-ascii?Q?DtBYjPZmDaXNdwBHevUuchAHEkeTyqKZmrPq7BixQfvzHRhrYmgRv33ecgST?=
 =?us-ascii?Q?7BN66UHAarbDzymudn6NhoqKhA0nS5sgL83DWp5V1CEXwJGwyvsMzTG655qC?=
 =?us-ascii?Q?ra2XjH5L/Q3KYjmHCuwK0DeJefPHL+4FaE2IgWv3IkC8rYeb+g5/gGySYXhp?=
 =?us-ascii?Q?3XArsk2Ogz/tcvIeXstKSBw5Bzs7YTTH8kYnRtwyJPBBWccoVXLoA1MaV/RM?=
 =?us-ascii?Q?Q4TOW/fBfX6ubzfkvroNFbTPZjZX02zHp5IVTAxNUyoUiccSvkU4qmfAJTVG?=
 =?us-ascii?Q?3wBYbGOR8z52lK43eweUwXHi0ekdL+IG273NQPhdVqCv6DkbWkwryAN8c5Qk?=
 =?us-ascii?Q?6ACZbCvw0xLDJSRFQsIy5kcGl+l3XPDx/OreJ5/08WkDhv1i9AlCoSLjErR1?=
 =?us-ascii?Q?H9mU0n7xofjUiyc5mu1varGSHSQ/pCtQlBxtzM7DG9niGBJ2PsdvjjBc8zih?=
 =?us-ascii?Q?d55uVWO8vmLehig6iMz5OiStTrug58OmfRfhgMdYaS1SklK7HSjg3TNJXGlG?=
 =?us-ascii?Q?7T2pYfUR7X7s++8Ok5LChqh7bQdPVjD343z3gs5w6nIYN97MGFxDjStND6k1?=
 =?us-ascii?Q?azPRdU3hkj4lkrlUXiNQJldBKzi0DVp3vcYSRnABleklNng1ithY2SL9ASLD?=
 =?us-ascii?Q?wcif9qIB0zfBjTkq0JOGxe5TNV95aLOS5YDqg/aSGQPBR2LeHFTG1lqscl2n?=
 =?us-ascii?Q?fMQX7l9sNdB8APtBja5ZJW9StK4iZ1c9kE59PE0KEJ1Q6GQbvfv5DoMA/EfU?=
 =?us-ascii?Q?pPLZzk41xdjDDT7XX9nCXgdaKrPW10dS+fpIRh0VnFwpjLU5HVWGAZAUnou9?=
 =?us-ascii?Q?urgv78CcdvM4TXmEXVDr6NbUs4j2XhriR9VhoDdGaGZIkz0gvYvgeq/57zXM?=
 =?us-ascii?Q?zkpotIRv+wL5/Jd3ZxAQPlJZFL8t170jX18z6kXc1L9cUITWkTzt+aTo5cqn?=
 =?us-ascii?Q?wW/IoXbAH9OKtdI3Eu+VD/3HelYxLuNccINLPp9Q1mUCCOiI39k8YpdlOzEA?=
 =?us-ascii?Q?1hN21VGxxQNApMcHMJLgU55We86ey4nrKzv7kPuvGxb9Wl2DeFtpKhSGBsCP?=
 =?us-ascii?Q?fP7IPLcPgivFvsLGhfn9glLDKsMkKviGnjnw85SxJRSFKZsH5G9cwVn9GrGh?=
 =?us-ascii?Q?UrLaUBWMtSErXNpFsHMaPV33lk8MLwzcsGdsj/3B8nKc2rW6vCRFM6zuaN33?=
 =?us-ascii?Q?hX7axo+USfOtwPqAM6I4ZlFv7bp8oLp3oe1RvAspFBQFIM9gkBtmuG//EnsI?=
 =?us-ascii?Q?IgAUkNDIHGxX82g63/OaHqgqKkR80dgiVZEadwp1z4XknIhNDpY4S3BxHzlC?=
 =?us-ascii?Q?T9tku5PkonqOwQ+LZb78P4GuOL/RFyhQH63CI4g4EMgW2TBYlyYyl+OSuRPM?=
 =?us-ascii?Q?0nogI3r0QNFD87W445eAWcSy5V7ITxXLcd60KVVDpPbqoSPx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0341e1-633b-4d5f-1751-08dee8053ebc
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 15:23:55.8960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rIVJrqqUN8oLCaeIvcAg5D81HJyjy0R0eXHwQ+k56uf65EqKqo4WM0U24+zngBitULSkusc7kQLgo4bI6xTvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8842

On Wed, Jul 22, 2026 at 08:43:38AM -0600, David Ahern wrote:
> On 7/22/26 5:46 AM, Ido Schimmel wrote:
> > On Tue, Jul 21, 2026 at 10:29:50PM +0000, Jack Ma wrote:
> >> Commit 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries") lets a
> >> single inner MAC be reached through a group of remote VTEPs, with the
> >> kernel flow-hashing across the group members.  Each member carries its
> >> own remote IP, but the UDP destination port is always taken from the
> >> VXLAN device (vxlan->cfg.dst_port) and cannot be set per member.
> >>
> >> Some deployments pack several receivers behind one underlay IP and tell
> >> them apart by UDP port, so they need a per-nexthop destination port to
> >> spread flows across (IP, port) tuples rather than IP alone.
> >>
> >> Add a netlink attribute NHA_FDB_PORT (__be16, mirroring NDA_PORT) that
> >> carries an optional UDP destination port on an fdb nexthop.  It is only
> >> accepted together with NHA_FDB and NHA_GATEWAY; it is stored in struct
> >> nh_info and echoed back on dump.  This patch is control-plane plumbing
> >> only; the VXLAN datapath is wired up in a follow-up patch, so behaviour
> >> is unchanged for now.
> > 
> > I looked more closely at the test and the iproute2 patch and wanted to
> > comment that "port" seems too generic given that the attribute is
> > specific to FDB nexthops and called NHA_FDB_PORT. It made me think that
> > maybe we should use a more generic attribute name (e.g., NHA_DST_PORT)
> > and a corresponding "dst_port" keyword in iproute2. We can still limit
> > this to FDB nexthops during validation, but in the unlikely case that we
> > will need a destination port for other nexthops, we could just reuse
> > this attribute. It's not like we have NHA_FDB_GATEWAY.
> > 
> > David, WDYT?
> 
> I was thinking along the same lines -- FDB_PORT can be confused with
> bridge port.

I agree.

> No preference on dst_port / DST_PORT versus other options
> (NHA_FDB_UDP_PORT for example)

I don't see a reason to make the attribute overly specific (to UDP and
FDB), which is why I prefer DST_PORT.
