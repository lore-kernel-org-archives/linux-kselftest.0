Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688048989D;
	Tue,  4 Aug 2026 06:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825452; cv=fail; b=HVOQ7eyxyCOOEOyxbSO2WoHS9Dwts9v//2Oc88/Uu4hRx2l0TmymHqEDrSh+NYp8JrW6+zk993UiJ8iYiTIRY7ZMoiYzppjS1XzErsGGgybh1ZzG0mi4+313glbIXAOIWlBdXZPpkABabR+nfOQyZuZLCi/tJi1GNYcagk7rfeY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825452; c=relaxed/simple;
	bh=SkwbkZ4SwE0WLaa+IH+R42ftrruBcykzPLjHe0hZUIE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gw4GnuHDXBhXW5pgPurAu5kHBF53zLjnC3612wtOFGzvmo/+msrFAEBT/QPzdOxapf3L0uFU8T3063GR311vwyIg70L8GP9k3h6iKh05gMtLNSDn6lp5m2nYwj4BwHUtNuUxvq4XeNZKcHu8NjWoZprLksvbMaVX+3+pU75oO/s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rNR1VlSb; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rNR1VlSb; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rNR1VlSb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rNR1VlSb"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GAOMtnmMghF34VHDfFIMWAiIgXPd0XM5RYgiXJoV9g0BIkfavFeVBf6+mQqG6EimtKkVVcGsMqkiUBkocVZSVU4tRwWwg/p2o9aTvMTpofKSvWDS8bOXtTm+WqHW1zapCSY1deTO8ApJhi8uw0/WHiKgdhnVx+jW44rUHCPRZdsSJVgNWtcLOI3IdqkKOlJghVf+RRwuPVULfajMdaDmW5PZLJeMLTCz0dq738frchFhpJ+HfqKaGRMfrxzHE9n1jxE+RYmPdFRG4yvM5U8hj5C7toNCOwtQW8Zcmpk+MGZ6YQ5qiFwWsOP/bBn5UCUEc79GwBeroMDkFuGOWBAq9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX45YHlraaJaZguy2aTA3ftXELLoBUZljaHW8yOIMsE=;
 b=qCVff2ifllcHHGq5FvsW9dGw/8nOXdP73g6RPL/pFjpilD4C1YkADnLPe/rzDzuVXrmD/9qiAorrznrNsHVPAjd4xi4UzETGS9n0xKeg0QvU6AGPf5/I2OXX7sVoCfniOdjz97kHRrm6+orKKpCShQFbRsd4ZGU0dMBDrIMfOigXNyZGSDJxTS9Y0PWMhjFzqSH7cN0e8mdcE0ITSPYMSGSkBTfjuH1F77umrcrYbawT2vSMkcvq91kIoGctkNb+jJy6YDluDgUC8pYPLurJTV5vBCfBcUcwvbd0FvUF8q6EDFJ+aDO11QtSjTDGESduPyxN1DhuTpjnMf0UtFbPhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX45YHlraaJaZguy2aTA3ftXELLoBUZljaHW8yOIMsE=;
 b=rNR1VlSb2H9Ozqjg9hGL9jSv4c8d+aIfLCRBtw6zYUta3poc12/+Jmcz2KAO0BmBAyZCXKL03nTZo6qgxBVHC1AcuYzRaZmb2DkPMvUQ8aQ2fMIKQn8GsziJQ5KVFg12z5nXnk/kfnABn9AZ/Vmwi7w/rgCrZ47vD9PkqVQ447c=
