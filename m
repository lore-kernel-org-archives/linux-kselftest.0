Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991016;
	b=HeMKoHcZrnDr0OPYSRxKDr9wgsATDECG6x5Rmisxhv7QyYWEiHUSNhXqXLImg2SIIlqP
	 ACkha804zi87WCeGzIw2O8UwrROgqdhoa2XjQ5lzbvL1rFxs9IA+EDezkQoCBTGQyBKbh
	 pPACXtDVV00lF7R8dbrRK9bLVDrLnD2ZvcPj6Q9WfgVTFBI8mzsVfXAZ30SDeRehuqD+0
	 W2+uUg1YJ2wuZx8jzV33PxXViVM+yFlPc1tHRS/xwA+FJNTZIUktpZA2hcfGq1XYMKVmT
	 iBFaNLGWMfh/RLntG84tCP//Nzlw9WjG5TY8lnrsGFngF3R7i0fcv2y+6monfZTyR5w==
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
	bh=BplrpvugKdAdFSQVGm/HpakqVQssmlNKy7ntzEaVEWM=;
	b=ThvkQZxOZ2nMU2YQ+8qpKLP76JGn0Kgxq4p+LYYtZzWCQ6xt6aZmQFxhJc2BWQOe/174
	 MSKDF/JGHUKy4Awl/XBINPyI6GPYda3l6cBwPYFzCbrHKiXdJMVctW4PepxDjmxyPqDBZ
	 ayekZ4V3yYhrQPY5/6/PGY3KEEOpWGvMBO4dqeRceSg19x8iAxgh2e75RJzlwaxNSfeXn
	 QSzVkXgvYuoJrW+yvfNFO++04SDPUQqCKVM4+RxmYnSGH6D+fndfAKaCrjozoaim8gq9s
	 QR5IrJuUpheOpJLA1RXjzFJizpB7+52zfh8nItatXJaN8xPGJwf6VJiAeKT2FNk8rkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c2fy5d8J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CAF606A33B;
	Wed, 18 Nov 2026 08:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CAF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c2fy5d8J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExZ1hTJ9vEyTx6kpvH+VPuopPqySIIBe5vAWzSs3NdJNLSYxyR0eBokX8M/QMgK4WRu6YJ6zYvCKbgN1nLSg13H/24hQsxThJbI2owu0f8uetq9iv8631dr6cP9XeuXd0Wh9kdQhloAGAzfOtSMN/xU7erOI4kdBCT5tG79F0RxADqhe/HZJJh5d2/rHwl4qQG0WkK8S3ABZe2dM00r8f7LH3Jud3c34Mhl2PDabbmrg3lShczJJysDG3LpoMGAZ+4BJ9ckG9nTnmU5v65nr26EGKEkKI4PHsjyd8QZgLlJ2Z6prRmDewz3ekhCJUyrEMOE348INscPqWEScRoRpyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BplrpvugKdAdFSQVGm/HpakqVQssmlNKy7ntzEaVEWM=;
 b=WNo/Di+ak3GUdxx+9HlBi+Soc3qFt4bqewOl4hf+T/gtmuTCQsx4x8qFD1QS0erG8AgKVGD/QzdzHaNRI1RdR+vpicBz3aEeGr78PewCYoOBq60RDBzKNGug9wMgoyXW5Zm9BNM570u1YRfWPJdiT1HeyqtCSoZtFzEb/C9559sdrHiG4BSj+2z+MVTXoxRNl9EQZAy0O6DG0m8VK+OlLihs47LEbBHb6ErUQUMjhj1qY4dGZIgaStKLJzFvi5ojHPgiualeXMpHFtFs2FufJCrXroGOCtr2ZDxh+tQcRoyrIL8huIO9RZG2gmxHhmyssHF4bmI8nMq2ea8XKp1VqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BplrpvugKdAdFSQVGm/HpakqVQssmlNKy7ntzEaVEWM=;
 b=c2fy5d8JNo2mU6UlufdtfBJBSXfOsy9Y7JInpGji+tQb7SwHYqofH8TE6j6JgLog775mY9tSvCrVHcUhsCPxQZ8tihl51iOhHMnHRThbflOChm3FQAwWE3rHaxRJ4Ky45Eujv73OxMIvVTbq01/fGrYhDUKaesl0ld8rm6jkrRAIzNXwQAZqRtronpzCt6vygZDwf6W4tt8yI5k0ttz3K9vy2h8gl3za0X9HU4ydhTWQ+AlM/+eh40sU9BSoh+CqF/PUk8aX1qcZFrLDz5rmVCg9GMWeVh1CjP7LfiEREIXQHqi3jrxJuvF1P0m1+yX5fPInEezBl7JyDDF01lSOcg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH8PR12MB999319.namprd12.prod.outlook.com (2603:10b6:510:40f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:36:27 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 08:36:27 +0000
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
Subject: [PATCH net-next 2/6] bonding: 3ad: Notify Rx state changes
Date: Wed, 18 Nov 2026 10:34:38 +0200
Message-ID: <20261118083442.1061289-3-idosch@nvidia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118083442.1061289-1-idosch@nvidia.com>
References: <20261118083442.1061289-1-idosch@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::9)
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
X-MS-Office365-Filtering-Correlation-Id: 33bde3df-e254-4c4d-6cc4-08df454f0925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|22082099003|18002099003|261009223027099003|56012099006|261026140227099003|11063799006|261102123227099003|261028144727099003|261022075727099003|261021123027099003|261026121527099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xO/6UmOkN5R0h8CKPo70PUdnhm0RBnvR2JqCeEOLXopxE/KgK9QKN89jnn4w6F6tqBaoUAPvZ6QqamY+q7Hk1W8qvihHVIwuiR2McZ+GcUmbEvOW9CyRFMaEEt1ce1CkCbGW+e3YLUvc9P3z172EBMQN09l6CSwk5+kBojUaszCjVeUQRU1yrJkSnGOXYHCq9KBm9/oDUe8ZN1jX24jqqlOeB3FzxWWANGhQluMmz3XeBYddDPKfPgiBA4tH6Xs+5JbNTKOVMm1/JOmeUlm/FH+ejH8w2XrwEYR1mzus5eiBGphL1Tor/qEGmKp9/vZAvmWHtBC5dkeKtZtw+OkMm2ETQXAr6bWjNnfj6oqJmktC/O80W3uZGcfnMCBIpG7J1O9GFF3lJivSnSYBd9zduV60U77kGta1sWhSV9uKgHyARJ9kK5EMfQoBJx1M/89+4dxTaw5Q7Y2VExONwQIgylv89to1h9Dd75hbLgI6WTwm5R17ubSQs/W7gFFWQFxZOC1VczfcdM0mO1+mZ4F5nz9UuyDxW1GkVlTWlSGhLuPVozfluJSlGc+pRqwHwH8oAMnRFyFoDSJO+tV8i7SIqL3efFk5QMGdOfxv/bXNWK5v6K8/VMw18jhCeL16OtcO1OSPwnOvUc9yYiPV0y1/Y+2AzVCfFtIa5swpQqAPplQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(261026140227099003)(11063799006)(261102123227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LwjtVydbVGIkjJxT2lAtB42MJ0jCXRfuKx8z/jf/y9DgzaPqgJqktjiqDHLG?=
 =?us-ascii?Q?kyn/C5fowpSYbRHBeVs5+TEr420ONHHPdlwqGqxDPwJwKz94XEmIvGQbBztN?=
 =?us-ascii?Q?mU7R2v2RV3IPEvrF8XzlWe/2m3SO+NoFm3A6lFP6ZihqKzCFUpmst1HNO4Fs?=
 =?us-ascii?Q?aDxPwPLriQA63lkiLutT2pNr6a/u0sHekCpiUek0rK/Pgk/zwA3ANyU+gJhN?=
 =?us-ascii?Q?tCl1a5DGGzzqy7ijJeg/8yaKwIZAzbQtd4RZdaZTiwqWUZUVbnEcpIk3KhLI?=
 =?us-ascii?Q?+mlP02J0TRfIk5NsA+0MiMA7cL+rtJjjoFPyj0usZJwx6kEAZVF0Gd9D+Qdb?=
 =?us-ascii?Q?e6Q5S5co9R1V8wcpyHwCKngeXES/vR30XZA0Dz6voHWvGrxdfJsexXGnsBa1?=
 =?us-ascii?Q?qVEoqmePq+HZXaxnudR/ILtMFq7uh4HbwIek0PHXVNKMq1RL5/DquEKx84Ea?=
 =?us-ascii?Q?N6v3BJrfyqSZ70oZ9gQlWO2tUtJ/Zw4/C2E/V/vUh2aHI1idqG2PL07xYnSM?=
 =?us-ascii?Q?5n44G+vwYqzkgFFKMg6jMiGmpez+/056pj1zolRw1YAq/NMzEpwEgl4bbGdl?=
 =?us-ascii?Q?XNkgM7sP0B6tlIcN7BYMrqwfmvdpQ4/AibmdnwjeI6kYfRijifM++v8dnlKK?=
 =?us-ascii?Q?MFG43YgGgX/rtsDWt68nIIgPKKMTWLWi0ljNdHGdqxmSJI/UAJXZ1PoXTi9w?=
 =?us-ascii?Q?Q2AMk/Kb7Gci6uTeD98Tm6xOH4w3nJJFwj+54Keg74qyhZEVQddGvivfRBgs?=
 =?us-ascii?Q?q+SQzT5xZd2NhPDydchpLqr6qhy797KoX+qFVudWht+FVoZf25hjK/vH5l1B?=
 =?us-ascii?Q?7DbX/asF6owZbfhYdvBvSe10Dj6Wlk2SFuF/kQfUlOWM/XsPv2f8Fb2A6V6/?=
 =?us-ascii?Q?2jmPyQxtGKEvN/Mfxym7fUioinxjexLlgJdhb/9zK41WyNQlWC30efl1S6X5?=
 =?us-ascii?Q?uDy3TwSWMNMOg0SEQYKXs4EhOqJC3inMZ0EmB9XBopHAZ4VzTZmo91rYLpwq?=
 =?us-ascii?Q?i8e+Ifbqi3od2L2T2jqqQloQGkE73jqwcsdvXaXO5xKtF9NdaXe0lvysiS9i?=
 =?us-ascii?Q?Whnl6i2++5/uUvfLouIiTG/vzONqsKrFTD3ts0moshhzVckj/UTuuk5ceP2b?=
 =?us-ascii?Q?Wrc/OhfBhWO0ijGQJ7DcF510sOf6c4iN/GakCvMU+ti4+cxUCiLV1hsDhFg6?=
 =?us-ascii?Q?0jfLGBh1KJolTlTXn3XF6DMii6cXhdFbeueVxHiJoxYUe9BY4ex/zwjYyb7E?=
 =?us-ascii?Q?5Arq8wPtPxsgreQmSNAMf8C7hpHJAvLKvMqMuQCW6dA/+7h5TdZtaHPSUOwP?=
 =?us-ascii?Q?JKHz9Xmj2rP3xC7nhzFsu+qlJKIIN18jIIy6fn+cJpT7RSr6In385r0yopXa?=
 =?us-ascii?Q?Kv1bcGFBiTExsONhvoPiPPskq2zC0FOiSHm/Syuqy9+I9jvlBvT8ZdfGjEqf?=
 =?us-ascii?Q?RIklKGZEiHPhEoBTE73WhmtCstaUw7vPBD783562PZM2Kcd1hQWPrEKdJEWg?=
 =?us-ascii?Q?L9s/k17hnTYhXXahNl87yZUbrPmxcXB3FDmQ1x702Vb9DhfDLDQZzJGd791q?=
 =?us-ascii?Q?Q8VOuIz/tOmE7F8C5u2/Jz5qC6h61YMvMWhfUKtenBUXx8KTmc3kBRlVrl7o?=
 =?us-ascii?Q?I2t3Ix7jRVpqGILJUu951mKn71I85MFpU042mWCQsdhU6Eb84Cs309QY44wF?=
 =?us-ascii?Q?TKc2/zWHOtjkZYtaIALHIMB0UcTHPVWf57IH78SH8wtQGmC8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bde3df-e254-4c4d-6cc4-08df454f0925
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:36:27.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFpc0e+d9IHFrSJFRks3Aiy3+qPtWti3MTCqSVSV0W/q7+Jcbcy02QYRa2/OwWK4hm3Mwi06oidLKhG8+zJGZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999319

When coupled control is disabled, a port in COLLECTING state is enabled
for collection, but not for distribution. However, drivers that offload
LAG are not notified when a port enters or leaves this state since the
bond only notifies them when the port's 'backup' flag changes.

Fix by setting 'rx_enabled' in the LAG lower state information according
to the slave's 'rx_disabled' flag in 802.3ad mode and by notifying when
this flag changes. Track pending notifications using a separate bit
since 'should_notify' is toggled when the 'backup' flag changes.

Reviewed-by: Petr Machata <petrm@nvidia.com>
Signed-off-by: Ido Schimmel <idosch@nvidia.com>
---

Notes:
    Known issues that this patch does not address:
    
    1. The new 'should_notify_rx' bit shares a bitfield with other slave
       flags. The 802.3ad state machine writes them under the mode lock, while
       a few other paths (e.g., the 'all_slaves_active' handler) write them
       under RTNL only. This is not new.
    
    2. When a port is disabled with BOND_SLAVE_NOTIFY_NOW, two notifications
       are sent: one after the Tx state change and one after the Rx state
       change. This is harmless.

 drivers/net/bonding/bond_3ad.c  |  2 +-
 drivers/net/bonding/bond_main.c |  5 ++++-
 include/net/bonding.h           | 25 +++++++++++++++++++++----
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/net/bonding/bond_3ad.c b/drivers/net/bonding/bond_3ad.c
index d91533b80996..d2a55f4d8979 100644
--- a/drivers/net/bonding/bond_3ad.c
+++ b/drivers/net/bonding/bond_3ad.c
@@ -2608,7 +2608,7 @@ void bond_3ad_state_machine_handler(struct work_struct *work)
 
 re_arm:
 	bond_for_each_slave_rcu(bond, slave, iter) {
-		if (slave->should_notify) {
+		if (slave->should_notify || slave->should_notify_rx) {
 			should_notify_rtnl = BOND_SLAVE_NOTIFY_NOW;
 			break;
 		}
diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 7eb3ff82ec96..4ba1f5c33251 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1831,7 +1831,10 @@ void bond_lower_state_changed(struct slave *slave)
 	info.link_up = slave->link == BOND_LINK_UP ||
 		       slave->link == BOND_LINK_FAIL;
 	info.tx_enabled = bond_is_active_slave(slave);
-	info.rx_enabled = info.tx_enabled;
+	if (BOND_MODE(slave->bond) == BOND_MODE_8023AD)
+		info.rx_enabled = !bond_is_slave_rx_disabled(slave);
+	else
+		info.rx_enabled = info.tx_enabled;
 	netdev_lower_state_changed(slave->dev, &info);
 }
 
diff --git a/include/net/bonding.h b/include/net/bonding.h
index cb89aff437f4..5980df71a358 100644
--- a/include/net/bonding.h
+++ b/include/net/bonding.h
@@ -170,6 +170,7 @@ struct slave {
 	       inactive:1, /* indicates inactive slave */
 	       rx_disabled:1, /* indicates whether slave's Rx is disabled */
 	       should_notify:1, /* indicates whether the state changed */
+	       should_notify_rx:1, /* indicates whether the Rx state changed */
 	       should_notify_link:1; /* indicates whether the link changed */
 	u8     duplex;
 	u32    original_mtu;
@@ -399,6 +400,21 @@ static inline void bond_set_slave_state(struct slave *slave,
 	}
 }
 
+static inline void bond_set_slave_rx_disabled(struct slave *slave,
+					      bool rx_disabled, bool notify)
+{
+	if (slave->rx_disabled == rx_disabled)
+		return;
+
+	slave->rx_disabled = rx_disabled;
+	if (notify) {
+		bond_lower_state_changed(slave);
+		slave->should_notify_rx = 0;
+	} else {
+		slave->should_notify_rx = 1;
+	}
+}
+
 static inline void bond_slave_state_change(struct bonding *bond)
 {
 	struct list_head *iter;
@@ -418,9 +434,10 @@ static inline void bond_slave_state_notify(struct bonding *bond)
 	struct slave *tmp;
 
 	bond_for_each_slave(bond, tmp, iter) {
-		if (tmp->should_notify) {
+		if (tmp->should_notify || tmp->should_notify_rx) {
 			bond_lower_state_changed(tmp);
 			tmp->should_notify = 0;
+			tmp->should_notify_rx = 0;
 		}
 	}
 }
@@ -573,7 +590,7 @@ static inline void bond_set_slave_inactive_flags(struct slave *slave,
 	if (!slave->bond->params.all_slaves_active)
 		slave->inactive = 1;
 	if (BOND_MODE(slave->bond) == BOND_MODE_8023AD)
-		slave->rx_disabled = 1;
+		bond_set_slave_rx_disabled(slave, true, notify);
 }
 
 static inline void bond_set_slave_tx_disabled_flags(struct slave *slave,
@@ -588,14 +605,14 @@ static inline void bond_set_slave_active_flags(struct slave *slave,
 	bond_set_slave_state(slave, BOND_STATE_ACTIVE, notify);
 	slave->inactive = 0;
 	if (BOND_MODE(slave->bond) == BOND_MODE_8023AD)
-		slave->rx_disabled = 0;
+		bond_set_slave_rx_disabled(slave, false, notify);
 }
 
 static inline void bond_set_slave_rx_enabled_flags(struct slave *slave,
 					       bool notify)
 {
 	slave->inactive = 0;
-	slave->rx_disabled = 0;
+	bond_set_slave_rx_disabled(slave, false, notify);
 }
 
 static inline bool bond_is_slave_inactive(struct slave *slave)
-- 
2.56.0

