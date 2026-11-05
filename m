Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888066;
	b=KQvs9NrPtU/brQSYKz/a2w2r3OCYvMcvc19HQftP2V0IBJEYOzLdjUFHES5gShMY+X3N
	 LyMgEQqh6FfXjvYs49uW7af2S2qkFeuW2SOaQPzZ5lhRg9Fg8SsMopIFEPqN72RrJSYrr
	 5yAjNJnc7cz9M+PasiJh0Nu0Yp0wAj5acmeZBgFa0eudB4NX8CcBUmgOfEHb3tIJTimQ3
	 wTPYwsdmVXTxjWi6aPV4kM2VmYU8T3U3H4d3i/b6b0tqnA5Q4fLBJgM/GEJyiMDazMRQk
	 cNs3AAGcuZUCTDyG0C3C7VSwBXIm5KEWdrAB7kdcvOs0q53jcvGNG6cf+37dHdBBcDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888066;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JaFNBICnDdPCLlh39J8HL/jFsqPXyL5DSOVxdTHU0bA=;
	b=sKdZX1QEJa8A/6tC/FB8mDpSk+eDAcMkQjhD0gvgeUxnB4vmvUzYcnSWr8xEuvGn2a9t
	 E+2i2pfvQ2OXsQ+Nb5SP2hAHJHnWMsHhE2G6hp2uuLvZIUq7z2tOVpWbSGzYMXq2mz7VP
	 yiolV5MXwg8dTST+rhXqxyU9k8ekLjS8E7O+OsdnFJxK7A37vMu1zjK4RB9VROVOmOZmt
	 3PtsR1cqT3GbJZyz3+FtfNbju58F3i7LQdZOJc/V+SP1kx8FGtVfiyi7ziByE8RnnAzDr
	 /wh+4Iai1KbbVcfT7NhLTGoLk25P/h6PVrsPpLRKtqsB8/CtZoi8UO0IhEBPM2Ns+cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="of/iMNsb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AF0606A335;
	Thu,  5 Nov 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=of/iMNsb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7698A1F00A1A;
	Thu,  5 Nov 2026 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888065;
	bh=JaFNBICnDdPCLlh39J8HL/jFsqPXyL5DSOVxdTHU0bA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=of/iMNsbg+g/4/lBA+rBUQhhcu84oIOLGHShWcXvgalKQSrhj4tVavsABo0UHiplg
	 t5bUNaAQwOoMWox5MelZbx03uuj9PP4fVWaSO/KN7j1vd95JyB8A3OqVSP9KzOKs4R
	 f9DXbjRnRxGBGQrIXAQTlfeaoBIZY5OoOvXrZCMVcTlzp3+5FgLCPfOtAzAcSDEqMk
	 jVmRnSlSkXQvsTF+TP4xcYAsDaDZFg01HJnFs+MrX9wFUb7UtZ6zBZJ2VcX3Yn0zXF
	 DecwVlAr1g5fbUkmQXsmmtxfl734qBjIP+JlWz9H9GOaa8kTopHM5jbtp1e1nD6dmZ
	 NstzMzdVsPeNw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:21 +0000
Subject: [PATCH v2 08/11] kselftest/arm64: Add a very simple VMM for use in
 fp-stress
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-8-81a5172468f0@kernel.org>
References: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
In-Reply-To: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=22633; i=broonie@kernel.org;
 h=from:subject:message-id; bh=97HoI/3oNghVcRbJoACpZGJjoxq11+pf21a7fKnSYdw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GueT1k0/99924fvBWcuj/w1SWpmgvi+25UrA6Uv/
 lsdU6fN0FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJtBUx/E/6enrvdJ6vrNlZ
 lbvPHL7R+yPGJeD1HXnFppyn61tPlF5jZLjf/Ono3DfL06+9LnL2ur3Q+8uvbu0V3l362k/DNaf
 0X+QEAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

