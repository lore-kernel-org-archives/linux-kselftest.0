Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195576;
	b=SZJtvgdtITRbCEEwApKFcfO1OoO9B221ZDI2d94COOjfwOKLpCMeYKX05QOC8RFCNRtX
	 c7ccr51d6FYGU0rf0slwydC9NhZJ9dniD9bSMuIInfIzEUSojsKNdzQ+VzqbCbE4PXyYR
	 5O+fsWuvQG2EvRVuQHnljGdOyeA/lFzL5CLECadpvAC3SSVJ7/xsU1V9Kq4+Gp9+gz+7f
	 t5AgBVxGB8yHLxnHnO4q+Y6EPg6gziLLhhh1cQLlkj7yBjHxP42TPXdpzvI4HgbHYEF1J
	 HeA+NL8c83ZYZbgTx4uQtH1DV6/OFPrzOAKByaOVZXcj/vabgXP02Eb+SwNFX7yAjfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195576;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=NXLKMZwLfVx9UsX7y2gYH9+eai5hc+ie92CesIACQhk=;
	b=DE2Gdqbq1zo509ujUthaQHHPfehLbFILmwW0RlW+EvxOySatwMFJtdrkIz7VBMSaSRee
	 z4zJIamdFCwABCewO2aTOq9xH1c2rRqPlNTc3zfrmgTu68SBzlahn/n95hErhYxu88IBZ
	 FsJwyriI7RuLFwnTmsiYBFlyVEIKGg32hzTsaGue+hKipCmKlIXs5NxKH94cZuqvMG8iU
	 tAFlztlyXOt4uoFyYWIef3SE2RpSy86Mxw1KG9ky8V0PWqH9z4+8VQ/Z8i8h3VfVOxWRd
	 ISDhAQN5PDCePdbzBv/KKQfOG2Uv8je/Hv+bjrSF5Hslw2eYkEjy2KxFtETHbdl8CCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IaYc4Jyn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8CE606A32A;
	Wed, 28 Oct 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IaYc4Jyn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793195576;
	b=YnOC1Do0FypAUqBGULzvHGFmQ9R1j++0c4oWDD8wadWg0SIwI8d0yZFvst1Da+LXOgMB
	 lDXFFxBZpNFxVmcP1DuQD0CX1VWSxeKhGG6utEWhu9U0iiWVdkCVJQ0qsezhyUOfWcnQc
	 Iod34oleyr1jfOK39H6qHFWguNB+KAWpA7qRSDXz1z73vZv7y6vuOwJmUt6LySANPLrJn
	 fvJITlcinWMKfZBvRqlUBIZghRHJyzkSUdZkatcz5K7PeedCDUAjkJGISlEBjdBJWfxjU
	 UsFAtlrqNYeuXIfETsqs0pr7IxuQ/x59I6gfYN1jYCDH6rd+BB1OOvhhPTpULYTPaHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793195576;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NXLKMZwLfVx9UsX7y2gYH9+eai5hc+ie92CesIACQhk=;
	b=S8nYtQmFUTlBXOVXAxEf3F4/WiO2wHJd4PsWoBRnmUeNmENzd8a/XDq3h9foaHJChEc4
	 CruC+04hFxNdxa9Xg3mREdd83yCJ6nizLFC5gA/WFvfnK+FVJ8Sl+CAK8SHui5EGw0LM1
	 IoZNP00MPs943sa3ei18mAabENZdGUFw0csUMuQBhI3AlZ28Cg3hp0Ww2cU7EqYfWEKhW
	 +Hggr9OOD3XUoI8iEFQXIrbX/X2qJplVzwgQ3fPleZneVVsLb4VhBq89tpAWvz71HprJN
	 17M06a+tz2ufkCWhsyYIP7n0/XBzY5Xpl3CrQE251+tJqkF6oXRejTjcPhDzvQBzPwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53D041F01829;
	Wed, 28 Oct 2026 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195576;
	bh=NXLKMZwLfVx9UsX7y2gYH9+eai5hc+ie92CesIACQhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IaYc4Jynebo68YLmEXp38c9RnHnHHl3bkq93mO5A5ywEwcnhOy7MFAFAmlPjmUgds
	 Vt9PtA8xP4di6fxvaDAbOeIbwMj30JECXM536OcL1vIQbRel8zeeUlGe/BViZYMjS7
	 0nQ/Rcv/ZurwAXGeyb2NPyAFxS9/HWV7tEGF11J6XX1zL7wTxZ25mckm4hduuyAAY+
	 rVvNqf5PtWJAZCCMEK9nv1Sqi9oo5+jBtLkF8k5AlGjSLOarhH28N0IKciVHVbnvSG
	 jmVPftZHI0WaVTqKW0Jkcqv+lgQ+5+VYJPco6rV3axSaNWyrpJJdr1j3A9DfgGoOHs
	 0Hocme+LTVMLA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B55884546F;
	Wed, 28 Oct 2026 13:52:53 +0000 (UTC)
