Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023084.outbound.protection.outlook.com [40.107.159.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418893E1209;
	Tue, 26 May 2026 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795562; cv=fail; b=Vpw2qXqBR695E34GhA/g0WDhaFfP+78mX1EZk5D7Xikk7/zbqewuK3VMF0RDh5v4dxY+ufSscjKNiQCXCSedzp1oDi3zShvdAKfT39/eTYfmmGwSKRvph/mHoC3XhKbpzuUY5CYt91MqrfIsVBjaUTwXKC0yDASgeSxgNBoJh8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795562; c=relaxed/simple;
	bh=QLJDMJUGu3bnD4qsuCJrG7+TmFZ3dejHK0lqiuX7du0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nTWBJ9wIpZPOKpDzG6PWxfUvG5iAwCHFYBe2JppP18IWVqh59SFa3dcFlrPysClL7oA47pJOpi3RxAm7FBcTc6J2VimNOpEHF8R3qRY2gAiu1MqZtsvvWZpqY28eQxUPLwJ1LFtneyklj2BZ3LjUDvDD4JOxUtyifolsHZzHS84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=413oVPBX; arc=fail smtp.client-ip=40.107.159.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="413oVPBX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gwpf9pwRb2zXK6Nr3esY4Y3EG0mxI9vr/Y6ADCb9BIGZ+GRuOza1fWR+HKMy/yHn2WISyePCF2M/jCS/rlF42ODJESS9N5HtMUCuv/04r5S5aa2vbT8SA4/NFDxziXVIqXRZnxZMeIvFLVzrjUznO6u4pb4sqpXnuVO2uF1cOYbRbsdxWlTu4bDSl+hN2tCEroAlfSrD4M/vFHjjwrwoGABM1Am3C04+hnvM4q844RMrLQWvjov9q3yRiElbPQRcrKivWmD/TlN5zZOrWukG4qZ5wpp0rm6vF80EYWU5tbjcudhFiLdxDBlRuucsIXjm2aigFYzOYWIrkURMdl9sMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ARl0AdwGZl0HIO0Ere5h0vUw4IzCF2C1uNyfPp5DhY=;
 b=UhQp7yYnZVWPSfSCtHFsdxKbpFo3EMldZvdqfCod6zpcxBiOwuUabZmBdwGnIs9MFSszqNIN9g+YD2Z4sK/279qugFmzNfUA1DIM+mHRbmYtgU9MAdLdprm+KMfX8zTNgfPeCeeDn/DRpB5mvwVSUDDR2tb8WV6gX8NsdR7Sae6esfXTMvH/rQSnwevP21ceEF5h/J8jGRqar7o1Zp8WQL64g+kIMsCJ5Taa3jChd/Qn66nA5rxhC7xSMmQvxvETiTnaR858794QteiPIKm+YKjkFPF9IdkgzILX0FdYrMkP5LvrTqpb3waIWPKdEk9uEYEJbbycvm6B5L/KsZV/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ARl0AdwGZl0HIO0Ere5h0vUw4IzCF2C1uNyfPp5DhY=;
 b=413oVPBX2DoOnNBgF0u16NbgzDW+ATcXgX75KJYZ2RLcdZMrIsRwjFZilJYfWwGYUGZNU8O5dVNj/kb7F1acavn1dejVnDZldAlIwOsEtO1sYOZDHdzZG4+1Ts4vR+TSvqarKfHytijfBL9dShgaRsGlxpgLNTO1L51oh4WSIq4VvYWH15eV8kIVCkXXlqhL/drSk52/wk8yo/y7kVRyiSLposdwTBwPqTiQE24ZiWsK75pV05ZA5i6fECNj2/AHobTs3OrN7AkME98PdGjIEd+72vqrWWgPf6O1RUK8pnJ5e8055NK1WHqgMU5UtGxKhXEMHWbWrJ/6KfRs5gw5Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by AM8P192MB0866.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 11:39:06 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 11:39:06 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: brauner@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH] selftest: Fix UB of getline due to missing var init
