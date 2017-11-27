From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Mon, 27 Nov 2017 18:53:39 +0900
Subject: [Linux-kselftest-mirror] [PATCH 1/2] [BUGFIX] selftest: ftrace: Fix
	to pick text symbols for kprobes
In-Reply-To: <151177638973.11564.2545351695862460866.stgit@devbox>
References: <151177638973.11564.2545351695862460866.stgit@devbox>
Message-ID: <151177641912.11564.13469147313642285330.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171127095339.rBeCc33UtNrPb4KRze3FTl3DMemRSZCFwLORQQ3p3gM@z>

Fix to pick text symbols for multiple kprobe testcase.
kallsyms shows text symbols with " t " or " T " but
current testcase picks all symbols including "t",
so it picks data symbols if it includes 't' (e.g. "str").

This fixes it to find symbol lines with " t " or " T "
(including spaces).

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
Reported-by: Russell King <linux at armlinux.org.uk>
---
 .../ftrace/test.d/kprobe/multiple_kprobes.tc       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/multiple_kprobes.tc b/tools/testing/selftests/ftrace/test.d/kprobe/multiple_kprobes.tc
index bb16cf91f1b5..e297bd7a2e79 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/multiple_kprobes.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/multiple_kprobes.tc
@@ -12,8 +12,8 @@ case `uname -m` in
   *) OFFS=0;;
 esac
 
-echo "Setup up to 256 kprobes"
-grep t /proc/kallsyms | cut -f3 -d" " | grep -v .*\\..* | \
+echo "Setup up kprobes on first 256 text symbols"
+grep -i " t " /proc/kallsyms | cut -f3 -d" " | grep -v .*\\..* | \
 head -n 256 | while read i; do echo p ${i}+${OFFS} ; done > kprobe_events ||:
 
 echo 1 > events/kprobes/enable

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
