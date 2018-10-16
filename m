From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:07 -0700
Subject: [RFC v1 18/31] kunit: mock: added parameter formatters
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-19-brendanhiggins@google.com>

Added parameter formatters which provide string formatting for
parameters that have no matchers to be matched against.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/mock.h     |  49 +++++++++++++++
 kunit/common-mocks.c     | 132 +++++++++++++++++++++++++++++++++++++++
 kunit/mock.c             |  48 ++++++++++++--
 kunit/test-stream-test.c |  28 +++++++++
 4 files changed, 252 insertions(+), 5 deletions(-)

diff --git a/include/kunit/mock.h b/include/kunit/mock.h
index daf965cf954e6..4f85b39d628d0 100644
--- a/include/kunit/mock.h
+++ b/include/kunit/mock.h
@@ -123,6 +123,18 @@ struct mock_expectation *mock_add_matcher(struct mock *mock,
 					  struct mock_param_matcher *matchers[],
 					  int len);
 
+struct mock_param_formatter {
+	struct list_head node;
+	const char *type_name;
+	void (*format)(struct mock_param_formatter *formatter,
+		       struct test_stream *stream,
+		       const void *param);
+};
+
+void mock_register_formatter(struct mock_param_formatter *formatter);
+
+void mock_unregister_formatter(struct mock_param_formatter *formatter);
+
 #define MOCK(name) name##_mock
 
 /**
@@ -834,4 +846,41 @@ struct mock_param_matcher *test_struct_cmp(
 		const char *struct_name,
 		struct mock_struct_matcher_entry *entries);
 
+struct mock_struct_formatter_entry {
+	size_t member_offset;
+	struct mock_param_formatter *formatter;
+};
+
+static inline void init_mock_struct_formatter_entry_internal(
+		struct mock_struct_formatter_entry *entry,
+		size_t offset,
+		struct mock_param_formatter *formatter)
+{
+	entry->member_offset = offset;
+	entry->formatter = formatter;
+}
+
+#define INIT_MOCK_STRUCT_FORMATTER_ENTRY(entry, type, member, formatter)       \
+		init_mock_struct_formatter_entry_internal(entry,	       \
+							  offsetof(type,       \
+								   member),    \
+								   formatter)
+
+static inline void INIT_MOCK_STRUCT_FORMATTER_ENTRY_LAST(
+		struct mock_struct_formatter_entry *entry)
+{
+	entry->formatter = NULL;
+}
+
+struct mock_param_formatter *mock_struct_formatter(
+		struct test *test,
+		const char *struct_name,
+		struct mock_struct_formatter_entry *entries);
+
+struct mock_param_formatter *mock_find_formatter(const char *type_name);
+
+#define FORMATTER_FROM_TYPE(type) mock_find_formatter(#type)
+
+extern struct mock_param_formatter unknown_formatter[];
+
 #endif /* _KUNIT_MOCK_H */
diff --git a/kunit/common-mocks.c b/kunit/common-mocks.c
index ef88f8b8acda3..1c52522808cab 100644
--- a/kunit/common-mocks.c
+++ b/kunit/common-mocks.c
@@ -386,3 +386,135 @@ DEFINE_RETURN_ACTION_WITH_TYPENAME(longlong, long long);
 DEFINE_RETURN_ACTION_WITH_TYPENAME(ulonglong, unsigned long long);
 DEFINE_RETURN_ACTION_WITH_TYPENAME(ptr, void *);
 
