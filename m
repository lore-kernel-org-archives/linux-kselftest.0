Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C83FBED7;
	Wed,  6 May 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062447; cv=fail; b=uwSrQpUIwvFnvHJZZqEklxLanryELwdA1ctfVZCbfB8iqMJCVsodRlfzkxJodxT9UkeGGFy2DF1UpzhAnH5bTYD248qesabS5HrCx8qcTjg28PJ9TqORGupt5I2wCFkGnv20uRE6btPkHt59PHGDzJHeIAECMajqKwaUePJn9kk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062447; c=relaxed/simple;
	bh=RjrEbt7m813pOopDXqgNYU/xCugsGfETZD8g0XJr2s4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OY3xS66TWtrH2Kh4zImc7wfQPt935IeDauxsArAjHCgeqO697j2kXgBkU/Yb8G8BNRtqRbvfEvNqDxOB7iPmcnRzi7t78pVjTIkx9y+O4AQ6jm9G91lk69R3kC5en3qdEiyGQRVgW5QAKwjDaFqk3hUxczWePkJmpwJpvQea7js=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cBDV01aA; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cBDV01aA; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cBDV01aA";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cBDV01aA"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=odfcu5AzUvYounQlCwaeAFas4M+mX7GNZo7TrMNZKeBjvJAuXKIfLhJ4eSWhLnl4/LHixoz+z2tIJWmRmDS7iOfs+YoIQnCEq/t2L0a7gRaEzl+giTm/w5P0JhSVppBnZK2VIX0eGjy6dwlA0e9ArArq+Ac6s5rM85lH9K8X94EoiVyH86L8rhPjvOvaG828ce5JDnOmCuaCLgDXrxFMB2dLvtc9JMTIdRk2m+ADArhOkzY9xGuBF+1P8TBQLrrIhsXGmZ006UGTB1UlIm1e+Nc/GagbckbZ4sKfT0O5O7zDYg64ShgZn5WJ2IcfzviaIjqA/75OUQVBoozDvBJ1ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzlyGo1VejpF8YmL+XCpoQc9riTsD+dmbPWrChRLrsQ=;
 b=UpzZbHIhdekbWz/mT0T/++YJH+yArq2KWhdZx/BHVyTjkntbofpYHC6P9kcwETuyMIUEqlAYTmJfGolAwKDP9xJK9nRHo6oF2TwwAE+b1iV5n/BVoZV7hiX0t4J1kUAFl+ztCcitn5mjf4/ebO/XH+QMTK+63YXEh+CKrVJnQ2M7hPhqN7O5NnOwvF7Kdo7gP9rea+Yx6gwW5dbXY7olPAWX6x9Zbw5wXMXdhXLvw/yK3fi+bG6T+1sfCTA9XSIbWOlpYcSHKgyMI6NG8eOzB6ScR5Oca/Gpp7DOn3x/9S+lA9dpWiOY7S1OChHqtpUvfMVYhUEBjAlyjqo9adD7bw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzlyGo1VejpF8YmL+XCpoQc9riTsD+dmbPWrChRLrsQ=;
 b=cBDV01aAy7TE2PfFWq3Wx6f/awlHObSln0uphHxOzgMIC4UV3VyarkwMgd1i+XL0ifzsWfCX8ZBIB8wdcC2Pbl0/GcgPnsncs9Xkb4AajVxV/IUuxF1oYbIx0jfL8UBn1GzdPd8+S+IgI+bGbVb7G9dVG6cU1vGFU+MUjpb8JKU=
