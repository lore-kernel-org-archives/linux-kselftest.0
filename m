Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A3C43E9FD
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754644; cv=none; b=ocSPNkq0KvPGghdkN92sSoThz0+KQFhXtgUsV+fn/cE537Q5NRmUQW4LvFC09fNOsbL2cl4fDY6pqaqDMm5EKZzl+UXGleag1xqfs7fUFUxcQyN+Jl3ACSwdH+RwLgS5chrSQAt3kJkHtZ+7AwsPjxu4SoaPm9BO961GyAkXnM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754644; c=relaxed/simple;
	bh=mW1kuA1EBweMGGAL7F7Bl9RcI8jlBsmE+i4of+8Lp+Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=q7NGiIG1kAuaWwepoP/7QH/fVB5RTkijwCKbOocbDxoN5LkX74xVWCCbAq4eCH/K8x726tRVs41r0wNc2PHvAKLabypgoQwFUpH8qKl/yG2IgU6BT81IMYwWz+mx+Jp4o5iuAwx3zNxw2QCz7YKV7a7gnUx7jY1JxIk2M/TTZMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HDEway+S; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HDEway+S"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so7256814a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 14:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784754642; x=1785359442; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zGCjZgrYR7q/NtwUSDt7c4X9W2mt8hvcEDv9J7cv/8U=;
        b=HDEway+SbT3VsK4+TrmAl7EuOgT8pD44vmBTwmz7qec06OecA5tisqtlOSXB40FoeT
         ApTOO4zUvf4IW+DqWogwu40CtuWZrfsQSojuBtz5MQwFUAXLTKe1W0NjXgZgBqedkDte
         2i2ExZA8QA6IYn4FmouwTmygsbYi62+PUQEvian/A3mUJjyVEKGWMG6hR+9XL+CcUzaZ
         4s/5v82tVbufHVFwnfAUC8HbZ+jGb9x8Rej5GJJH2jrx4s3axoaXE0IRzupsdZCnwFSn
         XC/fGFm1Inry+Gwi8OGRDEUwVhyVLlYNtM81uPZO13l1J80KzsGowdgBeG3DoYEk65Ik
         XI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754642; x=1785359442;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGCjZgrYR7q/NtwUSDt7c4X9W2mt8hvcEDv9J7cv/8U=;
        b=ITDloEaufCZQjNgwjHyDz0otQeFSNagqk8f9qzqAAq6JDsANJRVpnEIRa335A6BUwk
         kAzME0ddMk7MCAtwnWSnLTxn6BYHQboZJqgVGKw0l2Yu9n9hkpe71yCnKfI3+oC9SMBL
         IipjWs2HlbFEhtZGctzsEIowr+FpXtRlyBZq9OxqijaO6wATBrU3zVCZqxFgVeWznFNN
         aaTGceWCex+E4R2jSUkbSZaoqUBul+wl20jby927gYmSndoGzhAZgfh249Dws0GDMFg6
         N6iQbQnK2/hRkSHdoPACIRxeW5gQeRp+rddn+JxZukgFzRVyEaPD8LKYMU/lrLIcG9Nx
         c36w==
X-Gm-Message-State: AOJu0YxlKnvxER5PkoW5uApF9zxndK+YDl/KI9b/exHDhLZ/DaNWQ/Ld
	2uwpTrtR4tj/CWLFcUPe4UnjwgKcXoVekaHdFqFG+gZ8cf2gkGF0KVVYmlHBNDzjOy+L5Mrjv8o
	0kJQ9XN6RdszlSiFvBQ==
X-Received: from pfbdf3.prod.google.com ([2002:a05:6a00:4703:b0:848:81e8:f2d9])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:94e7:b0:84e:936:4673 with SMTP id d2e1a72fcca58-84e2bc28e55mr541942b3a.70.1784754642173;
 Wed, 22 Jul 2026 14:10:42 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:10:37 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260722211037.1925308-1-tjmercier@google.com>
Subject: [PATCH v3] selftests/udmabuf: Open /dev/udmabuf O_RDONLY
From: "T.J. Mercier" <tjmercier@google.com>
To: kraxel@redhat.com, vivek.kasireddy@intel.com, shuah@kernel.org, 
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bobbyeshleman@meta.com, kuba@kernel.org, 
	"T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Write permissions on the /dev/udmabuf device file are not required to
issue ioctls and allocate udmabufs. Applications should be opening this
file as O_RDONLY. The BPF dmabuf_iter selftest already does this. [1]

Users are pointing to these selftests as examples of how use udmabuf,
and encountering permission errors on systems where write permissions
are not available on /dev/udmabuf. Apply the principle of least
privilege to selftests which use udmabuf by removing the write access
mode from drivers/dma-buf/udmabuf.c and drivers/net/hw/ncdevmem.c.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=v7.1#n49

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index d78aec662586..ced0b95c876c 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -140,7 +140,7 @@ int main(int argc, char *argv[])
 	ksft_print_header();
 	ksft_set_plan(7);
 
-	devfd = open("/dev/udmabuf", O_RDWR);
+	devfd = open("/dev/udmabuf", O_RDONLY);
 	if (devfd < 0) {
 		ksft_print_msg(
 			"%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",

base-commit: 20f01a5565ce79923b75a2ac8e8ef2a1d7adf517
-- 
2.55.0.229.g6434b31f56-goog

