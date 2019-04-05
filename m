From: tobin at kernel.org (Tobin C. Harding)
Date: Fri,  5 Apr 2019 12:58:54 +1100
Subject: [PATCH v4 1/6] lib/test_printf: Add empty module_exit function
In-Reply-To: <20190405015859.32755-1-tobin@kernel.org>
References: <20190405015859.32755-1-tobin@kernel.org>
Message-ID: <20190405015859.32755-2-tobin@kernel.org>

Currently the test_printf module does not have an exit function, this
prevents the module from being unloaded.  If we cannot unload the
module we cannot run the tests a second time.

Add an empty exit function.

Acked-by: Kees Cook <keescook at chromium.org>
Signed-off-by: Tobin C. Harding <tobin at kernel.org>
---
 lib/test_printf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 659b6cc0d483..601e8519319a 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -615,5 +615,11 @@ test_printf_init(void)
 
 module_init(test_printf_init);
 
+static void __exit test_printf_exit(void)
+{
+}
+
+module_exit(test_printf_exit);
+
 MODULE_AUTHOR("Rasmus Villemoes <linux at rasmusvillemoes.dk>");
 MODULE_LICENSE("GPL");
-- 
2.21.0
