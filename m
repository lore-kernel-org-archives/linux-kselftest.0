Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653D3CF69F;
	Thu,  7 May 2026 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154189; cv=fail; b=fs5atpWeUQp8oHNrjGxjwGH0oH+IrE3PaR1DB12BTOZMiC8qiaODk7Zimtb9Xp8+NbaRfJ7lKtvMVSkpIqNqb2HEEa2stOkzJhhteX5SqRvMiFaXwZ/laFoLAiFZUdZ641NMQzO1U21mWD0/wshw3d9FwpaTG3toQ72m3qeLseI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154189; c=relaxed/simple;
	bh=LCTxi2ucpJFEPoz5P7vIvi2D1R390Yuhst5IoLWrwUs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u8pPNGGq7Y/yOYQFU+9hCvZ+Nj7OkySmtmN4CRyDclrmkXgH//EMXODAkoiIXP8WQQQnOHp+QWkSpMi831yuj4GEpB/Qrn/DhzCObBYDlFh2BTrMyG1ME3Clj7nNC/8vK75uA7J/8YjKh6SqxnxjaRENY7mdPlWTNgeXcEwa+9s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mXzTaFaG; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mXzTaFaG; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mXzTaFaG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mXzTaFaG"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wszSyv7S0heDhGsg4wo+XhWs1c9bqwE4C7/rjYLf3mUXiG8IeODdVd0/LnE89bTGNbNbqMzRQWwlpXpLWZ4HKEs9WQH6bFMkELerE7V3ixB7Z5fSXSHtgUxgjXOWqf4U6ptN7DCxBXt4NcGEXCkgRNV2jjd/UHATR7Pvryfp3tbdl8ECEQopipg2UCJ/yhYPUMxPhAJ4RVbS5eknUvQarThUsCGWRXM7YcaoXsgdy/h7k7RXi86Uc+Q+AS8HcYMwclPn15E6ZycZ7/lFJFgjkIMCKXMIcogBTFzaQH7Eu0LtD2ZYgEfT1GzHDZxKKQhr6z6mHoajFcH0RJAzkAIdow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfXWfESgLK8Z15evNQYqARn6CW2kf1ZFmevTGKKeBoc=;
 b=wmeparRROHKlzwurQNdlLkZlwXf15UsnII1BAtKGhu08XUsruDuFhxP08a2f+6pyYsyC+EuYrCu09JkY/zMsyhkDhnSoJInC5rEG2zZP8JQKcnaccllFgwud/U5rXK0CnfACx4zQ0qrWuBFy3XKhYc7b4rlJ1f5HHgu1VaBMiOCU7UlPbqm40lLveaiTqtduDNyF0PtSZRT0yoYlV/6LzQ4rXk1OwBByxzviy9p4TXOD/VqmmkHTc5hdfclSb7GbGhMVje9kQAJlDeL+5ubNbn1i2A2CfbdOWYwJuTQPyZBJJSE3J1b/mcmFmUj/QXB5eajOzncySQ4Z0CzddhlhFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfXWfESgLK8Z15evNQYqARn6CW2kf1ZFmevTGKKeBoc=;
 b=mXzTaFaGYUC7D4E6Pkbbhfj0x23P9TSCobJteEEp/WyFMjwPFT0i/C0VwDWxosgQIYncy3Iu+aAGmipExKOZacfxXiE6ZuE6/WY2n/JJDCpo4e+9ovpMUKT8XjwvLFT9XruMr5YAdvqKsURWVYMW+PoWGyV+sXOEpDNyTV3SSDQ=
