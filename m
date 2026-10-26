Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997069;
	b=RAmU7pbSSX/TEtBUMeQI37fRECmzvGB9PZOezy0cyVuG1Xicizu2GeALjSkHT+bjMQQF
	 CrHDKyVpmUhSIRxUSpK2t1xbYtVUh31RGGqffIyC2YVrujrg41OEI2GLfRLYi9IRyDaEJ
	 xoB2Dy6RXEH70GQpgsY4X6tccqiJNc367QwikUvMZdfKFTaxhnPq5Z9S9vn337zDu19Ii
	 EuEpWRXlX7xaQIJfgFdraheectFpTwwYjI27f9hMXAf+kXKnJWpJNUD9xQgX3lbhSSMv3
	 TBHwHu/0C8Fata6CjXSRobPqe5fg34pntLLCI8diM9xIMjhrVIub6i1MP7+nxTfCKJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BYmnZ/JkQz4ToYHE9aPlkKFm4UaBUwcnJjUxXXdmRXU=;
	b=s9I/vepD9QLJG4DSoffF0seArwVBKqc89+k4PiyKU4SlHDUCchMQmgqNGK8xZhAA1VUY
	 UtHV+ZxC4fDUm88cwZFhWebmW6JB+4kD8tKvj6gN66G7T+qp+2PpWtPx1WVbeBMVwhV8s
	 r3wElYyPRUdaETLPridHoWkx0MCaj+f7Lr+LSIAo87rVk0F60t5a9KKJXb4iL1oQbiErN
	 Qu/0zSgXBm06VjROVRFyAtWveObQa3XwNU/heke0WeVyBIPEkTvU6UsAdE8Ub7XwLpWE5
	 ZUwyEjilnp4I3pvjH235hhZ2aJLSUb6u5iPsNkUaOhaR4mJHJHxQptuiB7SIlKELdXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gongtao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QAZHBnPf;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D6606A332
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 06:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211D6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gongtao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QAZHBnPf
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so2636897a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 23:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792997067; x=1793601867; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYmnZ/JkQz4ToYHE9aPlkKFm4UaBUwcnJjUxXXdmRXU=;
        b=QAZHBnPf3vssSpOkSHI66T4/etdSHZwAEjaAq0ePJHH1zqvMbtXJgujG9T+kWfgPGE
         XVAWmd/7Jzlc1b0I47O2VskPWPBKU9SmJ4pE1/uV0i7DsFPeACWkXxmyiXIf9uBmJZqu
         j78NM4YSunkr+97zNb7f4my3go8O1Uhi4JCuYjFJmwJriHPcygUeYFu0G03Uz9OYhE7U
         xaLZDwsd7CveDmIFPx4Zx6G24hSheauS5rkE81EUhg5NR76ruH9wMEkMJl5+YmfFQ4pK
         trN7JZEoYMmdfHnwIBw02hi6MAgCzJLCegqzHm6VfJ7a0jvaaqmyFM2lSD8n1a+HKGyG
         cy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997067; x=1793601867;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYmnZ/JkQz4ToYHE9aPlkKFm4UaBUwcnJjUxXXdmRXU=;
        b=1oskQ8YDpjzNOoWhonlo05m6Ra95NHF68f3V/eFPDoBBfI5sfcLQw/AYmVdUBYcXqw
         8nK1w5ugpVmw1oVKwGXyTyOi7IJibbxTp9wHcgQbXz9Sjd4tSkG+VX4yySNWK5VWc1Pc
         C2VJ3073BSrDRpTGD4CSq8JYJFnrodIxNv2w3iddEHaTZRvJAujHXdz0a0fUOgl1v1BC
         lvqUo3kat8XlP8JCGipZcSegThfFv29+ooQKVbIM5QwAaDI9KxPkQCf8R1r0noIJfRuS
         WGSWh/36PkfTV8RGYgX2bkpkn+o9mE6deciQQb5frm8g0eYFFc3ugCj7Oyo7ch2NaI9V
         glEA==
X-Forwarded-Encrypted: i=1; AKwUvBx4rcWMjyGzDmvd08j4kF7hJS+tfR8GDWOJZE7PoNZdGEg3f+d9T2lIuGMAh96WGo+sOWrg6yiDTa6yoE5jFOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsoDxamyjbZnM2P3v5NdzVhQHPNK5Kwk71PfOFOYdEIioQzznS
	UkZhyr6sNGJuZT9dOGWZjKXAuv5XyzpsySstxyOtcGhYEa3hvzlhJ+yF7mP8CmGxoJ0+CEkExfC
	og0xteXa1Cw==
