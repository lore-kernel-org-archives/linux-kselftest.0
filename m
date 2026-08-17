Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204F7301719;
	Mon, 17 Aug 2026 01:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931395; cv=fail; b=I1JrfRwfv5dDmL+8Ac38sr0RpcF50GQRYGaNRy8gV2PL6G0nmFt1tV8YuZOL0QZK9UT89rqGETGGjkS/D8u5ntpIJeitxUU7UZx0OKGlAYsqUUo3+Kj+un8OL/ytHiMyI057OVhLh3QpCcL/PWYXlC1ZrnM0ZPGNio1jbhkFuzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931395; c=relaxed/simple;
	bh=G3c/Q29ffAfhYaa4/51SpJkbc+dtk5ejE/zZCCVz16Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GNJj+YLz+SQl7ynDHWHfoq5L0agO0kiRsF0PxxEvw85+jrhg7N6Qikczsg0w7ppjFGUtNtF13o9Al+fQRwe8RieqVuhwv7bVer1TRrYSX+PNGS8PEOCUyvPQGfxGryH/6woYJDfgca4JTpQfFDhecT1RmNHrpf73VB2xQmblyjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YaDEqVdd; arc=fail smtp.client-ip=40.107.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YaDEqVdd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pH87oKXCxQs2UktN17trAZkBIdm9xAhDdGbXZdVAakf4b5Rqudv0d1b6NzVBNVzjCl5SiWQkPgEZo9ycV3vsGZ7P3eEEmOnCX4uEXv24cCf+e64BbW8EE32iyIsv7jTf0EjQMzeBh3fHMMx0NKb/T3T8RKm7wV8o6QZO18mcW+S6syPEgA4PsONf7nLCUyTONrNOvfz+kHOT9i00d5OA2Rc7d8k/UbblP+iYZAtgTHBE7UnrkuvkNtj5Sv7OaRWH+Cd26qeXwQfzqDZtvK6PNpXeCBGfSslE3XJm5ZEQr/wIrLZ+aNLvRsXX4roe4IQozJzrE7ao/3q48G740CpV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lWFkp9Q4odc+ATOu4u9xlSDDLg8SfOYSZzi8IhBBtg=;
 b=WGr8MPbuQcb/yUEZczFkLH3BZdTpaDgoXxu6qXTR8oTjok6rebHw7pPAFlw2lmRRg+Ez58zFUsUOdQLZa4nwj64xqQNttHaYQ9mhSXck5ipqpnZJU7hmYL/+bM+aw9XabRirJgRPtSoojXzzHio3wON6wWHi1m9kj2cbSDjx2SKi2HnZ9p6TGu5vRvpUu7VAFOzOeHxDfbs+PTXQ9sU/qlZ7V4oU4wjKIKGckOwkmphilkcRyfRdMpNXyH1dEUMxc7r/ytnAK+GEjVrVNiEqFQQYnjZ6rLA0/jY7aWU89du+H6ZEfIopXglC7s6yO3Luwq8jtf4rvB8UIgnxr2iugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lWFkp9Q4odc+ATOu4u9xlSDDLg8SfOYSZzi8IhBBtg=;
 b=YaDEqVddhJRI/2ZZx8up8e0M+vadmUUMGJNBMVr2fIaz8qv/HehcOLQnIbE4yYpN/cLVN1cyK20HcYxfPyTuPnov8LTcd1kUQ1wN6t80B8ZmfC0erhXUMNYq6SBx/cds8ycOm1cOzlVk8A67qQv4mfqn32r6FPQPeaeVUIQIjyt1wDU0vVuzA0pGF1O95aFbgF8kv70FvLCH2pd/NR31bbWp4epKpfIM1Z4jflILUgXIOmGu7UvPOAMytofEhAYR/ovV/6jBZzM9xb0/4VUY1w9AiosW3OAKszBtxKje3TQcekYqABST8Uk3kYbXSvHXP0/zBhFFneIWYmugHTvTdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by CH1PR12MB9623.namprd12.prod.outlook.com
 (2603:10b6:610:2b3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 01:49:47 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 01:49:47 +0000
From: KobaK <kobak@nvidia.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com,
	tdave@nvidia.com,
	kaihengf@nvidia.com,
	rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: [RFC PATCH v6 0/3] arm64: expose CPU prefetch and cache modulation controls
Date: Mon, 17 Aug 2026 09:49:40 +0800
Message-ID: <20260817014943.10-1-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0060.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::15) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|CH1PR12MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fdc70ad-da6d-4400-745f-08defc01d190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	pVKc/GiYHEm8XjXLEUgbAfTedNQTrsiR8l1gyfqoVURbiGRfVMcc2nj//mQBlEpxZvo2DQiyrCQRjCmL/7FQ7iDBUFZFGSmXz27+BbDgWqZhxkFtkKsNaqQZoluyWjWyEQa01MycOJJnXd69jyTDLUZBfCHG5IRulIp6ZW3cflBOK5BUwAuhRLvDCuktrTE2AhDFEFB9R5zmvf2zUNkWLpa1/SilHHjM48ef729FESNXWavIU3Y+fOiSn09PZI6fY1sj6qYTc/JQC3otbN0tHBWT9+Td3QpTPHLhfg2HUco3mqpH4Od3zTUBn0bhMM94+NCQVdR+8FCR1lpYlFrlwCyVFF+mcSllsooz2hN8NhS1017N3ie09xOKpaYrBkyW4aFO7GAfXavBwjIwRw2FAMOyggUCqXbKeYjiTuC4w2rWPO59YKMjbEQ+SfnJXMkzcZumInCEz6RavlWBnex118tkTkTnYvrzPflk9MhEFKEOqu+093WpqBeH+Tbo6adeNZRrMjJQYt/0I9Kds8U4LPuh8Z/HSVc4NsScNWeVEjM2zb+VuLms7ijYHJmQMFr4/1NWPaV7eQLYv4N2pzIwSo4MrGZkq7tD5ba5yZPfR/2ByfCEscxHFr4lWHmOFcSFczM/PyPTGgwxm1wz6a/g1P34gldDq34PP/RVMtWCLZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UAywr0ajySr4xJEqxfk0uj4+tqr6MeGwnFUtyeRNEWd7ndn59zflp5vKivlY?=
 =?us-ascii?Q?WOCFeDjERGZQEMNCmTVNM9YJXatZRqv6StJWDhYjN/iY5bSsh9dMgkeWcWzE?=
 =?us-ascii?Q?0YM95SVoySwXBVVC6VKmUE1mZg1LkY0YqRhPPtRDd3OXD6EsBpZqZzhohdik?=
 =?us-ascii?Q?EPPSTZCaAg4/kSfZgAaQ/bUA8QwxDguMMgy16tcHBj0DZacsv/D8wpNJ5tWs?=
 =?us-ascii?Q?bAgAE/rffIwPdYOJmncqSR8VUoQsPXhO0oKkeEf6kRWG/6K5VZiNSEISwIRd?=
 =?us-ascii?Q?wL6/CD1S/NYgGC1f8k27OXeApkXuFVUh9JAA8ki/LQ45qTqsQc9I3hH9N5J1?=
 =?us-ascii?Q?/eCTuSlfum3R6xV62dd6VngHgQJIi76Sp24zD44VDEfZ4XAzyGUhfdG8vv0s?=
 =?us-ascii?Q?IVY1EJBXBxzsSpzb/Bu3v0tFsAcF+lt+P3lH4CFoMPh9h/zJ76e1lpqx6OXg?=
 =?us-ascii?Q?cutfxWlV+vNFvbPTCBBFNQfKO1imtxY19NH2coLhoGzYDtyJZoi5iD7SYYRM?=
 =?us-ascii?Q?AJxkyWQQR3I0lUFAZMWfJNMieRys2NC4K2qtBWsqzUGMraV/fOglKOcrrrPv?=
 =?us-ascii?Q?lkAjbutGVXg6hWLvNZDreMhORQYE4cAHxqw2hkEPUwJ9OBARC3UwWL0N3nQl?=
 =?us-ascii?Q?OMXP7QgqQS7iS7/vO4D2VvdzzTkV4O/OOCBIM69PML6mAEc+HOncVHvVW5yP?=
 =?us-ascii?Q?iRDK1e/xV60bUWUmY/OJkckWIK2agdSqFOu53Ati+dxBUorpmNevBFk9g4x1?=
 =?us-ascii?Q?pmSg6SAcX9SdGUNguuACIwOJKiAz/0fwYZVN3cYkNE6oGNlUEYmGeTeWep6h?=
 =?us-ascii?Q?gaVd6eCF0enlFhm6FRp1lTIDtDvcGJTGTOwCutqYceNvhPUPQ68ig69dtv2O?=
 =?us-ascii?Q?cv5tnT8JBP6iNKL+RyTocM5DD0joSq1/UNX6+ej3Qq2MLKWspbl45yNunBE3?=
 =?us-ascii?Q?Pd7RKdIULJ/u7pz7/FFpNvgrAwCCWXb4CTc5fE1O/oR0pSaySQZUuyaXM5PX?=
 =?us-ascii?Q?4NWUNrN3qQAI7P6sVYWPop/SQQ4YtRWku5YBnen6d6t0Y+024Yi/nR8n65Cx?=
 =?us-ascii?Q?2AO3D3BJyS1i0HbRL5tYQQE3dRO6Wz7tgQ8wWatCZ3ujnn9mlhINeoEFYNaW?=
 =?us-ascii?Q?cZ6KgDGRFQ6Xd+o4xnn+UfEEc28Y2h5Y8yzZyZjIZwnMFeJ5PgKA+293W/Mt?=
 =?us-ascii?Q?8Xkr1hOM+jP8ZJolyuHPOH1DkIbUyjJbx1jbrVeFGBZAvJ2WoODwRrq3xzEl?=
 =?us-ascii?Q?/GXPCLfj3kcZVZK4VVWvY8+/Tgtvb2zaF6zVB0PvKHm6QIICd3tHhD+dlXm5?=
 =?us-ascii?Q?9x16sDJnR9RtT5lyjR2i3WpO68gws/EhEDMQEzLkUau9OAWvdcGdihbOvvkF?=
 =?us-ascii?Q?1yV+ZYS3RqXGJeKWri9FFG3P3KsxoAFXv5KBVX/+G1qJXRGkdicLkWUoozWt?=
 =?us-ascii?Q?iLlgaWp6I4k3M5NAF+y0Sn/+lrkUDJKI9tQQOuWVaeoHsKF3pTsMiRsf6zIM?=
 =?us-ascii?Q?mkDJGOh24w6QJL24FZj9r7iF4ciNB/UVim7EVLOxDsSe7tuvrKMVjEAJzctd?=
 =?us-ascii?Q?c+FEFs9PTMn6nKttV39z9chY6+pMLlY11e2e+MAr+WBxW91c5qSmoSKGFaEm?=
 =?us-ascii?Q?UweMI7Nlu4tmOfDzzYZf2tqr3vOISm2ZEZuW4szfgLf5d/qcon3kfpPBJEQH?=
 =?us-ascii?Q?NbBzs+ORtKmyAfq1mHgqZuHCQs14Fh1shL6LrgykXId0Oeq09EBFch3y8GnY?=
 =?us-ascii?Q?vX+RPNgSWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdc70ad-da6d-4400-745f-08defc01d190
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 01:49:47.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQwtnJV99IvJypo3NHWr597pIQrzRSOIypAtlGrDIO4DiZKTb6YiuCQfBu1oOthcu0ZmLmvUieEmxpGUjQ3L5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9623

