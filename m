Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218EC3C9EDD;
	Tue,  4 Aug 2026 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.68
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828905; cv=fail; b=T9sz6PcLOnYyWpej6t85sv9SSWxl8+64pruUj2JI+FjNm6gURofpKnpiM3bDLndycZFtZQEAexSo3bhKd1baBnUZsoBOZn+YfnG/0mjuT7Przcr8xBv1bE7WDkCzzunqT+DswdmrY+0ZvFVHkA85B4Xy9FYtXvO3N2NzRG8hgco=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828905; c=relaxed/simple;
	bh=rlD/rGYSvrdLDCORbJM1BHxZbF8gQaoYp0hPAn6YGKM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PZJSVjhG87u0uL8h4AWcGbyX2zITlsuL8YBXue6xaAhN9/G4jitYx7r5eCN4IcOST9HPODRYu6775GRBNigLr5+bFKVwuVH7kTc8pa8qE4mQW8mUTPsK/me9op38IVHapF1DGm8MUXtzHReFR9EM+Hf9fhnx4V3D6SRaSeFBkiQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rgebTPJP; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rgebTPJP; arc=fail smtp.client-ip=40.107.162.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rgebTPJP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rgebTPJP"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jkv97dE2/W2vUcnLUvu96Yo1Zj0nV/rJgmDCPl4eVx0c6aFc7FdJ9v3BLXHSifWE3inbqC62a4cXvkRlM6J8DOnI0zGBthT7l1g/lfmBru6uLzo7IUCdFYP3DA1Z8Etp7qEOgF5Wbq4qbFpEgplIa/s1Af+PIiSfEY9guotuHKZV/dD/vZeIgexpO5cMp1JfP49thoN8l2y4pD5FHyZ5G2ov/+36WXbks9/HhHYPFr2/eSnLI2TPcYoTQLsNR1Ni5sQFTv3NIxHDyVYVUm42IKJRPznmghTzG/Y6vErPUrFQo7ZH5zidfVfniKd+hLlht19XX9IVj/JdpGPmiqJ3AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP/bXmS2Er4GMTfxS3803zPwsgwTvcuWhWZo+UEtWlE=;
 b=sqA4vO5Md/FniRV0lJLqt+vZL4a+Mvr6aeeP0QrpB452Jkwh6q5fQxkNO+nm8/yuKtI79HWF+YVOreSrBLbwexmo6sVUrXXEMe7s5lJxah0ykMtiajh7HCech/5WKOSmoTFb3jsnDbSZMmNBWWOiDDXRLd34B0PnpbmCBDt+KmruPshY09BtN34Mmo6ME3lui/JisIksyTMdT2Uy7e5LHg4xdNWaY9HbNbyyJ1MR4WnDzSizVQyWxtqcuymG5eW1uV0SRCShydzEFYWareENWHxvWsrWya+s4OeeSN65a3JPBgA8e1H4IJJaw5+M6+sFh+E6fDy5gemZVbaGgsExpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP/bXmS2Er4GMTfxS3803zPwsgwTvcuWhWZo+UEtWlE=;
 b=rgebTPJP1uxnzcqKsgvKamNuLujismOXRRwhDkvUWoYmA94v4SPXQiX86oMEh0UvZQCaVfERJd4IjL31LOzymYUhEEfJ50GPavoICeDbsy5dsplrkQb5O2lo2x/Dw9ObRbkwW/at8WWs3V4OvVGGmBE5fatVtsfEthnWB61vLYU=
