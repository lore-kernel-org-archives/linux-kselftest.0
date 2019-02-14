From: brendanhiggins at google.com (Brendan Higgins)
Date: Thu, 14 Feb 2019 13:37:16 -0800
Subject: [RFC v4 04/17] kunit: test: add test_stream a std::stream like logger
In-Reply-To: <20190214213729.21702-1-brendanhiggins@google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
Message-ID: <20190214213729.21702-5-brendanhiggins@google.com>

A lot of the expectation and assertion infrastructure prints out fairly
complicated test failure messages, so add a C++ style log library for
for logging test results.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/kunit-stream.h |  50 ++++++++++++
 include/kunit/test.h         |   2 +
 kunit/Makefile               |   3 +-
 kunit/kunit-stream.c         | 153 +++++++++++++++++++++++++++++++++++
 kunit/test.c                 |   8 ++
 5 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100644 include/kunit/kunit-stream.h
 create mode 100644 kunit/kunit-stream.c

diff --git a/include/kunit/kunit-stream.h b/include/kunit/kunit-stream.h
new file mode 100644
index 0000000000000..15ad83a6b7aae
--- /dev/null
+++ b/include/kunit/kunit-stream.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * C++ stream style string formatter and printer used in KUnit for outputting
+ * KUnit messages.
+ *
+ * Copyright (C) 2019, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#ifndef _KUNIT_KUNIT_STREAM_H
+#define _KUNIT_KUNIT_STREAM_H
+
+#include <linux/types.h>
+#include <kunit/string-stream.h>
+
+struct kunit;
+
+/**
+ * struct kunit_stream - a std::stream style string builder.
+ * @set_level: sets the level that this string should be printed at.
+ * @add: adds the formatted input to the internal buffer.
+ * @append: adds the contents of other to this.
+ * @commit: prints out the internal buffer to the user.
+ * @clear: clears the internal buffer.
+ *
+ * A std::stream style string builder. Allows messages to be built up and
+ * printed all at once.
+ */
+struct kunit_stream {
+	void (*set_level)(struct kunit_stream *this, const char *level);
+	void (*add)(struct kunit_stream *this, const char *fmt, ...);
+	void (*append)(struct kunit_stream *this, struct kunit_stream *other);
+	void (*commit)(struct kunit_stream *this);
+	void (*clear)(struct kunit_stream *this);
+	/* private: internal use only. */
+	struct kunit *test;
+	spinlock_t lock; /* Guards level. */
+	const char *level;
+	struct string_stream *internal_stream;
+};
+
+/**
+ * kunit_new_stream() - constructs a new &struct kunit_stream.
+ * @test: The test context object.
+ *
+ * Constructs a new test managed &struct kunit_stream.
+ */
+struct kunit_stream *kunit_new_stream(struct kunit *test);
+
+#endif /* _KUNIT_KUNIT_STREAM_H */
diff --git a/include/kunit/test.h b/include/kunit/test.h
index 21abc9e953969..75cd3c3ab1b4b 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -11,6 +11,7 @@
 
 #include <linux/types.h>
 #include <linux/slab.h>
+#include <kunit/kunit-stream.h>
 
 struct kunit_resource;
 
@@ -171,6 +172,7 @@ struct kunit {
 	void (*vprintk)(const struct kunit *test,
 			const char *level,
 			struct va_format *vaf);
+	void (*fail)(struct kunit *test, struct kunit_stream *stream);
 };
 
 int kunit_init_test(struct kunit *test, const char *name);
