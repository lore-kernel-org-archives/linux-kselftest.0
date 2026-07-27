Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78A1E5201;
	Mon, 27 Jul 2026 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144136; cv=fail; b=t4zTGYxvDNFGiwwdBlRjOzopL0RBRnOWpCnKAislYqK068jTkyQJvQ+y+ONwAva1yU8WQceO/5kJ5UoCr9FXcOUkmWpJ4jiHIuoOPP+LhICanXW/9TLSmlq43afID7TZxJIJ6+oX4L1P2VZi2rD7tX32+O77FeDkAePhwEvO2nU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144136; c=relaxed/simple;
	bh=gYPyIO0gqtXcMURW4X2o5W4oRsdDnUHgMfA6isy+n6o=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RnGjJvISQ8N1lGDDgkjqLAE6y48ZZmUV44Ph8oyPr0wf7kIEs+FKLC6QzUKCa7xGdf3N9cGvzYJcKDBk4GfLSbnGUtxfqq6tH8iTfhaB4CrEwvNfEJVkDJrab1yqLsVoId/U4KMcZRpJZIHDVLpv0SkfJbF0Dg0q9oiT1/GIXVY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IDbBi2EG; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IDbBi2EG; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IDbBi2EG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IDbBi2EG"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hD6aCbHlywjoDyn0EoSQMYBljMarSLN4uSIVoCY4BdEZBIkovcfTUmOeF3xr0PRa8u7rF8rQSMGcGW+qKzUCl1+OLli6SzUZZxpIB4tx3JxXPUipLfCVnv/uNIbwWsnE94pFHWDZvf+CKjZxx0HG+jY9A+KABreTbHxXcFAhn7eZUqqYjyUP3mC219OkQA/Ku+PCSM8alq0FTyMrYjatxJnFGybSIXBPOOCBBkHhJLNGfVJ9oc7Syby6CXvCSDp+V1xrTD9eAZ9FcnG5ip4QuxqQY4ixI7R7TGqtLPMMl7IUPD7szso5Rj5oIJA/evYe7glkrA6Q0ramDKRGeXoUmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Voa+sWq8kVJ+bPMP5AKFdeQle8AeqGSzU5/PyWhzmLc=;
 b=y9V+J8eOH7l1t8ZxCwajZPb+9pIofmR2FQmbC8JQv+mU0pQaGRLcU3a6EZWxCEV+nhzhNEr1cOfayy8lsVWbhkjUJKFTtXnyKpMohfjqKTqdMql7kGQiifUumUAI/aXVhKyGggmEJK87fbCM1GkHXKO6NybzP+nrq0D10psT3KUEXaPy4psqR4puGwq26w/8mzYi9zBgWqaad1V34D1y3FRY7QfImSOWr193fgt9riIXYd3akB2+NRHptEjMcdhp4MEsr9Ctf9P71SZTeq9KmnVV7XdCoPnfOuXmndT7iYOE8j8RdnXBETJQ9K83+GX7D9Ef702kpmsLj8vvKwzQbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=huawei.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Voa+sWq8kVJ+bPMP5AKFdeQle8AeqGSzU5/PyWhzmLc=;
 b=IDbBi2EGjG3JEjP/DbyUTiy6z3a+LQzqvDe/aT9nYRPnOD8/yEZdL+cEP7DdnYsVYrjexnjEtEVHsjytpDgN7pXPnPP3z8q0MyzE5x/GUd2fG4jMd+3RX40+yf9YIK5aJjcI20T3epMw0Aryxoe00jNo+3p3DpanfFf9Py/nYmU=
