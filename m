Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA28E2C0268;
	Tue, 28 Apr 2026 05:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777353107; cv=fail; b=DB/ZM068AmRyvpDMSIBI8igOf9434OE56YTk4giWoJiPjkFu4H9eANYMaqgRopQt7rCbqmcZbxAfVeCkDH/jlQOY7y2EMrDgigAQyjB5mjhWmrgRlckClKLoUH3yzaoaz5wwnzIHOqHNPAejIm6cRSPftIorI6Ng1DPOEDRwQes=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777353107; c=relaxed/simple;
	bh=D9tj7sqG3WvbsQN1pb8JEOkvzOROqWFPuqX1I67UjDA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qDzSAb+T6ShRrzE2wVV4PJpwlD2RFsav09/yhIOax3c/8EPxlsZJXUIrNNw70YgkF6f8B6lCsAs4WxQTintgBPj/k2DcM9VJ4QTXOTZeMD+itlDGXFls8JdbJACaQysKVCcWBJNbyvfEe+a6ZBvxWrRiNoYWo+sC6P+y5nw1wCo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZGedaomf; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZGedaomf; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZGedaomf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZGedaomf"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h7xYTIrudB45xpFQaY95oqLRp539+lglR6P9oTczC7dy54SaGkiMq9++ThBRT/I6cgesPbANj4k93CS0gIwUIvAG2J98fQ6oo09V24lV3RHIteP+KXige7m7zSUBNa98ZbKwvM+Po0MFDxVBs8Z//gTUcKdeJXStYqG7ZR+FDCItxib4OEQS/ujKPIDovfPz9o8OzJwR4/dCNZITDFS8wLhJPVOGy4F96RXz1ZDgrwj8IeVp0Da7cExHvdTUoddmt0KwFLBrK3XYiFoukK3uzjJ47jB+w5iIYOQXW63gyCGxSLxG5jBRbqaIaa01Cu2pqVKA2dBehDGscp0nMUQsUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1DU/FQt4r4LUmizPfGqiD0X1Fus6EL9EwGLAOE6RAs=;
 b=tFw+4z9jikKJal5sYmcABnlcqSgt6Fr+6huwnjOwztN7+VRTDf5EMpSU2GqEx5gHQz29ayz8gCYZMLiRs9hbzkkWZx4k2i2jkZK1j5sNyW5FcnRm13VKsTTxp+RNFxCCRRk6BzJV7BRF9mYvCUAIX5kCHClziq27ItCLvIj9VfQWeLK87vyh8qEKOlpeFuctafrqQkS0YMvMA7YlKQoNuTWLS3Xgb2nIE6pryiVEfLMaDd5eAPUAjqo1U0HAZYzhfdPAmnbTiucuMKEgJEmXe2uEjG3bDhDEDufFh1imUh5tCR/wCkQsaL1QcS5B61kVfFkWpQI0yxhFLd3Y3xbBbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1DU/FQt4r4LUmizPfGqiD0X1Fus6EL9EwGLAOE6RAs=;
 b=ZGedaomfBIR+r+5pHgiq68uybS8hlikpJ+ma/aUXqb2/HWSE/r2emnv0L0e1ZAdIyR7kVEU+UDGZlZPjqlKP8JWEh/MaKOs7pWMjv4NUfD2Z0ZZ7ngB0dlEmTDL3IIIyrjN7NzdryWCNlnvAn6QJlMogLIfAgcc848kxlo4BBsQ=