Received: from AM8P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::30)
 by FRZPR08MB11098.eurprd08.prod.outlook.com (2603:10a6:d10:13e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 07:34:56 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::84) by AM8P191CA0025.outlook.office365.com
 (2603:10a6:20b:21a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 07:34:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 07:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPEdzgGt1jcWf3gcjtiZrGuo9vMNxxmLLjZN7p3POV5Z0p3zagdWRX8UyBBMfFVx1s6e5UJlL+BVteXpNR+Si8vu/znMWYhqQ1QcOlQFgIBZqwMAzae7F4OhBZOJDHWTSmVYG4xhTO285pha6Q2AxtpHBf6XBGNGjX4x3GVnfRmo0MVRzYhauxTYsb9OXMESVo54N6TdN6NQcmWPpjePrP2RT1mpJumF9u2NGzob6JWmIwL7N3qDsOelSf3LiB4VqBCbuAB21CR1S/w76vfcasPvhth8XFtXWw0HnGmQnfD+sYzhq2M9nyfmieKQnQUHa3WQ+QZGTUtiICo5hv+Vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP/bXmS2Er4GMTfxS3803zPwsgwTvcuWhWZo+UEtWlE=;
 b=bB5tnVJfZnC75K1RNLQCA1SjK+I1PMjWkHCYbxYeTtX2EUrhg9j+TWKojnIr4aEvCVm1R1qf3phRBuaaFAupK9DSeSR97PJdMegeQmj8LuKWNiNRttAHqIwb7JHr+u8rSn6uAWgT9LItEY82ejwKefMK22Dh9J5YpXlz/4wWnEbm9QD8yx4l7Q1ZSDGPlGoQvrIHoEbS/7e7vpY/iqaauyAZ7tbGcf/nQ0nTDrU847AeTtcJ7UwaezyZf6Okp75d2MBI6+ZU9p77WZ2XqjX70vLKJcsi2FLHYyzQVjpinRWVAFiaIscF6F/BwESs9frSY+PR1/fK4UuS+Q6Hyq9iwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP/bXmS2Er4GMTfxS3803zPwsgwTvcuWhWZo+UEtWlE=;
 b=rgebTPJP1uxnzcqKsgvKamNuLujismOXRRwhDkvUWoYmA94v4SPXQiX86oMEh0UvZQCaVfERJd4IjL31LOzymYUhEEfJ50GPavoICeDbsy5dsplrkQb5O2lo2x/Dw9ObRbkwW/at8WWs3V4OvVGGmBE5fatVtsfEthnWB61vLYU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DBBPR08MB6282.eurprd08.prod.outlook.com (2603:10a6:10:20c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 07:34:23 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 07:34:23 +0000
Message-ID: <53e2202d-15df-4788-a6aa-1f345f0a5395@arm.com>
Date: Tue, 4 Aug 2026 13:04:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] tools/mm: make gup_bench a benchmark only tool
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
 <20260730140825.238130-6-sarthak.sharma@arm.com>
 <178574760162.1561566.7432721858074092727.b4-review@b4>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <178574760162.1561566.7432721858074092727.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0088.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::9) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DBBPR08MB6282:EE_|AMS1EPF00000091:EE_|FRZPR08MB11098:EE_
