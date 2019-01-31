From: shuah@kernel.org (Shuah Khan)
Date: Thu, 31 Jan 2019 12:43:12 -0700
Subject: [PATCH] =?UTF-8?q?selftests:=20ir:=20fix=20warning:=20=E2=80=98%s?=
 =?UTF-8?q?=E2=80=99=20directive=20output=20may=20be=20truncated?=
Message-ID: <20190131194312.19060-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190131194312.vZy9HmzqgGhEnslT806c-7R2e9AWSGiCxXcr26n8Erk@z>

Fix the following warning by sizing the buffer to max. of sysfs
path max. size + d_name max. size.

gcc -Wall -O2 -I../../../include/uapi ir_loopback.c  -o ../tools/testing/selftests/ir/ir_loopback
ir_loopback.c: In function ‘lirc_open’:
ir_loopback.c:71:37: warning: ‘%s’ directive output may be truncated writing up to 255 bytes into a region of size 95 [-Wformat-truncation=]
    snprintf(buf, sizeof(buf), "/dev/%s", dent->d_name);
                                     ^~
In file included from /usr/include/stdio.h:862:0,
                 from ir_loopback.c:14:
/usr/include/x86_64-linux-gnu/bits/stdio2.h:64:10: note: ‘__builtin___snprintf_chk’ output between 6 and 261 bytes into a destination of size 100
   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        __bos (__s), __fmt, __va_arg_pack ());
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Shuah Khan <shuah at kernel.org>
---
 tools/testing/selftests/ir/ir_loopback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ir/ir_loopback.c b/tools/testing/selftests/ir/ir_loopback.c
index 858c19caf224..8cdf1b89ac9c 100644
--- a/tools/testing/selftests/ir/ir_loopback.c
+++ b/tools/testing/selftests/ir/ir_loopback.c
@@ -27,6 +27,8 @@
 
 #define TEST_SCANCODES	10
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+#define SYSFS_PATH_MAX 256
+#define DNAME_PATH_MAX 256
 
 static const struct {
 	enum rc_proto proto;
@@ -56,7 +58,7 @@ static const struct {
 int lirc_open(const char *rc)
 {
 	struct dirent *dent;
-	char buf[100];
+	char buf[SYSFS_PATH_MAX + DNAME_PATH_MAX];
 	DIR *d;
 	int fd;
 
-- 
2.17.1
