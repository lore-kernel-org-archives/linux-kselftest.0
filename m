Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B312AAF1;
	Sun, 18 Oct 2026 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331264; cv=fail; b=JgUSEoB4uXwBqhqtZjsOIUztJsz0NgvmNvLiu+4FAit+U20p4WdXIFod8pP8lpnI3+W5NN0HLfqLH+G9lLxlRdkURaFw7Z1xVAH7AeuET6Z4w3uVCUUpu0Oa15CZqcSubrT4EYtRhrrhDoZW00Fs5Doqmme8DdGcGIsfhEfXGpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331264; c=relaxed/simple;
	bh=yxovUfc26jYmO+PPyTbMdIGzau995kjvB1ELaI9UOb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cBo2O5ShSE1QXyS83vt01W5KkWXUFSpmbblCGJDWz4Tgz5nz8d5mqdz8iq0Pd4SCZEzP8Tqxsfx3uoYMDV5ym7bxLkOeUW85sWzaPPAMVeDGGSBTRaPorYMagkYJolTh+guIwZUenfVfSkANQG1866prenMgUKvlKqB0k4E7mMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZnxhQwQO; arc=fail smtp.client-ip=40.93.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZnxhQwQO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNVd8pJLmImHaUisiSaYS4eLQvMI2TdqZg/VoyiCan3wEVu9WohaSzLpGCqX9lfvIHGfQyml+0xT/aJIcQDTIRbWjOQu1xEtJ6ENURfbfsqPSMkRRiioIdtf6/QcUu9F864/MbVkfUryAqo2lsDsr8jmBDbtjb3ph1XCVdTLBzROqK9H7VRKu0pix5Rbi+NB90DjqKzo0IKrLXQbNzxa6RhCwlCHFS1zvLZq6SlyuXfrINXa3bTWbojAkEW4uoMZO2hNWHJB8hwHjvECoqXCdCGwKE7HdGRwkZmhYbeEvVQV24f6d4kV6o9bTYyVFbJFHVuyEHOwdi6KDe6y3zsUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vbIwxdGWNmYYhZ3GjV8V3coMrbjFw09tD78V1fIpjI=;
 b=Hh4M2nA21TLmKhNstp8Kt3NPunnRC3B4syHd/F0Uw2k7EYB+ot7AOrxLWJCbW6IogMHiMBIKvSdT/Rk67OLLhHUIqUjon1FxvfacN3oQ/9bq6TSm2iPAfDtqMeEKOEgCXoTZ7CGO2jNmB7EPDBViPV5qvb2FWGMrcxPVfS2a5qYSK7YxiwTAJSw7TyLCVLVtEvUFwTG6/kVNwzTAyL0xAYdDC/xPbwk9cUtHLZ8RnnpsAJIr7tgpgNgryxYqptVbOWcFjFZryIF9D4x7AuWr3Sy6aCCmoB/4OaUdgcLiG8GTv6FFITUjjJ+rCPCw2J5I9AXmLrBAnjpqeIMjP21AmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vbIwxdGWNmYYhZ3GjV8V3coMrbjFw09tD78V1fIpjI=;
 b=ZnxhQwQOEx7KXy7fkjaKjsqowmn9UKkzlHYb9h4aMKsyKfFF1Shea1MiHZ/IQ7XFfnNJMJttQLxovPnXlOKNQXr0Vu9wfP0uA7rpthwG7NSfpOws6SPNkpv6LL+AePlzt63JJHcM7Eql6cxNFmusjlmQFpps5VExAwvFUI4SpoVg1fR9zPyE3X2OC7xiK/gLjLe/oWXPT+ueEurnZzPLxiAxncCBu8Zya7GWX43wkxJyMWtG9I1cw9Cgl/eIi2bOBPJZtYUkmCIO00xubGhuqnvEZ7NC+F+Z8ooJM8t2JkNiIDupg82fUcTISQzcO8S/1w5I8W6QPiM1iHC3dJXOxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by BN7PPFCEE68E7BF.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Sun, 18 Oct
 2026 13:47:39 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 13:47:38 +0000
