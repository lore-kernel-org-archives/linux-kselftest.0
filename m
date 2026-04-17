Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FD356A37;
	Fri, 17 Apr 2026 03:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776395759; cv=fail; b=qRd8ScUg9aZ2nhavUOZWUTog1SJ2iCHxwoyHAD9cuu5N88HvupOOr4HYQLo20vxEhQ8vtcdv/FLKTmttqo8er/nurZFKE7Qy+3eeFHnpLHQZ8iVM/FM4GrqflU6j4bfI7CFTnsPVEnmkGUn5Je/u8tHaEF51kB5EppM/vzz6jKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776395759; c=relaxed/simple;
	bh=puo+cQo9vdMoWOWDb7YqkFt0qAo2DWHNN2wNpwd8JVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ia+LHhQKRhiQ/SQQEnPFOcZa3d07Z6J4qiOFHB2pwWY55vopBYnXtrkItCNkIY5CMqXTdviXw3SDzv2B1diFmYXosJN0TtGogDl6CjksO6Pfak4klMDX8yw+TAZhil2pRGlLw8wSNYc6x0QvJtWK8gsAJNAZ0UiRFO9TZb04boE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ItaFsQ8l; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ItaFsQ8l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/pdLs/5Mm3D3Qh0RqPnnfHRtVxlnDNunxmzN6m7fu2GmhGHCY7YJK1pVqr43YPOL+g640U/mO3sHY37xH1OQ109M3j2R9g8eVZX9RPr01plaKF/5WWh2GlHaLrVlXbOrLRrlAbTFX0AC6cpcT0GWVLkIn5lBQQv+zV8bgJZiwJDEQJ/gD1CzLJxRyXg1nsUQ7DuhbcbJ5aaYGn5Dj2Ta59PV0KBJYtjBP5L9rYilX9q2sZp2/Vs1wYBrNBcpCyUDAU9QUohkWhw0BllgmqDDJQi6Bepqmqw8tHirWpFnBelg9ZyH6mXd4yFzhZPiDak+5tZ40ij2DUEuZyraQE5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Mdjryzo6b/ExVpO7wI7MYePe1mVvLTeEKgVziXgRyY=;
 b=sW5uOXviFHE4egJ1eNPB5/K8tDxb2k5aNkAFi8YxS44fUMXkmvpE5HmR0FlU4MiWuHMMl6MsI/wlflZIFGOrDE9r/+GWSlHx1IOnyDxWXUa/+qEQE1zd/iePPTmv02MxogMH+tfSuSROom7Ejyc3gp/cjg5ORTOG/6RnetAVLnNov0QKCUypQJzZisCCLmFkOwHA6r5mIvy61DiENzmrINETApo03dbqQcwzXFOEtfW8jV9XQ/JvGIB1GPJUgGK/nPNW9bTT2WMvheFXSxkMbC8n6s7g4N+D92Y0bbk2FBTVWPLu7ezIhMOHeRry7mec+5YhytBL27jyDtdp5dLPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Mdjryzo6b/ExVpO7wI7MYePe1mVvLTeEKgVziXgRyY=;
 b=ItaFsQ8lOvKuACYOJsDymTTUAp8uzRZ4B+JDtFBwR0Byd1+CzSbcUOr0q+b2wbqOupPY8vV7YNKg72+CE+SAJYH+KNtAlhReL6QT/sPn13Vl6fPmA9wQJMyep+wg+nAA4NacAfBJSV4bSzFaSi4fCJGTOdypQlhA8zOuMwTT0nX+e1kHaMH0uVpYD7LPIZLFBQpYHNV9Ou+EJV73hJ5nw0ZDBhdqp0dNU/XnT44C0KcrNhR/e/nrbg8Xr5E64XOeIY8NhKzb67PNkTw6YbyoS9SoCktwt3geBuJR1QttwaJ4aOy2SuITosRQV+AqLpB6rs8nFPopsWs1DlITQvRy+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:15:42 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:15:42 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Burak Emir <bqe@google.com>,
	Yury Norov <yury.norov@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 3/3] Documentation: rust: testing: add Kconfig guidance
