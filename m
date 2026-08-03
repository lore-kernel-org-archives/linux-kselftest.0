Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022077.outbound.protection.outlook.com [52.101.66.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3040F8D8;
	Mon,  3 Aug 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761351; cv=fail; b=ihl31w7wA/VD80PHsgTPdZB7Cz7TWuQIzSz4uQi4TdVR23ZawrFGAvNpyqTdwcZMkewR4Ye6U8CiofEGQijmfJGaj8+IcDf/d0Nz3yjmeV41Lk2nrbU6A7RI56MNGB/Ti4x4/uV+6jexVUwiOf9vpYWvSJ5w7lous9IO5sZx9KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761351; c=relaxed/simple;
	bh=Qv+kWYFF5Htrh/exnjJxAslj5SD4MtMnk3LlKVdnSeg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZsOXZh/1J06Hy/nlI6+PjchbvT9KQZjGcXKC4IreVgxwQYjgsIvT1ghJRUkizUV6YGf4zf2t+9gRZTpF1uawzFJOdMs4dGJs0c5qbo423SGsS0cYSWVqbPz77rPUSgJBKgYvmLhp/nCbXZ5e9GszVaTCaGtWCO4jtOulsirOBfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=DgsqlxPs; arc=fail smtp.client-ip=52.101.66.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="DgsqlxPs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3qIc20yRDYLG8unm2ZlXQiZ53Ni/kH7SrbALVDFValeuCbi8mQesSMr/8QKoT2EW7XdoeWGen6z+sI8LVQkOkR2kdZF54GhiFw11a5zDE1XBg1YN44APJ5mEvrS1OxY5Tk37QcDDcT+5jMl7NDWebPtAIBtwUFLvFsDRyHpdhiei+Gfutaj5eeKAXTV0QkrT2SNNEamqeUF4zYmklOgHrmYKSfuneei/9Tty+LToO9dBFw+DWJki8qY2EPUAi6hteks/hq5Ncq/XfB3X3s4M/konlKZyr2YmC/x7WT1gS6OgIoTcdO7aXhjerxEucQq0BgV3mDbATsSRlzGTjWnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wgQs1aZgZyTGQsI2FG7ZrtmQXeCo2dysOuvAlupWXY=;
 b=gJPwRn/B4HHo9cR3D3/6XXEylnUOFh399YMCg1U27DMrxVb+ZlADn3RUz+22gG7gQ98a8tWy6vwuJh+gh6paxgYq5RCzGlNH85R4q3y+kkjbiFlEyKDD6zGDqPjWObelTwRQXgfgX5ivfB0kql8v6X20fd75ofZXTn/W6FtoWiIk2mfgEpO98NLER8ejyNG6QG076Y7zXzuxS2qBgD8Lk7UL9WJ+ikLI05MZgF98sMO3Gu8XGOqo7xy5nOZuvKFtBPQ4ZAgqaVRSTLq34qU+l7UCNOaHTXLVG0sECYpVKdwbl0D6x7xr/gB610k6Ta+whF5qfUqPbzrEkblIduzAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wgQs1aZgZyTGQsI2FG7ZrtmQXeCo2dysOuvAlupWXY=;
 b=DgsqlxPsmYadcjqUDIkJdEQx/ElCTrgEt+mAQorODIeuYQjUtjvg6JZXN9SIwLF1F4Eus3eigc4F65VP64yRMFNybdHLf9X26JrZ4E422vWXJIN+6uvLh+kqtqzMSGwLO3bwYKwiGfX1mdE1/kb7mZMduwoCiaD4cPocNuqUJQ5T5ieI0ktUjupxH6XMeiQv5Ss7skTvZq3ldQQOTBdb49YKReV6vFJgkvUYYxTve0DsJEa/X0Rp+PBxFR1H5qlz6iZSVj46O/tV5MJtVEpmeGdHVbEyXyXWpllz1qV1cUaHSma+k8OnsU1GAAfaM6/yPqbkaca1YNxBLzC4Z6pZ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by PA1P192MB3115.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:502::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 12:49:06 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 12:49:06 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: richard.weiyang@gmail.com,
	akpm@linux-foundation.org,
	reddybalavignesh9979@gmail.com,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH 0/2] selftests/membarrier: Skip an unregistered memory barrier test on Musl