Received: from CWLP265CA0444.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::14)
 by AMDPR08MB11675.eurprd08.prod.outlook.com (2603:10a6:20b:739::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 05:11:40 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:400:1b7:cafe::3e) by CWLP265CA0444.outlook.office365.com
 (2603:10a6:400:1b7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 05:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 28 Apr 2026 05:11:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5Wyfmzb5Un3oMWPv7On+xUGwauU1hWxUHwkNxBEWKBscpTgZZ9v7QAACubKh8l/cwNZ+D/JAv8A3KZrTapRKv70KK09Yf8xeYHfKNt8eCGRQ78g4DwTTr18O8s1hkUBbFufWMKb2zVpD5s/SRoa3cAxD9qxScpDeyYFGW/qXHfaLAqqPpAIFmI6WRoG6rPgp4YgdHnPrzRnMm7D5IUgvmdPaW+xmRnFw1P/h1D4a82/h/v5KYhh9x5TXlecrIBGDSYAB2cOUlIU/tOeAoE5s0VPuyM3Kg/nkHn24KhngpoFpJBR3rISpQiyST1D/0Z+mGJLh1esPxTcdZkrEu/FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1DU/FQt4r4LUmizPfGqiD0X1Fus6EL9EwGLAOE6RAs=;
 b=rRbe/vw7nuHpkBgwJVTeCEdJDjEjnKoBjfNAUhZ1hPzaAfqoua9OkTuBoAGC5B2S2j/HNs7TgKszJyWp2OW9hqPn7qafO6X1ti5pw5w1943ftm9HlYKv7D01vnT4GHcRV7ryW60Uqs/8bt50abr0Q/TaXw0zbKgsTt5hl5vfb5yMh56CNUHry+Y0VFYyUyIHTj84lsr7pDfSaLUgSEPyb3TeCB4n/+M1XPmDYDY/QGcuy3dSa7CPsWwKo9Ll01lffQ79V42zUu7qNIifS58WyOQC0FjpQb1p9SD3fgKYpNmHTi4V9RdeqtXkFNuOJCxxANMk/YAoV0n754HI9LsyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1DU/FQt4r4LUmizPfGqiD0X1Fus6EL9EwGLAOE6RAs=;
 b=ZGedaomfBIR+r+5pHgiq68uybS8hlikpJ+ma/aUXqb2/HWSE/r2emnv0L0e1ZAdIyR7kVEU+UDGZlZPjqlKP8JWEh/MaKOs7pWMjv4NUfD2Z0ZZ7ngB0dlEmTDL3IIIyrjN7NzdryWCNlnvAn6QJlMogLIfAgcc848kxlo4BBsQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AM0PR08MB11257.eurprd08.prod.outlook.com (2603:10a6:20b:6fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 05:10:35 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 05:10:34 +0000
Message-ID: <604e0c71-0517-4f5f-b127-4b58755527b9@arm.com>
Date: Tue, 28 Apr 2026 10:40:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest: fix wrong test number in
 ksft_exit_skip
To: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org
Cc: pbonzini@redhat.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427112447.147985-1-sarthak.sharma@arm.com>
 <7b424355-58bf-470f-ab5a-071ef9c5646f@linuxfoundation.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <7b424355-58bf-470f-ab5a-071ef9c5646f@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AM0PR08MB11257:EE_|AMS1EPF0000004A:EE_|AMDPR08MB11675:EE_
X-MS-Office365-Filtering-Correlation-Id: 3509f1bc-e334-431e-699d-08dea4e4a0b1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 5rYaZL+g3VdazbiG4LMPewfqYfIscI4h70hXF8gL6cv9LrSET3HL6iyRSqzCg+NLwVRZRCXVqS6Z6WfofYuR0+GvkbXLt2qz8DwHcoKsIZWrldnFdeUHxad0MAB3ng/gtmkJkYidkDH04jfNmRaP67Nyf2ZuHr/k+uahx96bJooBGVwMf2ugsBFNh3THvHRQPo/tnOJy8htQgsH5OaBjpMuCj1wcvUPxxvYv62hbs3ERceBsWFTxcSUtY9gEJxH6l9PT+lYUnnGCdnWN83WhhKIlp4y3lxsHabZTZqv02kk/AuUCcKuCdIsfvZhAfZ9cW5t0BBUhkEa7YeYNuVrfsQaqo0zrRW2E6HjSeYIcBxZmPOK7CCHGNgHVbyNLCglCrMndQD5moydc2SEiblQFpOG4JaAjioQO/fnNajpjeChAHy64O4sgoULnwMp1Z12Y8YtcaG7g/pwXvuixXu7FYdL/b23w384NF+8ZoGIHaUlxvbnYNABgUd+eXzU8HtlwlZcxJXfW9X9DMGqf7T7vSKev8KQISfMosLXPAskaHObrRh5/5xJGZEIAAeD30F/NDqXcgA2cQZzRhMkbta7D+nuRV8W4JWm9E+u3YwC6xREN9H2eyhaKAbJMWjtHCBorgZAdy8YRR9Bj9s+x5GV55WmbICDPTXDuQMb8+UUZuJsx0Vyy1VOhRWsI4iEAqDvY2DanC+r1ejCGTaxoHJ5dfinFbiAYeY7Gx11CREeep2U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 PiyoofmH2Zem8nc9nlQ8veACOFxgCeEGOZcths0+9t6aAVQOqk5iJwD9Jq5Zdj0P5IXcDRWcsxxVqeAzUfN5ix3mBY/vbJLXY/2p193VEGrECJc7Oz2N0Z1JVot29i0mYNQ+Rx/a/c+QrfEVmyfB1Y5P/euL+RBgvkzvi22cDrXCyrj8i2VHwpG6oXjcm3eKbPGES226a8zuqAiAEXYF8iFzaoB1SxdyZ2Lvm8wArmxlmy94TPPj7/QemVIcBykIsm6fuR7YBgV3+AbL/1eBTE+F44Vri/lIp0421lpDiSE0sOJKWi+S5wAMLPbIbt1vZLlavkjJnr7R99O6ZCwt4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11257
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d4255d3-a8e9-4ddd-0321-08dea4e47a2d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|1800799024|82310400026|35042699022|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CjqTDx+mmJPoh0cOLRgTQilyprcKLyt18DcBLdwacKStHdTu2+GZC4dwOBwRAj03dRP4DJ0BNUFHMaUy3hNznRyXLgDJcjJCWxHbrA1rYL+W+u82kNq48ets+YPdZX/YRnCC2LDGv4JCLhfnM0sC5g3qVkVnZQqwvFbY2opgB8X9cMjO20EAzi47YqFhn+Cj8Zk9inLODZa/qjnkPXhntWKFbLO6KmG5s/Huqo8AMWDrc20wBOhFEgjoknnu9CL2WkGS05uyYpTtF5t5/URgDO/YgrLp2LSG3f+cmSZVhioKIrUZEWYVwYP4vLRXYW22rhaWupw/BM3c9w0TwMJwlJs5vPvxdgZw3+10waR6e0qMOTbEsFpcGdYU+tX2CcuE4zCmvQV8hZmC+stPkdgpczcckeoeEdq7KZp7uAGj9S88StExdOweG9eee9zLdxeM4zzR2zgbjGqmsDAZAMbP+XCzzqeWUPac3SyEhtOSrN+bsjyjOGiAFROxDmcxu1YHq3xImJwIicNircP/cs0wOmUkBxvVoRV9hk+sm1av5kbnKK9Tcw7JbyqiC9mrAxYtF7WkI5YJ960TnTdJ33aNlkIQDXeLqYnxxgxr9ei88HgLD+bQhk0LGakKtrbAU4aOa3H8caqo4eqYRHMo6ePP27coOOJbwP/yDGLz0IW6ZRJ1Ypox7gWt/cif3XY+H2luovDyFg8vJY15Q8j2HBu3sPjnGHKducSMMveuv7CJWidHIA9AH2pjTlLrIfTbiXmZc1R4e6va8zYMG9j+KXk4KQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(82310400026)(35042699022)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sfuAoi5rR533naLhvcnjPY2Qh7MOQOwMJVPwiBQUFQg1Rhqw9XqUPPrwXK5UQyfMHSrQLr8N021Cy0Q0nFbv7k57hPqs06ZbkBnMIm1hLPhd+rb1qMGTwU1WbJGkczdPjW5OVB7qo24+f5BZ3KndLGwFO0DL1t0Ta+kb1tQNdT/2UdcKbtgrvcErxe9cDnPVs/Jml400INm5u08QiszjQfniZclWZsa09FG1daGGSNcnUNGMgc2h9Y3eGPoBefKjqqnDZ7jH6cYWITKWca/NdOV796rZ7TMTkojlHP/93CLJo0YUOaXrDJWzQqd3uFVjv+Ot4ZdwjFPS4QwWIwvrjXHddFL2jKenCEpALJJiLBnBXbeiNu81pnUAiurkPtMXR3AdUxGQzh3pT6uD4/7lzlhs1q12NaPLBprIgsstBUQnA92TBOhc6PmHEn1FbquY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 05:11:38.7767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3509f1bc-e334-431e-699d-08dea4e4a0b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11675

Hi Shuah!

On 4/27/26 11:14 PM, Shuah Khan wrote:
> On 4/27/26 05:24, Sarthak Sharma wrote:
>> ksft_exit_skip() increments ksft_xskip before printing the KTAP
>> result. As a result, ksft_test_num() already includes the skipped
>> test.
>>
>> Adding 1 to ksft_test_num() increments the printed test number
>> again, producing an incorrect test number and wrong KTAP output.
>>
>> Drop the extra increment and print ksft_test_num() directly.
> 
> I applied this patch to linux-kselftest fixes branch.
> 
> I ran a few tests and couldn't really see the problem this patch
> fixes with and without the patch.
> 
> Can you send me before and after for mm or timers test runs?

Sure, this will affect the output whenever a ksft_exit_skip() is called
after a ksft plan has been printed.

Let us look at acct_syscall test. When I run the test without root, I
get the following output before applying the patch:

TAP version 13
1..1
ok 2 # SKIP This test needs root to run!
# 1 skipped test(s) detected. Consider enabling relevant config options
to improve coverage.
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

where we should have observed ok 1 instead of ok 2.

When I run the test without root, after applying the patch, I get the
corrected output:

TAP version 13
1..1
ok 1 # SKIP This test needs root to run!
# 1 skipped test(s) detected. Consider enabling relevant config options
to improve coverage.
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

Since a lot of selftests are being formatted to give KTAP output right
now, this patch is expected to fix a larger number of tests once that
gets merged.

> 
>>
>> Fixes: b85d387c9b09 ("kselftest: fix TAP output for skipped tests")
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
>>   tools/testing/selftests/kselftest.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/
>> selftests/kselftest.h
>> index afbcf8412ae5..827b47cf4df8 100644
>> --- a/tools/testing/selftests/kselftest.h
>> +++ b/tools/testing/selftests/kselftest.h
>> @@ -449,7 +449,7 @@ static inline __noreturn __printf(1, 2) void
>> ksft_exit_skip(const char *msg, ...
>>        */
>>       if (ksft_plan || ksft_test_num()) {
>>           ksft_cnt.ksft_xskip++;
>> -        printf("ok %u # SKIP ", 1 + ksft_test_num());
>> +        printf("ok %u # SKIP ", ksft_test_num());
>>       } else {
>>           printf("1..0 # SKIP ");
>>       }
> 
> thanks,
> -- Shuah