Date: Thu, 16 Apr 2026 23:15:29 -0400
Message-ID: <20260417031531.315281-4-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417031531.315281-1-ynorov@nvidia.com>
References: <20260417031531.315281-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0009.namprd14.prod.outlook.com
 (2603:10b6:610:60::19) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: abbfcf2c-1808-44c2-b60c-08de9c2f9bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RpBQfS3/Xuv1ZsxOo8WxpgTufDJ6UmOSJBo2ZVflov2PqFAj2kSRaumQx4OtglWl7LmmQzjQAcIA0bG258K2v+wCdMRUNY+IKW+fxC1Baf3RCATQ0J0PitrgU2cr2o9GU0SQ+Jgi8Y5Wl92uB6KERpdk98I1RP6mtQ0qaNyA+iXFLpR/m2/fwgBXGNrJ4lV81JCn95CDkdKm/kFFc3WdopoB6ohyhDTm9XBfyNx0ZVAT9rZHslcjgTektdiAJVPFm9OsS+R4qCFFnHAJivQi3iFvbA59oEwplo1TwUfAhzO/DsPpa0vtOMNGESHry6QGT7IHNHh/lt/7URf4++/NTSIUGC8HEY+U7Pa12NCVx2KIxhwiETxQH3U8p5235jkYJ0MYRh7u43V6gNefqRv3KN9TbqOTo1JgQzymoJBXp5EIkXp2dOTiTyNNSRTDbxrq5vFWSXr8WUGOWx+37P9J5hOFAZGjaSz4QOxehX7bcX2UTlybjNakeTj4+6icOWx6sRqHyszR6myh+OqPozt/tSkXPMOhu6vhGf3BzrFbLCpzRLEMtsyA293IOQhqq2aaH8bucWmXStufb7hNgElgwk1nt1Q3M9NnZnwtFLQLd+fj74LGZTsoRw/2HCDn0BIn+syuskdZcLNZWB+Bus4VfWNYUhSyhPG3P6D/7wxcSyHc94iTk4hneCyslIwD0W7Z9s1XfyQ84k3rh924s+6UmLwhykOKqrPd8lekLHY+PBns4WfkphWZeojXXf9D8IclFLCNFGfbLUWC01bdstPRaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jsvKS9xQsIRgnrk2CVwKNfhnKUADiJF5sgN6GqsxDoCqtOdcFlx74NmqW3at?=
 =?us-ascii?Q?Dt4A2j02X/UVOdqMewn0aXurR/E64XjO2v0j6wF2zizqWm0w2BPIxPqvxBmc?=
 =?us-ascii?Q?nxYvSqgyjyYWkS/Br3AmF8wH1n794aUP2UMPvr9jLUSzNGiFbPO2/enOOBfM?=
 =?us-ascii?Q?OZsBhOPWmuZjttWaNvi8x/efab2+y6dp5B3GvlDXj3p3jWa2A2WcouX7rjHK?=
 =?us-ascii?Q?Y9H78+q+3oR3kfDX11fueDuDtgnAQ33KVVevLCljBVgSqWn/Oh31/2d1jguW?=
 =?us-ascii?Q?qTxTPrf+k+LtOutagxLsSiZk9ggkAmIZEmgzuhF4qcU8KQbpF9GikleEOnHp?=
 =?us-ascii?Q?+WfirCPfkiruqRbNx1nqVb8FiGAtAosecUtGQpSnzy/A7+bnLBqLQ4+QBe1V?=
 =?us-ascii?Q?Iq3hnvIOuxIW00dl/W8ugMtolSEeSen2phcT6Vg117nZ28cox0JTeiSM6d2h?=
 =?us-ascii?Q?iSWEjyk5jdxrvpA65i0Uh4y0fObwEIa0fuu4a4/YKgOpqD/WKgU1h4sUmWAO?=
 =?us-ascii?Q?ERWv6yDyjdD784kOlJPKzhkoqdFZ6VHo5bdiMm6UU7jeaCzET9YWYjexK2fR?=
 =?us-ascii?Q?fJ6yFLIjHL0MpVUg65U591ACzVxmu1CyFeJN2eVriJ8MoOuahUxhV345Q2Wm?=
 =?us-ascii?Q?YpM6SrG+hj55AarR3HjlI8dr84r/gxs/6KolcEA2pcj1qbjpnRppR0fc4aB3?=
 =?us-ascii?Q?2XihywnpFrzsKTa5K1ufCQd1qce9zrB9OspGAHTHZldW0RgmDFCN1VkZAz4J?=
 =?us-ascii?Q?W5nXzSx1YQ6jGH+igrRl3CAeTt6TWgXYNdHnJdaRmMVUNjdYlU27/RvZ6Al3?=
 =?us-ascii?Q?i8Ou6b6YXK0Yxw1ULi4fJmKm4cSPGp3cN2K378zqh3ds2DCQinGGYPIXkyxE?=
 =?us-ascii?Q?KikkWL1COMZMn8rnp9759OAo+niil8uuCge53vSXuMSJHLTPDgunPchdvIbL?=
 =?us-ascii?Q?7F9IMa2Y/iP4R6ZBtSbdb/NAAKKGJ39GSB3Y5BBAtN9wFdYKgJ+o/c7up9dt?=
 =?us-ascii?Q?7sup4IpvVaHs/yrBC8NhkeBFrcQSoRXmFd56BK52qF+ytc9dDvlmmXqbty6R?=
 =?us-ascii?Q?h64GokuLS6/nCVNTBJmJrIwSd3Kx5DvX07v3iQHK+Uf78MpMHE/458LdQQyz?=
 =?us-ascii?Q?ZKtVfwbx9UDmGGeQ8TeSBMtLAuHxNS9N8MLXr5Lyu9FVZO5v5vbJYBu9WV5l?=
 =?us-ascii?Q?TBokDCocz03khKBURCFiYk1MRgSZgqG/rJvfF4P2bj/dmRBw/DXX1ECQgk2f?=
 =?us-ascii?Q?JwfKPtI46GHL34ivPAW15lhnqdhYDfeIVappTC/mY4AngRRy9eEod0pKTuEU?=
 =?us-ascii?Q?0b1xyFaj2yb4jNw92uDvk7RmFMPciQml2NJ2EYRYnC1jI7izBgqaeevna4Jg?=
 =?us-ascii?Q?T7MHdhOeeaJ0KIhh1zLNSfMRMbS19+1MFCtRZJIDyK6dP5iGadxQ1NzMWNiX?=
 =?us-ascii?Q?FRecHJW+bT6FnDsN1sEsfKor2GLS6KMAnth5HWD5wxGdebBHLKlh/qiIw1zw?=
 =?us-ascii?Q?Px928wJvqVbAnAjlkKDN7RkvqRFiAw/nSnLX/q7U/SXnV8P4zCotKrcnlvfD?=
 =?us-ascii?Q?/bPM9O7lWiUosL3FOFW11DUTBLeoCeLqKWJ1s4H5L/AbSMB++873ANoB6805?=
 =?us-ascii?Q?kTTPS+nUsPf35THqqhNlxJCseeXfnoMOoVgZ3NOt2RQwofYHJSHr0wc13jAZ?=
 =?us-ascii?Q?mPow6uS44nuapuXGT1bEwIF+1uiMAxIKeUAds2u6BZdSLNysQa5DFiV8oWDv?=
 =?us-ascii?Q?D90Oi/eSHEpNxSyXzFUvlHuYReg67xfmEYK72tbgdJ9IfNJR0+r5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbfcf2c-1808-44c2-b60c-08de9c2f9bc6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:15:42.5600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiY+QdPeMoibgRNsffKDgBPToeiW+AryPXUPkYjVUiwWRfQLPzOnvqzE6315Lz+nUjGmMGfkRPNKv67nFnHBvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772

Now that rust KUnit tests are protected with Kconfig, update the
documentation to mention it.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 Documentation/rust/testing.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index f43cb77bcc69..24de173471b2 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -141,10 +141,13 @@ These tests are introduced by the ``kunit_tests`` procedural macro, which takes
 the name of the test suite as an argument.
 
 For instance, assume we want to test the function ``f`` from the documentation
-tests section. We could write, in the same file where we have our function:
+tests section. We could write, in the same file where we have our function.
+Each test is protected with the corresponding Kconfig option, see
+rust/kernel/Kconfig.test.
 
 .. code-block:: rust
 
+	#[cfg(CONFIG_RUST_MYMOD_KUNIT_TEST)]
 	#[kunit_tests(rust_kernel_mymod)]
 	mod tests {
 	    use super::*;
-- 
2.51.0

