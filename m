Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CB418871F;
	Mon,  3 Aug 2026 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.26
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778948; cv=fail; b=qiOOHLzKlB5BeQTpfgopfnri/y71Grn0rk9xDEVI2rnnlnPYoIJg7VYXGYY+O7gDT+7Z8ZbaoQYF+/yCfq+6S4iGbVUrcHRqgmKrS725qdp98wZ7ML/MWCtA2ynt2IZcu1lWStjz32/K4yCWuOc0KXSL8O9al+FLL7iK2mwlBB0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778948; c=relaxed/simple;
	bh=AUd10VXRwFc/4ZO4ECKgzTwdJ0mg5NfdShjx2NEZV7k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gPk2Os8el0kmiUfJ3JIsJmsMVG7ur1lcy59VFojARComZBx35FCc83J61PVthaX1ki24SxU319x3Pc2xKh7wA1CEQdjMDQ4bxPjj9CtDWS2TntK/AugKSvSuHB4XgHFqEGSTGtQshZefahUvmW2gbt31BO96SpZ/wgoEbP9oPDg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OY7E9xSI; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OY7E9xSI; arc=fail smtp.client-ip=52.101.66.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OY7E9xSI";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OY7E9xSI"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ghoWDUDyd3AjZID23vhJQWrUT64K6c4MeR1XjjWYFTfQH5zFTxoFnIzOpoVGlEEzDiNvyIAOElrj+ffEI0h93GpvhDvjNZiD5kfpBQf35BCi9G37vdbgWJclWx+75vNYZ2f5YcT0DBimpdKBHTKkiEgSfT+6q4ovrZ0+TZUrBtV9ozGkVYh0nBvUdKfCGBW26DFMHx7ARORwGh45dXh/cZe2XX39qJd8mL4QrAxaDPOYa1JxJxCYbwP56eI+YNTA/z7EFZObCNTvez6XN0Uwr+CJva5nhMne4UvFEgPdeMQEBnJX5zVXATrLt2R6YOqvtXeWHm5DblsBPHBtcCOGJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7YyT3mms/ACJvVoNWMzPdsBLRs0R6qfciAASpqRTV0=;
 b=hVAHiFD6blKlUTALyon2BJ1cOs5ef5BtR9Crw38RAoVaaRTxoM9ov+wdSi1eg9LaHyey4/OLPjZVoQubVd565hJIAyqU9ZK05cELzSwp12FJesHo8aPErqjsId6T8Dh0vD4+2P/ta44r7Yxv7r+relaJBAzK4Vqc1XRwdDqw2++GV3Ckgv3XKupIKbCuQlmvELR3Un02/pxMlJDznTTbBqdPJQpzARMSK+BKFokw0OqclL3MGs1pV4I7a0GT53y2urdBeiyT6XiNqNvr3OBhbhAYGesEEHgF5CagRghwt4SLI3hrWAx4FN17uIzddYid7we3zsBz1tFKf9JMpuqWLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7YyT3mms/ACJvVoNWMzPdsBLRs0R6qfciAASpqRTV0=;
 b=OY7E9xSIvGw3gvGbTArojdt/1etlIVYWWtXSyhCWW4oPddyb9BVKOrflBxgQmeWQSMcxviCJ+ePI9Qptcsu4pugy8+YtdIN/+nYTaFTPFIe2uYSnA5duMnmXW1etuwg3mJWzbeKPdBjz91qdw9J/thUhEz3zr8e7t4vtLOJDBcE=
