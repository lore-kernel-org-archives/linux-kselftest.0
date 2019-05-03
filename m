From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Fri,  3 May 2019 14:24:59 -0400
Subject: [PATCH] kheaders: Move from proc to sysfs
Message-ID: <20190503182459.159121-1-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503182459.KvuGGZngSQJRO9Ir4aWmJYD4T6iuocHp7gXQEV_s9gQ@z>

The kheaders archive consisting of the kernel headers used for compiling
bpf programs is in /proc. However there is concern that moving it here
will make it permanent. Let us move it to /sys/kernel as discussed [1].

[1] https://lore.kernel.org/patchwork/patch/1067310/#1265969

Suggested-by: Steven Rostedt <rostedt at goodmis.org>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
This patch applies on top of the previous patch that was applied to the
driver tree:
https://lore.kernel.org/patchwork/patch/1067310/

 kernel/kheaders.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/kernel/kheaders.c b/kernel/kheaders.c
index 70ae6052920d..6a16f8f6898d 100644
--- a/kernel/kheaders.c
+++ b/kernel/kheaders.c
@@ -8,9 +8,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/proc_fs.h>
+#include <linux/kobject.h>
 #include <linux/init.h>
-#include <linux/uaccess.h>
 
 /*
  * Define kernel_headers_data and kernel_headers_data_end, within which the
@@ -31,39 +30,32 @@ extern char kernel_headers_data;
 extern char kernel_headers_data_end;
 
 static ssize_t
-ikheaders_read_current(struct file *file, char __user *buf,
-		      size_t len, loff_t *offset)
+ikheaders_read(struct file *file,  struct kobject *kobj,
+	       struct bin_attribute *bin_attr,
+	       char *buf, loff_t off, size_t len)
 {
-	return simple_read_from_buffer(buf, len, offset,
-				       &kernel_headers_data,
-				       &kernel_headers_data_end -
-				       &kernel_headers_data);
+	memcpy(buf, &kernel_headers_data + off, len);
+	return len;
 }
 
-static const struct file_operations ikheaders_file_ops = {
-	.read = ikheaders_read_current,
-	.llseek = default_llseek,
+static struct bin_attribute kheaders_attr __ro_after_init = {
+	.attr = {
+		.name = "kheaders.tar.xz",
+		.mode = S_IRUGO,
+	},
+	.read = &ikheaders_read,
 };
 
 static int __init ikheaders_init(void)
 {
-	struct proc_dir_entry *entry;
-
-	/* create the current headers file */
-	entry = proc_create("kheaders.tar.xz", S_IRUGO, NULL,
-			    &ikheaders_file_ops);
-	if (!entry)
-		return -ENOMEM;
-
-	proc_set_size(entry,
-		      &kernel_headers_data_end -
-		      &kernel_headers_data);
-	return 0;
+	kheaders_attr.size = (&kernel_headers_data_end -
+			      &kernel_headers_data);
+	return sysfs_create_bin_file(kernel_kobj, &kheaders_attr);
 }
 
 static void __exit ikheaders_cleanup(void)
 {
-	remove_proc_entry("kheaders.tar.xz", NULL);
+	sysfs_remove_bin_file(kernel_kobj, &kheaders_attr);
 }
 
 module_init(ikheaders_init);
-- 
2.21.0.1020.gf2820cf01a-goog
