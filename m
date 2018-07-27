From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:17:58 +0900
Subject: [PATCH 17/25] selftests/ftrace: Add kprobe profile testcase
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269387834.3084.10793461311830659918.stgit@devbox>

Add a testcase for testing kprobe_profile interface
which provides per-kprobe event hit/misshit counts.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../selftests/ftrace/test.d/kprobe/profile.tc      |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/profile.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/profile.tc b/tools/testing/selftests/ftrace/test.d/kprobe/profile.tc
new file mode 100644
index 000000000000..0384b525cdee
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/profile.tc
@@ -0,0 +1,15 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe dynamic event - adding and removing
+
+[ -f kprobe_events ] || exit_unsupported # this is configurable
+
+! grep -q 'myevent' kprobe_profile
+echo p:myevent _do_fork > kprobe_events
+grep -q 'myevent[[:space:]]*0[[:space:]]*0$' kprobe_profile
+echo 1 > events/kprobes/myevent/enable
+( echo "forked" )
+grep -q 'myevent[[:space:]]*[[:digit:]]*[[:space:]]*0$' kprobe_profile
+echo 0 > events/kprobes/myevent/enable
+echo > kprobe_events
+! grep -q 'myevent' kprobe_profile

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
