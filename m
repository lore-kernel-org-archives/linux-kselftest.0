Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021139.outbound.protection.outlook.com [40.107.130.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8336E41167E;
	Mon,  3 Aug 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761355; cv=fail; b=a6fkUFiYa+dEUjox+R0/fkVOHS2IByWmAFoeGRhwE6xEoVXpztAoBBBYqy5keG1k9+mdDjUWoQc7SkQtd0mS4/H+edRGZDV3ae7e+VdI9FPgf0M5+mio4J+3Qv4Qcls8Q1r4++Zu+dZcR7f8o0QTigKy+s6sd7JgOyRwRNpSRWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761355; c=relaxed/simple;
	bh=DRbFckd6LotWiwMexA2tBubwt7BoCE7VfG4WLQ+AIZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XU+e3NFuRAtciyb2Bm9buLMTm1/Q3MINQdBCbQRoOVWK4fWJTNyFycsUGQSd5OevgSQj6Y+eNyDJWNf3ES3r5QKQuV/r8/lIKq+EBAUUPDiOqe5AWZlDQnJcFIfGnsC70gkdtx2M9Vl/88qDrYU16NchSNrsDfTnBnH+uVBe4qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=XI/iGd5k; arc=fail smtp.client-ip=40.107.130.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="XI/iGd5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSspY3KZ1r4h8BPF6JR6NRa1ZpVPbUNJoh9BuBH0e4L8vKL8iywy3+Aw3aE9QXfMd7B3DqG1x5eo+/JQ4lY3wFJmu/lj40Cro0G03DqBPGOvKvadDyFSBsyQVHYv+vU473AQ/Lvc2Xcgz+ULm2m+ONBDniJUMGj1b6L7c6B3nhF6/3ahy7mEfVDTtUkGwYBhWmVM7NDJpP9r90dQdnBa5smVEYWw4xEbBrXYanjVlBisCtKmuQqw7iR5xXaQluPFlqVYNxNWyop45DB4f4NfZc61Ml6w2Wwm+BtycsHbagnX0/llPXkzO1mOtj46sHuvwfoJ2R+QldUqYt/h/dxLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaD4LW58bX4jwxTE3GfsEMxAcaLhvS7uY8Azc8OYDC4=;
 b=lLIOUiylDymOBC5dKMhpcfugaaZjvQv4TFJYwDGHxeCkWqHG5ME+AOLTjvrt4o9w0iodHqOdxF0qob1Yvox8K7QdI0N4iHIospPZxcKLPa6CvDG5Q0xGPPHRetGWTcdqp+GYj0ofH+T3wQZNNLkR8v7WsTp7JhGRhqmfirgfPABHioQjXQmc5Vk2wyiJA+Xygi9nCbry1WKbxbFHkS55ulbeUzDSsEpAjaIJ+7K7lGC0sj5RhAJDQ8bmR5lFFVdyOAKnzVk4u8mnmnuQD8k/VKw3h8DDYl9C7cR1tKDxTVttj02BiEALisK+XZjVdgk/kAz0ngUvtDgsIOllWJyOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaD4LW58bX4jwxTE3GfsEMxAcaLhvS7uY8Azc8OYDC4=;
 b=XI/iGd5k8KWSdVo2NtIEZaU+DJYR8m5J7WtEndVYeMvuDVGmeT++zMZxIjvXqB5PGvLW+y5ZFeOY+7bjleE6hcNrNKQvkZx/DlvTeH9fJhedCz/PMIt8DX86x85Bc3kIPcIE0ADz29f5t+0fAx+ckSNF1Ywe/OW+SAVRAUrJf8SdZJyB86b7QXrCs8InnfqABHF+KeyjOmyFvfScA1pY5fZ6YFSvWCocPhUrc+Uvj5Hvjv4tIWK66LgnrpV/c532FldaRJ0QzDv98uBxmm8sB7MA5gnzYakquMH2Ez9LbiSvx+sHZ3IpgZGxLiXRgP2wn+uCJRE3Jy2f6m/sfPDICA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by GV1P192MB2681.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:25e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 12:49:09 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 12:49:08 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: richard.weiyang@gmail.com,
	akpm@linux-foundation.org,
	reddybalavignesh9979@gmail.com,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH 1/2] selftests/membarrier: Introduce helper to get membarrier command registrations
