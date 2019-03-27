From: sashal@kernel.org (Sasha Levin)
Date: Wed, 27 Mar 2019 14:01:13 -0400
Subject: [PATCH AUTOSEL 5.0 218/262] selftests/bpf: suppress readelf stderr
 when probing for BTF support
In-Reply-To: <20190327180158.10245-1-sashal@kernel.org>
References: <20190327180158.10245-1-sashal@kernel.org>
Message-ID: <20190327180158.10245-218-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190327180113.-mFnKMcfr3VoYZOBcMTPY7rej-OQnWxp5jRRE2y-euw@z>

From: Stanislav Fomichev <sdf@google.com>

[ Upstream commit 2f0921262ba943fe9d9f59037a033927d8c4789b ]

Before:
$ make -s -C tools/testing/selftests/bpf
readelf: Error: Missing knowledge of 32-bit reloc types used in DWARF
sections of machine number 247
readelf: Warning: unable to apply unsupported reloc type 10 to section
.debug_info
readelf: Warning: unable to apply unsupported reloc type 1 to section
.debug_info
readelf: Warning: unable to apply unsupported reloc type 10 to section
.debug_info

After:
$ make -s -C tools/testing/selftests/bpf

v2:
* use llvm-readelf instead of redirecting binutils' readelf stderr to
  /dev/null

Signed-off-by: Stanislav Fomichev <sdf at google.com>
Acked-by: Song Liu <songliubraving at fb.com>
Signed-off-by: Daniel Borkmann <daniel at iogearbox.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 41ab7a3668b3..936f726f7cd9 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -96,6 +96,7 @@ $(BPFOBJ): force
 CLANG ?= clang
 LLC   ?= llc
 LLVM_OBJCOPY ?= llvm-objcopy
+LLVM_READELF ?= llvm-readelf
 BTF_PAHOLE ?= pahole
 
 PROBE := $(shell $(LLC) -march=bpf -mcpu=probe -filetype=null /dev/null 2>&1)
@@ -132,7 +133,7 @@ BTF_PAHOLE_PROBE := $(shell $(BTF_PAHOLE) --help 2>&1 | grep BTF)
 BTF_OBJCOPY_PROBE := $(shell $(LLVM_OBJCOPY) --help 2>&1 | grep -i 'usage.*llvm')
 BTF_LLVM_PROBE := $(shell echo "int main() { return 0; }" | \
 			  $(CLANG) -target bpf -O2 -g -c -x c - -o ./llvm_btf_verify.o; \
-			  readelf -S ./llvm_btf_verify.o | grep BTF; \
+			  $(LLVM_READELF) -S ./llvm_btf_verify.o | grep BTF; \
 			  /bin/rm -f ./llvm_btf_verify.o)
 
 ifneq ($(BTF_LLVM_PROBE),)
-- 
2.19.1
