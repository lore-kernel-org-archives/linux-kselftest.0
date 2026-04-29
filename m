Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C53D47D9
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458516; cv=fail; b=Kp/HAcTf0DryvEIYjG9fJsriY/uAqNKgmIxn3CrMWeV4eptoF0g3Is+i1t0KnCytXsjqak4WQrA+VOKqVEvG4nFlNSFNaxTtXpAjzyoybxUikeZ97m5pOpmlrappYoauRP/HbP9hxxiQe/A1mc9aTOZsaisBezse1npfwihsouU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458516; c=relaxed/simple;
	bh=AkGoMB2IoRSGbZ/3Lcd+VTUuCvKzhtGgrkCLe4xwMmo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=og2ldx38SSd6Vx8IWW8a/o+zUAiy6wZHzpyCD7GHtHIqXcxxbp8JAkSZPsuu39yInlalLnbldmHjdkfuUQda5KY+TWq3R2LKdbsFDdsTjpvQzxt4dsaCTnZLiwAMn+eORhpMyfTOeiQ1ilDgY0YokiT0WyXhhUH1yadP3G+M8Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=oPJMiPFY; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="oPJMiPFY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4h9lrKun9gJFq2ZKEmeSXzVeQiHeJtj7wgOFFXQVAe4tG9jaEYUve592ZcUjLstBt4xhdHK16G/eTWeIAX+zg+jVsFBmhaj7cUZ9uMAJqo2dz/hgx436fkgZqe/K/qbemFJBAYkNDKo7NIWc0KatZ0nmK0sHrYGx1XSTJoqLj4OHISTpc0c2ZXB9IYO48FVE+2qFpkBjO6HS8NUi+yfeAzzpeFoqW+IKAyO5ohMfZ7owJ9AEZhrFEj93s4afNvcwVqQtKeueYKMGi2jNsDRpEp3Cvh14vJ/Apw0gjj40tzTb1BacpM19653FFmrgvt4sDdZPJL3aVg+0Nt4snTr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNX6BUJlg8NbXHY+2+xIjIQfVUDBxFC0hbSnlEROo68=;
 b=E5gfMaxl/ijRUPvAmn5Hfqag4D4CGIu3kNLT6i+in6XMQMSI4QTGr036HlNJtLmeL4Ma+RTYShEY9wGT98nFzfTv4usj1Zc3St2TW7kQMDSHwx+4sPqAruFtOwMc3vqmEl/2NL5P5Ts8iVUo6eN7BOEsKQxCjhj4lYQhLTEwKuaoiyLaPLzG1yK6G5fehIBVEFLcpGsoQbJh0Vv3EmthJwu41vIZLgVgmtZyHyBNGOQqk94C/FtzeFXODtcsMjzyta9OEZBfjZROaGdQsyeVCvNE4vhOFR9P4BHtq2ShIxhDxM255KrRtRm+4YQO/LRh9bjk3mxoxBkBMUFijd+k2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNX6BUJlg8NbXHY+2+xIjIQfVUDBxFC0hbSnlEROo68=;
 b=oPJMiPFYjAb+Be40lxTL4zADp/oKn93KNBQahz8u5DzIxiau7x5HwrdXy+p8eyzMXxH3+kvL8deVJ/25YVXIe95x64u7+dFeonPGJFFP4Xq3myUWY5z4nhGqqzq1wqXjAb3LrKpEngtf1GhNAHdjLVO3cMRX2cHH29A5YohjaHyy6rdB0WKbeJsLV2+4s/ZMvE6XgVQloEFmpXfafiZZOaBn/6/gCDflsnRxcZJ422BQ0w9GZizScsmOh73/7rEuLKWwo6CI8UozYB6Y24RA92zKsNVWXWy8qEKik9H/rXNBwMh1geE2cuvaiHKJ7MQK7UZIWakEkNV90GfBh3OD0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:29 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:29 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 00/15] Fix compilation warnings in selftests
