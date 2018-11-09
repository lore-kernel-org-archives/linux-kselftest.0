From: sdf at google.com (Stanislav Fomichev)
Date: Fri,  9 Nov 2018 08:21:43 -0800
Subject: [PATCH v5 bpf-next 4/7] libbpf: add internal pin_name
In-Reply-To: <20181109162146.78019-1-sdf@google.com>
References: <20181109162146.78019-1-sdf@google.com>
Message-ID: <20181109162146.78019-5-sdf@google.com>

pin_name is the same as section_name where '/' is replaced
by '_'. bpf_object__pin_programs is converted to use pin_name
to avoid the situation where section_name would require creating another
subdirectory for a pin (as, for example, when calling bpf_object__pin_programs
for programs in sections like "cgroup/connect6").

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 tools/lib/bpf/libbpf.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 97ce9f214002..e827542ffa3a 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -124,6 +124,10 @@ struct bpf_program {
 	char *name;
 	int prog_ifindex;
 	char *section_name;
+	/* section_name with / replaced by _; makes recursive pinning
+	 * in bpf_object__pin_programs easier
+	 */
+	char *pin_name;
 	struct bpf_insn *insns;
 	size_t insns_cnt, main_prog_cnt;
 	enum bpf_prog_type type;
@@ -253,6 +257,7 @@ static void bpf_program__exit(struct bpf_program *prog)
 	bpf_program__unload(prog);
 	zfree(&prog->name);
 	zfree(&prog->section_name);
+	zfree(&prog->pin_name);
 	zfree(&prog->insns);
 	zfree(&prog->reloc_desc);
 
@@ -261,6 +266,17 @@ static void bpf_program__exit(struct bpf_program *prog)
 	prog->idx = -1;
 }
 
+static char *__bpf_program__pin_name(struct bpf_program *prog)
+{
+	char *name, *p;
+
+	name = p = strdup(prog->section_name);
+	while ((p = strchr(p, '/')))
+		*p = '_';
+
+	return name;
+}
+
 static int
 bpf_program__init(void *data, size_t size, char *section_name, int idx,
 		  struct bpf_program *prog)
@@ -279,6 +295,13 @@ bpf_program__init(void *data, size_t size, char *section_name, int idx,
 		goto errout;
 	}
 
+	prog->pin_name = __bpf_program__pin_name(prog);
+	if (!prog->pin_name) {
+		pr_warning("failed to alloc pin name for prog under section(%d) %s\n",
+			   idx, section_name);
+		goto errout;
+	}
+
 	prog->insns = malloc(size);
 	if (!prog->insns) {
 		pr_warning("failed to alloc insns for prog under section %s\n",
@@ -2006,7 +2029,7 @@ int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 		int len;
 
 		len = snprintf(buf, PATH_MAX, "%s/%s", path,
-			       prog->section_name);
+			       prog->pin_name);
 		if (len < 0) {
 			err = -EINVAL;
 			goto err_unpin_programs;
@@ -2028,7 +2051,7 @@ int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 		int len;
 
 		len = snprintf(buf, PATH_MAX, "%s/%s", path,
-			       prog->section_name);
+			       prog->pin_name);
 		if (len < 0)
 			continue;
 		else if (len >= PATH_MAX)
@@ -2053,7 +2076,7 @@ int bpf_object__unpin_programs(struct bpf_object *obj, const char *path)
 		int len;
 
 		len = snprintf(buf, PATH_MAX, "%s/%s", path,
-			       prog->section_name);
+			       prog->pin_name);
 		if (len < 0)
 			return -EINVAL;
 		else if (len >= PATH_MAX)
-- 
2.19.1.930.g4563a0d9d0-goog
