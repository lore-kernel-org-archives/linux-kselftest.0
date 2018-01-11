From: luisbg at kernel.org (Luis de Bethencourt)
Date: Thu, 11 Jan 2018 13:46:07 +0000
Subject: [Linux-kselftest-mirror] [PATCH] tools/testing: Fix trailing
	semicolon
Message-ID: <20180111134607.12821-1-luisbg@kernel.org>

The trailing semicolon is an empty statement that does no operation.
Removing it since it doesn't do anything.

Signed-off-by: Luis de Bethencourt <luisbg at kernel.org>
---

Hi Shuah,

After fixing the same thing in drivers/staging/rtl8723bs/, Joe Perches
suggested I fix it treewide [0].

Best regards :)
Luis


[0] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115410.html
[1] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115390.html

 tools/testing/selftests/nsfs/pidns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nsfs/pidns.c b/tools/testing/selftests/nsfs/pidns.c
index 1182d4e437a2..e0d86e1668c0 100644
--- a/tools/testing/selftests/nsfs/pidns.c
+++ b/tools/testing/selftests/nsfs/pidns.c
@@ -70,7 +70,7 @@ int main(int argc, char *argv[])
 			return pr_err("NS_GET_PARENT returned a wrong namespace");
 
 		if (ioctl(pns, NS_GET_PARENT) >= 0 || errno != EPERM)
-			return pr_err("Don't get EPERM");;
+			return pr_err("Don't get EPERM");
 	}
 
 	kill(pid, SIGKILL);
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
