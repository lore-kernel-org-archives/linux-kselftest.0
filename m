Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991017;
	b=qqqE0FeM9GGuWH8o8bb7XLJKlKiRrquYEHEzdmQwh7dd8GHNDYuMTpJZPsdBRGihMO5U
	 RbAerfvIoL7nQxy+DomICulhhz4tptEBcNSDgoyT5Ui9nPRve9Jd85NwY51dgYft4oP1j
	 Ge1ruYVFlwMpR7K+Jkl5rPSgSbAyMV5OxXrKXaPKtRE5NiF6KF6dcUIqs24SRcWnJmNFs
	 QBBkQJMpyMKBvdvrmHBzsHRC+YY95L5AqB9x2WdQpcIBsO2bVViI8fFx7xqNcIHsGP6yQ
	 oFhN9twgQrJse5uNPVNPQupuWFnLg5GiZLit5pTGC+gC7wleKkN7ThnaONGJXvUwaAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991017;
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
	bh=D1mLUz1fwaU+OpWazMlkzp6L4WJRZ1UyIQV1IEaRP44=;
	b=Jth06kXBO0dqg52Gtp/JuW5tLQX4Ipfqrin4QiE5EtosVZcTdAVLK9svAeNh3JTnSQU/
	 cKWAY1Emm9SujbT4ISPoDoJtUiOem7x0ibK4Tvh8rRwvaQnRsz5hqeww0R6e1mlGZ6jl8
	 Jtjdtx192+btujN8pXXin1G3teGjlFkIO73EvlM5i02UiVeCqFsUaTR2K7CMb40jNtkPM
	 AEpzaSBBvERa2V+OO9KuFqTGUnzlnTMkgmkWCRFxhWA9dl0Mr/jNcEkw/0jbvSmrM2lS3
	 QumJo7wFoGD6Q1CDgDc0MidJaFXva+R1eP4MK5sQHgM69XXYVw7op1PqQTZkb6cPHNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=H8zViksz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107EE606A889;
	Wed, 18 Nov 2026 08:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 107EE606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=H8zViksz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gwyzz30AqsuCG5L9QCRB3XnhX5KiXP+vzmyoXXMrqvXXXeG+08MNfXdZpLo0+m/SuWx8V3xt81fNkTDyHBpsfmtNRggs6nnvxGLeKXlHG4MmiYPJ/zJfInZ68YsR7Q0AMhjYqNZx6VGCrNye/pXVhSYNU5UhRyIVyMJ8WbN6kLyeKa63XqaUnJnYMsY3ykPvUkP5hIcBDB2eSvqcWiyMAWps4QQIgtpE95og6T8GOELwXTay3sjOYVa9ILXBiGX2uqX74WD2CtDZZfM+6+i4V+p9SbhnbLJ7Jb5NUHsQjWPqzFAXO+2abpITJII9YvkuOQbkRoC7X5J2bGuMouBDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1mLUz1fwaU+OpWazMlkzp6L4WJRZ1UyIQV1IEaRP44=;
 b=Bnsp7ScRT7hllCLkCDt/P4cWFihFdLpQE0q2gSiDEqnfUlQ81ISyfWjSKFIGCSERi0s+/52IuDDVyd+7wF+QeqDmxgebZLGCaQCTQOpfGvbaGTM21l6ye/BqFQNgXaYzWz8VGGX/OctPgJLcQmVJKJDX9lL9MvintQY3a19WlyqjD015Ldi1dvoyDF9N3pAcltrVL1NTTu05iJ55GSlZqdoANjebPXSTtINjRZWxKqZ3Bnu3RQrAGoWVV7ropKhK4issbixXh5LOyrDscxL7ty5BJkQT+4tnggHxZoNsuocW+Zxob/FxUtAH9rxkKoFxMfQG3C1gEyW76hyP0Dsj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1mLUz1fwaU+OpWazMlkzp6L4WJRZ1UyIQV1IEaRP44=;
 b=H8zVikszFHUL3bFYFNxfL6aYF7WETAtsGvFX7Lct7WP4YMFYmy7mPqHuCLCNmJoc0lxSjuN0f0Yf1pZiup0J/X7gVJ+p0jvNHApylBJTZEI9rWVfCmue3uwSaUzuiLIanZULhx3bEAGY4dJ6srF5ayJXVmjxbOyaBIOAgv/CnnARcqW2T00DsOXL6u7li3Y5LSwg+ELL5kqajmv/zVTNgaxKROkagoxnAhJ2lA94LR0QSaaKOUPUT1ZN9XetaUaUeNXNSBDpOwV3zFy46+6x+gyyPmz4kyzxIDUuAgNfjfRg9ta/fMfhQ86PtnEkZxz6Vc+hwGAGIAGv9GB5qqGsMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH8PR12MB999319.namprd12.prod.outlook.com (2603:10b6:510:40f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:36:35 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 08:36:35 +0000
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
Subject: [PATCH net-next 3/6] mlxsw: Enable LAG collector independently of distributor
Date: Wed, 18 Nov 2026 10:34:39 +0200
Message-ID: <20261118083442.1061289-4-idosch@nvidia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118083442.1061289-1-idosch@nvidia.com>
References: <20261118083442.1061289-1-idosch@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0025.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::20) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3e2c9458-6724-4e9c-a03c-08df454f0e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|22082099003|18002099003|261009223027099003|56012099006|261026140227099003|11063799006|261102123227099003|261028144727099003|261026121527099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RbYv73xAtMd0lYSUrG7rhqsXNzPTtVpUHOIWseKcjLBnKCe+WoblX7HbA6vveBCE9r0Ys2uLIPMgaLw3O1932vDNSzhdZZ2ej4Lj3xRoG0d+s5Q9RHVutfsv63KFvr/vHjhAFyJDhe7PJ6Po4Ae4KPKjcEZcxyg9QsQGO2Jj5Op6l5jB+limcQl9elYi/Ro7I3OrBoBJ0U/5cY0UhWORtauq1KX7UqwSJ30RcSXFP9U5Qbj1rY5UtfZsBe83uRNXQ6Gw876Q1aI6nNno1edCdqIP/1JGDhXcgkD4c/oFOL0g4TnHdA8vTS7VA4lA0WMFCLK6sQ0ODr3r0EbLt7reQ9xO6/HR9C+rPnfWiN2+LmxNSMAEZ36IkUvxv9HQQL3JaqecfajiFHqhNzvy3bAT1ROsMlPgklDJ9LMLSnYsSKzWEZ+Ltcdu9TBXddRofgjfIk1+0HpLMTpcVym5iTcITj9mF/qyiUe+aisKIrZNH4vSehl247U9uT7cKncDyH6LyHEGL8cJZur2GmR9TS3puWoxJV2/Xd2YfGMUuD6nmvLRpVuD+GRc8FNFacRZXlKLNXW7kyD4Ux70fjWs/mSkJRyJi6Jz2Lb9qRm26N7JytQqfXJps/yt/WRLxh2MiV/9dUJ3+v4GRfUtQ9SNMIEyQwyypB9HJ3hAJTFIw06ycP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(261026140227099003)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mUWhtSf16y9Cvy7yYOtjZxuhZdlbiIn0QX4WmNOBCY4ZkNDHR9PjP4J5MA4p?=
 =?us-ascii?Q?7mtrZU7yiaDiaIS9PllF3aKnBNiYqDU/8FaeYdqKSIMMKxcom0Z3fzPb5wDJ?=
 =?us-ascii?Q?Pv/Y/4VJ8J0OIdILKVYNvX6v3UxijObZ+Zwuy1Dkb4fQue77s7+NW3kn1CTN?=
 =?us-ascii?Q?aaedRgXR18Gvwf4Oynl+bK/C/Gnko4xFPMvnFauc1hwH+Haj3Z0Qg7IMf80H?=
 =?us-ascii?Q?rSLgtvLVWez/SNNZ1azao60frBQ7U4WnzXTRu2foln4rkZTElZhg24YvKWwT?=
 =?us-ascii?Q?LJL+/am6EwoqfRXNUScsV6xwDhRpnDbMnLht5Bs4v2QvFKvfIVp2w9myShcx?=
 =?us-ascii?Q?P0VgSRxYHo2Y6Ll1jFBbPZjDLZVnM2l5amhVa59umJDLKwi668klgN6pSID6?=
 =?us-ascii?Q?cfSff1AYAtmAo97o7XDe5rd2ifaROkKti9N7gSLLTaPp2Vy7XKkdYj9MmdQr?=
 =?us-ascii?Q?AjlrTy6Kau1aVE0p2LM0QDr048xqW3lsgMQcly430YU52ZukgHxRkQ8NBVgn?=
 =?us-ascii?Q?Z3E2RZ7JvtBGG5UM6f7VEn3v3imnKBMxrZiazlRbhT3PnPK3wCpaQFfQEuxW?=
 =?us-ascii?Q?y7WDKIoaRZZKTG1nIDcHIu4pvq1j6m957d0yC+5+MU90WcllpjGD/cag6qpA?=
 =?us-ascii?Q?rbvM6jT61Hjek7rNFmjP19Oqs7OyinmoC9hkZoJwbZVwq9iopdIkWOc/nNsk?=
 =?us-ascii?Q?Tw7xek4r5iHkiQTQy4md13CAkDzmVV9fBtm6Gu4DateMbGCxz+Mz+XH0DKs0?=
 =?us-ascii?Q?TOPw9h/FBKu7/SaO1MdP1p5LBJ9h1mQ20qCnzGFtEc9aKCcPCr6B23+x19G9?=
 =?us-ascii?Q?1mHCI6gD0EYA0N02r1NBitsBjRrawfJM8oPC1U8JZwDE0Cxs0uO1oQd9xHni?=
 =?us-ascii?Q?ALtk0LMQZHPTUP+/qEcm5IuV83Yi4i7fK/ClR5uk2jeULMNGjLj3PEmQb/23?=
 =?us-ascii?Q?NNdK13BrYwauA0fbZp4G7pVgWQlxZ5r68TsU2ioPb4eFk3N7GL6EDqyyf7SL?=
 =?us-ascii?Q?08kM0PRTJGdpIDLWJVP5mM3KnvWC3OPD/V/F+7FKV68IsiC6nFeewOCS139V?=
 =?us-ascii?Q?df0wht89iQgxkzDoHGxag7C6yTpX15+bhiScOqCkZbeKGYFW21b8pmLBR49m?=
 =?us-ascii?Q?L3VBWkg1t/wcOy94jasAFCk1Wg9MEkQ6KY60ZQ9x1+MkSz2y+eD+hI2JTH6W?=
 =?us-ascii?Q?02X/lg3SZCG8cMaXXaQtOF9GpqvGKp8LLzp9YwFFoABumT/t0FJDbuMrOrNU?=
 =?us-ascii?Q?dP6csgpAqww0Cos638rrwmqY/qCqoQrP+ukZ3aBGjx0keD+c5/KZ6qYAKhbs?=
 =?us-ascii?Q?fg+Oz4YVjN0UYjXnQ+IN4fTRGBQbAOjMuw07XpCeR6n/fzUNI+uClRokHm6b?=
 =?us-ascii?Q?rvaNNLta6Z6R/YcSeZ3P7Wt/9Y53/8+v5/ixjI6CK2VWJn+25oc+GjOaSBUG?=
 =?us-ascii?Q?ywHvDm0LRgDfm5cUCefy4nqXusocYKVt5wlc73ou+A8fPRADy7S00M+0xS9T?=
 =?us-ascii?Q?mFH4OLUDBO5+rIsSfPKUlrA7eofQd/6iD9K2lsbGgz3Va7yofTarg4xmHPZ0?=
 =?us-ascii?Q?mpDpIxhmSMnXrCSaW7pYL3djl9UZU6m/pZ8/JwiwkyVgguE1j/xM98DS7GKH?=
 =?us-ascii?Q?b5r/2nzR9mJHM0Zw5TSj1upAcIEWFtcYUwefXIpfWZOIAk/rEuoLex9l6Yle?=
 =?us-ascii?Q?IvGKhMy/MDYzKJ+FpsYN5jJFQYybx3/kRV9Ol2ykGRNQRrOT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2c9458-6724-4e9c-a03c-08df454f0e1f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:36:35.4588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7C5D4Kn/3WbgeWy6cOn1oqLHwlUx3ZD9S2rESmCEPKWLcgQUY60jLt+/E8yPOwd1Ss7eSDB9r17Zqz9DkLjMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999319