Date: Wed, 29 Apr 2026 13:27:56 +0300
Message-ID: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|DU4PR08MB11078:EE_
X-MS-Office365-Filtering-Correlation-Id: a116ca77-b8b9-404d-5c94-08dea5da0e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	49bO1I27TGBp6iG8CC2qr0eAu+PNqdVWPnNhZYh5x0dcb2rEIl9Vr5Iggc9EP0QU9TnXGcJofdjjmM2LsK8EJKGtOzLH+saIk4knnVcA18O0zhznwKmK/jSXCs1SHZlo2EQ7a4rfdhJaH4490RawJjbTe0vT3uWPfR/wBiJqkioCEilLTBshp3kyw1CbmU+4ZZNrnllwPKpOEttlu/l2snUq9KuZ7Fv/OrP7QbvpqB7xwU9TgECtMgE1VVVKn+VxP7wikY3/qOtZMOMASfHyvuq1jhiF5P4dI9Pd7ia1I/WOuj/GmE3c3u9/rP7UQ0IU/inTO97C6YHLYExbw9Iqxnlr+XgKQMT9wOmbA9FBmzYxHyVGYkNlTxAaflQqdW59wyHuelIcm1w5awVai4xlx/29UG87td0pozh5oW6b+dDrvAxVYn0SkIIdQwznfoS1mwaDAr2LFGwsW8gdnGf6HU6yHQw2pUOEessy61rtIBqTZkd+eqVrjVeKv/ALzK5AzHEJBgLMEsiJ6cnqRUbrWiwiIt80FeY/XlpA/sQN5sqPqCqdjM6L2FFsqt89834DJvtRHw3F55Y7/kQdwfOnsP7OJI0MN31Xr4lEQKdrnxoyZYOlQBAytziZhxx6CZC5uVhxzxi24bmPb/r/DUTOI+X2O2NN7D/M8/K1Lay7LIt7evC9cyVuwDl9OE1BfcXWS1CXZIgDtFLP5B37z2KLfxi+59VBNxoiKYtpxuriYuQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE1ubFlPVnlyckhqbjd6d0p4aEtiRXAxbTBUT1cvY3FhU09KSXhNUFdHSUoy?=
 =?utf-8?B?SG9PN3hyNEFOUFlaNmdJU2tWdm01YS9lcXlQc2YzbXUvaGdoRkVpekpKLzA5?=
 =?utf-8?B?cW1lQ0FEWElPM0FqSE5GRnM5UkROdnQxdG1PWkVUL2U5SFFVUlVQTTdHemFx?=
 =?utf-8?B?YVlTdXRrSVdTWWFZYS9LNmFIZDdBdHdhTEk0c1pXdDhGckRkaUV4eVRYM0Q4?=
 =?utf-8?B?RVpSakM0RW1YOStCYytvdkw2cnFZQk1QT2xYNTJoWFdPVVFENmNoMEtna0lC?=
 =?utf-8?B?VDJqVDR3TDdoT3owUk0ydTdoZVBIdzZZL3FJVEUrem53RndYcmE5RHNYZXpY?=
 =?utf-8?B?cHhRdjZLSmdJMm5RbHdycHhjeUdnQjhBcExlY2FFWjM5R1VtanNDU2U5WnZh?=
 =?utf-8?B?ejdGb2JtSjR5SExpUkF2bDlBUkRhVDltRUlYYkEwNUtaWnl4ZHFReHg1dTRD?=
 =?utf-8?B?c0VUMXE1RDNaNytNaEppSjdlT0lKMkoxN2UvYzNMV0hMQmVtOHU4YmdrU2M2?=
 =?utf-8?B?a1loTWVtWmdwRzhTdVo0NkwvZE1INmNCRkFMWlN4K0RHV0wzMVlLUEZKNzBY?=
 =?utf-8?B?MGtPczh4MlhtczNVMnVtemp2OXJINksxQVBRTUV2MTVEbWlkL0FRSVkveWVV?=
 =?utf-8?B?NHZUejNjWEJuUzkwQXRuZFdzN3owWk4xWXBNbEN3OVo4QXJtN1A1dTBnSUVP?=
 =?utf-8?B?aXIzWEtMU3ZLSEVhb05TM0h2cFFId1ZBaWtWZHdEanc4NU0xd1g2aU5Bb2lC?=
 =?utf-8?B?SzBhdFZGK3drRE1pRTZpY0RnNjBXdDZEKzAxRmZ0NEhtRVM4b1JFdkZ2UWhh?=
 =?utf-8?B?RTAwNTB6Y1o1djE2aEVFbUZvVXZadS9YNS83WHpreHkrekdHSVk2QjMvbHUy?=
 =?utf-8?B?UHJpcHBlcDYwbjJUQWJGVHRFUGl2ZEF3c0JVeDlYZ2EwZzc2clJYdk03NENn?=
 =?utf-8?B?aDhSMlIzNGNSaVZUQ0d1SGpqQVJHbFJXTVVhdWxZOHV3ZTNTOXdId1hxMkhV?=
 =?utf-8?B?MC80ei9KYVd4VXRReFVFdHRkWG1IOWEzNzJBN0crRjRsR3lOL3piWWZyWkFR?=
 =?utf-8?B?WnhWV0dGSERSWnQzZnpBR3Zhb0w1bVNnQWJpc2F3eUZWWE0rbjJPV2NmdXRo?=
 =?utf-8?B?MS9vTEtnbWloWTM1R1JKa1A2UkFFQ1U4d1NHMXdFRGFlYVJUR29ENmZzTFRU?=
 =?utf-8?B?SGRDREZybXd4UlRQQmtrTEdkUGo1aTdWU05BeE51TjBCVThZZVl2NW1LMDQ0?=
 =?utf-8?B?d2NLMHRzT0ZwaUtFNjk5cHozZnJqbEJ2V0E3VHJsUXZzbmpoVW04SzlGcVFF?=
 =?utf-8?B?eUgxUVZBV3pDeGZwK202VERaVndrRDBCcEpGOHVzNVd4aTVnRGU3U29IaXNq?=
 =?utf-8?B?cE1JaEY4aDIxRkdwY0tTd2tHdlVGeE94Ymk2VE0xMklraC9QM1dNYjlWa2xr?=
 =?utf-8?B?c0c5NzRTZldOdi9XT1VOWHZDeTFvem1JMnFLV0dtTHJOckZ1Y1E5QkZFcmcw?=
 =?utf-8?B?NVJKSW9JTEZhaWtMMiswdVJ0ZjJMUERKY2VxQUtyYThLSXdIQW12bFMxUkQ4?=
 =?utf-8?B?dnFybjh2WW9Ibi9Bb0s2QmNnaDNZeGpWWlNienhqaDl1MkRlTFdPMVd0SHRj?=
 =?utf-8?B?am5YRHg1NDlHTlZLajh1aC9aKzJRWnk3VFNuYUFLdHVtQkRoZ3hYNXBYS2Y4?=
 =?utf-8?B?ODJUbHlFMVBXZnNoYSsyV2xldXFoNzlKRlRhR1h5SUo0SytzZEdEeGN1M0hi?=
 =?utf-8?B?bTVzU0tsbWdOeW9MNTZIdGMrVnJrZFlFSHdrQUFZaExRM09CRTJxZ0NUMjZm?=
 =?utf-8?B?SU1sZWtTSnZjRHZvKy9BKy9JdkJmY3NydFMwSGZIMWNnQlIrQkltSERVMDQ0?=
 =?utf-8?B?MlF6Y0V6dkxMTjJUZHRCMHNFbW9YeU5oVDE3UFNWZi9RQ2JXQ3AzQ0w1cWo0?=
 =?utf-8?B?ZXVHaUE2MG5OWm8vc2YrZ3hNV1JzQ2tIUTk3bzgzeWpId0FXeEtmdk0ySlYr?=
 =?utf-8?B?dUh6dFNvUWNVNXZ5Wm1WeXZTeHpEdm11ZVFtdDVBcWZ1T3diK0RrbDViQXU0?=
 =?utf-8?B?OFZvQzhiSjlPUDRQMkc5V0pLd3I3U2tqQktUOHJDNHBoUmRRdjRLNlRtMU9u?=
 =?utf-8?B?QWE0Rm9rd0pWc0NaTjRRSGFsTmoyc283OTZ0M3pYWFVzbEJKeVpRWCtCNS8w?=
 =?utf-8?B?cjhTTkRDNzY3Sys1NkxmYkZZWVQxRDEzOTdIbUtHaXArVExaRjN4RU5tUjNo?=
 =?utf-8?B?clVGZTJLR2s0QjBEdEcxL1BLMTZtWHg1cWVBMXE1WG15SW1MbDdqeElPUVc5?=
 =?utf-8?B?bTNWK05uM0NQS3oxRzZiUk4ybHM2R25FZFBlWlZGVjYxclhBdWtKcEVOMkhp?=
 =?utf-8?Q?560A3dmjnG9M26c4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a116ca77-b8b9-404d-5c94-08dea5da0e6c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:29.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfUKZJ6zzy8PUFrUiEPhd5yRtS42PvIuGzlWVc5tYqv6dWwVPwCCHSlLWqI/V37oW3caQQNBi24//f0hkEq+9cYEtiAh4mAOtHsUomEUe8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

