Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020106.outbound.protection.outlook.com [52.101.69.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE282EB860;
	Fri, 20 Feb 2026 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771605974; cv=fail; b=JDI4ELOo6EHP0p+V0I5o7u9sGXkXCbGO70rgvjlVE5YmaRCJ2TuzkYbXJPj9tV1LG0t5LKOSp0wfdlFRG7wqBsFo6SgAiK9PJKKyf2lShW3KrXbrPg5yoiSeOskXfWhDPoCRtQZ04fqvMW0EyGZp98tIpsJimaNHpLV5L7nGNxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771605974; c=relaxed/simple;
	bh=eb4ZJe9/e6bFbFUwsZOTGGYDg3XOzZCYR91sRhAh1sU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qNzYEqJ13x7+z4VqWrh7hxp/Sy1sDVIrnd2JYPqcYIV7s6bFjJjKjHg9jIYWEzKv2T1EIeM+1ziL6LIYrWCy/OyIPOVwZXr9ir42bHKKpSwOy3lqK37clvSwHDbCyD2ugROgl3LKn9eQKJIPDD/OJngtfk1gOfgWiyZPqxXTnlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=SNlB98TI; arc=fail smtp.client-ip=52.101.69.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="SNlB98TI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eO63co0CKJFqT/HJr7oTxB15TMYQNUKMGLzzIRrFbWHVZmtymru+NhK4mSaCnDlvNucyh5mUs+7j02PG6m/sO8FSiSgLH4gsy/nUSyLg9Haulh6bA171o9MN1NE171TMCY+TMyNo4StTEpNPE6r8mBQ27tcI4V3UzJYualCtD3ijVTxJWn3Yd9olGbEnL1zXT1ueU3vqM+sAzW+ouQQFGK3/sAcyfPzlK+2w/08ZoR0eO5O2v+Y3ghhIY2G60MWh1hNaIGC/tU3L1es2ntjFYZdolhsIYmnR7m7B3auQ5zx/qGmtMBq9Khig8Qf4IzFS870QXo2VcYLVYzjzb6C2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBDj+sPPR/ZoKNJNLlnFOnx50XKOqI2oqYyn/AV0lLk=;
 b=cMyqT8tTx5Jz4ltbhLLKdWtSr8EiG1WOpT+i3rBQS6Ng+V5iYzr/3r+KR+lx7POXvy1jaf7bbmovIpuGu5E7kgILbq00gpCZMyX0n92xMSwLCx3h3XFBBlbbnt4zmBoilpGaiefSqV286MPTX3wKlS+VK1kBWtMEz/NM7tvGNZR7UwhjVkD7PqpnpwyApGPHBmbrxOjgxkFWTDlt9AsPF8f2Q7fr/1vYt6BaKfSjBazjxmeJYomoYlB3rvH/+MMWQHMGvcuWtC6tSIlG9n+vlkplDipMP8+O4teOXFkDtJnR+sYyQZwhEQsxQluKMrlkC8zXVGS4DzYOvc+YZSp5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBDj+sPPR/ZoKNJNLlnFOnx50XKOqI2oqYyn/AV0lLk=;
 b=SNlB98TIFg2MPtE9zYuzzHARopuhIMAobDlraxM5rFUNqL8JX1Km/aJIOrJB3IBaEDAfEiADlVHwt94ozCwUVk+GVPn2bK36u/ZPsRIKIMIDGNUnKoAxb431Lq2LKE8zJzLM2SUvWEoPNms8y95KUXPHJU3zR8G/9YbI9sDqPB4BGJxYnaVbf8vWelJYP4aamDQxkwVKESIz3CNS2cE+dYBPolXyFVjL6Epf1zOaFewGRzfoAA0IMDxoPilq21NFD/gk9n5tnQiD8aHqJByc/HLkTXtPeqvWlQimS5ALNVu1y9ApzfQjFF4ECH9c4bkBgqNEWtTGZBCJQKJPvOe/Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by GVXPR08MB11132.eurprd08.prod.outlook.com (2603:10a6:150:1fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 16:46:08 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:46:08 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Oleg Nesterov <oleg@redhat.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] pid_namespace: allow opening pid_for_children before init was created
Date: Fri, 20 Feb 2026 17:42:27 +0100
Message-ID: <20260220164559.2465466-2-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220164559.2465466-1-ptikhomirov@virtuozzo.com>
References: <20260220164559.2465466-1-ptikhomirov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0456.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::15) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|GVXPR08MB11132:EE_
X-MS-Office365-Filtering-Correlation-Id: c57dd706-5d94-4e3d-a4e1-08de709f8c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um1tSWRuOERHcVJQTDRiS0pzZ3pWcjVmbUdDbmtobG1GYnB5Znp3L0NHSWkr?=
 =?utf-8?B?bklWTVdzeE8xOWlUa0UwZ0ZvWG1jSU5YV0d2Vm9KNUdRczRSbFVCYjVCQlZp?=
 =?utf-8?B?U2NJWWhkTDBhbDBwclZjNktlVzVJS3NWZXI3N3pHeDAzdms5S2lPNVFIYzM1?=
 =?utf-8?B?bXd2K3pqN2d0MUdEbEJOTk9LTUlRTlhMbGtVVlJ2VUk1VzlobDhvRlpCZFpW?=
 =?utf-8?B?VGZ1N2FBeXZxZmZFYmZCYmM3NjJOcmxXS1FTMGlHZ25TeEgxWnloamYycmxx?=
 =?utf-8?B?SW9KTDFnRm9PbFU2dXFYcm5sSmJCYmVqNlNncjF1cVBiR1hPSWFnSnZjZ3g5?=
 =?utf-8?B?WHhkQitBRVJiNi85RW5ZMmNYcGh1N1RxK2hpR1E5eVBYY2wySjMrbjFvSE1Z?=
 =?utf-8?B?Y3hDSWRuRGJFZnA3QU1wdTBFMGJuT1pmdkEvR1RwVUFDS3k2TndPdEJia1kr?=
 =?utf-8?B?Z3BRbGpJYnEwM3Z1ZjNDNi8raFVybnhCcUZyOFBaVGdWQkVGODVxRGhKcG0x?=
 =?utf-8?B?R05JUkdXdzhaK0ZiY2dRNkU3Vm5JUHh3K29CekFDbE1pQU1IcnRHWU9xMVFE?=
 =?utf-8?B?N0hsNzVMdDlWNXpUTHo3SHFsb2tWUkRvZThDYkZpODFNaElLaFd1SGwxUU5S?=
 =?utf-8?B?bjdvb2Q5djRiT3R6bGl2ZnU3a2x6Z3EwbkNzMEdoSFp5VHI2L0VMSFYrK05G?=
 =?utf-8?B?ZHRIb3J1cTU3Ykw5WU05Vmt4b3YwcG5DdThCNjhkUUUwSW1MQzRXRVhBWVE2?=
 =?utf-8?B?bGtUSS9pSE11Mjdaa2t4QTk1eWY1TGdBMGlNSVlWelVBYVdRcUZKQ09EVGpq?=
 =?utf-8?B?OXZqalZ5R0JLUVhGZDNSV3FkU2t0VVNla3pva0JLU1ZGS2N2NXJacnozUWRa?=
 =?utf-8?B?NHlvaitvRGMvb0dBSWFkRUg4NGJvcm5Ub3BNS21MY1RmbmFIZCtOT0xQdXlr?=
 =?utf-8?B?MjZ6TmJkNVlkVWNIWHlCY2Z1M0VZS05md1NsODNibktXMWg4eUV3aTZWeEZU?=
 =?utf-8?B?bWt1elc5SUhUeVFLVVdvZkNxVFMvbzFydWFXWmdhZUVXVGJKUVlNblZjZUlv?=
 =?utf-8?B?RFdhbnJaTTFrNG56VmNXeUVBZUdNdXRpTndnNGR0eCtlVVFuZGNqcDJZdC8y?=
 =?utf-8?B?WkVmdjViWGZFQmpYczJEdHJXaDk1d3R5ZzU3QVliQ29oWEhoZGNXZWVsKy9C?=
 =?utf-8?B?ZUcybGU4Ymw2VEtjS0JPY0tmRHNvTjRqL3NvbTlaRHozVjdObVNMcXFWeDRx?=
 =?utf-8?B?aHFLRkkvQVBSTFRpR2wvT3BNZC9vNzFhekhHUUxPYjJoL1dya09HWll0Nkpu?=
 =?utf-8?B?ai9DYnVyMXkwNmxEOHhWM01nTmIzNnBYSHgramxuNTN0UU5Kd0tHMFNpMDZQ?=
 =?utf-8?B?SGEzdGdxQnpORThMa2lraXZidGo2NlVDS1FWOEdBRUp4ajNHUHdSZmNIa1Vk?=
 =?utf-8?B?MFY0RFRiYmFvYytvQi81VjNDdXAzWWVKSHUyQlc3ZzJoMVBuMmtyREJqQzVR?=
 =?utf-8?B?bmJhcHNsOTlZNENrZUhKTFJjd0xZdW1tWkwrSDlCWTFKY2MvM3cwYmZ5N09a?=
 =?utf-8?B?TlFETmQ2ZGg2ekVwdmNCK1hMdmFYUnU0dzBFSFBlOS9nUnMyOHpmdzY3R0dW?=
 =?utf-8?B?dkJMN0tGWlZ6UUR2aG1QdVpiaTJ2ZHVqWEhpMnNHMnBVMHVhR0xnL1pzc2Vx?=
 =?utf-8?B?VzdMVzRWaU15SnpJN1NUcGFmRFdoKzh3M2tvM3ljd3VrOEdkb1d5Zk8wUlhu?=
 =?utf-8?B?RDJqazkwOG9QMW9vcGZHRjNhWmEwMWljdDlBa2lzUTFDU2JkYzd6QndjckNE?=
 =?utf-8?B?R1crbXRpdGdZcjYwTG8rYVRQeWFxdVJqQVZKNFAwRHJVM1gwcnp0emZvMXZ2?=
 =?utf-8?B?cmtOL0xjUGVqcGZKSHpBR3UzaGZlaVFOVlVrSnBqSkllT0lzWFhxMGFxdkFT?=
 =?utf-8?B?UWhEc1FvenkvYzgybytHdE53T1lmaW9DazlpUzBxYzNuRVp1RUplRi9RVng2?=
 =?utf-8?B?QWNYUWlaOXhqNUVnVXBLRm15S3BuYlIzTUcvYlBZTWRQV21zZXV2RkprREsw?=
 =?utf-8?B?NkdrWnNybXpabkx2MC9qZzVUWTZ4c0tIUVkzUkVtNUZXUGdNV25QWU85d1h5?=
 =?utf-8?Q?gnrM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K093Q2hDTE0yM2ZwZEE5OTVzZzdmSVlPbkFyQ2RwTDFLNHd6cnE2NzQ5NUhP?=
 =?utf-8?B?UXVnR0l4ekkwanNpS1VBcDBjY0NEYk9RcUFEbWlqR3hGd25JWmpzN3hueFJ1?=
 =?utf-8?B?NFpPTlZHV3JLYUEyOHBmYXNWQk9CYjB0V3lDKzlRbzdod1pYUVJvQnlvbkFQ?=
 =?utf-8?B?ejB5dktpNHE0YlFvK0hEQ3hHYmxGZ3VmZm5UcEMxaWVkVWlpYXRrVFcycm96?=
 =?utf-8?B?MnJCcU9IeGN3cnJwZGpWU2JVQlprcDJUWXNGcHFmbXNVOHc1VnlSRFJXRFRo?=
 =?utf-8?B?elMwbFlpVUhJZzRNdittN25wNWpWd2lQQUpvUFpJY1hMNDhkZ2lYZXpyLys0?=
 =?utf-8?B?WHpyTGtiaWhpbXBtODNoVEU0OWtJdzUxNmZERWlGN2lGZmdTdHZGbGJXOXZm?=
 =?utf-8?B?NUx1TlpCa0NZbTNVYzZ2eW1wV2FuV1ltU1gxSVlla1luRHZDWVA0Z0Z2YUJZ?=
 =?utf-8?B?Y0MyQmYvMmsyTU9WQzZjVFdhb0VPK1VEU2ZOR0xTeFU3T1RiV1VFNEo4Sk9J?=
 =?utf-8?B?SVpTdGxpM0xYQk9yVk1ORVZJNVZqQTdwdjl1emYvbjdXd01FYzdkWDY3cGxH?=
 =?utf-8?B?VmRnQlpoUkVwSWhFM2FiS1lLUFp3S1d0TFJYUWNnOWZKK096eUxKWVd4MmRw?=
 =?utf-8?B?TGgwVXgrT2pwaHc3NWZjRkQzdHZiMWxMVGVFUUUybTR1TmQ3OHVES2xjbkxG?=
 =?utf-8?B?NVVwcWFMVFAwSmdQVFZ3YmQxak1UcG1odFk5ZkNYTWdjSnc4TWdSUlNDd3M1?=
 =?utf-8?B?MkppU3pBeDVJaEJMVmRjTVVGVm9NUnFBdGhhZUFhR2xoZGxWd3FWeW1XZFJT?=
 =?utf-8?B?R1hvQUFsd2t5M3VRNjJMNEdXakw0Q3Ftc2g0d2VyQVRpNlhFQUg1TmluUXQ1?=
 =?utf-8?B?VWwxZkluUnVQNWRaYUJYZGJiQmVhMW01YWkwWWZWSFNseWpPOXVGOEVnV3pD?=
 =?utf-8?B?c1RBOEpSeGdiUkhPTmVPMkxsZFp6aXM0U0k1ZWVTV3VpUW82QkhpSEp1Tnlr?=
 =?utf-8?B?TXNtTnRON2VGOUJuaDFtRFpUeEk2Y05rdC94NXhoU3RuUDY4dGQ5M2lHdDNn?=
 =?utf-8?B?ZlByK3U1TUNuRXhmWWVNNHhvT295Slg5cEs2dmRsZ1c4VEF1d2tLUzZnSmwv?=
 =?utf-8?B?eWRzUkZ1MmpJaXhDMWlSRGs0QzJrQk9wa1lxNVVsV3VYL2FlNnBYNmhmUFAz?=
 =?utf-8?B?UTlBek93WjViMzJWOEdjNkpSVU1VVE10QkZ4Q1JVcWtVSkJCY0x5bkNHRUhw?=
 =?utf-8?B?QzVKcmtHUzYwVkxub1F6NC9YbE9ZdTZjczlYcEJkcFRmUHVTU0p2MS9GbjFC?=
 =?utf-8?B?YlA2TWxoQWtJQVV3djhUUjlYdVV3S3A1NHd3cFpyMmJhaHlYT2NubTNPdzV2?=
 =?utf-8?B?aHRucll0NW9CTFd1clhUeDZMU21td3J1cmZZTkF0MjJOWnhQY3Vsa25rc1k5?=
 =?utf-8?B?OTIxUitLakU4THZFVkhMb1RxMFBadDdveGlsN2tZbmNSVnNUdkppTEg1azRO?=
 =?utf-8?B?TXZXak1iM292RHk2OGJBYmpaMmE1dHd4YjBpK0NrbDVnL3F6SGdpUnJSTWE0?=
 =?utf-8?B?RkhkQzl2YXlwd0lXS1Q5a2VldEZobWpEZmp4eEZmWmkrb1VjeDlZN0gvcTB0?=
 =?utf-8?B?YlNmMEFzQmtSdDJmMnc5NHlzTWIvekMxc3lWQkUwQUlUNkl3cVYxM2lYeklt?=
 =?utf-8?B?ckdZZmd1MHJFdkZDakNnMnBGTGdqTUd5YS9RU00wRUhjekFwOEFOMWRqOFJh?=
 =?utf-8?B?WCtQWGZUZDBmQlBHdENlV214UWVzZHpMQ3hzaDhrbnhFNnZiYzlnWUtVMklT?=
 =?utf-8?B?akpGVk96bzBlVVhudDFscEhhcng5YS9HQTJoUndRbFhuMXJzR3ZqVnFGd0kw?=
 =?utf-8?B?OFZZRmF2UWpyU3FvMEZuZ2RQNUFldHFHbkxCZzZzNStzNmdTMVUvb1U5c1VO?=
 =?utf-8?B?MGJLSnE3V1J5bFNDS0R5eWZFNjdOem1ueFpzejk2Q3NmVGFZWVBkVlljSDNz?=
 =?utf-8?B?Y3NiRzV5cC9IcDljWVVia0VCYXZSbERFYld2RHlXbFpMN003VnliNjR1Y0pD?=
 =?utf-8?B?RDdZY1ZJT09xZlhuNDIxOGtIYjNsdk44SlIxaEVBSGttK1Q4ZFhSY25LTkRx?=
 =?utf-8?B?RzJ3eVFhUFhidlVWb3hqanR1Rnk0cmd1cU1KU2FnVW9EYnRSTWd4b015VXhY?=
 =?utf-8?B?K09GTVNXTjlhdU8vMGVVMzNIL2dTRS9hSlRPU1hhL0tDZFdhMHRUSnhEdG9q?=
 =?utf-8?B?NGRlZHV5cHZYcHh4WkRZRS9WRTcvSTltTk1GZHR2alJBUW83MGJhWHRvNXJF?=
 =?utf-8?B?M3NubGtBVWx6Z2VwNExNUFI3VVlKQmRWZjMzYzh6elUzVFNhRU5DMXB3d3ZL?=
 =?utf-8?Q?fEkvCvj9SqgDrI5KOGIwQjuEtqxl9rzlNiOntwKIBXgDq?=