In order to have fp-stress cover the interaction of KVM guests with the
rest of the floating point state management we need to provide some KVM
guest versions of the test loads that fp-stress runs.  fp-stress itself
expects to start test loads which continually load, save and verify the
floating point state, shutting down when requested via signals or if
they detect an error.  The host versions of these are written in
assembler and all follow a very similar template.

Provide a simple VMM for running under fp-stress which loads a flat
binary at a fixed address and runs it.  The guest can output characters
by writing to a MMIO address and can report errors by using PSCI to
request a shutdown.  If fp-stress sends a signal requesting a shutdown
the program exits.  We allocate some extra space after the test binary
for the program to use for it's stack, and provide a handler for guest
exceptions which logs the exception state based on the guest executing
BRK in all exception vectors.

fp-stress uses SIGUSR1 signals to peturb the scheduling and exercise the
signal handling paths, we add a handler for this which simply counts the
number of signals delivered (as we do in the host versions).  Exiting
the guest to userspace to handle the signals should still provide some
disruption, it would be better to do something more extensive like
saving and restoring at least the floating point register state in the
handler but we don't do that here.  We also include SIGUSR2 in the
count, this is also supported by the host versions as it can be useful
in manual testing.

Command line options are provided for enabling NV and SVE.  With NV we
start the guest at EL2 in VHE mode so the guest doesn't need to do
anything EL specific.  For SVE we configure the VL at the VMM level and
set all bits in ZCR_ELx.LEN so KVM is context switching the VL that is
configured.  We configure FPEN and ZEN in CPACR_ELx for the guest
because it's a little simpler than doing anything feature conditional in
guest code.  We don't do any validation of the combination of options
that is provided, we rely on the caller for that.

On the host the test programs differentiate data between instances by
using the PID, they store this in x20 so we prefill this for them with
our own PID.  The programs also log the number of iterations they have
run on exit, storing the number of iterations in x22.  When the host
requests an exit we log this value as part of a similar format clean
exit message to that generated by the host programs.

We don't use the generated sysreg-defs.h but instead replicate a few
defines from there, this is because an empty stub introduced as part of
8bc7c5e52558 (selftests: vDSO: don't include generated headers for
chacha test) breaks that.  This will be looked at separately, we should
fix it independently of this work.

This is all very much specialised for fp-stress - the VMM hard codes
specifics of register allocation in the guest code, it implements the
signal and exit code interface that fp-stress expects and we're not
making much effort to handle anything surprising the guest might do.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/.gitignore      |   1 +
 tools/testing/selftests/arm64/fp/Makefile        |   9 +-
 tools/testing/selftests/arm64/fp/fp-stress-vmm.c | 586 +++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/fp-stress-vmm.h |  17 +
 4 files changed, 612 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/.gitignore b/tools/testing/selftests/arm64/fp/.gitignore
index 8362e7ec35ad..229a5c65b65f 100644
--- a/tools/testing/selftests/arm64/fp/.gitignore
+++ b/tools/testing/selftests/arm64/fp/.gitignore
@@ -1,6 +1,7 @@
 fp-pidbench
 fp-ptrace
 fp-stress
+fp-stress-vmm
 fpsimd-test
 kernel-test
 rdvl-sme
diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
index d92a755837ff..3c4e17a34776 100644
--- a/tools/testing/selftests/arm64/fp/Makefile
+++ b/tools/testing/selftests/arm64/fp/Makefile
@@ -11,7 +11,7 @@ TEST_GEN_PROGS := \
 	sve-ptrace sve-probe-vls \
 	vec-syscfg \
 	za-fork za-ptrace
-TEST_GEN_PROGS_EXTENDED := fp-pidbench fpsimd-test \
+TEST_GEN_PROGS_EXTENDED := fp-pidbench fp-stress-vmm fpsimd-test \
 	kernel-test \
 	rdvl-sme rdvl-sve \
 	sve-test \
@@ -27,6 +27,13 @@ EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o \
 
 ASM_UTILS_LINUX := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
 