Received: from DUZPR01CA0308.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::19) by AS4PR08MB7578.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 17:42:17 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::aa) by DUZPR01CA0308.outlook.office365.com
 (2603:10a6:10:4ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 17:42:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 17:42:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkZq4PFjpnOQkj6+NiwH0Daa4NmYhAavjmmW+5aQCdvdupbcdKwqEAlrTNOcX+O6qfR286SptaH2nOplv3apHwWJnPsDgtU+fZuyHI5nxu9geT56trIxhjLIPyVtPuhzx+Ua+jfeMEl0yJ1EsY1mHnFMTJ+R6WIL8Q90Hc3SP6SGbJe4r3zOD/I/KL9sQ0Z5RcbxMbv5SJxXMfwlzR0oMhUzVresT1A8aet9P2UVpcCDfu0xenOnm/WI9B7kXDA77OfIcifN/ViXpPZWHHGHQaZ0hKnXbrrDUPkx1CMZ10BKsAHR4Wp1I6h97/vyZBtxKecJOuvbQrMdDHaISV4oVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7YyT3mms/ACJvVoNWMzPdsBLRs0R6qfciAASpqRTV0=;
 b=B4XhXCSNRZEItgFuXanAmdPX8/I9MlhT0Dr9JSIJKhHCEpZdvCNEwIUxw/VvvsJQezo9HeKsi2bpXhClBPH1ESRx0OxC7O43BeC3c6O/gIPRlppZh84jJ6F4Cgtwvc86eBdwqEjiUhxHJB1nlhJR6SF+qRDUgglaA60+eTrixELfLzeYByIVI6sQTdkRBM7R9+xmFanwxOlKlrSQtuhbXaYqHyReQW9dGlu8nR4opQw39GButZQPGMqbqEmfOAEMIykN7jWgfFJdqzBXHPJiOMgjih79l/OiATtyAnBRGLZn8Om04j88eskWmfk/QJl6euGvx6MXNbelizf8/w0imQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7YyT3mms/ACJvVoNWMzPdsBLRs0R6qfciAASpqRTV0=;
 b=OY7E9xSIvGw3gvGbTArojdt/1etlIVYWWtXSyhCWW4oPddyb9BVKOrflBxgQmeWQSMcxviCJ+ePI9Qptcsu4pugy8+YtdIN/+nYTaFTPFIe2uYSnA5duMnmXW1etuwg3mJWzbeKPdBjz91qdw9J/thUhEz3zr8e7t4vtLOJDBcE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by AS8PR08MB9814.eurprd08.prod.outlook.com (2603:10a6:20b:615::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 17:41:43 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 17:41:42 +0000
Message-ID: <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
Date: Mon, 3 Aug 2026 12:41:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
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
 <20260714154740.140431-2-bill.roberts@arm.com>
 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH2PEPF0000384D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6e) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9829:EE_|AS8PR08MB9814:EE_|DB5PEPF00014B88:EE_|AS4PR08MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: a64a7825-929c-46dd-2a7c-08def1868f93
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info-Original:
 BeqYaUvwl2otg4LBYefHYvI4FZ4Gwp+IC6ZLx38BZxB9TUR4ma+7BtogYVQcsZgn49hTBem+FgwplMeCA38o0/0r5LEmynRDHnb4wDXSCZtoeQzADP1qzqcLckm1mVkz4aRufo5y/cT+L8DZkerGxDEBQsBVWBKlCCWCw0wp+LvS3k58tI4vF2OcA7CPDP2JABZfzbe+Xf53k+L9GoWr5Xv+srFXdGkj4DWnbFcRiYW6qCzbvOlqyswcdF41VoZOg1SYQ63b5Kp7cuYi92MgniotCXuM5WPYE3dM6f18Q3u4WDohbTwbujuJT1Zf1cWem2VFQvKVJZzbIMINApTA6xiWZFCuzzLzRqpcGZqV00/5LsZ6iVHsIDN+p4/y6LJp4BO5ujNWCf4cjZsg9mkWHNzD1H3z1dIJIrOkwJMzG9AhpiSNiwXGyIbzb9qZxFf4dFPEivzH8yHh/IEFfRNysL7EiMXFvKJxyitWHvppVVCx4bI1UjptqXZAGAMfe/KH3ydw5E9NufZopGT4fRdlO0Hu7RvoZjHK9Zap/cEUfQz3GpHQpivc+RKV3q47Xk8+WFaRs1FUwX8yiFAFnOIEPt2GoIEfkPQQYLfczZYJhqC1q9i6junKPleUnmJogdY5XLDt3ZTPsL6JCsw14z5hF8fwZCWn1bQEcNEvnvK9kAg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 OuSYZTFD0WMG+bO/u12oW296fHhxv+RO2IKTZAmf8NaGQi1h8mweVxXcZtKzmLhMVnbwY9tvdtequOL9Fdk2kjoXntha8ORH1FURosQn8haddbCbsdNnQKA/yM5l2MhRlNlT8lh2CXXyfGGwMmuGtz/Rh7rMAGInbFVgzs/umcrQ1sV5dUv6rsZw3tDngxxx5SGgsxZPcof0hjbyKWRtC6YpjVLcfFyUqt4vrp6cYp1nPFTwEm1VPujfMlqIgKnHm0q3I4W1aN9hWjuNQbN8hb5HSq409nhnxmaSM2FXQR2hwq/koh2VxxZ0Iir7wLcdFUmR0TSd9m5UI/UVRJtFxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9814
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	16d9d83f-4e4c-4799-a8c6-08def1867b0a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|376014|82310400026|14060799003|35042699022|13003099007|921020|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ILaOovfYFC6cBulZYbR8XYWgJ3c/xmWJGY3zsFYhubatoaH0DgCupaC8I7oW22VZl2aHxhTFL5GX+4I4ZWRNKBookyi3Yd6LsM0XYbwQn5AyCeZ7x2TQg0EiI44cFk8xGNeyD3YBNtWShn/07dX3npoRN8x/8ufe+4BQhmVAIUvjeNtlASoVdqo9zRW6sbxmePIERFpQYgpDPTZV8moWfgQShpunukchRogJ2swg5o93ipgcfRCzf51MXcrsg+N2DCMHc9W7bfQEzf9vo7xIceKz7n7QEkl1TSvFVnQN1XkIntLcViztPnVVVHM/JwJNELy/S1yIbQ8PtdbK6GVIAVcoykbMpZHI1Odt0+zgrLP+rreRxyQSYoKr9mJs/iVERXscxCrA64YbrSwNDkhCBnauFW/kYXGUGSJEUWd3W5HptifuhU/10iDJqZOxqHp9jKhmrCxCGx2hhmXCZY3VJXYJ/rmYMc1EmNnsCbHe8M+2hZ9PbwP6SaE5Rq3OVwtUMsnKHlp7DXn0mFqCvU47am+LFEzuY5zbuuW1pnEArlzSC7KWjz5uOAtHMAjj/cMk5LAPuTZ9M6FO586X9ZiNJEL13MmB1s0ZUQL2mAqYtOGrvt7+OGGbkqNO3QRBpjIO6w/FY1Rl3qZYsxSGec4LUtWZNZ4WQvji/ozfpPKR0Ld1jXxioqCOk9FtPsyxhPb3EW/03nh0kM+Kc/LuRVsUrw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(13003099007)(921020)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9bTG2OaXtvU7aOxflTqWMwKhwWGNRt3HMEHY+fby3BdsnyF9v5z9ENVXzB1C8dQr0EETlr0SuivfqMPrkSvSWooqxTE8d3v3gYv3cGFHvJS+h7tT887PSQGpYMzh1Mn6GoTePzmTOhok1Js4Xxw88aGKOprdNxc2r/ClkyGvgGSCOeBFqXEEPNmfHMKlGVAMoD+Lh0vzQcKOBfmjIAOjLEXZnD3NqLyHTt+AFDN7O83eu7wOsRAF62I85bnuqwa8LCR626wEB9zT2TbTt/0MoXVo4dsO0BhhL80Pvs6KRfs7MtmvIiysLL/NiIiauP507bDVY+jp5VYYCpGnb5EfcJoRi6qT98MjF+v1f0Uw7VrGwHLeWPfUKwGNkcBzAyB59hX/dr6LIvn1z/stJtQZhiqIpWNITSKemg9TdUvvFW5GDgAo++uFLOu8yrhs92Hr
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 17:42:16.7568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a64a7825-929c-46dd-2a7c-08def1868f93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7578


On 7/29/26 8:29 AM, Edgecombe, Rick P wrote:
> On Tue, 2026-07-14 at 10:47 -0500, Bill Roberts wrote:
>> Historically, managing the user-space shadow stack state on x86 has
>> been handled exclusively through the arch_prctl() interface via the
>> ARCH_SHSTK_* operations. However, other architectures (such as arm64 and
>> riscv) do not implement arch_prctl() and instead utilize the newer,
>> arch-agnostic, prctl() interface (i.e. PR_GET_SHADOW_STACK_STATUS and
>> PR_SET_SHADOW_STACK_STATUS).
>>
>> To provide language runtimes, toolchains, and libc implementations with a
>> consistent, cross-architecture interface for managing control-flow
>> integrity, wire up the generic shadow stack prctl handlers for x86.
> I think glibc doesn't handles this in arch code, right?

Did you mean "I think glibc does handle this in arch code, right?". If 
so, yes, glibc handles this in arch
code. It would be nice if could also merge this for all architectures in 
the future.

> So the point of this is
> only your SE Linux patches. Or is there other cross-arch code that wants to
> handle shadow stack?
>
> BTW, for non security module people, can you explain why it needs this design?

Yes will add this to the commit message for v2. But as you know, the 
gist would be,
if we lock the front door of the house, we should lock the back door too 
or the lock
is useless.

>
>> Map the generic PR_SHADOW_STACK_ENABLE, PR_SHADOW_STACK_DISABLE, and
>> PR_SHADOW_STACK_LOCK operations onto the underlying x86 internal CET helper
>> routines. This allows portable userspace applications to toggle or query
>> shadow stack states without relying on architecture-specific system calls,
>> while maintaining backward compatibility with existing arch_prctl() calls.
> Can you explain why not to include ARCH_SHSTK_UNLOCK?
> https://lore.kernel.org/lkml/e1362732ba86990b7707d3f5b785358b77c5f896.camel@intel.com
 From what I can tell, there is no analogous operation in the common 
flow, you lock the thread features, and
the features are locked in perpetuity for the thread. If you need fluid 
changes to these bits, you just don't lock
it. If in the future the generic interface gets this, then it would make 
sense for sure.
>
>> Signed-off-by: Bill Roberts <bill.roberts@arm.com>
>> ---
>>   arch/x86/kernel/shstk.c | 35 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
>> index 0ca64900192f..ef3db94eec6a 100644
>> --- a/arch/x86/kernel/shstk.c
>> +++ b/arch/x86/kernel/shstk.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/sizes.h>
>>   #include <linux/user.h>
>>   #include <linux/syscalls.h>
>> +#include <linux/prctl.h>
>>   #include <asm/msr.h>
>>   #include <asm/fpu/xstate.h>
>>   #include <asm/fpu/types.h>
>> @@ -630,3 +631,37 @@ bool shstk_is_enabled(void)
>>   {
>>   	return features_enabled(ARCH_SHSTK_SHSTK);
>>   }
>> +
>> +/* We assume the prctl() feature bits line up with the arch_prctl() specific
>> ones. */
>> +static_assert(PR_SHADOW_STACK_ENABLE == ARCH_SHSTK_SHSTK);
>> +static_assert(PR_SHADOW_STACK_WRITE  == ARCH_SHSTK_WRSS);
> This is only needed for arch_get_shadow_stack_status()? So can we put it near by
> and explain why?
>
>> +
>> +/* Handles the generic prctl interface for PR_SET_SHADOW_STACK_STATUS and its
>> feature bits */
>> +int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
>> +{
>> +	int rc;
> It needs to reject invalid options for status.
>
>> +
>> +	/* x86 arch_prctl is single bit at a time, so handle these one at
>> time */
>> +	if (!status & PR_SHADOW_STACK_ENABLE)
>> +		return shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
>> +
>> +	rc = shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (status & PR_SHADOW_STACK_WRITE)
>> +		return shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS);
>> +
>> +	return shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_WRSS);
>> +}
>> +
>> +/* Handles the generic prctl interface for PR_LOCK_SHADOW_STACK_STATUS and
>> its feature bits */
>> +int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long
>> status)
>> +{
>> +	return shstk_prctl(t, ARCH_SHSTK_LOCK, status);
>> +}
>> +
>> +int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user
>> *status)
>> +{
>> +	return shstk_prctl(t, ARCH_SHSTK_STATUS, (unsigned long)status);
>> +}
