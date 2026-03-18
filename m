Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023114.outbound.protection.outlook.com [40.107.162.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389A43D6492;
	Wed, 18 Mar 2026 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836542; cv=fail; b=Bx8aD3plq8pCPekZTpQjrZC5yPe8IIhwXAXoH/pSxAhPr9oGCIYJ3Jr+V0tmNAHfEZgm2Q2pg4qH6AF49v+/t3Fcd1wS/GKF4sdxDqVZdRx+lBK3M5YvtEx8ZP+4uMABYzrwVjXzCi17Fym5j/qzJjeDqHvDW6PvL4gQgwXm2SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836542; c=relaxed/simple;
	bh=s5YV7HHCyC7AajMatTwa/5Klcsj/4DSAC5gsbpm1hkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uuPjY0KQBiGejGI18LFDK6TD9KhGZiVchkNh5huf/vg6I6Jp11ZZGqNrUGikh6d4x/VLT+N8VGuHjgLWMwac0O2gy+C5Aef5I1ByA2qaqMuH9vF5CKjLyCHBIiQeEbknj5x/GmgsAZqbZkppJvkq3DJubqFVA7fS5nilanSRn/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=umXmStOL; arc=fail smtp.client-ip=40.107.162.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="umXmStOL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpWtl+zpKKeS/v5ngTBQtSn8ARKdZF9oCeT70ACs2EvuX3dSEEoYnzJUkHGdNPnUqbMjyVNN1gw/nJM5XjOmErybqDrreQfdK5M7hXBsNDXlyNySypg69R9EKG1mTves4xTaGXvLxFsKfOWnHGnHqI/XRHsPQ7OPVR1vK7UXJJTi6UKVxt/rszlJsEuE/n1yicCdn0HW90H1apU344IfH7tXfjUtU1Yqp44n3nH9NG3MTPHHWwiWCr7RQLiWw2R3nIsM7/XwUsLXz8nuYWFBBWR90il6cAr664vbtqo6rSGgTrt+umB9pmSEUHeqp1NU/Jg1p/Db9ITJFoMsSo2leA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE4zBXXCy3DcA9x93Ac42qtXup8Jlc2TBs91O/4/CiM=;
 b=e8b1ZbBJSPyJUi3V7ASRqCHj3U4BMJgsCQiFQbUGGPQBLkb3KqcNf6vwqocL+rzdJia2sKgDpRi5HT3Eg0UVjGA8gfxBatHLhXOf6JwMrej+if6dT3lrN/eE3ZyvA/wwY52lTfA3t2KaaNxYOxZFgnGqsM+xv+VuRie9MzVgWyb7zkRmvqs8XR4BCcMxx4bPDEpGHmXSfbDCdMsmHylyat+W5m6ZG0sKsC7fXAfXz55EpW98CdHyQ8eFfU4+t/t6zFzUawx3cOyhpXN/nLKzNL1CeANbGSW5vrEZhNF/E+MVebrUEQFeMJetED/6o2yv7GQS5AxUvumQDoB/bFezeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE4zBXXCy3DcA9x93Ac42qtXup8Jlc2TBs91O/4/CiM=;
 b=umXmStOLJgtOHIhgakpJvXoBn07fyq8daGW/pNappU0tU+3IKChsFeUeQFkoR2sV3Ao3KWsbgcipSGQFyyHp6RvAJPNs0PZB+v4Spztnt6ninJ2z6wWbVtQcg3phEMHzxJf6VV9LYqXWQ6Goi3MpR8Z6KOSELAwE4nGHZRjAt8pT5kPfhqccUPPOyW074DA6zrqKITRmpPM+hCKweTM5TnJO1sfqVV0dPp3055zOIPMo9/Q/9LsXN7P+U7g+Epxcx+nNtaraSdfIWasTWquJPWzD7RMocVf+C4/vD/FARurIN4/TxeZNMAkx0Td/2ICsJls2Yo43gVyK5fhm4vjsBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by DBAPR08MB5830.eurprd08.prod.outlook.com (2603:10a6:10:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 12:22:15 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 12:22:15 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jan Kara <jack@suse.cz>,
	Oleg Nesterov <oleg@redhat.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 5/5] MAINTAINERS: add a new entry for testing pidns init creation via setns
Date: Wed, 18 Mar 2026 13:21:53 +0100
Message-ID: <20260318122157.280595-6-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318122157.280595-1-ptikhomirov@virtuozzo.com>
References: <20260318122157.280595-1-ptikhomirov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::14) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|DBAPR08MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: acbb3d7e-60d4-4d74-28d4-08de84e8fd30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gQhYblgzAD57+uzPA6wukGUJH7vU82SkqBW8zQh1pL/jYiwK9g7kgrDEj83FJW/KFNzO1B9AWgYPbrzMaUAe7QWxc5QJmafC0gqsLwUXE8K832iHAtXmNcd0oSYrIy250PNLCAMguXxeY0R6J3La2Fhlks80+H5QuQv6MLNlaW6Han20WsSrr9U8xnxNRDjUWstWrNiY68wzaSyWz/FrCte9SLwsOxlTUzWoySIQR5UA4e1GnHFg+yJQmKjlH+K/8P4pBnF6zVPOHt4AoH7/eKdO5Wj+EDonobaXykAHJkH3pkwcoFsSjwixXhMpB8+ZkgcuurGXIs3YcuBRdqtLo+CrHeLU76s7CR4HPMQMil+2plz7RTgBjlAAWbRI2OpcbfxmBbV7JcJfBwN/AwDiVvb2q4O8R2JpDvaie0bo1ScnwAh5dG8hkU8j/nI3ed2COiamXzMIxjoswAFavFVSdPce1p6zHvJvPNoJ109LFVVvIhdAYBBWIa7uIGuvVTI5sHGd01cMk30+KupqI/CayCAu3ehrGeS+8xtPrCFT1WKuJS8l2ufu+L+Hu4jMdBpkil/4XiRhkb5sescb8Vt/FmNl2iV3Z7cOhnMU6aAqedV+pDWQYU2VCADVwAVqSh5VAGdLuRRiyU3+DCUpEvxDecoBOZ5TcPyIuktJ7yRRsSeFWzCleZSlwIEgMUuhD+35LjIHnSbN91d7Hl4GMXLTtr1AJqTdnqc6KVJApQ6n4e4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ldWgO/n3IAgjS1XCOg5+ckKozgseS8xwJCnzb5cmMXU9PPm8tV7LZJOd7MWe?=
 =?us-ascii?Q?gj1McvPKZq8UFGUO0E0eZHql3X7J4xc/qAZCaH28fhmc11RYLfZX59DOsfVj?=
 =?us-ascii?Q?u+MxjBWgBfYh76vBpkJydBSRyEWlNCAWe0fGP5UNNALSeJUSE42NCO/JaZiH?=
 =?us-ascii?Q?Hv2dCvHYGvMZ+7l0MJgE7Z5M85oksqNlz512WzkxLPn27HSiY3GzbR1gxY73?=
 =?us-ascii?Q?1zVmb5NII02che/w5P7gZmbUDINycrhr1835iW4RuLebROpYR/0eimxwiDqP?=
 =?us-ascii?Q?5o07FF9Xkce0wZzD0e7g86Zy3rvG9CT/ujq/1B3AfY5Pljz7ibDcRbBlpPCu?=
 =?us-ascii?Q?/A6qVseXRtwGKPTL/1rwLD+N5RQIex7iAT7b6unrjC3DU5uOEuqZucUuhGrp?=
 =?us-ascii?Q?3dkO4Qp3vGAOTXYBT4PdhHFkYeB9ZEIMBa6M7mgh9JtkHlf4mt49WWrB/MAA?=
 =?us-ascii?Q?aJplcaoUWLLBGDGAWcgO2zlS+No+6rtX1IL34LQyvDbYDv77+X4UStooeK7x?=
 =?us-ascii?Q?VuSZwZKdA0MRi/oPoezPtJkP9Jvca9d9VHqJDl7OTuJ42UEiMRHgrJK8816A?=
 =?us-ascii?Q?gCLnYQY88HuphsxJ+u46Byupuoevc8y4HvglRgMVEt0jt2N6MlarWJ+fDDsX?=
 =?us-ascii?Q?Fq1hx3qwrSlv8BGiw4XyHQzougkDKlIE0oKQ4bs9h4X2Hdl98HhgkMLeICLf?=
 =?us-ascii?Q?JCSjxuusEbBbpriO2hVaVIvgW/ey4eurSOw//hxlkHNVRZ9TZcY7pBXrWU5p?=
 =?us-ascii?Q?weB3pVyQbN8KKgz5QpXgr47VHeyNCBxpJn9p6NRf4LeUkKI/7goS2wt6niHy?=
 =?us-ascii?Q?r6FLxQiMx6EpiY6JmqNrdWwkPVPLbBTKOYQiOtOhAsBEja5tL2KZKiSFuhR9?=
 =?us-ascii?Q?wngGSurcn2Wuaq3Dh+8t6Q7A2jD7XqS7Y7Nx5foznxTcUYAC8+p+EboYHjVo?=
 =?us-ascii?Q?KA9Jmg2C1S1fZ70miDeqddKx/Eny2HNiklT+kupH4PicAD/Zapp4IhDpkyTV?=
 =?us-ascii?Q?O5qyJi1udRbqemmSOn5jpld9sP/Bpqk7fIfKQ1EeNFQOb29pJmJLp50u+Aon?=
 =?us-ascii?Q?MimGKb7s5SsgfL0JgexxDhMUpLi3X3VRWgOUh4rTFbX7CVCXzh/k6gca8gIa?=
 =?us-ascii?Q?EhMbM6J7ZeedbXz73M5gKcQFmKey50jNLyrKmbLd8g3xpP6UuKmDHF1/ndDW?=
 =?us-ascii?Q?Esb6BTLqIp+9G10BsoNimsRpnZIlsYaJRgMmwbAQ/vUsZD8+J8vHDHgf7KJe?=
 =?us-ascii?Q?0lBUT75KbPBmPVMihn6FsxLFnYyTBpc+AMNHOYxPBlYGWi5wFCGuEAk1GyOp?=
 =?us-ascii?Q?rjO/sgjTGUaOO+kbfyOGZrLPQNNy6kNh241bYc5uxm0pzipVS45zPK/tKQtz?=
 =?us-ascii?Q?7spDuWWEc+87OMW3UtFwKxe16BZ/7sv3RWTRm8Do8IejNVb2/ylYlYA9kcXZ?=
 =?us-ascii?Q?YZGkQlYfirVmsqKFopQJPppPeLUgp3QLM5F3Z9crFpmAN8zs070ZLE8PRC03?=
 =?us-ascii?Q?ds2qZh+yovi3JvJopa4E4yeNZ0kQhEqmBYbuHdtr+R/pFFXlOgZ3ojfpu8jo?=
 =?us-ascii?Q?fgSSQ1JzPLENDuvExraWd7wH6Qp8VZb6t0K8vQQIHdxlq/AwdpkNHhk0XXNR?=
 =?us-ascii?Q?2619sH+CVpv4iosaHkM85CD8C92/mYhvJ5cmqFk7NG3duoNZ9PstGOddRkOy?=
 =?us-ascii?Q?5joZSeOcb1cnYMuhcgdxyEf2oTRoV5iL7W/mGBxlNpYo45LVcpEg8UEDM2lb?=
 =?us-ascii?Q?sF30nvI411QxmbC4WN6wlKY4Ba1DGtkgjTjIKyyjT5xriAsKNBCiOXrETsfK?=
X-MS-Exchange-AntiSpam-MessageData-1: /sbaz7FS7VPfT9EEj5M+/kxfdE/2MhiZv98=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbb3d7e-60d4-4d74-28d4-08de84e8fd30
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 12:22:15.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G62Vf23DQfzumcd0M1qlotRMDe31M6UAy/h4bviUDFCy7mJ+C8hwmoUlXRqSgDjVvShDZB5+QCdKtEthsWA3t8yT+8e6nSCYp4MuzI6lfPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5830

Add Christian Brauner as a mainstainer.
Add myself as a reviewer.

Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

--
v6: New patch.
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7241695df96..215b805d4321 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20766,6 +20766,13 @@ K:	(?i)pidfd
 K:	(?i)clone3
 K:	\b(clone_args|kernel_clone_args)\b
 
+PID NAMESPACE: TEST INIT CREATION VIA SETNS
+M:	Christian Brauner <christian@brauner.io>
+R:	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	tools/testing/selftests/pid_namespace/pidns_init_via_setns.c
+
 PIN CONTROL SUBSYSTEM
 M:	Linus Walleij <linusw@kernel.org>
 L:	linux-gpio@vger.kernel.org
-- 
2.53.0

