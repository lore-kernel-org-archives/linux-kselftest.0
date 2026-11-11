Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383580;
	b=yXH7NnriaYC+1ZUub5vNqvieU9yQVGm8JA4DXp5Qaqp3wl1xkVqnuoN0pyCd4eQ531wr
	 bWgZaN6vgZcqe3EAsKu55UTlRn6hguctSDCNa3Q+buwuqxFms/7ry2Zlu3lKPK5Zh+nPW
	 zLP6KIyQp5YznYSAEcdbZ1YVBA789W86AJRfBS82Ehu7qghC0imYcHM+3odLcEY7pexS/
	 65jwTIx5/1rzxPiTKJM96oTOAb8GZHGZH3lLuCEy3QVbI9ldQEM6BzS1TGrNDCAagt1WX
	 lvOdszzMeludpKUXIU8rVqY4ytFbJetoI/DgodptwTkKmIVHN99cZxYY42zTWZx+8Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
	b=28jUTgrftK+lpWOiIk4ltZ3D3HY2r9KxwnYMWHf5Kyde5W4E+1BZSiWyWmQlRk1qTKTm
	 0e5zOvgVhKJqjqioaJSChWYzZ/J7AihZOh3viMoxm36pIyKivvkrtiZsV4aF983T/c3Hk
	 slYqdVwDtQGYROHnUTD2IT6agx7kfTydhL3cO+TDgB8qGNzANQa1Y8Ck9c51lKE7jtR+7
	 FKLCSXOxgk1Ud/S6+kUnti2nHxgXTqCDHJJrvIs1Ok/Jas9Z17Bdy5KlB3F7I9eEUWKpJ
	 tDqV66IrNKSv5XY0hcitsnJ4c1GU0cc0cYn6zVMb9zzTcv4Sd6y7Whoh9IpREHiE/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i5l4IQz0;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55EF606A33D
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55EF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i5l4IQz0
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so1828136b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383579; x=1794988379; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
        b=i5l4IQz0R+5YDpgXbhNWm7SdEua7y+JqwkVB9L2Qmr0CchldhP1OXMknep6mO2f5aT
         TKQYC1CHS27Oa93etO0nrex+1MU7CLFaI8gawX7do4mO46mRVW3Hw1yF+zh8bTnjZDmQ
         ageR2iK28RVfCgexgqgAShQZAdFw5WCopmSC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383579; x=1794988379;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
        b=0TAK4OCzjn7SsCEm+1DDCnjI6J58U4YcIX6fox4c3gu7jOBrrFvMg6BbYTuBlHAIbK
         iQQ8iharpM4rwfvyBEcjAGxhwjgdQm6FRkV5oRPOFcxNOkQTlLJuIhtkTD7HKWO4/Pvm
         cdizoNK85dUU/k9OHCsOIeeiK3/4MnfF44e0EhfMG+N893NRqc+1vbxp3+2Wu/ksy9aV
         BuwyyAQn3ZOrewi9q83Acw47BCHi6JkzELbwngazwCPHLiTPHlsNq18Da6oewhUo0yJ+
         7V82VXlHJ3BHpbOltm6RyBeE1Xxt9CWP7ZpdnxA2jBqAalOyaBCH4Q44dIPZUw/tHich
         bzEg==
X-Forwarded-Encrypted: i=1; AL+hErE8DfGLpVAtNY/zbfBo4m4KdAh3ouRXiM4B6rk1xch+tQJOD+N+fbnhZV3OvxoMUcjFGhf9UOQdRdtlX8bBLts=@vger.kernel.org
X-Gm-Message-State: APuU4Z/078jR5QWCBeHS+8ve7ZzdvYmabLWdEtmJBVGLdQBxOXZCuNyg
	yJ1wPHe6mTipR9tmK1x8YECRhUIipodIql4fyeHmxZdZsSrKWxwhv564nFvU2rF62yo=
