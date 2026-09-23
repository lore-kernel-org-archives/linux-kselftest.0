Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7054239D6E5;
	Wed, 23 Sep 2026 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152632; cv=fail; b=eMa07ZLTRwvSFHL6A5456dfW+SGhz+NIFpZtn73k7AG+k4wH/iuANXza6JjMLeh5Bf0XLV3gIe2W+Krp/QgZamOKRpFSchG0ic3DYwDGbY5AyAGIXIW6KnZqDuTKBO6qhae0ADhYPWX8+IRZ6pTwQmSrQKGWuU1BoGJ/F+4bOfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152632; c=relaxed/simple;
	bh=efklZhvg1Z83FRekRcupRyMH87u2N78QuVAUsPSsKbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=abGFZ3sR8eyzWk6ikA6Q7DPBSbkqtsxEq/+b7kHV25tlfi9SC8S9L3B3iDNscav43R7dFV7/0iAehAIFx0ZXPI51mXvPrm8Wkyp0kxwSSFPn7NSS3FUQKBSLHrJ8ETmiIYb0c07GA5iwJH0mbjMsF8XXw2a8/6bmUpOzcJl9++A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rnfpwCXC; arc=fail smtp.client-ip=52.101.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rnfpwCXC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ld9DyrgtootjeiFlV5G7svJ9YXNqRdEqlmSWKnX3xlryeLFU3RjH2s7N7FGfq5p9dhLDNrREBgG2WzgYDqzWWzStUMdibrte4ymQ+eRdWN739OmB54DyvW6DyusgR6+cKpfXWIaIx/S/SPbVAtiUKEr7GKPiT5269MiUdS1bPH52ObkM4Zy076rkaGpAOQ8JB153qQ7rTpU459lPpYA+O5eSWrt5A9Q1fSIj/7TdLCq7cwrnEFZ3DKzcKYbC6SKU05DPWdT4VIQ92WHlg5fELzRgD1k13+AtnW3s3N7fnfowOxDCalkoYfJc38UsRaqR/rfbOeYNTLc0miQTkcXYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jrbuc8B7m6uQBfUXQBpe7eZSot/7g06ydN40scaTM88=;
 b=JUQDfimgZcGMTeMMftuH2QICtIz+HzlEtoBBiUdLs3AQG1uKM3B+bBAsWeOjydTWFPWUkUdeJMs8/gh3irBANyxFHlDAUJg5N8ws08ijjgF3sxk4896mQsZuHY6fhrtxqdmS1SvWmFScLE7yUDvQv5vUUmiSe/KARV1oq85fJE7nY7R6WGEAC4jfvzKJaAK8+HYqWn37sRirPc4plh+i7EnLJFtV9QBknRV7rGHzx0aDg/lvO0CehVSGjcRcOS+2csMOwOVsP79PrflozhtzMTdt0t1O4r4q91NMVdBiuxL5Y73wLAW2zWQRKVN3d4tBdgl8QVENi1rIbQRK3yE7ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jrbuc8B7m6uQBfUXQBpe7eZSot/7g06ydN40scaTM88=;
 b=rnfpwCXCXsgbyYOlK+LRrpGw4GlUjV29V6MQ/LSQyCIq32KidfGAtZUoA/CuZ0m1pEKG8ihkMLoLka5YGD3TiKLYXD+lN9TW5c40MHiinj+qgA4bVf0fBl8TUn4MW2tE27Jdle+1j2Yh6D3Z+ZKtnfLThi/a7phomG2dh2Cdk2zQ24fhFYcS3umBpvt3ZzxqvyQTblkBkiqiAVyQI76VErGtkddfWZT6pmS6ulvfa67V/CEL6oD4pcmkrBu2NZxEdHvj90Skw2qZhKuxBnIm0E0dThWO22Wb47UKRB0jiw38XQ2eEmu0w6vhIeh44KdX2f8FGJ7c/1kK7ZsUZnIcEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 08:36:44 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 08:36:43 +0000
Date: Wed, 23 Sep 2026 11:36:33 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Lawrence Lee <lfqlee314@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>, Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/2] selftests: net: test untracked NA
 recovery of FAILED neighbors
Message-ID: <20260923083633.GA2626135@shredder>
References: <cover.1790127207.git.lfqlee314@gmail.com>
 <ce40008682ed26ab039168a5fcb515eff8d30c3a.1790127207.git.lfqlee314@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce40008682ed26ab039168a5fcb515eff8d30c3a.1790127207.git.lfqlee314@gmail.com>