From: Koba Ko <kobak@nvidia.com>

This series adds CONFIG_ARM64_CPUMOD, a default-off arm64 interface for
controlled performance characterization of selected implementation-defined
CPU prefetch and cache-management fields. It exposes a small set of named,
per-CPU attributes under the path below, with writable control fields
range-checked before register state is changed:

  /sys/devices/system/cpu/cpuN/cpumod/

The directory is created for online CPUs whose MIDR matches a recognized
Grace or Vera profile, with common and profile-specific attributes selected
for that CPU. Register accesses execute on the CPU that owns the sysfs
instance, and CPU hotplug creates or removes the per-CPU subtree as the CPU
transitions online or offline. Unsupported CPU profiles are skipped without
blocking module load or CPU hotplug.

The implementation keeps each dynamically allocated kobject in a private
per-CPU pointer, avoiding use of the CPU device's shared driver-data slot.
The documentation defines the ABI, firmware prerequisite, and hotplug
lifecycle. The kselftest validates profile-specific layout, unsupported-CPU
skipping, decimal affected_cpus reporting, value validation, optional
writes, all-online-CPU coverage, and cleanup.

The controls require firmware to permit EL1 access to the relevant
implementation control registers. This is an RFC interface for controlled
evaluation, not a general raw-register or production-default tuning ABI.

