Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023114.outbound.protection.outlook.com [52.101.72.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2415397E8A;
	Sun, 24 May 2026 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640761; cv=fail; b=ZLlLS1i9/K8XXSIzffki0tlkKOM8/G2ZxNgBY+ysnIUdP+We9B8vfH4EHY5tSI5J+r4P7XjWnmPTyqYugPlqfuUDqNTLRME7WFV5t5Hj/VMo4MggP/9TAvR5yO/WVa00u3VxQr78NFY4zHKygJ7FQrMsJ+jH/EEfSyofmWFv9k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640761; c=relaxed/simple;
	bh=IR72Wu5C46u+sRXm+eAYNBxGQt1dAltJ/obXnj7Oql8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OYLMvxOjQaHuc0K5x4ClBdZyedDj6nkZlwwqLETwyB3+4bljow0fZOgBAKWlVpUeRMNgvcDsWYgndA9mIGEqEYGYqUmaHy68z/0ZDiuEbOYmvpVz9hNiVji4mK7WsoxA8lkPfKjGGrukXLyoHFA3M4sZKkxfZ10gnwEBeOGFNJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=H3kmdx/C; arc=fail smtp.client-ip=52.101.72.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="H3kmdx/C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBd2SmomGV36wJcvd6/vbBxfxvJw7Rko0uJh36zqwOFR4KnixjhC8BpHgwHBvFZOxLlmbYWZ/EkW5kM7BWneVHrJJ1uLV1eUjopYxHYKLBiQXLN51+4Yfirqrnv3uhZ1HEEaLTZNcXZEZP0ifWZUcYofA5qsgLje7X70Z0MRKRCo6tZ2QKGDSHAwBMIMZspERpD0aLLhEwN86qvpeYGFWY8E2zSy7wZ3paAKgvmHxK6oZygi3L+EP/TbwsF3gzSKBhQX/znbmFBJ1IAwHtBgexRGbd/kI9yj1IsW2Oc0bkWovtuNOQPnQ/OxECgzZ5DrksIMIxxiZlmUyXhKI8cW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lL1OIBBZYR5R+OKU2cUrU7q5N1fxjhxwL2Rx0KOmF1E=;
 b=OXZ7N6OQzPzdkRF+QIme8A7cnB/WskuzjyLEoy4ag9pDTWiLLEAO6jNsWLsjDNlen/cA5XZAmqofqbTUvVeViccu8sU8epggo4Q3O3BaZqfS1uyTg/EFvBqaIfX7IVonwFbniuWZiCX7OmEvv6X/TmGt8JntWne/CCJwwAQ3WIOqNNjf5FuM2hgKxGbbXouP3GkW3qrWBsxhxrzas6JI/LGDdmYCLixgZx5IeiQgKjBVlxLyx0bzvuWJYCWcLSNSkPBQzIDNoHEih8/TKWaupwvH6tIBFnRyQigYp5t0EWVe4XXeBhRNvgruKGGOnvBLIR1CFt1VcKCW1HIcxcPkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lL1OIBBZYR5R+OKU2cUrU7q5N1fxjhxwL2Rx0KOmF1E=;
 b=H3kmdx/C/gZS/InV5b+gY7ckQ5EyB4/e+JReDBXIZdX00v14gsqhuh0waIrj5BRcb4RqDjxYDmoktWLHVsM/+4wkA5U0Ggfq5zc6IyB+xRcLQ79rF/vscnSgpSQtZPyseC0HTSWVVRuJ0qwmQK1ZeZjlYaEdt26O1tpZWrMMzonK6IoF7JFGt5vuNhnSzqwGhGcKE8AodjtoG1z/V5FtU06G4ZJ22wN+9cT982/U/Pq/KmbtC+/0E/JwndRWJpUDp2VuWtjK8Y++mk9LEwSbJf5vAGRLvGK7DXXU7WNiwOdYkK/2Bc+0pgHG+UPjENEZOZIwfRXjU7JgS1Vmr+4ZPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by VI0PR08MB10944.eurprd08.prod.outlook.com (2603:10a6:800:257::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 16:39:16 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 16:39:16 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org,
	brauner@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	areber@redhat.com,
	keescook@chromium.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 1/2] selftests/clone3: fix libcap interface usage
Date: Sun, 24 May 2026 19:35:49 +0300
Message-ID: <20260524163840.34247-2-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524163840.34247-1-eva.kurchatova@virtuozzo.com>
References: <20260524163840.34247-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|VI0PR08MB10944:EE_
X-MS-Office365-Filtering-Correlation-Id: 9489cbb7-4a97-4474-663e-08deb9b2fe8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Mye/0xt0HaxQo6ovp3Orac9Y6HRs1jfi56AioM8qqUZGrqbxOgpMQnJjI/EvE5FouRPyyc8dcMolmM202L+VLe3bWromfYT5OIsgIEHkj6cWAyaSgcgaaAeutscgi6Bgpqpy+RMRAav1KoC5CLJmNrqpsEhUEHvSsLsgYbgEZTV4VxfHESxH2TaNHPlSy9c1oM+8xkG9pyjFRupIUexyPy/UmZlyVotEG3jNm65k829B2I/GmVNUHAgRV4oZyr7U2eWCM8V7hWrKMDGqzxrxRd5PqQ5zWFMEx+Fc8cogfqF7XDZwDPPRFNORnNZEuGbfKtdLV6vZi2h7OjPtHXCL5BGCsYYiO7QeGdZZgKHcgoDJfIBAgyFul0O8x4TXV715/OzMT+PpGcmN5qM06cVSn+UpejFJYBR7hhBpmDR4TNT98IQWgwoQ5oaimfzwsS7Gm8k/Mm/3BoRA6r9ZdA0GRO4L5/qfxjaAikKydcTXNqwfeokp8bGe9xMGJS70Dd1Kr/iX1m+apLm4k25+yXXh8XsVJUl1E5v0N42Xb0dtsjMsfdfyg+h1ArRN6pz+RcfzzvQN7wHH3Hby0yUCyK4UO3FucA7a5WIHGlK30VIviOdf0dJ0O8qkRqsqd0ooc5D93MeOF0ClL1ZLHBZFGcGNgy3cMCrI56cTFquE/hrdorIPr1ChNagN2kMcDRiylYi0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NwEaBOjw6vdg/W0oKtv4FYkVZpsNF62YOFrcUuXjvcP8w6TijyDhcnCG5Xic?=
 =?us-ascii?Q?61eJDfsu8y1pf3irEkGF8Ijy+NregUR06bd5Ai8FLkEgfIfcZZgxWhHdEBgr?=
 =?us-ascii?Q?0A86U9+jcJO82nR9jFEzKYkLPndPyfxQ7CJjb//nT1g4bLYAM7KNWxOfWpmW?=
 =?us-ascii?Q?6K2EH45DkC9x+VSMKDj/649YXMIO3Gk0Pz3y4y1riOz+SaL7dLu7rQh0q4YO?=
 =?us-ascii?Q?H6zDoTqCbZ1S1GV3iX94hQQJnXDRmZ6S0o1pgiPW3/h9kPlHrEW/rkKCLkJP?=
 =?us-ascii?Q?9QrRii7cGxXkRNkUh5tuK37iL6bQGdIlDS1/I7c9LpuL8JN7w7G0KEujOOmb?=
 =?us-ascii?Q?CrnSL/SoVeqJk5xMQ0wJP5rlJkUQZhAkDizwe+jRan5Frs17t/WpDHye5+eS?=
 =?us-ascii?Q?DkG7M7UeCT5HBc/rOFVmWelpipZwXTqAhlZiUGPzQ10Gc30Y7AN7f/xFNGYX?=
 =?us-ascii?Q?olPs5XU9TI8Ds+cUglIkJ1+GfO7uGuSbNspJbA59KKejaeNDGd/YsqnO6sc3?=
 =?us-ascii?Q?Ub53wwlhJb2MjDIJdzUg9wpLuCFXe+rWdnl3a4f8QFAID7z/vPtYIj4SQo2/?=
 =?us-ascii?Q?fda0Od5aJZOEqqQVnAtworGQytRxsmORddo9uJvhRBipxXpsQlEN7m6PaiJ5?=
 =?us-ascii?Q?RwpsSBloBdSfCm+zgsbqxcBcSCk/rI4fnDOBitIh7/EyZx5XWKff7DKuLRZv?=
 =?us-ascii?Q?WGkWC/nt0DibeKh/hfPMgHdqnQ3xaRLlmiKul3LPaDdRbxq3jbZ1DYV2tjE6?=
 =?us-ascii?Q?pxGB4PPaCVPOTbGX0D4AApS9FIFAu7JNOYm38Di90eZV41xCqlC5OjyolQbZ?=
 =?us-ascii?Q?vyyd69cpWamACao4vCv+m9/4snQMhUzco+GozK+aF1ZlGUgxqeL7XvXsJcbX?=
 =?us-ascii?Q?I8vKaCtDbRVFp9+vhzo5VHNd4o6x0n+6j76jvTptNk1FnNimNjeEPHAd4s+x?=
 =?us-ascii?Q?Ls4VBHFUnN42Fd/eHzFKBfeBS80swvCOt1xLmGQvSv2H3zaoDCSiA4q46vks?=
 =?us-ascii?Q?ynui9Fff8eoY5WrpymUGZv+hIcYZvvbf+iGb/XEtKpI1GvjR3fe+L2AWp0BC?=
 =?us-ascii?Q?x0inze38+oP0iPQEY0FltTCg+1NvIw6Ji7sDUv6vfF8uK74rlVKddTBBlJSh?=
 =?us-ascii?Q?qLXcERGYXDnu0hoefhA4ZBzsNgpypWqtvhrULHaWvl4bqG/T8l6Osok7S63x?=
 =?us-ascii?Q?I8LqUA6AZNTxLPQYSCdYVzCmFeCHoD4mbO/83co98Fi5btP1iKcrThyzhO+F?=
 =?us-ascii?Q?CCun4PrZgVQGjpC150naLKcl0yVq7IWzdHFo+W2FGNv91jBhis3uj1wXO0OZ?=
 =?us-ascii?Q?0ITWNPTLD5OG67L6z0mUCJefZdlxI6HTKH+gGYpabubjwi9k+JFs2y70HaNL?=
 =?us-ascii?Q?RF4eKkWI8CoBSL3Bx6n6/gejrAmuHDm6nBFPDxkdQ7dg64cDqPnHL7MIGrMO?=
 =?us-ascii?Q?EOuC/xpMC1Tz2SdUxkhMYW5TYdpKBOo3cOo2nmV4o0DrjOMsyn0dlurJC0B/?=
 =?us-ascii?Q?h1snjy4zfj7mYJvEaHKRKUQBEdJ514IdAyZfKvOrx8dkKBea3MP1xKGrQk0Y?=
 =?us-ascii?Q?0L/QlS0b94R+TCn+1iUioIsSBU8EHcXa/JHL2OA6kEGzhv3cX5kQ1fjiBr8u?=
 =?us-ascii?Q?5UjIaoI15DWMXN6LrzScQHGEW3BdK6B1zYPDw11AdWP4XUsuPojiuLs/uFWb?=
 =?us-ascii?Q?Xzn+9u9tpaA0n0tVsOsDUktKaiTjtKEh/SZnNZMVOrxXR8w6jUamfN4eT5Cf?=
 =?us-ascii?Q?Uxqttp3vQRiDASfqq3e/mTHC2mqLpzU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9489cbb7-4a97-4474-663e-08deb9b2fe8a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 16:39:15.9785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYxhh890cAdYla4rY38uU63gM7y3pEpJ+ZjbB4vteSiJZqU6ozAiZHkd/lz/RO2IvcQWoBXsKSvR+9u871/RZW3L1td3HBl1ja8N+DE0ypQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10944

The test's set_capability() function needs to set CAP_CHECKPOINT_RESTORE
(bit 40). But libcap's API (cap_set_flag) didn't support cap 40 when the
test was written - it was too new. So the author worked around it by
casting cap_t to an assumed internal layout.

This worked with older libcap versions where cap_t pointed directly to
that layout. Newer libcap internally restructured its cap_t opaque type.

Since 2.43, libcap natively supports CAP_CHECKPOINT_RESTORE, workaround
is no longer needed. The fix directly uses the library interface.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 .../clone3/clone3_cap_checkpoint_restore.c    | 20 +++++--------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
index e82281efa273..49fb2edd5a7d 100644
--- a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
+++ b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
@@ -87,15 +87,11 @@ static int test_clone3_set_tid(struct __test_metadata *_metadata,
 	return ret;
 }
 
-struct libcap {
-	struct __user_cap_header_struct hdr;
-	struct __user_cap_data_struct data[2];
-};
-
 static int set_capability(void)
 {
-	cap_value_t cap_values[] = { CAP_SETUID, CAP_SETGID };
-	struct libcap *cap;
+	cap_value_t cap_values[] = {
+		CAP_SETUID, CAP_SETGID, CAP_CHECKPOINT_RESTORE
+	};
 	int ret = -1;
 	cap_t caps;
 
@@ -111,14 +107,8 @@ static int set_capability(void)
 		goto out;
 	}
 
-	cap_set_flag(caps, CAP_EFFECTIVE, 2, cap_values, CAP_SET);
-	cap_set_flag(caps, CAP_PERMITTED, 2, cap_values, CAP_SET);
-
-	cap = (struct libcap *) caps;
-
-	/* 40 -> CAP_CHECKPOINT_RESTORE */
-	cap->data[1].effective |= 1 << (40 - 32);
-	cap->data[1].permitted |= 1 << (40 - 32);
+	cap_set_flag(caps, CAP_EFFECTIVE, 3, cap_values, CAP_SET);
+	cap_set_flag(caps, CAP_PERMITTED, 3, cap_values, CAP_SET);
 
 	if (cap_set_proc(caps)) {
 		perror("cap_set_proc");
-- 
2.54.0