Date: Mon,  3 Aug 2026 14:48:59 +0200
Message-ID: <20260803124900.3328789-2-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803124900.3328789-1-christian.gellermann@codasip.com>
References: <20260803124900.3328789-1-christian.gellermann@codasip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|GV1P192MB2681:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d68d37-9cd1-487c-2c21-08def15d9c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|1800799024|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wN/es8jmvK9v/xWVkCKhJ2RNjnhhG2KFN11LJZQ6GPLoxcKmTgQU7oTx+lu4MsUMWrxNrVdIvbMAC89L+2p918cG+v3j6UOGFFGH29z6sqLyxXTv0kVXHKfmjwY4Km8x5lSV4MmVgcEbK0QJJuoBZAiOweAx+VrhSHxubehYcwGl3rtMHU4e6ycquMOGArSldf5HD5JogsWTDsTNm4cjh9uZHasuECarjZCHWOE54xwywN3VglTkTZ6pZbr2FfpxWgOb/33f4CDLYplVPixuZcNAHZ3r0EHy0OOYyaqVqCgz0Mo7korxZ9jGLpCLteZy/8fvxW4l/TT4Q/8itCvZIPrKxvm6O5iY+cVLMguJGqjj5wZH2CVF67/gbyg3UzgM3mm855mw+0s7w5+cVB77XDG5jjIetbK4JVy6I6J8kq5Z/UuvgIyi3MfdRo2ke0ydqYvaXT8fv+ELqsK7vhD5RmsTzIl7bJ+ooyy7YfEZTWXFuPdFI26f7xtkAjsBCJJJoyqpqok0DbkCc3RZOumyzq9JcZHR3juCK01sK2IA5RCZNLeVvKFHDY4J1GF8OUEOB8Ct6oLN1SuRmKZ7cJihtnwrwucgAz9Swc19ddYKezLj3YSBZLgaQuk8idOZC7vuRY4bToJumOPZDNTs1do3NjWeisDdE41H/F3reSbpQo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fkFNE9ULnKK4Hfcr00ABgb30kMaZ9mZ0PCk1SSd38M+WuE5Ygdda+bresJ6e?=
 =?us-ascii?Q?ngt3bNGcmFOH3KngBulyeEnZo76KuY1mhUbaLZHJKCr/DFAKpf/xGCBip/HS?=
 =?us-ascii?Q?nTKKyEHAY0Ba1a90IxbnI8QOKpKsWABgUbx8fSp9odQ1OzYBqQUMszWyBaba?=
 =?us-ascii?Q?UKN0lwybDKNj7JSGtjZ41wDUtr7p2UO2MJSy/DUSjnJxB+Qhu4PHhZ/ArCM4?=
 =?us-ascii?Q?P6i21IgME76db/62VcwIytXjBBoubnrhVpyxQNI64XYR2BecGTleTdHwkRpJ?=
 =?us-ascii?Q?+ji8NkF/R7EDw01VLSMXGaEdtiyQBFLVJBzTn7CRCV5HInKnZLcCJexHWp0v?=
 =?us-ascii?Q?H1LFNFo4YL0SZ3nVp8wsAn9ORZZXYKQVxGc8rMQnA/hGe+bqEfIWmBrYgLZV?=
 =?us-ascii?Q?VmDhqJCrLjCq5Q0g76uW+h0uzLBwb//feYDiuKlQfghDBJVNrMokzzg5BSso?=
 =?us-ascii?Q?tntWSeFMIJoD3C0tEwo23uBeDK572rxvgTBd5YbkZk38/z1AjQiNeESX3qN+?=
 =?us-ascii?Q?X2bRH85NkVLeN7fTTDehiYLxINcILyzFwRSYvbF6vWWM68mObXs8Y0mPUwy5?=
 =?us-ascii?Q?bPTGKRTJHzNGFWgP9nokTkKuF5GDNebQDCKs+g2oPTMICJOn1F21s9nZrnKe?=
 =?us-ascii?Q?BvJDxwvIvaqh7WByLftQguJsn5OnODRf58xJ5PvhdtjAcRb2MXLsj4IC578i?=
 =?us-ascii?Q?4LRcgTjTNGBB+ddTBbnZfdxMt8g4hWX0cIKWY2ujdKvShDQjvb2TDrubuPX1?=
 =?us-ascii?Q?ljuMdfPy0JaNbl/MsM/hM1GghXHFWRuEPuI2vLgeLBmSh6PhPPaktywT3P87?=
 =?us-ascii?Q?h5DBt96ZQQ+eu4mjPjVZ5PEmLfIFbLQhhzz2hmhbmGuICXrQ8+zfVPEZP4iH?=
 =?us-ascii?Q?tDzOLFJ/kCVvDyW74w1FI5t7WqX2Kgs43c9hrc9N1wnMc1flsBJKWbwzXspy?=
 =?us-ascii?Q?G0u0l0GK/dgCOEGjsWd2yfFCSG1UaRxqlIPzEKAL5KJYmWxsEC7dNogomhQ6?=
 =?us-ascii?Q?KqXiatkVWzm+Mh+gaVhm5F4vuZeAbp1MAY/kR1a2pXzmp5nQfQR27h/8TML5?=
 =?us-ascii?Q?OXvSYOhZiq5MBdNdNtdPy8ADjevdCKN+C+uHnuLDYlWq4PgA/s8ySkyg5LAD?=
 =?us-ascii?Q?oc60amKmEvIPOH2dXKwy4ZZ7nVmqbBwVQr+uh9+27iJMm+oc7TF5ZnpYQEZl?=
 =?us-ascii?Q?dKmzXWB2/WY2vT5PDvJGMKH/S7z51xgcsxKBPDCAw+BCqpXqYAC4QyhnXcGd?=
 =?us-ascii?Q?np0lmpGq8eiOMEpCtKJOb6j1Fs3onYTrUBVLDlietoX+BFGHUjjKlmRcHXqw?=
 =?us-ascii?Q?h2LmUewyxNJK/waxVxmJVdmHpaYPRLSyvHqjMQ9WUKD1ObOyMEpMw0ZNzX9J?=
 =?us-ascii?Q?o7GzRrIW+wG3j7tgTo5Z5ihFW0zTfHEFBE6qS0hbCHOro32+vseeyrfjymbW?=
 =?us-ascii?Q?cvuIhKaX+xn21cGVkmchFVsvgGiZYwDB659Kc201yvwjeahMRuSnFhaS4UYb?=
 =?us-ascii?Q?d0QWkXrZd9fiu7ELgyDAR3Q3C7JtSx6ZSc+1yz1QjzsS1d3uiTBg/FSDP5gC?=
 =?us-ascii?Q?mPJHAzmNbwhLDwYEgzBxNvqJj+myOXBnRplSHAptjWgpKl25ySJihClShl6I?=
 =?us-ascii?Q?lQpVZiZjR735XF8djP86phOJovPS52BXV9EidCUOUqoB+1hyU12glJsaFi3u?=
 =?us-ascii?Q?WKCAT4wRfopxcIY4uYX3bz9Jfr4U97dXeg5uRrgx167hG77F7qFqgzNRP5fH?=
 =?us-ascii?Q?YDaB9Z1asRrkoNC/VU67M+Dni2EQUqepYPlSeBrotcw/C8BkAx0MuOvoe6w5?=