Date: Tue, 26 May 2026 13:38:48 +0200
Message-ID: <20260526113848.530105-1-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0153.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::37) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|AM8P192MB0866:EE_
X-MS-Office365-Filtering-Correlation-Id: fee621d2-712d-46ba-334d-08debb1b64d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	fz9T/K4RsUnZw1p2jbx8Ottlx37uFnoFXLbxse+s4Rb7eC3P21l5P/wl7ftZj+UMQxuEXpUbRepnqt8chUbFoQ9hAcI8s4JyZgtBXNIdFheRdjIAo+vo8s1HNOGvRcZPv+L/eMSfvYIPU0xS1MHgAJs5kGLwOWPW1vUkjTC+4Kn7mTw+xdl5mImGteTJ1EvT93fK0v33q99Bk28ERz5Xx9oDlulWLTb2hpCSIkb3ESZHrS6B045nfwWNVMgX4rUAD2ZxxiifGYD8lDdRITRgQG57BoNELf/3e8qFSaR6JjSut4SZMcQWQEEVpeniZG4dQJQ1QfIb361Diud9VZ9cSer6GilSpR3dAgbL3H/mxvOjUbGW6U12ZLmI78p3uJzjS5IMKgBRBpX7v9KB1Ew2t80R1NjwGrZ//oGi75dEiWzzPNx2VRT79GMoDxPwiQmYAEdZRlENiFmggUDLeVOVaOQ6s9eSF/Up//gb0X28V2xnu9l/GE74VOpTZEimhM95xdZWiot71vrLmusHRD06sSix3gYVN+BH52zHWk9KEN4jYUraBp9kMGdCXEYEEDuNIYmR9Dmwo6eH7m35rMrKHsk21VwEMYKd1NBAxnSvuVfhBwOPzNSPs6dwYbmPcoBf81F9Xp9q8MVXw1MDqIXlJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RMfPox71iKizB8XYnb7fhv/0BlGA610hoyusf+WLnYoLvKZFSqOvM5Xg1Ffc?=
 =?us-ascii?Q?2ZgzSbKVMxBO053YBRgi/puKbMZf4nZ1hgSVRI8Xycb1yuQgNI0JmIJhIsdL?=
 =?us-ascii?Q?5hQ0jzqlBwR+yMmNjZcVJbQPTQW5O9jro9VVmQq8LNXHLftCTZrRO0ar/3u6?=
 =?us-ascii?Q?4gaw2Xu1889PlaS8ZZLa4KIIkP8RmKOe+1UQxDOTYjQbHiz3p3BIOijCAeSY?=
 =?us-ascii?Q?g/8XWoMjKOhH+uQOE+8bDXyCL45h0tuU66aydL5YqpMAwM6W1mUSRQdxLnmp?=
 =?us-ascii?Q?ehUmjnmnTaCgD7obnDX71iKYMouyUz8Qweiz8eU/bm48/xvfSCcwnu2rlHnW?=
 =?us-ascii?Q?yWLbCjfwIcac8Jij2f3nOpDwZ1KA1yryASx/rzXvR/JEsswo8SdxbLzMsdd3?=
 =?us-ascii?Q?s/KGLSWxetBJzAqnaiPqiDQHhG7X17dcL3ozapLFaslaIm3g7KEXewLGu6Yx?=
 =?us-ascii?Q?GveiLJXTpf4dsRa4dK7C5jiLU2T3Pir9q8WUGSr+dAujna9V0g1DAAnMhFNJ?=
 =?us-ascii?Q?r4G+I3ttD/b4pWt+dJmgzDTI8rXHaSgbaNwoMp+2lAmJkG9/WT9aFnK1ILdp?=
 =?us-ascii?Q?YPQVtnAZAWYBe5QzDwiJpdwR5OqnCgOcGApuK3tUrqVGV3Cyp8OMSr1CAQ4L?=
 =?us-ascii?Q?0FzKLimBMc57MGWCTdjcWLlde2B4LNcSqlkS48kHnY2GCPtHT+dBDWEUW1/p?=
 =?us-ascii?Q?29t0uJwyNLcAe8lcUoYLLuOub1Z4HBcAzEb5CZn0QFg15Ydo/WXmh4rywj/7?=
 =?us-ascii?Q?lOES7Maxa4WrPAp94kP5QPUuGL8Iwxfb3VlLh8UaHl3m6TO9ww6Q5hcHtN5K?=
 =?us-ascii?Q?Q+E2AeFE8ZmbMf/+0cNzo71U/fneHge9nJKm3ugm+y5/m6Da0IkF9bXF7EUM?=
 =?us-ascii?Q?nhVfi8QFExtI7q5NRF1+9xFBZjM0lIjuotqwpLiUaY2T3zoFGlgVeYYFi5DF?=
 =?us-ascii?Q?N971688NCYycoWMdd0uz2k2Ow0+qDXR0fXfObsWeeIuse92M2iFkUrtJGY1x?=
 =?us-ascii?Q?5hWRqrISqme/SWKZKyrCpmdwjPWfqVMzsotHWtKYle2E6cYH9s5qS0wE/h/Y?=
 =?us-ascii?Q?8Tlc90cmZztVRaB9KafoAnSFeMECCZoieAMfBx+jS1qMfadZqsaqbf6o7kni?=
 =?us-ascii?Q?GDB/ef7vHZlReMNIY7jaBiI4ksEiSVCAZe0ai0TPfw2kNlZmju6tyrzBl6Ud?=
 =?us-ascii?Q?ygxfKMlF5qOmdno+C2WeInNKIEGztKeYAHJ/bbeyuUj2q5Xc3R0y1r1DcFZy?=
 =?us-ascii?Q?AeT3SunOfpU8MJb+SYRJPQQa3i5pIw4MHRF2E/XFEaqs3Gt6ofrzrOIiDbpM?=
 =?us-ascii?Q?BU30S/+6klsM/qEmpc171iw+xwWcqHAxWt13IS1R6a9u1KrTakRKoXoOYwgz?=
 =?us-ascii?Q?jZgduSJ7er2kOQxGQWssxuoAydatGg47626ea6OOudVPq55fR5BTCB+MJV/o?=
 =?us-ascii?Q?JLaqHsNeTy5qEvZklIjeSoCB1MuFnNVykNPTctRrBuzMBXxk8N7qqRK7YvU8?=
 =?us-ascii?Q?RQXRFO9+vXoaQNevfRuo7+lGaOn87MzzL40RlCwJPZGo060ayS879raE05tt?=
 =?us-ascii?Q?IMKiCJjmag/81Q/kgpPE/Im2qzRet3lN2j0oIWTZRIgGfriobl6dLEls+0LA?=
 =?us-ascii?Q?qCT5pbT9jLspujEYxOZLu7R34ewBEro3xJHypuNfG3Xr7buXsNXy3Swe/TJ4?=
 =?us-ascii?Q?Vc8hPMApheq2Xl/eOwpPqqi0FOnAo9WgVGkhczXI+oYWmjRepICwnEb2wpBR?=
 =?us-ascii?Q?Bp7wjxgX8IW8CWu2Ag9O5SbpeBxhmW176EM6+3ca6LQvMhabyyT0?=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee621d2-712d-46ba-334d-08debb1b64d7
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:39:06.4243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m6kkJ8UIyb+dMdbYXy09sEpK6Myr22AK8BgbbmXpYSUdMy4yyhREUJLDBAFNvYvJuDD+f+fZAyUWuxMcklKFL7R9Eey/UCBVX9ogsriQpZgZ/54fbaC9rYAA8z4UzG9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P192MB0866

