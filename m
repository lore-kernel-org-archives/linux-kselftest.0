Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD04E36E1;
	Fri, 18 Sep 2026 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730771; cv=fail; b=DuGZWHgDJuhkqcHGgG0TrOILpsUEj6wro4A7x24kg8FCVXirNiKAzqXknCB9koZmUhL9xaDwhZpwVHxc+hE0oEjB/SfeQxPVymOBDzJR4+iS5kp/41ZucvHyr4N6yLacN3FFZV7TbtoM0tzuFoCrtSNSF3E9qXwvB0gLVpLZwZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730771; c=relaxed/simple;
	bh=Y2Sp1AalV13+la4HXgwikI3/71ciytNIIJdDFWOPouw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l0KSuM7HLIOxqV98U9k7fAoPwwOo6795uZdBvQI6iAr+n9UQJGKbuPafTkOVaQ9KnMs28nvux2vtGX8Hr0ziisI+/BsfuVKmYlFBThJA73nJ78eGCaim8di1JkMqbFWFrzS1C2wK4pPTwwJxNavNdbIDG/6Bf3fgTMl7x3vbrhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l4flPvV4; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l4flPvV4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuKNomv5IEKVJgzmRa+v9jAXua2JVgUAuUBRkQe5WTONpddz4yvO5NfUzgToWPLrhI+Y4cTiczOWA1Hd8tsa7Hd/tG3YSiFN+c5gkYuFkBJliPYrOhli4W6YVYH/UL3q9bohbLEA2lUB3W3fyLN2d5j89wo7ESNbykUZhtx9MHjrVT47W42CE0edeq/DUQB3BmtI5Y8nvjZ68/td1VtZ4FmcEbNjhC+IZAilyIA6W10mXv3C/zPfAfdE2KTRjxJdGXO460tEMd275Gm2F3iGG3H3FhcqJikrMe7nUom9TsPR9zAvEYxthzLVPcsFJVSNOpEKGK1AJ7F2BqriCla96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzku74SjD9Jc//wSvwQR6D6kzHrsqbiAkiJf5dVtxkE=;
 b=qXeP9i3ZlkidD4RjZWnK74fNkFhzUyzF0DgftweTSxlCdFzIgUeAtoq9fVA5AKefATudpPeltcof06Fpje7njvsu1F9cSLtubnpEaq4QIJuUZxqh7UtdtXxW+kiDFNwvZ4qJQqC4XZWGFoN+VILQEu5OpRMC24qsMMpUFVg4IG579x4GJwTWNFxS9hsRilfWFn6UN+aB1R/H67+7CZUuAOT+Vad7pXD9HZv5cR4+mrK7dQoeH8O/QeYB5EI7k29L/jmulOBnnc/juD7hkBEJxuEaQG9EewI+YKtzVyjimfemum5AsUALd8n3A/L3UzwHjMwoBvgOhbjgjUuEk4eLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzku74SjD9Jc//wSvwQR6D6kzHrsqbiAkiJf5dVtxkE=;
 b=l4flPvV4wgXIZjxFdi5dznb/k50E/W/OkbR9NaKlPmaIPX+YHk/TTEVy39eHZnRFdrIOpmlAkmWrTG3LhXsRYZWmXMUWiksXdkgMDCauPIhgZsgbB8sLEHBkIneCM3yABra54qE4zE01qRdyghDIQkyuPrrxItVVw/ECw8aNjL8=
