Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53DB350D7D;
	Tue, 26 May 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797390; cv=fail; b=TJ4Xtffq6SXybUBwtLxV1DcTBEZy1gAfWuv1OKCqVq3VPkOn1qC2CD8Juqyj6I5qcyrjVfeyBmaoVKE5uOgm+ZkZ0IygUt+x8KWhoKavU165KnFvg4KySXEi8E4qY5iHfXy193J3hYEvoJsC6jYSy3m9IjHWmauY7NgeBw6onL8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797390; c=relaxed/simple;
	bh=PdIAe7DxbZgPf2Jv06nEWDgi1f5T+Zty5Lu1Xcr41Dc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UoWVg5YJ8nqNxf2lmOhyjty0FQWv/IU2qrGE9HYgcwQIsWg+pybwdyqo9SBDRrLT4tQSg9qJE7FubayEML5+vuHPujA7WMdq54ZoLR5HScRHbUpJMhiMU5Fbr5lqYvgLGR5UVnUyiocGqny76MsrG8rLK4kAIBqXhiFdnQ/lZCI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=d419DwSk; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=d419DwSk; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d419DwSk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d419DwSk"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=ZL7JV7ISWqTFIkqVqYzfwOqCyF+0kq3xATgtwvMsdOd2bj36VYO+3nBsRL29HyjeregAXK1cZ1BmIjMj7NQr2exAjlS47AM+jTv5UdyvKc5y4u1ANbPY6mvm+kSXi2+bKSwN00sOfYJEPlpJCgYSGXAKPaDf3z5tgq9llNV2F1/yUif7xxCBfgwCl5JOn+gw9bNtznQQtR32lWL9UlftqXJRZbHBxfXYHL//swVxrLJ/XpsF34KP5Ng1XRhqDRJmGE+ek0IrH2i6/v3e921H4C/ghuKmhDS48Fce4m9KoPok0VtzkolD66KHdquCj1ktVuc2qe9id8E2JUERRMktwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2OuLL09XAOLOv7/WOg2Zp8xD0NK3sb+jdG85aMxR8k=;
 b=hrXd7R76oTjPddrKuoOflJdympLvnwCS5M8HHihv7UQgFlRYaf28b0d9OBwwYdigCHsUCyY0GK4ch0lK1cw7U7M2rpf3VpKkBgz66VLThuHzf2M9shDnEkx/ujwNSxS2lQfQZPM13wdIrK5R1J13WIF6BxzInNO5PhfGOrJ/cfnV1dKZkhOYizBEzZzCDOSWeg2BahEFCvBYTUF8N4IsNv06rld0n4yuRmNwSeGSf4p4maNV4RXldrAJ3A447MbaNfR6sWrhNknAxu4FFHKOt+wdcLSAtwPMEZK1NcBgrO9alQZpieM9/Qg4jF6wfB1G8yOnNqfGp95U3HNj3JADGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2OuLL09XAOLOv7/WOg2Zp8xD0NK3sb+jdG85aMxR8k=;
 b=d419DwSkvbtNAvAMrzMqAnVt6d8LgDf9Imle773wQaGOa88tK5vrhfC8LDY7gffe/BGWgZNmjDTI4MyNsh2DipidFUTEXmFUixBob0kcvNDL21GGqAB9R05bvkxtUKdZL8s+fDY6xdDs9niInyFnKt4Kzio12+25l2h6TzebmPA=
