Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38473403E8;
	Mon,  3 Aug 2026 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772246; cv=fail; b=cISskzvp/OG2WTxbXk8MdgcfbCif0AaUlwnx1o9J0Hcl+04ZDn3tvpEd83beOD6JvtwSBFxm000U0qPy1NUQxstC5WvHMCyitZKc1kQgEKWD9/SxsiptEqBmgeHwMbk/PgIhQHTb0RMBzX9mFPDUP2n7SZqrYJRHUhcjqg51MCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772246; c=relaxed/simple;
	bh=IhWyb7/tQfb0WET1zpxDjxKfSpGbWDzAqxEeBGvizKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GN+FBTq+4biZyxWDM5BhNqJrmaQYtgHPUNMIQhrLhpeL0kQ6W4DP3a1flfYIQ2rxs6pZFd1HZXBCIXPgkrKQ+XgSGXjxp3T+3qdz1BT1A4Fvd0TII/6zl5Gk8RSGUa32guI48lQWTwDl97SQvPqZN9u3PPoIjI1xP8DgpmlY68A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H0NJrTcS; arc=fail smtp.client-ip=40.107.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H0NJrTcS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKWqwh1iuLg0RFxRbsJ33EX2C175vkRfazjsYkCPpsw/QaFH9Or3fZb93gLm84bny/kw+md2awGTclglxl7ero7e/QF3rcHhnpxoiOFyNsEqGWnyfsU3TFb/AoLkcBgeNjUAurAKtU7hCqGVl6FChyBFJPezmUrM1K1hJyCQg23zy2qFEvP02O7lzJjam1t7XJd1OYSi2/aDEG5Y1fhyw0n445RjPs10ACpGQo/D+FXy6MQGNzfsuCkni+1kl/+7Iw1z7/DLf0jcJCWqN/ySMsTlC5qsMz8bnpYc1CqH8BBhVHOTBg2+P1oHCZ2bA9UJA0w1DUPNRpGCMDAeyeQI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=338iAZ7e6WcoziAXGF1II9k74+RQDcpkDV6bHp6cnJ4=;
 b=HjWbBrZ/znr+D9qh0rU/HUNlse6xI22ipLxgEYFlAlMOsHNgm92B3UCy1lm9mirOQPmF24SnQ7A8ODzFFF2IIXdkR4DA0AnhP2bD6OFTXWB3UQBY7XzFKziq73u0zyIAXXJ+y8c3mjeOSJGCPzjQ3H/St26Whpo719afB6pM41tH2utmMVNBpFN56LVRP2AXcSSgSXlCDcgtcJPMUjJhvrpxvO3aua/6Mo2N+ZPtslxfAzfEXGtZOkFmGz5fLLFOFN5NjacuixqT6UHdBgQkwqQUVpCqu+qB3hEerElx373JPAG6bzLIPcj5ALLlMQ3kfHMVOGGsfapRu61Z3aRB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=338iAZ7e6WcoziAXGF1II9k74+RQDcpkDV6bHp6cnJ4=;
 b=H0NJrTcSi5jjDGPsb+WHdsOgC20OPpvCjdK7dKkd/bvyldJChrmhO9+7kUmEKbqWvs038Q4Omfk3xF2J6wASMC/pjCfspHGBVj1Sg544YqzsFmbSJj4a2wkJGD+IpaxBg7KUfkjpNjcaZu42tZRfcNglPgu7VzeqSIkviZ1gAURW3jPiRufcxHk9yHp37atSBL7tnfHl2S46zM7WqVt21Dw8xK5oKV4/7vS5G5bZDnY8ez723hfA3Luuwj2jiVDMO1ZrZT+khJm2Kb5k6ezYpPtWZeVEkGYSwl/YK7QQ00EfPwBww6kYp94IoyGZEBsKlewZWa8GnCcrwPujolEUxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by DS2PR12MB9615.namprd12.prod.outlook.com (2603:10b6:8:275::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 15:50:36 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 15:50:36 +0000
Date: Mon, 3 Aug 2026 18:50:27 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v4 01/10] ipv6: add ip6_del_rt_reason()
Message-ID: <20260803155027.GA805699@shredder>
References: <20260729120739.47880-1-sigefriedhyy@gmail.com>
 <20260729120739.47880-2-sigefriedhyy@gmail.com>
 <20260803081454.GA573507@shredder>
 <CA+7S2vJYnHoTx7S6x6CzAzfvTYB+RNw0RnYHnASYyiNRTyzq6w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+7S2vJYnHoTx7S6x6CzAzfvTYB+RNw0RnYHnASYyiNRTyzq6w@mail.gmail.com>
