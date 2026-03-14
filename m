Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F391F1A9FBC
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 00:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773446455; cv=none; b=SXHHlBWDFouOCTY4HM/GI9mPosrHOinagh+UodEAuutKoH5hVB0BohaNSx9D1cj0agAODPS6fdRpZpi1N79UemGuNpyIYwmWTJQwqXi1f8uLSDY+InxZuRcIIN8kIkHG3FcNcHsUOoSh/E8ZlNIydIzOvbPQbsTzKiz8k/lovgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773446455; c=relaxed/simple;
	bh=qQSv/5WdpZH4XBXZwbx9dzgQ4o8yOA7GNQGX0IAwggY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rlMKJReodaGbHAiFV6O7c0OVWL7qcersMjzl+Ka2+PdQozgUCdxTjpP9vY21eDzN87EAGvgxF33krPFoZIPkJbuJIgzgJ9DCX2rjCIHm7rq1fIbrRzWAjMOkjcybuCYKxzmJ+yYWjEo9tzX/+3geZPc+HRsPrJsbJqYOqmOfluA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsmJ+vuU; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsmJ+vuU"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79800183233so41961197b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 17:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773446452; x=1774051252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W86A6Y/31ihOHZ6/xNMK1KyCGKpHT+7je3oM4+QBYPA=;
        b=hsmJ+vuUSP3+l9K7+ZZrsfasOwOkxFRpqvn0JQex614/Zzu1lqLoddBjnygLZp5v/G
         BmMD5Dx5oIkvZxDMZs/K3tmHRnqDAQ4mmAJkzR17Z40KQ0r/mjSslcRI1nrVTcokDvVG
         x9zLIrVEdzmMUnfk7ihMl5Wk75Y2boItaGjCHFa7RnIQ+j5dqKZ75ygdrAyxmcBrUxY1
         z6ZdL3j3TCcAZ9WjBMXpg7Aiqgmgkg4xaQ+8AaL/kM/MmVay5HZSlxRANySTkXNICLh2
         iR984qlbdaRVOJWvw3Uwnjt4fS3DFcSpilF7sVJq3vSASHRLNIBNU9dcyBPbgNHcWmwp
         hL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773446452; x=1774051252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W86A6Y/31ihOHZ6/xNMK1KyCGKpHT+7je3oM4+QBYPA=;
        b=rMD1+6CxagPEVhQQh2538qHHC+f84q9fyxlVma2+bTYj/+/Au5NtUae9u6ZZIwMjPE
         vr3axcW+iAf8j/98nlyybER1tbP8u8HXY0sh7Lm51f818LDUGP9OZatIBCK5tHzU+7cy
         BdiRsad2ADQlzc2iw311J/L2AX/BsqDPybRtkMhXjGHXpFJgYHfPLJOoZPxvFmA/S7hM
         OVCfvwqoZ+I27a9Qo0HgFvwYfRcHlA/Kcb5idfXbKYVs9v78nEXd6mfBAXm9+a1sKkWM
         2o8vE4k25C8Aye9md0Au4Wcxm5mIUrmrKL7gUrP7NrNbT51OXrC4Mg5zP2bNG4MqoRRQ
         5vBg==
X-Forwarded-Encrypted: i=1; AJvYcCWx9OQjsiesFxcTv02J8D1f16nWXQM/V/QMeW3k1T5SgnMBCC0ZA99k+vgAEfJXAylGB95+CxHV4Eiq4aoPlFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww/SEzQ8xGldyXEKhNbKw5ClLthxwuwtUnZYnz0uRl88nOUuVj
	8VStcfIf8ue11IE3ovijj4Jq6VmAhvy/VpeCRgm78vEA8Obj5KAZyQmv
X-Gm-Gg: ATEYQzwX20erisRs3NHHgCD+WzdZJUd2dzJihYMmHioxCqt7/5fR2dwPUSS+b0/dtmO
	U7J0lLuDNUgk7Fu7CtmCc8/MwzvxZaDV21GDG/V2GoJFk6mVBSfj3rjo8PvDI7/22R+5SjiKSt0
	wKUEgeaSN/421bMtv70KhKM/cdynD7nj9+xUdRPSLEUKnMR3jRf1dS9Gdl/WQ56hoTOQm+u93Ce
	drm+oVN/d22Xlunc32Ii/I5g2DDN1WSArm4k2nAClqoRN2WKb7aZZh9hFquagYtmMDr+/4pfTHg
	wR0Q070i6vtBewSXYyIe3Tai9nTHBYbxcxN36wL7GYODqtGU/y6aXBotysBjMIBpge1jhh40DBx
	RvrJFYqQzrJ6KUT6gFVxCVRaP4Y6ZXJf4HlW2dJESuONaFXwYDPZ2X12xpi7QqHV2BucHgDfymO
	vggLB8O0wCoFqf6gynY0l5Mg==
X-Received: by 2002:a05:690c:348a:b0:794:a8ea:f04a with SMTP id 00721157ae682-799475ee218mr90550227b3.20.1773446452052;
        Fri, 13 Mar 2026 17:00:52 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:54::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f1ecd9sm54769307b3.45.2026.03.13.17.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 17:00:51 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 13 Mar 2026 17:00:15 -0700
Subject: [PATCH net-next 2/2] selftests/vsock: fix vsock_test path
 shadowing in nested VMs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vsock-vmtest-nested-fixes-v1-2-d0e6274c3193@meta.com>
References: <20260313-vsock-vmtest-nested-fixes-v1-0-d0e6274c3193@meta.com>
In-Reply-To: <20260313-vsock-vmtest-nested-fixes-v1-0-d0e6274c3193@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

The /root mount introduced for nested VM support shadows any host paths
under /root. This breaks systems where the outer VM runs as root and the
vsock_test binary path is something like:

/root/linux/tools/testing/selftests/vsock/vsock_test

Fix this by copying vsock_test into the temporary home directory that
gets mounted as /root in the guest, and using a relative path to invoke
it.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index c2cfcdf05d99..8182c748f214 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -393,6 +393,7 @@ handle_build() {
 setup_home() {
 	mkdir -p "$(dirname "${SSH_KEY_PATH}")"
 	ssh-keygen -t ed25519 -f "${SSH_KEY_PATH}" -N "" -q
+	cp "${VSOCK_TEST}" "${TEST_HOME}"/vsock_test
 }
 
 create_pidfile() {
@@ -601,7 +602,7 @@ vm_vsock_test() {
 	# log output and use pipefail to respect vsock_test errors
 	set -o pipefail
 	if [[ "${host}" != server ]]; then
-		vm_ssh "${ns}" -- "${VSOCK_TEST}" \
+		vm_ssh "${ns}" -- ./vsock_test \
 			--mode=client \
 			--control-host="${host}" \
 			--peer-cid="${cid}" \
@@ -609,7 +610,7 @@ vm_vsock_test() {
 			2>&1 | log_guest
 		rc=$?
 	else
-		vm_ssh "${ns}" -- "${VSOCK_TEST}" \
+		vm_ssh "${ns}" -- ./vsock_test \
 			--mode=server \
 			--peer-cid="${cid}" \
 			--control-port="${port}" \

-- 
2.52.0