X-Gm-Gg: AYBFou3twUChaeKmUBd7tTY8vfJGlMPpdgX82qGlRUgNaDZWZX8VcRDha6PFebdUguz
	3cK6XOuC02hVEfWLUD+UFJCcP5y6Ov34THKYJoRfm7KFVk8BS1XrbK0ELEecKjOyon2SGvVC8/m
	NsgNXWozedMPJJ4X1OneRLBNXoR0UdE7tkxp0M8LB54COEianarehclGMMo7XnuUV8CnnXelRIX
	EPsmGMekOVq7u/bLQ+QarU3P7Dinq8hnoqYic8kL7hhwtcSt4edfdgCZoRyQeDtVpVA7uoMAiNA
	ZXQ5S+ZHgSxjnsW9gwzcdloy6xX+4TU6oRBGAD79rueq/moEfmWL/siaKorx+lKGyh8T5jYmoCF
	V+n8An9tSMQCQC17L0e0pU1nItqJadajBR08TeBXx7INFFGcurAVaWbxd8ixnrpVSsnkeF4wIPQ
	k7xCoHtyPIsYkDDwwX3ASHnzfM6F8pxstkvq6k0mSFrkNforqd/aKG50V5wdRGK53W1T1x29WRe
	va14eeS/qujYollRz/Le/5qugJR6hWUu/nZPT9EkijMEU9Lunuh0plERJ2EZI9pNkgXvM97qhEq
	GgoqyDRRgS5CcXfulLkljOit2ycgQFWC0TCdQIBnuu3VhsccuYOjabeaLOtPpYyYFlWJfPVmbYA
	kxx2CQ9l4Z1Lkd6VGlVICahsjKJUjAsDU14rX1keTZtI4Y9p/mmKir/57qxcqQwemyaDzemHITP
	3GxkS39e+6ZQYAAfH4ny0NiVPvUYQvfD4wXMZn061XozOOVlZZC7kZ
X-Received: by 2002:a05:6a20:431a:b0:3e2:47ab:6a25 with SMTP id adf61e73a8af0-3f2fe3d4734mr1995928637.46.1794383579151;
        Tue, 10 Nov 2026 23:52:59 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86e030sm1861501b3a.27.2026.11.10.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:58 -0800 (PST)
Date: Tue, 10 Nov 2026 23:52:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>,
	Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/9] kho: Reclaim the metadata page left reserved after kexec
Message-ID: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

After a KHO kexec, the new kernel keeps the page holding the previous
kernel's kexec metadata reserved for as long as it runs. It only needs
the page once, since kho_in_kexec_metadata() copies the previous release
and the kexec count out of it at boot, and nothing reads it again.

Free it with kho_restore_free() once copying is complete.

Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/mm/kho.rst |  4 +++-
 kernel/liveupdate/kexec_handover.c   | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..f9d2cc5999ee 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -120,4 +120,6 @@ stabilized.
 
 ``/sys/kernel/debug/kho/in/sub_fdts/``
     Similar to ``kho/out/sub_fdts/``, but contains sub blobs
-    of KHO producers passed from the old kernel.
+    of KHO producers passed from the old kernel. A blob disappears
+    once the kernel has read and freed it, as ``kexec-metadata`` does
+    during boot.
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index eeec298aa9d6..3046b89e5db4 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1808,6 +1808,9 @@ static void __init kho_in_kexec_metadata(void)
 
 	pr_info("exec from: %s (count %u)\n",
 		kho_in.previous_release, kho_in.kexec_count);
+
+	kho_debugfs_blob_remove(&kho_in.dbg, metadata);
+	kho_restore_free(metadata);
 }
 
 /*
@@ -1885,14 +1888,15 @@ static __init int kho_init(void)
 	if (err)
 		goto err_free_fdt;
 
+	if (fdt)
+		kho_in_debugfs_init(&kho_in.dbg, fdt);
+
 	err = kho_kexec_metadata_init(fdt);
 	if (err)
 		goto err_free_fdt;
 
-	if (fdt) {
-		kho_in_debugfs_init(&kho_in.dbg, fdt);
+	if (fdt)
 		return 0;
-	}
 
 	for (int i = 0; i < kho_bootmem_cnt; i++) {
 		unsigned long base_pfn = PHYS_PFN(kho_bootmem[i].addr);
-- 
2.54.0

