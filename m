Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3BF3E0C51
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458547; cv=fail; b=MiIp6c0wV8/aKxCQUbgvwYsyCkmVkpOAKxL75iJpO2kVRHBsjYykV+0dn5y2/gWOT3h4MoW3nY9vGodmzMjSD2p+2cuC2eI6GgoWfpGGT29joqwGcLLOs6scB6bdiI/1Qv93FvyrP/tWfKrG3QNu8+/gbj8FCAbIg67TcFPlWGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458547; c=relaxed/simple;
	bh=n0E9ZuxeyzZjlPvwyGKyn6qim+9s7nGAV+O8LBqSxkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mr8Y0/wLqaUFUDWWJ2ixzz8t4kSYVhWJVM/rXNlMT20fyIvukbUx/7sZUV/pkr6A8d+NBcUDp70c3XSX+p9XA8FOhs+JX//kn1a33pN8O/QRMvf1rn+CA+YWN0nQ7MROBVHml+T1aloH8JfoZ7P2p893lltcFdR8LOfyjPPZguk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=mbg/+1n7; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="mbg/+1n7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/ROxdeaxBo7OmjJpNf2soUQNGp4QdkDJMkdrlhT96/KB/eYNrNJkKYT5XzOEzU8eCh6S6HPL2NuKbfUPwyIRq9Ejs3CFDVeLUvyWn7BgNhKO0C8NAvjZ3bxZPXgDhUzWaBFsZ2kMicu4vm5gOebTr+0OdW2BsCcLKik9HV9MxdSIIzChFWlJX879U/T9x4IBXnwHH8QB5VRBjyE7W/3aDBdqDJtDjTOrg/ApSkDDpKy5bbMEkgHo9N2u6LQ/FAyNDwTcekKlLoFjsa31wVfMkc4TzpRVtkDztZxmm+gZioJrcXjvmLem2Xnv13/5N1rSqmgRCEBXJlzE/DQVLV3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF43dGGeHmzDf2dtFoHejc6+BWwgQthMiCPf4ESBULs=;
 b=psrDFxig3CL1wUgOuZu/Sc1wz5qxEXuWxj9d+4uWzx2T+1RrtXqGNGCtzIjYkH8nbSW834ROIDl7mw6v5ox/FOrsMdhnbjfQ24xh0HP6Sb40dDUXe53ARp2dU5nXFnnIcC8VW0X2nGC6mxMb671VgR2bQ/9PiQ1A1VnWVtcQ8/g0t641T9d/2/EVpddIZbse2mbzQiJmc0tOSSNJWVrnSbnR9UB5fshb35B3O3tpU/0C0l18tNVX8Q3R9TPVHZxmKzpcy78BnrK+VDH1R+jTOVK79KULSqM00BeUujBqVtIS6AKejIBI0PaHGC/eLnd3I61IcGwjsm77T5TAvvknMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gF43dGGeHmzDf2dtFoHejc6+BWwgQthMiCPf4ESBULs=;
 b=mbg/+1n7LGIbLAI2DVIVYXa8nEiT66mEFtjLeZph8/Fwyhxh5QP4klDNBaRtRJ0fGZTFVm3sSaUMaBDX9/egz/vK6PgFFf4Yd0qxd2fiZR6gZQn7qUKOHKZZ4DjzqktXeNz29tgoqxx8Ef0mMumDtph0x84W8RdkT5L4pm9EoJ7fkqpBDYHSuyIn4OWuzzMCd5KOpRBf8+Y2nJC/UYX59/E7MwOY7vm91bV4OoOro+0mO7ijqEOP64rJOMizatNVGvMg1RyDf9Fb9rnNN0xavwRv3p3zMpdY3GrfblD5FosfLAWBK8CkJJNTOdT5MoP0v4tiZuECqtvCUBRPDarayA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:40 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:40 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 10/15] selftests/epoll: remove unused variable 'pfd' in epoll59 test
