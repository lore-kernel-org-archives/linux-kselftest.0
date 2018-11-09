From: sdf at fomichev.me (Stanislav Fomichev)
Date: Thu,  8 Nov 2018 16:22:10 -0800
Subject: [PATCH v4 bpf-next 4/7] libbpf: add internal pin_name
In-Reply-To: <20181109002213.5914-1-s@fomichev.me>
References: <20181109002213.5914-1-s@fomichev.me>
Message-ID: <20181109002213.5914-5-s@fomichev.me>

From: Stanislav Fomichev <sdf at google.com>

pin_name is the same as section_name where '/' is replaced
by '_'. bpf_object__pin_programs is converted to use pin_name
to avoid the situation where section_name would require creating another
subdirectory for a pin (as, for example, when calling bpf_object__pin_programs
for programs in sections like "cgroup/connect6").

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 tools/lib/bpf/libbpf.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index cfa269c91e11..38dbeb113eeb 100644
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
 
@@ -261,6 +266,18 @@ static void bpf_program__exit(struct bpf_program *prog)
 	prog->idx = -1;
 }
 
+static char *__bpf_program__pin_name(struct bpf_program *prog)
+{
+	char *name;
+
+	name = strdup(prog->section_name);
+	for (char *p = name; p && *p; p++)
+		if (*p == '/')
+			*p = '_';
+
+	return name;
+}
+
 static int
 bpf_program__init(void *data, size_t size, char *section_name, int idx,
 		  struct bpf_program *prog)
@@ -279,6 +296,13 @@ bpf_program__init(void *data, size_t size, char *section_name, int idx,
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
@@ -2008,7 +2032,7 @@ int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 		int len;
 
 		len = snprintf(buf, PATH_MAX, "%s/%s", path,
-			       prog->section_name);
+			       prog->pin_name);
 		if (len < 0) {
 			err = -EINVAL;
 			goto err_unpin_programs;
@@ -2032,7 +2056,7 @@ int bpf_object__pin_programs(struct bpf_object *obj, const char *path)
 		int len;
 
 		len = snprintf(buf, PATH_MAX, "%s/%s", path,
-			       prog->section_name);
+			       prog->pin_name);
 		if (len < 0)
 			continue;
 		else if (len >= PATH_MAX)
@@ -2057,7 +2081,7 @@ int bpf_object__unpin_programs(struct bpf_object *obj, const char *path)
 		int len;
 
 		len = snprintf(buf, PATH_MAX, "%s/%s", path,
-			       prog->section_name);
+			       prog->pin_name);
 		if (len < 0)
 			return -EINVAL;
 		else if (len >= PATH_MAX)
-- 
2.19.1.930.g4563a0d9d0-goog
