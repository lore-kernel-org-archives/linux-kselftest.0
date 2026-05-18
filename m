Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5393DD848;
	Mon, 18 May 2026 06:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084702; cv=fail; b=qmslEQIWehPfs5sY2+uUzJe+V8FUczA3sdFlvdukfTHTeJjMK09jR3oSg5cvFRFo1/9wug4u8S4H5NaJUVuEcqGq+7cw3QV4bryxk+2K5fG0ROD6zsJLU1zAcOT+iqQpAMzvqKC2pxSFWgZvpwQuYBTATnbjr+P9Qr1oNwzFUv0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084702; c=relaxed/simple;
	bh=LYLHXgQYzhBvOY/V6T8HSeDGFBPn6qJF85ZEH1XMjpk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qNG9yRWB6BvYZ8sSV4McErH6FTp7vy1kyKkRH7kJIEI2++Y58GzlF0UoaC0BlTjagsXUaSMxt1Z8+Yt9GKi9VgG0eWqGazr/4lNj1uA9m4yFMRgMT98N6imBicEEBXxBx91mmV3JNQD78ocmxUr2B5gwB7FA6RXyid9ex8RxwxQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NSg5v6AD; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NSg5v6AD; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NSg5v6AD";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NSg5v6AD"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VUSpM1PjaR3902Yl8PFIcrBdipiUTlXdya++QxYvWLxXjsozv+FKhxdh+DFelHGLiIDGR19b2fjY3vUGNt+yrx5k8/SRFi4utSdGaxd9Lh+dcBJ91LoSLrJCzASybZW2K/UsSP6sFfZBlL9lyCsIOi8vw+4EujxmZv4858/6PTXE2r4+0vge7t0Xt+7ucITlr0WbY6p2IONX0YI/5gezE+05kr6j8hcyCGlseU96xXJo1u+2rE/r+31uHrBcOsxnbXcpxywp9J09HMMHvwSiZfxt9ovNXWl10cXRTxcCZupRKTalXKQKEEI7wCQJD9rbBGVoaAyENC5djrvRBCWLPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm1Ru7wgAkVP+z567ds8K0g1jpbm0Jajr1VNx1TNNTE=;
 b=IFKWo1VR2Q8JGUmdbftEOzb4aadPdbCA3YMwGwV5sNlpbA9pPEbgR6SPDzqNwZ2HrUQhl+oSVjGMup6BNE0vyO0Xy+ZWoOMvz2YzetLWEEwMdolt65kksn69BNj84lKK35F0ywDbZv7RgIunbIqo2Ggh5Jr4gkrH2kxCApgzLf1dl7GQBe7DTCjmh+BvOv9Qug/RwMNozUrSu8Wqm59L9YehAwrj5QaTV5Uy7DrX9Fn2rvg+5xDeDPxeo8WpPqdhm1Xf2l9SDNagm98lBU8IadYNLXOr7oZaQE+hhuGZU3NA24cxzaVCq3p63RPN5FFvmITdzljAfJ4fLnc2BLzfSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm1Ru7wgAkVP+z567ds8K0g1jpbm0Jajr1VNx1TNNTE=;
 b=NSg5v6ADSqTA1wD8RCmHO1cUL2ExrravcdrWivbcWCqCJWTvjB16Sy2e+KHgyVJ1oQBgNGu1rQyLrFOsx+fc7fkc7K5QxnWdJLaUcG2WDZS2Qq4O13gRVeuNeUp2atxN+AWI2YFGb81hq4gAWhrba1ReerDXp/jdWK0yJkVwYks=
