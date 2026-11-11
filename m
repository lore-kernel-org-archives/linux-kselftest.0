Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383611;
	b=LejihMU7AxJmUAbYHNzdM4YifpTFsgP3zCkfM5DU5QXUcXKiegbiUGSg50ZA3bqf2c6g
	 oddj08B/+bsdbrRN6jlKrqmPUNKNOY0r7dIvaG+aja3CCTsU1rcUM8TS7qrXlA8CfhvPh
	 BUyaIdlUb1AxT58rT9NjyheM0Dbi4tAwOcPSaxrMFCc1BK9M6uUtj5xWf10ykFBN6DWag
	 i6rxu1m8Tb2hupXDFiQK0HBLlL7CjHimgBpT/2/ZnPqL4lCAlOjwoJTITMDllyAlbSc1d
	 lr9/8b+zYR4VlXYQGvIrr2AfNoNcAq17HXL+Xe3Jz5ndtxC4HKKt27UNKUyqHQoerhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
	b=Nx7RA4R2A+zqOhpX/1n5NTM7Z0NnQT/xcawxUvmdSi3J7b5RTAau54pW/4TNyMQgnFXL
	 DKz+RAsE7IihPVeOSNaEstxVxkk1OeripzEnjF+S0bI/JS6a20WpjuC//ZaPkfkxOzv/Z
	 /M6HfZHIsqSuq9t1oWLw25NPfNMVlJmKBdJgGWMoPqMInmpj5raXM7RqpXh14pOkVHJYC
	 Z72/DjEms8lcenfA/XkkVc0xMJRzrOgJdW70UawwxUUB4nHRMlUWTDOA9ECLdmu6dil8u
	 uq+fdxcTI5d5sRSPlXRX1v6bUcLnpbqdi0MBoXNT1WSCXgS2p7PK1FWbE9uy0ErHvJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dNqFAY6c;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A02606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A02606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dNqFAY6c
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so23231865e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383609; x=1794988409; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
        b=dNqFAY6cZ3CyL5eJVVr35UwikSopMOTqlFBpWR/MyFLq9799tN3W3BSglylopd0rYS
         RqKgJy15r+m3b5FB4xABsCe78mdqRMSgupv/nVYWHFL6rGAdW2OGZ6fdVNFTzRC5TePK
         qHrOSaRJcOxBCr4EMtMQRV+q3DlxSSIQJ4FMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383609; x=1794988409;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnMzGzAa5g0/2fGWNckudlYHrRY4wmAMpp2a4sY0JEw=;
        b=TSOBmeuNDF0tzMhYWUWxUSsFcTtRMGFBlVGogLSX8MrygWQS+xPzuXe7/6iuL+cyeX
         Q5FxzfiqBNAinI4zpDmxMM+b4M0Dxl89tvgriGEWt6FF2gDACCWGyu5zVUcKWyL8+1zA
         p9yVvTWCElahVb5GP5WuLeUmvqrSrJAtoQfehxHzxMLM7UJDus5KhVSmlEdWzD6zDO9d
         snQlys14tJ4lWMwM3Pdnryu5U4BcDOjignPufeJKGRLNZAt2/Z1K7uxyWhLDtNGeWPLU
         V6HDZX2ss475W69QvOC4Aj2QOd6qxtTl4D5K16+boz0ObcDqBdWa2C2O3ndLWWcG+N/b
         2jkA==
X-Forwarded-Encrypted: i=1; AL+hErFwuqlgcKXSNP4PuWZStYKfRFAU25b8ls4rQRmGGnrSKUk3wR5YG07zwGp93eRud7yv6CKlKyzUX1wqRsfQtHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z3Z3MsfVqKTX/AgAVYgEYuxjpFMUdkRAdN6jI+7CcJCuR9jYt
	/2bOJ96zuz/Lissu2sD2vTEfOP09ZeSZI7vzit2CM/3WENnmZ4gBm+v0ZKDxThfy+No=
