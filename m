Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEE919049B;
	Thu, 30 Apr 2026 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535914; cv=fail; b=J3MqMe9HSV93nKF96mR8rNrXCGRpxit24vhCFrF/PI8Jg4Bq0kgiJ7YEzLgruQ4dh4OGVQLaq6Y4otYrnBK+nvmlnGc28bEAgR6PYRiafGlQeyaR421y4sUbRk7R61+B9GK7nTSQPWIRSG+rw0m0it59FNYqr6d1Ku/EE9f+RrA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535914; c=relaxed/simple;
	bh=a9mD+Im1cKWCYS1wZryxsVntp0Vl8BlLiJLT06eMeZo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ciLPKzt6bGgYf86U+EPhctL27j1fpD8G7ryoBPc47Pe8/zBJ+MNNIG1V4tlce5rIqgPGEBu+1pOo355U+uUr+TfuyCzOrzl2b+opS6MHqAt6+I+1VWmnWoo6oMjOyMl6g9dhFTEQPV3GeciISLrgnFDqFfmKXolHu3wvAZjQVME=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o9kgwo2K; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o9kgwo2K; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o9kgwo2K";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o9kgwo2K"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=elFv1tmlbBECC4mSQZfq4j0ckrCGkusTiwwyOSiaLqZ6EjFHS2DKdyj9vJAHnYJIPMZf87FAvRbxACXwFi/2TDpAyOSBoZ2qbTd+ajVnOCQaL2gWJQ7FlLIpkNGNySVu3VKWZZvWQlhuZsCOy9v/YTwGnKLUrcnAZmLOhkz1bO7SHgZPNbixE/4CJDpveWuORGBhCNM8swDC5nN3BS7Zh8dxZiwZP53PYBqZVwVfrtx/a4Pbo4s1TS+qza0NSyZ7qrgVrau8LVzaZ+2rWRkK3LM91ycQ6t6Zl3vkuJU9BRvQivcn+d/N/ZjtBFmomb0hSDSPIXiq305alkHq2tkTCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvuwPg048xpLtmWVkp8j2VBvIEao02Y18I+j4v3peuA=;
 b=jCc0v8/3eJu3AX7i3xFB92Yhh3Nq9scSwuVqYRvfPrtCw4l+51SnTkfVIDGJVKzmpIp/9Wyxl51Ai1cY7qE7D5zPDBeCoc/uWHrh9t2AsH6mYcZ7J1DJECgZ9sNEAObNO0iio1E8u0dugt9V5E8hd/gPTfnaOd908d8EdP3w8pHnDYtVMsVHOLm06Sy39ANtRXGp3ogDk8JslaRtcr3SjCQmKLvU/BXaLcw/htotUZi8ulfSZOK6cRW9sE9nV6h4eK+n3b+sWzmzYuX8d2C2e3YDMoBF3qvAlay7Ohk5WAx2wu9S+b4YoqsVDoOHTFriHZ2bOhasFJF/lzMQXb9vUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvuwPg048xpLtmWVkp8j2VBvIEao02Y18I+j4v3peuA=;
 b=o9kgwo2KKNeaDF1NFhC30reiWwJnkYcFcO6vDBns1u4sZwY/zquUix5nIXf5UrrpqGDYiYnppRSiw3zlQAsaBQIJt4f12svi/Fbqxn4XbGutcUwzHbm+RBCwH3zSC92i05PEFs2LuCTSSJF8CDMMq0whBL4k4RzyuBY5ySIASj0=
