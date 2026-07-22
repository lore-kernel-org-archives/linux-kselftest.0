Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE9C339387;
	Wed, 22 Jul 2026 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729213; cv=fail; b=tdOOyX873xxmZ570pAJ4QWib0F/Zzae2e3HHMWiSnSDmi/TJr9+Fmkrzxva0DIXpZYfygMu9EoHO2hmxXh3iWj0PEL6aDQS9CJ4mtOPTN9tGiVxkozamFoAWquBUTEQXH974y+eNcJ4DVDTI/Y1AyTVz8mLSJksQDa4rD4vbuIk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729213; c=relaxed/simple;
	bh=0zHvkeiKqX+hE4sD0dlcnRsjDhmIRank7RlazxzP7vs=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C9XYcJx5Xb+b/bsbQeyyUFeECpIE6SL5LFPehK0dk14LRPzQLL59b/U/NGkHfXZVJP/AwiHgQ7uLTcpK/tMx2nW0KTg5WYmbuf8sm5xTDxl7RkxKeU7ADPDWcewNjpGwXsdLNG1tLAG8fD7Z5elZTiNvtuhCdvCtvuWAqaQRDy4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KBOniZvb; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KBOniZvb; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KBOniZvb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KBOniZvb"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fd2Al/0Ny/d3eNP8B+xArfAbHP/RkMsNj3lBUo6hLOdpKD01wtvsrhlFHhdwuoM2ZSqgIxHws9b0PGX8R6ZgTvCwpNyMYRdid/S4jMfAtoPkzmUWDu/p/fWG8BDq/9GAChLzfiSYLKWsCBxSWrnpbfSHuQ0uhKKm3rAWNyjqhNYI1XTyRkSrRm49EFAGbeQn2lujCgaI/7mesVn7QkmBCyddc6j6ul2F4mFZrHtrCaZHcFBJMha/Un8iGcnbEYZyhPs+JKHnVRapuALhZptv2A1SfvJnsWPFhhb0uTAoAZ8mopOKZwlJWEr0dqE5NV5CxtKzMHfGRegXoj7pxd3f3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2Qi+i7SnrQLaiOAKiaqOqg3ryvpFb1kJaKl726CP6k=;
 b=S9zlltd1QfmgXaQEeGV0xvRKpMwHTW09KBYLxCETfs52xdes7gBiBEJPaCEYWXtmA07/VIGVAQSwnM5GibV13bNxe9Vi+bdXDW8YZ3XZx9lxKt4NVpBP2Inf18uKCfcD0DkmawCU5xSfoovAMcQuqwp4+Fi6dmLM5ys24qwRc5BWpIf55E6t81BQw8Npl0yXdFVI5QC25861O1qEhXBXfbVu8wlWXhw88PPCWJ6jI9Pfa++czI1pXVIW4GTdyKqSd+j4ePWk3lyd6BVV08VwwuBT+FJla0VpQI3P6WaLbcFHgree+C8QfRl6yq3DuRRJFkN98hgMrA6UaBk4uyvjoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2Qi+i7SnrQLaiOAKiaqOqg3ryvpFb1kJaKl726CP6k=;
 b=KBOniZvblyd/594imkg7Z+x+srPN6VRZICyjI7FmU7y1Ms6h92Tbm3vyUlvoqTWYYiXmwdFlN7ySOj+4Oz+VAQtYkdp25tnll0+vJTunVKgsx8Uexhb87TXV+mqxLDhuHUU7ffF/SNn27UOtRMqtJJUhrUxjJ+fJhQT0cJxcr1Y=