X-MS-Office365-Filtering-Correlation-Id: 500cd016-fcaf-4bfd-9fca-08def1fae1e0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|5023799004|11063799006|56012099006|4143699003|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 nIwdpszMURoSFHsfnSx8A0M5yYGo8vEZ6nZRTillkqJgE7oDZMAaOtax0N+euxY72kvrQPjtjU3WZaNYu/GmYfAJX7FLnlEKy14IuxWokLv7jJDtXRSG0HCihDowyZrgH1azB1kyCTNFZJ5TSbtINDQxzoDnBEUCdqRn5j5DLx7KAETsnOL/McWFRxN8s/BQ1fIk68oJwlNXtqGnjazHZ1NnewrmadoDcC35hAqraXrlVKlFpvMLSBs6/7z6LR2krcOFoDSsTaTGyzuQOe9KqHo4aZtvdpLcalOnUlwRjKMdeSdyp14ycQfKENZcKjsEPAgArfrxOuj7xHMEwM2+RzV6gyRq3GSN4Uxcu1wsXqUfcWXVAU+X80TAKJxTtqdOle7/fE+v9YdYm/mzH3qw5qdVasl9brs2qQyYOfziFXc19b2YNe1EcSC7/g13wRIOoBasksz9pDL5U6rxGthR9VTttygzMiKJhTvj2KFpsqtTxuuXfFJyxGizJwENIFz04e9itp5W0o3JTKpcSNlZQjW5k8IDAiFagIDsSsy/bg9d079UBZDm5F+Yzq0w/rW2s0EsTj5GvIYN3pf5NojuD+fM6yyn00k7aghKbtFdq/T0XQRwQa2P376AhoLpLJ/vqQkvBeSPXmV58A1HKoxjiE4B/ZIJ5E/gUMq0N8w2dzc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 oIXhhAjvk3Qw12VMcz1yZKHZyAAkKCKTPPxU8JHzzWbqktg171OXsUaE91Id3ivP1JN2Jk1p3+qjwwwu0xFH+lQyXGLeme/kY88BnDv3vb1cJ71H56m04pRUz6/mnLFcgKDQiMe+q+3p335HuKmZcfUXWmiDk6b//j3/zIYgdSWPogMt/pI5es1Lrr+lw22IbPO6nvdlBmr3NCyBycsYT2h2nBLAqElp6eE+wUjD8u8INsaThS17IdRnsAeJ7YmUV4W6enlAVok2GaDuXaEUmwVgtCgxUp2zroUEfzT2EHK5HW3Wg2EhRcgdMCSpghMurrMFAjMqlFUwYO7slkwOug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6282
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	632d14b1-3064-4e83-38c0-08def1facda3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|14060799003|376014|35042699022|7416014|1800799024|6133799003|56012099006|5023799004|11063799006|10067099003|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w5bvQpa7Te3Y8fuIqgKC+Uh8e4w8iLSEPc6IQ7/w6qrrz/cpGj0zPmYcVSUqHz33lUde/mPlnBqx6Fn0s13kZ2d9zfGyS9pRCLTq6U+mnradzXpOVigKTP3BULEfwzJHKAvajV3Y5Hp2AviEJOXeihRKcy7j3VRLcY+tQWu305IwhzXnjLAYxsrugMRDT8m4lhc2JMjXKulDWQsZ9u2l3+LzvGfrK84yrwECKQdEMi3cadW6kckdmwsZ3aneJ/bYg0HkoJ5wxVLJVFNfUWHoXRjQoxCzfbeXKCDDpT638FAtjm0bZKqIKRDU0rSdbDQzJ7B99Q5Eqj5pVabWZgTN90cLRIIZoZEonHONs80oQ2r0arqbB2j5lsFq/o0c/Ihs1QLbb4OXObOhkBrjethiLaIjpLJTZDYV7yl4L7TEoHwVtvknVSIKaHos8yubxbfPaR60Tbykr3wVctWWjMXUhZhy57BIcR3VZvShA531DSq8fmXa/ESK+MtefYE0kFNUClo6yLtHWhFXdB/kVURGzz0+dnYHabF7nNUJnFuHtPSBNSg3mvaDRwB3r09sJfWK4lWFc/xfN9phXLD8HajWQHCV0RNwqXogijbLDVfSqKQrUHfYBPF4nSn4GqHa/Lf29xVB1UICuAU96DsXENr66o58zphuR5HydVTPCAgBBCQSyKzY8TF94ia7t7aommtJ0dtTSFnBrzlxNJ87QhGPPQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(14060799003)(376014)(35042699022)(7416014)(1800799024)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+YIetKECnJXxjx8rrauvjuOtdXr93CZpXkSZaDKJ3OXlSZsG2uhY08V3soJwffIZCfw8fRcBOqRiIxv24qa24TgI4w3Vy+rejJor0SYnfo5dkk7Vq66aIn1rxySO+0aZaOJoV1XdKuxT6ONEhDoSP+KMwhyHKBi2D6sMJ65EoEYxYPoWGpW/+93rzQTVJMULS5mCJFxZVkAfmtFIv2BebNENVy3PaIHxiPnKZkau7Cn+AcMV8WdlVzDYLAU7dZvDYxjW12XzJqfnrbYi2rHFwgmF+rtrA6pO7O8xP6VFJ3uDBTTEB07nH+irnZKftNJiLv6r4Ifcip5bmrWMxqYJ0OinsymOUGYFmxVcIJ2j1jYFQovsg4/eMxWRSHuOyPNBHjm+ICDezaIZ7uiuLxdqeEIGEVgSASatVSndhtYICZWn7AKz3UuIkdDDkltP4KPO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 07:34:56.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 500cd016-fcaf-4bfd-9fca-08def1fae1e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11098

Hi Mike!

