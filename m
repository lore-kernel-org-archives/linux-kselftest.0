Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8ED3290B9;
	Mon,  3 Aug 2026 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779463; cv=fail; b=unYT3CUs+Cbq+2xJ+HwRz8uqpBufw/KZaHaNaPbdtFTobh410uOWzpqS3sOK6w3uUSY7PxNQq5yQzAzlR5CVPSik2aZPXbE9GTEu1VqmWwFXleq01SjQNpMQz4qxYjEWBQGDjNJAh7G3225CHNsQrsksF6YjzZ1EAgfw+K0X41E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779463; c=relaxed/simple;
	bh=hZxPmfNEz5emYvIZptoqHH/hb+sFEcNEXZyU6klxDlw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F83NoD5Q72dCQJ1bGI5rFM6A17AM6ua+Q+q0mOH2iJqxl30FZ/zxwKBbNkl6KqiWuTXWs8OuYARtfD1JITjYVKywxhHQvxQYae33sxsDWdhK5NyYkxN3S9uj3kDwzqJ/ZztCVR/6+KEjGemqhWcfNN6MYzjD3X+9xIieM4eV+d0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=A2B4RINl; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=A2B4RINl; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="A2B4RINl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="A2B4RINl"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hDWniEcw1aXPc79zkN1hJI5RCHSuscMt2fan/bSgqIivcGlgSSv+GA+aeCeA6ndKyEBLlHN7pMdQwx2GBb/6KGu/EY5Mo5T6p3VBj2dNVXCq8I0xY9dIwj9TpTTVrnVaxCMoUgU0cLEGwzswhZW4g1QTVeyfRKKLjcvY1zSdPj+q9VdlAeVnyGA3DH7VaLFNdelIF4MF1RdHo6x5QNHEVsPjVw5hHrTe3a7DgasTdfKPyZnVnpRf/WyXIbpx4Zc5BhEUB925n2d6pWNrtgzY9kyX8UGqPtPrmuX8bUCpcmQhcmfVMbXRjEU51eQ1qtNY/33H6D1+6VZ8tfMFayIKYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1srsGIVULX8+3NSOUtZiTTH2VoDZSbQbrkzZdCjzeE=;
 b=Y5b62XHafh1UFxLNIEFYyVMpMrUlJ5O89rC+7yRqEn7NA4oh4YO6v86Bj4p9tihkRkvkgqPczoqJBaHF875qag3+X4GETZpOMnp2rwpGrFxinZ4gsBBRCdVWFRf/ZbeCldU7z1Sug3e6RPF1DP1CwwBMem8fGESkly/94KC/GJ7t1k5vB6E/ba42S48PpldG2wL7/OM6e2hB2zNsDZ8HcQKouR9XzCp4r/qHyv9TehEL7qULeeMC+1tpjcKq+u5sSjUKd6jyNJ2DmCC5U2L8lALbNz4MBoXRRgR15sgKMtx+IyQR0qnQ9uSO9m6nA0m8HZLLA0oYT5OASthcg316pA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1srsGIVULX8+3NSOUtZiTTH2VoDZSbQbrkzZdCjzeE=;
 b=A2B4RINlV/Hpa7iKqTxtG+jY3NKsxQNXZdmBL5izS1Btv7cnPWTQ5uandE8j0UbKJkeeQV+NpdktVamqpUwv8FkpdZfh4UogoJOnLP+Ju/HF56BLCePKznS4FSwGNqTsXmoYTyUx5ujKkySvxikSTe7caTTcsExxqVTzXyjRulw=
