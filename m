From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 14 May 2019 15:17:01 -0700
Subject: [PATCH v4 08/18] objtool: add kunit_try_catch_throw to the noreturn
 list
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
Message-ID: <20190514221711.248228-9-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514221701.MUMF6zSIcb2dIqquCXEJYYQzSpUrIIRpXvo6d7KzuaQ@z>

Fix the following warning seen on GCC 7.3:
  kunit/test-test.o: warning: objtool: kunit_test_unsuccessful_try() falls through to next function kunit_test_catch()

kunit_try_catch_throw is a function added in the following patch in this
series; it allows KUnit, a unit testing framework for the kernel, to
bail out of a broken test. As a consequence, it is a new __noreturn
function that objtool thinks is broken (as seen above). So fix this
warning by adding kunit_try_catch_throw to objtool's noreturn list.

Reported-by: kbuild test robot <lkp at intel.com>
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
