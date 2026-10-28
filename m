Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793191871;
	b=4jL2y6UQUIpNj8uLwtfXpagS9S7gvm6GdBOpTRhblAaTqlM/qYqH6XFfdjBCnUfoXOPc
	 QNcpcHhkeEYz+MDRRmwG2UOhaDAyPNDNIaTVWKT0t6GNLZQ55vhlLjP8wl4gRz+JRar7H
	 KHVI51ws4W+AlglO//FeiXh/u/LSJ30r8NN46J9puAuGb6ps4mZgyssEvylFpvLQAYkLC
	 2flcYrBa7vEy7nx1cL7Ec4r42gGiSdpvqCRNKl4n3JUUwilF2AyqM9umdQqV8VWfBInIU
	 94pvQL1YE9aA8CsFDY6qzBAr/14XOydJ5vAEJ7QoczStzTK+ejjynCop/xSNyIBm7UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191871;
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
	bh=EhdZBskiMQqtAOUFAXQS1FErrPe/2m1W3TufqTeYn9Y=;
	b=bdsE5zCMzuRPM+o3kz6IaDjHSRKYxqn+eHSbgFwjpoU4iPKGJPdh+3qVwasaLhVgbmKL
	 YKLFnJivMdLNLY1e0Skjs89HdmgkzMRpqP660GDiQ1BcpU56GU9kUKlJxY8REX3BLqT2K
	 f/XbvQcHLFy83ou3N5Cw3cSy+/JB+al9BpjxMLVGFQq6uGnfEGVFANaTSGGVewAJDhnXw
	 JMCc3znakh87Z18lj5opa3nVi8HfrowGCT5HptNLEx+uNEH7EYBoR1TJ/LCO0Jq1wBPah
	 QQ89HC2+eIYvuse7UjbBWjHr8WXiXtaRsSQwolOFlnwHlOuoeZRwef+s/LaVVp2Jilg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WYbSgRuM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.22
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786A5606A31C;
	Wed, 28 Oct 2026 12:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WYbSgRuM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qob3/EeAKRvcjPlgVB7WbTq9giYenqrZq0EizDBRUp6+ksp7ECE3ZtsFBWoB8bWvin2wHuLrC2ZvKLoIfiMY5pFEgfqlConnevOf9oEY0Ku76plXhU4lgMNWg7HPvyeciRu+gveQrz8G6DK8GA0LRw9x34mAnqQCfAJXarP43MNH/DRdbv+I/WcjmRJXSdWa/jEiV086SwBA5cCyOgupRtTfwScpr/28qZNbl0kdcnJnVOcTBKMpzPtEoh1PA0jfIbRgT6CYTMtpIV07rrrHjuFYO8DyZvZHhUW6AvZPNkumiQikVxNf6XkqZSCaWeXwAwFGAiFF8ImJKA9lir6DKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhdZBskiMQqtAOUFAXQS1FErrPe/2m1W3TufqTeYn9Y=;
 b=eXRrRetemqRsDcG4idbcDd4Jm3WSJMcBYmnIqbnZZlOQvcS5O5wldr0VJjEmxoHw+i4HtlPmquvk7RJOpV9CK6E0ETKr1O+2NNi9sf5xEwywKkBXfP03MpZVBDD19vMlAe8NkVERPeU/hC206Dou+UTQvdXXs0tc144hplqEP7mH295iSdm222cVZ28+GPpz1I8WvTERLSwPGnoiS8rSewQuE3jDvUpxT7X4/1MPeVCpJwzGCUxYHTUZNr5jBNI9Fu92IOAsIMO6gaUp2YmaQrswr5wog8StQdMqE6VxocbkAxrnqVe+cj+mCiiJE1XAJ+cV9uspZwHfVvgTtCEnKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhdZBskiMQqtAOUFAXQS1FErrPe/2m1W3TufqTeYn9Y=;
 b=WYbSgRuMYNHmioeIE47nC/CPOjTe2V2m1qRm0Olr5F+geeE9gjelmJqc36ZgO/80IFDid0bQ9tULLYFWLdyScCnhY3wgdTw9yyPxjMvnBbQCRFu8Uny8wMko9I6KmyB0TNAWRXrRCkyVHtVso0skoINJ4jq3hrVNiIRpy8DMS3HNbWdO+8rkdMltFGS+c4htvv05+MNTGbuSNSiDlD5Z/8aPEn8MH3k3/SqjTxf8UBHruJAZKyVlxy9u8spP1rud4RXMuZTPAkhkfVPWItoeG7PUQeGvr6BWJGRYCxjcdrKwsmX/+1bKYiEQWD/eel3aRPFsgf6ny7qmOiuiNnnPkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by MW3PR12MB4492.namprd12.prod.outlook.com
 (2603:10b6:303:57::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 12:51:06 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 12:51:06 +0000
Date: Wed, 28 Oct 2026 09:51:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu: Propagate iova_bitmap_set() errors through
 read_and_clear_dirty
Message-ID: <20261028125105.GA3040767@nvidia.com>
References: <20261022131015.3281745-1-samarth.colleges@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022131015.3281745-1-samarth.colleges@gmail.com>
X-ClientProxiedBy: DS7PR06CA0050.namprd06.prod.outlook.com
 (2603:10b6:8:54::32) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|MW3PR12MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: d9acaf83-c2f0-4b32-6ef8-08df34f221cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|11063799006|56012099006|261026140227099003|10067099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	at+TSXgCptRqH9v/V9Au3slMSTV0wH/7d7A7axBzaEdbChsfdS8Pp+gCdqbcfyCulyEYwaK+EeL/w9tYX1kIszRP949HtI24idrKiir4jyYun0pold5DgK9Go50moA/mQ2svk4XZJbmJSds11luhHqmnSMLzvI0ZeE/Rm40wcSqB9L5NyU5xtPsP++VJH56jWjEjxlNiaFaHSr9VBA0dPzoWvjE1U9dvawXaV79gmtYlkLTrOpUMvBN0/SqoVCgG9xCM0DibNf9QDhfeiYFk4wG+IKme9Doqn7y3qNe4yDhIN5yFCCtoguXRNbdJQ53jqugOA/gx0v6bYDWHKXKs6+ZWDzNrxoFj0OXRzBYFOqddE1/BpZcqeT292ubGeM5UUyXGgrUOOk9a6Sdhk/mmKVK/xV3G+VoptMemP4bFY9lSmj0XjjH+NVn0/nRVFd6VfysQJspTdy2K1IQmdj2mE/JPBySQPDxRaxbB16PZg+FJVrWcvIyeQISYi/rD8vFhApgT3PFWCsqtYUpeIDKPf1zaCXpJiQhvoM8Nq4vYEqi5zojSudJr0d7pQlQGihEKZz0Bz2GUyNyplKhRQTQ0KmaNz36aRrFf3ucZMVFUMQRnrIj5wK1jhL7Gj0q5sxl95s5r45PZCOkNmwP4jsQrVvTf+wgYYGoi5Zi3CUGJylM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(261026140227099003)(10067099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1+7SZb0LAyghZQSUsZZ3YTzRF8SlL/oUVCpgCYVbIRct8/zwKHr8CfyYyR9M?=
 =?us-ascii?Q?Hb22I2pNJD5zSPaZVGtKlFBGZ4xOCZo+JgN5/PhziveAzSzYWhJOFvRr7Z18?=
 =?us-ascii?Q?OnZrLla1E7sADpkaIw68+y8Hh3KgQSkHUAYBQb+0JmWBy6fx+78SevR4vg9t?=
 =?us-ascii?Q?IwzG5czNXogkUQgdGFDJ3A+qT7hdnTYEEB4SU4PzobCwndLQZxK/z8DJ1UOT?=
 =?us-ascii?Q?C+BElAQvfI5s3nbukaxNB68aFQ8Yr3OkdEIsmWFa7WYrAQ67XQux+wt2GSPV?=
 =?us-ascii?Q?kuzAIkAKcJxlz3IGok2Bqcy7XJ+FT/EhdC5tYEmrqq0WF/ydUXP1zREFvyvF?=
 =?us-ascii?Q?uq9H4Wn3hOj9rLtMIs3ziNBGb9uTTSbs6OeEJzr8kD+IY3RY0uCdoAaGELkr?=
 =?us-ascii?Q?AhiCHO0z5eyB2LzQDDYein18k1ozGL8i6cjMY9RCB+Vnfs5QuQdttGZQ0LNE?=
 =?us-ascii?Q?Ji4zwOuphutSDNdTmxTquf5J89irTlfKxDRHkbmQ2LFeZK4LXGcFkGs+rZwf?=
 =?us-ascii?Q?vmD6usAMQZs9K1gec8PGREzYsWXKhkmrdNHwUc3V6+5YlT6YO8OjTCu4pE6a?=
 =?us-ascii?Q?oUFM2Ykl53ifT3WEiIpqez6CmqyegvmODIYI/uhA+cf8svahtStrtC+SVF26?=
 =?us-ascii?Q?zV2OcOpVpcxPqNj6guVUIjfZquRj4WiZPHcYDT1aVR+7cPVk/pezJLiwE0G9?=
 =?us-ascii?Q?oKrzonQ0kopxRRzBmbJiyawCJp4KBgztt4QFTqjXCMTh3oDP0QJ3EPedAl5c?=
 =?us-ascii?Q?LtBCnl0nCmnF4nAK4xc2e6/6ZZ5NHIiyF5CRbgvfAhJmVf/ls9NHuiTwZWXj?=
 =?us-ascii?Q?9TjbeAfXfLRcF9fv0n0OoubCasknqWeSX2M/s8OU8zOMGDBLzt43XBF+lilf?=
 =?us-ascii?Q?9LtZOJ9iCpuHRyMwvdwN/yzC7Mbc224c9atQvyQ3KJQwqk+/GmD95lP/2Cz3?=
 =?us-ascii?Q?tgFfxpqKE02sgSybmXUcHqnNdX+0ueqrYy2lRDA2FsQ7ZoKjPtzFHnSEKxvE?=
 =?us-ascii?Q?UMc8s6N8Ym0FavvOl1+80XjaQEe7hUklBtNZ13BrX2x/13A+5/T0g8peJDzS?=
 =?us-ascii?Q?BB53lxxeTYmfBvg4/bBXEfJ1DAh800w0a/6C+YUh0tGF2QMEQCYnKVtutUNi?=
 =?us-ascii?Q?+cFx/twG0U2m84Icu0rCigty0SItkii+xmR0EY4zM1QEgObyl8spYQV9nb78?=
 =?us-ascii?Q?vK9fklF+9HDnmegdhU3S/rio5tPZe076OmclSCCZUVH0zSi2DgZhhWsuJYl6?=
 =?us-ascii?Q?4W4FiAOYtf1R8pfQDy3KTQrW2KW2oIsFhorafs99umNzyKjlD7vv1C3f+36S?=
 =?us-ascii?Q?V2mKU/Ss+7tEUbNg4XnWpRHhJvxjcr3quSv7T8lw8n10Ud0ll6ky6CuFjbvx?=
 =?us-ascii?Q?/f+ASwD0w/NeVaiB2f+iThv+A7vyyKH7IDpQoW4VPGG9sWk7gG7nbppC8CiD?=
 =?us-ascii?Q?GpJdsdeiyBzv40bT9Djf4/1WcazNsnek5meq6ML03DJDICoZfDRt0JdJ6iSx?=
 =?us-ascii?Q?j/LmyY3jYzvPwkqlQ8rMopmCjWr7fLHoF26fYqAfaDopPK99cK4bduoh2X8a?=
 =?us-ascii?Q?0yqwqE/4NGmKJRu380ZQ8/y1dFjCgnXxZS/EHEV97wQlNoqUIFpGvRl0ZsxH?=
 =?us-ascii?Q?uCFSWg4FP4ZiQxF/3T+kqso1CdPhTosjGfG5EIhDNQ8h39RG7EFe/eUgXMwh?=
 =?us-ascii?Q?W8IivB8AAEEKo+ML2oAL+13+Ywgt8AtuP1weMrzvCN1m8zlr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9acaf83-c2f0-4b32-6ef8-08df34f221cf
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:51:06.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A84Xae+3XL2o4yppB7Asw3Swr1ayE4ZCEya4oUQSrbitsVg7a2T12FLIWNEfiWpH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492

On Thu, Oct 22, 2026 at 06:10:13AM -0700, Samarth Narang wrote:
> This is a follow-up series on a6ec38d74c08 ("iommufd/iova_bitmap: Fail
> GET_DIRTY_BITMAP when a bitmap page cannot be pinned"), which keeps the
> first iova_bitmap_set() error in the iova_bitmap so the ioctl fails. As
> Jason suggested, this series propagates the error up the call chain
> instead.

The patches didn't make it through

Jason
