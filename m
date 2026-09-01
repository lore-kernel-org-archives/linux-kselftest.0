Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CF539A045;
	Tue,  1 Sep 2026 04:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788236462; cv=fail; b=Xj8nemgu8zad8BB3UHSt3kvQ+9JvP5NTwPMnDISyFKPjZmqZgO5JAQJA7t7IYuBrKlQcF9AOpAsnok992uKx8FiZCuC4MFMWz50dKnYKqrSqGUpFL4C/2y09rx6FOna2r1LM3RiKZqUN7+wimCUWrtCVvxGSNZv3t22wgrruVTY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788236462; c=relaxed/simple;
	bh=5CSIwk2SDFCoq64ialcpyXw3Tb90YR0s8XYGWbZhmps=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hzMyoidhX2wT9twpx+a3CGKRZD+ve1p/FVAjj8ORcm18yvx7/pYQGNf0RGgq4RlAe6AjOoO+Wd2+y/bkK9a3n72zodEcWLECwgmCX5+6ZcUdcGYulybKyjidrw+stb5Kbq11kYajjmhY8XsH3jBJf4HLYZoCeaO9I3k0siO0qlc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AeETy7lq; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AeETy7lq; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AeETy7lq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AeETy7lq"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uvRzf5lv1RA+6vGdALuPAm/NNFXTaz/Ta1YedGYDkcgDJRHZAlGX+hhb8YXgX96EsuxThmsb/UMOI0lR4L22IhPIK6OqA3rNtuJPh1O9HDqqhEQRDtwkr2R4nmILofP4zIeWMQOBrbkXVanhK9G3JxtEJHpRger0HP38HWNMIpaRVu5W8ObQxROTddtefN/oKGs4c2iJN1R5uEXPEfGrWmJt9wQqOdv8nbCf0Kbzfy8g7dQ9jPLLIa1jXbqXMCFaDi6t51eTojvPgQ87/IPn4xQGJDHAFIoc9msnbz0kZKKVO0ePC4rnDZPjbNL9g1QLLZ0wSZetVTJSBfqZgrdJdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsq7oIos3XpXDbsSNEBNsYPuDsqYIApx+g4h/TgwXLU=;
 b=biS1AvOVjF4DnYNxfUTiSD96vs9cNqe/4FYKlpo8xdbZwjSi8+vT8dvIc0QIcX5GvNu8CpqFyJYdKabiluoEOArgQD2kkykvezBBEy/saH8gCKGD6XctbL+DTxSdmcM7BdDyKwB4z7jK5vr3ECIXkx3ldqMulD7sqZM+h8aMdy80Z/rEYEVRUSW73rEJQCWN3SeLRykIjgJZ+/DsFU/+1XGbRglB1MCc7iOl8w0VwWsXDk2PgL9HjqLxyHsdtBX5DvFBz9flLg4kcX/H2XuUwny6BFEMQLDNK7MXaMMcPrmE4sRrmy2Pkq+RTdtm8g0cWrrhS9fZTUVwRi8BxDH5IQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsq7oIos3XpXDbsSNEBNsYPuDsqYIApx+g4h/TgwXLU=;
 b=AeETy7lq/Oyd9+4A/+MfvmYl7m9kpp1NS2AyCpsNxnA3+vwzgZ3WyterHQxyELCciihwnySUWcAxe2YKN+cHiFos1mhuFyDYj9j0m35yOuiRUuTjaBpBWTtekCNFrimQjp+2TCDvrKyFRbZDImFXsbYQW2D6CP8ubd6KJDLd8Ac=
