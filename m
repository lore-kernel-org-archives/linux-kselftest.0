Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023114.outbound.protection.outlook.com [52.101.72.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A583ACA40;
	Sun, 24 May 2026 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640764; cv=fail; b=WPMEc8MvnqueM+dNQmRsjxnpF6rR7LyC4pQ1M2rx7Nurqkm7/T6n7/kswuFU64R9sWmJGm/0cTW9Ec0BTCWJKnAw19BP70NYvulVUSj0dKCNgZ0ubszO/PYqE2h+gUwVgF+VRV+cjAh6pYj9Vd5YPT3tCdLGsX4zfJjf1MOEzNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640764; c=relaxed/simple;
	bh=jSZlw7p3zxmS/9uOlwLVqlf/rJEJgla8egm7ecdMMao=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X6PY4Z9tVo+XPsxx10QFAQ5PPcY6SWFyKzj2CxSYXGpKoBJW8C1WQYfipXgEEZu2IKyraz5ca9sD2JGpZO6gRb9JVpSZiaQfsrWm9PLeI3ItjitlaaoqN923T9daD29rPr5WCgt2E4GMCWH2ZZrQvTeU6/G6/E6ZtX2HFAFiQi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=ePGluiqb; arc=fail smtp.client-ip=52.101.72.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="ePGluiqb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbXys00cqoi3bUahMWc4Fn3/YBneiQY8VwLs1YbmEAOF62KMwWjwaPvRJlkdMB9e0P8rZMXasJc6IS+4aeIwG889uFBgH1KquHxnbnesKwz9RFDfcdGmHfhacE2PUfOCst1FyIC3wP5LDl7m11v7HFNvphvGs4sR1J7qtFYJP7vGgLafxciZCi7+DtQvjpJ3wCDcgv+IVfKfK6bUN29pWh4p7ah5vFXsj6sHZUPaU6jDRBujsa0JX2fHcHMTThKrvU+Djd8219RlbjLDC6GXGdH5rQ5ktx9GKBu8OPNv2JPUK13RP4gc/gbjmV8YEw1cuzEGRW48yrZ8R4yc/oUm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhgdQBpSyW6XK8zZ6xa8rQodyJJrh9PDckYkFLV1aUQ=;
 b=n4ZSBW77fYcMxp6OJCfDx4uFoMBkx9gQe0NEablv9yb6eO32k/X9weUTe/TTkb1/tbpfkSDHTUr9h6twLWCX0HXDZyxABDYPCR4HLAu4dZPl6gvvO97gic0IuU02tw4TI6WI9wfMPXK0fOSUNB35bY1paTlmxbggrFGzNPybMr8VlUxBA5dTeOP/2+lCUBPpqQ2/tcRm5RGJG3+qyewvIEf0rqJfTqd8rlQthu8Bs7dQRWK/0JPoSc1v3kk/PoFkNrEEcFUx6QBsig5fr8KPG9R8OHdbd7XfRE9toljhsIBjGBhNnbBct5q0nEmA8/LVhLW+VlkZ2mExRgD5qmUjBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhgdQBpSyW6XK8zZ6xa8rQodyJJrh9PDckYkFLV1aUQ=;
 b=ePGluiqbPUSCBaX5gFYQsAtmu0tf48gkszy3Vw5wO3vlf38psiVODcGiusEUa7nOPJSKqoo1ToPzd2QEp7zBzRkz+E01ev2FrGCqwOfVgHOR/gpfm+FmeXA6065sIPn81iCaLkueWfucrJf4jvIMRT6RQD64VeungUnFx2rV7jP5PbsSJshVnCholRb2lxWt4/ubLLUL86FepP+KITDEF89vcDL9ZHr/gQVbpAJIWTH7SDA3GrqIWorVzZwt+MB9hVre4aqM8KgjA0BeGw9nFpJNmIO51sWRIAj1GuhAI8u45Ii099Xt88AKLHQYXhKIgkzdOoNHyn+D1zbx/VA4MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by VI0PR08MB10944.eurprd08.prod.outlook.com (2603:10a6:800:257::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 16:39:15 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 16:39:15 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org,
	brauner@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	areber@redhat.com,
	keescook@chromium.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 0/2] selftests/clone3: fix cap_checkpoint_restore test
Date: Sun, 24 May 2026 19:35:48 +0300
Message-ID: <20260524163840.34247-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-Office365-Filtering-Correlation-Id: f40ae83f-22ce-46c6-b743-08deb9b2fe1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	www87OOsYcXAA0QRpIjHct7gh6tAfTq4NSH8p5KULx3xcu2ymcT89cyZyk04o79ZwX+gHu1qCTU6aGi6mMytdE5b5r3l/2fDuh88GA+4LMcvA70Kq6lRxPqoD+CgbS35vxO13q4tn2xLU1Q9PVDbn08MEy9luNtnsCUeCCXGZ3YjWHP56Y9FzySjQL0t/RPgBtNlVxA5xwhTHLDzio7fa9SPxF3Z+XYZuSJJP6Lw70jd1OYgrhxLLAzftUHmeWDPnFaz9Gn7SNcUk8yurreO/bdvDS2iZcxwlgaGKLMdkivTnwrgqSFIj3Fy0y1CmMrB9uT/q7/f98Ydl9DnSvqeIaBYK1Cs76gWsMqmlaCoq2hZbNzyp1Tx1h9BcpLA3lQNzPyaU6FKXdNot07xabmNtZH2amvt09vnmT+H7q3PUKqKQWRMWa3MDK03EWNo+l8TQXqvURqfdeFAmMSpmcpIPeQnz1gbmDLc3IEZ3hnxTxKzbyGbAXm9DehAbzvLfkyO6QEDHHmuLHybhv84LiufwLRgEyLnexDk5w3YJBW6V3h8CJR52ptfggMOdfWL6QPVJZ6hO2cTxP+KmXBG5ExprdYHWXNvePXfrDzSlXee40/5AipcwzZ0M1EP6kCrpI1I5cKs0V+S+3UDpKUq6uqmSqAdZdVASmngKJ714oVq5N5G6cxaRKBfKCgKt3QunNBr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PvsEt5llOAGZZhcyIexev20bIMYfL5l167AEKqwCktCQudIqgPLzFcigIYJj?=
 =?us-ascii?Q?l+A/ztCQGPf54iTFzTVXWp8U9Ed1doJrW7w3ev57FLSpCriasHC3kMCdLoSw?=
 =?us-ascii?Q?JDrZNnXgmooewZ9bEWDo6kFLRkjaG2/cr5BKjO63+6HQLRprrZAmmREjePbN?=
 =?us-ascii?Q?qK7lD9lSLkzik9e63jl96g6YmkYscku5v+6PP3uT7YiUAq9kPfXYT8lFcjP/?=
 =?us-ascii?Q?2fMN9BSDM6XyAXnRbrl1Ho7biWjiCYI7k+N4FcYOFbl97m5Jbc++P9QAXdja?=
 =?us-ascii?Q?0t6HvNI4aejwTlQ/ubzjG/Nz8vHTUtzgS33MlxutXHn4KcvS61aWhmy6+Rsh?=
 =?us-ascii?Q?gDDBeZckVYRGQwBax1Ng3tSibW2XIEHdogJjIVrv1eP4tp4/60BRa/Y9pbqr?=
 =?us-ascii?Q?dUrryCUCdPrVsYgz3kmVAC6irou/nUw00AuYSUJ+WRX8zszZ0HkcQ0rpEZUG?=
 =?us-ascii?Q?wtAXeQYQicrC9o7tTpxVwTolvUryswf3YhHUyC7vsfv5WSB4YoKHVEkEt1bv?=
 =?us-ascii?Q?QMpoYY7LHHDvdrQBIuGBlhnBtc5Wr2TGYGmpUbWX7Lt6I1DocxwrGucCPoxs?=
 =?us-ascii?Q?PdRnj7VLlpAFvaJhgqgo/Ukxqxog6GyKni+ry4q/QHlx3ngk90EXj/CqTbL2?=
 =?us-ascii?Q?ZlPFUX7PILV1RTyC3MAPc4Al1lo+AeLCDkxg2H+Fx9ZG9QklUkc6y/gCSV1p?=
 =?us-ascii?Q?v2bY0Znzi/3GJ6cxSMd4GqDbQhbkV6N/IDNjY0fwHEdDqlBLmQ+i2brYzRLf?=
 =?us-ascii?Q?w76aCI/BwXmCEZyvYsWGSctv2agaWPQOgYHge7SJDQUy7LlfntvsAoGJZHRi?=
 =?us-ascii?Q?ffZoPjTo6FnIl8pLWWX9nI9UhWrHg/Y+4pI7ERitmaHhemL9K83DnU1CThJI?=
 =?us-ascii?Q?Iumaf2NAIOU8IUla+HpGJEFyFRbxNYsCvqdjprRZuDvLXkBDXCIIEO2fsame?=
 =?us-ascii?Q?5h4P5z3EGwFzZZqsS1lWbg23qFibiaKqX52rEiQOFJktYmKzrvdYnJxci5z0?=
 =?us-ascii?Q?YVY/FtHZTClHj5oq7DdTRTXlDKRE7wzWwHA+HXobtmp/AVAWR0PA9kKsSgkL?=
 =?us-ascii?Q?maRR9WRkWvBIfWm0SeMjLYysKGf6gt6OG/jN9LRVG+Z98ym7+he5OBY+y3FB?=
 =?us-ascii?Q?zj9DzrwYFcE6v/RY/K0aLdawI3nU+I4M23uRR3H0N3c9QTLt7J+ndhB76B/B?=
 =?us-ascii?Q?cJ0Ivv1SF1x0bbrDuD1Jq1GNYdjBr4af74+4aCCr4jOdUCowBUTXlxi2WmKF?=
 =?us-ascii?Q?eXgsNAdn+kFB5S6fEeDP7KnVnBVyk/4FH9pQLLWoMf+agVETlRwfULt9QK+2?=
 =?us-ascii?Q?01rGPfhRh2/e6vVp2MNvMjLyS95EzUDiYDHrdkGm0twhGYrruwmGbcbMqVjq?=
 =?us-ascii?Q?5Ux0JQXT6Bm4mcMCsPOKI/1N9Z1wY7EphZP51NOpDnWBrJOCKsPG9zcHIelr?=
 =?us-ascii?Q?KipQm3x4Icw72j9lJW/g1IpBoey0bmlRSxi3YfKBc+IDPDSDm4/i0MOdW0DT?=
 =?us-ascii?Q?XQjX4GG+ISS4yjg+4LETE3ASYGVaQnEJfw8yYe+eRJuraq4Ly7OhH8S0wzW6?=
 =?us-ascii?Q?vk7AgjFx6Oii1t8dqoqY2kJ+ozlGpFuuqVrLZ+8BLXaj48+/Yjv32RU0KJxT?=
 =?us-ascii?Q?HyK4Cwj8W80q5fwgwl/ITQ2GcfCSIsDdzL/DU0yjNvwBkdT4ZcF2UxFcNFzb?=
 =?us-ascii?Q?iPoO+Odw1bPs1K4dHVzh7CeDHJaKWXxNDUrsE2MI6HxH76WEJ+MB8HJAvcb0?=
 =?us-ascii?Q?NafYz4Qw1BO+E+rTh8RDhF/FDHdYJpE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40ae83f-22ce-46c6-b743-08deb9b2fe1b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 16:39:15.3435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1xkmGPmGQZFT8h1bI7q0amnIrP/GY1DOnFYmfjKnqhoXJmqaQn0zwX+1Jw0M9MV3ix0y9ib0vOi7dBqfhi7wNEc1S+bPhVrtwotF3UcaCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10944

This patchset fixes misuse of libcap library interface, and existing
compilation warnings due to unused variables.

Eva Kurchatova (1):
  selftests/clone3: fix libcap interface usage

Konstantin Khorenko (1):
  selftests/clone3: remove unused variables

 .../clone3/clone3_cap_checkpoint_restore.c    | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

-- 
2.54.0

