Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC926366579;
	Tue, 24 Feb 2026 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929490; cv=fail; b=FHbMnio0K/VW9UOKxnrwjQjMjDSYYHiDUGySUIoxG7STgFTDY2hBqJxnkRTJYdojIF/s5vpXtBWG3L7tyxWYOVf0ADZO+BOT64yL//y4edAt6o7ZOln2nyKkmxAi++ay9x/EzhaBfRtv5sntofYZTjOXENvjHDgwZMUrLLMfc0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929490; c=relaxed/simple;
	bh=v/9TMLwkPQlfiWoC8GkEDau7z8dCGQPwUjePzqLNPas=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=BnKnNXVH6Jt/J5x+/FKkkz8fYWJkA0KAwzF3Vb2QJxf9zVnbhaK229EtyovZWSsVoMWuEUlCZ6Om3EvXb0YmSiYPNegoKYzJ5FYm0st5PF9dLzqUobIu4zzdbz/NA6KRnuuA2hHGpwXIIaeOdOXR05kOb58JdcSIs6gdo+aorL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=elVsGDFK; arc=fail smtp.client-ip=40.107.208.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="elVsGDFK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX6MsVxtpJeAWl8yQK+XCKIAcqSgSA4TZeM3SzmgmBviRW+UuvV11m+CE8nbPphxU9spyas0FaElQTUD1R8O1t2gb5NWEX02Rg60aNYemN3S7fZ8NqJLKhH1FjzntVmDXU3SbHXRqTk89bf21l/OD9J28GYkWfFj+o7yi29QoEOvxIaN3DUuFWAq+coz3rhHnFbcdGK0MwAMM2sgMPrYOwq/DmR12zr4DgHF+xYbOTVk83mN3Bue0YfhCzvRj0UrYEKSRgO7JhabYDjXtajOx2aqH1kRnZQ6C2YkXPL3i7cejTrFTx9f+XQyPB3onQ15kWdXnzIfJsNY6u4jMM+QcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weL9m9MOiTxfnKqsoq2byGzgisox2tTknSIz03/5RwM=;
 b=AJKuCBjL6thtidotKyDx00xIUb0/5oK+e5Q/luPgasqqmJCgD92njsM/kt5A/fg53gto66/nX7jeQW3FINcVAa9R3cr62N4caJj7nkMrq+9SN87jT4gfYWmEu+trgFcSLUFaGaxFMTrCLgkmhkEwglxuLOtdgFmFtPoQTxzo1gOQue6+PYGt0D7ZJlfpGOJBhV5blmW8MKMwttQtjs+vCV7DwP+elRdIt6Ikj1DniiTtKN+0LFYWvbxg46zpXHq0EAxg1wkhhH5amc/P5KCwIc/GtEeY2S/g4zV9uVvLq1Aaxef2CUS+skuOelAgAAROLWq4OO/2ilLZrYdDF2br5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weL9m9MOiTxfnKqsoq2byGzgisox2tTknSIz03/5RwM=;
 b=elVsGDFKGS4BIi0rFydusQ6tlj1Nh06jAIB+w5Kot9MgujrZr2ka1LNRKf2SB/Sfffx/aWE36p1ekKTRT6HX2WjOaqw1e2DQQLsyomX/qg/8bIbykoSx40oV/odM7B+ccymTirbN/vAwZDnFgWYOP8qdNvZH2Mnc2It/QsxobfgN9QnRIt0yjekRAwXVzx+EQ+URY6IWZFy2kfoXyZtQBOaqIpF18agYvInMG0TRs4LdY33I4g9BW6Ey4Dt0CMNQNi2CNBdOvQTTg7ncuWI+WJl/kPbBCr5OUHVRMUmI9wzYgwuXm0vykuKQ1M4Pw8jjO5C8vNEaMzKfiM4OW2zW3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 10:38:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 10:38:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 19:37:56 +0900
