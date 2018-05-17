From: guro@fb.com (Roman Gushchin)
Date: Thu, 17 May 2018 16:56:51 +0100
Subject: [bug report] selftests: cgroup: add memory controller self-tests
In-Reply-To: <20180517132225.GA13289@mwanda>
References: <20180517132225.GA13289@mwanda>
Message-ID: <20180517155646.GA1134@castle.DHCP.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180517155651.TfL0wR-1_qCso8nwI4LROqGwM7Rw4fseWKHXTelS2O0@z>

On Thu, May 17, 2018@04:22:25PM +0300, Dan Carpenter wrote:

> Hello Roman Gushchin,
> 
> The patch a62213fe9b77: "selftests: cgroup: add memory controller
> self-tests" from May 11, 2018, leads to the following static checker
> warning:
> 
> 	./tools/testing/selftests/cgroup/cgroup_util.c:62 cg_name()
> 	warn: variable dereferenced before check 'name' (see line 59)
> 

Hi Dan!

Thank you for the report!
The fix is below.


Roman

--

>From ec990dc816b0a36201bed84e5b38b928b9bb9138 Mon Sep 17 00:00:00 2001
From: Roman Gushchin <guro@fb.com>
Date: Thu, 17 May 2018 16:53:15 +0100
Subject: [PATCH] kselftest/cgroup: fix variable dereferenced before check
 warning

cg_name(const char *root, const char *name) is always called with
non-empty root and name arguments, so there is no sense in checking
it in the function body (after using in strlen()).

Signed-off-by: Roman Gushchin <guro at fb.com>
Reported-by: Dan Carpenter <dan.carpenter at oracle.com>
Cc: linux-kselftest at vger.kernel.org
---
 tools/testing/selftests/cgroup/cgroup_util.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
index 41cc3b5e5be1..b69bdeb4b9fe 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/cgroup_util.c
@@ -59,8 +59,7 @@ char *cg_name(const char *root, const char *name)
 	size_t len = strlen(root) + strlen(name) + 2;
 	char *ret = malloc(len);
 
-	if (name)
-		snprintf(ret, len, "%s/%s", root, name);
+	snprintf(ret, len, "%s/%s", root, name);
 
 	return ret;
 }
@@ -70,8 +69,7 @@ char *cg_name_indexed(const char *root, const char *name, int index)
 	size_t len = strlen(root) + strlen(name) + 10;
 	char *ret = malloc(len);
 
-	if (name)
-		snprintf(ret, len, "%s/%s_%d", root, name, index);
+	snprintf(ret, len, "%s/%s_%d", root, name, index);
 
 	return ret;
 }
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
