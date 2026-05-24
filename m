Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023097.outbound.protection.outlook.com [52.101.83.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C5A30C16F;
	Sun, 24 May 2026 19:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779649753; cv=fail; b=qqX4TRRUUN7mNS7ZNVehoXS1JRYu9s/dkFX3Yip35s/SwOVEMA1VliicknpT1f9OuHkQ0jS/OIiS0XJKJ9wbzjSMNdDMgskZZrNGASNSeiRHsvz/XTKHrlIcQ/vmWIWnXp+A4VsasjqzKVHc1VhfhLl4NEdC5OPSB2NsgnWTaK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779649753; c=relaxed/simple;
	bh=zcfko7lUDlYErlLuHlleOAm5lf1pkXqUE+zMjR/0gCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UsRp9fom/Sb2M+HycStLzvYCvWOFUenpi7gkwgo2KRlXxUzOxHxtlTj9ufPEJTBmJlbrXnqzeWcT8qRWiJb3Vg4vrEQnme0HvrCG4n0d1eAIgMsfO5Ol8xhTIuN7TAaSK/BvcY+1ileTWhFiAABd6Z7L6+iBklM0zCaTdnZUtWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=JnBgJuTl; arc=fail smtp.client-ip=52.101.83.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="JnBgJuTl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQEoeX/QqFOqSk6ypzGo0lEuIQvcDJbQ1JrnvXyhcrWYZeabmBPAWpI7hgTRXGE7WAbGKeqDhsC52hC/tAeUBFSuiAnOekggA1H3BDQzWpN8hHEolgbUAdn5cMjVpNjnyhOE7hxv+LKtb8Dp49zlnqiFemewzsIZxHqXaFXOqN8ceny2FNs3SPNhjvsZGYtTwSm99dxU7z30xB70zLhyVRqQB7ySDB61dbo0N82DpWGlZj59zsYRfth7lNh9E/ll54s6Butzs49xUraG17pOu0UqP+j4S8sAu61N4iEFYxOpLND7FaLmrYtj8VRWSiv4oEYZ0pEmL2RwRapwmqeUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkYEYChdNk3gtVYeGsWn8yRWLgmftNf64guVv9MXOr8=;
 b=czbfz0XNQ1SSUHydSM5A7V8GePppVgl6zvsDF05lwwRAAg0kZ0TPoQslLLhYXjpASsxEyNCv9o1HV6fFDPArtkPgHiofhpiYCO72wHVdtPG1PNbNKt/E1tl9RlwKUzzxNdk+g2FCnWL1tRgQy13fdfE3l06KH3Z/DAjntLtNtor2eiyrIIjrYep0ZAbO/mBL3n6ziROFYeJHMQDRA6Z1WfwYhM47UBDk1Yw0o8SF0Sxogp6JXkQdfAiUjnYBEcwacNIEbi7L7mv3VXb8DCYEetw8Nal5H1pisdj+GI5Q9qUKBjCqlsreCaXM1snQ5SpXmy3vcCDgz3T+ae3nTq598w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkYEYChdNk3gtVYeGsWn8yRWLgmftNf64guVv9MXOr8=;
 b=JnBgJuTlleU3XRlhux/sCT2f31MlzZ3dE1LNcNeQcH6MKmNClSEyxSo8DPxlB6YGvhq4ZNBI9+PIP6WKsC+O8BRVb5xwCTMx8pA8so6j9RVWccNvAOeaDwPLXBDHu4T6aWbwnMffi2+adCB+bsKiMObdS6AOmbjiovlEaiIGJpgLFzIJxum2yx9pKyedRnd6ueAOi5anoGS+tygeLolpf1uighSg4mh6SjsJxqh58DAROcx8c6mpHTyhpGSx8RoiuNq8ylcpe39saAP7NRqorEz/eBh0zY4GSJ+AgP1eyM6Lt+Jyiw1RG0Leo9oJcL7xXX9txU/TQ+z87lLvFokHJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DB9PR08MB6506.eurprd08.prod.outlook.com (2603:10a6:10:263::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 19:09:05 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 19:09:05 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org,
	brauner@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 2/2] selftests/mqueue: fix -Wunused-variable warning for 'usage' in mq_open_tests
Date: Sun, 24 May 2026 22:07:13 +0300
Message-ID: <20260524190844.46196-3-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524190844.46196-1-eva.kurchatova@virtuozzo.com>
References: <20260524190844.46196-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|DB9PR08MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: d22a4646-648a-4d43-f723-08deb9c7ec76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	hUhDEDVEFYpVKKujmQjz8vE7GgOY5Y6jAE4MBIYcwV33+FDIZqchOvagYN8aueIY14qV+LTVrO1Ge3d74ub6ZgRvcwOm0L/E3f1qVYu0In+2YZG39aosdhGfYhDdyGNSoqIWMiS9DAnGzbQ6N3+JBIyREvuEn8bT+laemEJlW77UIrTPsTVYsT+DvkfLYkBX4pYdauzajzuCk3DXD/LcFNdRK6A4YWmjDRq430omwcdWZAaOD3/f/+YoKu/JWEGZB9eaSzHW08Gk1f4KCxmGYOC6fhb6iP12vYNVCnfApyB27sc5xibfiLaX+YzfWCXmVRNuoJL4FSP0ty5kqsNETdJ966/bw3XLA7nEO7sgF8/YH00p2mGB/EJAHX7f5U2wlPsG79n/e94C84Lgvk+0Oervjsaq+/tz/7+29gDCy8Pp7pHUa1KBrNBiAOkjKPfQ3i1f2fR6oOnLrlRY4U/BK6nYxfyyEQ8KukwMn6dFFPf19woE/D21hp+9J81mfvwTq0rpp7/QubmmJ79tXZrFfKJAB4PeIRCZ6P7XBTbNqNkBg5n0SKEnb9O1HniDOv468O8ut7YXI5nNpymcl6V1fvztI4kH7BgirJB/ob7VLKwJqt6Nz5+EaYTkhVjsy7OY44HLDADQXOZKz/WWIzuwv1VOomSGeislvx87jeHQHxhsIFSZfKU6P/MGN88kLWMu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qpTGah109hUM7JO/idpBCXkVLRtgm5REyhb6Xk93I+qBYPD/o3bIKgGKHiof?=
 =?us-ascii?Q?s3Ef3Tsf0JsfPqHHA5Ds+9nAzfja5++g5GlZS1923GS59bVgrj6sf1BBPE10?=
 =?us-ascii?Q?7WU82/utiH3tKuCS951ALG9hbuSkiKFIaf5DJRog7z7Fou5xeeIh6Pt8o/8A?=
 =?us-ascii?Q?3WK4ReA08KqWEA99jhMS3/il7Eo+2mnh9OUCtYPiO2861r+XiFQogU3BhJPb?=
 =?us-ascii?Q?oIwTgkQnbYA9GRRmgQzO8u8RaQsaHIzisV1IZPlAgDDLzE4CBKhI3OQugOYO?=
 =?us-ascii?Q?ktZmjifGNh2bJ87kIeHm12jxmlQyUoSFAwFDF2jhiupqWCJMaxjoE9RDDqzl?=
 =?us-ascii?Q?xSln/ACVIzcfSI+Suk8rVT0qfcSFxUDOpQ0OoD7CWg5XAVmij5RqXXoTnyDB?=
 =?us-ascii?Q?35AEtGMW0lQR2Ik4BVgajdoI9qNZlZ0xjX1W0NDcFTIhW8skUpQ7hD4/hLdx?=
 =?us-ascii?Q?mzoWm3WXd8xvZJR9wIYwhOhhKNYLatSmZfIqRmGq4bGJYYFvwOo9JqWfAJnN?=
 =?us-ascii?Q?q5enK3hTSiQm9NtoQqYChvx3TNYBBMEXxu5Zwp148tg0kU7u/3J4v0SwYZle?=
 =?us-ascii?Q?HVe9TrhhfmZzItfVs8MLZFo2B5anpVlaR/01VWcWRP9cI7hQe7bhTJKICOBE?=
 =?us-ascii?Q?UrXKJ+Xd8U6DMu2bFWR2unK6trrbrpV3bM9OJT8DEz338fGiaWMm87tZW0rV?=
 =?us-ascii?Q?tafvuMJWLgxsW4JYX0ftlaRkyIo8O4j6JSTV8UZZdWMb3TYlmbOd9CXcPW0S?=
 =?us-ascii?Q?BbKqZBeUrrztfCTJ9jR+oFLpNWmn5pYpJJyZIMdNxaXDLbuEJH9pCE0tvurI?=
 =?us-ascii?Q?yBAgOzO75IKo8ZDztKqn67KMPSE91WjNMWvvcFE4nXGqlQS4JazHrfW/a/0H?=
 =?us-ascii?Q?sIG7koR49SEmzGd0XKlr8VsrVXLf+y0ENYf2m4gAo/CBHtVWeKGKRTn7DzE/?=
 =?us-ascii?Q?6O7jDMkFtj3IOXONVrnS8JhbF+EmJzx7uaz3yIU7jU5GLv2/Hz+8eYaW4v+s?=
 =?us-ascii?Q?dxtkz9yFMSVYVZVx0mkwxSBPF8xXputh+Wr3ynBNeT4IjbGmZR1dXYcGvUC2?=
 =?us-ascii?Q?YOuy2sJBu32eT2dVlj7PQqlkW3OwsmCylZxsCtpjzvFZQih3zDXlCAV+ypQQ?=
 =?us-ascii?Q?EFnYXDz3xPGt+KcficgVgqVTHu88JZAuHqAjR7iCnWqleeQK7eA09XCtkYJz?=
 =?us-ascii?Q?H/ux00UwkUc5iTbL37WmG2TZE9Y8hsQSDXQ03Xf6vL5w6njGkZOE4Jo2FDw/?=
 =?us-ascii?Q?WMV62Gm24ATbBf7nRvxSc4vuC2uGLZ0Zc3Ii+ZlTkCRHG1AJxZcSb705CROB?=
 =?us-ascii?Q?9l2YIYT1THmzG7QbWW0PqSysEIzbMxPFmMt9xYgWTFLySh+L2mC9Hsm6CrYf?=
 =?us-ascii?Q?300VUWyrWH8RCjJnO4XrI/bPCU3Cx/1NiUiduOBtyjAyQRCk42To+deuI81J?=
 =?us-ascii?Q?IDcMSXWWs0PwrZQ5Vga66pqQGdvH3q+2f9VmHi/4SfpgC8klY7shaK/Bu4yn?=
 =?us-ascii?Q?IbBV/JykACi0M4opA7zHq5R9IZx6Cmzw8Ge/8yoWpeSV2ee9mVKoHbBbGa6u?=
 =?us-ascii?Q?bGmqJBNQecVNy/fqt73XRy9Pxm8qV5V69VY0gP5uAhTtl08Vr8LxJFK+lbul?=
 =?us-ascii?Q?bdJ7gdeJ3nLSOYcqS7HT3jvP1D16iSJAENUmxjXnSlOv+xqtOKnKgNZ49pty?=
 =?us-ascii?Q?NPofKxYSFCVuOXCwz8y+BlXUzSWqYpefEfgCSPFxcGuWocVt7qlY+o/dQPO1?=
 =?us-ascii?Q?3F3cJTWpI0aBkn59G9G95zQSRJkgxyc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22a4646-648a-4d43-f723-08deb9c7ec76
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 19:09:05.1326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJy4SPI2WXFZxG0rkpYUFLCmhRkj/x+kGkGMfz2BpmUjU2n5CqRsBByFSylhMrkkKHnzKrLGgpuA5kjOBdOdTKobJ9g+bLGpOTHNm8f1aio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6506

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  mq_open_tests.c:38:14: warning: 'usage' defined but not used
  [-Wunused-variable]
     38 | static char *usage =
        |              ^~~~~

Mark 'usage' with __attribute__((unused)) to fix the warning.
The variable is kept for documentation purposes.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/mqueue/mq_open_tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mqueue/mq_open_tests.c b/tools/testing/selftests/mqueue/mq_open_tests.c
index b16029c40c0f..f7955507917b 100644
--- a/tools/testing/selftests/mqueue/mq_open_tests.c
+++ b/tools/testing/selftests/mqueue/mq_open_tests.c
@@ -35,7 +35,7 @@
 
 #include "kselftest.h"
 
-static char *usage =
+static char __attribute__((unused)) *usage =
 "Usage:\n"
 "  %s path\n"
 "\n"
-- 
2.54.0