From: Martin Belanger via B4 Relay <devnull+martin.nvme.dev.gmail.com@kernel.org>
Date: Wed, 28 Oct 2026 09:52:51 -0400
Subject: [PATCH RFC net-next v2 1/5] tls: add HKDF-Expand-Label for the TLS
 1.3 key schedule
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
Message-Id: <20261028-keyupdate-rfc-v2-1-eb5143b4c487@gmail.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
In-Reply-To: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>, 
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Martin Belanger <martin.belanger@dell.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793195573; l=5308;
 i=martin.nvme.dev@gmail.com; s=20261014; h=from:subject:message-id;
 bh=pH4YhE4u4x17EaEwNK+mf52ndKZ9YKny0gD+XRiyqAU=;
 b=uO5IozmA52e2+eKlR1cuy6YS6ahf+9gi4hqeTAhuVlnQkjfIR+r8kPoYgqHsZzdFeGBiJt+4k
 menQDqHe6AwDNuZxTzxPSfJM5CAPhcyvEQo4wFvX0C87OweifgIk+WZ
X-Developer-Key: i=martin.nvme.dev@gmail.com; a=ed25519;
 pk=4K+XXetGK35w2LzRRddd/bbHawZU222BN+YZRuSpN+k=
X-Endpoint-Received: by B4 Relay for martin.nvme.dev@gmail.com/20261014
 with auth_id=1176
X-Original-From: Martin Belanger <martin.nvme.dev@gmail.com>
Reply-To: martin.nvme.dev@gmail.com

From: Martin Belanger <martin.belanger@dell.com>

A TLS 1.3 KeyUpdate derives the next traffic secret, key and IV with
HKDF-Expand-Label (RFC 9846, section 7.2). Add the helper for the
kernel to do this itself.

Only the part of the key schedule after the handshake is needed. The
input is a traffic secret, which is already a pseudorandom key, so
HKDF-Extract is not needed. Each output is at most Hash.length bytes,
so each derivation is a single HMAC with the library SHA-256 or SHA-384
functions.

Assisted-by: LLM
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Signed-off-by: Martin Belanger <martin.belanger@dell.com>
---
 net/tls/Kconfig    |  2 ++
 net/tls/Makefile   |  2 +-
 net/tls/tls.h      |  2 ++
 net/tls/tls_hkdf.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/net/tls/Kconfig b/net/tls/Kconfig
index 4f4d5973a28f..6183ebe954ee 100644
--- a/net/tls/Kconfig
+++ b/net/tls/Kconfig
@@ -8,6 +8,8 @@ config TLS
 	select CRYPTO
 	select CRYPTO_AES
 	select CRYPTO_GCM
+	select CRYPTO_LIB_SHA256
+	select CRYPTO_LIB_SHA512
 	select NET_SOCK_MSG
 	default n
 	help
diff --git a/net/tls/Makefile b/net/tls/Makefile
index 4c7d296081ee..6edcf1271b75 100644
--- a/net/tls/Makefile
+++ b/net/tls/Makefile
@@ -7,6 +7,6 @@ CFLAGS_trace.o := -I$(src)
 
 obj-$(CONFIG_TLS) += tls.o
 
-tls-y := tls_main.o tls_sw.o tls_proc.o trace.o tls_strp.o
+tls-y := tls_main.o tls_sw.o tls_proc.o trace.o tls_strp.o tls_hkdf.o
 
 tls-$(CONFIG_TLS_DEVICE) += tls_device.o tls_device_fallback.o
diff --git a/net/tls/tls.h b/net/tls/tls.h
index 60a37bdaaa25..b2061f6bf065 100644
--- a/net/tls/tls.h
+++ b/net/tls/tls.h
@@ -147,6 +147,8 @@ void tls_strp_abort_strp(struct tls_strparser *strp, int err);
 int init_prot_info(struct tls_prot_info *prot,
 		   const struct tls_crypto_info *crypto_info,
 		   const struct tls_cipher_desc *cipher_desc);
