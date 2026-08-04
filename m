Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010049.outbound.protection.outlook.com [52.101.69.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF541A547;
	Tue,  4 Aug 2026 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.49
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825639; cv=fail; b=fF2YqNDuI01ElpbIpETOB/+OjJTYh0Kla46a4P7plg6RespVrGORp8IJTYfaKSvhjV4DEpyNGKtAyQAmxk2eshA9pNuf2CACFZA1VnPGaJ5fM3i0VHgrIt0xjbX/iOs2OfA+Nw50G0f+Rq5Za9Xsq9i0aFeLTuyA+94LAJRT3eY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825639; c=relaxed/simple;
	bh=r15IaCVki1jcW64JULHVRaAuP/5E6ilyu5Ayvjg8UsU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m51ykk2NqK9Q+IuDAUrnxK+9SsqBCZ517fBqcuHF4nBQlClQrN8n6PCBTg+wucEJJ+LBDtkH1XZetE+sUh1IFJpHT0NblZgdBjgu0la7xeWmRQ4fYdQb4RxTdRRwVrHn6brAqWnPmvqPiKXtdcXuL5s6aq+D4aIyslrXOzxE8UU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=csnRFBY/; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=csnRFBY/; arc=fail smtp.client-ip=52.101.69.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="csnRFBY/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="csnRFBY/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iz9dIQ8l2cPfrB1SPNl6YX30LxD/EYTeOtpGjNXbSHsLZ7eyxbOoKth8B7e8HT6iRLDrIdhQ0atc6PPTdZZhHKE5GIsVAnLGnSl863RocqKwIwrl6cGFB4fOAnQZ1ISD5vhvv2e1uzgd2NsyrjkdEn+VAxF1uEWwgsNAn9Jaw2ZpMsGY9/EUSpuOSgRO42vz7uNL7VsRTAzUK3Gr3CrZLmWyHDnl1E7mk1ZAWCVosbOwQjTFcwC7lk1Y0RgvRV4OYLh0Cf8oMQkP7XrtzOzDGROJRrnBMnM01ASAKryGaQUxhXNhj9WVNGeBAbxq6pDIqMEUb0Knp8wzJQh4FFUi4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frzNCrDJZ59n8z2LwyVHaDWjLCs5ShkqORc80vT+7cY=;
 b=KCxlvTB2HmQnKHfHyOOHFRA9xCZ9uwT7AL2hEYLRsQMk8zxmer/pgvCUr1ScmOvlhvYzbyd4UbyaHbc5cp5j8ktWpHROUTO9400A93GQrR0KpXpl9HsjTpsJPAkK4D6UNbZtaEPxfJ8yPz6RGI+zU3uNnTg18WXJfTWHIsNZo3XIz00d24gt2m4dxYyD5yLwWEd93qRghKJNLO6mA3x/ohIvCF8rY1PJCpQKZaN9o6wPChIG0Cj1IUmXuBijLqBBBSIUkQL475zNdoJbNg6zC1wbQBr2uOeiKecov9XbRqZtKhKYNZubmqK6OT+im+Nv14aOiXyav//rYSjXvZmwNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frzNCrDJZ59n8z2LwyVHaDWjLCs5ShkqORc80vT+7cY=;
 b=csnRFBY/Tt18tL/6+cD9IY9+txp29hsG6+yx7ytiulOtqw4zPg5aTD1PdHkos1QZytu7QDN0x6efhXNzdBKS4XRDvTdlmD1xo1ISE/KtcIstmRLbo2+nLzd/6L33cCY0RzpmuU3lTDPd8Fyr6qGYu3nyceDWOtcdwA2Oml2oz4Y=
Received: from DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) by AM7PR08MB5413.eurprd08.prod.outlook.com
 (2603:10a6:20b:10a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 06:40:27 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::65) by DU7PR01CA0019.outlook.office365.com
 (2603:10a6:10:50f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 06:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 06:40:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8sIN0PNKRVAyQaEpgkMRjqeUkEovRtNbedm6r+E2V6c8XjJaLwzYvuav+h6eXb6c27nk7SI83XKN271GYsK8P219D6cndI+69mtPIRY9EBoOx0D+9ZTI20wuNfQEBjzDUF8V96uk+d/DI5Ooo5BmFxZ/5rsRkb6yMKWy5T5HqAZ3W05crfZay2HMrnT0urFot+EFfznuVj4cHdHD2uLQsdesgdaA1Oqq9qfMNUNivn4fV8tVPpG7c3dRZSTWMal3Pzp+COjJ+QJ2Z9ttQuVCl4XEhrTxhIchfjYRW/eM5L904hJs9xo+nZIKL+t39/EJTgIn72kjYiu72mLZWIXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frzNCrDJZ59n8z2LwyVHaDWjLCs5ShkqORc80vT+7cY=;
 b=rBdVdeoLJ2eszRKLsZc4Vl0/oGUowcrE5ZpaMycyf0U1oBaUNjSZjMqw1ib2/04i59l8q7OhJTebaq4TQJHqHkEr/zwac2eSJv3xfhwYnquEIIyJxQ3gdRw67+Sn5Eu/GKhLqpcq3zOWG5wJX5R6nYmRqv0I6pu/WRZAB0TMx58dEaj6bRB9StrHsYVYbQ4HFXQ+3kWtvAt+32sP7IV+ZWy3OfLd2n+AxizSdYKqw5Yv5Fgg3TPlGEh5cueR3caUQg7I/A4yVI898KNXXxnTZiMXfI26DjgeYSe6NlMCZyuh2WJk/G52YUKRZRL3DLcf7LFBK8cgO1yliJ/YgRDwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frzNCrDJZ59n8z2LwyVHaDWjLCs5ShkqORc80vT+7cY=;
 b=csnRFBY/Tt18tL/6+cD9IY9+txp29hsG6+yx7ytiulOtqw4zPg5aTD1PdHkos1QZytu7QDN0x6efhXNzdBKS4XRDvTdlmD1xo1ISE/KtcIstmRLbo2+nLzd/6L33cCY0RzpmuU3lTDPd8Fyr6qGYu3nyceDWOtcdwA2Oml2oz4Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AS4PR08MB8046.eurprd08.prod.outlook.com (2603:10a6:20b:586::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 06:39:52 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 06:39:52 +0000
Message-ID: <1d38e784-2474-482e-8510-a8ff0f0caac8@arm.com>
Date: Tue, 4 Aug 2026 12:09:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] selftests/mm: make file helpers return errors
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
 <20260730140825.238130-2-sarthak.sharma@arm.com>
 <178574760161.1561566.9774044559691998578.b4-review@b4>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <178574760161.1561566.9774044559691998578.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0035.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::6) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AS4PR08MB8046:EE_|DU2PEPF00028D03:EE_|AM7PR08MB5413:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b987d4-5b5b-4d07-42af-08def1f34505
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|11063799006|4143699003|56012099006|17002099007|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 zHOORcrMcvmIu+cRJeVxyhPWl0YiW7nJhRn87LUJ+bgs902ktRiY9DVSQqDosSKfkGMLOqbn+4yOcHuA9ta2k5Uj2al6BGo2uDCXW20e4RHucz1KwhzqQYvNrU42KSRBMNQnpHNszw5dJhwF/pysPV00nHBoqpj5N6u3o1w588k7k/TLNDiVFCdW4d9SrrL91U5CRGw1yMgeeeBaYTg++S82Py2+UdnrVoPRJ0TxhntXd3PoE9bnIzM/U8hTzpdNJAZPAaum+/q41DPBGVHd77xMe4JHO+UHTF/ukDPyBg6DAD9EhwQShrQ1EmXSFtWWAghkxcBEFJYuq4MTsFIm/UEcAck+49RLl6fwLws/BW0wFy0oj/bYyPqqgO0kaoZYRBC1wDmE7vxShc2XxBR9YDwJNyBtyUqPDyBWKN86zikyWJH5fQIIB6VGyXFw+Rhfyqie0381HqkvUgTF16nYoNIdj4vmuQ30Ce8UH7Ys9WC2zcjrgPESd2JmI9KjJw3YSVCskOWEfiZWKpn0hh+HxKL7MH7Sw1Hbnlx27lGubpuccDX13zya6nJ0JTf6eCdRQ/Agf4wWl8vQTDWfBBEcHveUcDOd5Y2qK2tHa2GMWnfO/sY1XQu2Gv4o+NdTLrl/tdvskLyA5RFmv2qZqEbJCwzORsSE/DisDJTZB+QF2Ko=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(11063799006)(4143699003)(56012099006)(17002099007)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 atASNhe+kWTV5MKBbcIw0QWwmTTuUg2+q0bPR4i31olcb8uednC9rbRY5COjmOOkrlCXj2Joq8AICWBDLNGqcyIxwrEYy/io1v9rqdBRr0tabNIern1WRkdeDwycboR59GQZCSA7T0XEEEJzj+BqfAtfrh0/A5V8SrTWm9o0ARD9eKTKmviB51/dA9QoEAQPknlJ3NMUYRZM3QvVJIzZGTqdBCKNZGxOax9ztxQb4s12K9eBfZ/Jl61iFj5nnBTyCTWvc4uKosnne9jtTo45PZBGAmu0XWLcrQ6+bM0HTTMNCm7q6E3QeCHSdzZW+yOc+lPYRK+sxz5Y8ve4a/WfEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8046
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8d1e785-1556-4a87-203e-08def1f32fff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|23010399003|14060799003|376014|7416014|1800799024|82310400026|10067099003|56012099006|17002099007|22082099003|18002099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	h95sTbxNm0dm/mPDpBchjVbI+TDcs/+5Ir8GQoXpNEWzqthMnlZXF7K+eC7TIjIWKoXYqIZvExmYGlrZ2B414rbeVry5nT53SzKMGSP68GtUVkzFMrT94XsZeUOlxtCPP+5zmhR16TcodKH9WvPIqIeNvp+yUkD0MEFSq3F2EzaEB2xKM+wtSirrytrhotjmhqEEmkkqhZU8uADHbG4EGwrSzBBVjVkRSehWyrFVICWj72vbLaC96G3Y4AlZVDg0kuORmHvvdNeQd3KL5dtclgf4GH+ZECRuPamx22jF5GO8pkGxIMzuc9g0kOuhU90nBejPYNzJMEFeoWJ/SlJna/emv7y7T6hxqJjgOTWRVr2VrKR8ER5EmRoYyeFmlzxXu+JKBCX839gIxx8Xny85wl0tFPXlhBh4KQMZHPVxfwb1iUQdSDdLVf+a13iiPXP82wGYmOeZkfhk1Hyt9+fru6KLQtR6kCJF+JP6oCz2ORtvnhzgUwtqIYcmBMauW/JFDRH39xcxIAwVXdpHtlbIMF9jv2dItICWpZg+wL1PBsy1G311WNyq6ttGhPJYDL+hDSAqfXwcEd58ylDfrsdYU9MTN+VJnWNWAk3TJxN549ptSYW3JNGf+V+WpsIKp2D9Ggp+iVAFHi1gyAKtygb+5ntVNOB9dLG98D78T3lffevtSx+p+1dt4QgtVlDFNRikcS1I3N0GnCK34fYeFs7IpQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(23010399003)(14060799003)(376014)(7416014)(1800799024)(82310400026)(10067099003)(56012099006)(17002099007)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	COXYRe6eeLinRh0x+S6A76WwQUslEV7mud0VdT2dgg9JKr+o8pJBKHdKSkxyltoyuYQI1nhSXyf+EK9h1xqWiYd/s0y1EvFWj+dD0YlU6+AXzmYbNWPPJSr9Ceoum7exEoy2Gv4oTw67qzcJepC+lYDOuuCCxzRqzcC4AXk/hNgerc1dPaQbWxruEfuHWYLKhBWLjWmkRRAofzX/PWcE5tNivaRjmPZLwKKP4Eq3sMZGIcpsyFKGH84J0ZYFXhbHy1greSfBMnRSvlms9xJYUTqzRM4HQYJaD6vI8mJTQW5LyAdzvhsxr53EolWPsnvvTAn6YVskCUFzxsjeiRhEUj9Vn7Ls42ZdgSt+rtwHHBma2zeYfBlxYbeb3c6P/BwhUmMjcQsvlTwQuJocRA9ej7MrZJG9vgbbeaffMwSJW29uW6nF1RERlbaj8zdlEU8V
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:40:26.9487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b987d4-5b5b-4d07-42af-08def1f34505
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5413