Received: from AS9P309CA0002.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:45d::10)
 by GVXPR08MB10452.eurprd08.prod.outlook.com (2603:10a6:150:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 06:37:20 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:20b:45d:cafe::5c) by AS9P309CA0002.outlook.office365.com
 (2603:10a6:20b:45d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.3 via Frontend Transport; Tue, 4
 Aug 2026 06:37:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 06:37:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5AqNnvEht6SOc3HGyuIeLmH48WePKQjLhMM/Cj2gYY+NJSXt5BuWDyCxWpgCA9wCv4qivjpmPXOcp4dNj/9pAR1Ui9cP9Nih8qeWV23+PT1PfhqBFVWWgUsK/y/TWGFK7C3ggThGOX9nNEOVp09JCkJjHXHjBQLFdXV0OoQA0sg44fMXT/HXKvWQVS7yf9LhiuQwXyEDD6JIAC6wWwqLdN7p99V/UIt+1ib/ZSzzsjK/xq0zUC/xbtuVBO1qMpiXTU9fYM7IONkfw3RKsjWBHSDn2Lc8sZ6pJu3mY4q5E47L9My2AEmg7B2a+iEIqF6dulRuJneLGCNTUOu/EJ3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX45YHlraaJaZguy2aTA3ftXELLoBUZljaHW8yOIMsE=;
 b=oN0tqvNofLMkZQH3ltYbab2hB2UrGap7sGKqMNhlNXJv671yuqZuLs/GG8recuK8kTuy97lOUH9/L5d9q+r4vjAsfX5JrmtJHl8DfcPNmp6ZUK7hWLggWLP+vQU9SKOiaNo89KonfnvIBkTltMssX+1v5vi1IUEkLls4HFQ8vKycb/Z2jwPZ+VsQhL9uWvfcTP+WVkEQop6YSoQEAO//fTlqJ5uLRyHS2b17mxMtdTrKpa9eFFkxg4sYQetKrF0ciAEWEYBcDmNBGkNLORjgM5XbueDn0jVUt+bgTYtzt5GO3YVADNgS395rAWtj7mPmKA7tVpZa6nHfeR07vzyf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX45YHlraaJaZguy2aTA3ftXELLoBUZljaHW8yOIMsE=;
 b=rNR1VlSb2H9Ozqjg9hGL9jSv4c8d+aIfLCRBtw6zYUta3poc12/+Jmcz2KAO0BmBAyZCXKL03nTZo6qgxBVHC1AcuYzRaZmb2DkPMvUQ8aQ2fMIKQn8GsziJQ5KVFg12z5nXnk/kfnABn9AZ/Vmwi7w/rgCrZ47vD9PkqVQ447c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AS4PR08MB8046.eurprd08.prod.outlook.com (2603:10a6:20b:586::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 06:36:42 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 06:36:42 +0000
Message-ID: <9eb7852a-c14f-4bbc-86dc-4775f882fe27@arm.com>
Date: Tue, 4 Aug 2026 12:06:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] selftests/mm: separate GUP microbenchmarking from
 functional testing
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
 <178574760161.1561566.2419225666600419775.b4-review@b4>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <178574760161.1561566.2419225666600419775.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0028.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::12) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AS4PR08MB8046:EE_|DB5PEPF00014B89:EE_|GVXPR08MB10452:EE_
