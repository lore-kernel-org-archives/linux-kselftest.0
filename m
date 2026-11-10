Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794325330;
	b=v3dkstzjxsHE828v7/yykSw2iJLMyIAW7q3J+Idm5PR2ju95opBq1j0tciAtjtJIymcE
	 BFvJmvuDK8AshL57gYstblCM1BzutuZQwnrF7ZF8ovRJ45kqZ2gTj134FdkSix9snAPqw
	 mmOQfXdoJyNo6+7XC5jrdeWE0+ReZlyWikFxYnfReRnJ1LXuBBBzRMduv5xH8GghVwE9K
	 uRgLxcjeKFxpRi6y2po15yRbictKE3xMXZNkstieHE/HfVfSmLbTlbeDkYgxJPQwH0Vvl
	 H/z4xtFvRXUS7OW7+I+/uWih/wFHQRYYGMqvEtdjBm67wkIzijCAU9j12zrNPnaUuEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325330;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:User-Agent:Date:
	 Message-ID:MIME-Version:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TJh4jf3y7ZohPdz4G0/nPPn0WlsJMi6L7Ufm+QxGxMA=;
	b=SfD67Wdb0YLxK5O74ORdHyF1NkDJQP5RnE/9AWdUArh20r0LwkOt6G9aoIbLoFH1apMO
	 uuPcbdP6cbwQMbIGtQwrgmSelS4Z2ss8kps9k0Qffs8646FNY9nUV8CszTMivgH80wtgR
	 9D6uPrl9jXJncT39czmyt0mTjWIIxNrtE5nHJSMRmMd5znVZKjjTaGehztLe4ZlVlOrng
	 yYqXnIZ9TCXhAK0KvT8Ig0zHIO0zfTt13VUkrb0Sbe1ODtzwMoqddhk6PmS2lpGGm8qQ1
	 9w+lJpUzn0R580UMjCa3Sk+Mkp5Sn300cYrS4U33R+wW1YSIABS5r8MZhVfQGx7P9ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="D/74dJqN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.66
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010066.outbound.protection.outlook.com [52.101.46.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C8D606AB44;
	Tue, 10 Nov 2026 15:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C8D606AB44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D/74dJqN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Id+/FaJzGjZW3q+cUeEyxmHho0jcM6gfGaORMreGzlDnwoUyyDud0+T7dglyq7Dlu8RDqtz27ra2TD2oGRxMIOXz1n6wxM5CcDTOcioNEdNYy3WxMw26YkKuCjXf/U4VRY5OD0yPxV+ybT99ivIRjFKnvsiKquAgtjr/UyVUKhvCYD1zF9qolNbR4vjq/gDWo/Kv/F05akReE81elVhrwjBfmnpmzwmFzIZhJPrYW1r8zHqaFfCZU5T0TPQ7JGWdzpKgZzO5qFdF7xXPfXo0hMZvlSBpJUA+3o7xG1DJbB55UftA40CtzB99E1/5qtPOuWDGlk2wW/sffnky908Bmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJh4jf3y7ZohPdz4G0/nPPn0WlsJMi6L7Ufm+QxGxMA=;
 b=OedB+UzjjmScfRsViXvMaIXttr/LcjGuwaajzJ4XrfXos0hq/kpSzZhgIBDuOhCAK9r/Dce9STEeqXAmtHeQL8PmjbHEJJAiVdrkl2i65SjRXLzsudww3G9WVpVdJ52AePVWEHkI5R+GO7l4DTCKQYRQTF5WCpdoa3tSgJi/YBg6jto3eCq6MflLOrIWAXzgk+4JttReHbyb6nFLXM1D0xHx/vwHNDROn8m2yqbsLx1HX++rHdA0n+OzjXW6cYCknX2MC0D6McPaJpQ/7eRZ5eslQ1UxBaETLYMfPoWTcLp+B+ibiR1Q72Ym48YxkqC1lDY3hWwNAtcxnB0H953VNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJh4jf3y7ZohPdz4G0/nPPn0WlsJMi6L7Ufm+QxGxMA=;
 b=D/74dJqNFSBQcHXft02ZxKkT5cFrCWmLo6zeFIa8ghZN80suQJKB8nl3dhv6PmhrUf6dTiB572PGYX/jX6reUC94lqbhR3Ssb40GNnNWeT9evTnTzMPUoD+gijYD4UkqzYj+5slKAUIVz1ZJ1/fq3op62NIJZfONzdjrmWEB8Ps8nuQobPhjgV6KFnzuikaKOSLEMZpZ2yCLhItdgQ/xHoHrq9KNS6OOI+2lRkLlZe8LP7PRV1bbXKMX5XyouoqcawPqxv7Y6QW39epdXPfwC7T4ybYAQc+gtrVMYQrlUdfneuqw4ODn5B+qaVUDHPovPqLAFiaNB0xr2QTcGXUUPA==
Received: from PH1PEPF00013300.namprd07.prod.outlook.com (2603:10b6:518:1::e)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 15:42:05 +0000
Received: from MW3PEPF00001654.namprd21.prod.outlook.com
 (2a01:111:f403:c91d::3) by PH1PEPF00013300.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:42:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MW3PEPF00001654.mail.protection.outlook.com (10.167.249.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 10 Nov 2026 15:42:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 07:41:38 -0800
Received: from tuxedo (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 07:41:32 -0800
From: Petr Machata <petrm@nvidia.com>
To: Hannes Laimer <h.laimer@proxmox.com>
CC: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Shuah Khan <shuah@kernel.org>, <netdev@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Petr
 Machata" <petrm@nvidia.com>
Subject: Re: [PATCH net-next] selftests: forwarding: vxlan_reserved: drop
 redundant in_defer_scope
In-Reply-To: <20261110-vxlan-reserved-tests-v1-1-a252d69c841e@proxmox.com>
	(Hannes Laimer's message of "Tue, 10 Nov 2026 15:03:55 +0100")
References: <20261110-vxlan-reserved-tests-v1-1-a252d69c841e@proxmox.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 10 Nov 2026 16:41:28 +0100
Message-ID: <87ld70y9qv.fsf@pmachata.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001654:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6ed996-4fd9-47be-58f4-08df3f412c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|18002099003|22082099003|10067099003|3023799007|13003099007|11063799006|261026121527099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|56012099006|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	7a7CGsj9PAcqpfHWbz6aTreecWAnVFqXYKcTVTZzz397Ju9wQKZC0cmslrjhasHroQWQU+olxjRnhaHk/NdohVisU13PBC5jtv08Ahp8tdNK3oN/5O0jFcYVqo6JKMuCAp1Z4fKx00Q59+R5g8HmUt69PCX0o7ZrB3W9QFVci0Jcmg2VTndt0muT7H4dLWCwS4FA2A/5UhyrtN5+wSVLDUoSqMUI2nLioHG9nlbUJzx2GxTS3lHWOfIwxpQYP4rgBU2bvuZeeuN2OFDQhSWRS1xwFKOCdUs3X7OHY1ZV95bBohIDa9imEp/Zo+N2bmuMIzDd18p9t4dqQSsVqkxAtzivFFjbk46kecR4f9hrwhn/FDcLM3j6+Br0qevj/jESemlOUMsI9oYEZkqmwqWUuWQ1BrkD/uCzKmfG68q2m39CANybU348uUQ3oHKc4TyWEms3ZdzlA6rtckOBvxFk97a2SiSXI7g7YQSo+3qLLxl1XUzG9RezRSGofxjMj8YYU0G3wMUu+q83f9pm3Qxx/f7TjVmpw3bj/f/VHDMLC82Si36VHCTGjdrmwpIa9fag364A3hBF82n+IOUJL4o/69wV8abJoUd0iwlZK+YxLyTuF+F+1vQd6dzYJCrKRElKL/b64q9XqlbgTFqirLNF9z+IgcnYEXW+Xh/wT6h8yjbdAkezcq0KzL9Yf1Hld27mOjrNNjoOJGGd77wFVCK8Vg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(10067099003)(3023799007)(13003099007)(11063799006)(261026121527099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(56012099006)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ghjMvaRTohpr3Mfb9qdupvxG56BNLQCCUBeFnhmml/jUekDffF3lzUnJbtudybMpFVKcFiNj06NJpPf49jRVGMk1BRBHp+Ie+o1VgiEEcwitDXysj22pv6sEMskgtxF/AyX+Nhw05aWpITCFNG1QGccmR/25VXS8e/PMnP9Cof4wk/t4IKV+/Hnj1EdEvG/6s7NA/aWQjvXNv99ZlKE68mK/2s69kVRP7JBs+U1XGd73xYGLrDGZgfvDK/D0T7YiLq1I+8mdkhM3WjOFn09r8SZslviJvDyzPS6rndy5msiewvC8gJJDbVT7czmuRzLHHEC/D2vRWGcKlJHNc12hpJ7LN+h2rYfqm6fZUL4emWwf8A+jLQtV+QOkzPfq9q8jK/nFj4HYGRoP+noeGySzhUhub67/8qXyI+bYqUsgzumiz9/OVu4v4Aly2n9nTZLj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:42:05.2711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6ed996-4fd9-47be-58f4-08df3f412c02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001654.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615

Hannes Laimer <h.laimer@proxmox.com> writes:

> With commit a6e263f125cd ("selftests: net: lib: Introduce deferred
> commands") tests_run() already runs every test in its own defer scope.
> So the per-test in_defer_scope here does not do anything. Drop the
> in_defer_scope calls and the wrappers that only exist for that.
>
> Suggested-by: Petr Machata <petrm@nvidia.com>
> Link: https://lore.kernel.org/all/875wyo6b7d.fsf@pmachata.org/
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>

Thanks!

Reviewed-by: Petr Machata <petrm@nvidia.com>
