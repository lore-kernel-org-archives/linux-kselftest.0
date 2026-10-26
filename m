Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008369;
	b=q43o/KhGBp6l7CS/AKZJymW2HWxWOHdgF9s1Vmk63Q4gAA78YOye1bs+rMBHet97W3YN
	 AwOK8CXpX9c/Zxzg+LdUXheWF16OU93aU83XOq5ECD9+PuDkp/jwqED8f4Er1t3Icynfo
	 1Ot9HE3qtThuzIzDc2D7PPx8zk3Z5iN0WAKC/JQBGaLXfe+iWlNsX4L8/jAr8kh+r7Kfn
	 /oPx5QfEryWVke2Dn+mNWRqfsE7KnrcnRO1uA9tTVf1t6gpOX/Vw+j7fELrlZNI6tVqjE
	 Myb6sSRmCnyK5mJTFWF5/foHKl04dfiXYRuHG77Wzw00++Ymv6KqNHaCoKmPpMiy3uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008369;
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
	bh=CbYjINiRKEw3VMW1VIPMkLy6YJIj/iLoavol6eGwWh4=;
	b=MUXdI4P59JKruGz4qlH4mNhko1dwm3TkLm1B9Q10DE0rB5nBzy7imRAB42VkEGzsAmGA
	 Jn2ZwjSHGl46JbOiOoccYenD1I5ywhuZ2jVYT5svdpdcyBgYBMKudM5pBROu6C2squrFb
	 B2hrFjINoJzxzjoeDbb00ZYpDEDSSfo00Z/ZI3VwjlQrdB1TCy+7ZDoRzgxm/NYgh8skY
	 8lTmkTxQE46yjXo/Kw6stJOzxBgiGe9L7HxKygd4MQ/FFMQiikdN5MoXOMDlWLhHcL3os
	 w0zI64soNR2ZI/EMDUFQ5VfVzCFx6BdEj2oDLgpfwpKXO+oy36owJHmDTaeW8y+WsvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CqMpjfeX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.1
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D2606A324;
	Mon, 26 Oct 2026 09:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30D2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CqMpjfeX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdYd0Y/YU0SmaVTa7g/JGW592Eh14qhq5jHFMLM0gf6PxsH8mVadIwnE5rfND9GOV4HtANWTTS4zpzNsbVkQNCRlk1rWyOfn7d9weDdmbFQuqYVFje5GTnBdmzknRE78Qf/sXvtHMlgTMXfXdFQTJDt+5s8yAenZkf2Ab5701+W1JXT4iKJOpNsve6PofPC+xqPDLkmFJ5Ea/rdZwxd2/VPgc9BN7nH6Qksqq5jyqL8gVzJg3BFsHgkTGdQryot5dnKL3TjdbRD514duAUm7NmjK8jIPgOgkos6EdqMfc0JTTNaJVwYB2AAoq6tBoBHs4Dnvgif2rQqZKC6fH08Q5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbYjINiRKEw3VMW1VIPMkLy6YJIj/iLoavol6eGwWh4=;
 b=Kn+gZYlC0CJnhstqRVhKuPFx+CJ0Me0Bj+1yjjryNsw6SbybXJBM83hH8ufsdHrcAn5FkXMWD6W1WD+cLLZcVcyZbyzGHENQWRJAOL3mLVRUfRcjxGs+vGN9j9+AHH/QAJPijaUFLdMa91RO9zLcW4p/qOgjLkHCxCul+VEtByaexAcoMdzb5kOsr4LLD930ygYAxMFMoQ5KAMcOOoTsKiHbvLRNK/j5li+S2z/rpP2f1W3TmWbSoiznhfcm4+94KVwWwXIPaBomN7gWC6FPIkbPYAx/O7D8wsFvEmHXUAB0Ngnkb7kc8Iklm/o6SjwGS5I7lt+SjEz+hU3JcatQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbYjINiRKEw3VMW1VIPMkLy6YJIj/iLoavol6eGwWh4=;
 b=CqMpjfeXp6KMQcLC350T2dsbljLIgooKbSmdrJSgga0Ynlfxp3uLiRbLN6i42HdtilszSHhQ00/KZ5g+1fUcbIEJ/32dX/ap7nMyRHL8hc547+aF/oPQD60Nrf0HsOIrC3e98qWIYw/pFghiR6c0D2Abe3ubKVopn9zsAA3AMSXXYOsz19QoA7vhbMxHxxGnpHx1sqkUxOr4yaaTiAlCHSfTePfEgBBmqE1+lf3S0IDDbxntQsa+qIB7jxNsf3Kry89vweLCvuWPe+JNCyfy8mOD4rSBGuJQiV8PNdlVXp6rICfRRsh7LNcKyToxGzwgkIQFkwylwG0tZTNRvdGUZw==
