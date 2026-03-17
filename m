Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCBF364EA0
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785387; cv=none; b=Lb1ezaXNV03UYA2/facLnj46e5FL7f+D0mIzHbbjo9D/l9cY9p1wDcV8iwn6jHbalbQSTBE18ITBWXDwhYx8kiLOBkb+3vw31M0qiQBw5PuXkmBzda5eegsjh2XwDX1UqEdua4BzqchDGC94G049rxKWlOD6osLbBxzpJ1vAWv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785387; c=relaxed/simple;
	bh=FBy8AtaAcW3f/5x6drndhY5A+fYaOe5p6SxUT4nTXdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8jEZ8sSu2gjky/CCM+v6qSLL2XrHZJ/F3FqAPqt/xEt7Vdp1Kq+fmpziQRr3+mkC6Y3Xq65nnwnMgJUuVH08C3TfA0Vq2F/9WLY1elQmfjMi68dfxkvDql6JdDZzQndMivTAlTA8SiO7rMXB3wQQykDXAQqVuJcJiUAGa+SGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS84RUY5; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS84RUY5"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a51edef1fso5867887b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 15:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773785385; x=1774390185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjfBq/ftguqa5YG03YiYsY84WTL2L0ZPXeWuB5y9CnI=;
        b=PS84RUY5QWsOZse27RqkOgN9KuYXyLqlLiPUxUxbJWfvauIagezLbtgrDXm1kBBbfx
         e7HrBw1L7wUPfMFkgDx/D+fK1H81j+LkSoawz+AzYw519Fjn37/7nVQSovWZnPlV08qY
         tBzmS5eCkxglCoJSWQQ/raTbX4RgwR8qb2TKQNSGMYFWbI7ai4ChNVeGl6UGTBEgwiF1
         gYa9rWXU+gWn3/yP38cet/Cp6dHKHLyolxKZ8nFc3z9WfNd+tZPwBoct1quEfPg+7axe
         1fvlOtuM89JnGyeTeviTd9eYvIr7Eibg/JLDSMY6d+t6L56UJ4YHM99hhf/19og9w4kP
         Bw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773785385; x=1774390185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TjfBq/ftguqa5YG03YiYsY84WTL2L0ZPXeWuB5y9CnI=;
        b=ox6tskrWE6jJaYKNEqJLBfHsXOWciBh8vagt8030brtdVci/f8wVElgKxD7DajMiZU
         WLZCVyGLgVATURhYWSQ4TaWqSBQ+UDlYP0k022tU7zhX2mqq0IVxJ1uC2KuwL0seEN2r
         txdbHIEsplC/fr+jtpfkkVvB/NI5E6D1XKRMo8K38Mbix3chq7gaAbwV/qqGUfwg13vt
         mNzNLAELwq8jzDS4Ys9f7DkDSaUk5Huw42zbjWUkXNv/RDDaI2AbCvS+Eu1sPgwlwuYd
         oK7hyWH0BUdL2seSBKcrEQmDs20spEQBvXg08DJmQagVkYV8JP1IgQG9IEnQtQYQzrAn
         wZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCWd0h8UNe5C4jxqeX7ew+xrtPwSQMTF/dPfiPoR7usc7aXFWo1DbbQKimFBAsg3Lj9CFK9o1pp6zVAbri48r4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxliurpImIljo0NcDIlgDdLQPi94TfxbjhdyZYP/c1Dk6zfMNwT
	HjWGcA0Da6Ignb4TTgT+MDyGwkMojm9KYqMNy8QfcPrmQsc4SwHaYkpR
X-Gm-Gg: ATEYQzxYjc85fHb7GKTYelAF0yZPDkDLkjGJRyG+0BjCgyPMzb4WZ36u23B1G3Pl56F
	GmUFX2s+WrerYePDgP7qp4INPfvEimbLukPz19UZD0hD5kg9K++acENd7uDs5xbX+83OFbPAcxU
	M9NJclVsVm/1DyvOWQKA8/29fU+s1shcLOivMr24O+aw9Lu8vgHTRkVVdJa8RDOJCddO2hQFTjW
	RH35WyBbZMZbe0XasVf/UJfHzGIUcx7PmEEA6WQ9ztZ3/84ZYmjJfCo032k5Tbm1cXzat+f5gXq
	v3hTG4Ngb9evSZjOJhEb61DG2BPL+/5wtvhCP9zHxOo3CsiWHyIXaiw7AW9z/PBT268lLLO/Z8g
	jv4UOpA5mRVwYNbksnX/ZRJEt6PfeVRM4+FJ3w79u0mqk+mUVjAG14EDDZD4lKQ+C1/+Ig2N5Pi
	nwCdwNATZnjjuQwYBptc5ntQ==
X-Received: by 2002:a05:690c:6ac1:b0:79a:3e64:c15d with SMTP id 00721157ae682-79a61930f27mr46203767b3.31.1773785385300;
        Tue, 17 Mar 2026 15:09:45 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:5e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713d9d98sm5600677b3.15.2026.03.17.15.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:09:44 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 17 Mar 2026 15:09:36 -0700
Subject: [PATCH net-next v2 2/2] selftests/vsock: fix vsock_test path
 shadowing in nested VMs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-vsock-vmtest-nested-fixes-v2-2-0b3f53b80a0f@meta.com>
References: <20260317-vsock-vmtest-nested-fixes-v2-0-0b3f53b80a0f@meta.com>
In-Reply-To: <20260317-vsock-vmtest-nested-fixes-v2-0-0b3f53b80a0f@meta.com>
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
index a4b56322ce9b..30c06544f2e5 100755
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