Date: Mon,  3 Aug 2026 14:48:58 +0200
Message-ID: <20260803124900.3328789-1-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0448.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::15) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|PA1P192MB3115:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3d47ce-a539-4287-73e4-08def15d9af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3ctALraGhhp5vN5MF0o9ro2VoFpxeWyQgi+hiNvAmUSqeHTqZsNXe7oRroALgGj/boCVu4QdEEDBrPwmerJGqJFin7dMh/qsujFNZ6VWHV/xl3R9CQIf09XpESesDVTY1kcD/yRmq0PEWkZsR4TUOOtymneB9t78yDCAVdU+2Qg6m3XjYhIPH5T11WmWCFW3yBMRm1zw4m7CfSPKj+yCr83wighCVMihazTk95pImOs5drDXiaQ3UFo/Z3Q8xBW4UCNYLh+5iPQLzPvr0TIoryNB67fbCU9UkVa63o/Y9Yzjh3RHUjTvBEEKAeLniQzvP0ziNX/3PxXQ8eaq2/l5OpgYNWa2WiQtLiFc/tcdb7CaQhcnKAwQyJVIvY8IeJGHaPq5uk3J6D/SAprs+WCAiSIMRg4/vLh45xrK0xUoPfLaykoU0Ic6zn+ISVZKHCCHyv4QQt6nXtbfQUMPhBx+fYhigtTri6kBAQPl9DWdgLKt8i2VNXHzb88Gt+iIWHHcFsYhJjGJO88CcOHFCMqasNQwqQYMJ0mdNLEqLlX7A6BdsXpeRW2KnBHWrRTEfr8GJR5k2qFRTCZoe3WgCFtKLIUo4QFtiCiJQOP3O6W6O//HJcUGQGT6olywUGlihyhI5tC8eqHgx20ZNKDU3nB1YJG/PIM1Loa8XNjF1/81YqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UlGSvXgRWfpz9NXSXxh7fDOjoHgseVQGQHNEa7nOeNhqCWLUVd8a9gOa6/WZ?=
 =?us-ascii?Q?/S79KLxf5tX2VRTsydwidBE32zZGu44G3Hx7AObeS19Aa+XY5I7+k8DVgcJS?=
 =?us-ascii?Q?NIYntWy8vUeYmve25k4Q8aHldaKDMnrwmRGB1vyBR3HtXjE/wGna+WMK850U?=
 =?us-ascii?Q?5cqWw01wQRhe4LKxuYbKP1b8NkWylkTl1DivUMhy+bBKOWtrjSyquWZ0r+L7?=
 =?us-ascii?Q?tHvWsAUvucbDSNcRChSUeSLx843YG5s82MIcXaxH8enK/TdUKqXqL9Wa05iV?=
 =?us-ascii?Q?Fwk627488oy1esPZK6+aWL3Zt/Q62fgYwrx/WocDWwyNslPmMM69pA3jaPcQ?=
 =?us-ascii?Q?4lDXCCmZx5UzdT4n8GQoG7xCLniwkg/5gKDHVdjAXtcpGVqtdO7JHWNShixU?=
 =?us-ascii?Q?iFex6lXv3T2ZZgktmTJF0c86nx+Fk+ULXtrgaFbrMKFULL22xnKXL7iGMHPl?=
 =?us-ascii?Q?p5JALavH0KhigtV3SCvJigFhyppg8TtGlJNHc+rDoABCANxv1ze4SORmoGec?=
 =?us-ascii?Q?wme4fBppVHO2CPsvTsoH4zPaQh7sC/nZ8E8LTgLfHoP/EwaNNtb3g90lxT4d?=
 =?us-ascii?Q?Jmvb4PQkVOvhzhtcPIb4S1hxaXPYMaVl7wW1MvVupDc1j2FqEe2ZP6sCZHC6?=
 =?us-ascii?Q?eNIsGesXxk68iTyiQwfpHq39S+P2/L9BMwkWuyCr7kXWOB7l48nb/g8p1sj+?=
 =?us-ascii?Q?irfy3NC5Qz3AZZj6+3ZVyOQa3T23btbZChh4p7gV8ptSgWV3/7p7XZaCc97z?=
 =?us-ascii?Q?v8qR5LsX0JCvpH0HGJOrOZJYau4BzJx8Yh//V9/Od3CVtXmzJrJuvXAdAGwt?=
 =?us-ascii?Q?3OQESGnrZHxvvhoi0CcPpaOesirvpW+xnLHt3isANOVBHgjZ/Tm61FQlS/bn?=
 =?us-ascii?Q?jSTOrkF23b9hNl+2PecERU/n54Ih/Pdlml032dWT9es+y02QHDvNnZ3m/f8p?=
 =?us-ascii?Q?2kzahJmssukKmWq0OzizX5CEvYM3DIH0rthP2Byf4cULgk8YRWDPk8NEP2de?=
 =?us-ascii?Q?Yy0LuyPipOs+ZKoEpKGp/Gy4i7v8QV1OPof9C2P/Ne2ylvHWGwL2a1Qv9tl7?=
 =?us-ascii?Q?BYvWdrFaIxsLJ5xttEI1pZY5qWLkxD8Fz+IDvEHjH0F67ktG33ImjYYyBEVE?=
 =?us-ascii?Q?WRYDwLwGjCxU/84VhQ1H9frEebYp2xWOODJzg9x2aiIOmIWQbFSjY8N58UwY?=
 =?us-ascii?Q?zehuuA3HZ0uujaRVww94siw7Cq+XcWhNM10i2N9xjkY6kJYidNRelo98nyZ4?=
 =?us-ascii?Q?jRYJXxnM5rU0+s9fM4JS/aA3DwDoOS4mVH7Ooy40aMyK0ljFGo6wsjuEkWMg?=
 =?us-ascii?Q?68/OWFoFWI8y25/7C4aMjtjWPCgJoH/j9j9Ot0BQjCfRX3i0buKuOUF3RroT?=
 =?us-ascii?Q?PfN7hWaJufzCBT63j+MCinIEx4vH/cQ8fk1cuXF2SIKiwPGjdzSqicnS9uhM?=
 =?us-ascii?Q?H6R7+hYVLXPPVYnAU9IMXMnNCJXCzATfnwc0r0cMAJ2g3bBkyKP4q/lTUZk/?=
 =?us-ascii?Q?cJqIhrKQcqhK/QNbeRT9+J4I/NyE5wU2H+NMNFJ+HAd6TCSOZhQhvNamHewp?=
 =?us-ascii?Q?qKLuYg+205L55UFJYAVU+07RPc+w1ggJOuaWyxZm5N7mwmI0IjgCBukoeFuU?=
 =?us-ascii?Q?I1AUiMrJZjQN8DMNKowKQZjR3jPNY0KUFBSXqtIQl/yW2Z3yjj9KoT1xwG8+?=
 =?us-ascii?Q?+pL2zn/YL7iPBx/9mIO42Xg+yuTS1irClY03Nms6s+UjhuMxdoVc+mAMn+2F?=
 =?us-ascii?Q?uljUJn1Yjp43NngsmS9QX6SzYzjBQtg+9KbBaVxkm+8PeMoSUdCVPdtoAZo4?=
X-MS-Exchange-AntiSpam-MessageData-1: Eymrpe2zD2yWq8wWZ3Gryc7ALvoqeEj7xt8=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3d47ce-a539-4287-73e4-08def15d9af5
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:49:06.7883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64inYt3exVJX2sBLq3VMOqMw+zZbO2JjLXw6qHDK1RYmyHKm4idxY/ieOC9lMXZ3x/o+KhZgG9mBRqIdSgf/VSW/SoWgfTnhExQ4sZZ5QtxVE4Pza1X4bvLafhADbLQE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB3115

The membarrier test "membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED not
registered failure" fails in the multithreaded test scenario when using
Musl libc as the command gets preregistered implicitly during thread
creation. Skip the test if command registration is detected.

Chris Gellermann (2):
  selftests/membarrier: Introduce helper to get membarrier command
    registrations
  selftests/membarrier: Skip unpermitted membarrier command test if
    preregistered by libc

 .../selftests/membarrier/membarrier_test_impl.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

--
2.47.3
