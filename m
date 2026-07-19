Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E778378826;
	Sun, 19 Jul 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784444005; cv=fail; b=KXIu4WGsRVmEaOhaOoSU0EXmCybHXmhUyECbBeJNIeX7YPGothzB76mMfQRkv0fJ1xiIMPa++tqi5mw7slmB1d58L2pWHtRaHsfg6D093rWA/nB7CDClFvs2ytjMgpffOE+2ho72tsvkjRlyfvHeK+1UwJBsSicHORPiAZDNrHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784444005; c=relaxed/simple;
	bh=B62gAUeGMLHwFtYWso6PnvzG4FAjy9Xb4aQz25plFI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ShS+PTi/PPS2zuZQCBviQ9hJ81J1sldLS5yuLzL/MBKR0lTgWXpqeEQWWqoFEK5FeiRBIcxTbi4oeXSYCwt1Qg514wp5x3fEO+WM4ivvp6MhI7cony2KmjNUKLh+cLSxM40dMKWb+JfOVG0k5p7nBS6qjjL0jtqwKZ2drL6YmGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qnjMD1Tw; arc=fail smtp.client-ip=52.101.61.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qnjMD1Tw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soB7OD1FyxIEYJYKMYOdtdla1zEULEpo+AKy3pEmm52JocDEIrl6Fz0L09CHKBPmXdZdrY4149/L4bsbASPMjgFGzRw2OgHwDdVMYGcZE+FaARb3OpJMbK3gR9e6OE3cCBjEybJSoNpeyCvpplPEYCOEc1Vg+AFCQjrLkq8waXZ+GkSB0mFVlaLSoGQ6/FafymPr1Wgf9ykdA5OdnoAiQt3iughnS5n2mBikf84VCIkQZ/5UvsflBM5iYfxyHydsRJlPj3/p1QVU2CPfLrr3kfDafrH8y1Jsq3c33sBzDsg37UcplWabcymN9zGZzsA+hbvtm/a+L+plMsUX6dn0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B62gAUeGMLHwFtYWso6PnvzG4FAjy9Xb4aQz25plFI0=;
 b=gJTbJH7jQ0UNquezyF1gwoJVqHdaoiZzIsf8ZlEPe1aS0qy7OaBvUY0HtBX9wum+GlZ8yjCtoRXXJvZATPFze8fqy6P6j0S1ON4DPEfNPT+hH3of9RPBp4CddvixRWPwSIUV3cyRAXqSkV3igjDTvX+1Ue8Fk+BUfD+tCkn4msks7oyvjrvP90fhlgMZx1BimqI+uZHzdF9rXfVBhff2Zh4TIKyhYALGLtGmXGRlOLiMy5Yz974el/YWWS74D+DKNqYjCnyGNGh5aFJ9pMN7fEUUF4qspVQUSYl657hw/fF7VxfYQraDns46kIeqUBTcZjSWprtcz8NB+AcaGgUXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B62gAUeGMLHwFtYWso6PnvzG4FAjy9Xb4aQz25plFI0=;
 b=qnjMD1TwGjkXx6JmN07I8bIgas0zeaGeBlXjR+1N8Ck92UcfpRuOg/5lInqyLjLNSgyJg+zXI71886LQXRXIy6Ixj5yZR78stZEYFRwQUcYNShJ54SrLwTpoytFw+OU54U+7AAmWLxZn/+wBRWRRz2i9p+13s4YXs0XEIwUcpqKIwPrGEOdz3pDgr9t/ece9503c2UWFe/BSI7kgFOUKtY+vOrWR46nBYTw2/PVmaj+1SLYUfU/GEqdfBqQixA0vG/ud4+ZHpoTt2jDwsYNtSTdP3oerZ7/l057YQuikEX8z/0LZcnGVPYdzQyQPM/PoJByc+YTd5srvg9BtkP6qTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by IA1PR12MB7757.namprd12.prod.outlook.com (2603:10b6:208:422::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sun, 19 Jul
 2026 06:53:20 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0223.013; Sun, 19 Jul 2026
 06:53:19 +0000
Date: Sun, 19 Jul 2026 09:53:10 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] ipv6: report why a route was deleted in
 RTM_DELROUTE