Received: from DU7P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::27)
 by VE1PR08MB5712.eurprd08.prod.outlook.com (2603:10a6:800:1a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 12:09:43 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::33) by DU7P251CA0010.outlook.office365.com
 (2603:10a6:10:551::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 12:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Tue, 26 May 2026 12:09:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3zbSFFkJNF7sBQpXzFicL/GrdErkBuU1+YmoFwpovLRHB1Ned9A+4qWXfibojbXpsSPUQ6AjiiPtsyAcpURdxljROwHLDw1u2ceayKKajg9uEDPF4yJWyl80cx8xnDdWjnVksuWi4xvKxrSQfyF+CvbtnikySaTUMdxEZGVO0MDqKM2HvY3VbIAp/Iyj2E+1Qm9DKrYZGCxgXd1WFTyG5enRDD/0ED0g+w5t6DAvyB+NMEdtgt5zvWcF16mDsBGWBZeceZwLSchhVwNAAzYMHrxYydolkMqn1zhPjWu5QD528yHE5fuWmr9KZSpq2XDsg6yqyDuJpy6t+Yen7kWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2OuLL09XAOLOv7/WOg2Zp8xD0NK3sb+jdG85aMxR8k=;
 b=c2GHtfoOgarLQNjtDpOXyF4Wwakbqx7wJItE0EX+3JYeGI52heks6io01VNcdWRnV1kAndzTucmBLLd1ooG20SfB3bedWkBDAYAb1DjOY4C07WxB3XK3FBMlAXa2t+QVAhRx/zCJjQO0yV6VVSDb3QGnYVeI/bqEo3PD7cgIkqKtkAbHg3hLZWzQPuznhA6o2C82SJpOVVEqrB3D2P4a5IELH+6eZAPwR1HTtBN1f3QZAXxRlh4Wbw4euVlQ+31jVDqC531Fqly3K2SORt0fuC1rJ50ZlNkqlpuPm78+6rpV85EIzlkTLC0Kx7hoC1pAN7f6Xx03Gj2NO26i1BHu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2OuLL09XAOLOv7/WOg2Zp8xD0NK3sb+jdG85aMxR8k=;
 b=d419DwSkvbtNAvAMrzMqAnVt6d8LgDf9Imle773wQaGOa88tK5vrhfC8LDY7gffe/BGWgZNmjDTI4MyNsh2DipidFUTEXmFUixBob0kcvNDL21GGqAB9R05bvkxtUKdZL8s+fDY6xdDs9niInyFnKt4Kzio12+25l2h6TzebmPA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AM9PR08MB6660.eurprd08.prod.outlook.com (2603:10a6:20b:305::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 12:08:38 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:08:38 +0000
Message-ID: <70a9008b-8b13-44f4-81b4-2397b4ccd323@arm.com>
Date: Tue, 26 May 2026 17:38:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] tools/lib/mm: add shared file helpers
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260521111801.173019-1-sarthak.sharma@arm.com>
 <20260521111801.173019-2-sarthak.sharma@arm.com>
 <177964236205.4000040.3083558454897469696.b4-review@b4>
 <ff7d212c-d3e0-4476-8903-ffe88fb7048c@arm.com> <ahVhTWl0fTF3ASsC@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <ahVhTWl0fTF3ASsC@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AM9PR08MB6660:EE_|DU6PEPF0000A7E1:EE_|VE1PR08MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f91fbd-1f4e-464f-fdb9-08debb1fab42
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|4143699003|22082099003|17002099007|18002099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 ywOf16bn78kshglmNOgYe4JSq3VihEXSaJWBpUEmAf0Q7pHcHRh3mEtOTB8AIaniZ037u9jalkeqd95MaGtXfXaviZIzHolUhrTV13qBXZQT3DVEJLIvSQSwULX0LXQqeACYFJuRlSuW3TenepO6SMVvyDkDiyQLqPyMbYoOI8gixB/wo+Xge1d8SuaaqEqIQkDwZo3OLYSFUp6ZB+pLwOLMiN+Lpd0+OTTCMwzCdhUJ+f0c15jhaZaZaNQ6NUpcVVY085xd6XREEmUQZ/dgRKuKiIDqfjaOlofToHgX2fAZKGZz0lqpf3RJo46JTWwIv2teQIaY5WgEFz4U4pA27basE96TUBKKzj4HfNrAYXENlnb514Kug/b5rDLoP/fP6QKe9a4negwtKiSoxRgfvVxh9Qr62HBJfSDgtzU3L8+8YI2C/RuvnO8/iiMPyIvOHmGsYjhUP7DiYt2a8EHwi/0Dk3b19IfFvX964YZePGaVjm8MRt1Bzwh1hkSBKoLptx39VA/LXckTBB2DCVCTG596yJMx54hI89mkc15zHGhxauh5/cYyE6SF0nYB9BkF/zDRDZWQJaXqtwLebX7BXv3WXgUZswRc0sgGyjwhrGrUDD/5dsdMaMTeVnmkyAhdUDiNEzMflTs9sfzAZ714/NvrNN5IxGN0RzqGcEf/YpdCPZ/HdFZmH5nIgvmaj7sD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4143699003)(22082099003)(17002099007)(18002099003)(56012099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 lZF0P9fqt63xmYZdr1IgLzIaEZJLVANk8Bk7jNhlgVYKK7T2P4rbzoDqxf4p7dXaS9nUtsBahV70p+dbr9k07jfQYNwknJKj26rusgMIpTIBw4R5JihpWNTCwYb408Z+u/iEYAeqY7CAwh6/SkI+jGDuhbh7Ss2pOD6hSFEg7MZxkYfoup8FRyUm+C0WHZ7EtuBJ0WlWBm2q08GNezl5VlgWcaEhkO85qL+s7ZDwdsR9PV670m23lbqoxpMAtKTA9OuwVyZaj8xdlX+ijzgf5yInF7evoiHyXJwveDX/UZQbOP43mJlnyt1Bn9WzCrk7rHr7x4SGCOWDQWqFELtqBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6660
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c7313ce-eb4c-420b-eae4-08debb1f84a2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|14060799003|36860700016|376014|7416014|56012099003|11063799006|4143699003|6133799003|22082099003|17002099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	TMjdkCBe91b7j6wzrLjW/cWFTsi9ChFDISdmHnNvQLw4w52U5YW1iDteP3coEdOhZwF7yjx6wDcH+oygHL++ODdKmV7hSz0CIRXzQipiMlhLkPfX+HRLvLr/Z+wmogFgHamNQ4vg2ka124jHqUdCUBy3cYlBUccdGhD+V4BGoPC132HcRC3YZM7W6/bYE6+RWUJY/1jqXuzhNjM5Kqh+CjJlCbC8tZv5wJ1Veyh1luyvmK7HCkTjVzCLk1BOqs6RhqlOWJrWd/0Xhm0l/5j547An71c0/1YQtb4VmLy8DhHi9hSu9UfPwvTv1VASkFp5rmauWsP0CyPIGQHI0FqVYuPCH/eC1isXnaQs1ojakyM31HRIVLMXpwItZ5Fo7GvaSUVWvcFLbTM0e/OuE0DpRgFln4Wd9ObOk91t596S4OCKWMiivEa3dbNKMacEKt+smA9DqNfxHk/LcACIY9fCWE2B90gQoO/LaYGFzWcsx2u5x57ihgm7sn9CmZ4KyC+eKPExDFk8zy7Yfe6gZliKVNXpWqQbtb4XgjutZR0nFAh/Z+aLbTgpBONx2ETQSHZIWtycR63CKXVjY/BX6AS7a892tim+bcxHgD/EJGnpYF2SlXKMKi55f7eIKrDcPAD4lkomonvN25RpnN4Szm/yO7gNJs18vCVtSjsTsdD3LCM6lxIAYjDIjKjCEL5QRjfbUpfzwmXUgh+0Lo88awWZUy6JGlHqowjIV+t9PwZJPxk=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(14060799003)(36860700016)(376014)(7416014)(56012099003)(11063799006)(4143699003)(6133799003)(22082099003)(17002099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ozA14HkmzKn+h3GA5FbD6QlLPa39ln1aAK9fet3eIRW8QJFb1PQCkTIQneXRXk6GDFJx+s34rvhuhDvA64Vmfv7EDPGQFGZhai++b2O1gIMiRTdt5mlaWeDbUPlmRhMphTAfitnxzk7FEj6ZLzVBQO69esaimC+wWG4oSXUWH9KJI4b/QZI7d4F45mzzGFLbqT9C3WUI7cSVtIQS3llviT0KMzepxGKzNjfH+VB4MetBnuA2jzhUrmrh3jyCjxF4C6pKbwOXpY93zG4aR9TQAcfOxhRz6bKZc9XsG0lRCUzrYjLrJLYpK6rays3KxQ9nlOi8MVS+JeYdIr0DeoyAJrGsY1eq/GwGkFoeMNv0yGsYlGzJUWJVtiPKgP2mGkGzKwvNlj73mcPqG6uZrwmF25TS7T0kGxVyM1nYUkg5rPxmkUurwIUGCSihF7Jm/bpf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:09:42.3883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f91fbd-1f4e-464f-fdb9-08debb1fab42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5712



On 5/26/26 2:31 PM, Mike Rapoport wrote:
> On Mon, May 25, 2026 at 11:59:32AM +0530, Sarthak Sharma wrote:
>> Hi Mike!
>>
>> On 5/24/26 10:36 PM, Mike Rapoport wrote:
>>> On Thu, 21 May 2026 16:47:58 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
>>>
>>> Hi Sarthak,
>>>
>>>>
>>>> diff --git a/tools/lib/mm/file_utils.c b/tools/lib/mm/file_utils.c
>>>> new file mode 100644
>>>> index 000000000000..0f9322f2cf41
>>>> --- /dev/null
>>>> +++ b/tools/lib/mm/file_utils.c
>>>> @@ -0,0 +1,83 @@
>>>> [ ... skip 48 lines ... ]
>>>> +	saved_errno = errno;
>>>> +	close(fd);
>>>> +	errno = saved_errno;
>>>> +	if (numwritten < 0) {
>>>> +		fprintf(stderr, "%s write(%.*s) failed: %s\n",
>>>> +			path, (int)(buflen - 1), buf, strerror(errno));
>>>
>>> This would break TAP formatting for selftests.
>>
>> Yes, thanks for pointing it out.
>>
>>>
>>>> +		exit(EXIT_FAILURE);
>>>
>>> and while EXIT_FAILURE == KSFT_FAIL I'm not sure it's robust enough.
>>
>> I used EXIT_FAILURE here because the helper is moving out of selftests
>> and should not include kselftest.h anymore. The helper already
>> terminated the process on these paths, so I tried to preserve that
>> behavior while removing the ksft dependency.
> 
> In mm selftests a failure to update a /proc or /sysfs file meant there is
> no point to continue the test. But if we make it a generic helper for
> potentially broader use than mm selftests, exit() on failure is too harsh.

Okay yeah, this makes sense.

>  
>> We can change this to return errors instead of calling exit() and update
>> the selftest callers to report failures through the ksft_* helpers. I
>> agree this is cleaner, but it would grow the series a bit.
>>
>> If you feel strongly, I can include these changes in v4. Otherwise I
>> feel we can handle it separately later to avoid growing this series.
> 
> There are not that many callers of write_file() and write_num().
> I think a patch that makes them return an error rather than exit() can go
> before moving these functions to lib. 
> 

So I will add a patch before the move that makes read_file(),
write_file(), read_num() and write_num() return errors instead of
exiting and update the existing selftest callers to report those
failures via ksft_* helpers.

For hugepage_settings.c, I’d prefer to keep the existing fail fast
behaviour in this series. After this series, the users are still mm
selftests and the new tools/mm/gup_bench tool and for those users a
failure to read/write THP or HugeTLB state is fatal to the operation
being attempted.

Converting the full hugepage_settings API to return errors would be a
larger follow-up, because many of its helpers are used throughout mm
selftests. I can handle that in a separate series unless you think it
should be folded into this one as well.

>>>>
>>>> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
>>>> index 2eab2110ac6a..5e947abb7425 100644
>>>> --- a/tools/testing/selftests/mm/hugepage_settings.c
>>>> +++ b/tools/testing/selftests/mm/hugepage_settings.c
>>>> @@ -8,8 +8,9 @@
>>>>  #include <stdlib.h>
>>>>  #include <string.h>
>>>>  #include <unistd.h>
>>>> +#include <mm/file_utils.h>
>>>>  
>>>> -#include "vm_util.h"
>>>
>>> I think it would be fine to include file_utils.h in vm_utils.h and avoid
>>> further churn.
>>
>> Okay, I'll change this.
> 