Received: from OS7PR01CA0276.jpnprd01.prod.outlook.com (2603:1096:604:259::10)
 by OSCPR01MB13061.jpnprd01.prod.outlook.com (2603:1096:604:330::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 11:25:53 +0000
Received: from OS1PEPF0000D20D.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:259:cafe::5d) by OS7PR01CA0276.outlook.office365.com
 (2603:1096:604:259::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 11:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20D.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 11:25:52 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.165])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id E3FBD300027D;
	Fri, 18 Sep 2026 20:25:48 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	nb@tipi-net.de
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net-next v2 0/3] selftests: drv-net: Add VLAN test
Date: Fri, 18 Sep 2026 11:25:26 +0000
Message-ID: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20D:EE_|OSCPR01MB13061:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a30e695-71c5-4178-8767-08df15779939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|13003099007|18002099003|11063799006|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	FmixdXiaRwes6WUo5M15UMK2Lr/XPxkNH7jOWREsdOZ0DmEYBuWWyJ28sYv5TcfeAd57UekTU3vSeR9vdoRGbID3Cy8TjS5leWWgDtDRMiRAujMhXfQ5QpffGuK+sBFU3qwBTAig6NTxHgdYn/iV2Tq2ySxOEt87XLlIWEKBYftEomMoFYgG5XCAConSM8BJXPAbpyvm1bKDo0L6AO/peaYxDCBiIrZ9I9lrjqEg2+MFTRuFjOBsFBtJgMU5jNmlYsZN9KRAho2mN+jAB1TF88R7BZ8GmuE8xh6GI+1ZoZupr7PtlAY2ITmECqoLQQS7jBEmaCXHqbrEK/bOrY7Jo0z09Vhs5FD+LfIO3pAfjQ3Bmm+byAPWMUQ5XYcI7M59x+dcjFjqgnZrn3WekYCXiXzW4g9UTR5ia1ulI9w3MTbIxLaeeZTlZhuMxoPhkG2eiX6kQbNaMKVW78tcQz3bJM7kcPHPuihPfo9xukXXRUpheORkhufQluV5fZnUu0V7ExQcjSHe9zi7WfQkHurwP0odZ+Ino6rCgP0txfVH/8/EAKx27pmTgtjDe9vctKbq9E0w7UoKyhRp1xvUBej1f1qJqnOyvuGYnKBgcWJwpgqfuqKZidbH5+an3s6l6KSNygR5rlA8ctnGFhEvqytE8kjey8JrrOokIZ/KLq5HIT0TT6SjsYl8r5Dtp9KRNSbrAIwSXAtoHEFMaVseTtknFw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(13003099007)(18002099003)(11063799006)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cAYMGy/i2tVpocdGPlL1Vzy1nLg7oN3rvLpOwg+VQgE6INzjx9hUnntxO9w7ho0jzpHE3nbAS6AUPfCl46t/k8iDEov8nP79JKM2elGcHJtvcYnzxMAFTnOZVMRXr65EnkBGiwue3SgarRIRcAYAoTroIse/No3zhRfEJldJToYcVH719zDbvVkyw9w5MW0YTbX/+5nPKfEOyCWASLKbyoRVbi+Dr9he2+/Pjk7Hrcqh9mGOvJJ/VDH+mBvn8mQnK3kmlavKO/f9UsNWaqi8EhQ4lw8ct+HC64Z74QwR5B/1sD+WlaGYmRpBkf8OYOc/+Fx0tr32S0VkVV7OokFWYhwRv9b9QbZBLtGMnPNMNf+bNXP5dReOjhssUiK9XLgg8Hn6XpEJcZZTkNyUsB6x5bSMEaArlriUjsmh9NaYM/1lOnhDLM+xQFVzFIKtwFFq
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 11:25:52.5246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a30e695-71c5-4178-8767-08df15779939
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20D.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13061

This series adds a selftest that pings over 802.1q, 802.1ad and
QinQ VLAN interfaces with RX VLAN stripping offloads enabled
and disabled.

This series contains only the selftest part of [1].

[1] https://lore.kernel.org/all/20260908164309.59282-1-ovidiu.panait.rb@renesas.com/

v2 changes:
- Added a new commit to check if the ethtool changes were actually applied.
- Allowed for the VLAN IPs to be set from the environment, to avoid
  possible clashes.
- Added Nicolai's Rb tag.

Ovidiu Panait (3):
  selftests: drv-net: Move _set_ethtool_feat() into lib
  selftests: drv-net: Check the features set by set_ethtool_feat()
  selftests: drv-net: Add VLAN test

 .../testing/selftests/drivers/net/gro_lib.py  |  66 +++------
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../drivers/net/hw/lib/py/__init__.py         |   3 +-
 .../testing/selftests/drivers/net/hw/vlan.py  | 127 ++++++++++++++++++
 .../selftests/drivers/net/lib/py/__init__.py  |   3 +-
 .../selftests/drivers/net/lib/py/feat.py      |  43 ++++++
 7 files changed, 197 insertions(+), 47 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/hw/vlan.py
 create mode 100644 tools/testing/selftests/drivers/net/lib/py/feat.py

-- 
2.34.1