Message-ID: <20260719065310.GB1841238@shredder>
References: <20260717222327.7398-1-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717222327.7398-1-sigefriedhyy@gmail.com>
X-ClientProxiedBy: FR4P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::20) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|IA1PR12MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 90cb03ff-c21f-4caf-6fad-08dee5626ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dSwASwOtgKiue++nKbvFBoMtC035NJPUFsFEQnPy3MVT9XNUiKvGzapInMJuzOVwJDzuAaUZZbh8YrAVCKSnt8Jwt76nt/vz5Em0EJQ382kvuaVaSBTSsicMQeau3qKep22js3N4ndzw3nZVI6W3i3S5Udy13S0NSvLypEkd4XhZ1PqxQ6z3ZrA5c4bpxjPioqDLm7FNRKojr0Lnvk9zdBVpr35S7tkIyy3w9SHLZdcK7HKpXv69xOqPBUuPRox9VVa2wFyb/RBhappbtoIpecQrMVW9h+Hfef5t222zX09a3K7F1ALz+GiaCmUNNKzZVyfvvLzgalh/n4KjnzmQep+FwOuGwJS8qG946rC0qAoY6c7R+N9YCnV3pQvyk/kbdAEjgiE14tFcJGpyvAoI0hCnBOSlcRJSyMGnvi3Ecab+pk0/mS1B45FRGj3WW/it2WMNQNZJ3EfGoPPeMwdLKXhJ5bprPDjw1d56KdE7srhgvAF/kQronRVvlgBJqGdlDcM180A+h+bateZVsqtVWXXZSETkSzNxZx24Vj26NlsgBTG+dfEz8EcjFwnj6lok70IfQwm4zB56YvgemAks9w5EUGb9/D3+795usqhajeq6zXrZSCR1HrEaqDCy/zbpHVTrtquC3hjvkKUnG90RIGfGU6pJEU0cmy/jbvzHXTw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1N7Gmgpnqb+LA5ivBb/kQfJN4APGxJgKxv5UlbA1sUwcQxlyw1YrBVlZm4jj?=
 =?us-ascii?Q?8WGSf1vUGKIq/VFPMxPd6xi9o7zrK0mUztxG8Wu3+y0YvTMmZD1Vm7QwkF54?=
 =?us-ascii?Q?aa7ABBTFGl/U4O1kq4WVKCi46MAz/egpyaqN2He5Ssa1BCPgdvkXvscM4Ymf?=
 =?us-ascii?Q?m7fh4tugW9Pdj8Qw2j5/OjYUj8R4QkrTMlPEhKp+DKLPL3J8ayKU3PHewalC?=
 =?us-ascii?Q?wTJ1qZfjn1ukRzVSoQRAuuHf8vL8kVH8yH9B4PkQnvKO8IIl+myjJ0S7Lcu6?=
 =?us-ascii?Q?+4cWlShR1HsNx6NRWfj+nvcTJCaFzifhQDBId5yPq/U7h3Cut+Hgp34dgpga?=
 =?us-ascii?Q?QK+JRyDJQvy9YqDZha1xZYurjrhp0RZr5YL7e4JaUL9FTVRM6igbvRA4t3Pz?=
 =?us-ascii?Q?7hhRMtr89wFq8WqUZUHpEnqmbrLQ3aUN/3wZ6F+Sb7qnlf6VUflOzRpTiwED?=
 =?us-ascii?Q?bjq/YrBQ18jJkYFgJLREyL95MfN9dKoLHUKimhIcIBGWDOMMA+c4O696aP76?=
 =?us-ascii?Q?4LzI7QX16nXVDvvZ61U7XqNRYOL+K03gzv8pL2Mqcl/cqI4CmbEJAK4+UnRk?=
 =?us-ascii?Q?e8kwnJKgDfvY0LFXGH/1aAWTCZ9yOkZM1E0XZK2zO3SXDOX/w29aerdDoQC4?=
 =?us-ascii?Q?JQOUg1SEAvyYI7+hPOMgUxFaK/7NCapUQf0MQ/0wm3KlNhlUW31HcSJBsJUd?=
 =?us-ascii?Q?fQ54Vjw1+6GtrzXw3P+OYhg6G7RwHauAWpBnvt3QO7RhW71bFVkX/s+LTZln?=
 =?us-ascii?Q?apXlP1eFelX7t+2gGy8gDM36msV0BurE1R0u738ErnuwzceQL/1ilh66B7XH?=
 =?us-ascii?Q?8lVkB832bhdW/htQ7YEsOX+mkNExTs6Cd+FEJqSzIfm3Bv3zdj3KT6A8yu6Y?=
 =?us-ascii?Q?bd1oK0Vf2GxkrCvhmdx280N1XHXj36mRB9xK5goYJLbAP637tAsKJDCVnmSF?=
 =?us-ascii?Q?CUB6r0Cc1+jEzzMB+HaHxuliLzpISTRhEJjFuNpPF2pKa0YmNarE66TVILU9?=
 =?us-ascii?Q?5qxAwONEVLMVGqwcwE8v0VH76R/fgIAZIwKZNmpsMYd0RcztiOYhd+lmLCYg?=
 =?us-ascii?Q?7XDMDWDodNRq0bMOVlvi3R1cySJAQfP88FxT2KOYQ5W6gNSlF6fPjT8iPG40?=
 =?us-ascii?Q?3+9r02gKxF+9nc0Q7kudTroSI8TOBdwizHHRK3H78aVGQ2oGNAsW+AP7R955?=
 =?us-ascii?Q?ED2nu0kYKMgx3qYGeMEFghVyEDPsuRRsbCl2n+7Kcpg3YpsNsTatrijT1X3u?=
 =?us-ascii?Q?rX+0n0mETtDFrWZIDClKsgGqF3/LQDG2gQJu9HUd+HCtY0DFPoe6kqYvivF5?=
 =?us-ascii?Q?+li830K7EA+Zbc77vH3qWtuythvUnLC8pRX4XZirrphnpuPPBK1dXYEKARLa?=
 =?us-ascii?Q?iErNTSCn+AUhHSbtYA8yvN1RY8V2If57klQJNUN0TZJg7ZqhxkQqLAfN/uA1?=
 =?us-ascii?Q?R9CV0KA5PyxshTEBd1vQ8fcykPKS9P6RWdphHjtEgjyZi+6TRqV3gVJh3I9A?=
 =?us-ascii?Q?HOiIB+gU6IAWkZMQ/6y9r2BmrJ0MRUbKM3TA1zCDcp6cvsOA9/yxylFnOhhy?=
 =?us-ascii?Q?3S7LVNvCA1csiqoEcnTgcPiF9uBJ2ArnsdReM1ncBrrjpowHlPU8AG1pMLyC?=
 =?us-ascii?Q?IEr04LIcneoJoSButLzpOObnGha8D2ZqQ8Sy/GzmHEBZy4/rt36IPYZ4aqMO?=
 =?us-ascii?Q?683lGgNksADP2EstiZygG2X9bqpZvTRAd01wJVBjASipPTcJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cb03ff-c21f-4caf-6fad-08dee5626ace
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2026 06:53:19.6264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbsRjjEfMrYtv53RM4FSK5iC1Km+efO4q0cd287NiraaVaJBBgodeRVi3DOK3U8aXKB4R1DN/pqeTMTW3oBmEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7757

On Sat, Jul 18, 2026 at 07:23:25AM +0900, Yuyang Huang wrote:
> When the kernel deletes an IPv6 route on its own, the RTM_DELROUTE
> notification does not say why. User space cannot tell a route that
> expired from one the router explicitly withdrew, yet the two call for
> different reactions: an expired RA route means the router failed to
> refresh it in time, which points at a misconfigured or unreliable
> router and may warrant action such as disabling IPv6 on that network,
> while a zero-lifetime withdrawal is normal, RFC-compliant operation.

Please expand more on the motivation: Which user space application is
going to consume this information and what is it going to do with it?

Also, Sashiko has some valid comments. Please take a look.