Subject: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBCF4as0sxYDRFrrynuYpkEY7CykzWCJp
 uHuYvcu/5e8b4OETJjg0mzAmCnRHGvoQwNusvGBgnxt0FK3UuuTWOOa0I/Z8ojMou9b34Vgdec
 M1NPCGOi9g7eh9kTpNfNn97P6rX+prIQSzih/lgYd3s01ZvJkj25+wlBK+QLc6LqErQAAAA==
X-Change-ID: 20260224-unused_var_err-996d7ffa27c5
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: bf36f2b4-28bb-4e08-d127-08de7390ca97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDk3d1BwZEVnRXJMejFZa1Q3WkViQTFrOCt5dy9DWmJwUXpMYTdtWFNsUHFG?=
 =?utf-8?B?ck5LL0Nabm5keE9UeDAyUkF5OFJqZXYvQWxYbFVmZzM5WjdiQ0sxcGVMc0dE?=
 =?utf-8?B?d3RHNDVleTh5V05MUGsrWVEyMHhKRGo4ZUszMmJoMkhIY2NMckxIVGY3Rmg1?=
 =?utf-8?B?alhQcENhSnE4bWJvMkNScTNOSjlxdXVqcjdNcW5xQzNxaUR6VC92eU12WjFC?=
 =?utf-8?B?eUQyL25Sc1ZjSDdqSGZaeXczMXNQallvakg1bm1ONG9DVTNTd0k2cjdkVnNX?=
 =?utf-8?B?cm9oY3ZsNXA3WVAxYXhFY09wSE9LT0lHNmJUK3MwU3BZQnRaQTlBZDR6TlNC?=
 =?utf-8?B?UkcrdS9ES2QxRmNaN01HZ1JUbmxPQ2NoZTYvbW45UEhjYmlGQjdvSnV3SHdt?=
 =?utf-8?B?cEU5d3JkMVA1K21zUEpXUXlKSXEvd1NhMWthdzBNUHZ5OFFJR1pnK3FWbzdL?=
 =?utf-8?B?TGIyb0pzbWFhSSt0THQwZXVtdStoa2dxWDdiVEVRWkFSSk1Dbkw0b3hCb09O?=
 =?utf-8?B?cEI4L3pJQnkxVy91a2JDQ2JxaVdPTHkrTEJHeU8vbStOR0libVhTdjdORjJr?=
 =?utf-8?B?U3VSTEhJWU1FZ1hQandhdzRNQzhpRlhERFB2RHdnU09hTmd0c2FlUHI1aTZv?=
 =?utf-8?B?YnoxM1kzRkxodDJ0aE9HUVdpUEdHOG10cEJKTEFyZnEyMXJsNWxhbFFpLzAy?=
 =?utf-8?B?NHNKVmxkMzdVaTZFbldxQ3k3a2s0TWw3eHNGeDU4RDRKaGFzdVNZbUVTQkRJ?=
 =?utf-8?B?R2lrTWFDNjBRSFBTZkxaeTZKL2JaTERJTXFZUk1IWXJGeFpSQUY3elluRVN4?=
 =?utf-8?B?T3ZWSGVZNit2ZW5uNSsyekdud09ZVldoZEtFRTdiS0RhNjBxMERMZlZxRW9O?=
 =?utf-8?B?TFV4T0ZsaG9RZGw2OWhQL0ZrYi9DSm5GWXZNN0JubHN6M3R3ZWd3NHp4YURW?=
 =?utf-8?B?ZUJEbVZtN2NUTHFGOHNhSmFWekJNc3pWNjZsb05oOGpEWWVQOFc4VDlDaEtu?=
 =?utf-8?B?a2FHZVhnK1FKWXlScXpCbkdzQ0w0eVFiODJINUtHTzVhOXEzUXArZ2FWSE5G?=
 =?utf-8?B?YnRsYWI4cFZCbWR3ajd1Ulc1SUJEbUpob1ZsZEdmRjJPMU1QdEhlVFdpbDB2?=
 =?utf-8?B?MXBpbXU5dFZzNzRSSERNNFF4NHk1TkJHVmxCWGpFM2Zrc2lwOWhzV1JnVHlI?=
 =?utf-8?B?OVd6VStMOEtSWnlHTGVIUzRSaEdHTjJmTCs2R2luNkpUb1hTZWoyYVcxb0F3?=
 =?utf-8?B?Z3NmbklhZlBmSUVwMElEbC9kNEpIRTZ2VGk0NnNVMTIrb2N0NFVRQmlERVBJ?=
 =?utf-8?B?czlpUGQvNDRmNzZSZU54MDJoWHBNVDFCUVI4dTJmRTBjOERuM1YvRjlCTVZW?=
 =?utf-8?B?QW5zTlpsMWFDOTdaNkcvRkQ1L0lJZmI3Q3dUQjZiSU9zMzZlZ2pOa3NVZWNa?=
 =?utf-8?B?TXExdytGd0xpSk1jU2xPbWRUNUlJQnNVSVNleGpBVlBKNHFGV3Y5NFM5dzlw?=
 =?utf-8?B?WjJDT09iVjFZeTB1MXIwdHhCbCtNaTBnQWN6RXVEZTMyUGVtcWpabFVEeHFT?=
 =?utf-8?B?UjlMKzlSWlRLT0VtcmFWUzBPR2R2WGhkNzIyRkMzRkZpZy9QMmdBR2FYQzR2?=
 =?utf-8?B?WEJDSCs2aGo4dkJ3ZjhQRDQrTzF4TnZiWCtIUmJBalFPWXFJU3NISDk3VXdy?=
 =?utf-8?B?RHZWRE14L0o0NUpVTnNieUdmeXhOTDRtRGtKZzFteThqWno2Sm5YUVJXVUVF?=
 =?utf-8?B?Nk14djlORWd3OTB4QThzS2Y3WnAwUHdoMWRqdndiKy91SisxVkNXNUk4aEtt?=
 =?utf-8?B?L2xBWUFyckhaK213RlgvbzBYd3JtWThFSnNtTHU0dHVVZDZCT3I3YWs4Q0Qw?=
 =?utf-8?B?S3dxTVZtV1dJNXdic2VBR3grc0Vvc3B4MGJ4UDFET0hnQ0x6N0w5ZUVLbEdW?=
 =?utf-8?B?eWdzekREdzVJRlpQeG5WQ0Y0dnREa3NLQ08vZFhiOUhzaGp1dm5BSzErUGND?=
 =?utf-8?B?RFA5NWpraS84ZjloT0J3VkdWajE1a2Nqb2k0Qit0SHcrWUpxVmZTZ0lJRE5n?=
 =?utf-8?B?YnVzZ3pSamNjZ3p0L2JCWmFuY3hvUXpsNmphRmtJa3pTR1VWYWRVV2xhWUN2?=
 =?utf-8?B?YTBib3VjY3VLaTZaeStvZ3hDeWVlbVRpaG5VbStMOG0vOGovSkMySmlvRThF?=
 =?utf-8?Q?2ZtfTVNq7+b9Wl06tTc/LFs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzhxN2RkRElVeVBhVU41bENoVy82cno2R0FPR0RVank1YkdXYmI5VlY3OWlw?=
 =?utf-8?B?VGRwT1pQbmlHWG0wbGNnaWs5NHNPclFKblg5aEdGZThSdmRKNkw3N3B2T1BO?=
 =?utf-8?B?b3FXQkFJeDBtNjArSDg1Y1Fvb0xaSlZYYnZ6cmo4WUJydHBpeEErRzFxUmVq?=
 =?utf-8?B?LzdTd3UzT1VtUWlEVWcwcUV6YUFlZHdmV1RoSjYya01GbDFVbVdndGhRY3Bo?=
 =?utf-8?B?eWNBMTZRUmFkZ3FrU3VybGNNbDVBK3FoVWlpMmhqRlhJR0daNnZUNUxqV1B0?=
 =?utf-8?B?Qk45OGNydjhaR1FjYkgrU1hSVVRaMHk5QWluL0EwYTBTbzJOYlg5b1ZjRkxv?=
 =?utf-8?B?VEtLVE9Jb2tKK1pianVJS3c1KzJRTVJ4T0JGVUR1QnRLSFVINi9WOUdLT2Zr?=
 =?utf-8?B?M0hackRPN3FTNEN0M2QwaHkxZGVZaDhOYjBqNGtabGNqa0RXSHd2OTQrczhp?=
 =?utf-8?B?Vjk5YmFDQitsVTBLeHA0U2tJUGZWZDZTZm5ZTVRhdllLeG9aS2hjMUczLy9T?=
 =?utf-8?B?cFM2UVpUSVFvU0JsYlNnSlk1SXlPbWJQYXBsNy9PNmdBQUo3b3h2WXo3TUJW?=
 =?utf-8?B?OUJIU1k1bGFtSWNSZEx3NFphcDJxNmRaeVNtWGJqZmVFUGk0Y1lkbXB3YkdV?=
 =?utf-8?B?UG9JbVl4UHpEVExJWXpaNFIrcW0vSVlkbjRXTFlIK2x0b3A4TjVGdmdkMzdL?=
 =?utf-8?B?aTFESlg4a2VxeFZ1OWZpNEhYdk43bFdNTU5LSnVzS1p4ZEMyRm5hZ3RKci9r?=
 =?utf-8?B?YndCWEVXZWYxSzFuVFRtOXgzR056R28zMXNSeHF0SGJ0eTRIWTBObk1kTVEv?=
 =?utf-8?B?a2VlSDJZZ0JkVXNTT29aU2lWVjJCNzVUcTZjTGlaOU05SWc5S1pHVGlzSHUw?=
 =?utf-8?B?VFgwemZwWnUrRVdydFUvNWtIQURNY3krdWZ2NXRYaGl0RnA0cHI4N1dRQ1J4?=
 =?utf-8?B?ckpFUnVEZ2Y4ek1IWFdmVk1TM2Z3RmcxZmJCK0pPYVVic0F1M0NJNFdDclhs?=
 =?utf-8?B?MmNFRmpnNGRrWUtOVzdIbUhWVXhxM1dkbWt6K3hVUzZsRkVpSXhWa0ZmbXdk?=
 =?utf-8?B?LzZpQ0tvZWtMOEtUc3ZYSS9RWHdFV3QxSVdjVE9tSjZIdWc4MlZRSWN0V3pt?=
 =?utf-8?B?OFdkYUtuZ2FIaDhERDlmcmhPTG95ZmFlQURIWitOaXl5QTB5Ym52RUk0M3pZ?=
 =?utf-8?B?eTEwWVdDT1drZzJIb1hZQWg2cjIxTnFjL2ZCYmVKNFBuRG8xRGpBWGh6THU1?=
 =?utf-8?B?SmMrR0lGY2hRM1ZpSVFyMzROWFhZMlVJcVlDVEZsMzFTV2RiUWh3WU5YNWQw?=
 =?utf-8?B?RlpNb0dQaDBZcTFnWEZWMXBSNXN6dXdSM01WVGtEbU5qWkxHek8ydXJ5cFhI?=
 =?utf-8?B?N20vN3NlczNIdEVPeC92V0tpQ2xJd0o2RUV4NGRZMk50L2l3SmFQNzB1Y1NR?=
 =?utf-8?B?ZFoycnozNGR5bnpXUDluSC9DU3gwb25sa0RFN3Rma0RjV0JKWWsrUzNqZjdE?=
 =?utf-8?B?MHVDNkFQeDMxenM1alVoVUlKZnkrVldFK0FvTlIvOG1KMzVUbHVJSi9EM3R1?=
 =?utf-8?B?WFB3cmg4cWtldkg4Y0ZSTDl5RUVKQXIwTGg2dzhqS2hPUXdXY2xSdEdRa3NK?=
 =?utf-8?B?VmcyVFBvdFdodmMvaWU3c2dzd3BCMXNRZndXeDhjYUhKSnBPMTIwR2xCLzJQ?=
 =?utf-8?B?WlZjN2oyWlRJb0k1SkZneGZMSTlFWU14cHZvUjFQZnQyTU5kTlpRRzcvYnBB?=
 =?utf-8?B?c2I5bWVPbHJkcFNkS0N0N3Y2SHpRZWxiandmS2hBbUU2UERUMm85SlpnZ3NN?=
 =?utf-8?B?ZkVaQk9QYnhsaXdlaVI5SGpRcEVUS1lMUHRYb1g5SldPMmptK0xSbXk4aWxo?=
 =?utf-8?B?R3ZnS3RnMU93UmUyZEFYek53Zys4OCswdFd6aHZnVGlGM09MblQrNXVNdndL?=
 =?utf-8?B?WlpMaXZtemRIVGZ1NWlucHd5a1JVNGVENEt4ZjRjR3FweFNhN2t1VWRhN3J3?=
 =?utf-8?B?clZPc3ZITGF4OUNlODhzZ1B5VTg5RFpmN1ZoZ1E0Q0cvWmp3ME9hTXVHREFC?=
 =?utf-8?B?ejlQS2U3VXRDeWJtWjNVTDlLZGVETVg1VEhmTWw4dzJMdVB0MTVYb2ZUNGl4?=
 =?utf-8?B?TTZMVCtWbUh0dWd6MXM4TFpEbXRscGpvNGZ2L2ttK3JGK1BsZS9Ic0YycmQ5?=
 =?utf-8?B?bjgrSWdVdUVhV2RKb3JUallGM0t1WE15RjFMQ1JpYmFtT3hjY0wxbW1pbmdq?=
 =?utf-8?B?V3dmOUt3Mk9pQ200NXdNV25aWU1ZK0NBUWhFRk96YzRiY1U4ZEoxZUV2bzQ2?=
 =?utf-8?B?UHgxYTBlQTJyLzcyT2NacUt3THAzNXNQbi9YQkJlUytYb2w1OTB4SGNHWDJM?=
 =?utf-8?Q?EjxOrgzgkjp2GQoz5ma8goCZQoR6dl8O88yoGEk44CXY1?=
