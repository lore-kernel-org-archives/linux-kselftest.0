Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEBB3DB658
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458520; cv=fail; b=Zrcgr8RY78nlrRdtIfjYIgTUg5q0YFEI8tFv2C2F2XeqOVc8K43mOYhVxYhwOAoenEaLrFFuXBHzjRHLbwdIHvNJWRk3LHAnhtkISr0xHNxXpufLSIAV82XYem7yhatUwefz1PSONNekDrvS+7hDqevHYG8AMRG2IsNcpDldVE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458520; c=relaxed/simple;
	bh=+HuNe0ezqm2ljsWGlNSgnOA+8QbgjVuRbJTAVQhrpJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KdQ43UMD/OGDYeorbSn6e/7kOtQHpzhlIJ8nYsrDvtQyHo3SgByWBpGiSNuZv4r10vUnhYRxDTUV56K3xZ6v+p7VuxiC35CGTNEtY0VP8nT1dQAsLo5zxDkGaRDpxMYYsm+UPDU492fMFq8GFKez3EMifdYArPIvyvDxARj1g7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=fOOmn7yK; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="fOOmn7yK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrV6lXeZt45EXb1vrLtcaTssjqdv54AxtJl7CmS82aYQD6G0JOrZ6JxS1yN4LKj3DEMz12RPIbsYq8GCPYjSuBPhbfc6Glpn76Q2qLC48IV+PanM1wM+01aIDJfYWdEJtE3YzTv5NI13PfH0QD2ddz6bjsvQP1DMQbS7FmmUdCqi2J2WZ8YB1f3LkpjFyWIP5nq/pUmAkCYzTuEkWmj4CzP50Rf7tNr7M2OaAH7+KHkwTdJOegeaAulMX3sbBdNcZsgloTyaua+OtFix2NsIpqh+QLjS64xKrFLoK5OG8t10ym4bUTvcJw7HHCWeXFIMJc28w1IpWCuJLJOtlKuZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAc6gReAK9r1vx9czrC49jVdwlDP+o7XUJiDgSOc8uc=;
 b=ZOgZr1XUVyJqRicm97d1EXrF6kQviy3ppQxgj0liGbodKAi+u+mAdXQs4XZXtp1gwj6ATEqADW/g1QB008fXCHjwIHPR/vlmmO3I1w6DCd2BpQjBelhYC7K8lO2XZBbPmNrPzmqwg5FHCBE1wODMXmJMSaViqSFwsH7msGtt5NCmrsqzWK+or5Y97VwIxq+i55uvkCFz3fAUuXlHjmfVqoH6D8LYzJrfxE/WItG9m6gW3xlsANmkIFVwhAZb5P0QLcqi5WIP637CaUJ1D/p9zyKjRkQlj1ignqykLPZuCLSPO3GbcOIWZ4vqehZxiJY3ne2cE75ZX2C4x/M1B3P10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAc6gReAK9r1vx9czrC49jVdwlDP+o7XUJiDgSOc8uc=;
 b=fOOmn7yKPN21thqEhwhmhpd8zKtAS4DFd4AalW50w+5IDTlnbUBkf7TABy7c/QXaFlnUZO/gz9YLZap21UX8BM9H+7n2AiZg61OL0Fm1Tmede0vbOyZIl1jEJifmwOl6gPMK1x/OrxiyM/vNelLnx9Ir+rwwUSJpwM5Jo2eBOixwJosWAo93sbMVMcQ6qdMPFCoV7yVovGEkzSyRU5WVpGr1Dg5lqiuhmnBVPrE6NceY1BXstdvEwYLPzLmlD/qGVsnUM2uY6pJ4ffOiu5n93F8cK/gfAcl1hGsbORtUuGmnIMAjLnF0XOKmNiviH4MeWlX5MPix5tf1EjJCkYi9iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:30 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:30 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 01/15] selftests/uevent: fix -Wmaybe-uninitialized warning in uevent_filtering