Received: from SJ0PR03CA0155.namprd03.prod.outlook.com (2603:10b6:a03:338::10)
 by CY5PR12MB6300.namprd12.prod.outlook.com (2603:10b6:930:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:52:45 +0000
Received: from CO1PEPF0001885D.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::ae) by SJ0PR03CA0155.outlook.office365.com
 (2603:10b6:a03:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 26
 Oct 2026 09:52:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF0001885D.mail.protection.outlook.com (10.167.249.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 09:52:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 26 Oct
 2026 02:52:28 -0700
Received: from tuxedo (10.126.231.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 26 Oct
 2026 02:52:22 -0700
From: Petr Machata <petrm@nvidia.com>
To: Hannes Laimer <h.laimer@proxmox.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Nikolay Aleksandrov
	<razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, Petr Machata
	<petrm@nvidia.com>, David Ahern <dsahern@kernel.org>, Simon Horman
	<horms@kernel.org>, Shuah Khan <shuah@kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net 1/2] vxlan: keep reserved_bits across changelink
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-1-f0d13951c09b@proxmox.com>
	(Hannes Laimer's message of "Fri, 23 Oct 2026 13:14:27 +0200")
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
	<20261023-b4-vxlan-changelink-gbp-v1-1-f0d13951c09b@proxmox.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 26 Oct 2026 10:52:19 +0100
Message-ID: <8733ts6b70.fsf@pmachata.org>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885D:EE_|CY5PR12MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 2447ad7a-de3d-44de-19cc-08df3346e28f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|23010399003|36860700016|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qFvkCJJD1xY9zRChRBhZ6tunOEeREo1CQuXsQ3TlQ8aJy5AIQkPEwuAUYGKzooh1/ZiIorOHYcisnLC73AtDIr39MMusRZLw0MFWXjLIM1UBJvG5IVj5N6V19O5ese36pExlyyGcRqSEHJtkvQ+buEZkGB7yso0FqZ0QhWVwULTtdMf+5a4Qgsx/TZD/YbyfRONkbX+R1WnS6ugMCynJq6TT4pX2Wrfl+3sr1QHz7NbvQ9uCzravwhB1hi/r/EQTLfgvKe90rdV3Nsz5A5TEm0FDvLEFj6FcrxLrwANQrYSFaJh3D3yOdGIbryvOmJ0zwVVDCrx9xmPgG0SlkYNFapKEGqRDmqyYCLVNrhB8KtPs/jvT6MBr36t2nB1d6Ol21FSgTL6CITvuJdG1mU5RXwMYbLBXYqgqRFF04aAHHq7jzc/OltP0ue2kS410PUQcqo0omeIPCMABKMUANkHnkXPaQQKkCB6v2iF4CN9SiC/DqLOjnghTwRkzP0QJXq1k7UoDJYof7/nFxevJM4kQlXe8ZcMeVXEtKc1KvOra71RDfvGVmLlitBKO5SizniokzGvmLfWqqyaLdGjjinronHjgXfOlYIS1Ov4gn2zp3OB1P6wPwiFXgoDIHPMA+FcIzJfZI6FYVx+25LEI70AyEvfwBlwWnCDpKhOPRcNnlTUdVWdufaAmo1WVlp1joOFgKPcwKBqQFEtId+fRIKHl3A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(23010399003)(36860700016)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WWl/Cah+QB9ot3XHSIq2A+LROoA0zLyAs9nLv+Jxz60hd8neR5mDx6GbZRazHJWV8Xu7WZEkyfa4nn8K8klMMTW6C/3c5DBHbeJOSj3DjkGB2oX8UN0sqpAxhRcNd7u9JiwOgUu0BmcXqKIUbaxIym5F0cIeOMQk2hrruYjNegGPKEHPRD/C4mk/QW+8Ht7YinDtGU4e0Rp2Nv/b41rfQ8Gi76oHVq4Qsz+6S+0WOit8/SujruwP1ThkNSqRz1T5peKk22Tn/CKEOPlgs6HhBSMDrqC6H3iTO2j17gP7yv9nRb2h4M9kWtK4oCobI3xORlT3EcucofxDLaZK2TcUGpFDRNGlKY02WjpFycadgdPSBHaIhB9x90wOWmIDD9h8hz6VMjmmHOSLDbtmMwIvoj3kbrsoQS9Gh5ehqt8SWId8tAYoidP6QxdqJ/dTmZVr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:52:45.0683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2447ad7a-de3d-44de-19cc-08df3346e28f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6300

Hannes Laimer <h.laimer@proxmox.com> writes:

> vxlan_nl2conf() derives reserved_bits from the extension attributes
> set in the netlink message if IFLA_VXLAN_RESERVED_BITS is absent. A
> changelink having it set is rejected, so this means that every
> changelink will reset all extension bits and reserve them again.
> vxlan_nl2flag() rejects setting a flag on an attribute that is
> create-only on changelink. So also setting an extension attribute will
> fail before it can un-reserve its fields.

> Keeping the reserved_bits on changelink is safe because anything a
> changelink accepts leaves the header bits enabled extensions use
> unchanged.

> Fixes: e4f8647767cf ("vxlan: Track reserved bits explicitly as part of the configuration")
> Link: https://lore.proxmox.com/pve-devel/20260828134708.692354-1-h.laimer@proxmox.com/
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>

Reviewed-by: Petr Machata <petrm@nvidia.com>
