Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008359;
	b=O+B118K/9wxneHGEvT/y3jXC/1VqA/vC4c6H+pdmHVEYJdYV9r+uiCTlqke5X2Zjx4nl
	 4SFxbn+M1cWnAx9n/TDHg8txMzJMUk4KdsTaYRXufBwDFdQ2oOSeloL47fyA/SnePPdCY
	 162tl4S69bc1mFhFeBU+CjBTJJHqAhtychHR4RuvbCrX/fsQsSjd4sus2FMBuLIIIe1Q1
	 6ntP5gzCEoThM5SYdW5xDLf3W4ZtPD9cpzK0cfFhcjZNRr5nmDyeBCT7Lf1z1V6jJD3ll
	 txZJ35vwfSmsg0zB5stNT9NVoC/+/sVZbW7w7Qdmv0aAmFcy+tYIAvJ/TNHmAOyOw0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008359;
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
	bh=7wHcJ+eBFXLSzR0kKx7lagoUrTapge0v/Nq44FtYUrk=;
	b=tsmLsEhriZ2FavQDb+0f4xoRFwowJHwvK1yTZv4hP9o4T9kh8p525+7ej3+DrJiTTUae
	 gbaRko1jphfGJQQP2R1tDJaGAV/CnWsaXPhgicu2d0aeqxCwBPghrep5S5NE+H1D46Khp
	 SeJUMXWW0SKvqpv6mkUJUgrVXVa2Wjdo6LL6NH0WG7kLRpukF6mQnwq9DEVBr8Y5XyiNd
	 iLr+C3S7GL7uJjnRFP383La0F60mvqtNH/4KC3Ex5Mi+5qofAxrRcCspJApaM7b3YNkWC
	 jMvO2ZSjTx99Jcdwvucno/KghutTT5i9D6M7lAQdiWxE+flhvXhdpVdQOz25f0lK93Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UjxC91NG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.58
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012058.outbound.protection.outlook.com [40.93.195.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A62606A338;
	Mon, 26 Oct 2026 09:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A62606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UjxC91NG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXDqhmbWKQ98WZztXhmubsvQ+4xZo2hTYppFyyZkYda/BDrl+lzHbG4Ghgsnvq2u6H06xRyva0FubV9+qGUsULz2tiJtrpGHzACMhqA+221TT3wuFu3Rj/9V8vxiBLwYvG7ZbLRUqKokXVoLHOLZZ0hUjQ+7Ha4dtI9t3Ra37BmnKh/TB+8L8C2+Nl5xagaF/U1cQiEQ6ML8FRhKr1w+ygojc7I+JtbzYkAqY6fhPF/v2qgt8IVZlJ07Gisg9bZ2Qa8jzC/DASfJWD7LuVntWrfWYdeXe08+sNswW+UgtDNhgHHc4FiPnwdg7zCpL9vdBv5OXRtlLupB8f59Tbl7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wHcJ+eBFXLSzR0kKx7lagoUrTapge0v/Nq44FtYUrk=;
 b=XChfo7wt5SXl5n6BBNAUYCS5RRNwocYNZRd8J8twF+dqATInAguqg732q2vnRACQUvO9/jcqAKf7ojVieClk5miI6hbUiewCN+n3+Bn7K3P3jCCKpsK0Nm3WtPdesAqYa6KAo2dpIXrUN6zULtGNMXFZs7r2y1NvPaGYTprFlxHu3yMtUpUQE0TVPHOhPs1foqTAhtt44nKx30yfT0KC5guIB0UI2CJEJNzQKIuMzpu/serG1QKmNjI+MslwOjbsPkvyDorVNVQEg/XcHDYS3AXe8s88yWd30aFABsX/TFG24QZ1XMq4yOeGGOANPar74l2zSl/wgtg03OMTtCZMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wHcJ+eBFXLSzR0kKx7lagoUrTapge0v/Nq44FtYUrk=;
 b=UjxC91NGS04220smxUTvavjP+rgB2MGywWuPqLypzgkzDvOCK15DHrovgZkTN5alGXJOvr21Fyz4W9mnyx1MkoQ43x1UTRe8Avq3LthBJNJYCFcA24RfElesC9TrbGuji/DM7uT9YrrXIVa8bkEpRHSKgxzIHQ2QjjrQly4QuHXZ56/DJXQpJSv5inlCWbUVwtUtfO6M8/ZrXgD4Tw5fhjjCzhqgEoMY8XM3CsFUR4ew1zwxWZH5qlPTAZmQ+MOAQaQhYfBwpDaTzDlVotMhrBz33W9w7cPrxAZYQxiUE3qNkbBzYO2FRyK1y8WvSGkr1nEWn+7pnvX8BO70JyaZHQ==
Received: from CYZPR14CA0023.namprd14.prod.outlook.com (2603:10b6:930:8f::20)
 by DSVPR12MB985431.namprd12.prod.outlook.com (2603:10b6:8:4fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:52:34 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:930:8f:cafe::6d) by CYZPR14CA0023.outlook.office365.com
 (2603:10b6:930:8f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 09:52:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 09:52:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 26 Oct
 2026 02:52:16 -0700
Received: from tuxedo (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 26 Oct
 2026 02:52:10 -0700
From: Petr Machata <petrm@nvidia.com>
To: Hannes Laimer <h.laimer@proxmox.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Nikolay Aleksandrov
	<razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, Petr Machata
	<petrm@nvidia.com>, David Ahern <dsahern@kernel.org>, Simon Horman
	<horms@kernel.org>, Shuah Khan <shuah@kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net 2/2] selftests: forwarding: vxlan_reserved: add gbp
 changelink test
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-2-f0d13951c09b@proxmox.com>
	(Hannes Laimer's message of "Fri, 23 Oct 2026 13:14:28 +0200")
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
	<20261023-b4-vxlan-changelink-gbp-v1-2-f0d13951c09b@proxmox.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 26 Oct 2026 10:52:06 +0100
Message-ID: <875wyo6b7d.fsf@pmachata.org>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|DSVPR12MB985431:EE_
X-MS-Office365-Filtering-Correlation-Id: 2032862c-f01e-4a9f-9cd4-08df3346dbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	2G48AeMjP/UKDAGCfAA5UfDRq56jTPlLtsDivJEUdzY5X+LFQVdYd4lOUvpMXLGv0AOsZueDdnjlkTFzVprOnp/++0MA5byyMh7L5YVlGtdpkLGkz8/5N44JjBqyWiVAWYvyMIJu08pvs/5mRVnvAu4iegwJFxlZ4d8x9Tz0hc+a0MACOAtlcq7AWul8Dn9emivcfJVUbHNhC4u6ITdvicSdCXsAPdBg2fSVP22597394QxYQ98DprFcKtt13+yl9L3u7gmUSGXJHKJKxQCkEm8WRwBDgQZsu7otO4PoxqZdiEEZU16ZoMv92CUPa0zx1btgJmTVZss8s+OfmJRNDMEtMULMzWw1bhFJuwW5LgNKZYRXcK8gc5u9hfPWqFTzjHEAXOx9pLgr/ToPSSJZvKv5WJbNfgYhW1Ga9Ez2+HhgMHM37X3ccdEfN4k+UiCRfQop0mrVLkUCQtuSDiZOxrKnWvd2QRKzoC9VOWertWIKIZcDFV4tJEzNDhOwREDv7AbdSJjy584PSWDi1QFiAxgcw+a3NT935HnvDNr1h21QmEPqVNSbpaDzhaGoNQwrsDRdqOCEZaOygKBWUQSQGaIJ7XpcVbeAh+QaQGxgensA5AfwfEJ7CFOBkcDzgEc+gtySoho535K9ak7znFItFtYkSfpTmolpPq1/tKsHc7+vbK5xFg9qvjcxorxj53J4hpH2s+uFtj/l/yzAUlvBlw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hKsKlm8ZrfJCDLzfT+okk38zzXGICzmgHr7MmGmlNa5xlNzG8eMK/Nv6cmy5D+Z7DNxCYGtfFEpKrOs8K5eUgatIyhV3y0xJH/w4GraeWefC4NBOxqXQRs9hSHmF4Vj4+71VQ7k07lk6ifriUb9q2rfN7fpkLF7eN/apKxkl4sEVe7LcDLxcejb4urbs6eguBoOgV4kgoziIOPxGLJDBFmis7/xxn7fP7HuOp4xFRc1JgIqOB88T+hRHisaUJ527W+J1zVmoOT9Y9gZt3bjjGTW46XHhhyXh3/LH2KNmVKp/FCSUa8MP6w3mW01ftWMRyOCtKXVQ2kJ3bdFyAX+ncj59NGyzJPwUEX+Pf7nLxLz/ESiCXgxGV6LrzjDU3FA4UtlhZzi/vqt/3By7GmwlrPS7WdA4seasQs3PdMyvf6oKDsz53sImbnJXyXwmdivM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:52:33.7485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2032862c-f01e-4a9f-9cd4-08df3346dbd7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB985431

Hannes Laimer <h.laimer@proxmox.com> writes:

> On a device created with gbp, run the reserved bit probes before and
> after an unrelated changelink. Check that what the device accepts has
> not changed.
>
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>

Reviewed-by: Petr Machata <petrm@nvidia.com>

> +gbp_changelink_test()
> +{
> +	in_defer_scope \
> +	    gbp_changelink_test_do
> +}
> +

I'm not sure why all the tests in this suite are done with an extra
layer of in_defer_scope, one defer scope per test case is already
introduced by tests_run(). But keep the patch as is, this is not worth
respinning for.