+struct mock_param_integer_formatter {
+	struct mock_param_formatter formatter;
+	const char *fmt_str;
+};
+
+static void mock_format_integer(struct mock_param_formatter *pformatter,
+				struct test_stream *stream,
+				const void *pparam)
+{
+	struct mock_param_integer_formatter *formatter =
+			container_of(pformatter,
+				     struct mock_param_integer_formatter,
+				     formatter);
+	long long param = CONVERT_TO_ACTUAL_TYPE(long long, pparam);
+
+	stream->add(stream, formatter->fmt_str, param);
+}
+
+#define INTEGER_FORMATTER_INIT(type, fmt) { \
+	.formatter = { \
+		.type_name = #type, \
+		.format = mock_format_integer, \
+	}, \
+	.fmt_str = fmt, \
+}
+
+static struct mock_param_integer_formatter integer_formatters[] = {
+	INTEGER_FORMATTER_INIT(u8, "%PRIu8"),
+	INTEGER_FORMATTER_INIT(u16, "%PRIu16"),
+	INTEGER_FORMATTER_INIT(u32, "%PRIu32"),
+	INTEGER_FORMATTER_INIT(u64, "%PRIu64"),
+	INTEGER_FORMATTER_INIT(char, "%c"),
+	INTEGER_FORMATTER_INIT(unsigned char, "%hhu"),
+	INTEGER_FORMATTER_INIT(signed char, "%hhd"),
+	INTEGER_FORMATTER_INIT(short, "%hd"),
+	INTEGER_FORMATTER_INIT(unsigned short, "%hu"),
+	INTEGER_FORMATTER_INIT(int, "%d"),
+	INTEGER_FORMATTER_INIT(unsigned int, "%u"),
+	INTEGER_FORMATTER_INIT(long, "%ld"),
+	INTEGER_FORMATTER_INIT(unsigned long, "%lu"),
+	INTEGER_FORMATTER_INIT(long long, "%lld"),
+	INTEGER_FORMATTER_INIT(unsigned long long, "%llu"),
+	INTEGER_FORMATTER_INIT(void *, "%px"),
+};
+
+static void mock_format_string(struct mock_param_formatter *formatter,
+			       struct test_stream *stream,
+			       const void *pparam)
+{
+	const char *param = CONVERT_TO_ACTUAL_TYPE(const char *, pparam);
+
+	stream->add(stream, "%s", param);
+}
+
+static struct mock_param_formatter string_formatter = {
+	.type_name = "const char *",
+	.format = mock_format_string,
+};
+
+static void mock_format_unknown(struct mock_param_formatter *formatter,
+				struct test_stream *stream,
+				const void *param)
+{
+	stream->add(stream, "%pS", param);
+}
+
+struct mock_param_formatter unknown_formatter[] = {
+	{
+		.type_name = "<unknown>",
+		.format = mock_format_unknown,
+	},
+	{},
+};
+
+static int mock_register_all_formatters(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(integer_formatters); i++)
+		mock_register_formatter(&integer_formatters[i].formatter);
+
+	mock_register_formatter(&string_formatter);
+
+	return 0;
+}
+test_pure_initcall(mock_register_all_formatters);
+
+struct mock_struct_formatter {
+	struct mock_param_formatter formatter;
+	const char *type_name;
+	struct mock_struct_formatter_entry *entries;
+};
+
+static void mock_format_struct(struct mock_param_formatter *pformatter,
+			       struct test_stream *stream,
+			       const void *pparam)
+{
+	struct mock_struct_formatter *formatter =
+			container_of(pformatter,
+				     struct mock_struct_formatter,
+				     formatter);
+	struct mock_struct_formatter_entry *entry;
+	const char *param = CONVERT_TO_ACTUAL_TYPE(const char *, pparam);
+	const char *member_ptr;
+
+	stream->add(stream, "%s {", formatter->type_name);
+	for (entry = formatter->entries; entry->formatter; entry++) {
+		member_ptr = param + entry->member_offset;
+		entry->formatter->format(entry->formatter, stream, member_ptr);
+		stream->add(stream, ", ");
+	}
+	stream->add(stream, "}");
+}
+
+struct mock_param_formatter *mock_struct_formatter(
+		struct test *test,
+		const char *type_name,
+		struct mock_struct_formatter_entry *entries)
+{
+	struct mock_struct_formatter *formatter;
+
+	formatter = test_kzalloc(test, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return NULL;
+
+	formatter->formatter.type_name = type_name;
+	formatter->formatter.format = mock_format_struct;
+	formatter->type_name = type_name;
+	formatter->entries = entries;
+
+	return &formatter->formatter;
+}
diff --git a/kunit/mock.c b/kunit/mock.c
index 424c612de553b..9be6b2d3621c4 100644
--- a/kunit/mock.c
+++ b/kunit/mock.c
@@ -186,15 +186,53 @@ int mock_set_default_action(struct mock *mock,
 	return 0;
 }
 
+struct mock_param_formatter_repo {
+	struct list_head formatters;
+};
+
+static struct mock_param_formatter_repo mock_param_formatter_repo = {
+	.formatters = LIST_HEAD_INIT(mock_param_formatter_repo.formatters),
+};
+
+void mock_register_formatter(struct mock_param_formatter *formatter)
+{
+	list_add_tail(&formatter->node, &mock_param_formatter_repo.formatters);
+}
+
+void mock_unregister_formatter(struct mock_param_formatter *formatter)
+{
+	list_del(&formatter->node);
+}
+
+struct mock_param_formatter *mock_find_formatter(const char *type_name)
+{
+	struct mock_param_formatter *formatter;
+
+	list_for_each_entry(formatter,
+			    &mock_param_formatter_repo.formatters,
+			    node) {
+		if (!strcmp(type_name, formatter->type_name))
+			return formatter;
+	}
+
+	return NULL;
+}
+
 static void mock_format_param(struct test_stream *stream,
 			      const char *type_name,
 			      const void *param)
 {
-	/*
-	 * Cannot find formatter, so just print the pointer of the
-	 * symbol.
-	 */
-	stream->add(stream, "<%pS>", param);
+	struct mock_param_formatter *formatter;
+
+	formatter = mock_find_formatter(type_name);
+	if (formatter)
+		formatter->format(formatter, stream, param);
+	else
+		/*
+		 * Cannot find formatter, so just print the pointer of the
+		 * symbol.
+		 */
+		stream->add(stream, "<%pS>", param);
 }
 
 static void mock_add_method_declaration_to_stream(
diff --git a/kunit/test-stream-test.c b/kunit/test-stream-test.c
index 875b0db15878d..b335e09805a0f 100644
--- a/kunit/test-stream-test.c
+++ b/kunit/test-stream-test.c
@@ -116,6 +116,7 @@ static void test_stream_test_commits_any_uncommitted_when_cleanup(
 
 static int test_stream_test_init(struct test *test)
 {
+	struct mock_struct_formatter_entry *entries;
 	struct test_stream_test_context *ctx;
 
 	ctx = test_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
@@ -131,9 +132,35 @@ static int test_stream_test_init(struct test *test)
 	if (!ctx->stream)
 		return -ENOMEM;
 
+	entries = test_kzalloc(test, sizeof(*entries) * 3, GFP_KERNEL);
+	if (!entries) {
+		test_warn(test,
+			  "Could not allocate arg formatter for struct va_format");
+		return 0;
+	}
+
+	INIT_MOCK_STRUCT_FORMATTER_ENTRY(&entries[0],
+					 struct va_format,
+					 fmt,
+					 FORMATTER_FROM_TYPE(const char *));
+	INIT_MOCK_STRUCT_FORMATTER_ENTRY(&entries[1],
+					 struct va_format,
+					 va,
+					 unknown_formatter);
+	INIT_MOCK_STRUCT_FORMATTER_ENTRY_LAST(&entries[2]);
+
+	mock_register_formatter(mock_struct_formatter(test,
+						      "struct va_format *",
+						      entries));
+
 	return 0;
 }
 
+static void test_stream_test_exit(struct test *test)
+{
+	mock_unregister_formatter(mock_find_formatter("struct va_format *"));
+}
+
 static struct test_case test_stream_test_cases[] = {
 	TEST_CASE(test_stream_test_add),
 	TEST_CASE(test_stream_test_append),
@@ -145,6 +172,7 @@ static struct test_case test_stream_test_cases[] = {
 static struct test_module test_stream_test_module = {
 	.name = "test-stream-test",
 	.init = test_stream_test_init,
+	.exit = test_stream_test_exit,
 	.test_cases = test_stream_test_cases,
 };
 module_test(test_stream_test_module);
-- 
2.19.1.331.ge82ca0e54c-goog