Received: from CWLP265CA0485.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::9)
 by AM9PR08MB6084.eurprd08.prod.outlook.com (2603:10a6:20b:287::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 10:13:55 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:400:18a:cafe::27) by CWLP265CA0485.outlook.office365.com
 (2603:10a6:400:18a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 10:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 10:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W30/gg/OmdceNmPWF9KBQlDnddvwybpo8zIE0cjUFMNOa39anITkzTFUGayVUtR+k0JR+uZZRwCFibyX3Pc7u5oAMY8+EJB1puu974uV7VgDVml37523JEo3wVWCKd73/7Fe4M6K/GTQYUwcJH5nlbCwpqXWTD7ZAYocQWP2sgb/OLA7Hwx5CDW32itzg2QTwQ5f+iiBzPSbRwLeDEKHmxCtN7vzGio0z2eQE0m7C+gXMnVQYajRZBJLHe3iA4CQQDxCkquPMkICLeRaou1Ins5v4/OJi4eDpF7U8+IneiSy597qZD4zrB5wfFYG1SLzYlWCCYzXxvMBTjTyOchZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzlyGo1VejpF8YmL+XCpoQc9riTsD+dmbPWrChRLrsQ=;
 b=Y8eRoJBZIcLgLCtZXI6D/3BayoAkVYozeYNNfLqu6MntwgFIHgOn1x+WdMlcY0SB7boo3QA1UG++7mXc4gtcknVgMoi+h8klwtW0DwwY4eOhz8aRrGG4LgdO4ddCpa4fGzihBwf3GPKrMoU0hGbLKcudnj8OB9f0MqAqsFy/lyP64OofMiFnikTwwKpxOZH7X9/L0rdcq3Cc7g8kh7RIgeUhAJbJZgmALmAutevRiOCMnzgaXBCMJZUaaT+0nhyCvENtZZyV/DIiDsO7CKrPcPh/ZQHxN3B0K4w9gQtYk0YLRKW+5RljUE5C/nBJtmu+SRbY2vCTgSxyACqCSc47xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzlyGo1VejpF8YmL+XCpoQc9riTsD+dmbPWrChRLrsQ=;
 b=cBDV01aAy7TE2PfFWq3Wx6f/awlHObSln0uphHxOzgMIC4UV3VyarkwMgd1i+XL0ifzsWfCX8ZBIB8wdcC2Pbl0/GcgPnsncs9Xkb4AajVxV/IUuxF1oYbIx0jfL8UBn1GzdPd8+S+IgI+bGbVb7G9dVG6cU1vGFU+MUjpb8JKU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by PAVPR08MB9331.eurprd08.prod.outlook.com (2603:10a6:102:303::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 10:12:50 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 10:12:50 +0000
Message-ID: <6a1ac5d0-226f-4106-94a3-6d119912298a@arm.com>
Date: Wed, 6 May 2026 15:42:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/54] selftests/mm: hugepage_settings: add APIs to get
 and set nr_hugepages
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
 <20260428204240.1924129-26-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260428204240.1924129-26-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0185.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::6) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|PAVPR08MB9331:EE_|AMS0EPF000001B6:EE_|AM9PR08MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c669ed6-ddd6-46ac-9db4-08deab582e29
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 /PtneY/+Zdy4qXiIt8c3b4i3xTSzw7xcOtA9oyH5jsNUiFTCvlaHegF0S8nYB5ENMwmpg2jgE83dvZMapHABFGZOPlTgf9q/KXQl6vcCwvRTF7F1DXLCiXYjbLeJj+e2rcj1QwMCrq+bm55rcvw8Goz0AQecYUGYp6C4jbJVDYQqkG4vf3MDRGA/f6+O9YOTBqMXYBwE3gPVXlYylyxeLi2gSHWXC2nz5nCxSok5dXYtvGrzNLhTpyg9WEwsz/VWSNrWYGkav0ubTg98Vh3n+k1/cK7zNw5gUXoz1ZtKBi27fiqS20kN2NtOxH/VKq2/FDqmHgSj82qNtuo7Bsr1ZU7wP+e5v6EU5jKoojEk2Qf9T78+9jKR8naUE7oKxLlbS2jk7gf3Gpo06t4JbALyfrFFSAr5hSZmQ3XM1a5dpkvlGRjx5uOKrPTc73b43QATSMl1xofyvCJGgg4RPfxVpGb4n3dgPrwT/dJ9z02tfsmaugi4C9vQepC9mP821JdcvCRBsoFXdxFVp4aU2Rn0iGw9OCmuLa990HGmrbHDKcVZ5J2og/F+slx1/6bPBecHJ1JP88mFJOiwaJ92Kk10YJ6G0n5IvzFRQBbYyoNi/Fly2Jp9bVslF9gI6I51rvcOz43XAtmJKd2IKgV7USQsd/hbqQIFFVnaeCLBOLuPUiCW8D2rzBRl2ps3k+ly1lKI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Z/bdlqfXHA/hfy/5tBkIRACLXSThhgsFDQsaOaVOgPDYynFIDwchrK2XnuqLD9iXt+ZOIn3g8ECuyD1pERgr2DLrN+JiskMtzOsw4THjEb5Fyif+lD3ZqN+yjdWSHKa7EFP/zoGIR2VzXXlzgYLADXCIvNsuzQBV+QChsHPjeZaOdDjw3vURp2sqV4SKG5H986BnZ05ql3THI6sc6EI68Gamn+Cb3hkwhsd5rFKibSB5W+IgpckRCR6kkRn2SVPtMbrHF2UfKqB4gCMywAGCCoNHUQqqdyn98ifWJTqzAOhdMoQ8RJFJo5N2REMFpteh/pWrCt1/3USUDajsV45nqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9331
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1732d8b5-a89a-444f-940f-08deab580745
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|1800799024|36860700016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QR9+Oc6B190YnJdYAI1vXNl1O6lu/JiyOLtjjQ96vfA1qXXSv08e7ZJujEKsldY+Ai5q1+Eyfs62D+686QCcbgMsThXFLpf2kYKVAT/kcVu0/NdTa+R2Y08hGVhCH4nAkuIOebAKnHczv0PV3VWxwTVYaRbjn6jzFOgWRNWTnU+oww3lw493Y827Rr2Yi9No+1q0OMokIr3ZYcAOT6GQ+biqcsePqFl+lYiAHqmipxqWWNMhXQpED9gvSaUzd9FA45E6yylI8CipJbjibcqQ7WCwOwUPC+7r8e4JN0eRWYiQjDSHloewvscnyVDBtGrUBvb2ZYWTFOkTMiI5YcPGc2DgIEnvX/ZSMlO5jLm5pVvxnSJpk48CGawTVhziYt55z+gt7/+VsaQ8gRXB/1nm2RAyUsYRkMpQckYE9oiNen1uBvwxMKI5OutyZbByMEIFEzR0GVKuIG90kzWRS8HUMQXL25RZcIQXUZU6Azmwkw1Ekzbtz7QMwyMxZmXmgMkmBz2ylWxJENMBJ+2x3QfXymuUuuxQY5vl6iCH1T3e/uQ9n6vxEScMgAFhibld8rAy7nw9f05edLbl/OLmIAqnQ7lFJAA0Sk9b10KC6zYpXhUY6oFFPRopda2/HOWH6we8zwxTwDrPU2d7fIr+5UXartn/+iZ2kXYNSSAzNxFFQv6KE90RV5Kzl+8QJxQZGRZowp8DEuDvyqTAF1xgDTOu/cu3DP3WbqSDRIzyahWjH10=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(1800799024)(36860700016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zyZoRmcKWg7fGLR3DvhaxlHTNf8ziCL8oeoNXYVLtopf1KguTxElEXn+M2htv3Zql7gSub4mwJvEv7GVGdmQ9enrltRwJswm6UAU9bHbvLbsZpHVbA+6U676hL7asnUzaQ0Wgm1QrWae0NJaH93R33Rd4GN4EQE3YgOXpQJC0bawMB43+SgX39kc9lIwSGK8LxpVrNuUOTcZL+rOwi4CRBqGAk5JMjmc+/YdwcaTj28drwHOfAiNnN6+Pn+WnLXo9Ux9/dKCq4VusNw7Zpc7HDgKZphfDXhVdL+M7nKdYdRDUuEszFZ9DTdGxEeuNPizM7CWlCk7owHQ5JAYCy43dP5uV63h1f9/Mk1tSgxT9rZ22+8lrTK3r78uKTlf/ks90avTnMt0KbOJ/6QR3A1Yb6osvGMMOUODrMl1J0KjmJk5WZ79BY99G7rdC1fRF4Ba
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:13:55.2177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c669ed6-ddd6-46ac-9db4-08deab582e29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6084



On 4/29/26 2:12 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Add APIs that allow reading and writing of
> 
> /sys/kernel/mm/hugepages/hugepages-NkB/nr_hugepages
> 
> to detect and change the amount of HugeTLB pages of different sizes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

This patch looks good to me.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

> ---
>  .../testing/selftests/mm/hugepage_settings.c  | 25 +++++++++++++++++++
>  .../testing/selftests/mm/hugepage_settings.h  | 23 +++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 8f563315b1fc..5961229b9931 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -464,3 +464,28 @@ unsigned long get_free_hugepages(void)
>  	fclose(f);
>  	return fhp;
>  }
> +
> +static void hugetlb_sysfs_path(char *buf, size_t buflen,
> +			       unsigned long size, const char *attr)
> +{
> +	snprintf(buf, buflen, "/sys/kernel/mm/hugepages/hugepages-%lukB/%s",
> +		 size / 1024, attr);
> +}
> +
> +unsigned long hugetlb_nr_pages(unsigned long size)
> +{
> +	char path[PATH_MAX];
> +
> +	hugetlb_sysfs_path(path, sizeof(path), size, "nr_hugepages");
> +
> +	return read_num(path);
> +}
> +
> +void hugetlb_set_nr_pages(unsigned long size, unsigned long nr)
> +{
> +	char path[PATH_MAX];
> +
> +	hugetlb_sysfs_path(path, sizeof(path), size, "nr_hugepages");
> +
> +	write_num(path, nr);
> +}
> diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
> index 9357d07e6c1b..d6f41a45e8ee 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.h
> +++ b/tools/testing/selftests/mm/hugepage_settings.h
> @@ -94,4 +94,27 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max);
>  unsigned long default_huge_page_size(void);
>  unsigned long get_free_hugepages(void);
>  
> +unsigned long hugetlb_nr_pages(unsigned long size);
> +void hugetlb_set_nr_pages(unsigned long size, unsigned long nr);
> +
> +static inline unsigned long hugetlb_nr_default_pages(void)
> +{
> +	unsigned long size = default_huge_page_size();
> +
> +	if (!size)
> +		return 0;
> +
> +	return hugetlb_nr_pages(size);
> +}
> +
> +static inline void hugetlb_set_nr_default_pages(unsigned long nr)
> +{
> +	unsigned long size = default_huge_page_size();
> +
> +	if (!size)
> +		return;
> +
> +	hugetlb_set_nr_pages(size, nr);
> +}
> +
>  #endif /* __THP_SETTINGS_H__ */