X-MS-Office365-Filtering-Correlation-Id: 3785a0e9-7348-499a-2d8b-08def1f2d47a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|11063799006|5023799004|4143699003|56012099006|17002099007|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 O934fRI3Ik3gEV8Sfnqoe3VpkuAGZaGk99IN5X11bWasSb7MFCTkf9tdG4lKUPWEUQptE4IHGI4n/qGdxmeSmS78qS1+K/B5FTFLCkZVmFhlHbS1vvgqzRbUUAmyP71V7AFP8A1jtigEM48Dtu2S+oRnefIQ2ZBuBz34Z+ewYeljBbFNBxnU7rAHDj6MNmuf18xuRgX7binIlGsb4hTf8zv6W7YMvyEg/cs7S8JyHaDvN8auUpIZaqsoj5s8AnwXsXdfRBS7uSpXcjzN0aNhb8du01fuM1Dv1+ObZ/USRovrTwVGPkf7UzBmFKi/PV1NQKyvkyuTYXk7kHvejf9XThOn1Gnm+KN+5ZFGXrEd4TagsBc+UiPjTF9LAGrtKwgqCgnk69TvLj5WMtGp+I7DvlJ5sK20hPJVFOV2iulu0dMIM1NgnZpbwbew6svNTH4j3skfim1cqsw0ZhfVN1qWRkQdzr2RMdhvmH7C++1fv1vSGz/2rRY3NDzxxN0VLXgkneMuXp9T3HrVAVmQyMRd2JA1PWQyTPC9EAarhuZV7dC8U/yJ23h70hPfcpI2O/CAoU8w+vd8a2PlUOzPEcZ+6DCrq7z20ZvIFJjb13oviMihtCEs3yB0Y+KIPoQ3KKbHnhFXQjhDgzfUJZ4Kt4EOOkONsBzWAnM02QqTfxYeNxQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(11063799006)(5023799004)(4143699003)(56012099006)(17002099007)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 FyTV2lMXNfytzXYqbMOWvxR0lE8pKvb+6T7RZBZQgJBKExdLg04uRvtkQnQhwEnbZ37xwJ5ISOqdxhd4var7TolY93uuQB8jXQRXXQz0WT2/i2GXjdVQxi/E7n63c9Us+9Ivie/Z7VtMV6C5bXfQ96uDfV4ntjgqVl8r0yotQ9OdXbnAH6tNiJ7NWtfI4g7wd3WSn3kmbj7zw76If5feE6ia3dH6gYRaJnQGtmtyN9dszvOK3fcy37/pqllR73WcdsxfFDGM1gRQdq6mzKSjMXF66hBAKQngc8fbfNiEgymzD+dJ/qEdXEWOxzlwNGkFBptBhp477TiT+aYu9oE1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8046
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bac3049e-eb6e-46b3-2b97-08def1f2beaf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|1800799024|36860700016|376014|7416014|23010399003|11063799006|5023799004|10067099003|4143699003|6133799003|56012099006|18002099003|22082099003|17002099007|13003099007;
X-Microsoft-Antispam-Message-Info:
	/Oqs3teOEqbFdgAPsPdxkVQnsejWKs+rw2hoqkCkawt/f2RQRfsM9HPH73+3oUpmfl2BuvrRCYI1ozDiTC3whHKzG0QtOeklpLELqrVHq48uJmTl/50UDyIFHfyMEfo6wIiHF4YEk0qxr3l9sweTeX2laf/5hXp19cgnK0H3tFRvdSb5Mr8TZe/O3y09jcPM3GR4GSdVA3J3dON6jcb/QEdCG9OzWRmLbGexql6gS0UHZzEvyNlgJ7nfNytSlof7vhSE9x0qJ+n8XlnslOqB7Tut7K3Kjj4GT8ntgKDIZWtgqXfmTy12rgTeuZDucvJZYqC1bsdjVocfsdm0tPMyzZ+mgXvGYNbs+5XaPOBnznQ6moV/GzxFw1PNHTtBmFFdvd8FEwkKASzXLV+dQnVD/Oe2iKL3AZmwlWE7MXfB322wWa8f8UrtjYoQNQaMooIuSiuHlf1YwKdFUkNVFpynn1NUiTF26Wsx9h23FG4dIRZGbHP5Xs/7q84KlTn4qbxjwQEA9iGFhFiQuCW4yHdj3fxD+QcjBJN7tLRUHse9Fg+2WfUAMw3HbehaA04faBmEdzgPYm32ppNbLsUNoFj+aVHBtBXva8oBLzcVQXCLEU1svIHXGWiKZjtLm71ydl0BbCx3W0hl9ZVY88IxSyYugJ6XNJbLeeotzOn2mLKCaSnjFBsrrbNq53skENQY7ouRNqKOm9NV165vPIUqkc+6rA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(1800799024)(36860700016)(376014)(7416014)(23010399003)(11063799006)(5023799004)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(17002099007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8UyX2hq1Xpb+hFn4DaWqv60RaZT2jzky4kBa+Pcfaov1hEQwgxReuhhhLycVJCv9rukCc03apWH5/dpt1mj4lCPaJTIV5WmPxjPU6m7k0RWlEew9ybFsMHoMXEAK6g0uFBRwpXLBM38PsgSVzncwhvRxFQJ1K2YiUUIkQhGLJwYWCFCxgLRAPoc0dwvJV7oWehyu544YPoTaPxi29yqu0sLsi30DnEshqVq0hqy7yP4emDMi0bvl2gFGGjEy+xPIrr6ATShfS9jeaz52hgaZbGzJACiOjXIixaMWzNAgVBwg9AJnJ1Ixi8YrllWTBsffTPzsx/I7vB44GF6DLWqn9PFZZcwerr0UD5dzIdyHgiUgcwOl6gD10ymdOVwFYYCjCQSWUwHz6iLqnkk/z6MV0e49B4xx6/ucHttZmdS77ZQ21LopUn3VBfSDCQ2U0iIZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:37:18.1322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3785a0e9-7348-499a-2d8b-08def1f2d47a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10452

Hi Mike!

On 8/3/26 2:30 PM, Mike Rapoport wrote:
>> gup_test.c currently serves two separate purposes: benchmarking
>> (GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK and PIN_LONGTERM_BENCHMARK) and
>> functional testing (GUP_BASIC_TEST, PIN_BASIC_TEST and
>> DUMP_USER_PAGES_TEST). Keeping both in one program makes the functional
>> tests harder to run and report individually, while run_vmtests.sh has to
>> invoke the program repeatedly with different options.
>>
>> Separate these roles into tools/mm/gup_bench for benchmarking and
>> tools/testing/selftests/mm/gup for functional testing. Move the shared
>> file and hugepage helpers to tools/lib/mm/ so both programs can use them
>> without duplicating the implementation.
> 
> This sets seems to regress hugetlb tests: 
> 
> https://github.com/linux-mm/linux-mm/actions/runs/30553882784/job/90909219578
> 

Oh, thanks for pointing this out. I found out that the issue is in
thuge-gen.c, where we call test_shmget(getpagesize(), 0), which
internally calls hugetlb_free_pages(size). This attempts to read
/sys/kernel/mm/hugepages/hugepages-4kB, which does not exist.

Earlier, read_file() returned 0 for this case, so there was no issue.
Now that it returns an error for this, the test failed.

Will fix this.