X-MS-Exchange-AntiSpam-MessageData-1: 8VRacmEiOSBCY3XpNZqFZS1mAg+g2Tyv26k=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d68d37-9cd1-487c-2c21-08def15d9c1a
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:49:08.7031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YudJ9+mb4N/H3g9obuyqWZqRxUJvS2/qmMytO3bkFVfCvAqr2jcdA0MClMzsmh4KYw9b2fu/8nrwejoO1rDXIE8X/6yEHiwUnq4IqeT6OOT1bb50T6dfCMxPwiGKn9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB2681

This allows reusage.

Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 tools/testing/selftests/membarrier/membarrier_test_impl.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_impl.h b/tools/testing/selftests/membarrier/membarrier_test_impl.h
index f6d7c44b2288..29aac3bc4988 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
+++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
@@ -16,6 +16,11 @@ static int sys_membarrier(int cmd, int flags)
 	return syscall(__NR_membarrier, cmd, flags);
 }
 
+static int membarrier_get_registrations(void)
+{
+	return sys_membarrier(MEMBARRIER_CMD_GET_REGISTRATIONS, 0);
+}
+
 static int test_membarrier_get_registrations(int cmd)
 {
 	int ret, flags = 0;
@@ -24,7 +29,7 @@ static int test_membarrier_get_registrations(int cmd)
 
 	registrations |= cmd;
 
-	ret = sys_membarrier(MEMBARRIER_CMD_GET_REGISTRATIONS, 0);
+	ret = membarrier_get_registrations();
 	if (ret < 0) {
 		ksft_exit_fail_msg(
 			"%s test: flags = %d, errno = %d\n",
-- 
2.47.3

