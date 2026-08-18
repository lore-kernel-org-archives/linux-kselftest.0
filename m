Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDA641A926;
	Tue, 18 Aug 2026 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066618; cv=fail; b=fLa1DxhVZertGz0vpjWRjogjQV6oPkZplfGOHuNI41qp1GthZfP5rmQs01Kw2J9QtZ/MSBIyFPl1m8Z/Z/6bPRKDHhwQzq7EdlXli6TKc3fkKHV0uDcwEwxCqGdS7CAi454x3b+E18+7BiOHV3Mp5R+3T6HSa9W0OiVc+ZalWVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066618; c=relaxed/simple;
	bh=Ir693lEscT1RJguF1KuXkatfb3K7Dkr3N4Rur54jcEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tLRnTKXkKJO3qOzU7TrM3rew2Uqtr4ydiFI+H9GB5jHm5j/lgYyHwgSWhYQwO19OFGjHWiCA+daCB7dh0/b4ksLI655scArC/KPYjzLb+ZsPw08KXeexxYOjM5M1bm8zgrzqMYBodI5QdsU41vE50KsmqSVCHej3WVuadHpEx4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ocdbl17I; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ocdbl17I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6TuGM+BoJyfKea3kgEWvDBfnJezKIir5usJ0f2QbRYmW/FvT/zJmR6SbpgBiannQz9Ry6AsXxDfVxIkkyPNwhcu7UGbdWBqJ+jik1si5ZzJvCtZrwp/XBEhZmAqhZqV3Gwuus6iAfxWlS3OWFh2Fy9zkvrAz0uR0dmZDS/UwfoQfoPjPhyBizmncb8wZ1SzVl6xS9rcG4XSVNmBim3+LmKR16y5kijUBCZxzwSWiXOG/vpOAJetIGw0pMbkTUuOOy2i1Z6vdHRrUmT5YNKdXl1OrAH8KxffQE83tOeKG29x819q2rdoH+0acOBtNLOa+GMuTW4nL9YSlUeDxUQdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBczlLXuTc9ilNvWMAoRAx2kYpp3EwFVBxnfo5flV4o=;
 b=qAOjA6rEX+1yWmUxexr971uIm9OZl4auMGRmEqYvnOWy5xbLtMMfCS89vzuMXeRIXJtmUSn0nvf6Nf/O6SRGw0mwAXoUrftBf6ra6NStyIrc9I7ah+BaCTQ5/aELe9p0epO+nrA5lXar12/2xqu3qWMsDpvAgOzYjPunCw5y+rLMe4uJFeT147NsfeBgiN42REoohp228XabcOfFopEEk5l05RKQqh5tb5ZoSewWmwMJbuFpAFqBK/fk3OPxFRAPQFucoXWsYNF0oer8ohvix2LCDMrZrs4HuoQZNXNu8xpJ20tnGc5TyJkzQHMbcVPtLWd1LwanPpp0i3B2nvMY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBczlLXuTc9ilNvWMAoRAx2kYpp3EwFVBxnfo5flV4o=;
 b=Ocdbl17IEFYrP5GoH+6NndzOsLjEAMpur1kUBAsqp/wun4JgUvcLosMsvEZLoEE3oalRsvvy01IJrnATlJYGtY1cvRnJktpUiUdxFbwMbLnk9D7Gcw56B8Ura7RsKFBRU+rfmkf6KwCGQ7Nwu6fofDruNuNU4LTDq64ASt7odmHyqQ4rLVFyIk1fdFCIE6SiDTYUAgAret4ELYSSM6wFeAHtJNm3B5hFfcSF+AFwm7F++eKse+kYTg5vSlXzYY2eDZR0IG6YO4F4NEDs5YmkKbQqH3kbPZbgJhvj9u3Jo4uGcr/KS/4Zo/ywBvShMUbtxEB5yfPKV3kfNyb6vTZ2Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by IA1PR12MB7661.namprd12.prod.outlook.com (2603:10b6:208:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 15:23:28 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 15:23:28 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev
Cc: Yury Norov <ynorov@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpu: nova-core: add a KUnit test configuration option
Date: Tue, 18 Aug 2026 11:23:23 -0400
Message-ID: <20260818152324.587932-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818152324.587932-1-ynorov@nvidia.com>
References: <20260818152324.587932-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:408:f9::13) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|IA1PR12MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: e49d6df5-1394-4672-1651-08defd3ca7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M7rRa8Y5p7GqH6io4+8pVWKYwNAeitiI6BBybbznYQ8p/kSYWSxraKHOsYFjW+kHjzxZDnjM3LpjCZnFWDkrFv8qAXJk9eaPbJ+OmBIRv1WTVqO8M7z8Y4Zyiq7LkTZiDJScJb563sv/YsQI4RE+6Ven7HPDQ313lmDagIMd4bGzWJOCBL6STl9CDZfjx+Gy94Pgml46vIIATbTUUCuWfWhm//JypuI7E8OI4WujdCNDi/ZWdJ7+bwcLSQqYdiTyj9oaRm6XOzFEi3EB5bidaN2TZsLXbEmyiH72VC5adu4E5RGzqr+pufiIYuekxcfzHUt7nk4mxv9c0o8Vyr41umuX39Nz7NmC9z8P9gDG8EHYCAkLPPUYXxR0ZEYwI+qdoRIDIML03d/IZP3UZp0WVKtvePUgyUsMYRNhF5HNko31vFAgQudCfCXqOOiFZBQNz6xOj4jXjxIAaEMYkVSPvUa747VONOjtayBqF9qNv07lLh8Hlns15aY+AvaXLYJLomdmz8S2jKrGkdfz3/jladSw9Z5kx9iQr+VmYF6PP2GnqNLD5kDwGtfeh/DNPbu1dO1fag8oK0fnmq9KYLOLnTcKt7hjkqkZhIyuBDU6EK6k/9Gwr+q4gGvl4kthO7zdt43rhNZixroYlp6vaNb75p1VRkVrLJqcVGzwH/5+CRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7yYxcvmPy/49cyO1Elmkrha5pcaR4gdyKK3nacWOw+gTx0DM5MNU0IzWKWRp?=
 =?us-ascii?Q?V+2CnaTB6cKMEcexYOH7HK3MUb1U5j171hyWSTvf5oG1UW6D1HtC+9MKGk5Q?=
 =?us-ascii?Q?UW5WqU9tTNeXi/IEKb5iaLO+qAJB1lnn50PyUabnjAYqC9Dm3ay3EDysYOT+?=
 =?us-ascii?Q?iozI7CG+WNE9dCJtWo7/vIP6+u5rGqHrbzY/K203tTKR8stWgLFVXFV/zBM5?=
 =?us-ascii?Q?poov87G9HqGm34VBqlwXBruyhlU3TYj4kMloI2tvUitXgtEwn+hLuYH9lbMa?=
 =?us-ascii?Q?avlj0p+8StqnrJV9x5zNOrWBlOgKaYqcC3ueF0e2BniJCzIsMEWCKUSGU6Rf?=
 =?us-ascii?Q?llvQXLwB62Bi4hvm5CTTsmrIZKyKv1mTxJdKkvPkp6OgihpkmS4NGaEFRviK?=
 =?us-ascii?Q?A2vJX6jm8ZwrN4xcGxnUZlMxmVzEar2gsWU6zwhKh6K8rP4d9pXeX94fJViG?=
 =?us-ascii?Q?Qd403pLmwX0OW3lJOadeq38K/5fHyTz4ll6FEJvi0TWi8szOzRR4PqqMitM5?=
 =?us-ascii?Q?GFjYoUorTOdKhf9abBcKP9IuXapjVnFmr4Oz8jxP2nqpUwizTSqNqj31DRIP?=
 =?us-ascii?Q?xRHLzqGJ60gKYiGapaD1adOu5Ud11tGAzo3YlIrRDkB7X65pL5VNblnHCA+T?=
 =?us-ascii?Q?mW81GS1rHysdk2ktTFBIBx6zUeEMHObP4k+H/b4tKKiazF4mGG3MMHQUnCLY?=
 =?us-ascii?Q?dKK9EUArDBe6itDNPGN968NCYBE0SBiRKbWorsOugT326dqZAO0GrDKlpEdh?=
 =?us-ascii?Q?Cq1/tO52mzItmmoTs45ghamyPb/b9gbp92mfRRAvLB1ekxdKdyVyyKlo/YDQ?=
 =?us-ascii?Q?ventlLzu3md6H7dl3q2nMg7SeILyowEk01Kx3No1UzFFRzFWb0/VSt/pSNjL?=
 =?us-ascii?Q?Ta0CMQpm0oz7kbEtm3taf7mm294XL1KJwFj9xVgp+5LwsJGpY9PHSQEOt8IZ?=
 =?us-ascii?Q?CLQOznDlIRzZXTpva/8nx51sKnvUXB/dvYHPblDmovOx95ciSMhOobozQM5m?=
 =?us-ascii?Q?8yIhPBgQvji2pMbl89f0DZlsVAwnDO4kbQo8L0LhLY4uf+2dpU/sLDaFJuxv?=
 =?us-ascii?Q?HUCXO85CT9m0/ceVnPsdTZG+c9UGmMhVPY0+hPdFOjNOWQDtv+8PwAwGzYvN?=
 =?us-ascii?Q?FqdPbKjKRHB7eY8HDWfCjpPazkhHVOJ8MvRxIx1s3FIs9FGPHAqkAnbpgMin?=
 =?us-ascii?Q?FM9yxJnt3g+6lHiBzJC5U6sF4zITtPH6X5Qrlj5v+6Csy5cmQx9pDKlodUZX?=
 =?us-ascii?Q?AY7Ks83QBk0MDwHu/YZ94yACTjgWC6Rpumj4qk7/5GuCYwE2T+/z8q0XwMTf?=
 =?us-ascii?Q?tD/LSI+R5XYuuUlO/daO1UhckxPLIQEN6ZFOe/dsaFnni2OlqQuuieaWo5Fw?=
 =?us-ascii?Q?DUx0ojJM8nZ51CD1oYyfwuLiKfdhvL0/YLbiX0D1kgpicSsXpVC72IhT9t/X?=
 =?us-ascii?Q?L/T5Uy8sh4t95V9kELKUc8WaitpqQVQ8GVIf0wlDDWHRyAWJfYHcPTgFFR4/?=
 =?us-ascii?Q?oVBcnpCXLzcs7QqE5MFqGOq7SkNGKz918nwXUYRswmXKQ5w8xEF3crDLDByy?=
 =?us-ascii?Q?8B6lr1Uck7ed/26xPNava3MQgnDHQ/I1zWMAK3qGh/fAsGdLAhjb6qzI6ntj?=
 =?us-ascii?Q?05vAVuOHm/h/vHxHfPwmefjLwWOSqGW+7G4j7KXpKbozft6NtpLrqiCeX9D3?=
 =?us-ascii?Q?fHrgeJudS21ZXjw4Hw7QEqzpY68vNvfIFx97Lkvf9gbp6Sbt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49d6df5-1394-4672-1651-08defd3ca7a0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 15:23:28.7094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aqE3ILvL45j3oPfinan5Ycmpuqmwh/2wZSOcrrxpTwKZLjXihz7I5iCzSJxwHXxZCLTL9BAD2cPl7r1wNy6Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661

The continuation-record KUnit tests are currently built whenever both
Nova Core and KUnit are enabled, providing no way to select the tests
independently.

Add CONFIG_NOVA_CORE_KUNIT_TEST and use it to guard the test suite.
Follow the usual KUnit convention of enabling the option through
CONFIG_KUNIT_ALL_TESTS.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig                  | 12 ++++++++++++
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index f918f69e0599..d05c2c1d46d9 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -15,3 +15,15 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova-core.
+
+config NOVA_CORE_KUNIT_TEST
+	bool "KUnit tests for Nova Core" if !KUNIT_ALL_TESTS
+	depends on NOVA_CORE && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for internal components of the Nova
+	  Core driver. The tests currently do not require GPU hardware. These
+	  are only for development and testing, not for regular kernel use
+	  cases.
+
+	  If unsure, say N.
diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
index 05e904f18097..c0aa16c8fbf4 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -167,6 +167,7 @@ fn init_variable_payload(
     }
 }
 
+#[cfg(CONFIG_NOVA_CORE_KUNIT_TEST)]
 #[kunit_tests(nova_core_gsp_continuation)]
 mod tests {
     use super::*;
-- 
2.53.0
