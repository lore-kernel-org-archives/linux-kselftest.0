From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 13 May 2019 22:42:42 -0700
Subject: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the noreturn
 list
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
Message-ID: <20190514054251.186196-9-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514054242.ZydwkzYe6Gefxn-yaLbV95lDpxrM6jTJi6jvi7YDIVw@z>

This fixes the following warning seen on GCC 7.3:
  kunit/test-test.o: warning: objtool: kunit_test_unsuccessful_try() falls through to next function kunit_test_catch()

Reported-by: kbuild test robot <lkp at intel.com>
To: Josh Poimboeuf <jpoimboe at redhat.com>
To: Peter Zijlstra <peterz at infradead.org>
Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
Link: https://www.spinics.net/lists/linux-kbuild/msg21708.html
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 479196aeb4096..be431d4557fe5 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -166,6 +166,7 @@ static int __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"usercopy_abort",
 		"machine_real_restart",
 		"rewind_stack_do_exit",
+		"kunit_try_catch_throw",
 	};
 
 	if (func->bind == STB_WEAK)
-- 
2.21.0.1020.gf2820cf01a-goog
