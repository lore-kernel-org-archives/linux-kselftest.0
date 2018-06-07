From: dan.carpenter@oracle.com (Dan Carpenter)
Date: Thu, 7 Jun 2018 11:30:02 +0300
Subject: [PATCH] kselftest/cgroup: fix a signedness bug
Message-ID: <20180607083001.m4z4wjev6j3sc423@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180607083002.R1sRXSWjX0Y4DfW5N9Q687U5IMJjtwvbfIwBHtSjTmg@z>

"len" needs to be signed for the error handling to work.

Signed-off-by: Dan Carpenter <dan.carpenter at oracle.com>

diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
index b69bdeb4b9fe..1e9e3c470561 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/cgroup_util.c
@@ -35,7 +35,7 @@ static ssize_t read_text(const char *path, char *buf, size_t max_len)
 	return len;
 }
 
-static ssize_t write_text(const char *path, char *buf, size_t len)
+static ssize_t write_text(const char *path, char *buf, ssize_t len)
 {
 	int fd;
 
@@ -140,7 +140,7 @@ long cg_read_key_long(const char *cgroup, const char *control, const char *key)
 int cg_write(const char *cgroup, const char *control, char *buf)
 {
 	char path[PATH_MAX];
-	size_t len = strlen(buf);
+	ssize_t len = strlen(buf);
 
 	snprintf(path, sizeof(path), "%s/%s", cgroup, control);
 
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
