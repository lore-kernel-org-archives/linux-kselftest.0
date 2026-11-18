Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991019;
	b=IQ0kaC93LtmNMGmEEWyKFeZpS4DghaSzGqy2qYpKJGlj9VB+jbIrpSiFrk6fan6crebV
	 Y0LkIwd5YnJ+HKX1LiuU99Wv/tredregVeKJb/9ehaqg7k5Hz01fhKCgyXGgh0LRsrs1S
	 yXSK9MHRMK9oGmny/nG4Rrw0v/FEH9GGqqQeAeus1i+FXmjZ9ANBa+YgXQIzlXJB/6CfH
	 bdnOP8F7Moxhlcmr2rj0QWoFq6dDPHSLDzzzanhKMddaY9nJ+11/E2e7AEz+FOLupl7uF
	 0kYH0Y2BcO/Oy6ZnomhE9uN20i5wAKcQv/Ts6feCqbWdgDICr4I2a9LAavXMZ5ZiIKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991019;
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
	bh=qt8SeVrreTaROeC+mujbmLqf+KomtpWDuLLXXmbL9Bo=;
	b=FXbkIcWBFmVhWQUY3fyXoR/rXZRXKlxoAYgm77RQQTWSg4ABWvwvw3IAcXeHFsvxZgNg
	 cmvErZlWaPGeBNlDE6UsTk9rc1RiR/DwIALv3D66WESsi3JOnB7dPLv5r1NHLJr6+y0di
	 cNEthUNg2CsW/xBk6oTw56K3hXJ8he41Gy9anevN3ceqO3x6MdLuBwYuZ7/476aVCQPGb
	 VwGnKnqN+uUPZE/SR45zKLMNsDc63UK8TlD6IU29jDzqSBIXM4B60FGbvQ9vxzsC35j4L
	 3q3/mN8PUO9WpJSHh0Jso7BVQd8Cd9l2+CIAcsgYj2eELgl35S9wPcPdvD0v+SOO52w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pIatkFI2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F119606A8A9;
	Wed, 18 Nov 2026 08:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F119606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pIatkFI2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrmideYSmcO6TbHphGhRWZdSUiWen02Zigb3Eo9cRtqeWmQmWTdfadC37pgbvqYI7r/8LoyvivaWBgu271M7zFEtHcgPoFY2R6xEBoIG2hCi6JPulAq1oxWiYGjAB5d5mH6XdX64ROtjYAuY+/qtCfv/cwxfpzhXS4gUa4CI5fQbgrBXMb8bq+pU9Zplefdx56bIhb9yi5CZX4xNF0nJBJh4cqShTTKj1je4+g7cjf6eoHqlsr9wKWWvgfivGQ/hVDllbHyAPCTzKtFdFrktmDlzO9sqvX4WaTEVh/DC72OyJy/5QLUM8AjGfJ67rInhc6LK2WuoQa20EIWvfGCb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt8SeVrreTaROeC+mujbmLqf+KomtpWDuLLXXmbL9Bo=;
 b=AscyLm4Yy7RTHXEIf85atbmoqtfOpIequphIitQWqpe77MYayog/FzFJ/KnGVedYLYxOuyIBNLYzPfGLshp1DkOyzca8WaDKBsL3jdIoVDvrI7rudhCAuEq6/CRGrlAi7ckl0kDwbGmRhYS75hGp8uR9g+Gut0myzeV887qQCkByLdU/TcVZZQTuc4AKDNQC2o6lq9bFuLiipGiK7i3OTfgFBX+MEexEXJQRahCiBWm/MZYYEMUL4nuoTRDljmhtFyPehEGFWWKs23ZfIqU77RAjsKbFn5zVCv7h+rM1rYHY5LZDkbhlWlr5OLeSJuWFluh5zKp6+Ric6JJ7aU7d8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt8SeVrreTaROeC+mujbmLqf+KomtpWDuLLXXmbL9Bo=;
 b=pIatkFI2izUSmL4TjU7gDh3qvb3FuCnflZCvPnC70pKSUQobZhznLzwgzJF6F3zMscsY8AhLe87CQvG+P8Fe55SIb5CaGJCXXo/ob4/EdyYVTAL9VlIZqckQpN3nhMvMaQeN6Ia3S+54Y5L/Yp3JbX0G+syWy3ZVszICgcalOKppeGI6+zML1Ib/xwF1YBkRFgSzg+LTjESQvMWLuRja9vdwMS709u9etAVJbmEHLhifvhsVqNkm7bIb/rq1lVlDUomXYcTx0M3lr5gr777/z8ta0UfRX6Tk/1p7FoMvCWe7mBZ0hPMgY7G6eQhxAHyTFi17zsqhTzxPWX/WJ1JnqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH8PR12MB999319.namprd12.prod.outlook.com (2603:10b6:510:40f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:36:54 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 08:36:54 +0000
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
Subject: [PATCH net-next 5/6] bonding: 3ad: Advertise Collecting only after collection is enabled
Date: Wed, 18 Nov 2026 10:34:41 +0200
Message-ID: <20261118083442.1061289-6-idosch@nvidia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118083442.1061289-1-idosch@nvidia.com>
References: <20261118083442.1061289-1-idosch@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
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
X-MS-Office365-Filtering-Correlation-Id: 48eec480-549e-4c57-8ffb-08df454f1974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261022075727099003|261021123027099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DLi7X07XWvvUYmQo3uzAmxTQEYXy2UOlRadV5RVt8Amv7GAKsaCaYfW6c3RAqcuPyTiyiVCeU6hZKnFYW18h9ShNfBJEZR1QM9hwcxRX0/HfsRKxhdQEkkJ4IxK3PjkuYIFYUJ5EIs6RxdwL2MQiKDKTWZnG8ob3wS4HR26NP6JJ+KxULIqDfZqL+qdfd9Z/ExmIdRmmRrgTfVY8wllos17Sk4R4Qyo4WL21XdNlNdO4Wup1OrpCn/+COEnDnAshltvtjWEhviJQHbDERB53nJbdipFOVWm2B7TtST8Rr0wQD/AWnNt0FhoceNtLEu7iK08Lwsd/BwNOfjEP47QIxh5FVVcsCx/kFJD3sq2hJd0mt58OjxRs1izf1Q50E36qkQwLVbg+0bEP3G+3GjqkX9ugQZKnhcpfjiyOjAOSyftmImOUdtpOScbK1ZAIdainmPCuztMbaNPcVBtOdOIyr9IEwo8yuZXkaJcXVrX7gqBn/um3OqVzlDQt2L879EaqmRQwcQtU/JIVtZbSe759lgGZww5iyDxzQ5QYplcyPqpsAtXFMkQot//bC7onEx5dHVSj/nOx+myWfbZ1QuawSPt1Oa8bOl//1t0rSjmDfwE/uD7unxI5CS3I3svFX4ERg/YlisvGqQsZ2MCAl9nCMlVchnjK9XDiFP/Onss7u10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261022075727099003)(261021123027099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DfLnLUBgaKwZ1m6lpjkRbCAYeBsxELv9rnt7wvgxy0glqHP5ITKlHc/7D0ph?=
 =?us-ascii?Q?VDxfFTA1ZF9uNh8es6d4vVcjDsbJOzSooJs0T6R4vAM6aZ8CVkzj0Yju70wc?=
 =?us-ascii?Q?f9DPB3ibJBNGOjCSG1VveudyQolfVqOOurbtYGg69sI1Eu9lrYJRXr1+qEki?=
 =?us-ascii?Q?Rwf4j7SS6QeufnUsupB4qISs5TAVz3TzX5N9ii80dKQ+k8n+59CYX3jSzdwp?=
 =?us-ascii?Q?UXBsn6owemWdFf6auiaK/VCfsVMhg4+KjDsAsjluYF6BBYKJFt/TVgt9osYF?=
 =?us-ascii?Q?wGCTXjH9WlVMepeqkeqJrSS3r07CenIhUz7jdyhXNzSU7kmUDhMs9y5N/UvX?=
 =?us-ascii?Q?eGpGz003EBPqprgwWFyHoL6vkF0t47+atkJ6TSWANDKjNmbFnla0t7XGydnf?=
 =?us-ascii?Q?h4I3PEtChnGF25rVDrPY9xT7U901Ar1kplKADN3Qa3dJTSQYZb1c+yIs3xbE?=
 =?us-ascii?Q?8a1AJsCGtVcIDUmswhqjT3kiOFo7O32CaH5N+6l7FsOBRcR5otdYc3eimjx7?=
 =?us-ascii?Q?ecKqLd2bEAWVC0USs59qZ1ySK6t8YZ5VsdNRo77muXzE7AlHOpcNn19nbTjd?=
 =?us-ascii?Q?TjmPO9lb1Wd16WhO/ofN97gNwaR7FwNiC8fRE57QnuCIgo89nGOFrRnJNiOR?=
 =?us-ascii?Q?aDoVZlYy1gAIP1cGC4XeIvddqeNChn0enQ2Yjd6tWTM/XoS3oniKyp9s+xPO?=
 =?us-ascii?Q?smlMB7EXa2/2b4PkNpAVnV45zx/FMIPaJvziQgQBsev4DAGZ8c3Q4BHTmqTV?=
 =?us-ascii?Q?gTo4tKA3bKvJjUQ9UeLEMm5bAfrBaur3kMg1o1jUiws256tQGPpgQNGQPGq8?=
 =?us-ascii?Q?X3PPtLSQTFwWfnNI2jPL7A/meiGqIf+TyUeT33D68GQCvUxJqtATlCOEqaLv?=
 =?us-ascii?Q?5cNp0jZ/cjUJ0GdsZorANd4/AvOkXgPHr22E7BzH87ehsjrB770CWJIp2TNJ?=
 =?us-ascii?Q?f+kFfW/s6BVexyTNr5bAsxz5dPzSbD4p0eKQk6IHd9j5hp6n+W70mmLFzyxf?=
 =?us-ascii?Q?ZmrZEuvp0jOqepXGpJR+4FhUBOxipnpduTTLFs7fl8PSv4L3kOp9dTpsu9An?=
 =?us-ascii?Q?ttq2MsJBDXWv26L4YPoKVdE2DRzTyjdIaDWISBv7DKwTExDiNrXR9WyRYX1J?=
 =?us-ascii?Q?tPFdMj9mZ7s30qkA67YvayO1mE4M7GHbpCAqWsyRkE51zsKLXddMMpiRlHSr?=
 =?us-ascii?Q?d1VWqotBHP5lS0j1e55rJhUbQ+9ejcpnE8nLzbeszWT98GEV6s4dnXKdNgIr?=
 =?us-ascii?Q?RXjHu/eIdmPEJcSfXGKLET6S+mRLdpNqffrZUu4Qhl8hc88UgAZSaLldl5JM?=
 =?us-ascii?Q?IWiKzEByDKk00DfXCMO46UIheSNNALm8Sj9CEFqR3bLMtDQu0sjK2ArH91RP?=
 =?us-ascii?Q?o4igUTf8wznkRImcwEeOlavxZBpelvL44OANkL7XWHud4YOalwomLnb+IhLr?=
 =?us-ascii?Q?f9NgRb6ixgKUM4Bl7m5NIk4ks87XMW4netmc6qz1+bGLCUtwlw5u8m0rEVxe?=
 =?us-ascii?Q?N5Bu9kH4tbr3jHjSrbV8elkj6sxf7E3UCU89Ep1Qpb8EmGsX0DbZHQ0kOTQc?=
 =?us-ascii?Q?b57wdGRr9z1DBtH7rcOdtK5LuxuIwJVNhHIFbGFRxRo/m26ErUVwO5hc+Rfk?=
 =?us-ascii?Q?HRHPFfps9ro9rgKajHlTcp3FzUd8Q0WE+mdsGt5V0vIr/aaVraeiU57eqJ1X?=
 =?us-ascii?Q?Ha5SFoKZ4rGcBFUXA3nSbYf/5hdNtxbSpcMN5T1uqT7qnpZB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48eec480-549e-4c57-8ffb-08df454f1974
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:36:54.3155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9cRJFTBTjV2iIB6QwyLhsmtkrfvQxf+TAAK3E4Ur0cjBO49cquhehIklS6w69JJVWxBtR7qBdAlBst+ORoYnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999319

When coupled control is disabled, a port that enters COLLECTING state
advertises the Collecting bit in the LACPDU that is transmitted in the
same state machine run. However, drivers that offload LAG only enable
collection on the port when they are notified about its Rx state change,
which happens at the end of the run or later if RTNL could not be
acquired. The partner can therefore start distributing packets to the
port before collection is enabled in hardware, resulting in packet loss.

This contradicts IEEE 802.1AX-2020 6.4.13: "In the COLLECTING state,
collection of frames from the Aggregation Port is enabled, then
Actor_Oper_Port_State.Collecting is set to TRUE".

Solve this by masking the Collecting bit in transmitted LACPDUs as long
as the notification is pending and by transmitting a new LACPDU once it
was delivered.

Reviewed-by: Petr Machata <petrm@nvidia.com>
Signed-off-by: Ido Schimmel <idosch@nvidia.com>
---
 drivers/net/bonding/bond_3ad.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/bonding/bond_3ad.c b/drivers/net/bonding/bond_3ad.c
index d2a55f4d8979..61f6de803b66 100644
--- a/drivers/net/bonding/bond_3ad.c
+++ b/drivers/net/bonding/bond_3ad.c
@@ -250,6 +250,19 @@ static int __port_is_collecting_distributing(struct port *port)
 	return bond_is_active_slave(port->slave);
 }
 
