Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F8A470128;
	Fri, 21 Aug 2026 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306787; cv=fail; b=UXJhCC/e6ZjE4mR6gNq3122r9StXxT60PMtFYMZU0EpdAaA5fH1r9PJlt9XhMtTtQkK2+NrwVJOS3QpoOyi3nJGilGZA0GL4Zk8Er9EmZ2b434BP3eOS2jYdewXO+1bxEuQ5VYf0uTbL0qv7WZt2qjxIH1RS3thvZcjC4JVML1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306787; c=relaxed/simple;
	bh=0OiZHusTYYUNWBQIj9QmLqZ8YblOijIpgmAVreELxq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YsAPEe/l+3Ejm38zPq3plftsBwjBTVSoaadfHVTAFv/8jcs43YwU1js9g+vrVMyi92VGOQ2aoSBfDlsu23Vj02uwm6FhdUeT9Yzmvi7mK3bBYQCm/nSOnkQuC73s7F0bfNP3qJ+YkKgVn4+M30xviKpjnjGReeGQy0E5GjDRXrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=evlX2uXN; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="evlX2uXN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwmfAOu0xfLefCciXkQckJrLv4foHCzbZMy63G3vGhCN4QwiMumP/5Jn/c2re36nyeiK6JzyvR2hwmxntz7YqZs8eiXNCj6gvfi1Wx/MQag83O/3lQ3IOTTr+Fon4LhPuZcMGjwFQerS9RPWVMbODNsPhKcLrns/U6MOO4FV6ZY5CD/QhMqz7E4ZKHGE7zwstfeXjXV0PdHV2TCmrvthYmv8oR252I4R2cM5TpjIpxJdM64F+EsONz56z57XuzR/RzO05zxhBgKRSfUIPT8DZgjQLFuMRRayn9cE/cjs5CQH/I+OjktbqyOLo2epOiYk7cj2HqkMYQ/N9tdf068N6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMdsfxCb6Ml7dIJ1rOl8YSZ57+N36Dp4sk9i7p5uaak=;
 b=tOuu+hu5VbI4w8SkduxnnvdRP72ZPx2vJUJghktrpXVr3xBX9EKGWqsO5WAEX1nU7f8skaWRYmrg7ApC1PY+RmRwfveM8Yvrz74nT6ufUWaWlj/2SgCDBsvKrevhOm/bGHP2rMO9LmJ5wKCAvsrfXD/VVwGFhpbYPvM9L8ULfozsBxFzuw1BlL234dSBkPcFzIvQozx5Uf0WCQ9jfuuw+Xtp7+sk+LT8SLW73OOm+nQBYoKi5O2VBqUJ/bs91XlThfo6TVK0jA2l2bxrtFC3sb9TMUWU83RSIeky6eylG5tYJZioyoQyI3TU8HFIcsvVc0E7bfo443muiPXJ132Czw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=alien8.de smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMdsfxCb6Ml7dIJ1rOl8YSZ57+N36Dp4sk9i7p5uaak=;
 b=evlX2uXNYeQsOKddz6RVQBXs0vHOYSG8hlSMz8A4sysW/8DxaAmNmMbDkhnsisF8FBzy0PPk5iemLJbb7iKDSwQZrv+7KZSUzZ0WpKPg2Qw8FQArU35JryB7goZQ32tuf6MnmutU1nq87fKYEjXIKsWrF86PL5p0RpHN1qzuVto=