Received: from DUZPR01CA0245.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::25) by AS2PR08MB9074.eurprd08.prod.outlook.com
 (2603:10a6:20b:5fc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:58:23 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::aa) by DUZPR01CA0245.outlook.office365.com
 (2603:10a6:10:4b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 07:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWkeQpxK7rG2p7p3bWxx1dS7IZzI3rS6UXcUQRIN+e9TESwfG6Vb+DRZOuGN8RfgFDqNf1BFvysh+v54GQ04KorA/kmVWj/DKpDL98y275MCp2MR6lSQYsiVbHsAEJOjfr3tLfacgVpF8JPO7Z6ZNUFo0VXmSxIyrQVMC4s5XpCqKiN4YpTBLV+EHCCGzG+Z7ttKpRUOU6SN4zNEhY9Nsm68jgJrOeYuK+zqxaxcEEIDRBpT1g5Q+sBjsu+OxBrr1FpJMc5wc0MSxxdEvNiyl4BNmJnS0YeNkBUdn5YBQ0DJpCkcM0qVZcpD1zULV55V/BBE8hHEr3B16ND6k9Sp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvuwPg048xpLtmWVkp8j2VBvIEao02Y18I+j4v3peuA=;
 b=pl4/vp6oW/CgB0zszVvPz0/MkYwz+lF51BoiIKuX4XvwjVV6j7/RXZaYavRU8zmct8ZMsKZKekc0LqDHddaCo5NXL1A0fbXOTXDJjUwpIzHdTlh8UVq5KNnaAGNpJoB8ElsmmicZn2vc8O1q6Kuk738H17SpkFm1Ug4Zn19YiTgonfA/M3zc3tgj/zS8UpwniAulGVo06ory1RMWypFe0OUuqhQIrxMR9y+ln32MtyNDw5XbU7+KmrJw+sYtIwPnRC4KylYWNUG8O7Og+FUYbLRYde5p75mu1SWdStdVzivOC3IXkcibWA5hmG7lf4qkNFjLt6yNPsLuHndNVruytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvuwPg048xpLtmWVkp8j2VBvIEao02Y18I+j4v3peuA=;
 b=o9kgwo2KKNeaDF1NFhC30reiWwJnkYcFcO6vDBns1u4sZwY/zquUix5nIXf5UrrpqGDYiYnppRSiw3zlQAsaBQIJt4f12svi/Fbqxn4XbGutcUwzHbm+RBCwH3zSC92i05PEFs2LuCTSSJF8CDMMq0whBL4k4RzyuBY5ySIASj0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DU4PR08MB11835.eurprd08.prod.outlook.com (2603:10a6:10:641::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 07:57:20 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 07:57:19 +0000
Message-ID: <3ee25654-2d3a-4c59-8ddd-2228c405329d@arm.com>
Date: Thu, 30 Apr 2026 13:27:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/54] selftests/mm: add atexit() and signal handlers
 to thp_settings
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Luiz Capitulino <luizcap@redhat.com>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-22-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260428204240.1924129-22-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0092.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::8) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DU4PR08MB11835:EE_|DB5PEPF00014B9D:EE_|AS2PR08MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e4521e-c33b-4634-f74d-08dea68e40b3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 0rggnlYEKRLxiXcZjre0g3ciMkm9/HMKt8twhS7h4c+V9fcT40RqcR0GoxSyMwgGtXA3elQDXIc+5NMPLf3eRNN6RB1pyrhudjNKCUcNtTG+b4p0V5HoTvu82NTDvjfPvTvhrgIT0URxpBoritkLVC0jKfOzW+wwlLlkrsKLDHlhjgoyQ3VX1J9/0XKek8/Gj3AXzw35cJGc8bxZ4YULbdK1VlsLVYXOznD0myKADiOvpwkUU+n8Sn0Ez1XHLpqp5W3xSDaRCSQrJco8M+2FYFIpzWRRFNmXFwzCk7/4hSSKDyvGyWCXnlTxDfpGcGNeTWMsvvAFZZ70mcdqLcsQqTHRh0AuPQHluIkk7PSi/6r9IR0+g8fcIFX1J/thOHcx7S/9xSD8B5lRx7Tt20HTJdtfLI+ATky/tu3P9BsaZSunn4mfcrnMTHpgclbqpijcvDc0u3/o0xYE+zLdAfvBDZ2FRwjjjpk24iglX4k5pzER63qGWpsHhIarmwZVbbIrdoFEeW7vT+R+tiS3iZWMiHXAJ+189Y2CAdJR7FSDH4GthG+IXFF0M/I7j8vxqWhcbClLs5iofBLKYdvj0TeM2S7DT7SY3/+Ri1Jv8r1c4uu5S8RYEmiOrGqf2eNMB5axLjOt9sPBbCudsC/8VgKo4y5DFVzEakuAAsFqrUIAVn3ZGbopIJIi7JG+qIzfSOhnlstcapVR31xDrFs8UQNk7hpe2eHywVCSUnWiGQzXmBU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 pJWq8ZOQS1EzCLeA5r98L40FI/MTxH9zwVLFA83BcsEUhESkLGXkBZYfXtPi5ytjC8TpUnYNV1h+2B0N5UjxmL8iycvvicv0Kyr72w/YgKmpfiXZHxMQEdZCVbnbujFU8/tC406xAzJK7D4OYioNVCvWWzFq60+f8KFAUBxdzQhbrY0Zn1fjuk3es9/8S+UZYI+VLncjGyGW3fANgY4MCGU7SWP+l3Eb2b1XRyCSAapfy4ATYvQpK06aNDn/KiFWgtyfsZm8wHO39z47W+qUlDTWRaoFMQOVbOtAbwfVzaef3KC+EiMEWxb56Pe8Vmwr4bZ+o7++LNL6umBHZA+i4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11835
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68116cc5-ea76-4c66-cf77-08dea68e1aa9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|35042699022|1800799024|36860700016|14060799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vZzN+TlQXs9UvK8128SjVXXLBBOXoUwItjeCFi3c+2KVXq0Iw8saU5t8wdQ3X+fxR18BoxPJw41c1JDN7TsQ+e0pdE6gG5Rgi+8z/y6XX3z89FwIUFlBz3g8fa5Uy0K8W2R2SLqfJD6yhXVphLh5Bv5JEm6HNedXLDFuqZLKUidvv5w3vREzqj2MGwFhFOLQVMQyHQKL0LmWJt/aoQzNTwT2SsHLkBZxUYlaizC/lynC7zaW5FZ+7kFQvCLhnjbjYht+DZFznUVv9tD1iZ3pndeLHI7Zt7QCujD+FnkW7A0xR8unnvxkD14FlcJGCUppARbnR35ISn5vn1H6KY3INGx4jhPwUzbZYcZF/vr+ph3K6hQZ54g+esaLi9hNVqg2Iojxo40N0B6GRAj4dflWpPQXdO/Z9ARUUzZ226GORUTMKKTKivGtfH6zRuyZFXa9FLT0NP+eHPHHy1KnLIr3IeTebV8MhXfPPqm1MIAEX127t6JsKtNQ4R6hymu2d7MuWFvNIMZpjtWmcr+WgptksAYnAGJjP+3ZXb7DmgYOf8DpIxN/3S1B3wGOTsxCQNxqV0b2mQRmg6z9Sj4+552aHxp2WHGkdAGpRtP9NwLoN3fPjnpMKBLoxcAr4ytTGKAa7cUTBARflEJBBzqDxs0Vb/NwbgAnavOkUoeqOnwaEAc70vJj0wy76Nni/Kk5BDdRKEbNAXgCuFrrO+p/bTF/8PI4wZqzGwShw8OfwfolYCXKBLneBQcYJpPivCjjXqWUyGlmhxyekvbclrKmAtY5bA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(35042699022)(1800799024)(36860700016)(14060799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DcjmPSMOwP9RoOnOCYs8ZmeCL/RdiJPtb0RqgXCB9biAkmeYC8TkFCJn9glHKIBjQumE10t9xNcG8eDeDXYGHPMM+GVFvrr5L1zG3F8jyWsYa8JUS4ViJCbSOCw/CQ2OPwttgkJuK5Awx7+2olU86nMENdaVggWadMtIKDQdKDK8rS63f0ieHP06MqOzgBRWLmbRU0F116vDM9u6QNtxpZUECIIShDqyKkKziKxuzDzsZ7qVqh3owH07DEDffZWeOyXpTqQf3e3W0roSaT49evAHLnyAJWmrtapX/94//Jn0flLReBsbLWuyzr+GTpJ8hrR4x+nwYpnvQ4c7ZvB0+C5U1UnYSHbMTI3q1KpbJF2bjY98Ih9yU/n4ZYxEutar2t3uq8v4zl7KBSvGLWaDeF/g7wolpWRhJog6YXxlc2vzWqsGUFACnRek2gsiF+Nd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:58:23.3232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e4521e-c33b-4634-f74d-08dea68e40b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9074



On 4/29/26 2:12 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> khugepaged registers atexit() and signal handlers that ensure that THP
> settings are restored regardless of how the test exited.
> 
> Make these handlers available for all users of thp_settings.
> 
> The call to thp_save_settings() installs thp_restore_settings as the
> atexit() callback and makes sure that signals that kill a process would
> still call exit() and atexit() callback.
> 
> Update child process in tests using thp_settings to use _exit() instead
> of exit() to avoid altering THP settings in the middle of a test.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

I ran the modified mm selftests after applying this patch and the THP
settings are being correctly restored to their original values both on
normal exit and when the test is being interrupted with Ctrl + C.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
