Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3855913AD05
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 00:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773446452; cv=none; b=EIrkQxnrm7Jih0sj0RAkbPPOQ3lorl0uMIMYyDgF/cwh6vv3U0YKJUWFNyXU3MDWDf60j4qw33qhpYgSmZPQZ49a2PWx2GwmxNk30tE+2Cmbd7tRSnyjIYLZ2d02rQ4iAS9JC8mGZp5YWMYW3Wn//LJz5hgCWoR9pRjankxRX9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773446452; c=relaxed/simple;
	bh=3QJbJv8nDTe9UFWDuhjUpYU/uYCzaMl40LclqolWBe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SILZd9Iq3jjQtSfeVXKB5Ux10FJHyLSJr5hk8sD5O8BEoxufFl9ECUsJiWtTpeyd3zuDd/44lknjxQ+tX4W8tjVQsSBBJ0BN7r6O3EKa5Xp8sVOEa4/oAcYdyq1SadNrYi+irF1jZwQtM2zWtL6Qu28uhTs/sH/auaI6NW5Mtb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY9C0Kum; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY9C0Kum"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79901821bb0so30466967b3.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 17:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773446450; x=1774051250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Z7785Nihx26mdg32kyA0yD1bLg4oGypoWx8npW/Glg=;
        b=KY9C0KumKzeU02ILZfuBgAwQviCfd0XPb8iCT0FGtxktjJ5mEWdZ5n2ii+WvGZYECf
         niQ22wo9yDCs25cEI+VxGqjb6eTSwg+B+yD0SFufneNbt2EywYbrgHlN9ItLyYTGPtwO
         i8OVPX4fLpO6SYHWXHhPhryYYj4VdJhbOBGLyqmYScFczQPStJXgfOlZwX/AbR7weKXA
         5Rvpgrt3iunzW8nMsg7oBl/ytCeE6X597f0NPF0VKLLOHTkUh8txZd0eN/U9haP75i+t
         U7fAXp7o37v/fidONvqXsXq5UVrMx01sihK0CvkAONn1wtHuzG2QYAjSYzZUP0xENGyS
         VJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773446450; x=1774051250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Z7785Nihx26mdg32kyA0yD1bLg4oGypoWx8npW/Glg=;
        b=ZOvA62W9iuvKYzNfKPpgJpaAxguMDXeIPquJ9Ri/cvAOXM7Tc7sIpnCUTDbIDvjZVI
         F+b/mhTGy06d4TOhVYOnwWssgeNwjWEKEGbbUmbREfmMiQM/X9UI34QqZIsMmFvjVWau
         zuFZrerPyIA9eQSznNa0OC0xQ0BnubN3Mh+tVric7W2d9C6t3mHQiYYAfVXDlBhMDbtl
         obHR002u20dqe2Xo1DWiSqn5oEQgKtxsmZl2gTURnFxcBJfxxcwsvR89H0OHwp0W9hb9
         R9fYYrfJwFECVbu5U18x4Dt+89HqUG0ayLrSJxVONdLUTvE+DYJ1xy0JFzkEjK4QXlAK
         TBkw==
X-Forwarded-Encrypted: i=1; AJvYcCUDHL892ax6qkgHdSpF1UXYzfBA2YvyPEoGud2C9KXXFsgjDtGrDItK3udtptZ/lhMeUOoaip3E6acIG+7PQL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6CZ8xCAB1cA/Isp7/4Hz7brbLK+rreeObHThatFxgVRoxVkYh
	3Tcn8glSMnhwHAyvB/T6wrBPExfN54N5zfuPfuRuHKfEMGKwq1XP9wMP
X-Gm-Gg: ATEYQzzIntmRQ9lFGLEvdVZUr0DeKXELm2aeR4Sv36t9GOX5BKRnRe8gKGfYqC958ci
	MPue8lY7nUJ2ZjBwKDdzjJWHZu0VyZvKFsJnpipIL9U1Kx1WQWT3Lwb7/GdLAl8VmC287Wf8fq/
	sdJHZ2I9NZdr8XL5GZ2KB0ZRt7F3S3qwtwv+9JpAI8ukWFaJcGeehkYjTRPvTfT6x0FrVimQ51U
	52FLJxHWZUjk9H5zYgPUOR47/GfJ+4Vs16fBUwXpwvs1ZKkJesqxgpNMqzegepYQuVWNS4SSVKY
	e/6PWT7Yfil6Ge72LHbeNplot1vXOUdCrMwICLfF4J0IW0UP1NrkmsEjjlbXNIXD3IFOKTA6K7z
	6ljC+F+B8Fggx9d/TBy9LJiln4Klo9h1jZgEv+W9DcF0KZZ5OdlXBsKTQkZWOit/G235rVuy5N+
	grPTo+56BBF20OtreEAEE3YQ==