Received: from OS3P301CA0001.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:21d::18)
 by OSCPR01MB13394.jpnprd01.prod.outlook.com (2603:1096:604:334::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 10:06:08 +0000
Received: from OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:21d:cafe::3f) by OS3P301CA0001.outlook.office365.com
 (2603:1096:604:21d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 10:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20F.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 10:06:07 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.4])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 9C8953000164;
	Fri, 21 Aug 2026 19:06:04 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: luto@kernel.org,
	tglx@kernel.org,
	vincenzo.frascino@arm.com,
	shuah@kernel.org,
	thomas.weissschuh@linutronix.de,
	bp@alien8.de
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH] selftests: vDSO: vdso_test_correctness: Include linux/types.h
Date: Fri, 21 Aug 2026 10:06:01 +0000
Message-ID: <20260821100602.77680-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20F:EE_|OSCPR01MB13394:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c85da27-cc40-4a4e-014f-08deff6bd1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	2EZPhH6EG8yoO8uz2iOAr3/WyvmS4u+0PzEnPCTA/4wyck8JdqrhHOixy1OJjzIwKL2h+n2YsWvOaBbXEDImMv88fx02sj69jHyIop8nza2pN/CGf/M1KHCRj4ZwrWE2+VuYP3w45iKpyr1CZ3m/FuX3v1+uzVCwSDxyEOfUIbPTLbm0Orw5G8PfffQ8AvOXKvH1zvHn0TJZVbjLdG7QmjI2b08YzwFsOWpENU7ya5baKNE5lKIA33bOgdfcDf29HA10EdjqN9fNU9mfUOilYkK/+DAG/T0lEWr5rHsXPcYqar3wIZ74L4GdwhdtSF9/9oDD2j5E58EwkLpcBb0r9jB/iXXD2ofaHlzZPkjpBzRp41RLcLh1qOX0yzMB9WGhD65Cqoemq5QPxTuTLPlK2s0ulbSGgSpKUuCZDSaxFY4ZxjVc1iW/okSFQs4CvONNl8TWIGsjI0bEDGkfJe0VabxDh3Mq3bLbMm+1omO4EsQKcH/emV6SEYdzhrEDQyaamJ3uxdjP0ztH2wk6JCNCJJab+pKydMIWeo4ElqrOkkcfqXUaFbhQVg14mC7Qp2XeKOPBB4QJeSMrrQX4qXNDeQtengeWk3XS9mFKseYxZLq+QLPrfLDhOzQFg606tLDD0OoYHUzbYDNJ9jUcW6wUPbDaQLf0gesf2gSWmTFg0/dQvrCf8lwki1XWeo8a24KCJjtXebCEg4RNt3qiq6WKIg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+/xCBnD2oqqDYefaxL+JOY1EedWfrYJidCEvrYn3AYMSc+Wg+u61KKdm146rZ3lgH+3UZ/S5clztYRVsHBC7WYLIonQRK2UgQjCOVTxo6TuZA7lkQLQp7lCXRPM6+BPcIwugwcvLr1qZG7DQa+MUWUajkME6ttrCYoJRR/V/TBjC4BZzWQhC2Fbpq4HwbsgFJJGDapfv+2SF3BZYJHnU6c2IRgwPLda7lF1yz9xyWQmeUMjqySCY+mJ5vtAt448/OIGqybSosL6k2ta/Y+AOMCvtY220DGDNDGonOX23znLFIAGil2LiiAXiQBehVo2lTrQrkoW8oqI7giHKMJk5c3CGPD7OhtxJNuc+bUTUtFm/Lu0kjp2KRK0U0iGOVhaU4gqa43y34V7Y88tpQJP4LtiS/+kw8w14JTeBHZCLuObsrq+iNBb7shcPLye41ZAs
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:06:07.6906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c85da27-cc40-4a4e-014f-08deff6bd1ad
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13394

When cross compiling the vDSO tests with a Yocto Scarthgap SDK, the
following build errors are encountered:

make headers
make -C tools/testing/selftests CC="${CC}" TARGETS="vDSO"
  CC       vdso_test_correctness
vdso_test_correctness.c:58:27: error: unknown type name
‘__kernel_time_t’
   58 | typedef time_t (*vtime_t)(__kernel_time_t *tloc);
      |                           ^~~~~~~~~~~~~~~
vdso_test_correctness.c:60:1: error: unknown type name ‘vtime_t’;
did you mean ‘time_t’?
   60 | vtime_t vdso_time;
      | ^~~~~~~
      | time_t

The code uses __kernel_time_t without including the header that declares
it. Fix this by including <linux/types.h>.

Fixes: bed0053a6303 ("selftests: vDSO: vdso_test_correctness: Add a test for time()")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 tools/testing/selftests/vDSO/vdso_test_correctness.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 5c5a07dd1128..952ff5784a0b 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -18,6 +18,7 @@
 #include <sched.h>
 #include <stdbool.h>
 #include <limits.h>
+#include <linux/types.h>
 
 #include "parse_vdso.h"
 #include "vdso_config.h"
-- 
2.34.1

