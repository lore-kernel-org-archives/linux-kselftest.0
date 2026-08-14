Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E8364E9E;
	Fri, 14 Aug 2026 06:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689210; cv=fail; b=KYnsFuFPU2fgvGtzwZGuesekOOdqSJ3CVBhJlF1kKvy5g6Poy2jes15sKyib5PYzFr+CDk9mUmFpcrUDrSRmQ3fd+hQz6d0isaGNOpekt3R50K84RNrjYVRRrLuFSHz5KuMnHdAf4ICzNdiICHI4exAg9q2uSYGQS/dhwR/bY3E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689210; c=relaxed/simple;
	bh=bqaU5lUUPtm1go/oGXFHkyYZR+dgBrA+5zhwqrxAQTM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tJfxLFRZYga4Mi1NIfRxCdyVBJimILxozpy6K2Q0QqTZIHY3IK1gavBjnfxCZ6stXfCCv2QqBMG0oTQ2/e2jAeGinZFYJ66a+jrlVsmJ2Q3BjDce0IfwVGUhKcaW4Olh4R+kBHMljKrQv/rDcBph04yLE3mLmLIxmvbPQfVVu+M=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Umiqsr1a; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Umiqsr1a; arc=fail smtp.client-ip=52.101.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Umiqsr1a";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Umiqsr1a"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tfORhsj2PjuqwVor1leTy2kFWTRehfFwkkwZTjjzgKs1F3AV5g8eUHeL7OjlrwkO9r5a7h1H4ZH6JTcSjjuG1ueZdVedTnUUBykHunOMfEpiw+/LJXskgi/QmERnef7Kp/Qif3gHgCQiPqTaIhjKpsOaTvUGSe+8W3ddAGy7fZMX/oQfc2lZU4OV7ROsXYW1bZiMZaOhGaAkiYsk+YnroSpZ14TmPxv+CGMjj86jfBYAwnb2oj0vsajBi7eiuxlbIrLxLjFRww0abmQ4OzHpxZYpt6ej8QgKHDhAU/VyPm+tA+lwVBWS6x89yMqdYyWcoRcHMmZhTS4ady4AKSn+kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggl5XSTpEqL5zSVeouhqOu0i7UaKfQIzJLRmktQjftk=;
 b=PyuMrapTNUOurEjuiBrvWWXWEzoG46oCXN3aYprXKdIaDJaj8Mge70Eic4/G0jkMzWT+ihy3qGQ4NrFhnXH2NUoYfYgbkZmBojaZPMOJvsJMzMJSbotyXH4cdoKqHSvRdnWnDoZU/pUFWbShwdqVQ6klZy6dTCBGzGg/qrMgzaF+90Wh+FktXKbNNyQgjfnT7hOsCREsWhf5Kk1lfFf69NOrGgh6h7K81E/KWRaeY4T+LAl0lH+yB7cCt4rzJslTyAxk+gdLg0QTcowXc7sl/+VdcaXn1FxwnRFceRYoZ8t4N6NnFpad0wA7PU0Y1ZGg+SFccfREhembjO7YhPkxDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kylinos.cn smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggl5XSTpEqL5zSVeouhqOu0i7UaKfQIzJLRmktQjftk=;
 b=Umiqsr1apSj0ND2S1eu8B6ukFzhcWhz0zZ76WOT1vtF1zjpGhuI9U11hakHmpqn6nU+7d+7Xgecgd2wwSZgPw8NWpP1NMj2GsWCiYTEAhhm1liHypoItpPHVaheECHe5zQ5MmB60tV77e0zz3BUTETjyG5gAdaYuSTPettJyVTk=
