From: lkp at intel.com (kbuild test robot)
Date: Thu, 31 May 2018 14:45:35 +0800
Subject: [PATCH v8 8/8] kselftests: Add tests for the preemptoff and
 irqsoff tracers
In-Reply-To: <20180530000500.257225-9-joel@joelfernandes.org>
References: <20180530000500.257225-9-joel@joelfernandes.org>
Message-ID: <201805311418.7PnmvmRl%fengguang.wu@intel.com>

Hi Joel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.17-rc7]
[cannot apply to next-20180530]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Joel-Fernandes/Centralize-and-unify-usage-of-preempt-irq-tracepoints/20180531-093357


coccinelle warnings: (new ones prefixed by >>)

>> lib/test_atomic_sections.c:66:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