+/**
+ * __port_rx_notify_pending - check if the port's Rx state change was not
+ * notified yet when coupled control is disabled
+ * @port: the port we're looking at
+ *
+ * Return: true if the notification is pending, false otherwise.
+ */
+static bool __port_rx_notify_pending(struct port *port)
+{
+	return !port->slave->bond->params.coupled_control &&
+	       port->slave->should_notify_rx;
+}
+
 /**
  * __get_agg_selection_mode - get the aggregator selection mode
  * @port: the port we're looking at
@@ -903,6 +916,9 @@ static inline void __update_lacpdu_from_port(struct port *port)
 	lacpdu->actor_port_priority = htons(port->actor_port_priority);
 	lacpdu->actor_port = htons(port->actor_port_number);
 	lacpdu->actor_state = port->actor_oper_port_state;
+	/* Collection is only enabled once the Rx state change is notified */
+	if (__port_rx_notify_pending(port))
+		lacpdu->actor_state &= ~LACP_STATE_COLLECTING;
 	slave_dbg(port->slave->bond->dev, port->slave->dev,
 		  "update lacpdu: actor port state %x\n",
 		  port->actor_oper_port_state);
@@ -1440,6 +1456,12 @@ static void ad_churn_machine(struct port *port)
  */
 static void ad_tx_machine(struct port *port)
 {
+	/* Advertise Collecting if it was masked in the last LACPDU */
+	if ((port->actor_oper_port_state & LACP_STATE_COLLECTING) &&
+	    !(port->lacpdu.actor_state & LACP_STATE_COLLECTING) &&
+	    !__port_rx_notify_pending(port))
+		port->ntt = true;
+
 	/* check if tx timer expired, to verify that we do not send more than
 	 * 3 packets per second
 	 */
-- 
2.56.0

