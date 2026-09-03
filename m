Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE6C444704
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434015; cv=fail; b=WEekAna4GKQ3PtYZqDEYwYOmeyafGuQ+caO8wKgi/fO3ZKiB9WzHvEkNIs2DTJUz26oXrr7fMQlH65dCKWSQqS/1ymDI5edU8Ig3MjInvumW6Cu2guWauzC3R9Lryt1l6a07LnTkl70voBXa7eiwhSjWWakCL9+zayh5+2qtRyU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434015; c=relaxed/simple;
	bh=2CSkFnoElk11XRUoUBBhSKQdm8kPURJMKttNV4DSNt0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iZlT5p+HMugwHVUecFV+DdPlYRz7f/7JCJumy3hWigisjwl/mOd5NHjiV83T0cv7lD8a41QCsugdEsIbkicFzSdX5D8nNNMzSejPcMcgY3x5PwvtZI6EZA44GE1ONArm6vGYuwLmH7FGF6gDFAwbN2nIkNmrVtVfWNjMoJFGmvY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VZ4b44Or; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VZ4b44Or; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VZ4b44Or";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VZ4b44Or"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rbx+vDwZvpogfULlXjdu2hCNd1EeIxOMljvnPQak6f0luW6il6LbkUbHory81PQzQOXVqIZU3G5sIavA6CbXWIthapGSxEG1i+TYQcqZUlaqsmexlc+V84Jz6kpnhqykMpVG3ufXvo8XecvdJSyFiwmBprtTgX08swH176awozZ5nZgnz3SpIssHD3GWPwCt+rUL8U3NC6j2QNNSZf9f/B/+A8kFxCMkWEAdzNrALlJX6tQrvV/Ctm3IQfZ8ER2Cc5FE76PdHlfdd3hm+pXDuapXAka1bdX9UpFgMpeKsGfqLjvJwo9qpZ4ISvO+Npbx7gs/oexY65JGrbM5IikBXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNQdw7XnZTnR1w9UaR2/a8HLH4Bfk2HNYKtQKujtigY=;
 b=LZ57xlHB8kjycaK66/08sSLj/j1vy4GnIUIt1+9qNri+s52k05oxesGSGADGdvZ/MOjSZBQSS7Y3TDYb/qfFltbu6fgejRY51LehhwnWOFthlJGDpdb1AIelDkm6vY7s0EJodKwYPtLC466l2/jNCmJNrAgg2Ip/rI+fkQ31ELicoGEoFoi8ZkuPtSlv/vF1uqofjoF00iTplTnPHZSwSoNPvLaRxM1utVYiqYAxxADPps2FslTqU/4vsyrz4P/M+DIDZxU/dhPEZ/1e0K/LqFg0xlvjxK5rQDUEzCJUoanHVPulZDFBfCHKNaPVYslmAj2352OHVABa2Rkyoj0DGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kvack.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNQdw7XnZTnR1w9UaR2/a8HLH4Bfk2HNYKtQKujtigY=;
 b=VZ4b44OraMB0bs/zWrU/imkketlLi6vbRAFECll225+dt+Z8InDE0/qjtqk11OanJ9LKhF3wLes6I1seGH6/J244y08cIH4RdzqPzyKaVnbvgVw+0A6hhOU1v1InG8cL0k9FXLMFJeTfoXTFn6R8mlY49JLF98dlqJkGG10IkmM=
