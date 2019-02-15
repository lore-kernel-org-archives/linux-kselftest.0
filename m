From: sashal at kernel.org (Sasha Levin)
Date: Thu, 14 Feb 2019 21:10:35 -0500
Subject: [PATCH AUTOSEL 4.19 19/65] selftests/vm/gup_benchmark.c: match gup
 struct to kernel
In-Reply-To: <20190215021121.177674-1-sashal@kernel.org>
References: <20190215021121.177674-1-sashal@kernel.org>
Message-ID: <20190215021121.177674-19-sashal@kernel.org>

From: Alison Schofield <alison.schofield at intel.com>

[ Upstream commit 91cd63d320f84dcbf21d4327f31f7e1f85adebd0 ]

An expansion field was added to the kernel copy of this structure for
future use. See mm/gup_benchmark.c.

Add the same expansion field here, so that the IOCTL command decodes
correctly. Otherwise, it fails with EINVAL.

Signed-off-by: Alison Schofield <alison.schofield at intel.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
Signed-off-by: Shuah Khan <shuah at kernel.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/vm/gup_benchmark.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/vm/gup_benchmark.c b/tools/testing/selftests/vm/gup_benchmark.c
index 36df55132036..9601bc24454d 100644
--- a/tools/testing/selftests/vm/gup_benchmark.c
+++ b/tools/testing/selftests/vm/gup_benchmark.c
@@ -22,6 +22,7 @@ struct gup_benchmark {
 	__u64 size;
 	__u32 nr_pages_per_call;
 	__u32 flags;
+	__u64 expansion[10];	/* For future use */
 };
 
 int main(int argc, char **argv)
-- 
2.19.1
