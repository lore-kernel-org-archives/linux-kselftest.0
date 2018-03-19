From: acme@kernel.org (Arnaldo Carvalho de Melo)
Date: Mon, 19 Mar 2018 16:01:34 -0300
Subject: [PATCH 12/14] perf probe: Use right type to access array elements
In-Reply-To: <20180319190136.7441-1-acme@kernel.org>
References: <20180319190136.7441-1-acme@kernel.org>
Message-ID: <20180319190136.7441-13-acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180319190134.34Ex5rzUErmOU4xOeCyHfVD8LWwYqpcG6wiBtnIks_Y@z>

From: Masami Hiramatsu <mhiramat@kernel.org>

Current 'perf probe' converts the type of array-elements incorrectly. It
always converts the types as a pointer of array. This passes the "array"
type DIE to the type converter so that it can get correct "element of
array" type DIE from it.

E.g.
  ====
  $ cat hello.c
  #include <stdio.h>

  void foo(int a[])
  {
	  printf("%d\n", a[1]);
  }

  void main()
  {
	  int a[3] = {4, 5, 6};
	  printf("%d\n", a[0]);
	  foo(a);
  }

  $ gcc -g hello.c -o hello
  $ perf probe -x ./hello -D "foo a[1]"
  ====

Without this fix, above outputs
  ====
  p:probe_hello/foo /tmp/hello:0x4d3 a=+4(-8(%bp)):u64
  ====
The "u64" means "int *", but a[1] is "int".

With this,
  ====
  p:probe_hello/foo /tmp/hello:0x4d3 a=+4(-8(%bp)):s32
  ====
So, "int" correctly converted to "s32"

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
Tested-by: Arnaldo Carvalho de Melo <acme at redhat.com>
Cc: Namhyung Kim <namhyung at kernel.org>
Cc: Ravi Bangoria <ravi.bangoria at linux.vnet.ibm.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Steven Rostedt <rostedt at goodmis.org>
Cc: Tom Zanussi <tom.zanussi at linux.intel.com>
Cc: linux-kselftest at vger.kernel.org
Cc: linux-trace-users at vger.kernel.org
Fixes: b2a3c12b7442 ("perf probe: Support tracing an entry of array")
Link: http://lkml.kernel.org/r/152129114502.31874.2474068470011496356.stgit at devbox
Signed-off-by: Arnaldo Carvalho de Melo <acme at redhat.com>
---
 tools/perf/util/probe-finder.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index a5731de0e5eb..c37fbef1711d 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -423,20 +423,20 @@ static int convert_variable_fields(Dwarf_Die *vr_die, const char *varname,
 		pr_warning("Failed to get the type of %s.\n", varname);
 		return -ENOENT;
 	}
-	pr_debug2("Var real type: (%x)\n", (unsigned)dwarf_dieoffset(&type));
+	pr_debug2("Var real type: %s (%x)\n", dwarf_diename(&type),
+		  (unsigned)dwarf_dieoffset(&type));
 	tag = dwarf_tag(&type);
 
 	if (field->name[0] == '[' &&
 	    (tag == DW_TAG_array_type || tag == DW_TAG_pointer_type)) {
-		if (field->next)
-			/* Save original type for next field */
-			memcpy(die_mem, &type, sizeof(*die_mem));
+		/* Save original type for next field or type */
+		memcpy(die_mem, &type, sizeof(*die_mem));
 		/* Get the type of this array */
 		if (die_get_real_type(&type, &type) == NULL) {
 			pr_warning("Failed to get the type of %s.\n", varname);
 			return -ENOENT;
 		}
-		pr_debug2("Array real type: (%x)\n",
+		pr_debug2("Array real type: %s (%x)\n", dwarf_diename(&type),
 			 (unsigned)dwarf_dieoffset(&type));
 		if (tag == DW_TAG_pointer_type) {
 			ref = zalloc(sizeof(struct probe_trace_arg_ref));
@@ -448,9 +448,6 @@ static int convert_variable_fields(Dwarf_Die *vr_die, const char *varname,
 				*ref_ptr = ref;
 		}
 		ref->offset += dwarf_bytesize(&type) * field->index;
-		if (!field->next)
-			/* Save vr_die for converting types */
-			memcpy(die_mem, vr_die, sizeof(*die_mem));
 		goto next;
 	} else if (tag == DW_TAG_pointer_type) {
 		/* Check the pointer and dereference */
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
