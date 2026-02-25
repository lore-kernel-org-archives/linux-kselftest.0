Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020141.outbound.protection.outlook.com [52.101.69.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DEA3B9600;
	Wed, 25 Feb 2026 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026381; cv=fail; b=u/lh0ObJVZ1qp9RI6zTL10dfSYqfuNgnH2yPwDu1/BCcJaCRhE1oFvuiIVEVZmFoqZD+xtmMGhBNPhEjmstqzoy74j0NYyWluIwFr8v8qZyf1H9AMg04FDG1VmId8Vos6h2cimcEGMiy3OKHTDuEQr4ZpQHrc9YKFBwaDuWfgWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026381; c=relaxed/simple;
	bh=x5jMj8ZgdlEkehzXChAE+CmW65wgY1tSASsqrylpUuU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=T/DjPEkohAr1pOVmleHTDHuWhS4+5wtkQDvzTwcSz+Uz3+++WxPWd9o0wjc1P/fVY3hQPnsUQU3JphB+F+7hxEjFKJfotPOXUS91HDoxXza8Pq4pEJn/uNaJP9LBu6juMLLI/D4gMTDw8XeE6kmwihRSlUpu8joqp/5vUJWuPVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=xXrtYVos; arc=fail smtp.client-ip=52.101.69.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="xXrtYVos"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+8ywzEtQNykhLpAEsu1CsvKtlfKvqAUTSkechCo60QwWPN2TJMsEwTu6TOyTJoYq7Klvn+didOXpRc0xl+Zqhqg0APWYpFsEZLsYba+xoUNF9An8zCOH3lLfQ0c3aLgsaDFAz+K1I3pZORKgkyeCSqBvy8VwZjiD4kkgOhFA/IEpilCvCjLsiWGvs8a5g1VSXXxpmsntPdfjPU6LN//BdfNl7oI4SGxAXENs//Zr1PFuPDxvtdkuTkaKKlK0cKY1QSYpo8pF1PFgccw6yXUGso5e/UIe7x1GUSyrkF1FDdiJtRK6gnA6E/GPVda8PQuJzfGYlLLJ7sCKTHrRLgx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j91xF+L5ASk/KmVLwlC5zoXqX+ORa3rL3FvCYalXWr0=;
 b=BXRm70AWmSQgom3loJWRC+jjZiGFTDG7bHIgOb30XJZMiSQ/r963ROtY8S63YiiGJrNr/EFV9VvclwHrKWJT6O1I8eLjMLp1RU2w8eBEdW3nVwuBkjEGdWE44oZnJXr+WLo8vRWdYDcS3HQBLn30RdD1LQfnMSMEXmfEQMrJ6DNVCKNxcHBxFw5sfeU12OxThljCyO8BSGKMKGccUObVrNy31BoSF762oo8dAOAQV66Ee4CvFQA0ub2nD04J9OeluoRAwPf95DHhFuomL35HSsgDizb97Ll/aYNwvJzQ/m61jl+0+Oj5jUmMDfP9OOuciNJfGFd9Jh9ESiXzhcWpAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j91xF+L5ASk/KmVLwlC5zoXqX+ORa3rL3FvCYalXWr0=;
 b=xXrtYVos3LOdoDrqSqeLk8m4TQ46qL8Ldod+S1eSPvVFRe+j8Y7+OaArMDLfEhKK3KT5OboZRi4jV5eWo8QtWrXDQFsyPvwtAwv2PEbbY/nGQ/l3HamVgYQSxk3uIjYBCfkssxl+vKG8kOxttbqzKsUnNrzqbH7NoPHzWGJnsAE2/E4dq3Obn+G5qOkpLKqIxgr6fRflUtD410azXuV+biJSnTeujYM52rOfqw56e/xp9tV1+1XG1fE7xdwpwcuJTVnYQPXfQ0e0WeUn6ln5yp59uV9QYmB+yCLm6S9Iv7lZGtOcjRBbHSQ8GUm2JxssdskaOMxhKIWUgn7ZaBBb9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by GVXPR08MB11715.eurprd08.prod.outlook.com (2603:10a6:150:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 13:32:53 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:32:53 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 0/4] pid_namespace: make init creation more flexible
Date: Wed, 25 Feb 2026 14:32:22 +0100
Message-ID: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0277.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::18) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|GVXPR08MB11715:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c7f724-1f79-4374-4d04-08de747260a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	Jol/f9gSC6v9MH8XAH61zwHInpfZ7IgxdAAKM5XMlxm9H4x8bT0VrCcL9Cm1pFYwgtGQr1qlnsW+1ARPrRv5axZCAfSO3+Zli1BCJiBCYSlZL6eANBccioIHiJrASR3dmGysbOksrvIwSmmWQI98jSdOhKTdE/o/qwgkQxUnYxo/sNidF6ktgSTzOAJuBKIkHufeWJtwy4PryjBZ8/wdvUfKMiqp04krITltR2lgOAAT22sso8g8Cejkx0xNoFkjqh4EcDpamSCNu+rWKXZ3HMt2HWknRpyfv/Yr/EG09nXsM9S13G/Libw0gHtS3CWW50cUswD9dhK++iyh7UdUV0M1Tj929wngQm0aS3+TkknWm1E09czgyclkUdSbZ8qBN1uv33OxLNAlGu0XNTa3rE5gP8WU6ld2A+i9Ixuv4cnF4czmM8nYmoIbLB+ex+S6fSW1YU9tHhTnfnD5n9r/5/SB1+Pw4rUkiyS/fkXYI5KnLXxqC15h+bs+QJ3Svv091LBtHvB0yBx6vtPXxBQ0uTohbQIFfX/AnxoBq1AiqN/P8x+fIgkjpgfstjuTli51zxAgK2/wXbjmIZVS3C7kY7n7vePnPkZo0uDmIp78A41BALS1WkKXCNpU4LyonCpFpATk2H96x9GUwhg8qYYpGVqRLcV3AdlknzemfsBwj+qaUxMmYPjUaF6xLIy0Eo7lGNC0FzTUj/KmNDfwibwHSDE80kaDN1FuIfhF3lKLlHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkN1RkFlL1Zuclg0Zk9vWnUvSWJlM1E0a3QwYWt2VU14azZ4UEllbndDUm5l?=
 =?utf-8?B?UzU3eUNucUJsS212c1JZdGR0VE5JNStGVGJFbXdyT3dnbzZEL2loQWx4SnFv?=
 =?utf-8?B?NWg3aHMwRHJxeFFCakZRdWxzRS96UEJzN1JZMnNhSTVxQS80K1pOalJaby9N?=
 =?utf-8?B?V0JyNzRmQk9Walh1SDRsZ1ZJZ2ZyOXpZV1NRQkN5S3dkZ0toYVRyc2pzdFJX?=
 =?utf-8?B?MUVURFVqSHBIWDJEUDdyRkVhRnlYcytKYXJSeUZmOXVSeVM0a0Y5RTNORlQ0?=
 =?utf-8?B?N2EzZUhXTDAxQmZFd0JuQ2djdElSZUhwWno0V2x6d1I0d1NyelkvQSsxMkZO?=
 =?utf-8?B?MXVBc1VnQzlqSExtRHRUOUdJQkJEWkFRb1lMTkxhcWFTWC9kdFM0MVlHcGUx?=
 =?utf-8?B?UkZJRDRzd3d6TG94bnhtYVpUV2xGL1NaRm9GSElMSWd4M1R1RlYwejV6VjVy?=
 =?utf-8?B?bXBONXp2TGpiT3RlUVI3c0JvVm11b2JQbmgyT1hFUmZnVHd2dkEwM2ZsYndl?=
 =?utf-8?B?elZ4c0tGVUxDZlFiOGM4UlpVbmoyekNKRXdXejc1L0lxajJ5dXRSWG50OFZN?=
 =?utf-8?B?Q3JHNWlRUlBhNWc5MlBLTkpaLytHVzZZQ1R3NjBBNERML1VWZ3lZNUl4VTBw?=
 =?utf-8?B?U20rbmZNaUVydEdxWEIyUld1YVlyblBEaVpTUm1ZSHVaSmgzY1BzSHh0M1Fv?=
 =?utf-8?B?Q0U2S1A3aEk3bFBpQzArNGpTMGkxbkVFbTNxNnNlNnlodzhOd1NpaFcvZEVo?=
 =?utf-8?B?U2JjTkFVMXhiV2pLYk5mSzFCdzVZKzI4TXFPcFE5V0hyaXkrMVJPN0xhbzZq?=
 =?utf-8?B?NWFNa0RPZi8ydWoySGVzQTIvUkRXMENxcGlqV3J2cDc4ZUJ3WGpES3JHVDh0?=
 =?utf-8?B?SUY3aFF3WHh2RnJLZnR1ZDB3aDZRWjFuNnlQQWhaOTg1bTdoSjBrbDZod1d5?=
 =?utf-8?B?VkJhZkw0MHZsM0pmb3ByN3hLeVZ0VDg0dCtGeURFcjNlby9vK1VUdE1lZGZR?=
 =?utf-8?B?WlJuaDF4MzZOVExlaWhXUk81NGN4VXZCdGpYOS9RY05pNmp5cDJ3QmpCRW1z?=
 =?utf-8?B?R1BTN0pSZmIvQ0ZXVGZkdEFOTEZkWVVDbCt6emJxdEJjLzhlc1BXOWd1UUxQ?=
 =?utf-8?B?elQrWXhCbUZEZURLcFJtTkhyYytUMHdMdHN6ZW9heHZ1dkFQL0drVFQ0MEQ5?=
 =?utf-8?B?NHFpU1dhZ0lCWG44dlVSdWhXRWtUMlZaQllDbm5DMW9KMmhiQ3R1cFZJRjNX?=
 =?utf-8?B?ZjIwbG5jd0JPcldHMndDbUU5d3YvVnZ4NVhQLzhqbTZkOGNzYktGL2g5Y2x2?=
 =?utf-8?B?S3FQWTZZU1lLUnBhRlhpK0p1SkFDRmdQR3JFV1Q3VXk4R0djYWJuQTBJVW1S?=
 =?utf-8?B?M0J6aWxpVFJwSDJhK09UT3pUOFpobTRhc2lwNS9XVnNxMFpnNElEOGFTdmxi?=
 =?utf-8?B?RkRKK21Ec3MyUGw3bnQxUmYwQ0U3eUZPV0VhTnA5T0VZdHQrRnBEVHdBZWlL?=
 =?utf-8?B?czhnMDN5L0Y4WmZuMkhrcUttRzF2aGFhbUx0L0JWbzVOZjQvOERnR3RFWGM1?=
 =?utf-8?B?OEdDeE5XR2s0K0F1WVk0U0ZmaDl2bVhGb2orWUgyVDh5QTJNRlFvaDZaZ0N1?=
 =?utf-8?B?VlZ5SjZQZmlpbm45eE9EdnZtZWNjOTF0OGVPR1FnazNaMjNXd3pFNmxnQkhi?=
 =?utf-8?B?YjVMRExweU5aUzhMOGRuOW13K25zYkRVUTZHYUVYUDJOV2ljN1NGWDFNZlhZ?=
 =?utf-8?B?akdrY0x1RHRQMmJzOVZPZE9aaFZDMTlsUWNIN0cwcWNPNTNKb3ZTVFljMFBi?=
 =?utf-8?B?RE0rU3VjUVR6b1FicmMrMjJrQWdyM1JYOXJTZXFhMVczSTJxTVJ2OUo3YnNH?=
 =?utf-8?B?NktzdTlZKys0WmNVTlE3MGhiVnFwd05EaFlYNzBTWXlXczExbWtrRUtqVlVR?=
 =?utf-8?B?U3dIZ1RJZ3NwQ0hGTTg5aUFrMFQxL0dNbU1XMC9nY0Ruc3AwdTZDejlneit3?=
 =?utf-8?B?Q2U2VGwyRE44Y1h3ME1tNy9sZm43NmNyUnZ2Z2ZCK2ZhbXpWV293RWdlc3Bh?=
 =?utf-8?B?RTBuV2xUZGdtK3FWZWxYVE5GOTA1elljQ25naGlhSjFHcng3NmVtZytKT0M5?=
 =?utf-8?B?UCtvYVo5RktJZzJGZnlpeVNqZVR3WDFTOTlUN3VoeU9hQ1NKcDZRMzY3RkEx?=
 =?utf-8?B?Q2Z3OGhkblNQT1NaZ0twcmJubTJJU2Zaa3lOUktEbHBlK2hrbkEraU1SN0U2?=
 =?utf-8?B?MzVhZExXQXU4TVdnZ2MyaUtaUWxjQ09QSlJ4WGxEeDRHSHhmSTc5U0w1VDNn?=
 =?utf-8?B?ZFVobHc1MDUrZFQ3ODEyTGZzWmJxenM1UmtsdWlCSzNoY044cGNFbkt1TW8v?=
 =?utf-8?Q?s7VvXENjulu784Fy+vlaAvEPwOk+l0PagpzS7xupbBSGP?=