Clone3_set_tid uses getline(&line, &len, f) in a loop to read the
child's process status. The code expects that getline allocates the
buffer for the line on the first loop iteration. For this, glibc[1]
requires char *line to be set to NULL:

> ssize_t getline(char **restrict lineptr, ...)
> If *lineptr is set to NULL before the call, then getline() will
> allocate a buffer for storing the line.

However, char *line is only declared, leading to an undefined
initialization value. Fix this by properly initializing it to NULL.

Same issue fixed in mlock-random-test.

[1] https://man7.org/linux/man-pages/man3/getline.3.html

Fixes: 41585bbeeef9 ("selftests: add tests for clone3() with *set_tid")
Fixes: 26b4224d9961 ("selftests: expanding more mlock selftest")
Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 tools/testing/selftests/clone3/clone3_set_tid.c | 2 +-
 tools/testing/selftests/mm/mlock-random-test.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_set_tid.c b/tools/testing/selftests/clone3/clone3_set_tid.c
index 5c944aee6b41..485efa7c9eed 100644
--- a/tools/testing/selftests/clone3/clone3_set_tid.c
+++ b/tools/testing/selftests/clone3/clone3_set_tid.c
@@ -141,7 +141,7 @@ int main(int argc, char *argv[])
 {
 	FILE *f;
 	char buf;
-	char *line;
+	char *line = NULL;
 	int status;
 	int ret = -1;
 	size_t len = 0;
diff --git a/tools/testing/selftests/mm/mlock-random-test.c b/tools/testing/selftests/mm/mlock-random-test.c
index 9d349c151360..16294bc7dae6 100644
--- a/tools/testing/selftests/mm/mlock-random-test.c
+++ b/tools/testing/selftests/mm/mlock-random-test.c
@@ -84,7 +84,7 @@ int get_proc_locked_vm_size(void)
 int get_proc_page_size(unsigned long addr)
 {
 	FILE *smaps;
-	char *line;
+	char *line = NULL;
 	unsigned long mmupage_size = 0;
 	size_t size;
 
-- 
2.47.3

