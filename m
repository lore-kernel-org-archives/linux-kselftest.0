Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC453E1D1D;
	Tue,  4 Aug 2026 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.0
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867842; cv=fail; b=XlW2+hEzhwm3+Astz2jqnU1plZE7HQki8ZMmdazQ0XobRQDl7eHawC0mHHL4eDTbHqTwNBISz/ne08G57JQ+H9dS0/B4MbFIqHDresalIQWKhsReXt9zH8YuIJPzVNF8YDKTCDK+pyX4Sax85NVGahL07SDmNQoksDemBfA7pgA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867842; c=relaxed/simple;
	bh=r4JiTPJBJCVXjMmV1VnSSLWwSE0iRMnGmrTrL8RDkCw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=inTunk+84+42oI+ZEkqtJuI/GhN1iSeoG98rp3d7PC8DNUIT2dKg2ZnmrDSe8gGSOTpdTQmE3w2IJ1HdkiWMbSQPItskVgqyL4UIXmazu+/Dk7fXgMRLMd57xLHE+fSVpn7LFUPMRWp2tLByKNxSKQeRZCZkTNyL4HPGQ6z10/s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AajXjDXb; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AajXjDXb; arc=fail smtp.client-ip=40.107.162.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AajXjDXb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AajXjDXb"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a6Reb8l3QNe0X4u9fMhaZFawsd0qW9QiuuMfKDzKPx+WkUan5A2CMYhhWrlJs0k60CRfXwJTNZMhRNzVzU6qT+kUuLl9QkQ5nTTz/IaLtqibbNUzYa5UE+hs5ShdJaFWfjnGbfaOtbCv0SH+Lgo1z88WUayUQwF5m9ZLr2IKj8fH00iJb7mfFediAM/b7uxcn8EGGdRjBda7yn99Qjk9Q300Jg3GrC0IJvoc6tV+UVgeP3BipYFTigeS0hEFjtV1V+eV03xGaVC0T+koHfxJQFJldL2LQC4UheBqA6lANNLUpJcfr7KJq7u6/vdjJ0UIW+IpV+9Za2NADNfXq7j3VA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n86bSgR7vLnX+oIclHGjs79HF8dfeRulCbKeyTI1aO4=;
 b=kovRbn+j/A5NJxiKrt4Q0hHu040XEwwZG6tFraLMlcSWy5hxMlbhPDt7ESUwfie/1jytwerxVtKvg6MkAx2i/0Y9tDUKxW7Ook0/tFReYlAbxbh0mmMVZza5Nk4zzTYJlIzHQIAqKF+8GLsRq+VZJiikrQelCfeZeT7Cxnomcp3tBr5v/EhbI3BOA97ZN/yZ8ksCOLhY9udYQkqb1EuZzQXFgr+cFJ+q+yhOIYxydxC04efq1jK9p+m9QjAHHrsF4QaR9+p9BXOUia8yDrhWIebv2pvOlzLSJZr84MUsM6U5yGhafiZsoOI+QdjVxUwR3ShWQZLZhV85ryzEQiODSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n86bSgR7vLnX+oIclHGjs79HF8dfeRulCbKeyTI1aO4=;
 b=AajXjDXbUoYqCRTuuSQ2L/uUnbdWo1tqXQVKxf4J5rOxFyTb/AxI+GB/scJZLJ4Ri+Svhy1gb4r8WHzqbOH2Xco71KGMfrO4F10h/xq3JLVe7/vvBGPVT/kSUca3Tor+E8aiBZKgjjtvLCtMf7RcgI61Ty8N0DEXFHgs+2l/5vQ=