X-MS-Exchange-AntiSpam-MessageData-1: l7OANYWOSUw2klRx9X30CUeCnmtZmtNVI10=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c7f724-1f79-4374-4d04-08de747260a1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:32:53.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpKJXlKco5WYjx795k/aT5i1F6oG2sXLLghhzgasCE4cDPYI5ZC693WT8gL50GYn49ix1I9wVC4g6iZBlZmAH9QoMCuPWLms28Z7oMYHxCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11715

The first patch properly annotates accesses to ->child_reaper with
_ONCE macroses, to protect unlocked accesses from possible cpu/compiler
optimization problems.

The second patch makes sure that the init is always a first process in
the pid namespace, previously this was only checked for set_tid case.

The third patch allows to join pid namespace before pid namespace init
is created, that allows to create pid namespace by one process and then
create pid namespace init from another process after setns(). Please see
the detailed description in the patch commit message. It depends on the
second patch.

The forth and the final patch is a comprehansive test, that tests both
basic usecase of creating pid namespace and init separately, and a more
specific usecase which shows how we can improve clone3(set_tid)
usability after this change.

This change is generally useful as it makes clone3(set_tid) more
universal, and let's it work in all the cases evenly. Also it is highly
useful to CRIU to handle nested containers.

v2: Use *_ONCE for ->child_reaper accesses atomicity, and avoid taking
task_list lock for reading it. Rebase to master.
v3: Separate *_ONCE change and "init is first" checks into separate
commits.
v4: Update second patch commit message. Include Oleg's review tags.

This series is also available here:
https://github.com/Snorch/linux/commits/allow-creating-pid-namespace-init-after-setns-v4/

Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Pavel Tikhomirov (4):
  pid_namespace: avoid optimization of accesses to ->child_reaper
  pid: check init is created first after idr alloc
  pid_namespace: allow opening pid_for_children before init was created
  selftests: Add tests for creating pidns init via setns

 kernel/exit.c                                 |   3 +-
 kernel/fork.c                                 |   5 +-
 kernel/pid.c                                  |  17 +-
 kernel/pid_namespace.c                        |   9 -
 .../selftests/pid_namespace/.gitignore        |   1 +
 .../testing/selftests/pid_namespace/Makefile  |   2 +-
 .../pid_namespace/pidns_init_via_setns.c      | 238 ++++++++++++++++++
 7 files changed, 256 insertions(+), 19 deletions(-)
 create mode 100644 tools/testing/selftests/pid_namespace/pidns_init_via_setns.c

-- 
2.53.0

