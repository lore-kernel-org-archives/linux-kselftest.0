Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012019.outbound.protection.outlook.com [40.93.195.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410AC339389;
	Mon, 21 Sep 2026 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983778; cv=fail; b=cmq169bNCrdycvrNalQi0//LGsCICt0nqsS5XukQKddKdIKzARGPNIKtEDlX+8uBa0SBSn/0ZqP+9aOApP8zjU4O7MSuCN++9c6/lLqO8GnbTR+USh1HDeZcAIIp4aYN6WciS4lgav7Etbs3F/x5ygKTW6glBHG+OE1rAwjq9xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983778; c=relaxed/simple;
	bh=wszPytNC9Emo37HfW1z8WfLmAEMC1b1y3PucrIh35x8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Xtu/dKczVJUgaBpVqMXmIana8VF9IJlBELRHHmi7ifmNxEydp6LICIWFVCegRBxLdF1cdz4DkyPM+5tEk8OVi0ltBLf8BfHIi9zi0aCDnNH9NxgZTnQiQLx2N/SJpSr+x/bqroFgd6yDwQKR8Bi7kH0P/F4x0hogo2RlUyu2MWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MpPB4moF; arc=fail smtp.client-ip=40.93.195.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MpPB4moF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIZsGOs6NUtwNEMsK351rJ4hNY2ThNgCo/xANI09gIBkjO/L0+GnAefro/lW1dYJoPecsC004cTguUZpp6/KyTNFfomlGCOxfKFf/NBf6kWMFfORaHJYvXz2F6N3SsCKUv/XpGjSWhWQBghgyZobk9seTOkTE73NESRoqeWAXI/rIvCTPOsCmsvPeavAyhLq4meaYDORUbo355ckRqdrStrrvzFOdUyrNcwwXadX4n8HvGONQuZ5t/l98S2M1PHXTcf7CVH0YjgsLTQN2PLwpHwzdBrU4qj0OvxDX7t/rzunvQHIQww4b0bAsIjjYd+fYtmIoHc2sSabJrSlGqRJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJ2YjiW4T/1Hk072IaU73NsGnOPbUPytaz6OeYSdfr8=;
 b=vixeCsYETP2lK+gYWRxQ9GqDGeQQDtJcCyPtFf7z4PDmIfdtQvbL38PyjfEzwTdAUUV5UOCH3BiWizIbVSEiadBM2GixXs6PCGZ6PjJxZBoj21BYVplPd8TxTN9Iiodj49K2h0Fi1psFbd6M5VY+O986xEdrX6jg61GMqZumx9f4yfBmo/w3RCZ0Gfyz46Kp3EjDrO4CGgq6jzXQPwaxRKP+3BkwD6vgS1GYIxpoklwcUBdfHZfKSN6UaClqu5wD6loGZa9gChLM7WGW8pVXIqt6QrqpaKBuBA0+iZLJlQ4UyL6zAjgaDPCqN600AqQebwN2gVLMR4q4WewCqlM5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ2YjiW4T/1Hk072IaU73NsGnOPbUPytaz6OeYSdfr8=;
 b=MpPB4moFc8dI9NJlSYVsEonZDmO0PEOHThJQDJqbgKZdxeet0nFOzBXQ2XZvAYxFhn633EhQ+kkWgnvPBUfa9bUqXffcC4dtIXYyoZXD7Fx92MQl1qWir5RFUtTRZRR+OKlM5I4sJmNGrOMf3hIeEycSHiXxltEshqGKbc12uYIdej2MntNVmZ7Nw1RXKMRNCfcU2OoraiokjSXvwufo2NbxLRy5g61Fl/gBLRwoKj4ydYhHs84/La9mGIeBm0Eo9ZVp9frAp/OBLHB16mCyEjvYRYQkBdCjJUOIKgK9giDLzDIOWwcn57NSO6dooQh73ztIz+rGbPTUgPCMZEFLog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA5PPF8DEAB7A29.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 09:42:53 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%7]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 09:42:53 +0000
From: Richard Cheng <icheng@nvidia.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	kobak@nvidia.com,
	kaihengf@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [RFC PATCH 0/2] Fix gup_test long-term pin ownership