Received: from DU2PR04CA0223.eurprd04.prod.outlook.com (2603:10a6:10:2b1::18)
 by VI1PR08MB5325.eurprd08.prod.outlook.com (2603:10a6:803:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:06:45 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::75) by DU2PR04CA0223.outlook.office365.com
 (2603:10a6:10:2b1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 14:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 14:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+W5wCzMh6xRS6zFOTRjKW/A5M+rCYE913t3QNV1nPSDOQiKwwA0z/T/KV1/BnKU/jlH5QAohtvLTxxhSlRg92pbhx/QiOc/xBd7xdb4/QGYpqRF3WwKowKidruugpFjKujX9C3HzGeq4MudH2xFcVLDYry51xHFB1m5WpwywE0F47hjRJcxKhRauA9N1rndCkwwPgulvDZujkk7wX+ePfPJ7TujNFYPaMkCkemr8akTRwDBrusAqH2GviXXKyGD+T0jzw/k+XspBGl35chEcNdCnsbhsLqb7WtW8YJFn8jDYIJh4VZRSxcZEYaJObPgQJO1n6HrD0GeVSaoBfjJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2Qi+i7SnrQLaiOAKiaqOqg3ryvpFb1kJaKl726CP6k=;
 b=SoWdOq90+1FbMD0vwTPyfHWGe4M5+SvCIdcN/sxBa25kaNsKdJ6oeY0b2wBBStCFhtTOXVXgAbOu82SIceQ5fPMRNI8PVxBQq6pfo0eXrrhdR0txuo8Fcq1CyN1thVkhCAvFAkm3gntd/oQYAfzMWCPAQyUnKz/UhrY05+rUNck39WK5F5+B1pjSRICt99ljZ8OzHnIk5Xdw97EGNh7eSh/TKge9DxGPfM/ydCWA2fmtYIyx8dV9/lEjv4gJLTo3dn+QNNz9TsL5e0WiSuFFnLdwHwqGyaYlUcKRWlLVKWsZcqL+pPEo2UIv6W2hanOXxJ3IAKy91xchfuPxprDCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2Qi+i7SnrQLaiOAKiaqOqg3ryvpFb1kJaKl726CP6k=;
 b=KBOniZvblyd/594imkg7Z+x+srPN6VRZICyjI7FmU7y1Ms6h92Tbm3vyUlvoqTWYYiXmwdFlN7ySOj+4Oz+VAQtYkdp25tnll0+vJTunVKgsx8Uexhb87TXV+mqxLDhuHUU7ffF/SNn27UOtRMqtJJUhrUxjJ+fJhQT0cJxcr1Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by PA4PR08MB7641.eurprd08.prod.outlook.com (2603:10a6:102:273::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:05:42 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 14:05:42 +0000
Message-ID: <5af250ab-6a52-48d3-bd50-64e8ddd99915@arm.com>
Date: Wed, 22 Jul 2026 15:05:40 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com
Subject: Re: [PATCH RESEND v1 3/5] selftests/mm: skip khugepaged swap tests
 without swap
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722091219.61504-1-usama.anjum@arm.com>
 <20260722091219.61504-4-usama.anjum@arm.com>
 <9bb01e21-159a-427c-9d64-5db7070f0209@arm.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <9bb01e21-159a-427c-9d64-5db7070f0209@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::14) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|PA4PR08MB7641:EE_|DU2PEPF00028D04:EE_|VI1PR08MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: 7feed9d0-985d-42fa-2735-08dee7fa768a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|921020|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 ipI6WEcX1GT0e45hxwSn4XqGdYPnCPUWS+SumgTtKncYlCwvhAGSLeaAhdcPlGOaUET9k/2vYJivEgR8cnXjtvN2WbFsyc+T4jzz9lQEJunr58tBcJ+RaV9pFixETiBnk2udQo+xHH4/5HBSvvgvTZtATh7E9sWTfSMArjODebbfv7mF+naiZDlc8hq9pXlCxPXqmSIjD1fo1XiHF4tj2HdfutMwn2+O6N0IWyxB3L/+qswcKSt1DlvhvQ+/Q1xR34KOjDEpTdZIThiKLthWLAkEJ7E2TwwdcO7iTtQe6VCQ9nD2k0B5HZzLZhw+OnlBdgHN6UPvDs/j369Q/E32RE5gxUGnspyt6XHo2EwVMB7JLnxMqzpQH2h4KwVuGrx3C2B0wAIYkjNT6oDjZTdwyHyikmmg3TxyjyaRMiF4BsC+vR7MK9nSdRv90ls4XkBbbMvict+Y5wkIWiJeAUiqliJmjr5L9XA0cWo6f+xqa23YTpFsOBOdFQvh98RAh1G5HUj9qgb/k2nt4nhdt/qsJ8jed3IV5n4ak2i56BcVFAg57bqTNJMNBRt/93V0ECec4a1y97jRJ4XKUq0fd9AAkJvGORP54DqJ6iCxGzw8NgxFfELwC5T7mhkrN6SPVt3daUqyGsx+KZO/IKOVYo814xMadiQWX93gNpSegBsnaffsDXPAQsJiF7a6ivoUtb8di9Aq2IfgqaIc+mB7dndVOg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(921020)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 sG/YuQC9dQ/FqRUA+ABemhPIx4BNi8Cj6+jLfMSRFe7UQXG+loL4jCyitPX9gHZGxhRY6291EP45UwzjkLf+dIGX5ClEKpMnCNinm/v7xq1OU3N2VY1CErP5w7Vw3IIwJR+7n5UqwhD4znmzr8yPB8gpf+o+vPzcSaqrPLaux+eQQnhEVYMDeB7CFKzppg4hiqXRPI+WzQh+jAeRfjl+W9jtU/7+sqcCII9tp9dItpPx72tWRTQcMtiMrNvyuQh32n5V1hjoVT0+5/eRJa2i6fhSBGEC1aUn/sdEIzXhGAR22uE3wTQnmuMes4GlNyalMe4IHxZTm/tVF8j2H0KQRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7641
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78e0c0ee-acc2-4438-d997-08dee7fa50ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|14060799003|35042699022|1800799024|82310400026|23010399003|4143699003|11063799006|10067099003|6133799003|56012099006|3023799007|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	wr9vl4XfBK371s/RWFsNL+6DF7Ee+QXLPhvxiY9L0EV90Ywnaj+x9Ycg065bZ+mYg9S+E6b0FwiQ20Nr/xKb1A2E5JzCIbOKeDX4pqT7rrOZaFa+Lr4ua8NyNsKz3xbiY4nvx7HYKtEGzZWoQdzU3TkoKe7AMhwO0oEc+xCI1aWEu7Z6pUojyFOzffGkFQekPTzUxq3OqT3RIBqGQDYDB1OeaIVnCPtKH+NiirLMvLgfqjtCf7vooXub/GyZssLej4/+tVG0eimjlk28wkmGuqzeorLnkZpy167IkpLIVYuNju1pIKKoParKIxc+mghikDRWuZDcyq9euhDaRPRuIASqS9U04DYi8l9qGyyc0aNjPZYxFtX164QTpPh4mDz9EZyjfuJbKVI3hokohE3NQ7BlV7Y3JuktSHg6DzXE6N4Dpjd2pzWMsKKP0+y657qe831qplnXrqB7OkOCd45KR2iSW0SwNmEeK7/uzdnP8jlWFg/bjXGUXpgUPW2Tkeu0lbXK1u+xbBukw3eavFUAosvg+JrvPWTYnbXC30szrjTWaqz2cCC7o7FEnR4YNyLyzGEAPF/E9p3s4FBX6hOi21D6iRP40bjZHZhyJlVuu1uIZmpgUx4j3A3FPs87syIFkShwSyAVeQvY6h18+auWmR+TN50jLKcy3w+p0dNLGZYtdZcXKP1OBalHpFKpSiW6SppAwd9CCIMxcX7ywEnP8PbaNdqWDuSID89yC/IhNtdQa4Hk93SaCXCB0izKinQX
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(14060799003)(35042699022)(1800799024)(82310400026)(23010399003)(4143699003)(11063799006)(10067099003)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kIz+6pX/XMpC38wcVCGOk4QTwH0D9ooEL2Yt38K7FaXB4QHKrZU5QzenMXPGfGyPf2GDzeQV4xVKE73QILqhwe4n+5P83ZvJK2Y9mE8GX3cJXXKTT57wsO3IseZZPxC2I0mFeX/J4/Gu0DWjRNBrTc7Q9kiwQNtkp9kUXbdzE70yYhK2+xhnSB/iLJNGAx0NfIba6ljwCIhJXOlP38ypy/dSbrZh/FrFBi0g7tnLQH/LM5m1EBu8vexM4Jd92NLcfEVjL5ZnJRMNepsV2BIVR9nsfhU16pU+cHp/aY50OmWo3dbDPi6a6VqmqFOz38oU1Lxvzb0TyTDrFxT6WyzfNIVbhRy9gHbDvErRxxKsFwAGca98x6N1evF8td0pdQhj0zuUTZbweIKl61ciVHNCaD5DBSry6SzqxQy7MWwkDKHfKNVugHrKe5LoCYRFe4gY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 14:06:44.8655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7feed9d0-985d-42fa-2735-08dee7fa768a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5325

Hi,

Thank you for review.

On 22/07/2026 1:16 pm, Sarthak Sharma wrote:
> Hi Usama!
> 
> On 7/22/26 2:41 PM, Muhammad Usama Anjum wrote:
>> collapse_swapin_single_pte and collapse_max_ptes_swap require
>> MADV_PAGEOUT to replace anonymous pages with swap entries.  On swapless
>> systems there is no backing store with which to create those entries, so
>> check_swap() reports missing setup rather than broken khugepaged behavior.
>>
>> Swapless configurations are common on Android and other constrained
>> test devices.  Failing these cases obscures actionable results from the
>> rest of the khugepaged suite.
>>
>> Check /proc/swaps before either swap-dependent case and skip when no
>> active swap area exists.  With swap present, retain the existing
>> MADV_PAGEOUT and swap-entry assertions unchanged.
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>> ---
>>  tools/testing/selftests/mm/khugepaged.c | 34 +++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
>> index 10e8dedcb087d..a152cec59fcbd 100644
>> --- a/tools/testing/selftests/mm/khugepaged.c
>> +++ b/tools/testing/selftests/mm/khugepaged.c
>> @@ -100,6 +100,28 @@ static void skip(const char *msg)
>>  	exit_status = KSFT_SKIP;
>>  }
>>  
>> +static bool is_swap_enabled(void)
>> +{
>> +	char buf[MAX_LINE_LENGTH];
>> +	FILE *file;
>> +	bool enabled = false;
>> +
>> +	file = fopen("/proc/swaps", "r");
>> +	if (!file)
>> +		return false;
>> +
>> +	if (!fgets(buf, sizeof(buf), file))
>> +		goto out;
>> +
>> +	/* Check for first active swap entry. */
>> +	if (fgets(buf, sizeof(buf), file))
>> +		enabled = true;
>> +
>> +out:
>> +	fclose(file);
>> +	return enabled;
>> +}
>> +
>>  static void save_settings(void)
>>  {
>>  	ksft_print_msg("Save THP and khugepaged settings...");
>> @@ -734,6 +756,12 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
>>  {
>>  	void *p;
>>  
>> +	if (!is_swap_enabled()) {
>> +		skip("No active swap");
> 
> Can we prefix this skip message with a #, as recommended for KTAP
> output? Right now it is printing like this:
It looks like `skip()` is not being prefixed with `#` in this test
because of how it is currently used.

The `skip()` helper itself should probably be fixed, but that can be
handled in a separate follow-up patch. This test is not fully
TAP-compliant at the moment: the normal pass/fail output appears to be
compliant, while the skip-related messages are not. Would it make sense
to address that separately from this series?

Also when we run the whole mm suite using ./run_vmtests.sh, it appends an extra
# in start of the output which we get by running normal test directly. Its
controversial already that we are applying TAP styling to suite level and test
level as well. So non-compliant skip in this test makes overall output
compliant.

> 
> # Run test: collapse_swapin_single_pte (khugepaged:anon)
>  No active swap
> ok 16 # SKIP collapse_swapin_single_pte
> #
> # Run test: collapse_swapin_single_pte (madvise:anon)
>  No active swap
> ok 17 # SKIP collapse_swapin_single_pte
> #
> # Run test: collapse_max_ptes_swap (khugepaged:anon)
>  No active swap
> ok 18 # SKIP collapse_max_ptes_swap
> #
> # Run test: collapse_max_ptes_swap (madvise:anon)
>  No active swap
> 
> 
>> +		ksft_test_result_report(exit_status, "%s\n", __func__);
>> +		return;
>> +	}
>> +
>>  	p = ops->setup_area(1);
>>  	ops->fault(p, 0, hpage_pmd_size);
>>  
>> @@ -760,6 +788,12 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
>>  	int max_ptes_swap = thp_read_num("khugepaged/max_ptes_swap");
>>  	void *p;
>>  
>> +	if (!is_swap_enabled()) {
>> +		skip("No active swap");
> 
> Same here.
> 
>> +		ksft_test_result_report(exit_status, "%s\n", __func__);
>> +		return;
>> +	}
>> +
>>  	p = ops->setup_area(1);
>>  	ops->fault(p, 0, hpage_pmd_size);
>>  
> 

-- 
Thanks,
Usama

