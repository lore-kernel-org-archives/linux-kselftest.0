Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCFA38D417;
	Thu, 11 Jun 2026 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176144; cv=fail; b=p6/QkD/lo6VvajO1akeaiMNfQxB7qnQUaC4nipk1HSapJRKo1DW5mYBxUFUd0NbYJJ7Sgbz1s4K9rGR3Wzyk1OfOuLqMmQDzQPsqZts8e6mJPj2bmMt/eQBvq52RBBVq0GWiyf316k2SKmg3ohrlk6dhgxhVB0qHXXaeDu+RnBs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176144; c=relaxed/simple;
	bh=EHdHO9AR/QdHjw4egZZ9HhmpOH7/dHoq2eZ4O8p2lCI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qky30q4iUlQwBXSVgsMWNKqLLva3aWAHd0NG2M62CCJR2lOOC6rvyXS+Vnyd5g0CFxlN7P5mbPCMZSV4w6+3Zo7mliDNE8dcSSdlAihVo9P+F6J1bUse8QD8Ca/87L+ZjVvpO7kmvu9TtGxw8uQsnmrygZZQDF75EMGA1Na34fo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GIgzEznW; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GIgzEznW; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GIgzEznW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GIgzEznW"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VxCW+ab0DEbB6ulk/uyh7TPmPcmKnF/tnl9i5fP4R6YdiV/qm9cbPDCmhN/q3PA9FmT1585nlmA2FTuME2qUTCKX5r5qWXm8hik44Iy2RfzQOnOd8F5lgHrh0YwsqzINpKObioasHRZiAMw85th/A/xkD9nmoiaT7wWDb/GGtqD7ldpSmFIR6dIet4lMqhbZ+nheCGq/ccyjQqugo5MYQQEPg24H3fLH09DvpNJnCQpYZGjrAQQNhNp4mq8YZcRaB7GBbGxFLOVFNZ6KhPq7blrBeZeKAKbmXkgRiu3tA4iEhvIeZtYMdmXxhlTzIi4dBSawoGuXMlbWnVC/9BlXRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGz3Rt9Hl+uUk2e85R9xTQkGvE6MZZwPv0ajcrlMzzU=;
 b=wqVfylW1pnjC9GJG7Wd6EYWxSimSWoUr2XPAo1as//F0VmYZlpi82cQADwLETv3uZrPH9kEXk8t+2kRDvoSl+x2ExOqB4Op0+oBD5sO+5+0a3f9pEz49QtnWpldeXcJCQ1IN97Q6fxcmAI1T1fDU0XC7wrC7da2MX8eZW9hThVI7vkd2gmJQ/27MJtBUnoh3/DfEasgKu2eGbOT+T52ieQa0GpDz770Tz3gyXMSkC684C1fIFgcJKZNADHYmM7c+M++e4I9aYZg/9KrrBhNk23gkuKZ6bn+fLUXti15TUXvR6fouulfpC/WkvUsV5IR1pHPwq8UMgJdrf6/6b/inTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGz3Rt9Hl+uUk2e85R9xTQkGvE6MZZwPv0ajcrlMzzU=;
 b=GIgzEznWePUXAD4gRKtI8xh+17onUM8ycpxmmRFMBz3fbjZpw5k9EcrgSLmuVu9BSAbM3kmoGprlM1qOgi4gELvGwyJs0uIiDCaIV1eeOt+dzjbQMciGA59oHldR0IQno6oY6LqfJLiCPd1RvqHRRWXqf/bo8T0j1sRYOtSuEc4=