Received: from CWLP123CA0072.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::36)
 by AM9PR08MB6065.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 06:11:25 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:401:59:cafe::20) by CWLP123CA0072.outlook.office365.com
 (2603:10a6:401:59::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 06:11:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 06:11:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJWwY/BUhi3lwdX9ax8Sf5zl94njXa6uKqkBaJHB9/52UcZSOHsRw1gw9xZLMFmMB4xzVJkJEZW4yhZRnIbXI7/WDby9nIy1lqjQ/tM3EvD4SBuTJJAfHZ1b+JI9hB10w4tophQ23eRMUwnzkrn1sGAXVinCJDNhv1kkB4HgZuukVgNFCL04RJLhRjGL0nF/OWAbUwH08Upxg/OQrCVi+q9kS2DHiNJNUh/4b22OqVqwl2MIfU8HRsm9hF5ZHdk9kBS19S142P+hnswc5yVQJEmXAA645MKeydot3KrdNdhTGWxnHP1ccWt9DLG75rVYPKtXU0e2rw6BJu5Qb1GljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm1Ru7wgAkVP+z567ds8K0g1jpbm0Jajr1VNx1TNNTE=;
 b=Gn7C6pNFfY6Opc/ceScOsl1kbUPD/Rm6REzCMq8s/WgMY6oa4uvPLi4f8JK/c61B5ZilQqUPOF8Rm+r5Bz/pDkZfJ1z7wiYiV7aV5+kB14TZfq6gZOU1A4pMdCNaEZM4rgodSCdskfVoy425LFZfFgdCQ9cQ+mA0//Dgd+0KqHSMdBB13OdE7HzzrBDqx9/NR3pm1dzEEcsOdR7HPH/21ht3gpM3/FEfVV+gyR8KPEVnNKS+tydndNT37qV4cXI5owKne7uFWheg5mUubcdhOwWT9JjEWWeRZW8EPSkHFTlefC14Ow2PcWm+hmrnzz3XUy+K+JGSJhPInW7NLQV+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm1Ru7wgAkVP+z567ds8K0g1jpbm0Jajr1VNx1TNNTE=;
 b=NSg5v6ADSqTA1wD8RCmHO1cUL2ExrravcdrWivbcWCqCJWTvjB16Sy2e+KHgyVJ1oQBgNGu1rQyLrFOsx+fc7fkc7K5QxnWdJLaUcG2WDZS2Qq4O13gRVeuNeUp2atxN+AWI2YFGb81hq4gAWhrba1ReerDXp/jdWK0yJkVwYks=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DBAPR08MB5846.eurprd08.prod.outlook.com (2603:10a6:10:1b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 06:10:21 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 06:10:20 +0000
Message-ID: <3f92ed55-a2d2-4f14-9b75-2b218d3e53e1@arm.com>
Date: Mon, 18 May 2026 11:40:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/mm: rewrite gup_test as a standalone
 harness-based selftest
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260515084840.174652-1-sarthak.sharma@arm.com>
 <20260515084840.174652-3-sarthak.sharma@arm.com>
 <c99048de-1e2a-4c92-8589-0abba45bcc29@nvidia.com>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <c99048de-1e2a-4c92-8589-0abba45bcc29@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DBAPR08MB5846:EE_|AMS0EPF00000197:EE_|AM9PR08MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 84789d49-0efe-49de-a52a-08deb4a44aa4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 qIWp18bLiF2W+rodOdH6N314YKUxxW9+XD+YD2qu6ETjt/5idyM5J3fWKMmd5jsiROdhaNrMKKtY+3trvwcfVdlFWit/XRqpcrbrcfqvTYreJEB3ZRat0Cyi/ulH2fImEMKnHb+2xmMPEUKHGOH3QLgpeddjEzVpd/q2sLjyOT1tXrwS4Cx7kBJ9Ymv3D45MNqZ7MUBSsDSUlVwmL/MJIPWD/Ozb+Bku6e3OosJiRET8+3BjksqSNg0LaiFUWkteHxUSfoDBuKblOsSDRg3O6B4TF+9juM9wnevXBeOmciM9sDAkfCG/LEtmSMcQfSitqcIuReHdwY19LdKp6FVNqgu9PAF6Pqy8NCDCb1vONGiWJhTYeHCbtTgsSgrKJRsDXjx0gMzVZwdwICH6cnT4+/PvyM7pyrHyGHSYGsPupv4x5FIgg2f8f8A2bzEyEvE1xH5Z14XNuqtpQ9no7SluRevrcdVCpAZ3m9+vvSGNzlDxgu/W5jdK8BD9TOGcoyTOSILRxkaN2MgYPlDMZwN/75/9dTbpYdX7dyFtYlcXxqz7uIPthOwWiMcBEQFQe9Odgk3cdAEVh/FSfEnSKrRMR6TDEF/sDLDNahQ6ZboLLiYe1/QYdhr59lgh9VY8xFh2oZVrCg9i2HBxwVEFFcKQdQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Ne9SFKkeINw9ryZQ538ZejoBILMl4yFPcM5sfIK1quTUUEyNqFghidiQUg2PuhHJqZQKkBh6ulCt/mwGnNQOQtGFj5NY2Jgq8FhTgIne/VSkOLEjIThGaRAhjByV3Q6/B8rfhRaDGbcm1RNRSA1winbXotExt8NeIg+jwOsB1B6r8GsDrpSRDKX7YexPErQ+4rueq9WX3wOlMeqDJbxQhxQni24/ZQMANdqwZ7T/WF3C3vuUaHc8uts/kY9UQOLb+cLw9ctlpy2lZ5n8hgUd9YbPN2C0ByXMX6vpeTPmahftW7JX5dHQWWDfcJ/JsaPQFxK+1eGtg0Rw5R1FBxs/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5846
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	068c01ae-2d80-41f8-7f19-08deb4a423e5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|14060799003|376014|36860700016|82310400026|35042699022|1800799024|11063799003|56012099003|13003099007|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xhjus9MPd2YG30tsQsiATdp/hroeAQQPmGADekNqcVMeBDhwpVm2UEA56iSi4xebFTGiatXq+EOa42DIaRbAlfNjHcsAYwSFpC+PhqXsYv1Dnm2p4sBoq5xcwNuLUtajJ4vsG6qGJ9mNhvRY3zjbDK+Slf2nRP/yBxjD8HFdKJoc3zj7zKwnopbiv6Fr9iZR9mSoFL4zXJxb4JEbRVssNrYFop9mV7eS7jGIbKg57iIOFcdk6hV3tsVQDXNbAfWQhwkKRSsgpQ3e3RUG3O0IlB/z8ukkfrF+a94OE+9TnG7cw+SrpoXfzJRbtJeFdSbSYzZkYoZbiTm1hfTpt3rAqUODKk9V4qI3kiJHBRIVd8K88hcWM8lDakC1Ai69DVPDdH3UmrdrQ6mifYXcDXreMG2V9OqLoUaNsZNFcyjsKub4K4+bgaVnlakrUpuOyLvho2zoKzhmHTyIwTN2RHUIcZX1XTB4GsSpBOG73oAMhQrU42WiM7XE+zASTbguSC3xCghCFZDMjWDItFfpkk6r5N5CAETCWDr4XxrksYmaHMPa/+4cL305VrsVKNjahORfBqTHBEK+CuPNgq6faGapfntXfKjMPz2sH/dbpPulbymmIcYNhSrwUtHKXpY4MQ1/630tKutVGWQ/jgBAXOtx0pQfOrZClBr5MKMKb38IXhI=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(14060799003)(376014)(36860700016)(82310400026)(35042699022)(1800799024)(11063799003)(56012099003)(13003099007)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cWDFhGSwWCwkwS+zS1/MpKbVhBBrkNXZrJg/d91IXdCh+wKWkvHxf9nvpZ+jPj5MslendK58HUvJ50x1+FeoaNi0pwmO2AabBiNJ3KnoMvG9Co/CyoiB2DZWyEpeixu8pawk8eQQG8rxEOC2F7RF+2cGuoTZdK2EkjE1zARWC4Q149r6eR9g4+UwnvdgfQw6zPP5jleJd5NGS6Zzv2QFF8ktdW+hqgR1SdJULQLInU2YyySVnSP2Gbr78JZGrBBZqBiNxgJYzyVTPtvHt7gBuEgEOnB0ba3x6/sMbwE1NHm1R74V1uRX3LDEPncALuJUI2zRZwodKNe6Lf+28Tk70CkzmufixlqjmYZsdY6z9HdaevybkiwrA0TCPOGvMAw5hkRyhFF+zE/vluvyycfWsnRUAV0inEiCWT5y+NlT+j6EEO68NdjN7ir6xFRcHIiq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 06:11:25.2201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84789d49-0efe-49de-a52a-08deb4a44aa4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6065

Hi John!

On 5/16/26 2:03 AM, John Hubbard wrote:
> On 5/15/26 1:48 AM, Sarthak Sharma wrote:
>> Rewrite gup_test.c using kselftest_harness.h. The new test uses
>> FIXTURE_VARIANT to cover seven configurations (private/shared,
>> read/write, THP, hugetlb) and runs four test cases per variant
>> (GUP_BASIC_TEST, PIN_BASIC_TEST, DUMP_USER_PAGES_TEST with get and
>> pin), giving 28 TAP-reported cases in total without requiring any
>> command-line arguments.
>>
>> Update run_vmtests.sh: remove run_gup_matrix() and the multiple flagged
>> invocations of gup_test, replacing them with a single unconditional
>> invocation. Benchmark functionality is handled by tools/mm/gup_bench
>> introduced in the previous patch.
> 
> Hi Sarthak,
> 
> Looks like sashiko has a few good observations, these are
> worth considering IMHO:
> 
>  
> https://sashiko.dev/#/patchset/20260515084840.174652-1-
> sarthak.sharma@arm.com
> 
> thanks,

Yes, the observations are valid. I will address them and send out a v2.

