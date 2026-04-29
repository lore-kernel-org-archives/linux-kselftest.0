Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022098.outbound.protection.outlook.com [52.101.66.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1C63DD50B
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458547; cv=fail; b=lrHTVf7eS7YpS+Gx0qVTuIRSYkCh0O2Pg9hO3Y+lS2hcY3fnG4hSQfnzE4OnIQjZYGWXlWX/+VegAxLadvQCVSVIV0S3gdvuKlgijbLjkOB3tJ1pdD+DT+DlGUuOdLvCNKVVpNN4wfWPXL12aNTj0q6+vhMv+5FRijgWZq+kI60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458547; c=relaxed/simple;
	bh=QnqRYFB29uIp5/5z93fUeePIwY3ItEXeZhh/XBz92sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nBsZZ1UKTjGTxnKHYZfNJLupTFTSVALcPJEOSXZIEUxjCzhPAaUU5XTVp8JqxNcFHa14D/hrby5J72p/f5pTc3v8Im5dVi0UVS4prawT1kR7z7ooAjUoWyqID/mP3QM+R6/UhMX3soGsOnTNr9umZ2L2ZYVJApJDrUweu5K+5v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=BDBC+gYH; arc=fail smtp.client-ip=52.101.66.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="BDBC+gYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWHCwP9aINy96zFwpa7UY2TVPCBqTTM3Y4bHXrYypJtuOdcv573tzbOqjBdw/TaiuiTnHY9fM+sqXcfjx/rbBVz2SdV0ivht0EkKHQ6SC3X5u2R6nAZpi56L24GdCHxCcHWhydGop5ME9m0I14p8o0+FIX2Ah/pgLz7Xkh996zfTI+1C3FlXdGREypMkyRkgdlq3ITBKhOGEF/d6EFHrgGQVVgfCru/vCG0akH3tO6g6ps+P4AlvD2jx65E0e5gbR18FX4xouMpazQSCrHWUGBeEoc4/LOTx4q5XhYRcZts3Wi6VsWHKOkCAfYYxUcnp5J7htInhzIFIzEQi4y4xqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1n9yLFpgKMTnESwIr/vCmq4lTZS7688/++KZZ2CK4Y=;
 b=eZjd8F5ughlillv6pryk47Lk2PRYwZdyJyJ8nvk9C7refdnQ5/MbcNgVADmr8lIc4rISIZa7969UpV0I09MaubRxXrd4Kgsbt8Jz/waBBD0xWnzBKMNvaBZPc+Hf6NltAua+50Y5qw/OfTG4mVc/pBuvswQlqtpQ2zs+MMbGhgBwvI+KK4XYDCDVk6ban/3pq1CFpRVEwiWtyJxJetdQVfSRwK7bFR6XQkE0smh/o6rNrL5jrVyPFQALoarK18cjaB4PZ4aEPLXWBiNJIGMMCprcKyYwGl5+OdgLkz80lzESxpR1jVOg5/u70RwTRAQFbfvo6UW+Qsjc7XlKyxsWDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1n9yLFpgKMTnESwIr/vCmq4lTZS7688/++KZZ2CK4Y=;
 b=BDBC+gYHDUSdZl87C3OGlB8oht0skerZkU0/KspudS6VFB+MInBMJc8YWt5Lv1x3ucjkpJ0QkJTB2yXpq7y2NgoWM9XGv4b8GJgyQ27aVCiGrDdey4aynlxadj4wrIXT+riXWXl3APVy5aAoehfqN7mAE5l8MNdtR/bn+5pJDaPcmddwZUJtmkCFYFGj8FV2jiEWmx+LddFQvYB5VjpYRQBNC+5T9bbb4MyCoznSr8G8+xlUO+MZiejUJnADjHAHDNr6gv3cqC/yMmfaUBjixD5gWDQQa+mSZ5RQbe3loW80AUs9mAMP+25nigdPRQ0dHdlZt8pQQPgfksXzSK9VfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by PAWPR08MB11558.eurprd08.prod.outlook.com (2603:10a6:102:509::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 10:28:45 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:44 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 14/15] selftests/fchmodat2: suppress -Wunused-parameter
Date: Wed, 29 Apr 2026 13:28:10 +0300
Message-ID: <20260429102811.47214-15-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
References: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|PAWPR08MB11558:EE_
X-MS-Office365-Filtering-Correlation-Id: 03111083-2049-41b7-e611-08dea5da1751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AvzNk6ijRV4SLvnSKYlUo5ozU/7CZYYfNigBEprQNiRYX/v4nXAB+7UbPHIPI51Dpqn3ivN2XziQrEqnTDKPP+wg83pbGkzGzs87DnXB4nuaDW/I1osbCAwXX2qMVVGwm6R6zjh6fQ4w25gJB0iVf2M5BnT1ZPKKRAJz8Vw7R8M6SxCYVcNQpm98e0qo2s6kMvcnZcgq5+0SQIxxhh1IT2vla2gFdWVO/lM20vtk1jx73MdqQF/EOc63gotB7gihoNSZBIH0qLo0UtdTjF0vY5TkscOcatCYhiw7KwiBVvG6jyLy2FFQfhmopMxU2paccT9P9aawp7pfDsw4Qkmb5tFtI3rwD7JPqQP2w3Lk6ROoRV+MpGjkq/IVrSP5BIEa7hR0MJmellz/ni95Rj6zBF3IzHkflW5kIveGj1SA+BwlcHIcxnFQCZOHiOvTMdzbQjH+5vqr39Pdi8Fvi9LUmIYgAXo0u+Tp4uMaX2krjh+52YS9cBuBaYX/NidwR+8gKSMTLSz879DY2zuf3uGu6wAKqZW3lFauhvhyci6yUVNvJA3PNFEQlpk0Giwtu7BqSpLxr4lLcXsZvn4DqLvd5ONB94g/WWmwJ0+xlsDtH+74gaWNYnP3C0X6BQWhvfeJd6P7yH+QST5ABLolLSBBY+NWx/JR9RsYM6nGgi8mxIODn0H8peochCzxf7J2cwklu6XhXlIb5gBuPO+yzEDkeOxN7TE0ZiJVt0JQACCmp1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0drME5NdFFtMXVUcXFoT3lzM1BOWUhkTUV6Sld3TDdpbTNmZGtFUWJsdDMx?=
 =?utf-8?B?R29aVWhsM2EzNXZ4TG5OMjhONEQwcno4TlRhWW16Vi9PR0JSNWhjT1dWa1po?=
 =?utf-8?B?bVhSa0V5ZlY3SGdpaXdTT1pabUsrWUVyVFZYdWhSeWg2WHdSdjdqVU1QQ1py?=
 =?utf-8?B?ZXlMSzU0OC80N2NqenpWMVUyYjJrQStqQnZsS1JnSWdZelFOelNlR2laSzNi?=
 =?utf-8?B?V2RVTWh4Q3o4RTFkakVxU3cxNkU2WWJGNTJ4TytRVG5GMzl1S1FsMXg0bmtW?=
 =?utf-8?B?S0p2aGlZbXk2TkpvVGIyRFh1ZXNlM2x6a2h0Vk5OOW1wZTNuNjFtYm9UU0lK?=
 =?utf-8?B?YmwzWk1SaEo4LzRmVlpybysyU1MzdWtrUWR1aXd0SHFrU3V3aWxuRGw1NXFq?=
 =?utf-8?B?eldBdklaWjlscXJDWERHWENKMjJBekp0K2JCeHVVSGEyaUszOGtGdEZ1bVg4?=
 =?utf-8?B?RjlGanhJU1IyNldZNnFrT21SL1dmNzIxVG8ra2p4ZlRUcThzVDBQQ2FkUnhZ?=
 =?utf-8?B?bmtLdlREUDVlSVBoMFRrd0pjY0VMZVBGK3QzaWNCcG5MOGpOU0ZuRUpsbnRM?=
 =?utf-8?B?TElUekZBQ1RFanZiMXVjSEJhY0RRUnBEOWhQUENOMmp6VS9HUWR6cFRBY1JD?=
 =?utf-8?B?ZVFDYlpSWFpVRHdvT2FzUXlUK0lGZXhFYWdLSHE3ZkNjakI0VlpScFo4WW9N?=
 =?utf-8?B?ajBvaGxVcGNna1VyQjNGWVZNdU9lS0RmdWZLVmExWTFuTlRXK25hbmxsN1M5?=
 =?utf-8?B?ditoTXNhNjZ5WEp6ZUg1S2pPcHpaMEQxYlVGcjJ3bmhzbFVwUTFDNXpoNW5I?=
 =?utf-8?B?OFRIcmxFcG81Tlp0OC85Q1NPUjk0cmtwRE1GeW1pcTB3RE9yOHYzbHNLYWRm?=
 =?utf-8?B?amhEdld6RXc3K2c4ekhkRHZ5RlZVZnVNVVF1SHBMcW0yRm0rYlAzMTdLYWhF?=
 =?utf-8?B?eCtlWEdrSG9NSFF5L1NlM25iMkpGeHFpRCs3Qi93RE81RUQ3M2M4c0p1cm5I?=
 =?utf-8?B?cWZTRk54OXMvcWk5VDhSdXQ4aGRNSjB4bFp6OElQeEJxYVQ4MXkzYUY3NE9K?=
 =?utf-8?B?dkpaSjBjaXJMR3doWk90U3dDcW9QSXh1Q2VaZzl0TWpJQkZ0U3NkWjFnWUVk?=
 =?utf-8?B?NFJ6dnE0dklyUzZXb01xakpYdnpPSVplMlpIRnQwR1EyZVluVVYrd21CVHhv?=
 =?utf-8?B?ZTlQWEludGVMYzR6QWF4RG5objFVL3ZpRTZEZXcySkxLeVMvS0R2dnpFOWhp?=
 =?utf-8?B?aEpBRkFFcm03aXpvUk9uMngvSWdTRFp1SElkcGZZVkhTOWVuR1pFbS9nV3hK?=
 =?utf-8?B?M0FvQWVQYkkyT2lOZm9OMCtQaFg3anZyUTF5a0d3azBZOU1pOGNVRVFMRjRN?=
 =?utf-8?B?U05xY0ZWUW1vd0pmR0hjckYxWm9ybTJUYVFabWdsQXJSNC9WNDNSUEtPdWI5?=
 =?utf-8?B?dWFGN2JyeWZVNm5STFZ3dDNtUFUwZjAzc3FGRzVuRE9sOVlEajAycUUxU3Bh?=
 =?utf-8?B?T3pudFY1ZXpLdEZpZGVCdlRMclo0QlREaWVYWWtMSVNlMk5DUzgzMFd6bGpL?=
 =?utf-8?B?ejREVVlLN3lWNnNIakRnaHQreC9JQ2VSK3pqVytKd1lkTys2Q1lVc0dDc1dY?=
 =?utf-8?B?R3libHQzUVUwM0cyVkNZY2ZleWdhMUV6UDN1c0JTSmduemx0Z09KVVV2TTRh?=
 =?utf-8?B?eHdjUzY3d1lRV3hEd2RDd1d3akRWaG1CcW01dUFSd0gxSXRzSCtseTVuSTdT?=
 =?utf-8?B?YklTTDdzUzRGOGg0ZElOUGpzd3JzTldJcEhtVVlLbUJQN0MwZDFyUklGNzRR?=
 =?utf-8?B?dGllZnNrZDBCNFcxR0FnM3NpM0h5dVRFOUY5ZjJ4UXk3WGN5TTI3WDBqRm5z?=
 =?utf-8?B?UlBqUWJoRzN6cEkvc2F4NWNMN05FSCtOSUs5cTZEZWMvSE9ab0F0dDNXcTRj?=
 =?utf-8?B?ZGgvWENSMXFrT28zYnE5M3FlU01pNVhTN1FpTzRRSUdiSlNSenZzbjJLUHJS?=
 =?utf-8?B?MUc5Z3BydnFKRnlnQkNrTkpwNUpVUStJdFloUzJ0WitkR3Z2Y1AzVFduSHly?=
 =?utf-8?B?YjRhVCtSVk1UNXJHNThuS1dCaXdwOXNIaUlQaWppMHFjTmhGOEJzcWhHSW1V?=
 =?utf-8?B?RDNBbHRmSGZrcWNMTFU0VElVcDVQYXNISlFUWVdSQlBEVkZTRmJwVXhvVEdr?=
 =?utf-8?B?VEcwWGdFc1V2azJuSzAwM0tDNXNOcmRRN09QdzVkbXVCZklmUlhtc3RmNFRH?=
 =?utf-8?B?L3FvUFYrN3p2d2FCZXY0UEVYVlIwcUpOYlB0WEh1M0NmTkVvOElWbUFHS0Jv?=
 =?utf-8?B?bm8vUUR3S3BtSnpvZklqajloWnc4blhpUHNWWGl1dDhPZno3T3VSZ2lGbnN5?=
 =?utf-8?Q?Y/6k6vxcPJ/4aXsY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03111083-2049-41b7-e611-08dea5da1751
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:44.9148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMkDJeoDwx5bnawTl8H/gzXGXiXD+6uveSWjc97B4ABEcWwQU2EAU2KX4WY7j8o8gcmoE+Y1maRMPpeV3g6lgNDQy5e7blEZT4XGItdLJ4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11558

fchmodat2_test.c: In function ‘main’:
fchmodat2_test.c:191:14: warning: unused parameter ‘argc’ [-Wunused-parameter]
  191 | int main(int argc, char **argv)
      |          ~~~~^~~~
fchmodat2_test.c:191:27: warning: unused parameter ‘argv’ [-Wunused-parameter]
  191 | int main(int argc, char **argv)
      |                    ~~~~~~~^~~~

Remove unused argc & argv parameters to fix -Wunused-parameter warnings

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/fchmodat2/fchmodat2_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/fchmodat2/fchmodat2_test.c b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
index 8e1b6384b319..409cca0dce7c 100644
--- a/tools/testing/selftests/fchmodat2/fchmodat2_test.c
+++ b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
@@ -188,7 +188,7 @@ void test_symlink(void)
 
 #define NUM_TESTS 2
 
-int main(int argc, char **argv)
+int main()
 {
 	ksft_print_header();
 	ksft_set_plan(NUM_TESTS);
-- 
2.54.0