X-ClientProxiedBy: TL0P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::18) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|DS2PR12MB9615:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a4bbe5-2bd5-4adb-971a-08def176f5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FE0k+4njcUc+f9XKVQfdl9slkiN6ARUcNgayHo/M9xm6u3NunMf6tMWccvQoLQE2Qsj71vanwIJ3WiN3hz5EGIpIqgrBpHbnn6AXbsFA77dVZiRkv6xYRp8U3PjEzCs9cs2vO+Qrg5w2a5FNnoV7HkfTdUVLfrPTa+tgrZWHbbsDveRbnsz/6pKHOYeJVDXxEVMcwToqzN2M7MN6ZbiJ4YAIMBjzrPSZKwRyqmigNtEN/MT+mh+Rb6UN6eLJAvKuRzLSoKKBE2Z7MvelMV6/9j12T9pO3i55v/X/3XvC5VdOwRudIugmmggXvxoqVfbFa563mERsRB3csVZu5oDZH0jWTWAHiEUi79EMgAozaQaidoAL/Bx3p9ju9ClJPPCGRdOOBheh81sCup3BgXEkAL8UlPZOkiHgq3Bc3jpr9N3RsE2bV3BH5DnMlGsJY+2IdAL0OKso8tqtZHdwfmgZh9TeuPEBtGGZrT8LRjqT3sI86eRQt/PG3lV41Q2S5cYG7ZMA5S4YVFYEXI0GvJYFfAFh8uCq0KEFPvF4zVGW2kC09848QPUxzVOeI59kdHhIvme9EoEywD7deym/TSn7uVIpyFLziOyyxKPN4oekGz0xjLJlKDdfGMnukxpEoOVy6cZiSSzF4iYEBj4sFfFb917CCiL4cAlqGKJ6FaYw0d8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uGp2ClCiFlviv16lPpyad9oeUB/xoTqmwLrlFnzEdlV4UhiKeApMpDqV33MP?=
 =?us-ascii?Q?0ir/Uai3wSJ9HXOXi2JSm1Wvs//1L+k72atktk0V1hKABF5CcQwBXXEkjE9D?=
 =?us-ascii?Q?jJ6yiPJvlLdCoztIMdVnWnoOsoIUR7B38P1f4jS7M6A32G6bDx7lfg1Wj0r5?=
 =?us-ascii?Q?ft/6jr3r8dF0/k0ZCAQGVNIFevLMTuA20CXolRrmMtXX85wDpZtjVGJsXtlk?=
 =?us-ascii?Q?tzfiXqUjR25YOCO9JuhrAc2G0Y9fTsidAx0H8q9nM1FvpXq4D37BLb774gH5?=
 =?us-ascii?Q?Sy10pVjgiQDaawsjQhYnP1HTQ5/AAy6Hk6X+Mid5HH+b/3ONV5yjMTgIgzfL?=
 =?us-ascii?Q?UYsm7enS7Zy5N+7xxiT1WOPH3B9OzBAbXf/ifDMFVEQR+c4HCgMGPWK1d3am?=
 =?us-ascii?Q?sTW3qK45rTcrvm4j/Taklegj9rRgemdsidhqSAepnmVhsSsdiv2Jh2T5Ozbk?=
 =?us-ascii?Q?E5HSg8cCJY8gI8Ns+M6WawX5FKDqk/r0MkpCJjkoKX9VolaBGULgLHXcVzOO?=
 =?us-ascii?Q?uKP/M6T+3Pwn1CMBkw/N7Lmoe2oYzKW14bng7WwoMrVCzIpXdT+QWJzu8dXa?=
 =?us-ascii?Q?cdzLwpWfow7ZJvnuW7zLrgUO/n8pMuSQNK6Ry+N6XurVWiL/7dm/XyijHhqL?=
 =?us-ascii?Q?hEZCYNkhaJoUVzxUaqLpHCOIfzHru7yxgRWVm91I/IUpHin0V+e5r/pYAI0+?=
 =?us-ascii?Q?m09czWAxkjo1lhjSB3XNIlqESZigH5Q/7oG818SM/T0QSjwk76VYALoTd+ev?=
 =?us-ascii?Q?KgXIWVuzCS/S3u9nGHXtTK7StFs3yltsgHFY2a3mJcXLepj6DlOvc6BVlsLo?=
 =?us-ascii?Q?aNwcVNAaTX76PLggbv6yn9mVN8bEfOq/Whtqaueh3r+3pY4lpEQmzEky2qfa?=
 =?us-ascii?Q?239aUPr4Gc7C03jpxm38huCjhIXokGRDZegsF8biRsJAkz/mRBuwlqMpNG3a?=
 =?us-ascii?Q?HTW3oXEiCr/mg35bWwzREN8gO4t+oZxodwsPV22WA6vfLXTUcIwB3c6sVz1K?=
 =?us-ascii?Q?cAX2WDaxhl8vBgdRsT1j++JwOyobRgCzeDd1CrluNGQ/0/RTpGUjn4fa8S6S?=
 =?us-ascii?Q?HnxyAEAH9KxscRpSRAs025oP90tYzVDqvUv/0gROHOFQ+C2NKgWRWuauCYqr?=
 =?us-ascii?Q?UCNN6rwPrQQKXkXCfpJa8qVaCzcW+MWB+XG8Z+q1UuZ+75gqtE4Vk7hWxSaF?=
 =?us-ascii?Q?oxR0+Q6yTypt2YQTcsnOxCuFDkhSWqmJe9NkYR4dU5sqF+cKLs2yfa5Bp2Tr?=
 =?us-ascii?Q?lKohdP/XEdmdusMqCq1/4ReeZKO6D33e2Tt26ZbQ3mb3YdWJsyLV+VwmbR6Y?=
 =?us-ascii?Q?lEJshAQCffuMTOiav2yAKoygYsuClqT28xb0TohAxoduT3ycv678+n24M2wK?=
 =?us-ascii?Q?oSNmvtFxBrZt0WEL0XnLZ20oPBpZhiRCfgkJ1E9b+29qz8EF5vmdajUEJWPC?=
 =?us-ascii?Q?p/X+cCVYDn10FlMuFTH9twDl3BV5IaWFy/a6QKtExBETfAq+yKpuGRSwgpKa?=
 =?us-ascii?Q?b74I52MAjjIdp8avzc5TfMVI1ND90u7gjF3rjx4cicZpg7AaivMSIlaQ7SLH?=
 =?us-ascii?Q?G6ipOGrEHJTX9hL3+Ktwn3F0mVx0RaNoAl0snAC1cmfy2OtWxZsZrk8QOxt/?=
 =?us-ascii?Q?tEEJPsaJuCSWD4ojvT8AbljNeffNtTQBglHg28bm9xXkQcbuBCW4JNma4ZZu?=
 =?us-ascii?Q?2/i35N9RBH2je+Wf5Nl31IIJmKoqYWhJxhb6raJMz0jsxpSJjw1ddW9/IHHU?=
 =?us-ascii?Q?gfVZnm1W0Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a4bbe5-2bd5-4adb-971a-08def176f5b9
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 15:50:36.5868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Mz6fSAscHKTIELN+g/pQPlWWVpEVy9OgUF7M7M2iY05kPxwCFbpe5lfiayOjznFBveDrnGgg2ilJTA61HoB9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9615

On Mon, Aug 03, 2026 at 10:00:12PM +0900, Yuyang Huang wrote:
> >This is a pre-existing issue, but does rt6_nh_dump_exceptions() safely iterate
> >over the exception list?
> >Looking at the loop containing this code:
> >net/ipv6/route.c:rt6_nh_dump_exceptions() {
> >...
> 
> I checked other Sashiko comments, and maybe the above one is worth a
> follow-up? I'll see if I can get a KSAN trace on it first.

Yes, follow-up. It's not related to your series.