Received: from AS9P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::28)
 by VI0PR08MB12010.eurprd08.prod.outlook.com (2603:10a6:800:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 06:33:22 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:532:cafe::74) by AS9P250CA0022.outlook.office365.com
 (2603:10a6:20b:532::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 06:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 06:33:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqsNPbcXvWHABCwJs4Xnec/a7t+0HfI5DLjHCKM3yujQvBgfJUu1kJQw9oWU2Y8hqoXlI1g5LC7ps5LIZXUt/4sqc3Lh9p4lf3tX0ankc370R1N2rtJnoOOdD7CU5bQSIPVkiApfRdZgNQAAdrZ+vK838KnSxg7d1/j2eq8x0f1FuuTboMxCRzNyNNFpPh4x2SUE22bsMaZBFkB8/7EKYp0c0t+5J49oeuB7eQKPVaRlsXXuuHFqRELPjYOPTtWGXs73ThvU3rJsDm4aXz9QlaZ+2o4ezEfjMGx5AW5GWnE3VI+AwsX/3MluY8bOOIvXf3W5KjziMcnaViSI+wNWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggl5XSTpEqL5zSVeouhqOu0i7UaKfQIzJLRmktQjftk=;
 b=kTq2HnWQFFgoJ83TYp8YXTIo49iAWJ6aEZgU0uK8ecZx2Lhvc746y8gICO29Nf0IyiMOGiFQEHE4Tevre5+5EamyWBTYPy6/Sr8eDYhz9fWktzGdm0vNIv5IUpdprDbtxr3E/vKrEhx+5cQmK0ju3cHw0a/xIFPne2pe4Nm9Xa7T/8ygEjOtkyGPhv8e4jXjVML0r80pZajiQh9kKarFIQvdbtMvmqcDm742K+EjtFuDh3wC3P/oqVfrBbutC4nZEkF2OaupnwkEQw01g9IA6ZQzdPyeLvpb/U2f2H4DIvKPb/psyFUbC+gvkwiEnOKOxA7xrzs7a1K91hqz8qfYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggl5XSTpEqL5zSVeouhqOu0i7UaKfQIzJLRmktQjftk=;
 b=Umiqsr1apSj0ND2S1eu8B6ukFzhcWhz0zZ76WOT1vtF1zjpGhuI9U11hakHmpqn6nU+7d+7Xgecgd2wwSZgPw8NWpP1NMj2GsWCiYTEAhhm1liHypoItpPHVaheECHe5zQ5MmB60tV77e0zz3BUTETjyG5gAdaYuSTPettJyVTk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS2PR08MB9200.eurprd08.prod.outlook.com (2603:10a6:20b:59f::9)
 by PAVPR08MB9881.eurprd08.prod.outlook.com (2603:10a6:102:32c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 06:32:44 +0000
Received: from AS2PR08MB9200.eurprd08.prod.outlook.com
 ([fe80::e16d:9c1a:8c8a:377d]) by AS2PR08MB9200.eurprd08.prod.outlook.com
 ([fe80::e16d:9c1a:8c8a:377d%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 06:32:44 +0000
Message-ID: <83c5375c-a374-4c51-b564-0b7ca4f4502d@arm.com>
Date: Fri, 14 Aug 2026 12:00:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] selftests/mm: emit TAP header and use TAP skip in
 mremap_test
To: Song Hu <husong@kylinos.cn>, linux-mm@kvack.org, akpm@linux-foundation.org
Cc: shuah@kernel.org, david@kernel.org, ljs@kernel.org, liam@infradead.org,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 peterx@redhat.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812120821.523860-1-husong@kylinos.cn>
 <20260812120821.523860-3-husong@kylinos.cn>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260812120821.523860-3-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::10) To AS2PR08MB9200.eurprd08.prod.outlook.com
 (2603:10a6:20b:59f::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS2PR08MB9200:EE_|PAVPR08MB9881:EE_|AM3PEPF0000A78E:EE_|VI0PR08MB12010:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c713d9-0362-41b0-557f-08def9cdefb2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|10067099003|56012099006|11063799006|3023799007|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 PycbIXYWA+ufLJ6ijYdWVPar1GIbIOP6sgn9XZAsMREDqdbM3qO2uoiXe8lTtiFhl50sVlnDkoL/2kUbgnyyKaj6df2iYY4UfDs3yFvnKpUaPNcbarH2qc6y6kUGFbHIbgSKKQNcSDqWUVV8toILm2wFkaje+arqJh3tklL+9V3i3FkoA+Qo+v7vHN+WVLkqiIs7uwqTFlvpm+I8gCeYauFitRcdCj/2ZlgIlIvpF5jxv0Y05RFqyKWa3MKN86nPw9Z1oy2La+4BGNadIoytX/Tc4pOZlgOwy35ec7g6/G7SLrxfzxxdUWTBJpTRCw6I3YemWU1kkqobvxlvt7KjbEoonxZQpFXhhv3vQdHxDncsut/rcblrxC1jEz+gcQANcUA6KZd3tboY/ot0zfw45WP4jri7SDVWlorAFouLdHnZ9dPnwC985lLiubshJ/HW98BoJ+GydXg2uPuXnCdc/6ax94BpDLxe/y7p4/aZdWXEftvPyl5pg9mPI3QIIQgRxPtpjH1AuQgwsYCRmTR0/33Jg+d0n2k8EU/aDFLlidg3o5Sh6lVWj3LfpqotCVxPNfhAQa/q2L5iP+eCHvM+yXERw0gpWLs5JBTA/COm5J39ZFWytqsOWoQC9gHY1ke9ZJv2Q1u0uuXv/VD5mxJLXfkO4/vbBK1uuUnDRVvjQPA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(10067099003)(56012099006)(11063799006)(3023799007)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 tApLE1UlKqhZZFgTgA4urUNaXzfKa/vzGul79wcTPdWuG77iWXzgp356Cqfo6Opr1/POtziz/7CJTuCr48M1T7jbSqgHuJet9XkILiedW1ijlWk/Uk5KpuS+KUh9KdEqySLbrszn9KjCs5+Tq566SGFdEcvnxwgdNeAdVtd4Ad25hW933SM/wkk+yIYudOr7DIbmvkAPIACR5wTYkmjLDFwjkYp0n96Jms8naNfa0FiB4jppe5DzlWTFFV2sAmu8s7GHZib0X2WY8lGKx3/P44iBo8KsZMlniAFEg79MFAt7DDixVBYk/tmiE/XSU/3Hl+fUgzoC8tELgAY3AoTqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9881
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7be1385-6aba-4acf-86ec-08def9cdd925
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|1800799024|376014|36860700016|23010399003|7416014|22082099003|18002099003|56012099006|3023799007|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	5OX4K3c7AmywF/YXyULn+pU76mgaQL04vnEY93Mtt8ASKXOkSv8cUHI+CXvVJvnaR+3VRqj62mvMVfOGCtczu9GIstAGAPAtapHiyanTN4fJ8N8O/RMFhbD/sSP3JebSWAsNX4wl922AzzwEXycdXkfeCTExWkqa/kAqHCr3UMXXBf9hidFKP1BEHCFEVUGekIrMFJLMwMhjmlNtZ0pdl5PzAnnl4H5mmP8rwcbZvaU6ZwQbCkudbQR5DRitLjQvmhFQHZgY0Q4pV39cdvQ8HR//7OiLEqhHwwblOfDMSdJiR0SyfE8KaQ2vNywS2fVEZlG+9B/P30hnBR3latMTFr062V3uk20pC9cAmesKN7KZ3HsPbgkylGGAln228FsR+OYNPQ0ygybMJ7z1BagwTMf7SXkim7VWkPHX5rnQkW4p4WIl+wxXl9esgVnCZ8NNA0hmFzJA6jH8eEdP6RRjPWMJ5eBdfIFFrhF26scMwgf+yhkIupHj1z0BXd4etOKlsSPhL05GQwZU71dEfnWP3aI7nr4IeoNG3OB0x4Af1o9PsbZ8nyP8ZFJ1pRovDDLnCOQBOVeWgAGuWAcPFhNDO5kq0NvbZs09bKRcWso9oIhjupGWO9XfD2DTr0h/60jkLOqEa4bA4lKexSswuywkNVxNHjYGoUZL1/tjTPZ66hSRKT1xJNTVtkRy8fOApQ2aOhvX9fi8DmxelsdZ9KOG0Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(1800799024)(376014)(36860700016)(23010399003)(7416014)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x2aknqk7UFVP2QUxlfPULZuOoCm8GRA1/vpFDnnrR1JrFkgs2+qMRjf1nf2M4SRtuEN+5RsJSqi/MqDKuTNn8DynoQnTY1LYavSitzecRCO8mnAOE3ZvusnmEz0xl9vwWVy2n6m66R/mJu6GosNgIzw7LZXNBiHUDvDAORVhFC+fQLVXJP+NAPb9JFdXgg356FFjKMARpW+2F/C5jh1hkBO9KC8P2GbD4t2wEp0p5LryZpayvGvhFtZt4Gbek5ZfQhw7MXEV0kCdOrXv9ANa45adBR5j3fOxAuqQSXJNojUMWZKUMIqhY3pTLa4BUJupONgr3VjYtAmUgDLvu9PzgHlixZtI7mj6wTBfMqb3TzwmAdqELx9MT6qVmbnLYZRASdkvSgMdaeYgOaUiuIXLXtKYsP/aVrNQ7lQMjeKpTsOF2KybIg7vBT9lYtcqMZLN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 06:33:21.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c713d9-0362-41b0-557f-08def9cdefb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB12010

Hi Song Hu!

On 8/12/26 5:38 PM, Song Hu wrote:
> mremap_test calls ksft_set_plan() without ksft_print_header(), and its
> get_mmap_min_addr() skip path uses a bare exit(KSFT_SKIP) that prints no
> TAP line, so its output is not valid KTAP.  Add the header and switch the
> skip to ksft_exit_skip().
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---

While running the test, I saw that still some diagnostic lines are being
printed without being prefixed with a #. This is because of some prints
in the code of the format:

ksft_*("...\n\t...")

which is causing the part after the \n to not be prefixed with a #. If
you are planning for a respin, maybe you can include this in the same
patch so that the whole output becomes KTAP compliant :).

Rest of your changes look good. Once Sashiko's point on this patch has
been addressed, feel free to add

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