Received: from AS9PR0301CA0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::19) by DBBPR08MB10771.eurprd08.prod.outlook.com
 (2603:10a6:10:53a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 11:08:54 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:468:cafe::2d) by AS9PR0301CA0028.outlook.office365.com
 (2603:10a6:20b:468::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Thu,
 11 Jun 2026 11:08:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 11:08:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2+HM/ANqeoZyG/gdxZ+EzufPEJR/1BcD5D53UW5Yyj6hFUC5jA9cJlnJiUgL6C17XYhaPprx+Xr/xT4TykGMQJ9ncbZkN4KXE0bxUcT/isR5VDKkZNnaZ5fkxq8Fx1/AEX8zUImITAq1vW1LJTFZQUIfc3rmv9epZHZP6tPw3LTIIljdZC7uLXov3IRhLWkt/vb8IadRWtM/a536BFg0E4Ei84hVoZ3sEwQtUFcw9xfUz9i/E5KRz4Yi1RPar8GcWsMmMFeKQlbPrf7Ac90+Bs4pMv05A5U0/AC14BxrhSy6S+TITAypVLDzt22pH94UNc8Nh8wcMihCh2qPg6EHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGz3Rt9Hl+uUk2e85R9xTQkGvE6MZZwPv0ajcrlMzzU=;
 b=wBgGdY1pphPH48qUEm2LEvAS9DKQPhbgtACgjcHKbelgt07lQey5nPvxhlxxTNuq3ppBv8/hX6zGBg/eTcqiyuZrRMK5ihJGWAJBvAnbqmj1Sda+4pl0bdubhVgRGQuDx1k693O1HU1zNJrwWlFhWCqUE6Lsd2qoESfm7eklA9kqGPp5XVjOk7RcrhfhYttvUK+5/P9TEfUDkh4j8G8dlxdGCfy6G4BfXUdZq4KYGJEYPJKYJRWXjcQkoNDPtz6nBYH/HxQhaz9R/qp5KYMCI7Txyyon5EKwWmlT1MdeN5mxaDhqGGdsn0E8zbztAdFSkC7S14Co/hUOkAaaNTK1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGz3Rt9Hl+uUk2e85R9xTQkGvE6MZZwPv0ajcrlMzzU=;
 b=GIgzEznWePUXAD4gRKtI8xh+17onUM8ycpxmmRFMBz3fbjZpw5k9EcrgSLmuVu9BSAbM3kmoGprlM1qOgi4gELvGwyJs0uIiDCaIV1eeOt+dzjbQMciGA59oHldR0IQno6oY6LqfJLiCPd1RvqHRRWXqf/bo8T0j1sRYOtSuEc4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS2PR08MB9200.eurprd08.prod.outlook.com (2603:10a6:20b:59f::9)
 by AS1PR08MB7633.eurprd08.prod.outlook.com (2603:10a6:20b:475::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 11:07:21 +0000
Received: from AS2PR08MB9200.eurprd08.prod.outlook.com
 ([fe80::e16d:9c1a:8c8a:377d]) by AS2PR08MB9200.eurprd08.prod.outlook.com
 ([fe80::e16d:9c1a:8c8a:377d%5]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 11:07:21 +0000
Message-ID: <9afa4ff1-9749-4efa-8112-73fca1f25e8b@arm.com>
Date: Thu, 11 Jun 2026 16:37:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: mm: fix and speedup "droppable" test
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Mark Brown <broonie@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aishwarya TCV <Aishwarya.TCV@arm.com>
References: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To AS2PR08MB9200.eurprd08.prod.outlook.com
 (2603:10a6:20b:59f::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS2PR08MB9200:EE_|AS1PR08MB7633:EE_|AM4PEPF00027A67:EE_|DBBPR08MB10771:EE_
X-MS-Office365-Filtering-Correlation-Id: 3113534b-2817-4167-a38d-08dec7a9d326
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|921020|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 7uDgwL6A8e1VCbhhqpdXu5/4vJEqRQT8bbjiflcFpAKgnPcvcgwyWFyroRASjGw2WYTpkA9gDsAKJoI//IxJg9mqcGs+3GfeosePKMoCD0vTiP/wiDk5aSR+NFxPzKM8Le743Knlr/OSaEoy/UWN4xM8PlAbtNbeHxtaxKbLQygchMKnZZNDJCU5bQiPUvVwHMCNgMOwxiZglbCJJFUCQrJ6585OeuHTYbWquQfU8AEutkcni3a2ZtN/Jb2O2ifn7mkudGlQKxNg+lDAX9PAGhZcJCQLNNgK3W8PZn0uUoo7Z7EJX0nwcoKZaCtstaRvqJu1PpDFUFmqz0idsVAPxxFSodNDosPK/YMe21da2YuQfZQsRScQwqqrL22tEEvoq958WNvUY3eUdoIV0IsTv62WydTIQAGmXTybd7X4tE0fgxigmZsZfcX1QWqZZuQJowgWdXGxw48YXbpYOLkXScra7PySaYWn3xuq8RiA5MKVSh//2yI1pMCfBwLrl3FF3/RhPItEmJDEQuQvh00+KklBzu0OnzqJyRg6wWQh+LW9RKubx9i5VXue8Yg0pF83ADkVbzskdUa61H3WCW8iuLREBNdHE3yV46HcxYz/BCD6lm2LweWgQSzW93fPMyOGKCPq5nAqwl/5IgkURBb4DPP+mbsq7HKqo2segvndCa7FevUiiKAqvEZEfakk+/KoPXvGsZa+CJPqufqmI51f4rYZxUqSnN77OgJY9fuS1EcDhSXlDjiNlDKidHpmdcQc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(921020)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 pKpRvsJmgJwceQgT4Q39qUJDfje56uHKesvPpu+R8als3P9NAHJiq2bckrjswSgTh44JXwVul7xbA0KTBqzk2ZIJAs+JNn2Ne3w/czt4/7QwP1oYoZVKWz9Bp69q0wRPYvHMhp3+aXoFfuHFWSjXFkWbUJPxDzcuPk5aGQKzhn00JeWnINOL2RCm64AJtHTDJUjzn31iomz11LbdtmKtn22CxQvrD/vFT4WRcjUSH1sdP9jE+XlZ9CZh4oQ5pDtEK/MKqR3Tjoc7FYJhjQ7rylP4KFl/MegwjCEhGC2RykT6FcfXlmoL3Z+LNOmTOX4Rd8XUGPt3mLfA6jEmRxOcMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7633
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19c9c2c5-d22a-4049-af7f-08dec7a99b92
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|14060799003|23010399003|35042699022|1800799024|30052699003|921020|6133799003|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	mZxNNMbS/V3l60sVWDDXEykK6+vJPSzvnfK+9ey6JpvBw4M4WY0A9b9Dk/lc5ATL9O9VxAAc95PepX1aZ3pqg6ea0XRwjTSsDmKJ3Kujtj9gjXRfvWxhaf4D0eQWz2G7dY0ufaZy7+TbiQK4cS68cetDC8SZCUMers3mCAGuGcNRhAhjBFGh0Ui6g5j02/8sIbLhe4RYjGhH7olR1OPZh86eFMhF79IRWIw7kFdBp4qBdTZhycXBBQ7BiE/W8iU9cpozqqaiDg1w9BzEJJdazcM3/6WA1dni8o/GVg4AlXAygX0RjgnW75Q5of9D2jWxHE4fC1+jN+o1y7AmRiOeNt8OCeHcjAugiGoX+7J6cInSsw6L2x2ObGGOpqBcV+025R8sq9cgoMlfbYw4etA1Ijz/JmGJCe9LMUluSypp4acnaIPDW/gajepINo5IirZEJxBSVrMkFQG8R9fXWh5Wc5P9wA+3bBE/y868KD/B2VeB8k9c1OCB0nQ60epSE/qG51mIYKnzX0+H/vP74TZbeeWTekAUAx+wvRe8qwyAlVuwIz1iOE9D3iO7y17/sKnvGrtMe7yBB2ORHhGKuBMjCBWrorkIlnQ1G0wz7KgeKqgPUUuPOO/5VDBcN8jmrAGcNeemlSmgf+RcPNUUxKaPBFVqdpYSKW5f7p8QVw+FaIHFt7ZvO1xRjwV8jjDwxryF56rRkSyHhAOGpx4oeKkgXs1n/lfLnPJJeTIAxdfaE1fPU+KO+m3H3KHt47R29zAFNkARLAH1SO3agHhRbErDCg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(14060799003)(23010399003)(35042699022)(1800799024)(30052699003)(921020)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x0uD9k+sVfrU3i3dTVzZeUkCyG/pPCeN4zW+HU/mMjnOwe/QMbAPALsGTxIhlJsmnY+wbZqr187g5grGvQQdMSdfn8wKqn+XhsTer06TtL0E614gt8RjHSwDeRGg/Jgi6ya1DJGaesau4QcUgcogE4Lz5FOX+RCoX/rjgLChsjuzkoQOfAdcXJ47YDdmUIKSikSKkN3r7/kEXzbxWyDdhh2WjGovt6K7SBqXwjLSiGNfCRYXklIg6h8e691b6t8ZnL1iLC8m+STrYmqy9iUdAIAxKMm/ZCa4r+3rWJB86C6IrRlRtZpMmuXCpF7Kct7hjsyubNRAxd1j8LaPkaz/f625OzrhWCrlFejWHEwQUvz5DGydReFJbP3hJaUexwXBbP4BEQSJgDZmnji9ocblwC7lE56ygnJbBJZoVPmDfzBvTNv9Y/CebjhHAgjfbwzz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 11:08:53.8162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3113534b-2817-4167-a38d-08dec7a9d326
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10771



On 6/11/26 3:31 PM, David Hildenbrand (Arm) wrote:
> The droppable test currently relies on creating memory pressure in a
> child process to trigger dropping the droppable pages.
> 
> That not only takes a long time on some machines (allocating and filling
> all that memory), on large machines this will not work as we hardcode the
> area size to 134217728 bytes.
> 
> ... further, we rely on timeouts to detect that memory was not dropped,
> which is really suboptimal.
> 
> Instead, let's just use MADV_PAGEOUT on a 2 MiB region. MADV_PAGEOUT works
> with droppable memory even without swap.
> 
> There is the low chance of MADV_PAGEOUT failing to drop a page because
> of speculative references. We'll wait 1s and retry 10 times to
> rule that unlikely case out as best as we can.
> 
> On a machine without swap:
> 
> 	$ ./droppable
> 	TAP version 13
> 	1..1
> 	ok 1 madvise(MADV_PAGEOUT) behavior
> 	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

I ran this test before and after applying the patch and recorded the
execution time over 5 runs on an Orion O6 board.

Before the patch, average execution time = 3.87 s
After the patch, average execution time = 0.02 s

Test results remain unaffected after this patch is applied and speedup
is observed.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

>  tools/testing/selftests/mm/droppable.c | 46 +++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/droppable.c b/tools/testing/selftests/mm/droppable.c
> index 30c8be37fcb9..57e1b6fc5569 100644
> --- a/tools/testing/selftests/mm/droppable.c
> +++ b/tools/testing/selftests/mm/droppable.c
> @@ -17,10 +17,10 @@
>  
>  int main(int argc, char *argv[])
>  {
> -	size_t alloc_size = 134217728;
> -	size_t page_size = getpagesize();
> +	const size_t alloc_size = 2 * 1024 * 1024;
> +	int retry_count = 10;
> +	bool dropped;
>  	void *alloc;
> -	pid_t child;
>  
>  	ksft_print_header();
>  	ksft_set_plan(1);
> @@ -35,26 +35,32 @@ int main(int argc, char *argv[])
>  		exit(KSFT_FAIL);
>  	}
>  	memset(alloc, 'A', alloc_size);
> -	for (size_t i = 0; i < alloc_size; i += page_size)
> -		assert(*(uint8_t *)(alloc + i));
> -
> -	child = fork();
> -	assert(child >= 0);
> -	if (!child) {
> -		for (;;)
> -			*(char *)malloc(page_size) = 'B';
> -	}
>  
> -	for (bool done = false; !done;) {
> -		for (size_t i = 0; i < alloc_size; i += page_size) {
> -			if (!*(uint8_t *)(alloc + i)) {
> -				done = true;
> -				break;
> +	while (retry_count--) {
> +		if (madvise(alloc, alloc_size, MADV_PAGEOUT)) {
> +			if (errno == EINVAL) {
> +				ksft_test_result_skip("madvise(MADV_PAGEOUT) not supported\n");
> +				exit(KSFT_SKIP);
>  			}
> +			ksft_test_result_fail("madvise(MADV_PAGEOUT) error: %s\n", strerror(errno));
> +			exit(KSFT_FAIL);
>  		}
> +
> +		dropped = memchr(alloc, 'A', alloc_size) == NULL;
> +
> +		/*
> +		 * Speculative reference can temporarily prevent some
> +		 * pages from getting dropped. So sleep and retry.
> +		 *
> +		 * If a page is not droppable for 10s, something
> +		 * is seriously messed up and we want to fail.
> +		 */
> +		if (dropped)
> +			break;
> +		sleep(1);
>  	}
> -	kill(child, SIGTERM);
>  
> -	ksft_test_result_pass("MAP_DROPPABLE: PASS\n");
> -	exit(KSFT_PASS);
> +	ksft_test_result(dropped, "madvise(MADV_PAGEOUT) behavior\n");
> +
> +	ksft_finished();
>  }
> 
> ---
> 
> base-commit: d401506a8ee8ac6bc4a7767c17da036e9434a4a3
> 
> change-id: 20260611-droppable_test-3737bd791dfb
> 
> --
> 
> Cheers,
> 
> David
> 