X-Received: from pjhr18.prod.google.com ([2002:a17:90a:5012:b0:3aa:ee30:1a77])
 (user=gongtao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5625:b0:3ac:8af9:4a6a
 with SMTP id 98e67ed59e1d1-3adeafc4451mr4916390a91.42.1792997067306; Sun, 25
 Oct 2026 23:44:27 -0700 (PDT)
Date: Sun, 25 Oct 2026 23:44:20 -0700
In-Reply-To: <20261026064424.3003536-1-gongtao@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026064424.3003536-1-gongtao@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026064424.3003536-2-gongtao@google.com>
Subject: [RFC PATCH v3 1/5] KVM: guest_memfd: Refactor out kvm_gmem_alloc_file()
From: Tao Gong <gongtao@google.com>
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Afranji <afranji@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sagi Shahar <sagis@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Tao Gong <gongtao@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ackerley Tng <ackerleytng@google.com>

The file represents a KVM instance's view into the underlying memory
that is managed by the guest_memfd inode. Refactoring out the file
creation enables this function to be reused when creating multiple views
into the same guest_memfd inode.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Ryan Afranji <afranji@google.com>
Signed-off-by: Ryan Afranji <afranji@google.com>
Co-developed-by: Tao Gong <gongtao@google.com>
Signed-off-by: Tao Gong <gongtao@google.com>
---
 virt/kvm/guest_memfd.c | 67 +++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 93f3d29d5751a..3ca6f64d48040 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -937,10 +937,47 @@ static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
 	return r;
 }
 
+/*
+ * Allocate a new guest_memfd file for @kvm that refers to @inode.  On success,
+ * the returned file takes over the caller's reference to @inode.
+ */
+static struct file *kvm_gmem_alloc_file(struct kvm *kvm, struct inode *inode,
+					const char *name)
+{
+	struct gmem_file *f;
+	struct file *file;
+
+	f = kzalloc_obj(*f);
+	if (!f)
+		return ERR_PTR(-ENOMEM);
+
+	/* __fput() will take care of fops_put(). */
+	if (!fops_get(&kvm_gmem_fops)) {
+		kfree(f);
+		return ERR_PTR(-ENOENT);
+	}
+
+	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
+	if (IS_ERR(file)) {
+		fops_put(&kvm_gmem_fops);
+		kfree(f);
+		return file;
+	}
+
+	file->f_flags |= O_LARGEFILE;
+	file->private_data = f;
+
+	kvm_get_kvm(kvm);
+	f->kvm = kvm;
+	xa_init(&f->bindings);
+	list_add(&f->entry, &GMEM_I(inode)->gmem_file_list);
+
+	return file;
+}
+
 static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 {
 	static const char *name = "[kvm-gmem]";
-	struct gmem_file *f;
 	struct inode *inode;
 	struct file *file;
 	int fd, err;
@@ -949,51 +986,27 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	if (fd < 0)
 		return fd;
 
-	f = kzalloc_obj(*f);
-	if (!f) {
-		err = -ENOMEM;
-		goto err_fd;
-	}
-
-	/* __fput() will take care of fops_put(). */
-	if (!fops_get(&kvm_gmem_fops)) {
-		err = -ENOENT;
-		goto err_gmem;
-	}
-
 	inode = anon_inode_make_secure_inode(kvm_gmem_mnt->mnt_sb, name, NULL);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		goto err_fops;
+		goto err_fd;
 	}
 
 	err = kvm_gmem_init_inode(inode, size, flags);
 	if (err)
 		goto err_inode;
 
-	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
+	file = kvm_gmem_alloc_file(kvm, inode, name);
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
 		goto err_inode;
 	}
 
-	file->f_flags |= O_LARGEFILE;
-	file->private_data = f;
-
-	kvm_get_kvm(kvm);
-	f->kvm = kvm;
-	xa_init(&f->bindings);
-	list_add(&f->entry, &GMEM_I(inode)->gmem_file_list);
-
 	fd_install(fd, file);
 	return fd;
 
 err_inode:
 	iput(inode);
-err_fops:
-	fops_put(&kvm_gmem_fops);
-err_gmem:
-	kfree(f);
 err_fd:
 	put_unused_fd(fd);
 	return err;
-- 
2.56.0.257.gf7497c7d27-goog