Compile and static verification passed. DUT runtime validation was not run.

Koba Ko (3):
  arm64: add CPU prefetch and cache modulation sysfs interface
  Documentation/arch/arm64: document arm_cpumod
  selftests: arm64: add arm_cpumod kselftest

 Documentation/arch/arm64/arm-cpumod.rst       |  89 +++
 Documentation/arch/arm64/index.rst            |   1 +
 arch/arm64/Kconfig                            |  17 +
 arch/arm64/kernel/Makefile                    |   1 +
 arch/arm64/kernel/arm_cpumod.c                | 471 ++++++++++++++++
 arch/arm64/kernel/arm_cpumod_internal.h       | 113 ++++
 tools/testing/selftests/arm64/Makefile        |   2 +-
 .../selftests/arm64/arm_cpumod/Makefile       |   5 +
 .../selftests/arm64/arm_cpumod/arm_cpumod.sh  | 526 ++++++++++++++++++
 9 files changed, 1224 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/arch/arm64/arm-cpumod.rst
 create mode 100644 arch/arm64/kernel/arm_cpumod.c
 create mode 100644 arch/arm64/kernel/arm_cpumod_internal.h
 create mode 100644 tools/testing/selftests/arm64/arm_cpumod/Makefile
 create mode 100755 tools/testing/selftests/arm64/arm_cpumod/arm_cpumod.sh

-- 
2.43.0
