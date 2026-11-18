Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991094;
	b=X2+aqrOIS5r+0g1C1g2OIwAWEyku5GqkQybkO1t9ixz6dHDSKImkXmTw6XjeBouJhtuP
	 mAnn8znJ/Pp9ElF7qHGvjL6D/oLoNlM9ZZ0a/nrNMpqdQitSCeK9+zZkdBhjzRl43aFhe
	 /+4rSKt3lD8I4lPZDtL3YVyDUpYjahJdfYJFXglgTojWTlfEUU9PlPfearVtWfX5Eir2+
	 sgsWF9EGLoHhJpVaVwR8csLzjtPbtQHCSoiB1O4FukMqQDYWulrAT/JxXzVYJ1EhntNBe
	 R9Se5bvGWUVHHCusiExnyLXoIhMWkW3JkSq20bI1gPQ1A7jEsrR0dqfQ18Us0UtT6Bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991094;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tUpwCW+TDts2qvRGUqUxbyHk2/1A6qZqIvYVdcoijUk=;
	b=ThTgSLFVqSLAfLdMKBe4RQkgRYETaeS9KjCfv8ZA5q05L2aDNQtdBWU5ggbwFv2cOc3n
	 e/ga6GfYieDzQcoURN5RMMU5v6+ipxlC4oTdxmxO6cecY5yPjPKsGm/o8OA6YrLiL5Q/h
	 1yalhZCu0GFd0vCKDkiyhQvH2neYahhjSWNzEP2DTxksuUiiNbKjijYbqhrw9Ocpce5m4
	 VMVmq802FMk4ij0/DsZyHu8+osvLTZLUYa7KR774K+t3mMMiRSiLU1Kv8BrRUYgApMfPg
	 hscsaHAh+tCVHxU/Wu/Rl5z+di7tZ0GIBD4aw5JHxXeEtnaJwn3Kcje/QfXIuvr/Pow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R41XLxg7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.45
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F52606A31C;
	Wed, 18 Nov 2026 08:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F52606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R41XLxg7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HP/zov4aoa3hi/MyNtxXBkKWZMm3Bpb8RMBW6GxOevgY2EhAYHUVVgARotEPnHS5ukXkR14Bnwuu8N/oCc5fukEzsTUBlyNp/KCtZy+nXGSk4miJ/32QF+3tq7ZtWCi2jHRVHC3+JKIJdw5FohsN4WJYECmZL4Mu7xpgNT3fQKo9f34xHiGfVmrcirHqJVx+iLeEaShyJqZg5OG5qgBb4pTA13eRbmE86wO6s58qFD+RAegzLFl2GuGG4i+lr7L6X+hD7wig69b669wnihGBfiNJV/ZQTmNbfsB6CW/MbnH0/u8voiPjwbYrB6DkrxGRWi5SXHdNOUBEI+RAOsTFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUpwCW+TDts2qvRGUqUxbyHk2/1A6qZqIvYVdcoijUk=;
 b=FAhM18NSKXRBvLC3mg9YDIJ8LT8ej7TJFup2rv4wuHdYS1UZM/iLmNhywJu5gGvfxpxiFlX9FW8zh8kiml1Ra4UJsVLv8qJJiA7d9dntxDZjbOJDEIG3fEasdaHqDBAnPCxEg/0fW8Wzr93EKipE2BJgGTp5Ft7jO1rwcfj2B/3KyFj+9YoGEyEHUM+U8CblBklUiwbjxJxTPlU67G7YRDawPIPVvgDfC4IKi7SfGG69EZ9y/RTGQnooTKjd8xnWtEvjgpPX6aEHuxrHnQwC95E8v7dwoh6jj3dvtFo1AeiNRLkzpyoE/QNvoTmNqZTooLps/hoXZzLOp0wqcjpRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUpwCW+TDts2qvRGUqUxbyHk2/1A6qZqIvYVdcoijUk=;
 b=R41XLxg70lG5oYr/WwDMcWSkdA5li40wwTgQA3EA/vtPMD1IjzjqEWLFPHBIQdVsRVA8jRmRJs7vVwmltLTUUrTo+2XvpjjWWxImhSlJ6zA9KLm7QmM6HHP4k5rb/5R+0zVrLSjdU6oarfRwDeafPSphD2LhD5TVeVJT3WRKiCFwF1YMqBiN07fdtAX+hD2rjKucOe6yb+xURYvGTb43ECYqqBozn5ezbR1xPYxGIzeKxJHuEmsUIBWWNJg0dO1ToFdJ0GlPGdPkjZRiWV5YBMwxuxzGkdAn9mK5tbDo0DaajCt8spsob6GkdWFQ15hOirmmMOSvEzimm5f4s66qCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH8PR12MB999319.namprd12.prod.outlook.com (2603:10b6:510:40f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:37:03 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 08:37:02 +0000
From: Ido Schimmel <idosch@nvidia.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	jv@jvosburgh.net,
	andrew+netdev@lunn.ch,
	petrm@nvidia.com,
	sridhar.samudrala@intel.com,
	jiri@resnulli.us,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	razor@blackwall.org,
	Ido Schimmel <idosch@nvidia.com>
Subject: [PATCH net-next 6/6] selftests: bonding: Test that Collecting is advertised after notification
Date: Wed, 18 Nov 2026 10:34:42 +0200
Message-ID: <20261118083442.1061289-7-idosch@nvidia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118083442.1061289-1-idosch@nvidia.com>
References: <20261118083442.1061289-1-idosch@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::15) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|PH8PR12MB999319:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca07a61-a8c6-4d59-132c-08df454f1e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|6133799003|22082099003|18002099003|3023799007|261009223027099003|56012099006|261026140227099003|11063799006|261102123227099003|261028144727099003|261022075727099003|261021123027099003|261026121527099003|261021121427099003|261022105027099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cQY8arUqzdY7j1nx1KDrZrPFQv01AJFSJdo4Z7H/YxC0H3ejAv2coxAagCgaNs/U2Uxd8EWlr0p/QPp1clc58NCY10kylryFjx+q9Fpj5+vDCsKz5rYb7w8WvWtRObep1WNTfIThhAllQAFey1yyRYfakN+Le7/lCBwb89rMjMrxVlJ1L9kFDClQKiRKwpYpSkIukJ7LBh5uy5ZrRmFRHodSqIc3WmY8i6v1Fj3NQHEkU3DTBRmU6sDnuf3BXG4TT8qn6l2YGOsAlZx/KtoUjnof83ZIKFGj+4/aQfeKmf/+Qp/tUnp6PAUF7nKvB1r3ULWfin28v9L88AeP6uYQtXq5q8cIcvbOOroIYaKSX5/DfYm1vuNyHbsUp2cc08SDjzzCfiwqpzg+AMeTWorYDPt1ef6MWK2Vu0ItKhDAB/OYQepZygdxQdTcjwZ1OFsnS3DWb8PUXHNkuoirVdkmiHE9WptnXBdhHARfe8+Cot/zFkG31O6cG970mwAHccD1MSMgoB6TBk+NRlQQFFLe26jqyVq8Jfv0aNudhpiUxukor/FNErnJ1liezGDH1W4rqp48i0gfth1p0YNdxe9O+9bXusmefrkNCT7u8SKRmYE/gcMVv0VjJWm9+anA2deRnCzkcS7Vk3/1bIH/o4Kq5pplJOUCUhfdvsnBEfFf0gk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(6133799003)(22082099003)(18002099003)(3023799007)(261009223027099003)(56012099006)(261026140227099003)(11063799006)(261102123227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SOooZIvwxuY/PdGGNt2yeofBUSGiUh6zaKHPqP4EauNmyGznqXYRNw92/VwT?=
 =?us-ascii?Q?zFFyUy8mHP9Vq/nmrpNeGJwqHvmhELx6hMdkfGUoB25I1tRv/MFNg8xBHBjB?=
 =?us-ascii?Q?p9uckKLeDyRacCtDLbgH6ASLr+yS6nP5VxrEwLxERWdndxVw260DlJZSlSqw?=
 =?us-ascii?Q?6m2OOAWfGQAuf279oyv+IzCzhDHP6nmDRsAJx6eWc+Lg4O2v08FqeB/ShYX+?=
 =?us-ascii?Q?ZLQj/KEE3NlzpgXaQ9xM3hGCMMGbC+b5Wog5gjEioB2SHjJ1UqYTw67Gvatx?=
 =?us-ascii?Q?burHDSCOAem0Rx+UeSXyRr06cfg3IQJkfUp9877lLAbhRX/+RbQZ5qWDk61f?=
 =?us-ascii?Q?DAI6/XC5Xr8YI/2i3GG9BPVG9ksP6rTGJIwPbv8xBlQbn3HX/re5wfps91LN?=
 =?us-ascii?Q?sfkbg9oN/bJi/lB94k+cChG2GwJzPjgVKzYUGHB4UenF+1saE7ex84D73oXW?=
 =?us-ascii?Q?hWb0KtsnbE8B/Q+T5uyLof2w4wzk60bTic7Sc7gtkgfD+ysNQFUDKpdO5DWi?=
 =?us-ascii?Q?Y8s3NEkpbU90ly17utLPcC+QV3zwsOCJvEQxRcO+r9+Erdi43Jh4x7mUQorK?=
 =?us-ascii?Q?GcUrDwQYuEx+8D9pbboQMTPNaKFDSOkG2oRnYBpwTujs1Hmn0X9iKEaWgcqz?=
 =?us-ascii?Q?OxpV2ehWN9t5sTa+znVxotgJTatUqawrCoEhKuIUyorXo5mFfx1LddHmMGKI?=
 =?us-ascii?Q?o3dlrVgsMQ0KC03X1/ZUJiTERgXa6AsxtQyjfzgLsYAN2uwkZSHFS6UJGTR/?=
 =?us-ascii?Q?h9+5ceI2PRre2yO1pGAVZ6IEvHNY/g1ZgPn7xwSI41TKN33/9sRSw/PJNKQs?=
 =?us-ascii?Q?E3As0BahUQgr48xl/TNRsYdubloJ+jxXEVzJ9QQQrbqcvYPNqth9h/lJmcTo?=
 =?us-ascii?Q?O1tN95gcbUGg/yBuKTX67i2pOpSzY88dsYsH2YoSlcOGUA4Xe2/fLbFjLDD3?=
 =?us-ascii?Q?8oDKrYm3h3RuuODuqyfoqYFw8MAoNjt+HrKakt6UQquFEr/CRoqnC4OpBDV9?=
 =?us-ascii?Q?U8wWbNcAnvK22eZyUFRNYpnWFLK1N4RagWhQrzY8iMUiJd+zDhMeZy53FOaT?=
 =?us-ascii?Q?6MsG2grnPGb1NYjadFrC19TozyZn98MF6qrO3IAqxjWl/fxIspuoPL7Iqjg6?=
 =?us-ascii?Q?ZpJ2IV7UtzHH0SU6KiT3Q8rhlJ+bkfA5y91olkIVn96D8yXIK7a9vCsSKMa/?=
 =?us-ascii?Q?l3hES+lB+QrIAzk+B8Kqv30W3qqcebsiz8FKXNCl1g1qRc1ZIH0d7KSpYlLe?=
 =?us-ascii?Q?BMDHEsccsqsimLqtzOKMWnGRx90EgOugNE2g6qST3pobBgseTyft+pHsz8hM?=
 =?us-ascii?Q?DBOTo3sLeGrDZlFGZE5cd+XzIR+8suuwamkOKxCXAY9tCvP8jqrt5i8a3v9Z?=
 =?us-ascii?Q?ZsJwV+g7veGzSrx+CKCilPk2v+QYWuEs0NsODPfBgzUS3k/zfIGIx5NHBq83?=
 =?us-ascii?Q?tPqlrR7lOreMoIGEsAD6Fqm5nqg+LFw1JjNmkcYGcvXVy4o/ixq7zbfEFxbL?=
 =?us-ascii?Q?J/T5SdB2XPw0OFuxSdXBqwuQsW3/Huxt1gBv+fxxd7yzHnmktb9fRZX+ooQU?=
 =?us-ascii?Q?wV4BKlfsOa18b36eojbM28tv2+HA3kVjvRGyhgWz7I6jG7Lpe+O2ersflWwY?=
 =?us-ascii?Q?o5nzW3eoFcvycajEiT+0Up69O1B6Y//33OCfhr4FMlT4dg5UeEMPf45gKd19?=
 =?us-ascii?Q?3CNSFYfZ44StykmF8e1ToEOqncbQZB0oodj/PWVJulfI8ln/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca07a61-a8c6-4d59-132c-08df454f1e56
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:37:02.5246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ys1RsgckSRDjDgGF3346Fw9t8vlztbEgNVrD/dzQ/m1UCKhWMh0w+19Q3kViiyENgKZwn1EhCJrN+BQgG8aNMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999319

Test that with coupled control disabled, a port only advertises the
Collecting bit after a notification about its Rx state change was
emitted.

Use a slow LACP rate on the partner so that the port only transmits
periodic LACPDUs every 30 seconds and is therefore not rate limited when
entering COLLECTING state.

Output without "bonding: 3ad: Advertise Collecting only after collection
is enabled":

 # ./bond_lacp_independent_control.sh
 TEST: Receive in COLLECTING state                                   [ OK ]
 TEST: Notifications in COLLECTING state                             [ OK ]
 TEST: Collecting advertised after notification                      [FAIL]
         Collecting bit advertised before notification
 TEST: Ping in DISTRIBUTING state                                    [ OK ]

Output with the fix:

 # ./bond_lacp_independent_control.sh
 TEST: Receive in COLLECTING state                                   [ OK ]
 TEST: Notifications in COLLECTING state                             [ OK ]
 TEST: Collecting advertised after notification                      [ OK ]
 TEST: Ping in DISTRIBUTING state                                    [ OK ]

Reviewed-by: Petr Machata <petrm@nvidia.com>
Signed-off-by: Ido Schimmel <idosch@nvidia.com>
---

Notes:
    The test compares a user space timestamp (ip monitor) with a kernel
    timestamp (tcpdump). This cannot hide a bug since a delay in ip can only
    make the notification appear later. A false failure requires ip to stall
    for longer than the gap between the notification and the LACPDU, which
    is at least one state machine tick (100 ms). Did not observe such a
    failure with normal or debug kernels.

 .../bonding/bond_lacp_independent_control.sh  | 53 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh b/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
index a2b83b581e40..b86f39f31d0c 100755
--- a/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
+++ b/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
@@ -4,7 +4,7 @@
 # +-------------------------+ +-------------------------+
 # | H1 (vrf)                | | H2 (vrf)                |
 # |  + bond1 (802.3ad)      | |  + bond2 (802.3ad)      |
-# |  | coupled_control off  | |  |                      |
+# |  | coupled_control off  | |  | lacp_rate slow       |
 # |  | 192.0.2.1/28         | |  | 192.0.2.2/28         |
 # |  |                      | |  |                      |
 # |  + $h1                  | |  + $h2                  |
@@ -16,6 +16,7 @@
 ALL_TESTS="
 	collecting
 	collecting_notify
+	collecting_advertise
 	distributing
 "
 NUM_NETIFS=2
@@ -24,6 +25,8 @@ lib_dir=$(dirname "$0")
 # shellcheck disable=SC1091
 source "$lib_dir"/../../../net/forwarding/lib.sh
 
+require_command tcpdump
+
 lacp_state_get()
 {
 	local dev=$1; shift
@@ -75,7 +78,9 @@ h1_create()
 
 h2_create()
 {
-	adf_ip_link_add bond2 type bond mode 802.3ad lacp_rate fast
+	# Slow rate makes $h1 transmit periodic LACPDUs every 30 seconds, so
+	# that it is not rate limited when entering COLLECTING state.
+	adf_ip_link_add bond2 type bond mode 802.3ad lacp_rate slow
 	adf_ip_link_set_master "$h2" bond2
 	adf_simple_if_init bond2 192.0.2.2/28
 }
@@ -162,6 +167,50 @@ collecting_notify()
 	log_test "Notifications in COLLECTING state"
 }
 
+collecting_advertise()
+{
+	local lacpdu_ts notify_ts tmp_dir
+
+	RET=0
+
+	partner_state_clear 0x18
+	defer tc filter del dev "$h1" ingress pref 1 handle 101 flower
+	lacp_state_wait "$h1" 0x0f
+	check_err $? "Port did not reach ATTACHED state"
+
+	tmp_dir=$(mktemp -d)
+	defer rm -rf "$tmp_dir"
+	ip -ts -o -d monitor link dev "$h1" > "$tmp_dir"/notify &
+	defer kill_process $!
+	# Capture transmitted LACPDUs with the Collecting (0x10) bit set in
+	# the actor state.
+	tcpdump -tt -n -l -p -Q out -i "$h1" \
+		"ether proto 0x8809 and ether[32] & 0x10 != 0" \
+		> "$tmp_dir"/lacpdu 2> /dev/null &
+	defer kill_process $!
+	sleep 1
+
+	partner_state_clear 0x10
+	lacp_state_wait "$h1" 0x1f
+	check_err $? "Port did not reach COLLECTING state"
+
+	slowwait "$WAIT_TIMEOUT" grep -qw \
+		"ad_actor_oper_port_state $((0x1f))" "$tmp_dir"/notify
+	check_err $? "No notification upon entering COLLECTING state"
+
+	slowwait "$WAIT_TIMEOUT" grep -q . "$tmp_dir"/lacpdu
+	check_err $? "Collecting bit not advertised"
+
+	notify_ts=$(grep -m1 -w "ad_actor_oper_port_state $((0x1f))" \
+		    "$tmp_dir"/notify | sed 's/^\[\([^]]*\)\].*/\1/')
+	notify_ts=$(date -d "$notify_ts" +%s%6N)
+	lacpdu_ts=$(head -n1 "$tmp_dir"/lacpdu | cut -d' ' -f1 | tr -d .)
+	((lacpdu_ts > notify_ts))
+	check_err $? "Collecting bit advertised before notification"
+
+	log_test "Collecting advertised after notification"
+}
+
 distributing()
 {
 	RET=0
-- 
2.56.0

