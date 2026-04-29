Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022098.outbound.protection.outlook.com [52.101.66.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD93E024C
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458558; cv=fail; b=dijlZF2z9sq7vQfVRwu8jwNVEF4tVvtc/vxDn6C2lfwB2Oawmz9eB5vdyv9YJlKFQirxGmZ8UgcoxVaEnQtvSFTo0ZRfXxBvnhkWbXlqnKtg2cULE10zzseOetpXd6oZOi4AUa97s6LqpjZaCLBCxvnLvDeAttUQ3u1AFnmYmfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458558; c=relaxed/simple;
	bh=ab+aV2jjqaw9XcvaeH0WBO7IE0PS5jSQv5EHwoezqHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HQGWmM8/xz7wmHKiUsW0tJG48hkQkoD3QK34ogusww4l8FAD373BzzshJ74D1It/CbpOfY+qze15L/HEJ/bumNctG5v8izfpgUrp6KJ3gcC6haZ5WOncGDJiiUBMiMvE2HKD3mpXnCTK78t7KJiLCpzurJVfEReOnWjdHpG6H44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=z2wxD19Y; arc=fail smtp.client-ip=52.101.66.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="z2wxD19Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0YlNugkFlZs2FCDAsEj0vnP+sJzEe8an4+EjY0NrKUNhMmiUH1b31Xj9XIQBfgvxLArMG9zzN+jJL1Ej7CP/Tb60b/8hu8NKrqvVQhE0OHyC3vbQ5FLSgBaCLq+1UUNB3tJTr3W7IGwOySS39QOjxLYjUWlRdayj5SoR3Uk2faeQ5JZHRiOaoMo6PdcOP3/1WNadtOr1xOuyWVt27djwMeMTrUdjq0L0+izMt53PvrSqCl3/Nicr0X0UKGUNzL1ZDci3E/GBg10hlpRGjhZWp528t7GcBd0TCRJ+tS8P0ofj2OBVavXaDZ7NrsMJxH0ysGKWDgK9U6NgYiA6+BX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DC+Llk5r35liRZ5xk/l5tBu5/oXBAGQjqYI+09LlCU=;
 b=nSaWdT1MS2euNAK6RzJIq4J/zzP3mQniKuH9dVvyUwGWI56+HLnfS5b5SgCSFrf6IYhd2waP1Bp1pylQ5pyhOCigNHsbHZprL5P0G+FBEzb7cadVlv0sazMsLbctgzu44TGv1xjRGUrf98jQfveLHTvHQ/5MqOOlrIAWLba52P15A/GUANhJm82i6G11DeumeVKNDkb5np1gGdPLtBscTStpJNuEDTHl5loEZEFSxHQ+EQnWiosqKcMP95I//EVMarze6TDFYiPO54/7kkX1KRnhzHVEYpA73Ew39sOc+6GsuPEXX9vFN1016GE5kznd5RdzI6K3AwhQexYBkmplxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DC+Llk5r35liRZ5xk/l5tBu5/oXBAGQjqYI+09LlCU=;
 b=z2wxD19YqG3cpYOBsfvXw81dDlwsYUqVnfks19xI7JlSYbLabOlVBOQH1IzFP38caMEDWD43Pi88+0ftC8NHIBNVuhAYFwyjiOcFbnBO50D/H1Bt+1QM84wFXmu0NrpPeMivjL9cYZresBdfyMzQP5b5ypMFvoouEb1ri4gRAFrMARQYlpmzoUeuZ+ifDqSpiO8llSZXSyeSKcR2VvJqM/xnsjjDcaKIrQuZm935SV7qKlkzqAUAutPHcsOIsGkNOxIKvDFCJ3iL2r4w4eiapMSc4Jq2r0il2Iev+xmct4IEUDvlAM1aUDKs3rZKNNK/MD6D985Raz2UtRFNRycBAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by PAWPR08MB11558.eurprd08.prod.outlook.com (2603:10a6:102:509::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 10:28:46 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:45 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 15/15] selftests/openat2: suppress -Wsign-compare and -Wunused-parameter
Date: Wed, 29 Apr 2026 13:28:11 +0300
Message-ID: <20260429102811.47214-16-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: c90133f0-1401-45c5-20be-08dea5da17d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QB0B4XF+AVpLyjgZFeYEb8iytstXxko1RFGORlH6aju/WBQ0FrxQYaDdu6riqkOf9+ZjOZCCTXkv0UGWx0eT7a4HhVEOM4ovSYh0Qhky04p7t0tMPyVmv44GLpXZkk3YnERhCE7U64wxJlGV2eANAZuARWAZdCOKEHbrYoXznkhf8avRIu7JPVamiu5pRqwxq8/JfAVY0PAVl5FBBtGk/ImTFnZe++ZQ01O+/JxCsQyM4yhghuGqt7m2HjbCcoumr20x/fRRi4+lpwsnxhPv7jDcKdYckynxT8w2w8vgQX/3TMwl1uKvI4+DX7HVHwtYq40A8HubayUv9QOPfEdg14D8USlsGn1llwltZyi7tHqFGTPieseOHESWQ3cG6A13VVYRnqyPG13LyOOJih42nBb3qVvXpfo2QI1u1ysw1GJmlmknJhxUsMe3J1JrzJ35Xfzyin97eKW19+RaRajgoPD9/WLIHZ0VU8+DfQzWu6msdtSWPqustYLg88yPH+bvSF5eCbN3wM+lq1XIUvXlvh+Oyq36cYT8P50mfpf8XvJ2c0zxO80m9LusGBOq2gmDUueXWyfE6JIo43EuC/gETiqMDuKAMg5jFEK667it3Ay7BLBmvuoxfUtv5486WpkEprNhzQLYZuP+98dejUjTtL743eSugmwuNT9/ATRHlfCmgewqBehMOn29SpQ5DpJ2djWHqAGGV0BLE5RYGjP5BbYbPxeIsH/uChEsYKaAyjU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzQ4V1QwM2RqdG1zVmJoR3VtdU1xMGhWaThEUEMrUHFZTWU2Zkd3TTVjRzhi?=
 =?utf-8?B?OWg4SWF5N2lMcmNJNjJPZ0dRc0pSS3VEREovQnZUcm9MdlJ0SzZIT0NBaGRY?=
 =?utf-8?B?SGJtenhmUTVpZ2llRE4ybTVzQUVMRkVsOUR2a1k1Ui9TMzBXaERtaGJIM0ZQ?=
 =?utf-8?B?emZGZXh3QUl4N3d0dTNHNGZtZHpKeTMwRFR4TUlDRmVtUW1SL2RsS0J1Rk04?=
 =?utf-8?B?UjZVQm5rRjlOMURzc3FBRDFhaFN0YWExcThKaWhSYzZ2RXJPaHFrQWRKM0lC?=
 =?utf-8?B?TFVWNkQ3RjdITHRCODVJM21yQzd3NncyVjVUUnJ0MVRzVHVHVnBYSzhlTmZX?=
 =?utf-8?B?blJGUlVvaWRkSk1PeFFPOVRTNzR1WHY5dnQvUGRmOEFsQXhrbC8wdGVGeUxt?=
 =?utf-8?B?a1ErV2dMck5XakZ0SjdtWkFleHZ2cDlzc2ozODF6RENMQksyK0ZpSUdzTDdy?=
 =?utf-8?B?b0hxQ0lsWGFVZzNnc1l6MjQ1bUoxdndpaWZWcmNINm02Q1R4UFR0OSs3bXNu?=
 =?utf-8?B?QW80bTg5bmJ2UDdCSEVpbTZxc0pKUTcvSHB4UmN4Z1Y4aW1WVDlkRkkrWTJQ?=
 =?utf-8?B?Q0MvT1NKVXV3WlZLUDZWaXp4dmxlSkFqeUVrM1psVnNQSERkNVp0ZGtIT3dz?=
 =?utf-8?B?cnpqeXZUQ3BJbzhqcDdYY2pHWXBtMDdNTmN0cXo3clp1eXo4bnFjbFRQMjZq?=
 =?utf-8?B?alp1TmpRTy9rNlc2ckpRRlA0ZU1RTm9FalpNakYwMVIxSGdtNHEzYk1rdDdQ?=
 =?utf-8?B?Y0ptNXhXOEhHRkZjamVvSkVIcnN2OTlkNGN3UHNKY2dvaUpTSmJjN2I5QVc2?=
 =?utf-8?B?NjN2Qm5SR01nT2EraFRFNjlxdCs5cmlpSlhGak5pYXJoVkhqZTdiUm8rTy96?=
 =?utf-8?B?bzRvWmVtKy9HYTMxSHF0WFJYY0dJQkkrODA5QTloekU3NEdXNHJLMGNtMXZt?=
 =?utf-8?B?b0ptbUxnV0MzRUQwVlRseGJrMVlSclg1QzlxbllOK20zdi9hUGtvRWlURWJX?=
 =?utf-8?B?ckUwNWxhc3M1K0pPam9xaWcxQUpqUGJyUitrZnR1dmU5Mm1HSG9vbDhjSTFm?=
 =?utf-8?B?Uis5MFZmUlVTbXF6NEJ6Wk5ONVQrL1ZSN09sYkpCZHA5bzdXQ08vQ1BWTUty?=
 =?utf-8?B?bzJXVW15cUxHVDNLcHR2QTRkZE5qR1BpVWkzYnJFOWRIcmpWbUNuYWl5akMr?=
 =?utf-8?B?OGNFZ2pucW12RWFPakpDUjR3clArdTlqdmZMTjFTb2VENjVKa0dpMnhsOG1h?=
 =?utf-8?B?NkZvdVd5SEJidXRhZXdkSmMzVEtnMHdhK3RzeXJJaUI2V20yM3Q0NkE1U3hN?=
 =?utf-8?B?dGJmenUvTkJzMnBaM3Z5a1Z0NDhsL0hiUDRwMUFqY2VOSm1MRVhMMVhvZ3hU?=
 =?utf-8?B?YUoxdTlqc3ZneWJROGwxVHo0Wmo0Q3lPYXZnWFord0Fmb1VRdTZKVWZNOVlk?=
 =?utf-8?B?QzFqdmxtaS8wYnRtYzVNRzJkZ0hNWGtHWlV2MFZoUHo2Z1Zldm52Z1ZoUUI4?=
 =?utf-8?B?eFRLOU9xc3RoeCtBdVZuNm5OVGtWOW9aU2Vya3NTVWxjcnN3aWFQK1d2N0s1?=
 =?utf-8?B?c0xjQzgwckljOXNDYnd1K3pyWmUrQ3ZMK0I2U2JKWkJWUktwVVlneFlsNFFz?=
 =?utf-8?B?VXdVMkliVU9GUTJYc0JYVG1UbXp3eTlodTFUQVBWbGc3a0V5QmpGT1hPRmlI?=
 =?utf-8?B?QVBsWFFRUWdGZm95eUFzbW5YV3RKeWFkbnZVL2FHczFzb3Q3VElKaDAyd3Ur?=
 =?utf-8?B?SUdsZFRJSzdPS0g0bFd4cU8raW5WVTJFdmR2NFQ0MG1wbWVuR0NGVFdwaVd0?=
 =?utf-8?B?bFltV0FsTTEzNzhKVERpWnZLNXU4NThvdDBXUy9KT05xTWVOa3Q1YWtZalBI?=
 =?utf-8?B?UHdLMFJMa0x3cUVGMWZ2SkRrZm1xZUV1bjdTZ3BvZStYRW1EQnhPSHJjNEk1?=
 =?utf-8?B?dkNzdlJsWXZNR0VuYkF2ZC9NaTBIbGxkRXFVREx0aXNza1RlU0lCQ1hnSHJP?=
 =?utf-8?B?bytiM2YraVhYaTBQOHBNZTNLcW9UZkZBajFiZFVUcnVVLy90bERuL2dlNENC?=
 =?utf-8?B?cWxrUjBaZElsMmVtcGp2TXA1bkFFckl3UXNJNTE3SWQrbTRwYmxycjRBTGpC?=
 =?utf-8?B?N3FwaFJsK09EcWhJcmZuVTRPMHd6TE92ODB4bjNsMGY4Y2lCNk5kQzFQQ1V4?=
 =?utf-8?B?VGhXbVNYNVJIS0grc2wrT2xiMVJrbTd4UktJZStJTDJ0bDdxN0EybFptWEVw?=
 =?utf-8?B?Uy9vZ3Yxbi9SdVJ3YlRJdFVFWmdQd2RNbFo4b09FbGZaa2RDU01sSlN5UFNZ?=
 =?utf-8?B?MmRKTVYyKzlTQmpKZjNuZmg5QkdnN2ErT29Eb0JBSUcrUU1lbXN5cWdMbEJM?=
 =?utf-8?Q?wu/o29dwa3w8VAyg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90133f0-1401-45c5-20be-08dea5da17d9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:45.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shYdqHKL7I8PPOj90kwOzjGm69y1rEqFQQLroScBmDH+OJuhChCK/cgZBkElfheCfz8DmodqlMjZkXCVkeG942srPh9BXTl2eH1QI8Jjtqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11558

openat2_test.c: In function ‘test_openat2_struct’:
openat2_test.c:89:27: warning: comparison of integer expressions of
different signedness: ‘int’ and ‘long unsigned int’ [-Wsign-compare]
   89 |         for (int i = 0; i < ARRAY_LEN(tests); i++) {
      |                           ^
openat2_test.c:93:35: warning: comparison of integer expressions of
different signedness: ‘int’ and ‘long unsigned int’ [-Wsign-compare]
   93 |                 for (int j = 0; j < ARRAY_LEN(misalignments); j++) {
      |                                   ^
openat2_test.c: In function ‘test_openat2_flags’:
openat2_test.c:246:27: warning: comparison of integer expressions of
different signedness: ‘int’ and ‘long unsigned int’ [-Wsign-compare]
  246 |         for (int i = 0; i < ARRAY_LEN(tests); i++) {
      |                           ^
openat2_test.c:296:44: warning: comparison of integer expressions of different
signedness: ‘int’ and ‘__u64’ {aka ‘long long unsigned int’} [-Wsign-compare]
  296 |                         failed |= (fdflags != test->how.flags);
      |                                            ^~
openat2_test.c: In function ‘main’:
openat2_test.c:326:14: warning: unused parameter ‘argc’ [-Wunused-parameter]
  326 | int main(int argc, char **argv)
      |          ~~~~^~~~
openat2_test.c:326:27: warning: unused parameter ‘argv’ [-Wunused-parameter]
  326 | int main(int argc, char **argv)
      |                    ~~~~~~~^~~~

Use size_t for array loop iterator, explicitly cast open_how flags field
to fix -Wsign-compare warnings

Remove unused argc & argv parameters to fix -Wunused-parameter warnings

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/openat2/openat2_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
index 0e161ef9e9e4..a8b73b62c7c5 100644
--- a/tools/testing/selftests/openat2/openat2_test.c
+++ b/tools/testing/selftests/openat2/openat2_test.c
@@ -86,11 +86,11 @@ void test_openat2_struct(void)
 	BUILD_BUG_ON(ARRAY_LEN(misalignments) != NUM_OPENAT2_STRUCT_VARIATIONS);
 	BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_STRUCT_TESTS);
 
-	for (int i = 0; i < ARRAY_LEN(tests); i++) {
+	for (size_t i = 0; i < ARRAY_LEN(tests); i++) {
 		struct struct_test *test = &tests[i];
 		struct open_how_ext how_ext = test->arg;
 
-		for (int j = 0; j < ARRAY_LEN(misalignments); j++) {
+		for (size_t j = 0; j < ARRAY_LEN(misalignments); j++) {
 			int fd, misalign = misalignments[j];
 			char *fdpath = NULL;
 			bool failed;
@@ -243,7 +243,7 @@ void test_openat2_flags(void)
 
 	BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_FLAG_TESTS);
 
-	for (int i = 0; i < ARRAY_LEN(tests); i++) {
+	for (size_t i = 0; i < ARRAY_LEN(tests); i++) {
 		int fd, fdflags = -1;
 		char *path, *fdpath = NULL;
 		bool failed = false;
@@ -293,7 +293,7 @@ void test_openat2_flags(void)
 				fdflags |= O_CREAT;
 			if (!(test->how.flags & O_LARGEFILE))
 				fdflags &= ~O_LARGEFILE;
-			failed |= (fdflags != test->how.flags);
+			failed |= (fdflags != (int)test->how.flags);
 		}
 
 		if (failed) {
@@ -323,7 +323,7 @@ void test_openat2_flags(void)
 #define NUM_TESTS (NUM_OPENAT2_STRUCT_VARIATIONS * NUM_OPENAT2_STRUCT_TESTS + \
 		   NUM_OPENAT2_FLAG_TESTS)
 
-int main(int argc, char **argv)
+int main()
 {
 	ksft_print_header();
 	ksft_set_plan(NUM_TESTS);
-- 
2.54.0