X-MS-Exchange-AntiSpam-MessageData-1: vBxAJhq3+lxgG7F+JWrDpTWaFNnH4xPWDBg=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57dd706-5d94-4e3d-a4e1-08de709f8c05
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:46:08.5356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EihCgk07+Yx4UiI4YJOJhcpSsJPLF37JLD9VD2bc7KgTjJiil59KW2ipoIJUdeUddVVGhNDBc05tpo++qfhiZtLgrDPHNdWII/HhD7iVbUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11132

This effectively gives us an ability to create the pid namespace init as
a child of the process (setns-ed to the pid namespace) different to the
process which created the pid namespace itself.

Original problem:

There is a cool set_tid feature in clone3() syscall, it allows you to
create process with desired pids on multiple pid namespace levels. Which
is useful to restore processes in CRIU for nested pid namespace case.

In nested container case we can potentially see this kind of pid/user
namespace tree:

                            Process
                          ┌─────────┐
    User NS0 ──▶ Pid NS0 ──▶ Pid p0 │
        │           │     │         │
        ▼           ▼     │         │
    User NS1 ──▶ Pid NS1 ──▶ Pid p1 │
        │           │     │         │
       ...         ...    │   ...   │
        │           │     │         │
        ▼           ▼     │         │
    User NSn ──▶ Pid NSn ──▶ Pid pn │
                          └─────────┘