Received: from AS9PR06CA0136.eurprd06.prod.outlook.com (2603:10a6:20b:467::28)
 by GV1PR08MB8108.eurprd08.prod.outlook.com (2603:10a6:150:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 18:23:48 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:20b:467:cafe::c) by AS9PR06CA0136.outlook.office365.com
 (2603:10a6:20b:467::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 18:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 18:23:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDiN+CDwTo2SnVRyUxA/oGhu+GUcAqe4pQfdJ27w4uFqUrK83rnZQ+wrj2zUFV1lz+DfTHM+kR1sY+NGgfK3x6C2HgVX4Vw+tLrfVIE3POI6aDIKyC7BR0YXsDjKOXTC4co8fsRQCiWw/AyRASNl8ibsjJAEmuStqQKoaZq1Ob0BzXYhfHrMQb/n9diKXH3fXzmZP5S6SNe2fItDtjxS8qTw+dyjNSsYgNyPgjlFxhsN1Uckyp/e082oPI2nGN8voqfA8wf0k2JcKUELntbUwzO4yRPsxvPA5TKN9IfgM+j4BleRJfNWVWHRW5/LC0LdLGG6JWgN9c1XHp1lndPNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n86bSgR7vLnX+oIclHGjs79HF8dfeRulCbKeyTI1aO4=;
 b=SYCjpzFpmLdVJfo9m8IfulRdRgR5gzMaVCT4GV3NhvDKEJHpHJfe9dOTsDRceELpBTeXV/HuI1nUybCXMdR17EgpCM1D+07iHcROEMJKEK9IDSZu39DBTa4r27RCqC8/XGv9mVkE4WjwQ/IDvbqEJsYclFNwsLXeCFfi0mBrpnyEuj4AavTLlbiH5VDtWbOo9VTIeD44uUkCQAY/RZiSkpnQdHE6rnN62cLE2DqZGT1FTVwHGxRrY/KuyDwG1ex1ynyFZ1yJ2Rjhsnd6mrBiIUr9pSTRpl4a6ewzPMywwrFE4ZCWVEJittZ1j1zvG7X248/ihEizGUrOl5KUSFgNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n86bSgR7vLnX+oIclHGjs79HF8dfeRulCbKeyTI1aO4=;
 b=AajXjDXbUoYqCRTuuSQ2L/uUnbdWo1tqXQVKxf4J5rOxFyTb/AxI+GB/scJZLJ4Ri+Svhy1gb4r8WHzqbOH2Xco71KGMfrO4F10h/xq3JLVe7/vvBGPVT/kSUca3Tor+E8aiBZKgjjtvLCtMf7RcgI61Ty8N0DEXFHgs+2l/5vQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by DB9PR08MB7889.eurprd08.prod.outlook.com (2603:10a6:10:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 18:23:12 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 18:23:12 +0000
Message-ID: <030bdb74-7938-49ab-809c-5fefae4316b1@arm.com>
Date: Tue, 4 Aug 2026 13:23:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "pjw@kernel.org" <pjw@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "x86@kernel.org" <x86@kernel.org>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 "tglx@kernel.org" <tglx@kernel.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260714154740.140431-1-bill.roberts@arm.com>
 <20260714154740.140431-2-bill.roberts@arm.com>
 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
 <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
 <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:806:a7::23) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9829:EE_|DB9PR08MB7889:EE_|DB1PEPF000509F7:EE_|GV1PR08MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: e37254ae-7fef-437e-5b1e-08def25586b9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|921020|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 ssURU6+4eI8oGCUV1arEsWuHdxiUXzlkLrrUErJALovnK54v+FzA5hv2rj60kPW70vKETRjYVjvKPc1X021vIoTyGi9duyNGjv011HtD7lqBlcE0zXMffASol7+T+jKpj7UfAWK/ogx70wXoLjJnMWVxzKjRvvHu7M35KAjPKp/35CNLgCXvU+fH6x7M1JkqPsJy0T8810ko/aSOc1C1YPzgv/xU3RuToZYe3nyjqxZOZXw6WwlQcgtU/943NTlApOJLqplbpLZaT3a7gMhqjrNWEdPkkPB6I3XyLWdOR1/4kN6RBwTDjHzP2LJ0MTGkHPUKl0wbNEQVRuxjMRX9Z3tyGN3g+Q3w4RkAwDhhERQPb007WHZDgB74QB1wyrn74Eh9TdTbWQY10n03YqO69JeiHap42Ve68KIVZPLrCiD81gUXmbnZCExCN0KihEEkkn3MAti3ihnuGJA0DVNgXyN5SWs85mcd0SYNN5AF/reXxU69D62mOQXL7m3uDShHIT+vgzsX3uWsOQQnr0fe6bgin4weIu3fZpJ6mnfGNfyZ6Mmetb20Ted4jB3yDmki6yMScw9a25EvD0Gs6Sc5x1HbLucXpGk8BJwgPeFLwUDOdRzZyLWAyziO4M2lwGE6Fp39sgxPlSQqc2JNrMadzUatiC608T/TGjerymvZ9Yw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 lSbWFEO3h4BGHpJUSp6FeSaSsDGG44n632FmUAFcVjajZHcV6qt7aJ8YHq3RWuVNo0zZJY0NWWyHnNfa/f46/JenYfV+nnhMdnv5A+b3mu15j3qgFH5Fzalh8jgvE/dhvUFyygx07oOTLz0KAq/V48LJb1RRpGVw037D3Lxatsf1Z1n6fkMRlfPJb6N7ATYiBAMCWYijTDfKwvhOC6ZqTc8B2ZUcYKPWguZio58MkYt0/2/j+qJCsz4cgf+1Hhbbh8puM3MY2mHpxXZuyNSZOyreInQRAlXozZuSVKGlU+iO986/xu8PFpQHD9B4t66ujJjS9eEGnZnGECyk1/aAjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7889
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68d5284d-e17b-4046-69bf-08def255716b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|36860700016|23010399003|35042699022|376014|7416014|18002099003|22082099003|11063799006|4143699003|13003099007|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	R19nTa5Ge6BGZzWDGJdKpf7BZK6UMmdos6+A/DZKQGjF7PS5m0xi0VBAOryI2p3/lu+S3n/ZuFYBJkbCcB8hZ6J4yo31toYjUl3kLMnogYwCnccR4orEgxK5o81o2+/dxp+TwG4G8X2coAiHFG581+K8y7ax03XZIQ5TrziCpYyOLh/610hjd9lEnhl/0JQ+fAXvtN4ViIVw0YS7bG2ZffSO8eD60COfjGH5PnbibLvQExXdLoPaCBkccShpHBNjyvOc4pZH8qo9DWezS01jhnyJMsbqNGnEd0FbC0slZAdSj/0wAKvjrmWxrfwChxftopZTedS9VePCFohTqCSsAaoxSw4YIoDD4ii2q/dmw/rxnA+5QjQ+eWon8gLpJa3ufdVmI5el7h+SBGG6qeaND68R3Ql0q2Qprbchj6BNmObatGOKV6BxbuFlXHLIhiDePfAeOtTnzenmaa4qLSBYjq0R30HooWsn6KUsFVPHSOOzXNHuLYjeynaoEafv+QC/DbP9XisE9eCxdzVfRq+bv8VHZ++auTe0jXF0T4jorsrpEv3pSdXlWITzt6lI9R3jm1JUk5ume8Q2Ox8zBRsZGgX7f3vZQ8aff86oNplWWGAFrY7jEhOMJnUpxIhbx9olquQV2fhjKzWHlCyhzIeF29xuAjzGk8z4LEY2/U1sUEKMGZq7zJBIGmQcQq9GrsEBygCrX9v9eMRJxwjoR3doiw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(36860700016)(23010399003)(35042699022)(376014)(7416014)(18002099003)(22082099003)(11063799006)(4143699003)(13003099007)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gw50IxPw4b0/PkaaHNkLb6K+MXEVuUZjCfVL7S1Wk9jp8rRtdgbOXdln11CHOf6webO/HFKrUtXk1m9NDzRUURrQ4XbQUD72xqgqd3MCJDT3l8ZuHhIQqdEEGEzOZiwZY+d35M2Q/BLyoPy8uwyyYVfCzzpx/akjHkIZeTnvuwsrkCzSTlWlzs/4CLQiA1vFB3sKYB8nENqDkmF2NpeV2NCnvv1eZNat4aN8G+NLntx48ZenAs40bCcnMrBSwRPMe2Cn7IIly6EmpoBl8WKFXYC/gPmg6zoRXjiM7mHXJSd/kxA6cRZvoTedvDslmB61iK6ag7PZ8WKrmrMM2Qt/zuDK/8ZXKuE9D8BtAGiEiJfvMbtVfM0nPQMGklhnK0Y8mYVd++tJk5qKzAkMpB1hnLwygXyjOgNfCmOJjbmTpQLzXmMli7C7Hvke4hCEnPNv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 18:23:47.8603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e37254ae-7fef-437e-5b1e-08def25586b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8108


On 8/3/26 1:14 PM, Edgecombe, Rick P wrote:
> On Mon, 2026-08-03 at 12:41 -0500, Bill Roberts wrote:
>>>> Map the generic PR_SHADOW_STACK_ENABLE, PR_SHADOW_STACK_DISABLE, and
>>>> PR_SHADOW_STACK_LOCK operations onto the underlying x86 internal CET
>>>> helper
>>>> routines. This allows portable userspace applications to toggle or query
>>>> shadow stack states without relying on architecture-specific system calls,
>>>> while maintaining backward compatibility with existing arch_prctl() calls.
>>> Can you explain why not to include ARCH_SHSTK_UNLOCK?
>>> https://lore.kernel.org/lkml/e1362732ba86990b7707d3f5b785358b77c5f896.camel@intel.com
>>   From what I can tell, there is no analogous operation in the common
>> flow, you lock the thread features, and
>> the features are locked in perpetuity for the thread. If you need fluid
>> changes to these bits, you just don't lock
>> it. If in the future the generic interface gets this, then it would make
>> sense for sure.
> ptrace has as special handling for arch_prctl. So to unlock for CRIU (where
> unlock came from), it needs to go via arch_prctl. I wonder what the other arch's
> will do for this. If we unify the ABI, it seems the generic one that is getting
> implemented in this series is incomplete. Unless the API will be split always
> between the two syscalls.

When they add unlock to the generic interface, then that will be the 
time to rectify that. Just looking
through patches and stuff, I think that side is still in flight, eg 
https://lkml.org/lkml/2026/4/3/1651.
It also looks like the model is slightly different, in that there is a 
window when all of this should be
handled, and then locked permanently. I know on our side of the house, 
locking isn't really being
used yet. But that's criu, right now, the main things I would like to 
coalesce is libc's. As MUSL and
others get patches, it would be much simpler to have one interface to do 
this in, and right now
unlock is unused (even in the test suite :-p).

Ill spin out a v2 with the comments, but the one thing left to be 
addressed, afaik, is the testing patch
do you want that? I'll drop it, but I think that's a bad approach.