X-ClientProxiedBy: FR5P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::7) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d90ed8-afba-4609-7703-08df194dcbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|376014|56012099006|11063799006|6133799003|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8oWqZnfzxbWtseG3wMEJQULUZvraZvwcIfqJz+q2N9ErLlECf+0r9moSMxiWiwwf8zYkZeg35ik1TCxxVPPv1/QTMeLtC5N3lffkqJOJsFIafidglEoIaZFTiTseY+OCmam4D9cWOHupAPkvmS5ui+hMpBG5MGC6oCJIjFIJPb1ox/5inInLVBhVjGICCFMm+zdDUBRt4tOpCNgD69YPflZTAjzM8CdEJvktZRxWp/WefFsFTM5KceRCxTNQSR/Z+2bl0ug4z9+celtsjm7ZAytBY/B+9TkSBBTsKdqfFomzBW5j11pAsaHTmGvDEIqkd1w6QrbKo5wMxUnAcG070GRrlhm/rt8Ccpzb3bTCbJiZR7LfNjX124UjEZLvotuRAxdcYoTV30etemwpXEJyd54peShrVWIIEpgWp+PydbNANLMfnQ4rZ3VHAbBnKUHjEsyLoFS2AvAK6YvzUkWr20LEijnXCsrwF7m5zAoruBzA7SPdMUKZICcO6JYa91vs1+FU6y2YgEAB/4lbDZ8gPhsB4rhksQAxAqD2hCICKryIRbfWTi1NS1Pm6slpWMGMa4tn97X2BTsWxN8r0vMHzD72EvAIjkV8y7vTcmubvVWlahHPe/30cman78FNjBu7cJnFi93+uOhtljrhR5Eu7NyAa8g4lhVUhXPQmohg6zY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(376014)(56012099006)(11063799006)(6133799003)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CNT73mnmGxP3yyZRVfvjjvyKtQToy0VqHOwyFL8OdUtPW8JSUDG3utEPzjUU?=
 =?us-ascii?Q?j0x01m1Xk5Jwmpm0lCfoOgxvjeeuws4QZEGoUkmwIUJBvHkEuGVrtvLAZk8X?=
 =?us-ascii?Q?v9GEOvkCzsZ8BDpCYHKHOPxtkQZ6aPjE95SrdapXolQvO0mitTF8xVB09gnY?=
 =?us-ascii?Q?I4IzwH0sTgh7rt/qRhAB74wvWvmFzxyzizA7DnwNEwdPNz/NO+yxIVlESavR?=
 =?us-ascii?Q?kqPGG5bLweKKgzMYB5Fu/UW9B/rrSQCCYF94cgzqn3Ua7mh7QKioj1vAZ3EB?=
 =?us-ascii?Q?yCMVXHCCbucu3VsE2v1QpmfKLZuFloys7uc5Vu6aSGn3kdsNvL91tFwGmPu2?=
 =?us-ascii?Q?pxwygSHGmtf/ctER3HpSGD4yPmhijRAKR931pxI3IfXrnbiw5z8lfYgY/1OG?=
 =?us-ascii?Q?Yu3bhcqKBSMuICLvrjJmhh8jLJ4Nylw/72oZisdmxEJszTRNxXRBqj1/P4u6?=
 =?us-ascii?Q?sCYOqyvMgcQXXGtOqarAh44hhda/lRkatOdfAfJoQZdPupNgkZFzF+zU60Fi?=
 =?us-ascii?Q?dSJ8l6f2tgFZXsiB3nB9UuNw6gme+PdMcEGpqW0CgsNloJTgBzZJWoMfXbzw?=
 =?us-ascii?Q?/v7ClOj1SXWfUVCp9CyxIiYJ0qoRcgt0R9+dDnRyTYKqjxbQKD46EAIH3KTC?=
 =?us-ascii?Q?xMUlRhe/rpZwbb72yBx0W+Jvylh/pnZkH7bBJpDfr3wQ+V6ByKevyhNFj+Pw?=
 =?us-ascii?Q?NXUo8sk5Gx8qTrA/pOAmbrYPgXb2vvAK7oVtPoXHHLo7a3ODAhJdezMpSri/?=
 =?us-ascii?Q?owha8VVBzePd668zWGymCJBUHwvyLYiAtHjl3dguXbE0QWjCprT8hcZMR2tA?=
 =?us-ascii?Q?Y/09LaIvmG+ODHVe/BUSBiWfYyupyTNCTzb+1SMt67ZK3ajPrFgJtmNpCU8V?=
 =?us-ascii?Q?FF2EjATjgc9Vidm3cGXLLwOvGtH37V/3J0Ck0FDBB72VznZCW0aZ46DqQDum?=
 =?us-ascii?Q?P7A+IUQTUepkAIhQ3iOsBNiWEo11YUMcZAFBAr7pf6lCDvY4Q9r1uX3OIlgr?=
 =?us-ascii?Q?VlgIU2rtPOz2Dth59nImOerPUq4xSk1l2N6HESQpIiBvX4S2p68+YZivWyl9?=
 =?us-ascii?Q?Alz3i/St0TzfPdXY2UU8T6gcJGpD/DRRJoPJP6uhtJM8r6gc8+UMjTowzq6y?=
 =?us-ascii?Q?9Wg3WBKOiomquZKf4g3Aqi5qUNPlumHpg9LOApoOHmEfwmVX3Xgwj/MUJSgC?=
 =?us-ascii?Q?7xSrBwa5gySO8EuVM+ZQoGtvDrvtz2drxtb9zmpyEK1pubooiR4qlTkLhPnH?=
 =?us-ascii?Q?FgmPdYlKQ173XIw0Ct2XinWacroBBH3cPYD5Pyg3E4pT5z3qtqslwrqx1EN3?=
 =?us-ascii?Q?i2x+PME6CsKTNtIVhhDcUR/6tuG8PG/qbDLKSN3EjOIEu7BC/sdlnnFNRLks?=
 =?us-ascii?Q?k8LSfcLicEYJnEZ7+NfEybyjtuKKMkiOYYJGR/KPCZfvSRNuAsw5L+C/SaIm?=
 =?us-ascii?Q?oVLw83MkjzvNufRXc/BPiZFbLTm03fMtHwRYQPg0sK8N5Pxg4809we/qEZGf?=
 =?us-ascii?Q?bd/ppJ3AZp7hEvf9ZstNUhEHKLwrIWFeX2T4RzbPLMijLBSGKcejJ/AvT69R?=
 =?us-ascii?Q?xhf6HD+lhF20wYqA9koJupOkJ7kj+olYpyrFj4LAcl42fRT6TNyS1XR2Km4B?=
 =?us-ascii?Q?esU91HW8M0QFvCjjMT9X7VTdbtxNg+xYmnPiQRh7ezfratc+T30Mm9CIifFJ?=
 =?us-ascii?Q?FEGWnJ8np11Yh5Co4Vq8SNt8ZzVrvEpmH3iSfjrFwSRE2x7U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d90ed8-afba-4609-7703-08df194dcbda
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:36:43.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAjCseHVKGryW/eJmLA2gJhZ03FEq0WYYBHQ6FKR2F6faTbRbDh77EJNseWbpVs4nUQdSYC6ypVaMb3EIELsKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972

