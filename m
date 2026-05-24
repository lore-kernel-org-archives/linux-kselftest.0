Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023097.outbound.protection.outlook.com [52.101.83.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F1305664;
	Sun, 24 May 2026 19:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779649751; cv=fail; b=ebdBGSiEN/mYKjmWDL/D6ITV2GQcxuKoVtuykCZVbFfDwWP4IzkkJFSCaJm2obHDj+qgvuO4K8srpq7yEA3GFPo/aE586aNYg8I40rHeFpSDrniBfgvCKiQije1i/r98r7EIv4gPV2YPcODtkLj6GyO4QiBYd9qSqKSDGN+/kas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779649751; c=relaxed/simple;
	bh=T2i6gHms0ZiKp/GOX0RcWotK2iBF8tXJQd93vBUvk70=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Nx7eMghSCyal/5iOAFJWrTnhu8Yx/B7NeiCk7JquOM15Efqgm4NxAsNFHPb3X3Bw94yE6YEoxtNr0HrA/wWi1QlThunOmOab1gkk3rDQnVN46xLcRdq5CWG/QwML7rCQKubpj+UfqQYkO9kTi8wM1DctSL9Rn+G72H3cHC9iD/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=0cue4X/e; arc=fail smtp.client-ip=52.101.83.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="0cue4X/e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMPdeViDRMUcaUS/7yrYQXdbV18g26RHO2/W4exFoMpimmwnMxOA+5tpLcOkjXmwSZ83JQuEF9SLrkUX7er+QSPQ3W5jE46rMPS3JHl96i45sxF01dNzfpPxKC9R3LMkjbcPuziZqzc9CN7/BDIAQI/eqTFoX45wkjCYif0Z/GZohiayR8g4lEvx+3yofvWBH8Mn0rqBSL/JqBIZMKcUEgO0SoQtBj2qXyN7LdXyp1XdWEGgUrsHafux8RFKCY3pd2tGLJotGcW03MQAFZlkdeq+9gd9VbK0XVfnLJGCva8evlLeUYXvSvwwXvL2gUDwYpYZodmZwdkD2QJBG6Z1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoG8NgQnsf+f6hJZs22fj8EDfFwkUyFRzVhI++YpXCA=;
 b=WuL4bFb6phLW53b8B1yvoQZsfFYZvlbJ0smoMZVMz+avtjacC2iWAIqOVB9DXxg61MCBuxVnJAMJZxxMwa6bS2RDv8Aj1PeVpqrTX26VKIoKeXW9FcPAH8T4/sX1Un6X3PEHMBDq/6C9+/YCY2Pe/pBGv5n5QcIeMm/DDnj+bLdVI5vkPRUV84mCgicZtbECZALBfgBMqvJ2gEf0dStNNFQmoYzJZbErFYXaxkhX3vQsS2HJaOL6QpoT3oTmTetRhFOrEBFYVVzGrHWn+pdsf/uILiMn1cUKCX245BBnj3IPr3NeT8d/gRM77GH0XDYs02VqdAqwlbu/hhjPJ5mFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoG8NgQnsf+f6hJZs22fj8EDfFwkUyFRzVhI++YpXCA=;
 b=0cue4X/ek4XwzKp9pozgLrsdigIgJm9ZSZtwdGi3UZM068PGR/WzH5i7G2AfqAKnzyynZAxKVu1v5n/jyOC71ZII2M7m9wwXZt2+hdQpoh8A2LPVNwYXfAGHtwvPUGFCP+y6U1X+qZ5+UKB5gDYO4B2/OUl4bQfTs/e4wBiWdnGwQo2yEOMXGFWaiT8GYP2JXFa7NGLRp04I/VJ+orK7cD7KRMBwGJAQKs6jUr3M7mTXAtLv9vCOqBWuNFlFMpVL1jZRsIR1bm/UCbc65GhVjMphYBi6r9t/QrbL3XG6U8pZHObaT0HrG/FVk0bwR5pk/53ZkYBBJQlL/6bcP6TsSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DB9PR08MB6506.eurprd08.prod.outlook.com (2603:10a6:10:263::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 19:09:04 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 19:09:04 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: shuah@kernel.org,
	brauner@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 0/2] selftests/mqueue: fix compilation warnings
Date: Sun, 24 May 2026 22:07:11 +0300
Message-ID: <20260524190844.46196-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-Office365-Filtering-Correlation-Id: bf54b932-0ce1-48b9-c20a-08deb9c7eba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	u+wIocXJsqIC684F+TVDTkAVj226qS7ivRzWg8FVYgUvUI3OPhR4rarUBI5w5YDB0qwz8xyodKWvQt/XnSvzY4AXavMGEIr3L8DCMuyKeDQmHIjcLhZrS+plMdcwNUT3bT+wppAtECvVCkjtzTPnXYVoG4wXVAuTGmEZCz4I0TpK03Xv4cAXxiedaag/eIpdqur2savZl8FkoDgPuK3gkmDCeZ7t+TwIYEMeDvyOYdO9MCfbrItTTRX3QwSoghMU99dkQYEUxBZ3S8o90MiBJfGmTFGKdxMqsBL/yvZ2Mgta8ylLfKDefbFDolBu3Yd/gyhhU7vsDRnz+iBztUoFmTej6FIOU7dPdP3CMpz0Z4Tz6Y6NYPt2Q13ZbJd8Mush+4iMwFLZRr0Ftck5RAQaipwaHNKIPgtEs6cZ1Nx4g3h0OibmIjEgU8u9x3mbzwmcPJwga9PdJKcknOJxmb+AM14FkDGFMOvvAfnz64OGydB4TsMQ1c1wnSlCFQzfTaEc9QqFXiV5soXMquf8YBroJIqDAJ7JnJLvYxYlG0xTb6K7wdReBY9tDW7M7Io6Dtw1sI7DhDURJBhXeHeb/vrFwNUsJ8zLJkpxmHY4jDRg394vpmDu3DnjS2IiJI5aQHNNlyQd/oXX9i5oeGnIW0HksIk+cHmBjbLMY6vH7gvMf8EP1Pf9DgVlu1/gKail+RIl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XttNOun/Cso5iI02sfn+qfahsoIrPHeWCuBGxjYuwcpAkpeRxP73hrbHH5M/?=
 =?us-ascii?Q?Wj/etyyTqWvzpDkzyaLq30vPDsAuGeFQsYK13SsUkLiwjZ+SopDNcwfhxcIv?=
 =?us-ascii?Q?Jw2nMRU6zKJf9Bj5vZP0te+I2B51khPTYPSsjz92yVtSu9EAXsc26ils17My?=
 =?us-ascii?Q?0frFVltfWq+h8AqUQgkCCZKdCE6Xu/mgGr9vzi0DcFKzYS+MLv6LAqzs9O/u?=
 =?us-ascii?Q?G4f3XnT/1zTBnFcHamnMC4TJdh/bT8KkGL4CocB6O8ElErTEKT1lvpCoT4+E?=
 =?us-ascii?Q?NecCT3ZRkROoa0tmW2CL/m9/eZw3vreI91STlaqLtcVW9ntaBrZHeSp56S9I?=
 =?us-ascii?Q?diZiE04LyWFgvgvZfwTg5c//1jKGBHk2QNk7S0jxuW44Ou39neEKaYfeHiV1?=
 =?us-ascii?Q?YthrZ4+PDkVTLhvDEoG9EdUH7eDU7h88Vtnk7QNdnQVMiZDbKLXZi33ZaMQU?=
 =?us-ascii?Q?6pVMUMCgvNqVLmI+VZapL2KteyZSvaOAK62RjArzL/v4LHSJzomhAODCB+ts?=
 =?us-ascii?Q?igDdzs+XatP+lyvQEoP4KF24oRe8bn/ARvckAd7mb3u3Z36UfIILflfClwQZ?=
 =?us-ascii?Q?O64SPMaA69f0Ps7cWJ55KuINRaWjryriZnleYaysZa++NaP3pYunUL4g5CTL?=
 =?us-ascii?Q?hA2vCAcuZzMwjv1W6fFKq+xMsuQDuY/gknBqp9aZFkOEjd/YAtz1dMNdo/3y?=
 =?us-ascii?Q?roy19WhRSp6aS6s9SszT1t7dtk/7wlzS590lO43lI7mr0/VBTA98//3lHmKL?=
 =?us-ascii?Q?z7VbH5+MZCz2qzUeJS5z6fFHlZ1NdfmujwAbkxMKJLmhHpkCjAAuGTIe3dam?=
 =?us-ascii?Q?z/c3EBPtNsUxe9GsFmEt5GICQFc+WwYTaD8nnLvU/2/NqWOKZHM+mSs+u42Y?=
 =?us-ascii?Q?6kPM8cCRjXOps8P7lIpgRytA7yb+YNddvl0yYkgrC5UIZMRPDS00nd8DaHEQ?=
 =?us-ascii?Q?8B5RIn+P1W/SUge+i826r9l3UIehm7cWuZztcoRBDNSOUdL3vMmpmwqZ1XWb?=
 =?us-ascii?Q?t09VUVhpz0rU3fJpFDM1UBRVYaDnToCS6cw9ftaqxfCHGb3RkdzZWp6Rlycd?=
 =?us-ascii?Q?R8BJtk6f9XBUguMj58nAuHjpWbUEqVL0Gf+Mk/iz8V/IYUolSCwc1/MgG57j?=
 =?us-ascii?Q?g9lbahV2sT9AjF7kgjHBUKrt7E9722OxfGv3mupXNYiVtrBbzGXIBc3bdm55?=
 =?us-ascii?Q?yCBE4CEe/jF8Mj5qPRJf38l46wOQK2FfPv99jkzjagGAu+nifwALdchFH4lo?=
 =?us-ascii?Q?DvkpnjFDy6Y/JaeEO7+iBSkzrrxauuVQUNV9HpH82KkhhUmayGFFhK848oN+?=
 =?us-ascii?Q?4ShSzQjIWzHQ92NQqKWBN0HJYzFCIUM6RS7gZfd3V7qcjDNC6sFr/pTSWADt?=
 =?us-ascii?Q?HzDLwtacwRfw0yzL82/EcRd/NeVQoB8ldZgnb/IMqwHIjfDh/BCGCQYLADqL?=
 =?us-ascii?Q?qKIAJyP6rGaFWaKKsLKI7xr7a7lYk2GXjmwOBvMh9qTaQ8iVleyFLQCnw0Am?=
 =?us-ascii?Q?U0lngqAVhMHlXLDfY1HVXkDVlPa3GDY+HDhTIjcB+AbOQ0o0+mTWRrr3J/rl?=
 =?us-ascii?Q?8bR9I6vSxQUQSFDHldqR2n9jx7XKz2W9aFmje4W0cFZdu9tBfKmv+uQz1ZZh?=
 =?us-ascii?Q?ZNqHUXebmgpPcN7OiuATF3tA4aVUxJI2Fz65BfrdJP9x0RMpGDYFmnnSiDdI?=
 =?us-ascii?Q?JYMePHWqKJNbzcuOcvpDOyLDTvxf2mUnUx8ikjHiqpzGby0tsVvX0GZTWPGM?=
 =?us-ascii?Q?EILFMeGMhu85nEYoRui+rK0wqQZ6dKA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf54b932-0ce1-48b9-c20a-08deb9c7eba8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 19:09:03.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3nKdJEYK52dvMxE/Dkrn2pf8UFYNhws25r0PKcusk6YgyGtkNUThJrubHPgdpXlnxBmXLPHnWOvYzNWQZ1VXDhNJR6Tpq8P/ONovck8Px8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6506

This patchset fixes warnings about unused but initialized variables.

Konstantin Khorenko (2):
  selftests/mqueue: fix warnings in mq_perf_tests
  selftests/mqueue: fix -Wunused-variable warning for 'usage' in
    mq_open_tests

 tools/testing/selftests/mqueue/mq_open_tests.c | 2 +-
 tools/testing/selftests/mqueue/mq_perf_tests.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.54.0