Received: from AS4P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::20)
 by GV2PR08MB9421.eurprd08.prod.outlook.com (2603:10a6:150:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:22:07 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::5f) by AS4P191CA0028.outlook.office365.com
 (2603:10a6:20b:5d9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 09:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 09:22:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MS//qpvEXFcBxBC+BGE1+qu+N4ckXdHf/yQHM8BSwCQPXvx+KG7s47MEuXjrxxLNaqDry0AnQzglVMd4U1DhKrZ5BzFOEaovyWVdECEaAmZygD2L+94IPhV/7XIiTQeYaWEqTKqtYosdXg/L+2VaCz5ge0aK26lvLy2brArtXIPuD82znVn7sH7ZvPscKyvx7ivcICGYZ5ubcmKeFrlEv8rPiklIkyxgHsPSozQ0r1Ua84PSMDcXl/18YyoeW+F+7bYSzGGZ2w080wMqpdEkok7m0m3fc1QgO7IzC4pfei1KSd11B0rHV8EdK3U0VpIfhgVMrLTjL+0lYg1x0tL4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Voa+sWq8kVJ+bPMP5AKFdeQle8AeqGSzU5/PyWhzmLc=;
 b=deBI4zeK4E3sCutiIUnhUTH7dzIs7gJWvF2slAIx3DCxRHgWp73VGSRBL9mJEp+7l8wNfiJ94U2SsJb+QLeIS8V5WT9Uaz/DrQB7T4Eu7oiO3Z2uPhoFhSEVfNb6GmamKDg3V6f8n/Si6qYk9AlHgXCtTUNpXUFQQO7n0fsDSIs0DD0gSerlVtOHJ2CBByWQT93ViiqfkfsZ2SNShReWTMbrPSHEmcyobserwEOuTiIdkLi2WR+Av/xeQ3KI6BhI5yoEU80AQuX474vIwubxTPJ334l14VtusMEx6jfP+m38udcTiS7HwJY0UjD3dbGGAZtZThkRkbcd01jp1jyYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Voa+sWq8kVJ+bPMP5AKFdeQle8AeqGSzU5/PyWhzmLc=;
 b=IDbBi2EGjG3JEjP/DbyUTiy6z3a+LQzqvDe/aT9nYRPnOD8/yEZdL+cEP7DdnYsVYrjexnjEtEVHsjytpDgN7pXPnPP3z8q0MyzE5x/GUd2fG4jMd+3RX40+yf9YIK5aJjcI20T3epMw0Aryxoe00jNo+3p3DpanfFf9Py/nYmU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by DBBPR08MB10481.eurprd08.prod.outlook.com (2603:10a6:10:539::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:21:02 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:21:02 +0000
Message-ID: <0ec4de92-5ddc-482b-98e4-9a26f9a6e622@arm.com>
Date: Mon, 27 Jul 2026 10:21:00 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 sarthak.sharma@arm.com
Subject: Re: [PATCH v2 4/5] selftests/mm: skip hard dirty page-cache test on
 NFS
To: Miaohe Lin <linmiaohe@huawei.com>
References: <20260724102431.1199519-1-usama.anjum@arm.com>
 <20260724102431.1199519-5-usama.anjum@arm.com>
 <57c6bec2-3135-35ab-46c7-b1ab041393c9@huawei.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <57c6bec2-3135-35ab-46c7-b1ab041393c9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|DBBPR08MB10481:EE_|AM3PEPF0000A78E:EE_|GV2PR08MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df9832d-4bea-4b3f-a8e3-08deebc0863c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 c26z0XKLRXuxP76/13PG4VFctFExHU9d10TQHmmDRVyIvwFqA9mg9m0i7xlDzRptP49laTCDj/lOXMSVSInjqxZjiSNucm6Ms9XbcSKzs2UkDdmJKuc8lHIyRlaWzlw6mdI9qkgiVgEJMHr9Sb2Vo4U6tp//G1lrK8X5yWkV0YG6h9hipeYby/oulh7kdyHftS01AxFxb8KQrTZC8nnFo5LMIm/R22QPh5R4N0FHxPRDfieUcq8KYlvw/pkvzKAO+x8t575qEfJEJokQzkG0jJXNWbupjhWZfkWLpna8KS2XAXi1l2nZlGKSlEg/3kIh6XZ7DHnnkWxEhBjB2GrGdOeQdBysY+3V6Ch7mWy7RkM1tclL/d2TICsr9MLQ0dGEl4JnvRXm1yjDjFe1QVOeLQootyhLvYUVg3ynLYU5ULxzSvJbT6t74PNGJ5iYnJf57IKCL0aYe7t6F7mVcCN+SvNdA+XanH5zY5p+IvlUJsDwFc6Omd9kLT1zEyaXE4hgoDyyxyfvdP2VjJ6k6oNL4FPTTZFeo40NGpeo2segHKYpsuNCZToX8rC+krR/4Y/Wy3rPkQgw1AjMtyXxlCvIulybe5bHXIRWMJNzTF8YpsH+8HuOUQmb4DtnybkR5ftl447uN4Bvnl+xYqpWGQfwgKgCxXgo0tmAilyEec+8kL4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 W/S71b0MVlWDjryFJtfWxCsED3YZXVGK1o4KNt711y06PiIt9F2lCRL6PzsYhPb2zSX9ZpDMVoSxPWDRTJUDICrvOAJyZAuLHY9xA/VH8JOiXrhJ0/QzEAWJbV2A60gAHeOoLsJdST2PkGjov8XoA1FRqYYC9dX8Blafo6b+v3NSUGOyNdAr26ducysqj5DZlvxAwlFqZbeokrXV9hRv9juhjidRGRkYACNqEVzVTue3SUH8vv23k/aESNCPexT/geTZG9sJYoYKg0WyqGBf6gfaAY+JpyKGpKIv/fCsL/MPClhXG+hGdZY4t1JfbQ/7IY1jv8kKOg3CrrocKGyaGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10481
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3fd616ed-0bb7-4a11-3365-08deebc06081
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|14060799003|35042699022|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DjwuI9Sog1jnMyVekKdl6w+nqa5p+mSA+7ob8CERVgsGY/0g0lMy5HRnKJeHGJ9bS8P2XAaRoB50yBo2FhQwP0kRI3DGRAzHybVBQ9d44A6zcR6R0oy3xx/x+qYE5TX/gr2fMW9igpautfTF2+1MJrkfEab19TaYouFjFV7YdE44phantxP9szxaoQtCyJP48a7yOs5hX2cCCdUEFQjxVu9aKrsG5m6t0t7sguzctuyPI1L+wY5D1SpFW+j7SmV0YFnRRoe18nyNGX0BF+Vk22Ir3u7xaVelI9c2JS8KgRH5gEghGF5v48NA1+HesAhF3bYGe+lpWelQkNgLBbax72VP3aLl41FmHocedHbhrcLPP1q5f5Z7A0bvB/48qJAKLUKM5mBpVyL1WHU8zyMgwTg56bmaR7byVls9Kfi7+M3hE0j6Bx2ytRA8cNMLeSKj8vHuW4gDkpaB5hvVSoGE+I3w69EjvYNbmvT9RbD5T3mTrilWOC5op1jkGTh1+dN8iXtZcj6MZAEFG1SoTKKShOtt/Uv0Doj4lvK68+u3z44CVdRQkaP+vFpQSlQAC7ir27M/n54/FcTx6sD1KyWgoy6r6ppLiuBoTYXlpmBiO8tVtm5d7z/tGVQt0qzGV7q7bYo8LTOJLI2ksW67gPOJPXRErHwTkX9MBfqHYmUAuvJxT/QbgJkNf1r0VqeuvExzCNwqt0ErmXf1JtUfmxCaCA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(14060799003)(35042699022)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L+zz4/JRidsU8dGY+nVRMIFPiFN+RU6np8+yZ/la7AW7SdZ+INL4ZMk79/Ydd8lEFC1pMgs6riFj7bywLFoulVRqR/ijKnvxLrUkEXeH2ng+qErioF/6fsZweghuAg+EZmrZsBa+E6bjxAXmKBzbSrXEFoWwIFk+o1PmRXDftngd3ckcPzeW0+oS3DqSY4iaQq0HiPnQSJJnBDPS5GZbyTz64HdQA26vzJgtMjKVGy1DIH6RGH81zML05vqj/FYccizBx5XQjW38SuoaNwHHqgYN4QmDDJccgX1pXHO0i2e8NaW55hXNQZjruUTaql/FCkbhs6WxuJwJaNPHSraeSlh13kMKcRmyb+lzvDYePjG0DvLzUe3PQgMwr6JPJiYB74QUbY46u0h71u7jlRSykk6oTksoBfjpHlbmfAkOxvzRC7ed/hw7Rknj4ArJCACo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:22:05.0623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df9832d-4bea-4b3f-a8e3-08deebc0863c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9421

On 25/07/2026 3:10 am, Miaohe Lin wrote:
> On 2026/7/24 18:24, Muhammad Usama Anjum wrote:
>> The hard dirty_pagecache variant uses MADV_HWPOISON to exercise recovery
>> of a dirty file-backed page. The recovery path records -EIO in the
>> address_space mapping, which NFS later reports when the test closes the
>> file. This makes the test fail after the hwpoison checks have completed.
>>
>> Skip this variant when the test file is on NFS. Keep the hard clean-page
>> and both soft-offline variants enabled because they use folio removal,
>> invalidation, or migration rather than recording a delayed writeback
>> error.
>>
>> The unsupported-filesystem path in clean_pagecache() also returns
>> without closing the opened test file. Close the descriptor before
>> skipping there and in dirty_pagecache().
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>> ---
>> Changes since v1:
>> - Limit the NFS skip to the hard dirty-page variant.
>> ---
>>  tools/testing/selftests/mm/memory-failure.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
>> index 032ed952057c6..3c72084f57e8b 100644
>> --- a/tools/testing/selftests/mm/memory-failure.c
>> +++ b/tools/testing/selftests/mm/memory-failure.c
>> @@ -283,8 +283,10 @@ TEST_F(memory_failure, clean_pagecache)
>>  	if (fd < 0)
>>  		SKIP(return, "failed to open test file.\n");
>>  	fs_type = get_fs_type(fd);
>> -	if (!fs_type || fs_type == TMPFS_MAGIC)
>> +	if (!fs_type || fs_type == TMPFS_MAGIC) {
>> +		close(fd);
>>  		SKIP(return, "unsupported filesystem :%x\n", fs_type);
>> +	}
>>  
>>  	addr = mmap(0, self->page_size, PROT_READ | PROT_WRITE,
>>  		    MAP_SHARED, fd, 0);
>> @@ -325,8 +327,11 @@ TEST_F(memory_failure, dirty_pagecache)
>>  	if (fd < 0)
>>  		SKIP(return, "failed to open test file.\n");
>>  	fs_type = get_fs_type(fd);
>> -	if (!fs_type || fs_type == TMPFS_MAGIC)
>> +	if (!fs_type || fs_type == TMPFS_MAGIC ||
>> +	    (fs_type == NFS_SUPER_MAGIC && variant->type == MADV_HARD)) {
> 
> It would be helpful if we add some comments here.
> 
> Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Thanks for reviewing. Sure, I'll add a comment.

-- 
Thanks,
Usama

