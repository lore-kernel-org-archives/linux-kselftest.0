Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA041A4FC;
	Tue,  4 Aug 2026 06:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825843; cv=fail; b=EjobZJ+6dH2pKbwNzFLdMosSd3gzxikgVGW3ttNKNj9dcT9rCZdPC1+r+O25f4rX4XP0zZhV8c0CUjbraa3NXZXSNOI4PHEPJ8oP3MRSwER5FUua/3zi+x6x1SbJsyL3YvrZWk+GerAJngvTAe5YiY1X7fjhBYxx2ufsgStcCUc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825843; c=relaxed/simple;
	bh=0nuxmE7qoUY/ulcTFgDANt9qe0C6WI3gGLuQ1op5l7w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XA3ZhhxKQuyEsSurQpPPU7RY8bnu3axUQYtv0C47B66b5guwiC/mhQqrH1K2pBlcdgiR92CfZZiVz+CubKGPpTQi6uV9AhUvVlCq/I3jmpaG5CdzAqmDFA3QPxg2XraOdrOYLFPhS5JrcCm7qn+IT9NoGLkLQjX9M1pgzCA6TIM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W6DHkt/O; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W6DHkt/O; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W6DHkt/O";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W6DHkt/O"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Klp2p93ZdZ+f7LeLhmB+eOrMOr5erf0t5wF+LOzabfRVK4ABrSKUfnG1SucUMVBbQ8A7Bmiav5P6b4EBoUuio3wOyuRsDfHn1JvUBpgw+0j4orLcOO0tkOFna/cFWOvV4zj2Oj75YccSRPzOu7vActXlD0+Xmtbc0zuKc+vt7yZf+pK0pA2rkikV8Z9qzW+o78/EOOngKY3oo92opdw628W/aRXp83+4/agLN8WhpLFqJwXWU+kb2UuliLGIuc1MmC+DobySMruqGtOuflYctrNtPMM5sjmziMsqXY62j9TRRq92F8H0jAXyf8c2C2uPRfncmOJ4aaxXYX2hFnuYVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXuOt/4owLTgbL+W+ZFSiehOC+nEcqdg3l6C7SW2aO8=;
 b=V3/7IwCpKPtsAWb1RYm2cCFajyaMRdmoA3nJMNQ6ecl0fNqds665njBRLRCYs4CYkHL3jhj3OaL640Ga/nBETD/6613G/x+QdevXblYPsNFqcZdH2rzC3bZRtfl8IS2NEVEj7MDjB715FACo/UeLlKsu1kj9ROyts9vnGWCQjBl+yU+vo6srXnSI3GMt8YXRLe5NAwrn+QmXv8QaNr0N8ZjJWHhTQaasQomzrxfut0GvK+TC93dx6MBzs0ByJszAU+iLGMpscDpIaRggAHjVqlEJcrCODJBYavRXxCbFy6ITcx/3PGabM5001Ym1eYbCvjH0KxZVCnqBn9Ad9wtGVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXuOt/4owLTgbL+W+ZFSiehOC+nEcqdg3l6C7SW2aO8=;
 b=W6DHkt/OqYJ5e0tp/paWZkikjJxRI6G5ezHsMgX9PzHPl0Gj18cPh2U6Ot6D/YRM/7rGWu85Jcnwvnt3A9N9jhbFz4CJTaAGM+l0P6JkWuR2MUN4kxvXLwTw1S3omiItaljYt4Pvt8qnF8aSJOVjHeS9Zur2AjoMHu/O1yVjSOQ=