Date: Wed, 29 Apr 2026 13:27:57 +0300
Message-ID: <20260429102811.47214-2-eva.kurchatova@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 81b12ad7-09b4-4cc4-b1f2-08dea5da0ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	49pALoArJB9IUF94Oq89U9WUIjBt2Q+fIW4DyaQm9kLziIgeUtr7Zjj7pBwI3X8Z+1D0/82l0jSjQ8UVUKkL8ayE6phkQYZzNa4PK7LvGWFo/dS/ZL0NhCDfXhlONgkdjGytekRrTneZR8+gqesA+s3cGtqyjLRK7CIIXASBuYSjPEw7L11GqRX/JMNDZ9di4gPs80K869d8+g+zAFa6kiInSSQiDjHdD629o7si9jb77ka6drtW4J2mkX1oQJ+gjA/oGI4p2EkZUT6tQIJCwHe/+QJHQpCa2eq1T62Kw+wgC8kgXNtWSzvCkJAKHddQqSbUdKObPhhAhysGAhwP8PTIzF0UiUWkcdlRVX+oB4xfjX0BuMChVRnOogMf7h703Wr9oB9d/363Jyfk1NUVgCHQqOvddN+Ndeimagk+vimBGn6bL3d7vspXyKnDaV0+49pjEnDJJzm+HYwtIH56VrBmq1aPmkQuWea7kpkDaTC8vfdUIkM74pY6834vjvmddxAILgrWXMAaUn1g+n+tw3Wab0slao25Ebg+nJFo6tDCTXk4ex7buI3CGm8Y3dh9fszG1oiONlT2FsHCE5O7rWSrPxoCnwU3qKdcLgVGBIt8b5obNaejQJoAs7VRqhBY/cuhKnZuI+MSEamkmbgAxsSVUv1ZeHfv3cl4T1ubYY0ZQatmIOwdU7AQM408Kz+5k3czNo7Ov8H6qWx2O0dYPS4B+0ZrFWjvS85ZejY+r5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GC9WLomg1rb1SPuxINoljgEpPUGHQCkFbzNqYrdGkDNEYHjyJT2jXHqeBjzJ?=
 =?us-ascii?Q?5Q8jk643nRS22AgouNPAixwLlZ60AvuUhlqKkuApXhh1Z4uNbWiEb3GqO99E?=
 =?us-ascii?Q?MiuucewKOhiI5DgavNvaw31aQURpG6FGdqFsIY7iCNOLdboerHJ2r1wq8Uvb?=
 =?us-ascii?Q?tlG+8klTxkehrUlQ3FaVTQxMjwkCwC5EiMFLcAmJQHTQbZh+WxYQ52zNqPbn?=
 =?us-ascii?Q?3SmAZYrBVy93mFFVKIBE5WIRweI+biIJmDTSrW4s2MBv7mruOD8QTStS6c5T?=
 =?us-ascii?Q?CSC8S0w+oFS/R9Kx1q+nd4ymetfPlEqKT16aGxwT1PzNr3mpj1zaLq7TfH89?=
 =?us-ascii?Q?kjgcORecude7Roy+8jQf0ArSHKv4lLrsMyUnHH8LN9MRGYtfrfco/OvF6RsE?=
 =?us-ascii?Q?jRQN2zIsKylQXRi+hCD1VYrNNXOQLQX+EPfVgRuzHvEumMEpmDS/vDWjwzyj?=
 =?us-ascii?Q?DsjEP0KeyeYFCBK42xPlmGZWmrjLFVBBpP+6S0nUJLKvKoWUqB8OpEYYgjBA?=
 =?us-ascii?Q?d5tii5scKRkPIDKJsvHGz1sTgKhZXIYewuGSfEvcgRoaZsxa4Wujfi6qwpGD?=
 =?us-ascii?Q?9QxA97yZkoNy8PJu/Yu3qaiLFCmP0u94hzGSBMrFbwVm6VfQFjLOOYygOcYt?=
 =?us-ascii?Q?yQ6kRG/L2eO2T1E1wNBSYTYHrW3PL7+/kabTvTBlT1+bdv5d1rNPcsIGF+1U?=
 =?us-ascii?Q?n3S+BN2Dch5zIsr5GnC5cGY/FTXNMjjkzqI+vcG8oNy1bRCDcthN3J/FubRh?=
 =?us-ascii?Q?t1of3ujRj5Rb1CuvapqivhXtfkBK/UnUgB2wYIQ9jbmRVuGoOlmefczu9Yuj?=
 =?us-ascii?Q?w21jukMrN9H3eIxvLCZe6pg7jMWNFGrXXeFqESCYDLH0SSEhqkBVGXeKwDng?=
 =?us-ascii?Q?P+nw7sCcEZyz5ydhXA1aJIeyNWVy80PbjSUjLQYDyQzWtUQ8jB00WQJ6XGDo?=
 =?us-ascii?Q?3h8FECZU9nNuooVVOuAZXr/WXXuPz55STBeByXK41T/8HP702yMQ6TTGnR1s?=
 =?us-ascii?Q?MTEWC7L7vGIRoN0up5s3RUMwSJdVMIx/k5PPqGVKSTyAKAXPo+3UaNu4IM3w?=
 =?us-ascii?Q?FmomvE9xgEYJvhOSV/2Lu4lCZlQGV6jq9a3iRC9d5QBpMyzuR5fdG8CCEPVM?=
 =?us-ascii?Q?hCPzUDPRsXb0ELagkkEjqtz4JXrSgEiuvU5F/0ojt8mvDcrBBt5YMlpltGrO?=
 =?us-ascii?Q?A/vuQCWH2KRwnwCSzHpSzkdJcWjDef4ka1Cq4fs7YdevrZrXVPT4MRSFZzx7?=
 =?us-ascii?Q?VCOYDcvz2D7KBbgt804yy1M34VnZrVNmN++Y8innNvVBrt2k6GVJnn5fJdO+?=
 =?us-ascii?Q?WfslA0FrYBKtup8NfXEVzpJ1Us3EBcUYRMcatfhWtammTo6fDyPzLDKZ2CCE?=
 =?us-ascii?Q?BHEQz9zWIlPNbfwX6KHZ3/4S0wvfQ4ADHKAkZn6ZoOhX11A6wfbXZgIr5nJv?=
 =?us-ascii?Q?sNN9CNgV7yFSunH9JQT5PyqoNVEpS0GtUPM5ti2XQHMYQMXomtSgBAy6XWIB?=
 =?us-ascii?Q?leLEmEmKdyTTcHxwbzurPjeaDrSR0DGqMFEhyqzSIXiq037RAIMMgr0OB12Y?=
 =?us-ascii?Q?56r8Uf0nakGnB4y4znsE6RGoMHffpxgHoLhzm6gGNFHjBwtt7O/y8MvT/ScA?=
 =?us-ascii?Q?UVoo0HP6ZjXwhG3/rb0rrWDj5Zwv9q6GUcy5jcbpNKziHokS5ZhDt+8b5ssu?=
 =?us-ascii?Q?WSBvcrYvlv8cO3jlWuezy1jPHE/ZETjE40ZOIyQE1LCyOUsshtMhfZgDyaz9?=
 =?us-ascii?Q?gLXwf11K0DCFnEbQVE2H28t8ilpZJ4Q=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b12ad7-09b4-4cc4-b1f2-08dea5da0ed1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:30.5706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X07RWGJX7vbZ9dukMAyvVPecdZbRMl56SBEsOIz75h0Fl3+LN036I5mQXEp4bD0xp51prFFvqqUuMg1cN8Dr51z7F6Gssq1ukK9VDp/MMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  uevent_filtering.c: In function 'trigger_uevent':
  uevent_filtering.c:217:16: warning: 'ret' may be used uninitialized
  [-Wmaybe-uninitialized]
    217 |         return ret;
        |                ^~~
  uevent_filtering.c:197:17: note: 'ret' was declared here
    197 |         int fd, ret;
        |                 ^~~

Initialize 'ret' to 0 in trigger_uevent(). If 'times' is 0, the for
loop body is never entered and 'ret' would be returned uninitialized.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/uevent/uevent_filtering.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/uevent/uevent_filtering.c b/tools/testing/selftests/uevent/uevent_filtering.c
index 974b076f9235..e3cded66233d 100644
--- a/tools/testing/selftests/uevent/uevent_filtering.c
+++ b/tools/testing/selftests/uevent/uevent_filtering.c
@@ -194,7 +194,7 @@ static int uevent_listener(unsigned long post_flags, bool expect_uevent,
 
 int trigger_uevent(unsigned int times)
 {
-	int fd, ret;
+	int fd, ret = 0;
 	unsigned int i;
 
 	fd = open(__DEV_FULL, O_RDWR | O_CLOEXEC);
-- 
2.54.0

