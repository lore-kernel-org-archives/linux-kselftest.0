Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C806D3537D1;
	Wed,  4 Mar 2026 04:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597023; cv=none; b=iKInARwfElNaJEC0IhplEkEwYQIwG/x/yr5wL2jU3GBLUJ8wix1a7QrxLKqGeYamEuA5OO0FrgO1py3DPfAg+rXyq0lHXN8URJFAiWK2DFR9rZPthIaOvT1Q4ZcCnemnqhOtygzwCpscrcwjTLDsDhJcSa9yODsa8z1MSeEoPcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597023; c=relaxed/simple;
	bh=GccCQ3GJ4qmiaAIQ8R9wc63Edjbu9i9xhHxck28iMBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gij7as62pZIfiVju5j5NZTNp5OES2j5GOfUSQVLIVIYlLYvTJt88TjMdjcx4UETp72mDCycQY2bwBbYU5KBHE6Iaavl8akHfPy6uF16AUMlqCjy5sHq5CskNp5WQ/R6QJVFV1024yNBU8BWg4bO9YgoKWhd07XxZ1UAZ9uUX9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=J7u3hR0+; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="J7u3hR0+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rjuaWLMSN9u3yF5pzWS81BSi0cKzOD21LwxVNPmD3Dk=;
	b=J7u3hR0+2CUiuaKjfNsJkzRTtgL+yqvIbhqctAseyxoiRO4OAJHeeZIdKAWAHOvYJQE7afbF8
	3iw/Ojj6GUosnIiGOMz2wWGAcvFUQjtbUw0HEa63EwSeqyGy+3qVGcQoF/RjSSl57NLtqX/5ejH
	CfSyXUz9sR9mth5GxejV3OQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6B2JjJzcbMV;
	Wed,  4 Mar 2026 11:58:26 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 77FAC40569;
	Wed,  4 Mar 2026 12:03:39 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:38 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [RFC patch 6/9] selftests/resctrl: Add support for HiSilicon CPU detection
Date: Wed, 4 Mar 2026 12:03:31 +0800
Message-ID: <20260304040334.765860-7-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260304040334.765860-1-wuyifan50@huawei.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Currently, the resctrl selftest suite only support x86 CPU vendors
(Intel, AMD and Hygon).

This commit adds support for HiSilicon CPUs detection, extending the
test coverage, and paving the way for vendor-specific implementation
adaptations on HiSilicon platform.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl.h       | 1 +
 tools/testing/selftests/resctrl/resctrl_tests.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 75c595812e7d..0e91d9704023 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -41,6 +41,7 @@
 #define ARCH_INTEL	BIT(0)
 #define ARCH_AMD	BIT(1)
 #define ARCH_HYGON	BIT(2)
+#define ARCH_HISILICON BIT(3)
 
 #define END_OF_TESTS	1
 
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index 419d876a97c2..3299ae01346f 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -49,6 +49,13 @@ static DETECTION_ENTRY vendor_detection[] = {
 					{ .vendor_id = ARCH_AMD,	.arg = "AuthenticAMD" },
 					{ .vendor_id = ARCH_HYGON,	.arg = "HygonGenuine" },
 					{ .vendor_id = 0,	.arg = NULL }
+				},
+			},
+			{
+				.format = "CPU implementer\t: 0x%02x\n",
+				.vendor = (VENDOR_ENTRY[]) {
+					{ .vendor_id = ARCH_HISILICON,	.arg = 0x48 },
+					{ .vendor_id = 0,	.arg = NULL }
 				}
 			}
 		}
-- 
2.33.0