Received: from DB9PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:10:1da::20)
 by VI0PR08MB10620.eurprd08.prod.outlook.com (2603:10a6:800:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 06:43:55 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::19) by DB9PR05CA0015.outlook.office365.com
 (2603:10a6:10:1da::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 06:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via
 Frontend Transport; Tue, 4 Aug 2026 06:43:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXbnw/LjZSpFtMAnRll4N7TzER+sJoBdHIPzZFle6mZnd0csfb7V9y+G0FAx798ioinkQIsh/Zkz+KCDtBBbERaVbSIsj4eS26Gm0gHwSBLp3CzbJxjO+Y+RSASRoPieelw0zSb8fTLJWJRrrzD69pzZpvtpbiu2OxQFztS0e30iFCVyUFhVj3uiI/cOMc/CNW1Nu4T4OA3sc1j/K8wdDTvOPErEMwJvjUTmSZzCSObvzcoglDxYtKZ3H16GiQlBS+iSHB3tez7H4SIgrUNj09M5NiT5pQeXhWAozOpYqZzwh928binqmH1f9X2yjidSpG81oTMQrM/KbPJB8cNDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXuOt/4owLTgbL+W+ZFSiehOC+nEcqdg3l6C7SW2aO8=;
 b=ED5C8rFsEAqO74R0tvenD9h/e0aR3gazK996+8W1c8i8gCKuaO+rE47uiH4EKJpVoIjGEIJx8rL9KLS/BE+gYTOUyep730W2w1qB9Q2Zk1nXeHWSIHkHrFcRFIyIkR0bshL0qjswwM6kG90wUBEoAyS5fqbBnDjvA8X6SBujTaonyMOHK6FZkUsqxy343R7TZ+PpIIQxwns1Xd34bwdf83ueOyGPEw01SprZIWppL21g1LXxuW+zUd1OnU6jCG2DxkNAstUwD4GEidhzmSJDD0Tlp/HDUHl6FRx0WnC4Z2ia3WKDz9YFzuglrsHkIS6MC0Fd/VddAjoJ7QYw2g/MZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXuOt/4owLTgbL+W+ZFSiehOC+nEcqdg3l6C7SW2aO8=;
 b=W6DHkt/OqYJ5e0tp/paWZkikjJxRI6G5ezHsMgX9PzHPl0Gj18cPh2U6Ot6D/YRM/7rGWu85Jcnwvnt3A9N9jhbFz4CJTaAGM+l0P6JkWuR2MUN4kxvXLwTw1S3omiItaljYt4Pvt8qnF8aSJOVjHeS9Zur2AjoMHu/O1yVjSOQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AS4PR08MB8046.eurprd08.prod.outlook.com (2603:10a6:20b:586::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 06:43:16 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 06:43:16 +0000
Message-ID: <6dd92e11-77c2-4a18-8ec0-82977832b724@arm.com>
Date: Tue, 4 Aug 2026 12:13:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] tools/lib/mm: add shared file helpers
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-3-sarthak.sharma@arm.com>
 <178574760161.1561566.15822401997260524037.b4-review@b4>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <178574760161.1561566.15822401997260524037.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::14) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AS4PR08MB8046:EE_|DU6PEPF0000A7DD:EE_|VI0PR08MB10620:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc4bdab-6793-42d6-f8ec-08def1f3c0fc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|11063799006|4143699003|56012099006|17002099007|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 uZhkOwLB+ALOzXiSMksaQZPw/pPn6wB9CA2mdh/W3toP1OhOLIR02V3Ml/NRTcpwthB8KGpm8E/R/nchKn73JPtaYXfYaaRQa+yAV0wjMIpg9meH1FgjzpCcPh9mkefJn+oHRkWzJTwbUpySLE4Whas/ySGY+dSc/pg7JeFnsTQ7X7wJ1+0+q5d2s1TNcw36ha4tQxtakk1CduIuFm7mX0HlGexOtavSyiY+Hf2E1GiTKB0jJV/4kbsY36TXN1hiCdDymK6mtUQ7B9GSAThtvl2h9u3alnM4FUb0rvdqwjpNC+a+M6LZjHDvOmKc4WDfIyjMp3lv2sTGXjImo68N9tgAwJTcFW3eYkCLEdnO/OG968EsnCv1mDhCD/krsOtZnG+xo/tGBPWZH6XMUVvmne5RgkqFApF2Mv6E+h7R8NMw+QKnCIsPywFScXU1cmCNRaP6WH54IwR+caIN8oenyl8gZGpnbrSOkGR8Nizh6w2GpoGuT1PpY5yim0yqyzebeb/GJmZGI8wKvTwgDZ2mAr9qF6NpytiaK4VZIOd8H7z+FBKsoHM16fLiYMxTNDv+XHlzMuPlObOt6uIZoixPYr5CVQSjUkehPSUHeHH/elc3A94MdCoJuhphKo3Zukqse9Yesy4j0QfFvIGtZqfqh48Y1TSlnrHPO9qxOdZeGNY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(11063799006)(4143699003)(56012099006)(17002099007)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 s+DjmwAhP5/7w8XlbrNDL5HEm1hl6TXv/4ULyqEA0G719RihBlc+m/O20E7ObOtzaZzvTKPKmK7fk9hZmfM9LTvxtXOLKGmwk2Gd04If8bzg6i/bzAiEjYkszerApwRtFwmB/3fRo0C/1s+xLNti7c3yZEkl/XsHjAMMPTP9pMmcTMAZvb7W7mq9Yy2gvlOeip4of8+g1Ogm0Ap5Dxr1rNYb6nuuVZfpca6hZyc/Wya4wtSRj2vwNibbTjcsyHbXrjKBdOWEZp98O/VdgdAa37N/FOBxmEvylwl0SK8HAFU2j8jxPgRDnQqE6H+ecvoYeKOHc7oBRoZ1PMzVpD9WNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8046
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b15c4990-b13a-451b-48a0-08def1f3a99a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|376014|7416014|36860700016|23010399003|35042699022|1800799024|10067099003|11063799006|4143699003|6133799003|56012099006|18002099003|17002099007|22082099003;
X-Microsoft-Antispam-Message-Info:
	zIm+FE0Fcxa0ElPPSIHXRFIStQgEhXfI/KaS+8rXJ9Jo0ifSKx6P9KYUd/8ePWP/6NYrfhkd657Y2c3QhG5qNEjfQ6/YEikE51APGGb5VCb2KlCDIhN55MflUa4VL+f6dlpBbNENLRGFWHl9ZOhlSQa1MNlx2falLInmYpXw66nABYw2y7onpWG79NcTM40YicgJdvAwDHOSgvdwosh/n7YyN6nx3bxndT+Knt8avVtEOqAlilbwgJ+ZJoB8IT/Z7pI1DexL/DULbG+xOVbbZOxmYqjUjtpnftRUNXMHs3bQkz9mHB8ukkh9faNsvirSVIBY1JtY3KFOftbpchtQoYjQ+q0mJKI1W6Nu7ODgNH6UoeSZccoYXZ03WE0FNNphotGRagS/9so0EkVj/eiV+2Fmxhi3gR//PPnXrSJ6TIVF43KMqlaO3Ix5ZKSkBPfvtx+/5Fb9AKLkB+Lw1sXiLh8YTgiW1wLUyBr72lY6XybCVic/9ldEPua4WxjX4jToN+FOXZ0AT1A1OBjgcxbjXI1/O+qg+s9Frn/SWYTLkX/qGGk94btDQeAYCj7GmiaquCLy/nK4yIVFSw25Ajt+cs3kizMr1p5+ZTKf8tB6KG3+P3a17ftbwC7+63RRKMcj1YBryK64Y5gQhRk/QrowLW9PHMgczuNROnA56i0AdalUad/PhkWlhrs7Y9bIdNgCeFVZpTStuUDPXVYmwBECmA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(7416014)(36860700016)(23010399003)(35042699022)(1800799024)(10067099003)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(17002099007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VYwz56oHa5e9d6OCGSTGI4aSJ8wPdbMaUoDJ5JTJUz6JXjz6tY/tR7u/bjHmrg2nvzX2EWCqjB28meFN0/MSvuaPnYufLLFpFFycKovfLOkmZewhZHFk2zPnWKDOzODgvSi7JDj+pwvtaFBF/DGzEYKFUHHbuHk8nkFDxef0zCPJ0sTsAVDf/SD6XWcK/ZL6IfhIhnxFz6XqnfUAznoOZlnU/+tL+WbHIwY/4qedK84CfThBl1Y5yBRvNy6Uuckl3QA5TDUDkhLZy49+XefIvATuxgkBKdLv2ZQT3dMtOGXKf9huQl+TFkdLS1wWInJAqCfF5NdOKE3XSIcbzFco2++8/4qrp9LAx499uPPetTD12Th8OCDbrSsfcoYFP6cmwoSO2r4HlXXwKKUOwk8I2tPFc4i7t+1ZvuH+b4/X/8nCfuxcQ2hYyEvvAROQ08Jp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:43:54.9341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc4bdab-6793-42d6-f8ec-08def1f3c0fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10620

Hi Mike!

On 8/3/26 2:30 PM, Mike Rapoport wrote:
>> Move read_file(), write_file(), read_num(), and write_num() out of
>> tools/testing/selftests/mm/vm_util.c into a new shared helper under
>> tools/lib/mm/.
>>
>> @@ -187,8 +188,8 @@ TEST_FILES += write_hugetlb_memory.sh
>>  
>>  include ../lib.mk
>>  
>> -$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c
>> -$(TEST_GEN_FILES): vm_util.c hugepage_settings.c
>> +$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c $(top_srcdir)/tools/lib/mm/file_utils.c
>> +$(TEST_GEN_FILES): vm_util.c hugepage_settings.c $(top_srcdir)/tools/lib/mm/file_utils.c
> 
> I was too lazy to change the Makefile, but we should do something to
> compile those once and link to every TEST_PROG that uses them.

Yes, we can do that. But since this is preexisting, let's keep it
separate from this series. I can send a patch for this separately. Would
that be okay?