X-MS-Exchange-AntiSpam-MessageData-1: f/CjK5c8R70rcw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf36f2b4-28bb-4e08-d127-08de7390ca97
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:38:04.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJre5Fao1lKTqwR0HsHuyoUlXqFU1xSMY9BxEaDyNeUeA26Y9SBaEHUAaiNaDBpw7On9XvqGgPgaFWwAoyr1JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878

If `CONFIG_PRINTK` is not set, then the following warnings are issued
during build:

  warning: unused variable: `args`
    --> ../rust/kernel/kunit.rs:16:12
    |
  16 | pub fn err(args: fmt::Arguments<'_>) {
    |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
    |
    = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default

  warning: unused variable: `args`
    --> ../rust/kernel/kunit.rs:32:13
    |
  32 | pub fn info(args: fmt::Arguments<'_>) {
    |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`

Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
is not set.

Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Use a no-op assignment instead of the wider `#[allow(unused_variables)]`.
- Link to v1: https://patch.msgid.link/20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com
---
 rust/kernel/kunit.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index f93f24a60bdd..a1edf7491579 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -14,6 +14,10 @@
 /// Public but hidden since it should only be used from KUnit generated code.
 #[doc(hidden)]
 pub fn err(args: fmt::Arguments<'_>) {
+    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a build-time warning.
+    #[cfg(not(CONFIG_PRINTK))]
+    let _ = args;
+
     // SAFETY: The format string is null-terminated and the `%pA` specifier matches the argument we
     // are passing.
     #[cfg(CONFIG_PRINTK)]
@@ -30,6 +34,10 @@ pub fn err(args: fmt::Arguments<'_>) {
 /// Public but hidden since it should only be used from KUnit generated code.
 #[doc(hidden)]
 pub fn info(args: fmt::Arguments<'_>) {
+    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a build-time warning.
+    #[cfg(not(CONFIG_PRINTK))]
+    let _ = args;
+
     // SAFETY: The format string is null-terminated and the `%pA` specifier matches the argument we
     // are passing.
     #[cfg(CONFIG_PRINTK)]

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-unused_var_err-996d7ffa27c5

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