Received: from DB9PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:1d9::25)
 by AMDPR08MB11460.eurprd08.prod.outlook.com (2603:10a6:20b:71f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:13:29 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::90) by DB9PR02CA0020.outlook.office365.com
 (2603:10a6:10:1d9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 11:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 11:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5yku7G+9bdze15A5Sl/dnYoYSWvLCj9cjPk0FMiQgv3INku5NdwmRJ13lDeO9+ddk1bLq+GfelYwZHm39YHP9hoL2F2IdesKX/STD3WBgLHDnUozZ0XdmG12A026BdRd4nuXgOzc3LQ1FLovyrzJlKPvUxNF8Z++vmsr6Utt4xqsYnS5C4F0i0bUqCd+yVQ78zjGNYXARQeFwtBAXXRN+2zhaPQLO3TBaEqgd73LkfHQMW8M/f8rUnfm0p3nAljFw315ov5C1BnUIDcrdA6Njakbxp7CSK4N5GX5Q7PeXG12ha3hzrOOzMzUu1FzO8rD8jwG6XvH/x66TQrBsrhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNQdw7XnZTnR1w9UaR2/a8HLH4Bfk2HNYKtQKujtigY=;
 b=WdcxUHml+2qWzX/KGmiptLOWcgKXYRq568nvpOPXNQy0MWJTPmyjEvIz1H71ARbur8pnPlL0pVib7598VTw89ZEHYxX8bJ/mQz+21uacS/12/FEkMz6jfyHV+a5nuBlRLpAynMPmv+OCfONpNWV7j6/T40X6HcViG7uC9IHZxn34GSIC/LlC5PHOoHN1KgdajlfTEmNuIqeE0iUjmkY+ou1rIsSM5gP4rWJbepunz6t3kNsb+2BSgGtS3yQeYxO6kZRWm9rLE8BgQ/qYWiuS5LGxWf0EKQ1bAapCXjNeFj2q1ecJUKnst2bgEU53XST/J1EK0Y86zbUUWGp/kUywDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNQdw7XnZTnR1w9UaR2/a8HLH4Bfk2HNYKtQKujtigY=;
 b=VZ4b44OraMB0bs/zWrU/imkketlLi6vbRAFECll225+dt+Z8InDE0/qjtqk11OanJ9LKhF3wLes6I1seGH6/J244y08cIH4RdzqPzyKaVnbvgVw+0A6hhOU1v1InG8cL0k9FXLMFJeTfoXTFn6R8mlY49JLF98dlqJkGG10IkmM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by PAVPR08MB9770.eurprd08.prod.outlook.com (2603:10a6:102:31e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:12:52 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 11:12:52 +0000
Message-ID: <7108538a-5581-4586-bc12-224683d0c25e@arm.com>
Date: Thu, 3 Sep 2026 16:42:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT macro
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, kas@kernel.org
References: <20260902175611.1241118-1-yeoreum.yun@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260902175611.1241118-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA5PR01CA0239.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::16) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|PAVPR08MB9770:EE_|DB5PEPF00014B98:EE_|AMDPR08MB11460:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b155c5-39bc-48ff-e55e-08df09ac6175
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|6133799003|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 v1zg+0WLgzw7dzYJxiHiRO4Ym5j2l563iP3ewTGWiJM+kXU355PH/W4D0R4h923n5+coR5pmMC/Z0hI6o7bdEC3aY1EYfILXT50lzlE/WkBF2pJGRXX3m1WzCW51PXmFscezqwlJHAT+2cJ/jPixPjz+3AhBBrVYPLqQtPN88cfyT6lVVA7WOHwUSRkvb9hSX+iTxQW5Q+9Z/xYvmm5OCbYX0JsQXMArisHoVyAabsoLpLhMEHDUkhW1V82t3Ohq8ND0ZSFN2RKco2KqGQkRLoB+Tp0jnfBx/yYwNnub+wzQr+7964ko3emdGy2eSAUVOhXLfxjRLLpjDqzwM7r1YApOtzfcu/pPKRE/hQcZU6MDoylRn3rNPOUA6/VMa0u/cYYpI7GYnu1R1vR1dlQJVZhZBfFrCn8r5aWNWUUYAdPz6RESUaoJDE7xgMBv3KOkKCMrFzWHm4RcQ8e5zcnzQTzASEvECcvtPzKrUuP+f5QGCCBOFWqV1c62QfwiUrUIptZWaydGxMNc/r2M1XIfF8wJnbyEX3Vw86a/JL96Jw9+Y8Ycdfka9MZVyvtjSqevo7xkiRr+Dk8J4Fuc7q5JFJPZrCP8S0guDXy0p6Y3k24kVoawZ4C9/KVnXswvY4OTI4Mimt2YHG9HH/99MsOTjgaqmGBeeAoCItXPgM0R/Ic=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 FnINXtIoR0D+aiRUS23PYTtcgYkxQInUNJxZyoKHdDq4lEgf8BIA1KZahfPWAi8fN0r96KAaVLSuQYBe7GTuO80Qz5B3RikAPZDBhwmbtggvIvYTuGPiN83uUNOfD7n9P0Fh9tpzA5m/AX6ITucs5MFM5Ciw7ur0RfP6wIhEkrK9aD2C4FCHKtNXJLeiFIoUGpUYHEJLlsJqHIi9sQvltn4NUKvdjwtzQz+nffqmTj4hAKgV5y1uTW7hsKBGhchaC2gIpa0d/QbZLSNdi2gjig38H4LXNUQXNKVK8/X3yEhAC/f72o2KTfJktm681kKGRXzVbjDoGMXgIOT804pL5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9770
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68cf66fc-2b9f-4283-b269-08df09ac4bb4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|82310400026|35042699022|376014|36860700016|14060799003|18002099003|22082099003|56012099006|3023799007|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	XDUHK/nAuvNKrwqRAWWyjrLuJlTvfidt0RkISh7GpyaG//Glr+lToTjaxriRog0Y5eE1a1sWnj4IntQKXFzM0+MixGEcraa2Tb7uIezuQEkWnMqiC1mktLFikupwvAUFiI1WX0fQJ8EcTL3k4vAvzCzIzscyjCP9Ix1B/WtjXIO9LGuLTM9n6jOzezYTrQAX8kLCdgSTciMveHBc0FLfo06SpA+jBXbfsklYr2RM1MqPJy1WU9vDWpVyzY+3kI21cm6PABS1Ttwr0Quz/C5FtYI/onvIFKAIH1PlWrh4PM9yfYf/ZrlHUhMeyfH3W2vbhSQmh2fep/bwg0V90DtoHnJjWuIwxJN+8MYmeRGETCDmcIn22hYDr1rIQnA0ak52kCZwJjmv93zJUalpAW37J19a6AWWFjeuHIU/LUAqNuqmwnv3Jzv6VD8IHUj7QJapFj7bP7bxnSeKFySNrdBRodf1HEDL2a5eT0lxrImDe+YU+1Cb1AEpoTnHoM6GkZ3hqQ26VGX8GY6LGo3pp5DmWIx/qvktJUf5PLipveHFeYH+0swzf5/vSpbz8xS0L0WzDA8fZjpPhbofSuxVs2RTa6K6aP4c6gX1sTKSq6JxGjimdGICalYqVvtuhMn4c3nHr4Fofq37ahzQy9ff81xOzCveEEZiagmmv04suRQy37c=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(82310400026)(35042699022)(376014)(36860700016)(14060799003)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UJBWM8mowPLqwVY+tufK3QA1fNZ0mSjvDepIMhDGYY680s5Ysqt5MWf+CSdB2KNvrCirmt8gV2ViQPejr1f+h8xUV8nnlp+Nl9kyOMppvq5sisE2rDvcnO12I/GXZBwaKrWXE604rimxKOg5sw3NrmOrckg4ZEWtWFpfJ9JPwHekOw4Psm7UHcWsxikt3dPs07e5zpW0mom339742hFHiCsBv0B1pTGesbUjxUrq3HMQEezVAwYYdAVjIVLZH7NRiQMxd/gV/n79vaBgZ7en40AfP+Emlyo2PPt6EetkoWLvHSo2cTdUpTz6XVEycXdphtJWRGsw8NFQ/TIAJkvzbH55PrDvw7GFb9/EAPUvm/jpFtxJGk4F2SXnc6IlMs5FxIu94N12WWV/7bATZFOs7CV23KddehstqBuKV/1i85NiH5etEzmPss9zAvSj+KV5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 11:13:28.3054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b155c5-39bc-48ff-e55e-08df09ac6175
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11460

Hi Yeoreum!

On 9/2/26 11:26 PM, Yeoreum Yun wrote:
> HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> When this macro is used in some test, test result would be strange in
> the system where PAGE_SIZE is more than 4KB.
>
> Here is example with transhuge-stress test with 16KB PAGE_SIZE:
>
>   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virt=
ual memory and 1908 MiB of ram
>     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s     2566 succeed, 58507=
 failed, 2566 different pages
>     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s        0 succeed, 61073=
 failed,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s        0 succeed, 61073=
 failed,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s        0 succeed, 61073=
 failed,    0 different pages
>     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s        0 succeed, 61073=
 failed,    0 different pages
>     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s        0 succeed, 61073=
 failed,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s        0 succeed, 61073=
 failed,    0 different pages
>     ...
>   ok 1 Completed
>
> Remove the HPAGE_SIZE and HPAGE_SHIFT macro. and introduce hpshift()
> helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-exist

Nit : pre-existing

> helper, read_pmd_pagesize().
> > Also, do KSM_MERGE_TIME_HUGE_PAGES test with size of 512 MiB which
> is the LCD pmd_size among 4KB, 16KB and 64KB page_size.
>
> After this patch, output of transhuge-stress:
>
>   transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtu=
al memory and 119 MiB of ram
>     2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s     2585 succeed, 1232 =
failed, 2585 different pages
>     2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s     2585 succeed, 1232 =
failed, 2585 different pages
>     2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s     2585 succeed, 1232 =
failed, 2585 different pages
>     2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s     2616 succeed, 1201 =
failed, 2616 different pages
>     2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s     2627 succeed, 1190 =
failed, 2627 different pages
>     2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s     2628 succeed, 1189 =
failed, 2628 different pages
>     2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s     2630 succeed, 1187 =
failed, 2630 different pages
>     2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s     2631 succeed, 1186 =
failed, 2631 different pages
>     ...
>   ok 1 Completed
>
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

[...]

> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftes=
ts/mm/vm_util.c
> index 4821a3563036..4332f8fb2104 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -21,6 +21,8 @@
>
>  unsigned int __page_size;
>  unsigned int __page_shift;
> +uint64_t __hpage_size;
> +uint64_t __hpage_shift;

I was wondering, would it make more sense to call these __pmd_pagesize
and __pmd_shift instead?

hpage_size is used at places for mTHPs of arbitrary sizes and these
values come from read_pmd_pagesize(). So calling __hpage_size as the PMD
size seems a bit weird. Also, there is already a pmd_pagesize variable
in vm_util.c, so I feel the PMD specific names would be more consistent.

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