On 8/3/26 2:30 PM, Mike Rapoport wrote:
>> Remove the functional modes (GUP_BASIC_TEST, PIN_BASIC_TEST and
>> DUMP_USER_PAGES_TEST) from gup_bench. Drop kselftest dependency
>> and use normal diagnostics and exit statuses.
>>
>> When no arguments are supplied, run a single GUP_FAST_BENCHMARK
>> with existing default values. Let users select other configs
>> through command line options. Also validate numeric arguments
>> and reject positional arguments.
>>
>> Restore hugeTLB settings on failure and after every run. Also
>> handle failures without relying on assert() calls.
>>
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> 
> ...
> 
>>  int main(int argc, char **argv)
>>  {
>>  	struct gup_test gup = { 0 };
>> -	int filed, i, opt, nr_pages = 1, thp = -1, write = 1, nthreads = 1, ret;
>> +	int filed, i, opt, nr_pages = 1, thp = -1, write = 1;
>> +	int nthreads = 1, ret, started_threads = 0;
>>  	int flags = MAP_PRIVATE;
>> -	char *file = "/dev/zero";
>> -	bool hugetlb = false;
>> +	const char *file = "/dev/zero";
>> +	bool hugetlb = false, restore_hugetlb = false;
>> +	unsigned long nr_pages_per_call;
>>  	pthread_t *tid;
>>  	char *p;
>>  
>> -	while ((opt = getopt(argc, argv, "m:r:n:F:f:abcj:tTLUuwWSHpz")) != -1) {
>> +	while ((opt = getopt(argc, argv, "m:r:n:F:f:aj:tTLuwWSH")) != -1) {
>>  		switch (opt) {
>>  		case 'a':
>>  			cmd = PIN_FAST_BENCHMARK;
>>  			break;
>> -		case 'b':
>> -			cmd = PIN_BASIC_TEST;
>> -			break;
>>  		case 'L':
>>  			cmd = PIN_LONGTERM_BENCHMARK;
>>  			break;
>> -		case 'c':
>> -			cmd = DUMP_USER_PAGES_TEST;
>> -			/*
>> -			 * Dump page 0 (index 1). May be overridden later, by
>> -			 * user's non-option arguments.
>> -			 *
>> -			 * .which_pages is zero-based, so that zero can mean "do
>> -			 * nothing".
>> -			 */
>> -			gup.which_pages[0] = 1;
>> -			break;
>> -		case 'p':
>> -			/* works only with DUMP_USER_PAGES_TEST */
>> -			gup.test_flags |= GUP_TEST_FLAG_DUMP_PAGES_USE_PIN;
>> -			break;
>> -		case 'F':
>> -			/* strtol, so you can pass flags in hex form */
>> -			gup.gup_flags = strtol(optarg, 0, 0);
>> +		case 'F': {
>> +			long val;
>> +
>> +			val = parse_long_arg_base(optarg, "GUP flags", 0);
>> +			if (val < 0 || val > UINT_MAX) {
>> +				fprintf(stderr, "Invalid GUP flags '%s'\n", optarg);
>> +				exit(1);
>> +			}
>> +
>> +			gup.gup_flags = val;
>>  			break;
>> -		case 'j':
>> -			nthreads = atoi(optarg);
>> +		}
>> +		case 'j': {
>> +			long val;
>> +
>> +			val = parse_positive_long_arg(optarg, "thread count");
>> +			if (val > INT_MAX ||
>> +			    (size_t)val > SIZE_MAX / sizeof(pthread_t)) {
>> +				fprintf(stderr, "Invalid thread count '%s'\n", optarg);
>> +				exit(1);
>> +			}
>> +			nthreads = val;
>>  			break;
>> +		}
>>  		case 'm':
>> -			size = atoi(optarg) * MB;
>> +			size = parse_positive_long_arg(optarg, "size");
>> +			if (size > ULONG_MAX / MB) {
>> +				fprintf(stderr, "Invalid size '%s'\n", optarg);
>> +				exit(1);
>> +			}
>> +			size *= MB;
>>  			break;
>> -		case 'r':
>> -			repeats = atoi(optarg);
>> +		case 'r': {
>> +			long val;
>> +
>> +			val = parse_positive_long_arg(optarg, "repeat count");
>> +			if (val > INT_MAX) {
>> +				fprintf(stderr, "Invalid repeat count '%s'\n", optarg);
>> +				exit(1);
>> +			}
>> +			repeats = val;
>>  			break;
>> -		case 'n':
>> -			nr_pages = atoi(optarg);
>> -			if (nr_pages < 0)
>> -				nr_pages = size / getpagesize();
>> +		}
>> +		case 'n': {
>> +			long val;
>> +
>> +			val = parse_long_arg(optarg, "page count");
> 
> It's better to name the numbers parsing after what they do:
> parse_flags() and parse_num().

Ack

> 
>> +			if (val != -1 && (val < 1 || val > INT_MAX)) {
>  
> And the limit checks seem wierd all over the place, like if we can loop
> infinitely, why do we care about INT_MAX?

INT_MAX checks are there since nr_pages, nthreads and repeats are stored
as int.

But yes I can keep the parameters which are not there in the ioctl ABI
to be unsigned long, so these checks won't be required there.

> 
> And what exact limit ULONG_MAX / MB or SIZE_MAX / sizeof(ptread_t) are
> supposed to express?

ULONG_MAX / MB prevents size *= MB from overflowing. SIZE_MAX /
sizeof(ptread_t) prevents thread array allocation size from overflowing.
> 
>> +				fprintf(stderr, "Invalid page count '%s'\n", optarg);
>> +				exit(1);
>> +			}
>> +			nr_pages = val;
>>  			break;
> 
> ...
> 
>>  	if (hugetlb) {
>>  		unsigned long hp_size = default_huge_page_size();
>>  
>> -		if (!hp_size)
>> -			ksft_exit_skip("HugeTLB is unavailable\n");
>> +		if (!hp_size) {
>> +			fprintf(stderr, "Could not determine huge page size\n");
>> +			return 1;
>> +		}
>> +
>> +		if (size > ULONG_MAX - (hp_size - 1)) {
>> +			fprintf(stderr, "HugeTLB mapping size is too large\n");
>> +			return 1;
>> +		}
>>  
>>  		size = (size + hp_size - 1) & ~(hp_size - 1);
>> -		if (!hugetlb_setup_default(size / hp_size))
>> -			ksft_exit_skip("Not enough huge pages\n");
>> +		if (!hugetlb_setup_default(size / hp_size)) {
>> +			fprintf(stderr, "Not enough huge pages\n");
>> +			hugetlb_restore_settings();
> 
> you don't need to explicitly call hugetlb_restore_settings(),
> _setup_defaults() sets up automatic restore on exit.

Ack

> 
>> +			return 1;
>> +		}
>> +		restore_hugetlb = true;
>>  	}
> 
> ...
> 
>>  	gup_fd = open(GUP_TEST_FILE, O_RDWR);
>>  	if (gup_fd == -1) {
>> -		switch (errno) {
>> -		case EACCES:
>> -			if (getuid())
>> -				ksft_print_msg("Please run this test as root\n");
>> -			break;
>> -		case ENOENT:
>> -			if (opendir("/sys/kernel/debug") == NULL)
>> -				ksft_print_msg("mount debugfs at /sys/kernel/debug\n");
>> -			ksft_print_msg("check if CONFIG_GUP_TEST is enabled in kernel config\n");
>> -			break;
>> -		default:
>> -			ksft_print_msg("failed to open %s: %s\n", GUP_TEST_FILE, strerror(errno));
>> -			break;
>> -		}
>> -		ksft_test_result_skip("Please run this test as root\n");
>> -		ksft_exit_pass();
>> +		int err = errno;
>> +
>> +		close(filed);
>> +		if (err == EACCES)
> 
> What was wrong with switch (errno) ?
> 
>> +			fprintf(stderr, "Please run as root\n");>
> Please add root check upfront and skip EACCES here

Ack

> 
>> +		else if (err == ENOENT) {
>> +			DIR *debugfs = opendir("/sys/kernel/debug");
>> +
>> +			if (!debugfs)
>> +				fprintf(stderr, "Mount debugfs at /sys/kernel/debug\n");
> 
> Just replace the prints, no need to refactor the logic there.

Okay

> 
>> +			else {
>> +				closedir(debugfs);
>> +				fprintf(stderr, "Check CONFIG_GUP_TEST in kernel config\n");
>> +			}
>> +		} else
>> +			fprintf(stderr, "Failed to open %s: %s\n", GUP_TEST_FILE,
>> +				strerror(err));
>> +		if (restore_hugetlb)
>> +			hugetlb_restore_settings();
>> +		return 1;
>>  	}
>>  
>>  	p = mmap(NULL, size, PROT_READ | PROT_WRITE, flags, filed, 0);
>> -	if (p == MAP_FAILED)
>> -		ksft_exit_fail_msg("mmap: %s\n", strerror(errno));
>> +	if (p == MAP_FAILED) {
>> +		fprintf(stderr, "mmap: %s\n", strerror(errno));
>> +		close(filed);
>> +		close(gup_fd);
>> +
>> +		if (restore_hugetlb)
>> +			hugetlb_restore_settings();
> 
> Use goto err_do_cleanup here and everywhere else. Piling cleanups in 
> if (something_failed) is error prone and unmaintainable.

Ack

> 
>> +		return 1;
>> +	}
>> +	close(filed);
>>  	gup.addr = (unsigned long)p;
>>  
>>  	if (thp == 1)
>   
> ...
> 
>>  	free(tid);
>> +	munmap((void *)gup.addr, size);
>> +	close(gup_fd);
>> +	if (restore_hugetlb)
>> +		hugetlb_restore_settings();
>>  
>> -	ksft_exit_pass();
>> +	return bench_error ? 1 : 0;
> 
> Using goto for cleanup gives you clean return 1 on error and return 0 on
> success.