This patchset fixes several compilation warnings in selftests,
related to unused or uninitialized variables and compiler analysis.

These warnings may be reproduced via GCC with -Wall -Wextra

Eva Kurchatova (4):
  selftests/tcp_ao: fix -Wdiscarded-qualifiers under C23
  selftests/iommu: suppress -Warray-bounds in _test_cmd_get_hw_info
  selftests/fchmodat2: suppress -Wunused-parameter
  selftests/openat2: suppress -Wsign-compare and -Wunused-parameter

Konstantin Khorenko (11):
  selftests/uevent: fix -Wmaybe-uninitialized warning in
    uevent_filtering
  selftests/prctl: remove unused variable 'j' in set-process-name
  selftests/netfilter: remove unused variables in conntrack_dump_flush
  selftests/netfilter: remove unused variable 'plen' in
    conntrack_reverse_clash
  selftests/mqueue: fix warnings in mq_perf_tests
  selftests/mqueue: fix -Wunused-variable warning for 'usage' in
    mq_open_tests
  selftests/memfd: fix -Wmaybe-uninitialized warning in memfd_test
  selftests/memfd: remove unused variable 'sig' in fuse_test
  selftests/membarrier: remove unused variable 'i'
  selftests/epoll: remove unused variable 'pfd' in epoll59 test
  selftests/clone3: remove unused variables in
    clone3_cap_checkpoint_restore

 .../selftests/clone3/clone3_cap_checkpoint_restore.c   |  4 ----
 tools/testing/selftests/fchmodat2/fchmodat2_test.c     |  2 +-
 .../selftests/filesystems/epoll/epoll_wakeup_test.c    |  1 -
 tools/testing/selftests/iommu/iommufd_utils.h          | 10 ++++++----
 .../membarrier/membarrier_test_multi_thread.c          |  1 -
 tools/testing/selftests/memfd/fuse_test.c              |  2 +-
 tools/testing/selftests/memfd/memfd_test.c             |  4 ++--
 tools/testing/selftests/mqueue/mq_open_tests.c         |  2 +-
 tools/testing/selftests/mqueue/mq_perf_tests.c         |  4 +---
 .../selftests/net/netfilter/conntrack_dump_flush.c     |  7 ++-----
 .../selftests/net/netfilter/conntrack_reverse_clash.c  |  1 -
 tools/testing/selftests/net/tcp_ao/lib/proc.c          |  2 +-
 tools/testing/selftests/openat2/openat2_test.c         | 10 +++++-----
 tools/testing/selftests/prctl/set-process-name.c       |  3 +--
 tools/testing/selftests/uevent/uevent_filtering.c      |  2 +-
 15 files changed, 22 insertions(+), 33 deletions(-)

-- 
2.54.0