Hi Mike!

On 8/3/26 2:30 PM, Mike Rapoport wrote:
>> Change read_file(), write_file(), read_num() and write_num() in vm_util.c
>> to report failures to callers instead of exiting from the helper.
>>
>> Make read_file() return a negative errno on failure instead of 0, so
>> callers can distinguish a successful read from an I/O error. Also make
>> read_num() reject negative and malformed values.
>>
>> Update callers to print diagnostics and fail wherever required. This
>> patch prepares the helpers to be moved to tools/lib/mm without
>> kselftest dependency.
>>
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>>
>> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
>> index 2eab2110ac6a..db0db8a3df7c 100644
>> --- a/tools/testing/selftests/mm/hugepage_settings.c
>> +++ b/tools/testing/selftests/mm/hugepage_settings.c
>> @@ -8,6 +8,7 @@
>>  #include <stdlib.h>
>>  #include <string.h>
>>  #include <unistd.h>
>> +#include <errno.h>
>>  
>>  #include "vm_util.h"
>>  #include "hugepage_settings.h"
>> @@ -61,8 +62,10 @@ int thp_read_string(const char *name, const char * const strings[])
>>  		exit(EXIT_FAILURE);
>>  	}
>>  
>> -	if (!read_file(path, buf, sizeof(buf))) {
>> -		perror(path);
>> +	ret = read_file(path, buf, sizeof(buf));
>> +	if (ret < 0) {
>> +		errno = -ret;
>> +		ksft_perror(path);
> 
> I'm not a fan of changing errno, why can't we use
> 
> 	ksft_print_msg("%s: %s\n", path, strerror(ret));

Ack

> 
>>  		exit(EXIT_FAILURE);
>>  	}
>>  
>> @@ -700,91 +700,139 @@ int unpoison_memory(unsigned long pfn)
>>  
>>  int read_file(const char *path, char *buf, size_t buflen)
>>  {
>> -	int fd;
>> +	int fd, err;
>>  	ssize_t numread;
>>  
>>  	fd = open(path, O_RDONLY);
>>  	if (fd == -1)
>> -		return 0;
>> +		return -errno;
>>  
>>  	numread = read(fd, buf, buflen - 1);
>>  	if (numread < 1) {
>> +		err = numread ? errno : ENODATA;
>>  		close(fd);
>> -		return 0;
>> +		return -err;
>>  	}
>>  
>>  	buf[numread] = '\0';
>>  	close(fd);
>>  
>> -	return (unsigned int) numread;
>> +	return (int)numread;
> 
> Do we really care about how many bytes we read?
> Can't we return 0 for success and -error code for failure?
> 
> Will also make checks for read_file() return value neater.

Yeah, no caller actually uses the number of bytes read. Will make this
change.

> 
>>  }
>>  
>> -unsigned long read_num(const char *path)
>> +int read_num(const char *path, unsigned long *num)
>>  {
>> +	unsigned long val;
>> +	int ret;
>>  	char buf[21];
>> +	char *end;
>>  
>> -	if (read_file(path, buf, sizeof(buf)) < 0)
>> -		ksft_exit_fail_perror("read_file()");
>> +	if (!num)
>> +		return -EINVAL;
>>  
>> -	return strtoul(buf, NULL, 10);
>> +	ret = read_file(path, buf, sizeof(buf));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	errno = 0;
>> +	val = strtoul(buf, &end, 10);
>> +	if (errno)
>> +		return -errno;
>> +
>> +	if (end == buf || buf[0] == '-')
>> +		return -EINVAL;
> 
> We can check the sign right after read_file() and skip errno dance
> around strtoul().

Yes, we can check the sign after read_file(), but still we would have to
check errno after strtoul() to see if an unsigned long overflow happened.