So to create the "Process" and set pids {p0, p1, ... pn} for it on all
pid namespace levels we can use clone3() syscall set_tid feature, BUT
the syscall does not allow you to set pid on pid namespace levels you
don't have permission to. So basically you have to be in "User NS0" when
creating the "Process" to actually be able to set pids on all levels.

It is ok for almost any process, but with pid namespace init this does
not work, as currently we can only create pid namespace init and the pid
namespace itself simultaneously, so to make "Pid NSn" owned by "User
NSn" we have to be in the "User NSn".

We can't possibly be in "User NS0" and "User NSn" at the same time,
hence the problem.

Alternative solution:

Yes, for the case of pid namespace init we can use old and gold
/proc/sys/kernel/ns_last_pid interface on the levels lower than n. But
it is much more complicated and introduces tons of extra code to do. It
would be nice to make clone3() set_tid interface also aplicable to this
corner case.

Implementation:

Now when anyone can setns to the pid namespace before the creation of
init, and thus multiple processes can fork children to the pid
namespace, we enforce that the first process created is always the init,
and only allow other processes after the init passed the same steps as
were previously required to allow to do setns.

Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
---
 kernel/pid.c           | 10 +++++++++-
 kernel/pid_namespace.c |  9 ---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/kernel/pid.c b/kernel/pid.c