X-Received: by 2002:a05:690c:e3ee:b0:799:1773:527d with SMTP id 00721157ae682-79a1c100004mr58333657b3.29.1773446450219;
        Fri, 13 Mar 2026 17:00:50 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:55::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee4fdfsm57042447b3.25.2026.03.13.17.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 17:00:49 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 13 Mar 2026 17:00:14 -0700
Subject: [PATCH net-next 1/2] selftests/vsock: fix vmtest.sh for read-only
 nested VM runners
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vsock-vmtest-nested-fixes-v1-1-d0e6274c3193@meta.com>
References: <20260313-vsock-vmtest-nested-fixes-v1-0-d0e6274c3193@meta.com>
In-Reply-To: <20260313-vsock-vmtest-nested-fixes-v1-0-d0e6274c3193@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

When running vmtest.sh inside a nested VM, there occurs a problem
with stacking two sets of virtiofs/overlay layers (the first set from
the outer VM and the second set from the inner VM). The virtme init
scripts (sshd, udhcpd, etc...) fail to execute basic programs (e.g.,
/bin/cat) and load library dependencies (e.g., libpam) due to ESTALE.
This only occurs when both layers (outer and inner) use virtiofs. Work
around this by using 9p in the inner VM via --force-9p.

Additionally, when the outer VM is read-only, the inner VM's attempt at
populating SSH keys to the root filesystem fails:

virtme-ng-init: mkdir: cannot create directory '/root/.cache': Read-only file system

Work around this by creating a temporary home directory with generated
SSH keys and passing it through to the guest as /root via --rwdir.
Disable strict host key checking in vm_ssh() since the VM will be seen
as a new host each run.

The --rw arg had to be removed to prevent a vng complaint about overlay
(in combination with the other parameters). The guest doesn't really
need write access anyway, so this was probably overly permissive to
begin with.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index 86e338886b33..c2cfcdf05d99 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -42,6 +42,8 @@ readonly KERNEL_CMDLINE="\
 	virtme.ssh virtme_ssh_channel=tcp virtme_ssh_user=$USER \
 "
 readonly LOG=$(mktemp /tmp/vsock_vmtest_XXXX.log)
+readonly TEST_HOME=$(mktemp -d /tmp/vmtest_home_XXXX)
+readonly SSH_KEY_PATH="${TEST_HOME}"/.ssh/id_ed25519
 
 # Namespace tests must use the ns_ prefix. This is checked in check_netns() and
 # is used to determine if a test needs namespace setup before test execution.
@@ -257,7 +259,12 @@ vm_ssh() {
 
 	shift
 
-	${ns_exec} ssh -q -o UserKnownHostsFile=/dev/null -p "${SSH_HOST_PORT}" localhost "$@"
+	${ns_exec} ssh -q \
+		-i "${SSH_KEY_PATH}" \
+		-o UserKnownHostsFile=/dev/null \
+		-o StrictHostKeyChecking=no \
+		-p "${SSH_HOST_PORT}" \
+		localhost "$@"
 
 	return $?
 }
@@ -265,6 +272,7 @@ vm_ssh() {
 cleanup() {
 	terminate_pidfiles "${!PIDFILES[@]}"
 	del_namespaces
+	rm -rf "${TEST_HOME}"
 }
 
 check_args() {
@@ -382,6 +390,11 @@ handle_build() {
 	popd &>/dev/null
 }
 
+setup_home() {
+	mkdir -p "$(dirname "${SSH_KEY_PATH}")"
+	ssh-keygen -t ed25519 -f "${SSH_KEY_PATH}" -N "" -q
+}
+
 create_pidfile() {
 	local pidfile
 
@@ -451,11 +464,14 @@ vm_start() {
 		--run \
 		${kernel_opt} \
 		${verbose_opt} \
+		--rwdir=/root=${TEST_HOME} \
+		--force-9p \
+		--cwd /root \
 		--qemu-opts="${qemu_opts}" \
 		--qemu="${qemu}" \
 		--user root \
 		--append "${KERNEL_CMDLINE}" \
-		--rw  &> ${logfile} &
+		&> ${logfile} &
 
 	timeout "${WAIT_QEMU}" \
 		bash -c 'while [[ ! -s '"${pidfile}"' ]]; do sleep 1; done; exit 0'
@@ -1532,6 +1548,7 @@ check_deps
 check_vng
 check_socat
 handle_build
+setup_home
 
 echo "1..${#ARGS[@]}"
 

-- 
2.52.0