Date: Wed, 29 Apr 2026 13:28:06 +0300
Message-ID: <20260429102811.47214-11-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
References: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: b49d804e-8bc7-446b-69b0-08dea5da146a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Kf7curLsW3W6C9pMmcxEdoD5eApo34EgdFd7Nn1wvLz5dQoBtlNWrTawWGAexmlBrs2goPGBK/Vh70ZHhCGD0aNp+Zz1Ca6mWqMO0j/RGTVHtZGLxbXD8Os09gX7dpqRqUv/WWFcCsB95S/A914PYF+VgE2Oc8VGtEGtc4nm4uU8gDpBjzjjLU3OY7BMcdMOia9on4PKFmB4g25+jIV5eAFENaFZFOfROWnRuID3dWOG6Ji0FB3kkOUBgKppLrF/n7tLJdkQK+5JQhcycgXRwDC8tsqfS1iFpgZ03jxexFzLwjSnTDfUyTqJY75qb+tQCty/kpzupUkDl8DibWw6mRMXHKGWDKZgqyhq+4eIWOcArnWG8XpmZ2/xjMK/XEgv09lJA7f4mMUesSLqMbkVsdp5oFOFAGpMUEE+hAsEZ+NrMpUb8wl6oEvZ+b1Y5D70F4ywv1em2o6YsEeEaWQ3my5ZqOcWZjMu/IBNUgknBBlk/HNjbVnqHzQwRy+tsceIJMAUPoFJAnPvXl6sQmSf2Yf3NuTBz6Sup40vW+/IV3YaRN2y8ZvcbexcZBx5w26TDC+gPcqF3MePDrLxAiSeJKoWdBf78ls8M/+o5FqYparsr/DiT3ARZosqcFOa6VBO6sGieEAoKh8XyeB7VAcNt5UNM9r7HMW8Bc4JNBbRYfXyOWQ1a2jeYeE/SG1jYrsgv47KZfgT/9GZBgdr3MxGnaKceM4cFFyVGkTAxmeW2O4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NqxnIwR3jAg0ZM+hnIobB5M1mWf0OuB7xeNW8KsS5PQRPwdhu8mt4Itcgqnx?=
 =?us-ascii?Q?MHwtmm9l0UIScHF3udzh7a6dC8Akn8UzuT9giQM3e+YySiKbR948nuLkhL2L?=
 =?us-ascii?Q?sl+cWQCFB+qQDJ+b47f4iOvId+j1cL9EelHaS93EzWh3Owc81eFn1cxBoGAZ?=
 =?us-ascii?Q?EjDCR+v80Mg5URJOIr+Zu+wg8as9W6rWnwjyBj24jwcOtG7JN28xL6ktEMzx?=
 =?us-ascii?Q?jZ/p7YNn8PCkYS9qD6q9bRr4craqUNASErSaQiN/pb8EFSjggyrW7DdDaW/x?=
 =?us-ascii?Q?3HC8Z9+3aKpqL/6MNv5/WIx40IeAcW+qDXR7rQWEr9M4gxJqn6Mi4E302AHh?=
 =?us-ascii?Q?aT7w66DfzdqOPLGbxv1Bc3WnyeBQEKectuyudfX1iKISyD4GAgRLwHIb7NYC?=
 =?us-ascii?Q?HMpNP/2E91CqTPKJzUzEFNCPUeeikwWyrckKCOfo4EggGg8LLWYXlUkTAlCe?=
 =?us-ascii?Q?2ENi8rbp/Kqa3Pntp65bE0K35ADZBoBaiqZ12dgcNW1XBI+0fL37cjOYte+Y?=
 =?us-ascii?Q?StQ1EQ/gH4LiRwrwnqHN/kGiLcy9BmKik9zJ26iWO1xqU0gEXQFsFEDzgyLI?=
 =?us-ascii?Q?yr+/+3khO1JrDvv939dLJG81Bpt93oS82guGoP/bfV70a07UskCIyBcW9CqO?=
 =?us-ascii?Q?k+9ItBu9nSe2eLurEKwZFLTmwyqz1M9BC+TeVuaTl/zAcCm3PgKifoht/w2V?=
 =?us-ascii?Q?IK6hc+pRio0Oi+I2dcCiuuCNRzPxLJonptLWOThpF8wf2YP6Woi3UqFH0nbF?=
 =?us-ascii?Q?L/uEGviPC6lHTGulBMTJdqkAVWmg2DrjX+6vUubrbLUQOxjXcB3G+Fv7iTv4?=
 =?us-ascii?Q?Kd3F/9x6l5hJBVoyab/5nDZ2QnSP9SZVuzviTephBgEw4Sd3gur/P3rbwBDC?=
 =?us-ascii?Q?TjEdQ7sGB1ijL4kqToDV5OpVTQ8aszJvTorqXkAt3fBmgTkT6WgRQAdImQYe?=
 =?us-ascii?Q?O1Zx7RXvDiFgAak9RKI0SB5jY+q6yg5VxfQzbUbLC24aD033hb3xlJaOhqYT?=
 =?us-ascii?Q?HOrhZWxyhIA+478Cgpy4SV5QTJtRjY2sxKpkhluCE39rlADOSEWgQ37mJh+a?=
 =?us-ascii?Q?YMWI6maKnNQWk5ByPHxmq2haSjqnYUemk96ywlFoa94gnciG2W6JKOfuoTNm?=
 =?us-ascii?Q?JMf2D3S0t8XnHaTQozgcFGSO3md+7FrAQxT1801gEGFm57BchQa5JG2i0gRg?=
 =?us-ascii?Q?RMKzSj3JU/NRywdFLhEEzpzL7+N5p4g0hP0La66Ros0lvcUTMAzB1qS2gCBw?=
 =?us-ascii?Q?AROgNqi1yYUrjF3cY2VmymYNHdhl+fIglBhiDu4E8poL+J7WPVBesoy/TUfZ?=
 =?us-ascii?Q?V0Ux8tvioqCHVbAN4qVj2vMO6oo3zTd0NLjcYHekrJfOpaUaH3257fqCM1AS?=
 =?us-ascii?Q?JoDwRHQDNfyzhNVTW1PjCwp29MRIGIgboCCwn+yqVqSrMjK54DTGVdFULy8K?=
 =?us-ascii?Q?7mBfKEDFQ2ACnPQtNi7VcaLBj93oHHqbAqbscHct2I3d/IVYeRFx8HLsHfBj?=
 =?us-ascii?Q?GGSiRahqg58ujIfocgGMFYIscUrF1GBdPYDvoKBypDzQsAPczpFWoVcbC5AT?=
 =?us-ascii?Q?vg57dQJ386nRgaTQv0prWY1Hbu12JFiGySZG5PJatuE8L+cabc3Ah4xj1MRn?=
 =?us-ascii?Q?HPgxAxCup+tjIICVuaGUst2qGSGSHjGUGS+HFhz281SySpNE6zl713TzGwdY?=
 =?us-ascii?Q?+DjQg0HV2uP6AX8z9fy69orYiUb3pcZ6qi+w6QvSJgXxcbGbJAi7LG81NeH+?=
 =?us-ascii?Q?qUNXLXHMTMCQpb2/WdQFbtF0OyWkCmQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49d804e-8bc7-446b-69b0-08dea5da146a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:40.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BYdDnGrS9pWMHLP1YKW/eK1HPtzj4kgdqP6ICO9oUB/HfgexugVkHdvXnPVRIz1p8I2tUQHZtHR+PeoUZUaxHAWzgn9Zi7iwye1j7xGUkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  epoll_wakeup_test.c: In function 'epoll59':
  epoll_wakeup_test.c:3121:23: warning: unused variable 'pfd'
  [-Wunused-variable]
   3121 |         struct pollfd pfd;
        |                       ^~~

Remove unused 'struct pollfd pfd' to fix -Wunused-variable warning.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
index 8bc57a2ef966..bb20da2ce60d 100644
--- a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
+++ b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
@@ -3118,7 +3118,6 @@ static void *epoll59_thread(void *ctx_)
 TEST(epoll59)
 {
 	pthread_t emitter;
-	struct pollfd pfd;
 	struct epoll_event e;
 	struct epoll_mtcontext ctx = { 0 };
 	int i, ret;
-- 
2.54.0