On Wed, Sep 23, 2026 at 01:34:19AM +0000, Lawrence Lee wrote:
> Seed a FAILED neighbor before triggering an unsolicited NA. Verify that
> the entry transitions to STALE and learns the advertised link-layer
> address only when drop_unsolicited_na is disabled, accept_untracked_na
> mode 1 or in-prefix mode 2 is enabled, and IPv6 forwarding is enabled.
> Verify that disabling each gate keeps the entry in FAILED without a
> link-layer address.
> 
> Mark the seed externally learned and disable carrier-based eviction so
> the entry cannot be garbage-collected before the NA arrives. Require the
> marker after processing to prove that a recovered entry was updated in
> place instead of deleted and recreated.
> 
> Keep the NA source, target, and neighbor key fixed for the mode 2 cases.
> Vary the prefix configured on the router to exercise the source-prefix
> check without changing the entry under test.
> 
> Arm packet capture before bringing up the host interface and starting
> DAD. Wait for the capture to become ready and for tcpdump to exit so the
> NA cannot be missed and receive processing is complete before checking
> the neighbor entry.
> 
> Preserve the return code from test_unsolicited_na_common() before
> constructing the test description. The array assignment previously reset
> the return code to zero and caused existing cases to report false success.
> 
> Fixes: f9a2fb73318e ("net/ipv6: Introduce accept_unsolicited_na knob to implement router-side changes for RFC9131")

You shouldn't have added a Fixes tag. Backporting this patch to older
kernels will make the test fail. Wait for feedback from Jakub / Paolo
before posting v5. They might agree to strip it before applying.

> Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com
> Assisted-by: LLM Sashiko sparse
> Signed-off-by: Lawrence Lee <lfqlee314@gmail.com>