diff --git a/kunit/Makefile b/kunit/Makefile
index 275b565a0e81f..6ddc622ee6b1c 100644
--- a/kunit/Makefile
+++ b/kunit/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_KUNIT) +=			test.o \
-					string-stream.o
+					string-stream.o \
+					kunit-stream.o
diff --git a/kunit/kunit-stream.c b/kunit/kunit-stream.c
new file mode 100644
index 0000000000000..bc88638aef3b1
--- /dev/null
+++ b/kunit/kunit-stream.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * C++ stream style string formatter and printer used in KUnit for outputting
+ * KUnit messages.
+ *
+ * Copyright (C) 2019, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#include <kunit/test.h>
+#include <kunit/kunit-stream.h>
+#include <kunit/string-stream.h>
+
+static const char *kunit_stream_get_level(struct kunit_stream *this)
+{
+	unsigned long flags;
+	const char *level;
+
+	spin_lock_irqsave(&this->lock, flags);
+	level = this->level;
+	spin_unlock_irqrestore(&this->lock, flags);
+
+	return level;
+}
+
+static void kunit_stream_set_level(struct kunit_stream *this, const char *level)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&this->lock, flags);
+	this->level = level;
+	spin_unlock_irqrestore(&this->lock, flags);
+}
+
+static void kunit_stream_add(struct kunit_stream *this, const char *fmt, ...)
+{
+	va_list args;
+	struct string_stream *stream = this->internal_stream;
+
+	va_start(args, fmt);
+	if (stream->vadd(stream, fmt, args) < 0)
+		kunit_err(this->test, "Failed to allocate fragment: %s", fmt);
+
+	va_end(args);
+}
+
+static void kunit_stream_append(struct kunit_stream *this,
+				struct kunit_stream *other)
+{
+	struct string_stream *other_stream = other->internal_stream;
+	const char *other_content;
+
+	other_content = other_stream->get_string(other_stream);
+
+	if (!other_content) {
+		kunit_err(this->test,
+			  "Failed to get string from second argument for appending.");
+		return;
+	}
+
+	this->add(this, other_content);
+}
+
+static void kunit_stream_clear(struct kunit_stream *this)
+{
+	this->internal_stream->clear(this->internal_stream);
+}
+
+static void kunit_stream_commit(struct kunit_stream *this)
+{
+	struct string_stream *stream = this->internal_stream;
+	struct string_stream_fragment *fragment;
+	const char *level;
+	char *buf;
+
+	level = kunit_stream_get_level(this);
+	if (!level) {
+		kunit_err(this->test,
+			  "Stream was committed without a specified log level.");
+		level = KERN_ERR;
+		this->set_level(this, level);
+	}
+
+	buf = stream->get_string(stream);
+	if (!buf) {
+		kunit_err(this->test,
+			 "Could not allocate buffer, dumping stream:");
+		list_for_each_entry(fragment, &stream->fragments, node) {
+			kunit_err(this->test, fragment->fragment);
+		}
+		goto cleanup;
+	}
+
+	kunit_printk(level, this->test, buf);
+	kfree(buf);
+
+cleanup:
+	this->clear(this);
+}
+
+static int kunit_stream_init(struct kunit_resource *res, void *context)
+{
+	struct kunit *test = context;
+	struct kunit_stream *stream;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+	res->allocation = stream;
+	stream->test = test;
+	spin_lock_init(&stream->lock);
+	stream->internal_stream = new_string_stream();
+
+	if (!stream->internal_stream)
+		return -ENOMEM;
+
+	stream->set_level = kunit_stream_set_level;
+	stream->add = kunit_stream_add;
+	stream->append = kunit_stream_append;
+	stream->commit = kunit_stream_commit;
+	stream->clear = kunit_stream_clear;
+
+	return 0;
+}
+
+static void kunit_stream_free(struct kunit_resource *res)
+{
+	struct kunit_stream *stream = res->allocation;
+
+	if (!stream->internal_stream->is_empty(stream->internal_stream)) {
+		kunit_err(stream->test,
+			 "End of test case reached with uncommitted stream entries.");
+		stream->commit(stream);
+	}
+
+	destroy_string_stream(stream->internal_stream);
+	kfree(stream);
+}
+
+struct kunit_stream *kunit_new_stream(struct kunit *test)
+{
+	struct kunit_resource *res;
+
+	res = kunit_alloc_resource(test,
+				   kunit_stream_init,
+				   kunit_stream_free,
+				   test);
+
+	if (res)
+		return res->allocation;
+	else
+		return NULL;
+}
diff --git a/kunit/test.c b/kunit/test.c
index 84f2e1c040af3..1a2e5e6b7ffee 100644
--- a/kunit/test.c
+++ b/kunit/test.c
@@ -63,12 +63,20 @@ static void kunit_vprintk(const struct kunit *test,
 			  "kunit %s: %pV", test->name, vaf);
 }
 
+static void kunit_fail(struct kunit *test, struct kunit_stream *stream)
+{
+	kunit_set_success(test, false);
+	stream->set_level(stream, KERN_ERR);
+	stream->commit(stream);
+}
+
 int kunit_init_test(struct kunit *test, const char *name)
 {
 	spin_lock_init(&test->lock);
 	INIT_LIST_HEAD(&test->resources);
 	test->name = name;
 	test->vprintk = kunit_vprintk;
+	test->fail = kunit_fail;
 
 	return 0;
 }
-- 
2.21.0.rc0.258.g878e2cd30e-goog