+int tls_hkdf_expand_label(const u8 *secret, size_t secret_len,
+			  const char *label, u8 *out, size_t out_len);
 int tls_set_sw_offload(struct sock *sk, int tx,
 		       struct tls_crypto_info *new_crypto_info);
 void tls_update_rx_zc_capable(struct tls_context *tls_ctx);
diff --git a/net/tls/tls_hkdf.c b/net/tls/tls_hkdf.c
new file mode 100644
index 000000000000..49e33146ac7e
--- /dev/null
+++ b/net/tls/tls_hkdf.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2026 Dell Technologies Inc. or its subsidiaries.
+ *
+ * TLS 1.3 HKDF-Expand-Label, RFC 9846 section 7.1.
+ *
+ * TLS 1.3 derives all of its secrets and keys with HKDF (RFC 5869). The
+ * TLS handshake runs in user space and gives the kernel one application
+ * traffic secret for each direction. For a KeyUpdate, the kernel derives
+ * the next traffic secret from the current one (section 7.2), and the
+ * new key and IV from the next traffic secret (section 7.3). Both steps
+ * use only HKDF-Expand-Label, so this file implements only that
+ * function, not the full key schedule of the handshake.
+ *
+ * The input is always a traffic secret. It is already a random key of
+ * the hash length, so HKDF-Extract is not needed. No output is longer
+ * than the hash, so HKDF-Expand is a single HMAC.
+ */
+
+#include <crypto/sha2.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#include "tls.h"
+
+#define TLS_HKDF_LABEL_PREFIX		"tls13 "
+#define TLS_HKDF_LABEL_PREFIX_LEN	(sizeof(TLS_HKDF_LABEL_PREFIX) - 1)
+#define TLS_HKDF_LABEL_MAX		32
+
+/**
+ * tls_hkdf_expand_label - HKDF-Expand-Label with an empty context
+ * @secret: the secret
+ * @secret_len: length of @secret, which selects the hash: SHA-256 for
+ *	SHA256_DIGEST_SIZE, SHA-384 for SHA384_DIGEST_SIZE
+ * @label: the label, without the "tls13 " prefix
+ * @out: output buffer
+ * @out_len: number of bytes to derive, at most @secret_len
+ *
+ * Return: 0 on success, -EINVAL if a length is not valid.
+ */
+int tls_hkdf_expand_label(const u8 *secret, size_t secret_len,
+			  const char *label, u8 *out, size_t out_len)
+{
+	u8 info[2 + 1 + TLS_HKDF_LABEL_PREFIX_LEN + TLS_HKDF_LABEL_MAX + 1 + 1];
+	size_t label_len = strlen(label);
+	u8 tmp[SHA384_DIGEST_SIZE];
+	size_t pos = 0;
+
+	if (secret_len != SHA256_DIGEST_SIZE &&
+	    secret_len != SHA384_DIGEST_SIZE)
+		return -EINVAL;
+	if (!out_len || out_len > secret_len || label_len > TLS_HKDF_LABEL_MAX)
+		return -EINVAL;
+
+	/* struct {
+	 *	uint16 length;
+	 *	opaque label<7..255>;
+	 *	opaque context<0..255>;
+	 * } HkdfLabel;
+	 *
+	 * followed by the HKDF-Expand counter for the first output block.
+	 */
+	put_unaligned_be16(out_len, info);
+	pos += 2;
+	info[pos++] = TLS_HKDF_LABEL_PREFIX_LEN + label_len;
+	memcpy(info + pos, TLS_HKDF_LABEL_PREFIX, TLS_HKDF_LABEL_PREFIX_LEN);
+	pos += TLS_HKDF_LABEL_PREFIX_LEN;
+	memcpy(info + pos, label, label_len);
+	pos += label_len;
+	info[pos++] = 0;	/* empty context */
+	info[pos++] = 1;	/* counter */
+
+	if (secret_len == SHA256_DIGEST_SIZE)
+		hmac_sha256_usingrawkey(secret, secret_len, info, pos, tmp);
+	else
+		hmac_sha384_usingrawkey(secret, secret_len, info, pos, tmp);
+
+	memcpy(out, tmp, out_len);
+	memzero_explicit(tmp, sizeof(tmp));
+
+	return 0;
+}

-- 
2.53.0