The driver enables or disables both the collector and the distributor of
a LAG port according to 'tx_enabled'. As a result, when coupled control
is disabled in an 802.3ad bond, a port in COLLECTING state does not
receive packets.

Fix by enabling the collector and removing the port from the distributor
when 'rx_enabled' is set, but 'tx_enabled' is not.

The port is not necessarily in the distributor list when it is removed
from it (e.g., when it moves from ATTACHED to COLLECTING state). This is
fine since the device allows removing a port that was already removed
and returns success.

Do not add the port back to the distributor list if enabling the
collector fails. The port should not be in the list when 'tx_enabled' is
not set and it might not have been in the list to begin with.

Reviewed-by: Petr Machata <petrm@nvidia.com>
Signed-off-by: Ido Schimmel <idosch@nvidia.com>
---

Notes:
    The error paths of mlxsw_sp_port_lag_col_dist_enable() and
    mlxsw_sp_port_lag_col_dist_disable() do not take the new collection-only
    state into account and might not restore the previous state. I do not
    think it is worth handling. These errors are only logged and not
    propagated to the LAG driver, so the hardware and the LAG driver are out
    of sync regardless of what the rollback does. In addition, these
    register writes are not expected to fail and I have never seen them
    fail.

 drivers/net/ethernet/mellanox/mlxsw/spectrum.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
index 815e8d8e3185..5a6dc033084d 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
@@ -4515,11 +4515,26 @@ mlxsw_sp_port_lag_col_dist_disable(struct mlxsw_sp_port *mlxsw_sp_port)
 	return err;
 }
 
+static int mlxsw_sp_port_lag_col_enable(struct mlxsw_sp_port *mlxsw_sp_port)
+{
+	int err;
+
+	err = mlxsw_sp_lag_dist_port_remove(mlxsw_sp_port,
+					    mlxsw_sp_port->lag_id);
+	if (err)
+		return err;
+
+	return mlxsw_sp_lag_col_port_enable(mlxsw_sp_port,
+					    mlxsw_sp_port->lag_id);
+}
+
 static int mlxsw_sp_port_lag_changed(struct mlxsw_sp_port *mlxsw_sp_port,
 				     struct netdev_lag_lower_state_info *info)
 {
 	if (info->tx_enabled)
 		return mlxsw_sp_port_lag_col_dist_enable(mlxsw_sp_port);
+	else if (info->rx_enabled)
+		return mlxsw_sp_port_lag_col_enable(mlxsw_sp_port);
 	else
 		return mlxsw_sp_port_lag_col_dist_disable(mlxsw_sp_port);
 }
-- 
2.56.0