Received: from AS9PR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::18) by VI0PR08MB10710.eurprd08.prod.outlook.com
 (2603:10a6:800:207::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 04:20:53 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::61) by AS9PR01CA0031.outlook.office365.com
 (2603:10a6:20b:542::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 04:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 04:20:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHHdrENqTQlxqd3gwuu1vMLpiLlRhZ81f9zm60Xt0FTfAmloS2l64TpXrH9RNRcZwzKYQCv0S/kh6ChWfTYRjYlVnx5bhmtBSdHuFChChZFnR6BuEFN9SxuP90PsfrRL9gf7I0GmOKqTA7C6xh1XBdrjbNsyH2NthNbgQqYSLSewTm6HN/F0i49MzSmT8gQ+VoAwAXZeTde7EL+OYc76Dpwnh8gASAQpRgF9Afg8rsyjsaeIse4Wu/s3auv/OdSTavYtLVRE0e/dlm8I1OiLzC0kDRW5a6IzdNBit2JH6wJNXCM3/FzXtuzS00jCHGRLDxIz1YBixdWGeTN02ft87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsq7oIos3XpXDbsSNEBNsYPuDsqYIApx+g4h/TgwXLU=;
 b=Hdl3K+YtS3KXtY7RoAAiD5kJA+x7x2j+fMzb8VxrkVJGvbpXsvdVWNN3Fk9mPxuFs5LfBEAMSfd1R3BZc1e2Vl28W41MMbj6vYXf4OB1nR5K4lcs0HjZvtVUVuKBFsgQTeQ8ZvikJHRnfGKxOJNlt5+/Tpnq3SecxZmoNMMVMwAm6Pd398GV9oK/9j9q6iIHfuQj7ypWdZyQRfQaHnFirijr6F4LSS8CqyUmW3ZHVba8ObKlxA0boupz9kYarBGBeABVaejFip6K52TWbxwJZjuQ9eoLcK7c2O+f2hBygXmv/m9CJxm17GmBePn/++V7EljYaZt7COhy82o38L0LjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsq7oIos3XpXDbsSNEBNsYPuDsqYIApx+g4h/TgwXLU=;
 b=AeETy7lq/Oyd9+4A/+MfvmYl7m9kpp1NS2AyCpsNxnA3+vwzgZ3WyterHQxyELCciihwnySUWcAxe2YKN+cHiFos1mhuFyDYj9j0m35yOuiRUuTjaBpBWTtekCNFrimQjp+2TCDvrKyFRbZDImFXsbYQW2D6CP8ubd6KJDLd8Ac=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by GV2PR08MB11561.eurprd08.prod.outlook.com (2603:10a6:150:2d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 04:20:17 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 04:20:17 +0000
Message-ID: <bfe75f1a-9f40-4719-b1c4-5e050478676b@arm.com>
Date: Tue, 1 Sep 2026 09:50:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/testing/selftests/mm: add missing .gitignore
 entries
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: Pratyush Mallick <pratmal@google.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::7) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|GV2PR08MB11561:EE_|AM2PEPF0001C713:EE_|VI0PR08MB10710:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad2a06e-90eb-477b-eab1-08df07e0695e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 YUNQPrIaFrJb1n8v735sfyund8wJ4F16hc+kOIQVOYZ2T9VvxPaIENOvDaG9moi1kjgOWu2Cm6w0Km+/4Etl9uH15xlMzMZIfZLY6ExGFDbfDjNAzOJ1dzqDq5aYS7PWfD4jYgdqUdtqfB0yChvcHbgEN0bs/aMSZDYh4EZW4FpvFv2EHF0+8Zdxc0s81LcTYB4XgOM+8I0GOx5dlphJ6ar1LtsLlfnceb6CthxaUimAGTKBtkx7BZYUu1Fh0RiKpxWW36BL98VaMZ3C8NwpDE6U6WgVyyfNDhD/tQwM36wxb0Vj53yQZg0qDXxejbYmxl+twIU6s3RZEjXFTKr2HpPM1S+LE5vTu6SRnugBiwKsxz/7+OHxim4j08QBUwyaD5DpueBH/pdeCj9vzKJRDUvWBbewDKWPlu8+jqIK45rb8eSJEwaAdcJOcpfkLUU9HD85XtqrpNoOta8hS8HuNMXWjr9+psBbDDOmVQoqaD14XRCbkfX7u1qMdbwrnuzS+WmLKtTZoFMZlQBeiOU6Wx8SlThBQBU1N3OLFtPPuQ7f/ht9HK1nQ++tUagFIPu38cC9RL0zB/d2KC36on9DRJIE3IkSR+b1NEcOIp/d6d6A12JHSBTQoxFdfXRyOyajylGWp+SUW90qnVYMzxj+XmHgj+9rBfCk+9hDwvhd5oc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 GNDz7sfUS8yWOnE7QQBFsfz6Wgc8ZVtl5Rf+5IApR3iDhxhi70S3He6idx81aHiqIJrawWxm7T8CgG2E/IFEYuht3IkQLYd5XY9s+ISmDdXWCTTKufQOJxurp5tZOts9UdtCT0teRLkQGA41/xnoRDqmXm8LS6BP+Gaqa5Ly2tIjmbRmV3Cz30dkMM+kitNsydOPgvq36azqgXoi027ukSBHC9o5ojrG7fq4wBJKQ9hgz/MANeoyi731j0/ZVlPRGhqfdzYQfdNp0mgsm1zT1SXViEjOj44mmXcPz7zEFX8V8oB9VZoqKyvsmHxLkxaBA4XYSNV1Fmwk0AwFIqc/zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11561
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b59a8893-1af1-46fb-78f6-08df07e053cd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|35042699022|14060799003|36860700016|82310400026|1800799024|6133799003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5YbziiSr3AtM8BideyqRvNPprEPX+fMcm+gd2ozE0DnfTdEwdg9I9P+9fPpyQXD9Q+Bx+n/PheMCGesk+jIAb+tFtrA5H6ILnDKhYScJZEksQAQ/kYS/k35r1vv4mdHaSNzuTG11/Vk2NH0L0ks9rDB4x5KGbPmOH0xJgcIRictS9yL3IlJ9W1ES1pIfk58DkQHWTVv+AtLlPWGeMhVlBbuMxQ5rpPqcCnOE3/+y4ObVgqKV/hwxyfaZK6xKb66x2JmgrKEsPz4rEZ0lvLTp2CGFO5yioxw4i0omHM1vNZklffS2bE4LeomAI+nYHy4POrxBpsQikQrizlA1C6EtNXUg5dN3VMPU4kkQsErS980So+eZNX0z2xgGhIjWIULriHcgF+CKHIaKvXz3Ov1HUgJpQRx0jNgjLTBFWF2MDztVE3jRInjNFqoLgWAofi7T2kG/BxHnDsXn4/Vp1fx9TNNuBZ/cfmktmhJJP2sHmD3olx1U0Q5lYh201x99Lex4Gc+g2YkIOBlxGnXT9+reqG0l0YFo88U3uDfjfUhcpN+Dh+BZxoW90EHz8UPdKH6Sd18ymfjWGYMFxgQwWCSAIxSd2QO9W2QdtV06pb70hF9YcPU+29NjRcWrkUnh7SAfZp1wzJaidiSxAuGMRFGNdbmqmFDXTnP24oFOOndJ+aaDalRt0DhMEeC4wR1+9E4N0HkbRjvrBQj0cS1HbB60tA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(35042699022)(14060799003)(36860700016)(82310400026)(1800799024)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	stQmiUF215rJIPusylx82zCJ7cP2IiLlPBAjUl5w80sOJz1Z9ScB8KDAFj+DudItRqW0YfNXiHRX2hVNntpvIBrNkTKt+26PfVrgDlA7TqvpEERtXlB11GjJH6WlZFb0aOjNGq5UjaWuR1DFx9hjPHW4dyp/xl/tUbYEYBtL3C3BgHIXCQcnMTDvIY4fOsBXyRcgol+iIkrSt9zUTSSutZeaMWEhW+qI1OFzyFvHetOzPP2aBS9E/OQ3C0uG+kZWDDIOTNy6ioFTukVzwYwFx+Oh1K8z34v1HgEum/dtWu15G8rcOvIPc6JHmzFJv6S9IGgzcQ1U37On0kIFV4FOO4LOsH66PnGTmpwU83qE58488lO/aDMZhT/K3kq2uvDUgUYCITHvGy9r8NgHRk5mjaDf+8v+jxt+OcnSju+h14hGJegtBMPRGE4dgwoY78df
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 04:20:53.0903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad2a06e-90eb-477b-eab1-08df07e0695e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10710



On 8/31/26 7:48 PM, Lorenzo Stoakes (ARM) wrote:
> Commit 2bee308f3adb ("selftests/mm: use pattern matching in .gitignore")
> switched to a pattern-matching mechanism to reduce churn in .gitignore.
> 
> It however accidentally excluded the page_frag test's-generated module
> intermediate C file with .mod.c extension, and also the local_config.h
> header generated if liburing is available locally.
> 
> Explicitly fix both the issues, fixing the module-generated C file as a
> general pattern as these are always intermediate files that should be
> ignored.
> 
> Since this is a trivial .gitignore change it doesn't seem necessary to
> treat it as a hotfix.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Looks good to me.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

> ---
>  tools/testing/selftests/mm/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index fcd892ed21e3..a306d7754786 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -2,7 +2,9 @@
>  *
>  !/**/
>  !*.c
> +*.mod.c
>  !*.h
> +local_config.h
>  !*.sh
>  !.gitignore
>  !Makefile
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260831-fix-mm-selftests-gitignore-dd389da72760
> 
> Cheers,