+# For sysreg definitons
+ARCH_INCLUDES := $(KHDR_INCLUDES) -I$(top_srcdir)/tools/arch/arm64/include \
+	-I$(top_srcdir)/tools/include \
+	-I$(top_srcdir)/tools/include/generated
+
+$(OUTPUT)/fp-stress-vmm: CFLAGS += $(ARCH_INCLUDES)
+
 # Build with nolibc to avoid effects due to libc's clone() support
 $(OUTPUT)/fp-pidbench: fp-pidbench.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
diff --git a/tools/testing/selftests/arm64/fp/fp-stress-vmm.c b/tools/testing/selftests/arm64/fp/fp-stress-vmm.c
new file mode 100644
index 000000000000..1a767b77cdd7
--- /dev/null
+++ b/tools/testing/selftests/arm64/fp/fp-stress-vmm.c
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Minimal arm64 KVM VMM used to run fp-stress test loads in VMs.
+ *
+ * Runs a single vCPU guest loaded from a flat binary read from a file, with
+ * PSCI 0.2 enabled so the guest can shut itself down via SYSTEM_OFF and a
+ * simple MMIO console for guest output.
+ *
+ * Unhandled guest exceptions are reported via the guest's vector
+ * table: each entry is a BRK instruction and we use software breakpoint
+ * debugging to us with KVM_EXIT_DEBUG.
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <signal.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include <linux/kvm.h>
+
+#include <asm/sigcontext.h>
+
+#include <asm/brk-imm.h>
+#include <asm/esr.h>
+#include <asm/sysreg.h>
+
+#include "fp-stress-vmm.h"
+
+#define ARM64_CORE_REG(name)					\
+	(KVM_REG_ARM64 | KVM_REG_SIZE_U64 | KVM_REG_ARM_CORE |	\
+	 KVM_REG_ARM_CORE_REG(name))
+
+#define CPACR_EL1	ARM64_SYS_REG(3, 0, 1, 0, 2)
+#define CPTR_EL2	ARM64_SYS_REG(3, 4, 1, 1, 2)
+#define ELR_EL2		ARM64_SYS_REG(3, 4, 4, 0, 1)
+#define ESR_EL1		ARM64_SYS_REG(3, 0, 5, 2, 0)
+#define ESR_EL2		ARM64_SYS_REG(3, 4, 5, 2, 0)
+#define FAR_EL1		ARM64_SYS_REG(3, 0, 6, 0, 0)
+#define FAR_EL2		ARM64_SYS_REG(3, 4, 6, 0, 0)
+#define HCR_EL2		ARM64_SYS_REG(3, 4, 1, 1, 0)
+#define ZCR_EL1		ARM64_SYS_REG(3, 0, 1, 2, 0)
+#define ZCR_EL2		ARM64_SYS_REG(3, 4, 1, 2, 0)
+
+/* Both halves of the field, as the guest's own no-trapping value */
+#define CPACR_EL1_FPEN	(CPACR_EL1_FPEN_EL1EN | CPACR_EL1_FPEN_EL0EN)
+#define CPACR_EL1_ZEN	(CPACR_EL1_ZEN_EL1EN | CPACR_EL1_ZEN_EL0EN)
+
+/* We should fix the build system to let us get these from sysreg-defs.h */
+#define HCR_EL2_E2H	BIT(34)
+#define ZCR_ELx_LEN	0xf
+
+/* VGIC MMIO ranges, below the console and guest RAM */
+#define VGIC_DIST_BASE		0x08000000
+#define VGIC_REDIST_BASE	0x08010000
+
+/* The vector length set is a bitmap of vector quadwords, index into it */
+#define vq_word(vq)	(((vq) - KVM_ARM64_SVE_VQ_MIN) / 64)
+#define vq_mask(vq)	(1ULL << (((vq) - KVM_ARM64_SVE_VQ_MIN) % 64))
+#define vq_present(vqs, vq) (!!((vqs)[vq_word(vq)] & vq_mask(vq)))
+
+/* The guest's vector entries BRK with their entry number as immediate */
+#define NR_VECTORS	16
+
+/* The vCPU our signal handler reports the state of, -1 until we have one */
+static int vcpu_fd = -1;
+
+static bool guest_el2;
+
+/* SVE vector length in bits for the guest, 0 for no SVE, from --sve */
+static int guest_sve_vl;
+
+static const char *const vector_origins[] = {
+	"current EL, SP_EL0",
+	"current EL, SP_ELx",
+	"lower EL, AArch64",
+	"lower EL, AArch32",
+};
+
+static const char *const vector_kinds[] = {
+	"synchronous", "IRQ", "FIQ", "SError",
+};
+
+static void __attribute__((noreturn, format(printf, 1, 2)))
+die(const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	vprintf(fmt, ap);
+	va_end(ap);
+	putchar('\n');
+
+	exit(EXIT_FAILURE);
+}
+
+static void __attribute__((noreturn)) die_perror(const char *what)
+{
+	die("%s: %d (%s)", what, errno, strerror(errno));
+}
+
+static void *load_guest(const char *path, size_t *ram_size)
+{
+	struct stat st;
+	long page_size;
+	ssize_t ret;
+	size_t off;
+	void *ram;
+	int fd;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		die("%s: %s", path, strerror(errno));
+
+	if (fstat(fd, &st))
+		die_perror("fstat");
+
+	if (!st.st_size)
+		die("%s: image is empty", path);
+
+	page_size = sysconf(_SC_PAGESIZE);
+	if (page_size < 0)
+		die_perror("sysconf(_SC_PAGESIZE)");
+
+	/* Guest memory is allocated in whole pages */
+	*ram_size = ((size_t)st.st_size + GUEST_EXTRA_RAM + page_size - 1) &
+		~((size_t)page_size - 1);
+
+	ram = mmap(NULL, *ram_size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (ram == MAP_FAILED)
+		die_perror("mmap(guest RAM)");
+
+	for (off = 0; off < (size_t)st.st_size; off += ret) {
+		ret = read(fd, (char *)ram + off, st.st_size - off);
+		if (ret < 0)
+			die_perror("read");
+		if (!ret)
+			die("%s: short read", path);
+	}
+
+	close(fd);
+
+	return ram;
+}
+
+static uint64_t get_reg(int vcpu_fd, uint64_t id)
+{
+	uint64_t val;
+	struct kvm_one_reg reg = {
+		.id = id,
+		.addr = (uint64_t)&val,
+	};
+
+	if (ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg))
+		die_perror("KVM_GET_ONE_REG");
+
+	return val;
+}
+
+/*
+ * The guest shouldn't be doing anything that results in us seeing an
+ * exception, report anything we do see as an error.
+ */
+static void __attribute__((noreturn))
+report_guest_exception(int vcpu_fd, unsigned int vector)
+{
+	uint64_t esr, elr, far, ec;
+	int el;
+
+	if (guest_el2) {
+		esr = get_reg(vcpu_fd, ESR_EL2);
+		elr = get_reg(vcpu_fd, ELR_EL2);
+		far = get_reg(vcpu_fd, FAR_EL2);
+		el = 2;
+	} else {
+		esr = get_reg(vcpu_fd, ESR_EL1);
+		elr = get_reg(vcpu_fd, ARM64_CORE_REG(elr_el1));
+		far = get_reg(vcpu_fd, FAR_EL1);
+		el = 1;
+	}
+
+	ec = ESR_ELx_EC(esr);
+
+	printf("Unhandled guest exception: %s, %s\n",
+	       vector_kinds[vector % 4], vector_origins[vector / 4]);
+	printf("  ESR_EL%d 0x%016lx (EC 0x%02lx)\n", el, esr, ec);
+	printf("  ELR_EL%d 0x%016lx FAR_EL%d 0x%016lx\n", el, elr, el, far);
+
+	exit(EXIT_FAILURE);
+}
+
+/*
+ * The natively built loads are poked with SIGUSR1 and SIGUSR2 while they
+ * run and count what they were sent in x23.  Those signals come to us
+ * rather than the guest so keep the count out here instead, the guest
+ * leaves its own x23 at zero.
+ */
+static volatile sig_atomic_t signal_count;
+
+static void handle_count_signal(int sig)
+{
+	signal_count++;
+}
+
+/*
+ * We were asked to stop, report where the guest got to and exit
+ * successfully in the same form as the natively built loads do from
+ * their own terminate handler.  They keep their iteration count in x22.
+ */
+static void handle_exit_signal(int sig)
+{
+	uint64_t iterations = 0;
+	char buf[128];
+	int len;
+
+	/* We can be signalled before there is a vCPU */
+	if (vcpu_fd >= 0)
+		iterations = get_reg(vcpu_fd, ARM64_CORE_REG(regs.regs[22]));
+
+	len = snprintf(buf, sizeof(buf),
+		       "Terminated by signal %d, iterations=%llu, signals=%llu\n",
+		       sig, (unsigned long long)iterations,
+		       (unsigned long long)signal_count);
+	write(STDOUT_FILENO, buf, len);
+
+	_exit(EXIT_SUCCESS);
+}
+
+/*
+ * Arrange for SIGTERM and SIGINT to stop us, reporting where the guest
+ * got to rather than dying on the spot, and for SIGUSR1 and SIGUSR2 to
+ * be counted.  Done before we have a VM so that we do not die by default
+ * action if we are signalled while setting one up.
+ */
+static void setup_signals(void)
+{
+	struct sigaction stop = { .sa_handler = handle_exit_signal };
+	struct sigaction count = { .sa_handler = handle_count_signal };
+
+	sigemptyset(&stop.sa_mask);
+	if (sigaction(SIGTERM, &stop, NULL) || sigaction(SIGINT, &stop, NULL))
+		die_perror("sigaction");
+
+	sigemptyset(&count.sa_mask);
+	sigaddset(&count.sa_mask, SIGUSR1);
+	sigaddset(&count.sa_mask, SIGUSR2);
+	if (sigaction(SIGUSR1, &count, NULL) || sigaction(SIGUSR2, &count, NULL))
+		die_perror("sigaction");
+}
+
+static void set_reg(int vcpu_fd, uint64_t id, uint64_t val)
+{
+	struct kvm_one_reg reg = {
+		.id = id,
+		.addr = (uint64_t)&val,
+	};
+
+	if (ioctl(vcpu_fd, KVM_SET_ONE_REG, &reg))
+		die_perror("KVM_SET_ONE_REG");
+}
+
+static void set_device_attr(int fd, uint32_t group, uint64_t attr,
+			    void *addr)
+{
+	struct kvm_device_attr device_attr = {
+		.group = group,
+		.attr = attr,
+		.addr = (uint64_t)addr,
+	};
+
+	if (ioctl(fd, KVM_SET_DEVICE_ATTR, &device_attr))
+		die_perror("KVM_SET_DEVICE_ATTR");
+}
+
+/*
+ * For NV we need a vGIC since KVM uses it to provide the virtual
+ * maintenance interrupt,
+ */
+static void setup_vgic(int vm_fd)
+{
+	struct kvm_create_device device = {
+		.type = KVM_DEV_TYPE_ARM_VGIC_V3,
+	};
+	uint64_t addr;
+
+	if (ioctl(vm_fd, KVM_CREATE_DEVICE, &device))
+		die_perror("KVM_CREATE_DEVICE(VGICv3)");
+
+	addr = VGIC_DIST_BASE;
+	set_device_attr(device.fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			KVM_VGIC_V3_ADDR_TYPE_DIST, &addr);
+
+	addr = VGIC_REDIST_BASE;
+	set_device_attr(device.fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			KVM_VGIC_V3_ADDR_TYPE_REDIST, &addr);
+
+	set_device_attr(device.fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+	close(device.fd);
+}
+
+/*
+ * Tell KVM which vector lengths the guest may use.  It can only limit
+ * the maximum rather than hide individual VLs, the set we ask for has to
+ * match the ones the host has exactly up to that maximum, so start from
+ * what KVM is offering us and mask off everything above what we want.
+ */
+static void setup_sve(int vl)
+{
+	__u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
+	struct kvm_one_reg reg = {
+		.id = KVM_REG_ARM64_SVE_VLS,
+		.addr = (uint64_t)vqs,
+	};
+	/* Our VLs are in bits, the vector quadword helpers work in bytes */
+	unsigned int max_vq = sve_vq_from_vl(vl / 8);
+	int feature = KVM_ARM_VCPU_SVE;
+	unsigned int vq;
+
+	if (ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg))
+		die_perror("KVM_GET_ONE_REG(SVE_VLS)");
+
+	if (!vq_present(vqs, max_vq))
+		die("KVM has no SVE VL %d", vl);
+
+	for (vq = max_vq + 1; vq <= KVM_ARM64_SVE_VQ_MAX; vq++)
+		vqs[vq_word(vq)] &= ~vq_mask(vq);
+
+	if (ioctl(vcpu_fd, KVM_SET_ONE_REG, &reg))
+		die_perror("KVM_SET_ONE_REG(SVE_VLS)");
+
+	if (ioctl(vcpu_fd, KVM_ARM_VCPU_FINALIZE, &feature))
+		die_perror("KVM_ARM_VCPU_FINALIZE(SVE)");
+
+	/* Rely on the VM level configuration to constrain the VL */
+	if (guest_el2)
+		set_reg(vcpu_fd, ZCR_EL2, ZCR_ELx_LEN);
+	set_reg(vcpu_fd, ZCR_EL1, ZCR_ELx_LEN);
+}
+
+static void setup_vm(const char *path, struct kvm_run **run)
+{
+	struct kvm_userspace_memory_region mem;
+	struct kvm_guest_debug dbg;
+	struct kvm_vcpu_init init;
+	uint64_t cpacr, pstate;
+	int kvm_fd, vm_fd;
+	size_t ram_size;
+	long mmap_size;
+	void *ram;
+
+	kvm_fd = open("/dev/kvm", O_RDWR | O_CLOEXEC);
+	if (kvm_fd < 0)
+		die_perror("/dev/kvm");
+
+	if (ioctl(kvm_fd, KVM_GET_API_VERSION, 0) != KVM_API_VERSION)
+		die("KVM API version mismatch");
+
+	vm_fd = ioctl(kvm_fd, KVM_CREATE_VM, 0);
+	if (vm_fd < 0)
+		die_perror("KVM_CREATE_VM");
+
+	ram = load_guest(path, &ram_size);
+
+	mem = (struct kvm_userspace_memory_region) {
+		.slot = 0,
+		.guest_phys_addr = GUEST_RAM_BASE,
+		.memory_size = ram_size,
+		.userspace_addr = (uint64_t)ram,
+	};
+	if (ioctl(vm_fd, KVM_SET_USER_MEMORY_REGION, &mem))
+		die_perror("KVM_SET_USER_MEMORY_REGION");
+
+	vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
+	if (vcpu_fd < 0)
+		die_perror("KVM_CREATE_VCPU");
+
+	if (ioctl(vm_fd, KVM_ARM_PREFERRED_TARGET, &init))
+		die_perror("KVM_ARM_PREFERRED_TARGET");
+
+	if (!ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_PSCI_0_2))
+		die("KVM_CAP_ARM_PSCI_0_2 not supported");
+	init.features[0] |= 1UL << KVM_ARM_VCPU_PSCI_0_2;
+
+	/*
+	 * Running the guest at EL2 gets us coverage of the nested paths
+	 * through the floating point context switching.
+	 */
+	if (guest_el2) {
+		if (!ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_EL2))
+			die("KVM_CAP_ARM_EL2 not supported");
+		init.features[0] |= 1UL << KVM_ARM_VCPU_HAS_EL2;
+	}
+
+	if (guest_sve_vl) {
+		if (!ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE))
+			die("KVM_CAP_ARM_SVE not supported");
+		init.features[0] |= 1UL << KVM_ARM_VCPU_SVE;
+	}
+
+	if (ioctl(vcpu_fd, KVM_ARM_VCPU_INIT, &init))
+		die_perror("KVM_ARM_VCPU_INIT");
+
+	/*
+	 * A vGIC is only needed for EL2 guests so skip otherwise,
+	 * avoids issues with configuring on GICv2 systems.
+	 */
+	if (guest_el2)
+		setup_vgic(vm_fd);
+
+	if (guest_sve_vl)
+		setup_sve(guest_sve_vl);
+
+	set_reg(vcpu_fd, ARM64_CORE_REG(regs.pc), GUEST_RAM_BASE);
+
+	/*
+	 * Disable FP traps for the guest, we set things up here since it's
+	 * easier than looking at ID registers in the guest.
+	 */
+	if (guest_el2) {
+		cpacr = get_reg(vcpu_fd, CPTR_EL2) | CPACR_EL1_FPEN;
+		if (guest_sve_vl)
+			cpacr |= CPACR_EL1_ZEN;
+		set_reg(vcpu_fd, CPTR_EL2, cpacr);
+
+	}
+	cpacr = get_reg(vcpu_fd, CPACR_EL1) | CPACR_EL1_FPEN;
+	if (guest_sve_vl)
+		cpacr |= CPACR_EL1_ZEN;
+	set_reg(vcpu_fd, CPACR_EL1, cpacr);
+
+	/*
+	 * An EL2 guest needs to be in VHE mode, everything it sets up
+	 * uses the EL1 registers and those only reach the EL2 ones it is
+	 * really running on while E2H is set.  KVM only sets E2H for us
+	 * at reset on hardware without FEAT_E2H0.
+	 */
+	if (guest_el2)
+		set_reg(vcpu_fd, HCR_EL2,
+			get_reg(vcpu_fd, HCR_EL2) | HCR_EL2_E2H);
+
+	/*
+	 * Guests can't use getpid() to disambiguate their data, let's call
+	 * it for them.
+	 */
+	set_reg(vcpu_fd, ARM64_CORE_REG(regs.regs[20]), getpid());
+
+	/*
+	 * Trap guest BRKs to us so the guest's vector stubs can report
+	 * unhandled exceptions.
+	 */
+	if (!ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_SET_GUEST_DEBUG))
+		die("KVM_CAP_SET_GUEST_DEBUG not supported");
+
+	dbg = (struct kvm_guest_debug) {
+		.control = KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP,
+	};
+	if (ioctl(vcpu_fd, KVM_SET_GUEST_DEBUG, &dbg))
+		die_perror("KVM_SET_GUEST_DEBUG");
+
+	mmap_size = ioctl(kvm_fd, KVM_GET_VCPU_MMAP_SIZE, 0);
+	if (mmap_size < 0)
+		die_perror("KVM_GET_VCPU_MMAP_SIZE");
+
+	*run = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		    vcpu_fd, 0);
+	if (*run == MAP_FAILED)
+		die_perror("mmap(kvm_run)");
+
+	/* Mask everything by default, and start in the expected mode */
+	pstate = PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT;
+	if (guest_el2)
+		pstate |= PSR_MODE_EL2h;
+	else
+		pstate |= PSR_MODE_EL1h;
+	set_reg(vcpu_fd, ARM64_CORE_REG(regs.pstate), pstate);
+}
+
+static const struct option options[] = {
+	{ "el1", no_argument, NULL, 'e' },
+	{ "el2", no_argument, NULL, 'E' },
+	{ "sve", required_argument, NULL, 's' },
+	{ }
+};
+
+int main(int argc, char *argv[])
+{
+	struct kvm_run *run;
+	int c;
+
+	while ((c = getopt_long(argc, argv, "es:", options, NULL)) != -1) {
+		switch (c) {
+		case 'e':
+			break;
+		case 'E':
+			guest_el2 = true;
+			break;
+		case 's':
+			if (sscanf(optarg, "%d", &guest_sve_vl) != 1)
+				die("Failed to parse SVE VL %s", optarg);
+			if (guest_sve_vl < 128 || guest_sve_vl % 128 ||
+			    guest_sve_vl / 8 > __SVE_VL_MAX)
+				die("Invalid SVE VL %d", guest_sve_vl);
+			break;
+		default:
+			die("Usage: %s [--el2] [--sve VL] <guest image>",
+			    argv[0]);
+		}
+	}
+
+	if (optind != argc - 1)
+		die("Usage: %s [--el2] [--sve VL] <guest image>",
+		    argv[0]);
+
+	/* Ensure output is unbuffered to get it to the monitor promptly */
+	setvbuf(stdout, NULL, _IONBF, 0);
+
+	setup_signals();
+
+	setup_vm(argv[optind], &run);
+
+	for (;;) {
+		if (ioctl(vcpu_fd, KVM_RUN, 0)) {
+			/*
+			 * The signals we handle do not come back here,
+			 * anything else that interrupts us can just go
+			 * round again.
+			 */
+			if (errno == EINTR)
+				continue;
+
+			die_perror("KVM_RUN");
+		}
+
+		switch (run->exit_reason) {
+		case KVM_EXIT_MMIO:
+			if (!run->mmio.is_write ||
+			    run->mmio.phys_addr != CONSOLE_BASE ||
+			    run->mmio.len != 1)
+				die("Unhandled MMIO %s at 0x%llx len %u",
+				    run->mmio.is_write ? "write" : "read",
+				    run->mmio.phys_addr, run->mmio.len);
+
+			putchar(run->mmio.data[0]);
+			break;
+		case KVM_EXIT_DEBUG: {
+			uint32_t esr = run->debug.arch.hsr;
+
+			if (ESR_ELx_EC(esr) != ESR_ELx_EC_BRK64 ||
+			    esr_brk_comment(esr) >= NR_VECTORS)
+				die("Unexpected debug exit, ESR 0x%x", esr);
+
+			report_guest_exception(vcpu_fd, esr_brk_comment(esr));
+		}
+		case KVM_EXIT_SYSTEM_EVENT:
+			switch (run->system_event.type) {
+			case KVM_SYSTEM_EVENT_SHUTDOWN:
+				/*
+				 * The guest should report errors by logging
+				 * and shutting down, add our own log in case
+				 * we get here without a log.
+				 */
+				die("Guest requested shutdown");
+			default:
+				die("Unexpected system event %u",
+				    run->system_event.type);
+			}
+			break;
+		default:
+			die("Unexpected exit reason %u", run->exit_reason);
+		}
+	}
+
+	/* We should never get here */
+	return EXIT_FAILURE;
+}
diff --git a/tools/testing/selftests/arm64/fp/fp-stress-vmm.h b/tools/testing/selftests/arm64/fp/fp-stress-vmm.h
new file mode 100644
index 000000000000..cdf96b617db5
--- /dev/null
+++ b/tools/testing/selftests/arm64/fp/fp-stress-vmm.h
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#ifndef FP_STRESS_H
+#define FP_STRESS_H
+
+#define GUEST_RAM_BASE  0x80000000
+
+/* For stack */
+#define GUEST_EXTRA_RAM (1024 * 1024)
+
+/*
+ * Console: byte writes to CONSOLE_BASE are emitted on stdout.  Not
+ * backed by a memslot, so guest accesses trap with KVM_EXIT_MMIO.
+ */
+#define CONSOLE_BASE    0x09000000
+
+#endif

-- 
2.47.3