Received: from AS4P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::16)
 by AM7PR08MB5496.eurprd08.prod.outlook.com (2603:10a6:20b:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 17:50:56 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::8e) by AS4P190CA0027.outlook.office365.com
 (2603:10a6:20b:5d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 17:50:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 17:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDB68N9lG0LTQNRLAUC0UDHdlvD0D2taDpJ/aUpepa4CzO2pUOt02rglSjlkhg+O1eoyod0KenY7FqU+YVxZ6Hu2DIYnCg62PkqivkpbgMJ1mZA2SuTrgpRZrBMG5csUstA6/Rrc7wZDiGsgDwYxqzzZIidnGYglXH8XgAHUQOM00z3XmEzCuutobTbqBkeVdvE3INTWxKKjy/f+UmhMFIF+4wogIrv0iFGaKsWzaNlR6jC5hQ3lOcQLnU+x5ber34wnaq8jmyyIvjnMZ+D/0bVpIA3WfjYwNsRwBt+T2icCVRNFNypaWVExUYmqp5NizvX9a2v9WHS2CrfF70AiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1srsGIVULX8+3NSOUtZiTTH2VoDZSbQbrkzZdCjzeE=;
 b=vX6ens7DdlQj7tSUSyXU2Rnp3oj8oWs30so+zDz7wfnVlYcoodgVmppn1dX2kwksSGDOnghLQyjxeJADlKPmSt6Iyya++m5pGNHzlW03ZsMEi56qyMPB+tCCPG7E1wGtBsIRbCzj25IMKpMkVtmuGOa9iGLX1UthqB1HWBvkWSjG6RFO8aJonIodkjRhVY8Kr2yYLYSEEFty96QDZshp980BMo0dGwQCG92xrlaYNxvH03u5iGmpBhSdFn3EeszXXbWL21fXTj51wA4ppU2qOiuWy5uwAiyjkQvhbaq9NDeUy9T4X1O4Q/5qnNbxoqkd7jbJhoXLlDiz1K5g9aZngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1srsGIVULX8+3NSOUtZiTTH2VoDZSbQbrkzZdCjzeE=;
 b=A2B4RINlV/Hpa7iKqTxtG+jY3NKsxQNXZdmBL5izS1Btv7cnPWTQ5uandE8j0UbKJkeeQV+NpdktVamqpUwv8FkpdZfh4UogoJOnLP+Ju/HF56BLCePKznS4FSwGNqTsXmoYTyUx5ujKkySvxikSTe7caTTcsExxqVTzXyjRulw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by AS8PR08MB9814.eurprd08.prod.outlook.com (2603:10a6:20b:615::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 17:50:23 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 17:50:23 +0000
Message-ID: <a5c308ea-bcb2-4911-ac07-d493d08a5f21@arm.com>
Date: Mon, 3 Aug 2026 12:50:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/x86: add generic prctl shadow stack test
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "pjw@kernel.org" <pjw@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "mingo@redhat.com" <mingo@redhat.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "shuah@kernel.org" <shuah@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260714154740.140431-1-bill.roberts@arm.com>
 <20260714154740.140431-3-bill.roberts@arm.com>
 <5c04899f405619f0bdde1f98e432e382f76a686b.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <5c04899f405619f0bdde1f98e432e382f76a686b.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH2PEPF0000385E.namprd17.prod.outlook.com
 (2603:10b6:518:1::6c) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9829:EE_|AS8PR08MB9814:EE_|AM1PEPF000252DA:EE_|AM7PR08MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: b8232687-1b81-4d71-6a92-08def187c4f7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|6133799003|56012099006|10067099003|11063799006|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 +fX9HCC3wDDdbg2TBCxyaUTfDiHykKp14x5c///kjM7reZIgZIKwf8S02tERj6JcESd8hXxorgItfekBdHLMeoPqI908KRtFelBQrsS9lPvd7ePjz7HiafyTt5nw0ChKwQ+GApSYDhe7/yA3DB5pFA149B13QB4KMlsa/pWMMdT2GaEjzSlEEQ/eQ661tquRE7Ko+yUiElb/kVfmT1kCVVLp80ogrPiVk4U9sGjao6AErNiR4yVgJr8ZD/T8xng9RuXDqfGCLmM7JqPUf04YTtYKoPicjNEe8zYsYDv0SoPqluJdI/mlyLiBJDIGuWuxJPUDdWxGfQ43yvdG+d54c6DBsleH4IexVqnSAY+9zk01KS8rtl+e5sh0r7zTmDEtxnAUqUqCSSeA3RZswYOwTSlPdbp2CQnCrh0jcPuh0W16g6Y4P+71PZjSI7dZp4ShgZr65rUd+ycz5HDlg/hn11mO4QuGdh5L8JbWIwcHXqzQsDkiwVgfUlz4DB6kPdoiMBOMjxytJpkFupxR2aC7/VlieuY0AbmqqacC1+gO4Ki+Te8s+pW/NMJrchzKvyIl10YK44A7tDXWtFVlZYVbrC4Nj5SNooE+ACoH65g3O4ljx6Q2ogJxRb+VbZHSzFcymn1maSCxWzCsAHjJhXLmOXHGkM4ngB4d/sggzV5A/NqhEuC9CHXHKTTB8y06HZcr+Vc6nv4KX0ArAiUEngikgw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 M16ziIlrO5d9mCOdtMU6xEj/nvwCuOuVIPxC22aueSxnT+99jwzN8L9T7OZ1SO7DInFTFd4fTI6T10jZU0EU3Deqd/4+2z360u9kd93EGNyxX2or0JQ/5JcOw69md7Yr8s99DQ4wJ65VnGsZhb4RBvu+wyye9Lzu9XlRCYlOKdS805++6nPiGGI4ceKCD8P9ApGaBeIt3eVpslbwfNRlEf+HCYb9dL3Agnlgt4+L++JLtJq+SM87a4DTTUtHBdefLPVVW/zjtCh/U+RI+VYUsyAh+GyRth3w+DYZg7DRi9EP7MYRC61uyHyPctd7g8oXx/8EFUqoN2AoRcClgeJpfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9814
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef6c0e51-a6f0-4387-739b-08def187b1bd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700016|23010399003|1800799024|7416014|376014|56012099006|10067099003|11063799006|5023799004|4143699003|6133799003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	dg3fBv9RDIhfCZa2s+Efrb7mAVCRTZ0/ooo22CQnACT0FJ4Z9i6VTt0mQpd9lpcUfyNI4qF4L3guP6HguE6r+bAXA/u8B9bhl6rAXIddZwRNwtLLcosVRz+8PKvMsFRCBGt6UPF9vPosA664iOL/jaQYO1SS7O1b2LdsVwq3mnl3UnP6rO64yygm1XvbeP+tH8eq4Dkbx4BcU5tqC4QYen3cH27KX26dSiuJFCEbYri9e1ciUNxb6My2sVpuW1su/VDTmC/MfHKwSPoU3UH1s7FF2F1PuEQrQpBxf/qB5Ujs6Rg67GxFO5PubcGXJ5xGoa9hQ+tTCOyXZrba8jikTc76ztRa3rkLOTId2Y6qZXvrPnRRQptN3v4SsP85DSA9p4TeiAkAp06yjnqS7qseLkT3fQXrMCJQq3HysX8f5y/JTcRWH5ewGMpekMx9hBfie8w3TXwJPQLxgJ0wbEw2Gux8362HvqXYNIktZyLN0iueXtQ+mAWG0v/P+KXvA9F1j6z/FhWaLjdYeDvGvZd51o6AMLArWi2xc95yNJiP4ngmyzyHtX9gs5R6PMWXSASCxnXiJ10kXXvoK/hafa511HqPNcgOmY3kjdWVto6P9XDpoiSE3lFVLrTrD5Qk4w0f8oyl/OG6kyxgpLhNrkoYLygvWjpPHzE2ol0ZjBzYcjOhopLJEZzmUXqCF1IM+cwj6enkaQfhZyt0hhxXew9pWKSENCNd7wgHZVQno2lf58tB8LDeDICLetKoWBMgltpD
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700016)(23010399003)(1800799024)(7416014)(376014)(56012099006)(10067099003)(11063799006)(5023799004)(4143699003)(6133799003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4ycQS0PJwCI6Qo9+tBPjBNkesOmnImiJOscbfNBiEc3Nm89DGrKoWvP+cgC4UWRJCGkk7EZe2s63Gm+rKYBs9Aet39xgThXiU2R7O2KyXPITiH3fDe/BvuBn3a3089CNkjMe4eKMwGHbsK3QfE2YSEQG0Xb7BOwwERf2AVyZ3yh0dHF7BMPd1nwps+WxbVyDM4N6MPRGO5dF7GcZZBmXT3Fp41rMVEsFxMDSWyIy4xSjfoEar4MpquTWZpzR89seaHwZCrYnGTLnzHOkGcU/rh4aRMGT2tUmxl+yAb7GGnL6yc8Ug5qGWnxW70xqbwCkz3SdCrMQ8fTsI353aYEST4KyMjPuWJejijk9vouUoUlzojsrrjltC5iJvlp5qkvoZw50baAobnZoRVNJA6BGfgiSaCdEY5DStwqkD7qlB43D8t/ZlwDCL4J6tXYeBa9t
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 17:50:55.9720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8232687-1b81-4d71-6a92-08def187c4f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496


On 7/29/26 8:31 AM, Edgecombe, Rick P wrote:
> On Tue, 2026-07-14 at 10:47 -0500, Bill Roberts wrote:
>> diff --git a/tools/testing/selftests/x86/test_shadow_stack_prctl.c
>> b/tools/testing/selftests/x86/test_shadow_stack_prctl.c
>> new file mode 100644
>> index 000000000000..9c9e2728a9f9
>> --- /dev/null
>> +++ b/tools/testing/selftests/x86/test_shadow_stack_prctl.c
>> @@ -0,0 +1,3 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +#define BUILD_PRCTL 1
>> +#include "test_shadow_stack.c"
>> --
> Hmm, do we really need a full re-test for the different prctl routing?

Bear with me, I am quite perplexed, usually tests are meant with fanfare.
Yes we want this! It ensures all regressions are caught and features are 
working
as intended through both interfaces. This means, nothing broke for x86 
in this change.

Tests are cheap, I have no idea why we wouldn't want this.

Now, what I did want to propose in the future, is moving a generic test 
up out of
arch specific tests that would run on all systems. This will require me 
to look at all
3 arches and build a test suite. However, I wanted to ensure that 
nothing broke for x86,
this ensures that. I was going to roll those patches after the LSM 
changes go up.

As an aside and hearkening back to your comment on UNLOCK in patch 1, 
the test never tests UNLOCK.

