Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2FF3612F7
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785386; cv=none; b=W/feBq4UxiSw9fx3DcKYS6qA3++NPOGbMi25MmqaKXeJqQYQ35GIg7EsWef0qRJ8QT3sBvz/X1rNVfmnvi6dflZmjb+GDXO3AywMY5XuDX2ouXdloBS0uk1fyifnV4ROUnD024Jrn+J9tTfaXIjZFSKPrttpk519zd0rGB3hewY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785386; c=relaxed/simple;
	bh=b+CHW6D+Tes3tWuDt2z0es3oTuQs3Fq7ETrR7tgvf/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AxHvqpURY5Jo7yZF+OptOlvrHp9uFtLCbt90y6MLcBJP7E27tz5zy+dm8B4wHzkA8gkPyioKaP9snetiI1u7av0ekeNLlTHgc57UZ04TOutVya2Cup5iPmFMzy/lG+VCFLKfn2MHMY1T9FpZG/s7uEuhVaVqYdYotgUHyqNemLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThwnO0+Q; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThwnO0+Q"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7982c3b7dfcso59853387b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 15:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773785384; x=1774390184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpW8gynkMYuHb0nRn7cLLL0m7fiOcOBnsG4vYKWVvhU=;
        b=ThwnO0+Q1lO3HCL59UulCoQuYvAvR5chFdDDMd+m7rkQZhVRwD5SukQIbvaZLssAkw
         tbnS7h/k7WqDSq5cNv43Cm/JFZfmRjizxMYSIQpIRgBU99RQVX0q7v8+Vzc9S5WiYej+
         oXeV/p83OZ6D5+x1o2ONH32ZS5Ng3F8ABVF5aa8XCHY8agqs1AFKrd2YaGsKhDLSAhUd
         wBwBosrR/uD2Z9VlUkYy9OEM8AbXbQfPIGbm27dVO6EUWhAHcsr7p2wyzuO7EOaUorF9
         o4DyiKHxjz//2ivg0S2OUOeYlLzWsw/yvv5QEOnzvODt/nEilZHG7AFDwKBA31uoPzwI
         WHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773785384; x=1774390184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpW8gynkMYuHb0nRn7cLLL0m7fiOcOBnsG4vYKWVvhU=;
        b=ZiAvtBbcSfCddSL8VtKsEL5Re0mXEgBNXFOgPfSiFLoG/GSjCDTAoL2GPsnKaqDB7e
         Sd4lEDi2VD1MB4gRWwiBpHNJaRQmRXyRB+7gRlnzh5GbQvrMd7dqHnICOCrUDeAhHriP
         Fnqk48WjX+mT9WkINa5Z3jugGNA50RJkYxTszoTDomL2aZg7wPbRghP4kVcMxGV5VNex
         cVF7MQMWJ2L0qdjZfuvrQ8+yGe62kJA7V6QgipKKE9Hp1amnWp8KCrttZRpCu9cCr997
         Iu5cFiej0gPXNjE8ZfAHCaC3yj9wsq6opb7Q/hV5pYHfGh+g6vNOl9PbA4DWSN0OTPZs
         aTJg==
X-Forwarded-Encrypted: i=1; AJvYcCVQje/wBkp0jSmhyYdtVOC94FEvlKJKZY8b0Ka8xiup9ZUWU3wtoPiaFFLd8dm7aAWG6rFCBhjwm6J1kmZcfBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvVMb+ebRlh3nHctmv2/+hyUqu/ORZYYj5G2jJGgOA8Ovidk3/
	w7/x6fI/NLrcEZR4sPYUXZ1kg+h5sPblKB2nOAriqzT3bjNpHumkWEDL
X-Gm-Gg: ATEYQzwGgaUuHnZ3XPklz3axMsJE0UOESWYa4tRpsZTooPjgSW2shh6I/1TULVVEW68
	NNIWhyXW5WGwIa6UbUjA7/kc/UW4SfiUBPh+NKfrBUYn3I4BsBgO49GiLxFZKHrI3GFLBUbUynV
	9DoLQXu8Dm9mCwGeiesK0nesxx0kU1JbvTXqZ9OT/vYfuKQly2xZdw0aK3umRJv8SxMD1VgaWff
	Rt2sPQVoo1JJWm37f76xrArwwQ6jFqvcSziTeds2LyO+WxTizDdt9GedldKqBSu4Gv/OGZKhd9m
	faBrIrxg6Ky6E0HPKykmVqm3/JOFalGW7sXlN8K1lGwGsXIPAhPDNteBXtMhCVg7aUBsFoXawfK
	e8sVN4Qv9SC0Fv+wzwq7Jpvczp8Y7a3ODJPU9yJ91G1nSCiu2YgIZai7tkgMZPv4tEUX68St6i0
	mwin3pNJsIKczuQyTrW+HItg==
X-Received: by 2002:a05:690c:c50d:b0:79a:5164:bb08 with SMTP id 00721157ae682-79a7181bd39mr11782367b3.8.1773785384400;
        Tue, 17 Mar 2026 15:09:44 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:45::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713f31b8sm6186507b3.18.2026.03.17.15.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:09:44 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 17 Mar 2026 15:09:35 -0700
Subject: [PATCH net-next v2 1/2] selftests/vsock: fix vmtest.sh for
 read-only nested VM runners
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-vsock-vmtest-nested-fixes-v2-1-0b3f53b80a0f@meta.com>
References: <20260317-vsock-vmtest-nested-fixes-v2-0-0b3f53b80a0f@meta.com>
In-Reply-To: <20260317-vsock-vmtest-nested-fixes-v2-0-0b3f53b80a0f@meta.com>
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
index 86e338886b33..a4b56322ce9b 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -42,6 +42,8 @@ readonly KERNEL_CMDLINE="\
 	virtme.ssh virtme_ssh_channel=tcp virtme_ssh_user=$USER \
 "
 readonly LOG=$(mktemp /tmp/vsock_vmtest_XXXX.log)
+readonly TEST_HOME="$(mktemp -d /tmp/vmtest_home_XXXX)"
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
+		--rwdir=/root="${TEST_HOME}" \
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