Received: from CWLP123CA0234.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::9)
 by DU0PR08MB9300.eurprd08.prod.outlook.com (2603:10a6:10:41f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 11:42:58 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:400:19f:cafe::40) by CWLP123CA0234.outlook.office365.com
 (2603:10a6:400:19f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 11:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 11:42:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tokPvvzatIUBpAoXKHVYdWKctF70F1lgk5PJ+6tjtTAS7uvfSxiayK8pguw/AVwBECGvbC6jB3ySO48CDUuZ3zF9K9FSOhV/R+20LmOH3iAQj3lX7qaRjrxmxoRUMlmNU7Aq5RPIKRFSro8Dp90phL1/BgfZi4Kzg4HSsGAZvjbxihX9ZnC5gnLgQNEh2KF+ITpEw1LbdH0B7RA8vMtkyHPHEerV7IMs+y2AWOIS3CAHEF5div2CF+ujznVD7tjvJICjulayWV3mO/SIUMskanlNbR8yJ1aOYgB2NCxUZ5Fgnyi/m44k5yFiFYohmt0B2cJbQrISQs5BJirlzZ+rEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfXWfESgLK8Z15evNQYqARn6CW2kf1ZFmevTGKKeBoc=;
 b=SvBo6cRG4qOkv449fsrJjem8Zd3LZlv+VpcXj8LSFlMu7LP2Rnx0g+dBb/Wx1afdMA3cKlJntkdAi7RjwwkO7oC4Q/fYHH3mMtlyCdeIm5ITZxWj/fdP2TSYvuqSG+7uP+mWmZAagHiiOnnaRzlQjEZNl156i3CKgoFFJv1HwvFB5fJJt23Xk6Rv08XT+zTkWzh1YWklYrTxEat0PTGQHPYeSJzNx7sKpvPUOKFxVYp2jGQTuekKnLhLo+S7pz7UGG3caPF1UQ2nxojem+64GRG/h1DMLpX2qrpqdxi0zJ1JEIzdhbIEb6QsFGikj3hvh9vyE6iMSUaEx07MLNuBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfXWfESgLK8Z15evNQYqARn6CW2kf1ZFmevTGKKeBoc=;
 b=mXzTaFaGYUC7D4E6Pkbbhfj0x23P9TSCobJteEEp/WyFMjwPFT0i/C0VwDWxosgQIYncy3Iu+aAGmipExKOZacfxXiE6ZuE6/WY2n/JJDCpo4e+9ovpMUKT8XjwvLFT9XruMr5YAdvqKsURWVYMW+PoWGyV+sXOEpDNyTV3SSDQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by PR3PR08MB5724.eurprd08.prod.outlook.com (2603:10a6:102:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 11:41:52 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 11:41:52 +0000
Message-ID: <b1213e99-c7a7-438a-84e8-4466e43ca003@arm.com>
Date: Thu, 7 May 2026 17:11:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 45/54] selftests/mm: pagemap_ioctl: add setup of
 HugeTLB pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Luiz Capitulino <luizcap@redhat.com>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-46-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260428204240.1924129-46-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::13) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|PR3PR08MB5724:EE_|AM4PEPF00027A6B:EE_|DU0PR08MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fb0289-07e1-485f-8152-08deac2dc8e3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 5ofj4gxEXjZN7ThulJKBzrNv06hiZgpKoYP6LRAJBU4/JvF3UVL80vPYGx4bfLQDLOr2vz9THIM8b6o0p9gWPbADRSavK4yVgzNLAbKi1BZwS0p+8IAatS07f3ivt+zjQknrOz0Vhu1sY/EC8yKR8uSpQsp46k2nx1AVo+ooEw8prRCbopyHn5WpCcPTtd830qwLFltVbol8ktzEAaSwP90I9R8utJd9l4giJ1Hr0YnxcHWbfi1Gi7/RkiVNVCUjs8gFlKMSF8T9Zh+N0DgWGX9Dj4wlLZ4CRjNAxMFeCjcCMNNrZg+0AYafnNd4juIOVBrfK1AThjPrgqdpj5VxHTF/n0Lw4kug9d5IJv+HvqLVclWM7EOdJ2RnCml7+VwFMHMaU2PKVsX0PkbrqFwgKvSPjt+ej8xKJN3pIW2FfQVhyLVpwL7dLPzp0Z6MteXCrcQ+7trIr8NlahSKIF4+xIVIIm6VvrWzzfbHQJoJXsy2yLQOGxk5TAc1kgL9l1Vpy26ZWdvhMtS25r2dfXf9G7rfOrXYCYB9JvuztJIW8qsdvS2q/EnRq5ZcepFJffXh/cMczniQ9UUIMfrQO2a2L+4msGUVz7cP7NipRC6aahIBMILskNw7xJoVVPVQi6Gtfaq559Ky6RlQSWSrZ9jBHYHQqxa4gtfUqqMWkYLJlL3d6KgQOf2UPbacb6u/tyEp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 BVvmkQ6AQMyvx8f4OivxY9ZcRRb2XYt/s+sTfE9a0tJqk8TZes76Og2EWqs2M1z1lyRr6OdaBojbCeRTYjmazeLLAwyWA3kPY0u2kHoHnfm334OV7khIjlSD9bo6YeAG2MnJ22oxMWEnlI6qjcAFyrPM8lOBS8Ge9KWT9H5KECUkDqYeEDb3KixrqegDNK4+b/ua36rkMcmHwH2F/Mkt3uz7l7L5ehQQz85zAHu4f9jmNyklaC3M6+nwBPqIMgImKSQit72nWEdq/in70onaZrsnYgHdeoMqqEwhJidkI3vHobPItytXiTyEkVgi62l0wSYdT8cgQr05jEsyFvqQJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5724
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	578ea456-bce1-49f6-69fb-08deac2da1db
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|35042699022|14060799003|7416014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WnLieDoA5RWVN5VoWa1WIsTEPF/doX+6Cw64vUr3lOrPFDXd2Jnu3nfmIFXJBFh+EBC3hB37LMORJ+bsJw+RZ77W61APEf/j3GbhOPMiz9+WkjOCF4+k5dhw+voVis/ICZN2x00IOQ4Z1zTTUfWjOfQMHup/m6tLuB0L/FstE6jhVH8lPfWXZbunB+hGIyPVN0QSPqwRD+MoPtyFoAM8yKuP1PUqTl0t05NgnhS0RY1wE1sUaAs/vakIPUJDiJlDHWjVNksMvRkUIPSHHClJzCwgLQZVv/Bw9q4rTki7NmIIAncKGIFaPPqe90TGxPQK3H1yMQHFXuo2SEf9CD7+Vkg4BIvQwbf4HTTThpe4y91gKFsD4xf2wVzTnVBpJXYz5s90i1eEmXME550ImeW3a41dhSs/MWJ4jI7qZhIj4O8xXn2xWSZ8tcQmbhiEy/PKXBRbVqjmqM5tDu8gbpZZa5uYyovdYjqzGqL7raHzX1XqXkq76wpb6d/+8De9gYhhyg+Yql03y+AJQZdFtYcNnXgjlFx4ZURWwzEaxS6nDcOsDwBvu44sY33/3SZjweuN89F0tvQhvlipjVVRPnsPgmQzSk8utp0AR9NpjonL1+3YG0CThJ8d/m4TIwhneSR9b+Nk1UFp0Rx89zkT6iqarXeO4xBMSiUfXeOJFnum14JzJ1iTGIWYc7kFbrrV688rHuQpUCNj3WzF3ikLAFUE32jxbprQ3VTRjNmR40Y1Pio=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(35042699022)(14060799003)(7416014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/wBTGDnufF5iW3MXVR9w+MYiubAZkwAG3Gr5rS9SHoYjvPRbJrwf8oUhK1qj8YABCI50nZMjVMP2ErLbDiCkYPx6+mTqunY4Exnu57tjUUuMJ2lyE8IxVYI9SRLDsYPO7JxKdWTu3pKEKJmC0+jqstkbvEyWEXkpp6KfqPN5STudb+73vD/oiKODH/PMV/aMjQvk/a6/a4We5L8G8kqXBezciRCZUZsAFiJMwSRrCXgVp4qca2KsRqqY8WZetvhGjMVvD6/K8UjR4Am+QtBSk6NlfVu74Fk+WrHp6RKKqDnxe4r/Jm1K1Y3WImaSlADFcGs3gnBzqSq+kNi1eKaSZ6CLDoMM1deVbb11gZuS6Wdphu737JWAl9Ciyi8P2niCqxV4+xphoF9VyoZ1MEm8UfY8uBJ16wzHWLG4HPvFFnKV1JFkMgLPJD0L1fXGdGFU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 11:42:57.6022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fb0289-07e1-485f-8152-08deac2dc8e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9300



On 4/29/26 2:12 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> pagemap-ioctl skips HugeTLB tests if there are no free huge pages
> prepared by a wrapper script.
> 
> Add setup of HugeTLB pages to the test and make sure that the original
> settings are restored on the test exit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I have run the test before and after applying the patch. Before the
patch, 18 HugeTLB subtests were skipped due to no preallocated
hugepages. After the patch, those subtests correctly allocate the
required hugepages and successfully pass.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index 7f9428d6062c..e2c62cb6978f 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -7,8 +7,6 @@
>  #include <sys/mman.h>
>  #include <errno.h>
>  #include <malloc.h>
> -#include "vm_util.h"
> -#include "kselftest.h"
>  #include <linux/types.h>
>  #include <linux/memfd.h>
>  #include <linux/userfaultfd.h>
> @@ -23,6 +21,10 @@
>  #include <sys/ipc.h>
>  #include <sys/shm.h>
>  
> +#include "vm_util.h"
> +#include "kselftest.h"
> +#include "hugepage_settings.h"
> +
>  #define PAGEMAP_BITS_ALL		(PAGE_IS_WPALLOWED | PAGE_IS_WRITTEN |	\
>  					 PAGE_IS_FILE | PAGE_IS_PRESENT |	\
>  					 PAGE_IS_SWAPPED | PAGE_IS_PFNZERO |	\
> @@ -1554,6 +1556,9 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  	if (init_uffd())
>  		ksft_exit_skip("Failed to initialize userfaultfd\n");
>  
> +	if (!hugetlb_setup_default(4))
> +		ksft_exit_skip("Not enough huge pages\n");
> +
>  	ksft_set_plan(117);
>  
>  	page_size = getpagesize();
> @@ -1605,7 +1610,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  	}
>  
>  	/* 5. SHM Hugetlb page testing */
> -	mem_size = 2*1024*1024;
> +	mem_size = default_huge_page_size();
>  	mem = gethugetlb_mem(mem_size, &shmid);
>  	if (mem) {
>  		wp_init(mem, mem_size);
> @@ -1633,7 +1638,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  	}
>  
>  	/* 7. File Hugetlb testing */
> -	mem_size = 2*1024*1024;
> +	mem_size = default_huge_page_size();
>  	fd = memfd_create("uffd-test", MFD_HUGETLB | MFD_NOEXEC_SEAL);
>  	if (fd < 0)
>  		ksft_exit_fail_msg("uffd-test creation failed %d %s\n", errno, strerror(errno));

