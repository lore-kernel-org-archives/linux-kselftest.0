Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991016;
	b=emlluA7KdRfKndPCTedlccC+BWpg6IutOrXT9PDFI0Fzg9wLoItKBZALgAheiC2M2aAd
	 /+KqfMpXsbelAm4khdNYzTKKzoiGzh/+mzWzVlpWstc3MoMcOjMGqQUaPp81DJU2WH9W5
	 Mclaxgi2oWyIMc/KWRNiVDLFV3F9G+8wjEHqruj1QQ1aC8hYgeoowhiW/O30UhYUjLfhq
	 JW8R8kNEtID5FWlS4Dd6dcoF189M+5jO6YdXgQURK57mgTfA/gSf2X0SZdZA5jCkYP0s6
	 snMQyZZI5jMniPbVHjICZZL7aM/M4Lc0sJEdO8gQk+cXvJ2BnGseCEnDZtRmY2TU0QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991016;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=w312t54yecQaGZMYzsgFxDj8XmU0WX+HNS4h5q6q0a4=;
	b=FwlL6r1WtrIhUn//q/a8aB8brit8H4/jHc3an7eHfAdoX4x/cG0yH5FdNXJi4TZSa9ZJ
	 +LgCtVeCEzqWMzJwstJ5+ohrwZAHZV6FeYl3EzkYfvfSgN2h3fLOQU0gvExdrY2G5soDi
	 WECwLuZUt0p+v/1jLplyYCkjp9R1BHdgVy6SB7UUekxSOJCqyZ20kSxRB1lS7G4TsGHga
	 eGgK7l+3nEw+0COAyoLSqLv7AbZfQbeuC60An56ypvKO9J7NZ3I9bNFxgX9uajUtcbJnu
	 Tup3lqBAMuBKEY59yLD34zZU+yV4C6+Y1POK7bBpEFs9GAHnZ1IDblMFh2BClDUR7mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PcKF7IFF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE3D606A333;
	Wed, 18 Nov 2026 08:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE3D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PcKF7IFF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pC/lvg0GCG9fx26UZI++u+PAsAW2jZ/yuFwf0v5evz2Knt2S3hxvHFpXmy/pWMZxCsCusSaAEp6yBwS2tICfB1ct7pUG6GPdkfPkr+e3zKwVFy8geoKyM+W3fBqvEwg8/6ZkQLFf3fN/mHtx0HBUwxizXHTh618lXwZWnn3vxv+i3ktPBaG0kffsrZ/jmCdVXlRABecJQP8lS2xKBbHmCUF5kT55gfj6bZuJHsLfD+Ghonp6GaGaphmipHsQu6kHwF1Bw/YaK9hZ1BAvHvR1Is+3xbQve3sxtsrjdBLAlG/AXuCBrX/nDHe8cAUEyxlfm8UcaTisoe3vNnFT18TMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w312t54yecQaGZMYzsgFxDj8XmU0WX+HNS4h5q6q0a4=;
 b=AkSvuu+2+7uaJAgUFRHh4/QiDubAGiVdE7hsIVXSfYcji2ITWEOsV7Pmh9ZoOV/IkAC+3IQ9xLoqmbqyPWNdmnfDaBAVvtwO/+8wRqBtuX1drtjaQrnvJ6P9VKQc6ySw1Udy98jY4Yzc6VhaXpERT5BOoPG1hqLStfHZ+mkmsZUL9m10zXV526m43f0NDJlz6X4yqZJm4YySSEw4wpjfnK/nXvDPEH9pvEjnB7pK7MH3WhOTndTVTSAgHZE2HdhPBuz5RHxDmMc6BaIRr8zAGeOvMDvGI8+0GWUTQlQEIjI5QpiVfLED4Yhni3DEtTdxwgwa/YWoI+/qmW8JYiCjdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w312t54yecQaGZMYzsgFxDj8XmU0WX+HNS4h5q6q0a4=;
 b=PcKF7IFFzodGrPML+VODzbFf5cYHYJ9AFi6yolg3Z9JKM6s4irEO+TyWEGrP7EF/XZRdg0BaUYMHKwN1GxzNWZV8pXuYYfn+V9dhDOWLpXrfM7uSpCeCzELR36qjFnbSryoKerYkUltAvVRJ9YsMQbqlRao21i4mPOSA6hreepbV/F9vXDoJhiI9K6xBFzQX6XlmXZOak6W8S7+Ka5iAdWmLUdM/b10Jljy8ht/7uWHU8e2DFk4DLmuGwpII2PR6K9MqxBuF7j9ebMWVL4Pg2r7wmHl6+f/24KjD8YCBMF6sLefTA7Jj+TOgTWykiJ/6ja3JXMt2w5XmpHNKWzKrzw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH8PR12MB999319.namprd12.prod.outlook.com (2603:10b6:510:40f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:36:18 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 08:36:18 +0000
From: Ido Schimmel <idosch@nvidia.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	jv@jvosburgh.net,
	andrew+netdev@lunn.ch,
	petrm@nvidia.com,
	sridhar.samudrala@intel.com,
	jiri@resnulli.us,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	razor@blackwall.org,
	Ido Schimmel <idosch@nvidia.com>
Subject: [PATCH net-next 1/6] net: Add Rx enabled state to LAG lower state information
Date: Wed, 18 Nov 2026 10:34:37 +0200
Message-ID: <20261118083442.1061289-2-idosch@nvidia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118083442.1061289-1-idosch@nvidia.com>
References: <20261118083442.1061289-1-idosch@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|PH8PR12MB999319:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c37efbf-776c-4753-2a90-08df454f03fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|22082099003|18002099003|261009223027099003|56012099006|261026140227099003|11063799006|261102123227099003|261028144727099003|261021123027099003|261026121527099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vUTtBoe2e1IPydcQIJbDArW81hBtRaTZKsMTHjQIAATOP3C97Nv/HxBukwyXJDT2rwjy+ytG2ccLkGbYoNux1kw+RUdUBC7PXzXwvm4cD8wFK5sR8yQFTOaGavwIHXJBvhYQkC4lZpxCrX5bomY7p26pYYCoHjK8Gq3vKWoURePVEytvouyIBqhpBa1ig1SvRSjVRN5RSlR35HB1jz6of3JXXBGWvh6f7oP8fx0aBcxsmGDPe+9Azw5BQ4o8frmRQEutX3xMTa2DVbCe4Pm+UjorRmfrdjEG8x0l2duuXrVCnofCDyShMx4jPC4YralqKv+cpU33Xs/PHaItlLcYRuUGWvtp4XV8I3kyTLMc3izz2CXvqparAOkDVDUu9JJAjGApTaVohvNTZo+sho62EGjl5pDD1RarluLwK6dikzvyD1FekJvfITuQJma9bEkk3aUPsw86T3oOwKLIkmh+olstnCWOir+8faaIgYmzVPG/0N0IprkEIWTkFEvw0nFuyz61YWBtqYFlsnMolQmw4nd2Z9sadOOIGz8f9j32ZKRCM+N605ifAy/2Swo+9e1Dh2eiQlzeeJei+QaGx7eZrmqYNsO7YxCb65D4U4+IOhzZkRoCk9HbzICG9QoSamhS0IoLTg3vKZB33VdJK7i3S1srqW5GSK+26tjJPgQyA0Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(261026140227099003)(11063799006)(261102123227099003)(261028144727099003)(261021123027099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QU6QYZVPjktnC9JMchceUmRqnJG/eFf00zBunNU3CZ78VjaUIk0wYIwi+D5c?=
 =?us-ascii?Q?x+d2CBK/VXuCNMfw5NE8gAs855dvJ7vYBd0Rwm6rInq0Kx9MaxE1W8Nh3D2M?=
 =?us-ascii?Q?U1aGDeET2727dAyt9Qnn07ZJBboWeN+5RlM6UofvajWDYF060amq6yHnQKSo?=
 =?us-ascii?Q?2eveMoXGghOezpTPrMkAV2NCSUgHd59iJ8Fmc2RVPcAOb+QPiPF9hg2Dw73b?=
 =?us-ascii?Q?4bkmIrUDNKB2YhyKbUe5nn6ih+YNPvOgY4LfrXmPhvgwdMrDFZ6cVwPNMkY2?=
 =?us-ascii?Q?ddLQT5+yxiddOkxpTWe5/dZLYNq9sFfdIZJ+U/SOrqgrT9EyZV/6gIrJpX9v?=
 =?us-ascii?Q?KdYCyI4kiWtTMa2xZ+wo1Ea0DzlJUiNknSs68Fsk+Ehs8TiiS21d23prP44w?=
 =?us-ascii?Q?WduehHZ3wPu+APOk9s0nMpwjOi6OkTq5j29mL+mkOmfJJ21yoxugRjPJm8VN?=
 =?us-ascii?Q?/B1G8xDmVhobRmChSbWHyj/OemPUdaFj67FPIwF9H1s+G8e78AIptF7iiBQm?=
 =?us-ascii?Q?0H/GDs9w/phEKJ0W9rR1poEMoCszm947FSVAcxTREBW074TmK4hWWR3lRrJ0?=
 =?us-ascii?Q?EHSbJVDSgbHEfD/8seeh16OtqKp5GKJdEDGvtXm7iI140JyQDBzoOgIsi1ll?=
 =?us-ascii?Q?+g1qlbuy4+qpSRjsC+ttSaRKgSyzwv8lmK4Hj/f5NYHcAvCKZmuGlNVyUIv1?=
 =?us-ascii?Q?0ejzxXPi2K1mj7LsrzsRB3VmkqO8TMavWNe8i/8e07xoRZfW2agvRhVkx0xO?=
 =?us-ascii?Q?PEzPcxayZXr3azxLiOCsWsVR4VvPEUDrFKPvr/2b63adIvs20/0UFmFYq61k?=
 =?us-ascii?Q?b0CRkzedrVvwObEYKcFDvCXl0eHBjgdngpl0P5cO/i6tJIT2ju0sYi0uu/GH?=
 =?us-ascii?Q?p43YDUC0BpSd85Ctt3+jAbxtQN2Ym3QxvWKbt6It3qE+m/qojt7026BqAjn9?=
 =?us-ascii?Q?iVEE99yCp/e0Zx2CvwdsYOXlvoMYOoYQNQDVuenaHeJO+taIB+N1fRvcPNpU?=
 =?us-ascii?Q?nhmp1DOB9qxDdQ2vSH1SkgcvlhWdli4LZPXl5cHEMQ6NQaR1xlISXZvmz2CM?=
 =?us-ascii?Q?W0FVNUg0NU6YrdDsFudSAGaBGkqwEsA2Scql6KPTY7HxcazyaaO3C7e4T5LW?=
 =?us-ascii?Q?fQyxvrtgHQ7HFIVyQ/Eqre2p4YHZ2Yb09jdpvBy8qsehqnYUXgD3vTioZiDQ?=
 =?us-ascii?Q?jJVcvy/3xBBvPvwWGM6ZxK+ZtLEYUp6Po2x3W5+MfKfLHVfjsnUZ+CNiRPqS?=
 =?us-ascii?Q?L0GGvmz+48iucmxVBZzZWLq0is+2uZz4zy1ADYkwku+njPrPk2I5vCP65A/8?=
 =?us-ascii?Q?8uBlTXtKB81MYUUAiU2J/Rah5gZTwLarc+WA3kMmVzqH7gEDiBvws2Cgi1O8?=
 =?us-ascii?Q?JhDCP9KYc6N/XPf9whcPS7F04VOIuzDtY/y3sJ+QGmYxOmDxOqmTcGkOV3yl?=
 =?us-ascii?Q?c9Y3j3o05VrNpjXw0d4g9DIvWJfnDq43bWMbR5ovxJZEukPnRMN/hOR2hc5I?=
 =?us-ascii?Q?iz+ihmUmizvQDZl6rWGGBdR+JCQo+4DgJDm1rzN37sK8mADwyp4hbT32euKH?=
 =?us-ascii?Q?DDcAWhTdhdWQOkU7RRzr4FG462ZHx3oyFW76fHFdzKjLHXLcXK+x1d2ICe23?=
 =?us-ascii?Q?WgPBZ4lBvkNZEIop/dBsgWn6FYkEy1/Np6Nb42NlQsn7HZJzFnwK+L4IlaYy?=
 =?us-ascii?Q?1brT2R7lnLsum/ZmrQVxo1CvmTHUWUzSy8XmV0Vl2n57Nfab?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c37efbf-776c-4753-2a90-08df454f03fb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:36:18.3044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZQoixYjiBbPg7/EuLw0PM8sDebgDWuLHi3VvyKhxMjk5CXMUxYHsexXZSPSfe/pDsQpOzFuhNyBGK93f25TVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999319

The LAG lower state information that is passed to drivers via the
NETDEV_CHANGELOWERSTATE notifier only indicates whether the lower device
is enabled for transmission ('tx_enabled'). Drivers such as mlxsw use
it to enable or disable both collection and distribution on the port.

This is not enough for an 802.3ad bond with coupled control disabled,
where a port can be enabled for collection, but not for distribution.

Add an 'rx_enabled' field that indicates whether the lower device is
enabled for reception. For now, set it to the value of 'tx_enabled' in
all the LAG drivers. A subsequent patch will set it differently in the
bond driver.

Reviewed-by: Petr Machata <petrm@nvidia.com>
Signed-off-by: Ido Schimmel <idosch@nvidia.com>
---
 drivers/net/bonding/bond_main.c | 1 +
 drivers/net/net_failover.c      | 1 +
 drivers/net/team/team_core.c    | 1 +
 include/linux/netdevice.h       | 3 ++-
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 167503d1fd15..7eb3ff82ec96 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1831,6 +1831,7 @@ void bond_lower_state_changed(struct slave *slave)
 	info.link_up = slave->link == BOND_LINK_UP ||
 		       slave->link == BOND_LINK_FAIL;
 	info.tx_enabled = bond_is_active_slave(slave);
+	info.rx_enabled = info.tx_enabled;
 	netdev_lower_state_changed(slave->dev, &info);
 }
 
diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
index 1b5213e87070..c4d39f8b8802 100644
--- a/drivers/net/net_failover.c
+++ b/drivers/net/net_failover.c
@@ -451,6 +451,7 @@ static void net_failover_lower_state_changed(struct net_device *slave_dev,
 		else
 			info.tx_enabled = true;
 	}
+	info.rx_enabled = info.tx_enabled;
 
 	netdev_lower_state_changed(slave_dev, &info);
 }
diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index cfb833c307c1..def94cbc8384 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -88,6 +88,7 @@ static void team_lower_state_changed(struct team_port *port)
 
 	info.link_up = port->linkup;
 	info.tx_enabled = team_port_tx_enabled(port);
+	info.rx_enabled = info.tx_enabled;
 	netdev_lower_state_changed(port->dev, &info);
 }
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0325c6f2a7d1..694b6d29f680 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3239,7 +3239,8 @@ struct netdev_lag_upper_info {
 
 struct netdev_lag_lower_state_info {
 	u8 link_up : 1,
-	   tx_enabled : 1;
+	   tx_enabled : 1,
+	   rx_enabled : 1;
 };
 
 #include <linux/notifier.h>
-- 
2.56.0

