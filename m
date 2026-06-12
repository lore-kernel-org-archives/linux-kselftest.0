Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3A3EA976;
	Fri, 12 Jun 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280355; cv=none; b=mzUkitmnRRlQfXy2TQXMFI9JOoKsN4EcHtJETfTkUMturvVpp5cCCK3uIEbLlJC5j4q/dLE3iTzfiPTZM1GvpE+Jdc0wye4Zr9KEv3iVX2sBX9wFQbBiTMHIvsTARHiL1s8l+5yS7N0CTqdpmqwTuxFHKL9skQVQO6S8VrTqQlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280355; c=relaxed/simple;
	bh=cRg+a9qucOtZBNJgsQ2iduOKFMHke87hohv4YWD3xd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jRpt0gutDE8R5x9lJM5zgBVIDvWF5Virf5obincuaeDOr379j4/VBQ8r2TKhN8ZCgnlmwdeaEefzq69AAbDlcsaLv11aPVUmR3B+LAQBV88pL4hONGvIh24xZRZyuYEwdHTj5c+XI550qDWzyR8YRy23jfbRLa0Ip1juDcvH0Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb3ruvTV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kb3ruvTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFF71F000E9;
	Fri, 12 Jun 2026 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280354;
	bh=vXPx915FPyROeaH1BXJ21X8rOWbYRAV9JqNbLkxK7o4=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=Kb3ruvTVifiBaPhJAgcZpc+xE4EGTDX4hirH/ABnHuaW9Evnox4tU2Kw76KkLv/oR
	 JxZkPuIP+tyBGzfShQxpe+IA1ggII+3X7iEjFdZ42ZtwmI4PolEUWZr1RKS+JBGC/b
	 SLNwk5AQUhjF1uh9klV3/UfivH/kg1IipvRv53ulPo2Mb9uprm1d3EKCK4jFgXNcus
	 PNM0Fa2AUkWDiDHHK+tAW1naetnjs6lT3RD6MTwvDA7GWDDWFxh8xsgkG9MF0EEVr6
	 40Frk74DiVo9eI57ocO+trLDsMfrd/Tv3zGGoeIdfOtsutk6qTfGvijrENCp2Rd3MG
	 F7qm7kuhllmwQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [RFC PATCH] rust: doctest: add source map script
Date: Fri, 12 Jun 2026 17:05:22 +0100
Message-ID: <20260612160523.3083792-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Quite often when updating abstractions there will be some documentation
that needs updating, but the build process is not very developer friendly
as it just gives out something like
"rust/doctests_kernel_generated.rs:12345:42" and it is a hassle to find
where the documentation actually is.

Add a script as rustc wrapper, which translates the error message by
appending a "(generated from original_file:original_line:col)" message to
the original source info emitted by rustc.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
I made this a rustc wrapper instead of trying to pipe rustc output to
it, as Kbuild is too complex for me to understand how to do it :)
---
 rust/Makefile                           |  4 ++
 scripts/rustdoc_test_build_sourcemap.py | 71 +++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 scripts/rustdoc_test_build_sourcemap.py

diff --git a/rust/Makefile b/rust/Makefile
index 63b1e355321d..d133d4fe1f2d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -393,6 +393,10 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
     $(objtree)/scripts/rustdoc_test_gen FORCE
 	+$(call if_changed,rustdoc_test_kernel)
 
+ACTUAL_RUSTC := $(RUSTC_OR_CLIPPY)
+%/doctests_kernel_generated.o: private RUSTC_OR_CLIPPY = \
+	PYTHONDONTWRITEBYTECODE=1 ACTUAL_RUSTC=$(ACTUAL_RUSTC) $(PYTHON3) $(srctree)/scripts/rustdoc_test_build_sourcemap.py
+
 # We cannot use `-Zpanic-abort-tests` because some tests are dynamic,
 # so for the moment we skip `-Cpanic=abort`.
 quiet_cmd_rustc_test = $(RUSTC_OR_CLIPPY_QUIET) T  $<
diff --git a/scripts/rustdoc_test_build_sourcemap.py b/scripts/rustdoc_test_build_sourcemap.py
new file mode 100644
index 000000000000..afabcd061567
--- /dev/null
+++ b/scripts/rustdoc_test_build_sourcemap.py
@@ -0,0 +1,71 @@
+import sys
+import re
+import os
+import subprocess
+
+LOCATION_REGEX = re.compile(r"\.location: (.*):(\d+)")
+ANCHOR_REGEX = re.compile(r"static __DOCTEST_ANCHOR: i32 = .* \+ (\d+) \+ (\d+);")
+SOURCE_INFO_REGEX = re.compile(r"(rust/[\w/.-]+\.rs):(\d+):(\d+)")
+
+
+def transform(file, line):
+    with open(file, "r") as f:
+        lines = f.readlines()
+
+    line_idx = line - 1
+
+    # Find the last location and anchor before the erroring line
+    real_path = None
+    orig_line = None
+    anchor_line = None
+
+    for i in range(line_idx, -1, -1):
+        if real_path is None:
+            match = LOCATION_REGEX.search(lines[i])
+            if match:
+                real_path = match.group(1)
+                orig_line = int(match.group(2))
+
+        if anchor_line is None:
+            match = ANCHOR_REGEX.search(lines[i])
+            if match:
+                anchor_line = i + int(match.group(1)) + int(match.group(2))
+
+        if real_path is not None and anchor_line is not None:
+            break
+
+    new_line = orig_line + (line_idx - anchor_line)
+    return real_path, new_line
+
+
+def main():
+    actual_rustc = os.environ.get("ACTUAL_RUSTC")
+    args = sys.argv[1:]
+
+    # We redirected Rust output so it is not TTY anymore.
+    # Add `--color=always` back to preserve the color behaviour.
+    if sys.stdout.isatty() and not any(arg.startswith("--color") for arg in args):
+        args.append("--color=always")
+
+    result = subprocess.run([actual_rustc] + args, stderr=subprocess.PIPE, text=True)
+
+    def replacer(match):
+        orig = match.group(0)
+        file = match.group(1)
+        line = int(match.group(2))
+        col = int(match.group(3))
+
+        if file != "rust/doctests_kernel_generated.rs":
+            return orig
+
+        new_file, new_line = transform(file, line)
+        return f"{orig} (generated from {new_file}:{new_line}:{col})"
+
+    if result.stderr:
+        sys.stderr.write(SOURCE_INFO_REGEX.sub(replacer, result.stderr))
+
+    sys.exit(result.returncode)
+
+
+if __name__ == "__main__":
+    main()

base-commit: 3782319656f65f0bf020d4c058058c23c3e16679
-- 
2.54.0