X-Gm-Gg: AYBFou2M+/NrBopTwhJDmGVe61jLbrdD1g+nAGh4CAvYL+OYUwV+B5ZRrMoSZ1gXZ3j
	RGAPTw23zBYMP7vH+NTOCIaFeVlW8ObbsDc2+bpMTkHPvElIkUY97TrAErQcC9i6y/PTREN2mmn
	z7OVC3FLWS20urn1XYZVhTrMrM3wqJrogO9fRtaCa17vzhXklhRmjYj276Zo0yKhNyne+8/RGOq
	orxea5ui1eG5ZcOjHag7C1JSlItsjhWzpxooimJucfMJ27Ubad3+EcaOe3znEiGyiHTIyafLBJV
	S+ZzZ6CoGQ+5QQjTxgquUec12Qy8ra2KMUqvv9RR3FgHmNFhFqo/1jzGFZNEimE4IE4tVDrsN01
	uC97oyehzREkx6ShWz5UoStxzKmqE/dLCVvEzipTORtqIf/YgALTOPbp9VST+9PCuzOoFPWX0yv
	88QSwtLGXuzSoZVA1WEo9CgibSIRGlya+oQoXh5jQUxQARp1fViBtb751ecGedOWsMb4Q8u0bOl
	kgXCfnxjj9KmcJIym4Er46sNBDiG/Qy2/IsW7ZkN4bSRrXJXCslmyF3ypM6iTv5zwFRbcW4eqUM
	jJraNlNgqrtUS+PkDiZM6YPUGdn+QIfFvDXJi8vk7hmwcUcwmw3eQN7byOUnsJTF6PkeasSMQIf
	lgJ0Uf5ORxsvFaxQDYI4kiMvke2GGquOBf/X4AHr7qDupMjmUBYpYu1UyiRFtG8SU9BnQYFwy0R
	jYAYCnFiq7ObPWgLQRsrk1buhS8bOuOnjtgDx/0Nr4390SfEuBnG03
X-Received: by 2002:a05:600d:16:b0:4ba:4395:56c9 with SMTP id 5b1f17b1804b1-4ba439561a5mr11281775e9.26.1794383609006;
        Tue, 10 Nov 2026 23:53:29 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49842f2a1f9sm9790339f8f.15.2026.11.10.23.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:28 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:25 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 5/9] selftests/kho: Catch missing or zero bootmem reports
 before kexec
Message-ID: <2edf50f498070047a363420b890cb7ff0294b87b.1794383544.git.chris@chrisdown.name>
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

The KHO vmtest can pass even if the bootmem size is no longer visible to
userspace. Let's fail if /sys/kernel/kexec/kho_bootmem_size can't be
read or reports zero on the KHO-enabled boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/kho/init.c    | 24 ++++++++++++++++++++++++
 tools/testing/selftests/kho/vmtest.sh |  1 +
 2 files changed, 25 insertions(+)

diff --git a/tools/testing/selftests/kho/init.c b/tools/testing/selftests/kho/init.c
index 88a41b6eba95..ca9297d896d3 100644
--- a/tools/testing/selftests/kho/init.c
+++ b/tools/testing/selftests/kho/init.c
@@ -18,9 +18,30 @@ static int mount_filesystems(void)
 	if (mount("debugfs", "/debugfs", "debugfs", 0, NULL) < 0)
 		return -1;
 
+	if (mount("sysfs", "/sys", "sysfs", 0, NULL) < 0)
+		return -1;
+
 	return mount("proc", "/proc", "proc", 0, NULL);
 }
 
+static int check_bootmem_size(void)
+{
+	char buf[32];
+	ssize_t len;
+	int fd;
+
+	fd = open("/sys/kernel/kexec/kho_bootmem_size", O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	len = read(fd, buf, sizeof(buf));
+	close(fd);
+	if (len <= 0)
+		return -1;
+
+	return buf[0] == '0' ? -1 : 0;
+}
+
 static long kexec_file_load(int kernel_fd, int initrd_fd,
 			    unsigned long cmdline_len, const char *cmdline,
 			    unsigned long flags)
@@ -61,6 +82,9 @@ int main(int argc, char *argv[])
 	if (mount_filesystems())
 		goto err_reboot;
 
+	if (check_bootmem_size())
+		goto err_reboot;
+
 	if (kexec_load())
 		goto err_reboot;
 
diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
index 1e86ffcc3a79..e3e99cfe3ac1 100755
--- a/tools/testing/selftests/kho/vmtest.sh
+++ b/tools/testing/selftests/kho/vmtest.sh
@@ -95,6 +95,7 @@ function mkinitrd() {
 dir /dev 0755 0 0
 dir /proc 0755 0 0
 dir /debugfs 0755 0 0
+dir /sys 0755 0 0
 nod /dev/console 0600 0 0 c 5 1
 file /init $tmp_dir/init 0755 0 0
 file /kernel $kernel 0644 0 0
-- 
2.54.0