Date: Sun, 18 Oct 2026 16:47:28 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] ipv6: Cache pmtu on all paths of a
 multipath route
Message-ID: <20261018134728.GA2544985@shredder>
References: <20261017210508.71849-1-deliran@verdict.gg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017210508.71849-1-deliran@verdict.gg>
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|BN7PPFCEE68E7BF:EE_
X-MS-Office365-Filtering-Correlation-Id: a013fb09-edc8-45a8-eb1e-08df2d1e5f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	++pi3yH7tMBmGRuVUUzgn5kNsHAlzGu415slSi/XA2L5AiWKrTKol/VM1niWY5vU/DcNENboExFS7gZpGqdAgb2WmUvuO8BoYuMBXDPt6QRfFIAZgnfBW34XFzeE1yCpQUYFLeGqWzKlJUjZlc2WJqHQ3G7nKrNZTVAo3vzza5u7/ZVihSErXXNuyvl99UP6rAjss5j7jQ8n1Wy9DyDIeBU2n3ihODVXBIejBV8aa/aaOUVj6Mjm/7pd4A9e4g2Nd+rXIMWgpB02yl1Ze/7yhxku37VrsyzbOB7H7BNaZOmuFShCGHPangJqZObvopSTFLWJFYIhD+Ic9PNrRfWyS01G2qjxaCZ3/xzScLyAfH360DbDxq1+Dy8RUjPDG8E41YH7FOLNA943DzPpBBuZjM9hdhm5mEtegCodFKLTVKO1GnuapiOKmydBKIeR8uwltYTQakyoNb3jo0aI+wpsMciuCYGOxvtvenXnIiUKnOXljZpJISB2RT7Ebu1H4IfZ7OtyGz/D3GEHF81cA54sWcZ7pXASazEKEUYLA+o/NRAi2jBHMq4bZjtI+WPT4rhTl15OLdjXAQ9AwY/MJfEmtedzMbmp1/NrDEavrR7tdk5+KuFlpsMNmWkJA7LZFYbIlxo29hGn64tTXaSEawXb8tgtD7grIS2v48lEKgju0QU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8YyWwdxEHgHmccsS7R8dGoVpq5Kd3pwpUPYPN8TRgY8EpscS6me3fkyDODVw?=
 =?us-ascii?Q?wAk2d0BMhEGFLlXiQ4IFN5B/8lsRXKvGJJwmlUoaqJcdSlzyZDwvIRkH04e8?=
 =?us-ascii?Q?aACcMmHu5+vWsTg52Ik0GtgTTLTRq0gYSf68CxhVIVw/lN/b7CzQotUVgKPW?=
 =?us-ascii?Q?Hy5oALSHPaQUD7qhybDNr7/UpRBKaD1cL8lKXF3guhQvAKQkWF+afWOzrRdO?=
 =?us-ascii?Q?I7dLtwfuPHSH7kOXyJEp5ipc3skn79arTd1I1DCQsDZVI1dfqLVNgbY0/Edd?=
 =?us-ascii?Q?X0MIJ9qqbEdwDG1sGeJzE6aAMpcItI6nHGNkq+fA7nOfVj0iYPlnTHPeOkx6?=
 =?us-ascii?Q?K7wdMgUio/ZbExqLOJhU9G9VJg0LDPvdxD4Akp3PjzAglb9QNFJEIrAE7nSr?=
 =?us-ascii?Q?ZCrmiPA5TFexRGXdN4koFfhuccV4NsvBSUGSmoTIfJkj517nWesmNZxBcJeu?=
 =?us-ascii?Q?5jn+TmqTlEeXi1nffYa9QVb8tu5nZ3fdWBsjv+AWr+W8Qr5/R2fJWs2B/Hl4?=
 =?us-ascii?Q?dG13H8K1oHyO6/EiCmqgCs+6EcIB1TPqsor1tagekQ3acUjoSbTrJkC2D/Rt?=
 =?us-ascii?Q?BwwCznHF9uhDJSciKHWxqe1mWFMnvGR56Fo30Es9CkIVFY9o71oe8JS+0vGg?=
 =?us-ascii?Q?+WqtN8tUYcWOQzj8tJLZ5psFJj1LSiq/SP9dRl7592EXxXYD8/UC1AsMx+/n?=
 =?us-ascii?Q?564bBZ3Oh4Zjlk+v1LjFkbNTg2sNf18qQVSqNCANuU2Y8YjoZdVsucS6UzCH?=
 =?us-ascii?Q?N+6BjltZVAI9PRyCR4OPESb1gfiEJBJuxc7O+OKkRZZKIBzH0Uv9J55l79m8?=
 =?us-ascii?Q?33nFx3RQBS1Y2TLcXDswxg3N7B3qkfxheSQb2VrSK2eOWrPIRSclkUBy+/1Q?=
 =?us-ascii?Q?8PSPmBYqG6XSmxSJqkS/13Z2PIW5NVjsC+K47OrbcS8pPIph9BVHnjzCM6Wt?=
 =?us-ascii?Q?kEyMoYKisidyUveRR9K6ez/l6qCgNdb63Gx+2y78dJkYfLKUecLB3mxjH9+R?=
 =?us-ascii?Q?mfg6E9+3cf+N+i0jFPXztRB8317nryM/j9ROq7SKDdvonFzTkHy5crzoNCeY?=
 =?us-ascii?Q?jXM/hFJLPMNDCcHtxChC1Ro+uQJybiACy3419B1STS1mm0W/E/X7/XzOfW5o?=
 =?us-ascii?Q?vNA5Wsuz9kehhhKzhVRLa+RAP02QLI+Utu1g7JzG81KnrRkDV+qS77T2zR6h?=
 =?us-ascii?Q?PfhA/sOvP3SSqRNjMCAStoHPiWZHRscGVw0+N1t0hvWchKbApMMrN5TmjQ5F?=
 =?us-ascii?Q?x3BUMhlZeE9c0dC7SnZloUbLe409/czTWtQkZm1RE4eKCDHy4jeYufYyQ2wv?=
 =?us-ascii?Q?dXXhPSrgmcZml5syofGhDeOVgwgbGb8xR468KIs5gOD3+kB2fZ6o3P5c2Ree?=
 =?us-ascii?Q?LHhnmkghaZsz1L8EUVqCxe6qdm0deVqOItwwg0gIFrxA//gv/rQTxBbI3SxE?=
 =?us-ascii?Q?AJXd8Rmlo96HgvR0I3lgWbdHLn/7aASYE1iqmlDBiO6Ds/OzTzLHI2+7a3G1?=
 =?us-ascii?Q?JYw/EjSdgQbLaw62ejkf7Nij0JPcGZRgN/zdFcHsIcwFsCJm+hDD0smH6MmC?=
 =?us-ascii?Q?mY3hFXJhO7n+w4zg6cmVYpi9IIpBQK6u3Pux2EE8zaRpFOAj+mumJDP2D/OG?=
 =?us-ascii?Q?oyBIdszntug56n4zlCZZkcVdAorabynVdqW6l9beoIhU+YO210pTt0kRSBYs?=
 =?us-ascii?Q?PgR2qMv9n8fGkp0V89pkx9FIYRnxas16pkl1APciYqroHW0I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a013fb09-edc8-45a8-eb1e-08df2d1e5f86
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 13:47:38.6033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/oh80jcgwVQe7X7uQaShKZ96ac9ZzoU3ZSUi1qIM6qod2Gyc8Xc/I/OinpJJwW3OgZSVAHU9W28xYvCIGZMqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCEE68E7BF

On Sun, Oct 18, 2026 at 12:05:06AM +0300, Vladimir Vdovin wrote:
> IPv6 counterpart of commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for
> all packet paths if multipath enabled"), deferred back then:
> https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/

[...]

>  net/ipv6/route.c                    |  88 ++++++++++-----

Given that this was deferred for two years, I would prefer not to rush
it in on the last day of the cycle. Please repost when net-next reopens
after the merge window.