Date: Mon, 21 Sep 2026 17:42:41 +0800
Message-ID: <20260921094243.64698-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0013.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::18) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA5PPF8DEAB7A29:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d695e75-fa5a-4c7f-6e72-08df17c4b4d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|56012099006|11063799006|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bLqpOGZPFwIT11+9c+eQWiAgtKCKGc5x3qGti/AMQDwyVciR4k3g3vw6HVHVGSBUtEAf2YsShScBFLsz4qt0IsqTUmRY8uCBh/gXAPawDsqIw8PqcrTUW6blixVxectJ5GoW7Z0cChX8dsVqK7eU+C7LQBQ53nUGfPZV+tB+RRr9gyKHqkZk2jOyoKtpN0U9m9zcGQj8p8wdkxISa3jvbMVgbb11hw/UJynut+UX3Ly7c9TuFxvymObiUN4j1GEu6IK+sV0bFbZkGC3jdvHs00R0+Ijw0RBCXnHiMI502P4dIutekvXq1wdNPuEF82ogmH0VF2RP9uHk/K+ccUr1fGhJekLSo+P0p0fjEfB6J/o5HytRlAEQZ5MG8+GGM3C/ROD3NI95zo2x1ZJs+eZF7I8osTR/IRaqxkDp66rzf+TIb7pVXWSYZ7hlDzPITufDWlTMigEG392W75TYVZ0yStUp48i1nMj5JyNfo2rxdD8gxM6aSTauSTGNpAv4laGZz8R7e9CmQL+mFbUunxDsf0kZqGndZGLFDQbnRTjfyFqGb6ucE65g1EpDqnj4dOc7ZEt08I+4tla+slIJHgJENKUNcOYa4DCtz4mOSqp9CJh3B5LmRPKbd3Drum8O3vLIJWXHL3fSPqDCL7QXqIV4y8ejX0KIxSxMtFJgtbgIRvE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2tSBjySOhuUTOV8W+Tew1QBn1QZ8f+/Kcwa0UCez9LDIUpRiGsm6yizfLh/J?=
 =?us-ascii?Q?s08sFm0tL1msa0HTwzdUNSaf8FK7WWwK9EAsvzOiTv4tT9iLNeumgQ7fD3mn?=
 =?us-ascii?Q?3hbwtbs04uCcC06KHJHH28dQlvLNiLpPzpgJ5HArhYTR8TWaR4XtQnfdWa11?=
 =?us-ascii?Q?Vf+wTKBbzAXijtVxViXmOwvOE5+ZD9pfUAvX1fpZAjPtvEG7ufwHj8H7pP28?=
 =?us-ascii?Q?jYoPL3UTJ86Wh8DV3ou99bflActcd4o7RK5QjU3XelJMvLEFPWtS/tmw8ufM?=
 =?us-ascii?Q?HpDFPI9sNKaSz/ZPHyq6oAlB6WuzF/27shUw4XjI0qPKSmmP8w0VsskvAe6F?=
 =?us-ascii?Q?iQu8eKg8bmsvW6HrEQZ22JRWRGSdo6FsyoARijV4VFJSH8jflXWvZjK14NIv?=
 =?us-ascii?Q?QOQQbnvEg/5chgCUZ6uq48NZiwoFfWCSwXZRhlAHQ4+P6DCL0LNfbgF+nX94?=
 =?us-ascii?Q?sLfbL24A+xnAWZ+4AlXN21GY3ZC3gHLOhkPTS+Rd4OWzvDOslEPEOgkNR2rQ?=
 =?us-ascii?Q?NToo6cF1nmHzNPrJ5oPMp6sn7cBb4dzfXiMsX3WjBsERMnR0MLBOK+bwc7di?=
 =?us-ascii?Q?rwU8mkPGuGON0oMEIOfjuRZECvM8sc2f2Ua0LMMzi4aKhKBLN/q9ZOUZgkb7?=
 =?us-ascii?Q?mmNkjsQD2TB16d/IWzUjiCJRBetTXYB7gbA3RwiJvOJDRiwLkfxAHiu2m6da?=
 =?us-ascii?Q?59FocwKsuZT2CcTqorH5TDF2s4EFQ0TzB/UijY1TZE5xZJ/o/tNUb9igk6bG?=
 =?us-ascii?Q?Iz/4e67JI8UUovHnKw9at1U1RRY4uJp3sz7+qdF5j9v+VfGCY6sHsNfKHXIT?=
 =?us-ascii?Q?jrl9AmS0q718lAjosyR0uRag/9a1zdFJrl9AxZOrwERWRqmqA+Kl4V7fb60d?=
 =?us-ascii?Q?0OoFqtKznQ+PsPmWSm4QtVoTn9k/VgZAy5OGOXWBc5DXSfVYc2qb6/wvSGJw?=
 =?us-ascii?Q?x9A/hiRX8qNLP3pKiu88px2q9IYyrk1amc2/x5SEsZri5msZIyo5qEg2EEno?=
 =?us-ascii?Q?92jbTZVEjo2QP9tkwgER8zrw/UxVGcQXTTSBSzC5XN0LpDB2H2cWD/Ao6hRx?=
 =?us-ascii?Q?lRYdbUy89fpS1wRbrkTjym+rw+55UvdrQrOC+WZYFngpaEtfXy4/ZrTgXtu3?=
 =?us-ascii?Q?NcNp5FE90pR/O554lQ64KXO4ASl/bFY4CcFMf3K0+wOQETJLgDhFz1bDSsRE?=
 =?us-ascii?Q?EJrzznfZxexwPNYG5pPkFEUj/6fWl+/Pc/nh9YAkNgtTYunLi52AzYl3k1nt?=
 =?us-ascii?Q?JzAuJubpORkG2N7HuBDB/K4xjaex4lakdYZrjmJ5XxkIpfRATrUs8rLB8lEO?=
 =?us-ascii?Q?V1IvdQsM5NJQri2Kh46pR+6376PJKxN1wejiumSV+4xnWeYFwHpjhTdNmG/1?=
 =?us-ascii?Q?WV7jBqOqhEbk7QgwX1vqeVFLm+KgRQCNK0krEDkhSVdvPLcY94smXPrGIKag?=
 =?us-ascii?Q?eXuPRy5FXdTig3UDA6659KZJzZHKvF/lrvhaJvnZTekk3tVD+8vUnAXzZhMM?=
 =?us-ascii?Q?0ibf7sueGoOOeZLN4Yo7aBIy1EIn6gIvvuKLjHS2tion0SQgvjNbnC78+QLc?=
 =?us-ascii?Q?0I44wUqGF867zNKnFyVwpxo2IpyZ6m6B8Yzf2X0JVaMuMWPpKEbgO/u8XUYp?=
 =?us-ascii?Q?93k+mexRkT2OgOAtOps7e8W+2XNNyXqMDf4V78vaMYsLHnr3yOCfcIJDorFd?=
 =?us-ascii?Q?2t2I37f8HFhtaiOxxcFVuYQi40QJVGv8YeFsZR3TPnrQkg98osTVKNRqzZsd?=
 =?us-ascii?Q?K2xDriVleA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d695e75-fa5a-4c7f-6e72-08df17c4b4d8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:42:52.8333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgAlnIVn23IIaVhTgvtwNSWOuOzTNcY0lUV/KvHJzEMIYk9AiJveDW7zfRTw0bhObL/ttjrHPHq9D09ARt2dRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8DEAB7A29

gup_test currently stores long-term pin state globally, allowing one
open file descriptor to block or release pins owned by another client.
Move this state to each open file description so independent clients
have isolated pin lifecycles.

Patch 1 moves long-term pin state from global variables to per-open
file state, preventing independent clients from affecting each other.

Patch 2 adds selftest coverage for concurrent pins and verifies that
stopping or closing one descriptor does not release another
descriptor's pin.


Richard Cheng (2):
  mm/gup_test: Track long-term pins per open file
  selftests/mm: Test per-open gup_test pin ownership

 mm/gup_test.c                             |  88 +++++---
 tools/testing/selftests/mm/gup_longterm.c | 258 +++++++++++++++++++++-
 2 files changed, 313 insertions(+), 33 deletions(-)


base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0

