From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:01 -0700
Subject: [RFC v1 12/31] checkpatch: added support for struct MOCK(foo) syntax
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-13-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016235101.SVB44nj4B130OUeTcIKwHtcSmVUPpJlUSEWr6uQFdkM@z>

This adds struct MOCK(foo) as a NonptrType so that it is recognized
correctly in declarations.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 scripts/checkpatch.pl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 447857ffaf6be..9806f190796de 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -745,6 +745,10 @@ sub build_types {
 			(?:
 				(?:typeof|__typeof__)\s*\([^\)]*\)|
 				(?:$typeTypedefs\b)|
+				# Matching a \b breaks struct MOCK(foo) syntax,
+				# so we need to have it not lumped in with the
+				# types in @typeList.
+				(?:struct\s+MOCK\($Ident\))|
 				(?:${all}\b)
 			)
 			(?:\s+$Modifier|\s+const)*
-- 
2.19.1.331.ge82ca0e54c-goog
