From: sdf at fomichev.me (Stanislav Fomichev)
Date: Thu,  8 Nov 2018 16:22:09 -0800
Subject: [PATCH v4 bpf-next 3/7] libbpf: bpf_program__pin: add special case
 for instances.nr == 1
In-Reply-To: <20181109002213.5914-1-s@fomichev.me>
References: <20181109002213.5914-1-s@fomichev.me>
Message-ID: <20181109002213.5914-4-s@fomichev.me>

From: Stanislav Fomichev <sdf at google.com>

When bpf_program has only one instance, don't create a subdirectory with
per-instance pin files (<prog>/0). Instead, just create a single pin file
for that single instance. This simplifies object pinning by not creating
unnecessary subdirectories.

This can potentially break existing users that depend on the case
where '/0' is always created. However, I couldn't find any serious
usage of bpf_program__pin inside the kernel tree and I suppose there
should be none outside.

Signed-off-by: Stanislav Fomichev <sdf at google.com>
---
 tools/lib/bpf/libbpf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index f8590490a9dd..cfa269c91e11 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -1761,6 +1761,11 @@ int bpf_program__pin(struct bpf_program *prog, const char *path)
 		return -EINVAL;
 	}
 
+	if (prog->instances.nr == 1) {
+		/* don't create subdirs when pinning single instance */
+		return bpf_program__pin_instance(prog, path, 0);
+	}
+
 	err = make_dir(path);
 	if (err)
 		return err;
@@ -1823,6 +1828,11 @@ int bpf_program__unpin(struct bpf_program *prog, const char *path)
 		return -EINVAL;
 	}
 
+	if (prog->instances.nr == 1) {
+		/* don't create subdirs when pinning single instance */
+		return bpf_program__unpin_instance(prog, path, 0);
+	}
+
 	for (i = 0; i < prog->instances.nr; i++) {
 		char buf[PATH_MAX];
 		int len;
-- 
2.19.1.930.g4563a0d9d0-goog
