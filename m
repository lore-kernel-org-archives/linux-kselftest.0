From: sashal@kernel.org (Sasha Levin)
Date: Wed, 12 Dec 2018 23:27:31 -0500
Subject: [PATCH AUTOSEL 4.19 06/73] tools/bpf: fix two test_btf unit test cases
In-Reply-To: <20181213042838.75160-1-sashal@kernel.org>
References: <20181213042838.75160-1-sashal@kernel.org>
Message-ID: <20181213042838.75160-6-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181213042731._JoxWg1RO1MtV69PhpWqgB69mi2aoJeLhveAgjkn9xY@z>

From: Martin KaFai Lau <kafai@fb.com>

[ Upstream commit 8800cd031af085807028656c6ba7eb7908d78262 ]

There are two unit test cases, which should encode
TYPEDEF type, but instead encode PTR type.
The error is flagged out after enforcing name
checking in the previous patch.

Fixes: c0fa1b6c3efc ("bpf: btf: Add BTF tests")
Signed-off-by: Martin KaFai Lau <kafai at fb.com>
Signed-off-by: Yonghong Song <yhs at fb.com>
Signed-off-by: Alexei Starovoitov <ast at kernel.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/test_btf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_btf.c b/tools/testing/selftests/bpf/test_btf.c
index 6b5cfeb7a9cc..4909aab4d6ab 100644
--- a/tools/testing/selftests/bpf/test_btf.c
+++ b/tools/testing/selftests/bpf/test_btf.c
@@ -431,11 +431,11 @@ static struct btf_raw_test raw_tests[] = {
 		/* const void* */	/* [3] */
 		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_PTR, 0, 0), 2),
 		/* typedef const void * const_void_ptr */
-		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_PTR, 0, 0), 3),
-		/* struct A { */	/* [4] */
+		BTF_TYPEDEF_ENC(NAME_TBD, 3),	/* [4] */
+		/* struct A { */	/* [5] */
 		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 0, 1), sizeof(void *)),
 		/* const_void_ptr m; */
-		BTF_MEMBER_ENC(NAME_TBD, 3, 0),
+		BTF_MEMBER_ENC(NAME_TBD, 4, 0),
 		/* } */
 		BTF_END_RAW,
 	},
@@ -493,10 +493,10 @@ static struct btf_raw_test raw_tests[] = {
 		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_CONST, 0, 0), 0),
 		/* const void* */	/* [3] */
 		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_PTR, 0, 0), 2),
-		/* typedef const void * const_void_ptr */	/* [4] */
-		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_PTR, 0, 0), 3),
-		/* const_void_ptr[4] */	/* [5] */
-		BTF_TYPE_ARRAY_ENC(3, 1, 4),
+		/* typedef const void * const_void_ptr */
+		BTF_TYPEDEF_ENC(NAME_TBD, 3),	/* [4] */
+		/* const_void_ptr[4] */
+		BTF_TYPE_ARRAY_ENC(4, 1, 4),	/* [5] */
 		BTF_END_RAW,
 	},
 	.str_sec = "\0const_void_ptr",
-- 
2.19.1
