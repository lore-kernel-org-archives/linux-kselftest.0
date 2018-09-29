From: peterx@redhat.com (Peter Xu)
Date: Sat, 29 Sep 2018 16:43:09 +0800
Subject: [PATCH 1/3] userfaultfd: selftest: cleanup help messages
In-Reply-To: <20180929084311.15600-1-peterx@redhat.com>
References: <20180929084311.15600-1-peterx@redhat.com>
Message-ID: <20180929084311.15600-2-peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180929084309.RpYHU22N6VWMLx0MkujS537GdYyIZNXX4Z3mF4NQgZU@z>

Firstly, the help in the comment region is obsolete, now we support
three parameters.  Since at it, change it and move it into the help
message of the program.

Also, the help messages dumped here and there is obsolete too.  Use a
single usage() helper.

Signed-off-by: Peter Xu <peterx at redhat.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 44 ++++++++++++++----------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index 7b8171e3128a..2a84adaf8cf8 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -34,18 +34,6 @@
  * per-CPU threads 1 by triggering userfaults inside
  * pthread_mutex_lock will also verify the atomicity of the memory
  * transfer (UFFDIO_COPY).
- *
- * The program takes two parameters: the amounts of physical memory in
- * megabytes (MiB) of the area and the number of bounces to execute.
- *
- * # 100MiB 99999 bounces
- * ./userfaultfd 100 99999
- *
- * # 1GiB 99 bounces
- * ./userfaultfd 1000 99
- *
- * # 10MiB-~6GiB 999 bounces, continue forever unless an error triggers
- * while ./userfaultfd $[RANDOM % 6000 + 10] 999; do true; done
  */
 
 #define _GNU_SOURCE
@@ -115,6 +103,28 @@ pthread_attr_t attr;
 				 ~(unsigned long)(sizeof(unsigned long long) \
 						  -  1)))
 
+const char *examples =
+    "# 100MiB 99999 bounces\n"
+    "./userfaultfd anon 100 99999\n"
+    "\n"
+    "# 1GiB 99 bounces\n"
+    "./userfaultfd anon 1000 99\n"
+    "\n"
+    "# 10MiB-~6GiB 999 bounces, continue forever unless an error triggers\n"
+    "while ./userfaultfd anon $[RANDOM % 6000 + 10] 999; do true; done\n"
+    "\n";
+
+static void usage(void)
+{
+	fprintf(stderr, "\nUsage: ./userfaultfd <test type> <MiB> <bounces> "
+		"[hugetlbfs_file]\n\n");
+	fprintf(stderr, "Supported <test type>: anon, hugetlb, "
+		"hugetlb_shared, shmem\n\n");
+	fprintf(stderr, "Examples:\n\n");
+	fprintf(stderr, examples);
+	exit(1);
+}
+
 static int anon_release_pages(char *rel_area)
 {
 	int ret = 0;
@@ -1272,8 +1282,7 @@ static void sigalrm(int sig)
 int main(int argc, char **argv)
 {
 	if (argc < 4)
-		fprintf(stderr, "Usage: <test type> <MiB> <bounces> [hugetlbfs_file]\n"),
-				exit(1);
+		usage();
 
 	if (signal(SIGALRM, sigalrm) == SIG_ERR)
 		fprintf(stderr, "failed to arm SIGALRM"), exit(1);
@@ -1286,20 +1295,19 @@ int main(int argc, char **argv)
 		nr_cpus;
 	if (!nr_pages_per_cpu) {
 		fprintf(stderr, "invalid MiB\n");
-		fprintf(stderr, "Usage: <MiB> <bounces>\n"), exit(1);
+		usage();
 	}
 
 	bounces = atoi(argv[3]);
 	if (bounces <= 0) {
 		fprintf(stderr, "invalid bounces\n");
-		fprintf(stderr, "Usage: <MiB> <bounces>\n"), exit(1);
+		usage();
 	}
 	nr_pages = nr_pages_per_cpu * nr_cpus;
 
 	if (test_type == TEST_HUGETLB) {
 		if (argc < 5)
-			fprintf(stderr, "Usage: hugetlb <MiB> <bounces> <hugetlbfs_file>\n"),
-				exit(1);
+			usage();
 		huge_fd = open(argv[4], O_CREAT | O_RDWR, 0755);
 		if (huge_fd < 0) {
 			fprintf(stderr, "Open of %s failed", argv[3]);
-- 
2.17.1