index a31771bc89c1..d549f08036ab 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -188,9 +188,15 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 	pid->level = ns->level;
 
 	for (i = ns->level; i >= 0; i--) {
+		bool pidns_ready = true;
 		int tid = 0;
 		int pid_max = READ_ONCE(tmp->pid_max);
 
+		read_lock(&tasklist_lock);
+		if (!tmp->child_reaper)
+			pidns_ready = false;
+		read_unlock(&tasklist_lock);
+
 		if (set_tid_size) {
 			tid = set_tid[ns->level - i];
 
@@ -201,7 +207,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 			 * Also fail if a PID != 1 is requested and
 			 * no PID 1 exists.
 			 */
-			if (tid != 1 && !tmp->child_reaper)
+			if (tid != 1 && !pidns_ready)
 				goto out_free;
 			retval = -EPERM;
 			if (!checkpoint_restore_ns_capable(tmp->user_ns))
@@ -221,6 +227,8 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 			 */
 			if (nr == -ENOSPC)
 				nr = -EEXIST;
+		} else if (!pidns_ready && idr_get_cursor(&tmp->idr) != 0) {
+			nr = -EINVAL;
 		} else {
 			int pid_min = 1;
 			/*
diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index e48f5de41361..d36afc58ee1d 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -369,15 +369,6 @@ static struct ns_common *pidns_for_children_get(struct task_struct *task)
 	}
 	task_unlock(task);
 
-	if (ns) {
-		read_lock(&tasklist_lock);
-		if (!ns->child_reaper) {
-			put_pid_ns(ns);
-			ns = NULL;
-		}
-		read_unlock(&tasklist_lock);
-	}
-
 	return ns ? &ns->ns : NULL;
 }
 
-- 
2.53.0

